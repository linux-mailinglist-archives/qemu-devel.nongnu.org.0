Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7167C9E6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:30:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LS-0002eI-TD; Thu, 26 Jan 2023 06:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LP-0002Ra-3L
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:03 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LM-0003r6-Di
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:02 -0500
Received: by mail-wr1-x436.google.com with SMTP id h12so1407013wrv.10
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gqyvp8b7/mZCX5heVRUZcFRztYQJr2E3Tb6sKWOaM6w=;
 b=aOg/3SeHniTfepkUFbJRzOMhiWFGeY5YjC8qWcT9D8O3gtBWYbdSksHC9zmUFm5EBF
 gBz2E26FJPliJKNmUalQGEaPpirlJw/gh7xlSAM6+GWMEpZq+5cP+G/OrEUkNBb0QEsZ
 xiWfvwZQPBm+lrmwnuvkzB3zqLDkd5ZPD5je//nNxqmPTLz4HojxHVvT/BixD6AgZZSo
 yH0Ts0UzRAa6CC6oDWT7lqmnB1JQD9wuLZ7ZnSCAKNxEDzCf7EtcdqTPlhDonXwP7snu
 cMH5kQwPoOlbCOFsr6n1E9ednX6+LAXqzHy8qNMFdO8jnPyxXqSCBdZ3P2xALvAcExE+
 I5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gqyvp8b7/mZCX5heVRUZcFRztYQJr2E3Tb6sKWOaM6w=;
 b=44VK/Gpe7Y8v9UkAb2m9R5tJRx3w6iYy+3n1lJ7WMYdmVShwH1FzJaqS+eNfX0TDIH
 hHVfFQxmTrlCg7NLuYFqv7ZjhGgTCTkyUZIPIQtglKNW7giHKRmXbqKO7EqtsAfULqY9
 ERH0rIwY5IiFGIYyR50iVudxD1y8NSRerXT7w3PmeAf6LQ7CW7Sh6Xh5b7E2fjsC+nmU
 wdvZznj2FKnCWI298uFmtnpUWz8y9tj+Bq62f5qUf7VuI31MHsGjuxOopHZjsPBoKXtc
 UZYvXDrgweQDgpYmS59WK/dV8BBC5ozdEdTk8VEygK1kOS73Rl5QBXN+mucBFd8s1bSd
 MH/A==
X-Gm-Message-State: AFqh2koa7yEhoygjG5w5+/gkON2+tYujRAAwylpSO8z6mvFQjimqskFn
 ScAgMK9VavA50JLeInigTzSW+g==
X-Google-Smtp-Source: AMrXdXs1ldD077sRa5tVXwLMS4zYOhzgkbkKpG6lKYZycJ9FZ0eStOXjq/gJhVgcWWju3aAAX1m9Cg==
X-Received: by 2002:a05:6000:1049:b0:2bb:ee8a:4282 with SMTP id
 c9-20020a056000104900b002bbee8a4282mr29950603wrx.34.1674732178612; 
 Thu, 26 Jan 2023 03:22:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a4-20020adffb84000000b002bc7f64efa3sm1004105wrr.29.2023.01.26.03.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D65641FFB7;
 Thu, 26 Jan 2023 11:22:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 12/35] lcitool: drop texinfo from QEMU project/dependencies
Date: Thu, 26 Jan 2023 11:22:27 +0000
Message-Id: <20230126112250.2584701-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230110132700.833690-9-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-13-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index f32f01a954..8934e5d57f 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 813c051616..65ce456c48 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
index 33bb4e1040..65b78fa08f 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -11,6 +11,6 @@ MAKE='/opt/homebrew/bin/gmake'
 NINJA='/opt/homebrew/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/opt/homebrew/bin/pip3'
-PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
 PYTHON='/opt/homebrew/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 3293c790c9..4a569d82f6 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -99,7 +99,6 @@ RUN apk update && \
         spice-protocol \
         tar \
         tesseract-ocr \
-        texinfo \
         usbredir-dev \
         util-linux \
         vde2-dev \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index f13745e6cc..fbc953c6dc 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -110,7 +110,6 @@ RUN dnf distro-sync -y && \
         systemd-devel \
         systemtap-sdt-devel \
         tar \
-        texinfo \
         usbredir-devel \
         util-linux \
         virglrenderer-devel \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index d0ace6d0f7..5175095a85 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng \
-                      texinfo && \
+                      tesseract-ocr-eng && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 0517c4c315..b61f664ea2 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -125,7 +125,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
-                      texinfo \
                       xfslibs-dev \
                       zlib1g-dev && \
     eatmydata apt-get autoremove -y && \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 9ac1c1ba3f..b69958c69f 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng \
-                      texinfo && \
+                      tesseract-ocr-eng && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index 8be492f4ad..96b524fab6 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng \
-                      texinfo && \
+                      tesseract-ocr-eng && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index da789e04af..08a75cebdb 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng \
-                      texinfo && \
+                      tesseract-ocr-eng && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 8b7c59c4f9..5930e6fa5d 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng \
-                      texinfo && \
+                      tesseract-ocr-eng && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index f9f1ed5fd2..c65d9830e7 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng \
-                      texinfo && \
+                      tesseract-ocr-eng && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index e423d88c2d..2ae56c978e 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng \
-                      texinfo && \
+                      tesseract-ocr-eng && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index c1134f4cec..0db86a0fcd 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng \
-                      texinfo && \
+                      tesseract-ocr-eng && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
index d3d4d3344e..6c73408b34 100644
--- a/tests/docker/dockerfiles/debian-toolchain.docker
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -21,7 +21,6 @@ RUN apt update && \
         libmpc-dev \
         libmpfr-dev \
         rsync \
-        texinfo \
         wget && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt build-dep -yy --arch-only gcc glibc
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index de811b332b..b659c0b8a8 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -57,7 +57,6 @@ exec "$@"' > /usr/bin/nosync && \
                tar \
                tesseract \
                tesseract-langpack-eng \
-               texinfo \
                util-linux \
                which && \
     nosync dnf autoremove -y && \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 71681d6f92..0a404c15bf 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -57,7 +57,6 @@ exec "$@"' > /usr/bin/nosync && \
                tar \
                tesseract \
                tesseract-langpack-eng \
-               texinfo \
                util-linux \
                which && \
     nosync dnf autoremove -y && \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index ca3793b04b..5d60a96141 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -121,7 +121,6 @@ exec "$@"' > /usr/bin/nosync && \
                tar \
                tesseract \
                tesseract-langpack-eng \
-               texinfo \
                usbredir-devel \
                util-linux \
                virglrenderer-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 680f49e7dc..4b2c02d6ab 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -111,7 +111,6 @@ RUN zypper update -y && \
            tar \
            tesseract-ocr \
            tesseract-ocr-traineddata-english \
-           texinfo \
            usbredir-devel \
            util-linux \
            virglrenderer-devel \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 6594bba338..13ab0b6887 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -124,7 +124,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
-                      texinfo \
                       xfslibs-dev \
                       zlib1g-dev && \
     eatmydata apt-get autoremove -y && \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index c2af92348a..6467bcf08a 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -109,7 +109,6 @@ packages:
  - tar
  - tesseract
  - tesseract-eng
- - texinfo
  - usbredir
  - virglrenderer
  - vte
-- 
2.34.1


