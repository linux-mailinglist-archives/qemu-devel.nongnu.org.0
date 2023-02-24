Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D881C6A2135
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:10:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVcVM-0005BK-TA; Fri, 24 Feb 2023 13:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVG-00056e-5f
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:06 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVB-0004sb-RY
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bw19so4167072wrb.13
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ANHfuSMn4snK43mAsAsIh/k1hw6kSe61QbX5WHSgis=;
 b=FaJ3WWv90mQ+PzJ+W4qTz7MiT28uf7SDrtIfJ8stMQP+cyRCSzM/daB4f+Ot30mfwi
 lASU38cZ5Se2etOk5kIftWCLs3jBgakAx4jxCxnh8vLFo6VtHmBa1U/fbVBXtZWHaO11
 kRUQjxKbdmAUqkgG/VTs3ir6Uhrr67mR1SyKH/vnIuD64j7+tSDF9FeRKw9JvMK8h1o3
 LJZsuXGQgAdBa4mxPl8JkWMPXnHmy8gQGzGL1Xj1i54H71EBAhUHwHExclwWqX7rQWJx
 dIubq3tbWg3t8MHfP7Lx74h2yCAKXK5lYOELAhzuKoXgietKBKj9qpLxD1uLP4x2JYqU
 lZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ANHfuSMn4snK43mAsAsIh/k1hw6kSe61QbX5WHSgis=;
 b=Uwom2Ot3H//e6LrFaHT/A3nHFyFcAC9Nyg4kZcYuJHIHZw5uaV7OxNu7N+Kztf+m0w
 xKqpND7lPFYtJxU2lOcW1cy3qsCLwlBbtR92XdvD1oVg0BSdb0UOXze3Z4W4/9F6qsvf
 tZJcWffzBt1he30MHTGO2zuNTDPvXQg2XVQcwCBP5Ld0fufpTTXCKfHBOxfHIKraRhNc
 X5ksOBR6IhPT/xbafG+D7c9fbTKIRPuNOWfTm4BYz6zUxMn1/biN42Azmws27AYtqlkG
 xR1Y1LEVIEPqGm4PfYxv4GSxwooIvPFBcBStEV2YTWIi5HKm47IHA9jIvMAk6ymkczfL
 6pww==
X-Gm-Message-State: AO0yUKVB09ea8uzUCg9e6UR1Ra0p/iVdw//mi8DUmIfBN9d6ZI61aGMn
 esv8wLwMAkIHiiru44CX7PPAYA==
X-Google-Smtp-Source: AK7set/HZVWKUS8IUG8WrnMNjJviXPyiT2nyhYwqSSUX/qf5NPKx0gYe50k3tK9d2uBDjOonV12W1Q==
X-Received: by 2002:adf:f6c5:0:b0:2c7:17b8:575b with SMTP id
 y5-20020adff6c5000000b002c717b8575bmr4070386wrp.46.1677262140147; 
 Fri, 24 Feb 2023 10:09:00 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d4e0e000000b002c5a790e959sm16196146wrt.19.2023.02.24.10.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:08:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D6591FFBB;
 Fri, 24 Feb 2023 18:08:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH 3/7] tests/lcitool: append user setting stanza to dockerfiles
Date: Fri, 24 Feb 2023 18:08:53 +0000
Message-Id: <20230224180857.1050220-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224180857.1050220-1-alex.bennee@linaro.org>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For the cross-compilation use-case it is important to add the host
user to the dockerfile so we can map them to the docker environment
when cross-building files.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars                   |  5 +++++
 .gitlab-ci.d/cirrus/freebsd-13.vars                   |  5 +++++
 .gitlab-ci.d/cirrus/macos-12.vars                     |  5 +++++
 tests/docker/dockerfiles/alpine.docker                |  5 +++++
 tests/docker/dockerfiles/centos8.docker               |  5 +++++
 tests/docker/dockerfiles/debian-amd64-cross.docker    |  5 +++++
 tests/docker/dockerfiles/debian-amd64.docker          |  5 +++++
 tests/docker/dockerfiles/debian-arm64-cross.docker    |  5 +++++
 tests/docker/dockerfiles/debian-armel-cross.docker    |  5 +++++
 tests/docker/dockerfiles/debian-armhf-cross.docker    |  5 +++++
 tests/docker/dockerfiles/debian-mips64el-cross.docker |  5 +++++
 tests/docker/dockerfiles/debian-mipsel-cross.docker   |  5 +++++
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  |  5 +++++
 tests/docker/dockerfiles/debian-s390x-cross.docker    |  5 +++++
 tests/docker/dockerfiles/fedora-win32-cross.docker    |  5 +++++
 tests/docker/dockerfiles/fedora-win64-cross.docker    |  5 +++++
 tests/docker/dockerfiles/fedora.docker                |  5 +++++
 tests/docker/dockerfiles/opensuse-leap.docker         |  5 +++++
 tests/docker/dockerfiles/ubuntu2004.docker            |  5 +++++
 tests/docker/dockerfiles/ubuntu2204.docker            |  5 +++++
 tests/lcitool/refresh                                 | 11 ++++++++++-
 21 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index 44d8a2a511..0bff53be44 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -14,3 +14,8 @@ PIP3='/usr/local/bin/pip-3.8'
 PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 7622c849b2..235d08a5ee 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -14,3 +14,8 @@ PIP3='/usr/local/bin/pip-3.8'
 PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
index da6aa6469b..599e210707 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -14,3 +14,8 @@ PIP3='/opt/homebrew/bin/pip3'
 PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy socat sparse spice-protocol tesseract usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
 PYTHON='/opt/homebrew/bin/python3'
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 56cf14e553..7b82dec8e5 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -124,3 +124,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 1291ae1b04..2cca33e730 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -134,3 +134,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 856db95100..50a2b34c62 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -169,3 +169,8 @@ ENV ABI "x86_64-linux-gnu"
 ENV MESON_OPTS "--cross-file=x86_64-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-linux-gnu-
 ENV DEF_TARGET_LIST x86_64-softmmu,x86_64-linux-user,i386-softmmu,i386-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index e3dba71ad5..d77e3d169a 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -155,3 +155,8 @@ RUN git clone https://github.com/luigirizzo/netmap.git /usr/src/netmap
 RUN cd /usr/src/netmap && git checkout v11.3
 RUN cd /usr/src/netmap/LINUX && ./configure --no-drivers --no-apps --kernel-dir=$(ls -d /usr/src/linux-headers-*-amd64) && make install
 ENV QEMU_CONFIGURE_OPTS --enable-netmap
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b00e9e9bcf..5288435da1 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -168,3 +168,8 @@ ENV ABI "aarch64-linux-gnu"
 ENV MESON_OPTS "--cross-file=aarch64-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
 ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index fb1129f256..95ce5bbfd0 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -167,3 +167,8 @@ ENV ABI "arm-linux-gnueabi"
 ENV MESON_OPTS "--cross-file=arm-linux-gnueabi"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabi-
 ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user,armeb-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 7a2b864a38..20f6074d5e 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -168,3 +168,8 @@ ENV ABI "arm-linux-gnueabihf"
 ENV MESON_OPTS "--cross-file=arm-linux-gnueabihf"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
 ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 5a3340e964..15f8568cb1 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -165,3 +165,8 @@ ENV ABI "mips64el-linux-gnuabi64"
 ENV MESON_OPTS "--cross-file=mips64el-linux-gnuabi64"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=mips64el-linux-gnuabi64-
 ENV DEF_TARGET_LIST mips64el-softmmu,mips64el-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 422fdebe8f..cc6a44dbe7 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -165,3 +165,8 @@ ENV ABI "mipsel-linux-gnu"
 ENV MESON_OPTS "--cross-file=mipsel-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=mipsel-linux-gnu-
 ENV DEF_TARGET_LIST mipsel-softmmu,mipsel-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 78d7ae6211..7ff1e44b88 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -167,3 +167,8 @@ ENV ABI "powerpc64le-linux-gnu"
 ENV MESON_OPTS "--cross-file=powerpc64le-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=powerpc64le-linux-gnu-
 ENV DEF_TARGET_LIST ppc64-softmmu,ppc64-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index d06ea3605a..d084f34cb1 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -166,3 +166,8 @@ ENV ABI "s390x-linux-gnu"
 ENV MESON_OPTS "--cross-file=s390x-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=s390x-linux-gnu-
 ENV DEF_TARGET_LIST s390x-softmmu,s390x-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 21ed1c6081..87d91a6759 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -100,3 +100,8 @@ ENV ABI "i686-w64-mingw32"
 ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw32.meson"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=i686-w64-mingw32-
 ENV DEF_TARGET_LIST i386-softmmu
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 95d30e7936..877766ec6b 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -100,3 +100,8 @@ ENV ABI "x86_64-w64-mingw32"
 ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw64.meson"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32-
 ENV DEF_TARGET_LIST x86_64-softmmu
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 8e06d080b8..4a7a986dfd 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -146,3 +146,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 568c1c979f..f5f8d4714d 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -137,3 +137,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 75233064de..4d257b922b 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -146,3 +146,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 30b9e56793..41c2d2878e 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -145,3 +145,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
\ No newline at end of file
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index cc9e34ac87..88bf33fb74 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -40,6 +40,15 @@ def atomic_write(filename, content):
         tmp.unlink()
         raise
 
+# Optional user setting, this will always be the last thing added
+# so maximise the number of layers that are cached
+add_user_mapping = [
+    "# As a final step configure the user (if env is defined)",
+    "ARG USER",
+    "ARG UID",
+    "RUN if [ \"${USER}\" ]; then \\",
+    "  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi"
+]
 
 def generate(filename, cmd, trailer):
     print("Generate %s" % filename)
@@ -51,9 +60,9 @@ def generate(filename, cmd, trailer):
     content = lcitool.stdout.decode("utf8")
     if trailer is not None:
         content += trailer
+    content += "\n".join(add_user_mapping)
     atomic_write(filename, content)
 
-
 def generate_dockerfile(host, target, cross=None, trailer=None):
     filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
     cmd = lcitool_cmd + ["dockerfile"]
-- 
2.39.1


