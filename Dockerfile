FROM ghcr.io/linuxserver/baseimage-alpine-nginx:3.12

ENV BASEURLPATH ${1:+1}

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --upgrade \
	curl \
	fail2ban \
	gnupg \
	memcached \
	nginx \
	nginx-mod-http-echo \
	nginx-mod-http-fancyindex \
	nginx-mod-http-geoip2 \
	nginx-mod-http-headers-more \
	nginx-mod-http-image-filter \
	nginx-mod-http-lua \
	nginx-mod-http-lua-upstream \
	nginx-mod-http-nchan \
	nginx-mod-http-perl \
	nginx-mod-http-redis2 \
	nginx-mod-http-set-misc \
	nginx-mod-http-upload-progress \
	nginx-mod-http-xslt-filter \
	nginx-mod-mail \
	nginx-mod-rtmp \
	nginx-mod-stream \
	nginx-mod-stream-geoip2 \
	nginx-vim \
	php7-bcmath \
	php7-bz2 \
	php7-ctype \
	php7-curl \
	php7-dom \
	php7-exif \
	php7-ftp \
	php7-gd \
	php7-iconv \
	php7-imap \
	php7-intl \
	php7-ldap \
	php7-mcrypt \
	php7-memcached \
	php7-mysqli \
	php7-mysqlnd \
	php7-opcache \
	php7-pdo_mysql \
	php7-pdo_odbc \
	php7-pdo_pgsql \
	php7-pdo_sqlite \
	php7-pear \
	php7-pecl-apcu \
	php7-pecl-redis \
	php7-pgsql \
	php7-phar \
	php7-posix \
	php7-soap \
	php7-sockets \
	php7-sodium \
	php7-sqlite3 \
	php7-tokenizer \
	php7-xml \
	php7-xmlreader \
	php7-xmlrpc \
	php7-xsl \
	php7-zip \
	whois && \
echo "**** Install simplesaml php ****" && \
 cd /var && \
 curl -o \
	/tmp/simplesamlphp.tar.gz -L \
	"https://simplesamlphp.org/download?latest" && \
 tar xvzf \
	/tmp/simplesamlphp.tar.gz -C \
	/var && \
 ln -s /var/simplesamlphp-* /var/simplesamlphp && \
echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/root/.cache

# add local files
COPY root/ /

# ports and volumes
EXPOSE 1280
VOLUME /config
