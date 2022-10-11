Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452CF5FB2DE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:07:15 +0200 (CEST)
Received: from localhost ([::1]:48994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEyY-0001Cv-BJ
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiDWm-0004fE-Na
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:34:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiDWh-0004LY-Qn
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:34:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id w18so21150046wro.7
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HofNsp2KPjquo1DMYg2asPHFI2YUTygoMa1LVe2L/LE=;
 b=QL3pnI4wHmwL4ANQXSuOwPxQNDey8GffZV2igFD9mbH3LdpcV8IFLJUEHdnYdRvlO8
 +5v7V9hlTy0aydx6mW10OUqUWX+I3LW9a5B0FLXCdhwHGVZDCvdyrLaJyAnWXNzs28Fd
 PunBGWi1aIwNGRHBaUElW99SIhPEb8glgQ+vP5Ivz2TLz8NsdrGQb+hJ0wFTqYhsIzRj
 SzYqO7qYJb/tR5e16XA3ksmuNECAVFRul+7o6U531hiirD7ILuLxdFP1ZDyhTlO7X4AA
 tVC39pkMU1PSrptz4GCqQ1zXSdtf4JutD4ZaJs5nAce651ZVfxCmGOYi3PfrJs9n52Bz
 UM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HofNsp2KPjquo1DMYg2asPHFI2YUTygoMa1LVe2L/LE=;
 b=XQTS08sCmNV4QHrej8WQ+55u31hKv/kQIH6TMEmsaYXkxCTMY/67O6b4LL2M65TM0c
 Q4nas/RKyPAKxc20RPYrgdKYyLBGoYnbvUsAxvK1ZQmC3ESPP3WYH1CBR4YXQNfIFl5x
 9udpTEqRQ1ZzptQzd+pTuEGbtb/6AtPpQHERi9O0FSd9/ihhOxHRwkf4hGAi6YzrFnRn
 KkfOEAr8Av8FF4TBjpFe4cEGgOJMWBQVhUeLnJESkEMABWA0LW5bXmWROqydOsjZWdhQ
 87q/WqyimFfYmOJ+bvzXnXQBwrNn16hjLVFesllhO47qxX/fqMwm6dqUZfTqkQn7jWyh
 mhxw==
X-Gm-Message-State: ACrzQf1QoHfUyQ7/Jk9umsH6EcHtr9uE57vAqC73u4e4mTJ53mq3NwOb
 EATPHka6U6BlkUhIs9l116EeuA==
X-Google-Smtp-Source: AMsMyM7hzmXBeFOefbutwMGFYfe/d0OOJS4Dxx2PhdF8+0gpjMwxRYX1mlMFkBlG+ZD+7aB4+McMdg==
X-Received: by 2002:a5d:5148:0:b0:22e:53bd:31c5 with SMTP id
 u8-20020a5d5148000000b0022e53bd31c5mr14349365wrt.241.1665488061291; 
 Tue, 11 Oct 2022 04:34:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d34-20020a05600c4c2200b003c6b874a0dfsm4941423wmp.14.2022.10.11.04.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 04:34:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 90D3F1FFB8;
 Tue, 11 Oct 2022 12:34:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 1/4] tests/docker: update fedora-win[32|64]-cross with
 lcitool
Date: Tue, 11 Oct 2022 12:34:14 +0100
Message-Id: <20221011113417.794841-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011113417.794841-1-alex.bennee@linaro.org>
References: <20221011113417.794841-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert another two dockerfiles to lcitool and update. I renamed the
helper because it is not Debian specific. We need an updated lcitool
for this to deal with the weirdness of a 32bit nsis tool for both 32
and 64 bit builds. As a result there are some minor whitespace and
re-order changes in a bunch of the docker files.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-10-alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/alpine.docker        |   2 +-
 tests/docker/dockerfiles/centos8.docker       |   2 +-
 .../dockerfiles/debian-amd64-cross.docker     | 234 ++++++++---------
 tests/docker/dockerfiles/debian-amd64.docker  | 236 +++++++++---------
 .../dockerfiles/debian-arm64-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-armel-cross.docker     | 230 ++++++++---------
 .../dockerfiles/debian-armhf-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-mips64el-cross.docker  | 226 ++++++++---------
 .../dockerfiles/debian-mipsel-cross.docker    | 226 ++++++++---------
 .../dockerfiles/debian-ppc64el-cross.docker   | 230 ++++++++---------
 .../dockerfiles/debian-s390x-cross.docker     | 228 ++++++++---------
 .../dockerfiles/fedora-win32-cross.docker     | 139 ++++++++---
 .../dockerfiles/fedora-win64-cross.docker     | 138 +++++++---
 tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
 tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
 tests/docker/dockerfiles/ubuntu2004.docker    | 234 ++++++++---------
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  48 ++--
 18 files changed, 1499 insertions(+), 1372 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 9b7541261a..a854ae6b78 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -119,8 +119,8 @@ RUN apk update && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index d89113c0df..1f70d41aeb 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -130,8 +130,8 @@ RUN dnf distro-sync -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 9047759e76..8311024632 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -11,62 +11,62 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get install -y eatmydata && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bison \
-            bsdextrautils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            flex \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            hostname \
-            libglib2.0-dev \
-            libpcre2-dev \
-            libspice-protocol-dev \
-            llvm \
-            locales \
-            make \
-            meson \
-            ncat \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo && \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      perl-base \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      texinfo && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
     dpkg-reconfigure locales
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     dpkg --add-architecture amd64 && \
@@ -74,76 +74,76 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
     eatmydata apt-get install --no-install-recommends -y \
-            g++-x86-64-linux-gnu \
-            gcc-x86-64-linux-gnu \
-            libaio-dev:amd64 \
-            libasan5:amd64 \
-            libasound2-dev:amd64 \
-            libattr1-dev:amd64 \
-            libbpf-dev:amd64 \
-            libbrlapi-dev:amd64 \
-            libbz2-dev:amd64 \
-            libc6-dev:amd64 \
-            libcacard-dev:amd64 \
-            libcap-ng-dev:amd64 \
-            libcapstone-dev:amd64 \
-            libcmocka-dev:amd64 \
-            libcurl4-gnutls-dev:amd64 \
-            libdaxctl-dev:amd64 \
-            libdrm-dev:amd64 \
-            libepoxy-dev:amd64 \
-            libfdt-dev:amd64 \
-            libffi-dev:amd64 \
-            libfuse3-dev:amd64 \
-            libgbm-dev:amd64 \
-            libgcrypt20-dev:amd64 \
-            libglib2.0-dev:amd64 \
-            libglusterfs-dev:amd64 \
-            libgnutls28-dev:amd64 \
-            libgtk-3-dev:amd64 \
-            libibumad-dev:amd64 \
-            libibverbs-dev:amd64 \
-            libiscsi-dev:amd64 \
-            libjemalloc-dev:amd64 \
-            libjpeg62-turbo-dev:amd64 \
-            libjson-c-dev:amd64 \
-            liblttng-ust-dev:amd64 \
-            liblzo2-dev:amd64 \
-            libncursesw5-dev:amd64 \
-            libnfs-dev:amd64 \
-            libnuma-dev:amd64 \
-            libpam0g-dev:amd64 \
-            libpixman-1-dev:amd64 \
-            libpmem-dev:amd64 \
-            libpng-dev:amd64 \
-            libpulse-dev:amd64 \
-            librbd-dev:amd64 \
-            librdmacm-dev:amd64 \
-            libsasl2-dev:amd64 \
-            libsdl2-dev:amd64 \
-            libsdl2-image-dev:amd64 \
-            libseccomp-dev:amd64 \
-            libselinux1-dev:amd64 \
-            libslirp-dev:amd64 \
-            libsnappy-dev:amd64 \
-            libspice-server-dev:amd64 \
-            libssh-gcrypt-dev:amd64 \
-            libsystemd-dev:amd64 \
-            libtasn1-6-dev:amd64 \
-            libubsan1:amd64 \
-            libudev-dev:amd64 \
-            liburing-dev:amd64 \
-            libusb-1.0-0-dev:amd64 \
-            libusbredirhost-dev:amd64 \
-            libvdeplug-dev:amd64 \
-            libvirglrenderer-dev:amd64 \
-            libvte-2.91-dev:amd64 \
-            libxen-dev:amd64 \
-            libzstd-dev:amd64 \
-            nettle-dev:amd64 \
-            systemtap-sdt-dev:amd64 \
-            xfslibs-dev:amd64 \
-            zlib1g-dev:amd64 && \
+                      g++-x86-64-linux-gnu \
+                      gcc-x86-64-linux-gnu \
+                      libaio-dev:amd64 \
+                      libasan5:amd64 \
+                      libasound2-dev:amd64 \
+                      libattr1-dev:amd64 \
+                      libbpf-dev:amd64 \
+                      libbrlapi-dev:amd64 \
+                      libbz2-dev:amd64 \
+                      libc6-dev:amd64 \
+                      libcacard-dev:amd64 \
+                      libcap-ng-dev:amd64 \
+                      libcapstone-dev:amd64 \
+                      libcmocka-dev:amd64 \
+                      libcurl4-gnutls-dev:amd64 \
+                      libdaxctl-dev:amd64 \
+                      libdrm-dev:amd64 \
+                      libepoxy-dev:amd64 \
+                      libfdt-dev:amd64 \
+                      libffi-dev:amd64 \
+                      libfuse3-dev:amd64 \
+                      libgbm-dev:amd64 \
+                      libgcrypt20-dev:amd64 \
+                      libglib2.0-dev:amd64 \
+                      libglusterfs-dev:amd64 \
+                      libgnutls28-dev:amd64 \
+                      libgtk-3-dev:amd64 \
+                      libibumad-dev:amd64 \
+                      libibverbs-dev:amd64 \
+                      libiscsi-dev:amd64 \
+                      libjemalloc-dev:amd64 \
+                      libjpeg62-turbo-dev:amd64 \
+                      libjson-c-dev:amd64 \
+                      liblttng-ust-dev:amd64 \
+                      liblzo2-dev:amd64 \
+                      libncursesw5-dev:amd64 \
+                      libnfs-dev:amd64 \
+                      libnuma-dev:amd64 \
+                      libpam0g-dev:amd64 \
+                      libpixman-1-dev:amd64 \
+                      libpmem-dev:amd64 \
+                      libpng-dev:amd64 \
+                      libpulse-dev:amd64 \
+                      librbd-dev:amd64 \
+                      librdmacm-dev:amd64 \
+                      libsasl2-dev:amd64 \
+                      libsdl2-dev:amd64 \
+                      libsdl2-image-dev:amd64 \
+                      libseccomp-dev:amd64 \
+                      libselinux1-dev:amd64 \
+                      libslirp-dev:amd64 \
+                      libsnappy-dev:amd64 \
+                      libspice-server-dev:amd64 \
+                      libssh-gcrypt-dev:amd64 \
+                      libsystemd-dev:amd64 \
+                      libtasn1-6-dev:amd64 \
+                      libubsan1:amd64 \
+                      libudev-dev:amd64 \
+                      liburing-dev:amd64 \
+                      libusb-1.0-0-dev:amd64 \
+                      libusbredirhost-dev:amd64 \
+                      libvdeplug-dev:amd64 \
+                      libvirglrenderer-dev:amd64 \
+                      libvte-2.91-dev:amd64 \
+                      libxen-dev:amd64 \
+                      libzstd-dev:amd64 \
+                      nettle-dev:amd64 \
+                      systemtap-sdt-dev:amd64 \
+                      xfslibs-dev:amd64 \
+                      zlib1g-dev:amd64 && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index a8b728ca64..6db3079321 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -11,123 +11,123 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get install -y eatmydata && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bison \
-            bsdextrautils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            clang \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            flex \
-            g++ \
-            gcc \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            hostname \
-            libaio-dev \
-            libasan5 \
-            libasound2-dev \
-            libattr1-dev \
-            libbpf-dev \
-            libbrlapi-dev \
-            libbz2-dev \
-            libc6-dev \
-            libcacard-dev \
-            libcap-ng-dev \
-            libcapstone-dev \
-            libcmocka-dev \
-            libcurl4-gnutls-dev \
-            libdaxctl-dev \
-            libdrm-dev \
-            libepoxy-dev \
-            libfdt-dev \
-            libffi-dev \
-            libfuse3-dev \
-            libgbm-dev \
-            libgcrypt20-dev \
-            libglib2.0-dev \
-            libglusterfs-dev \
-            libgnutls28-dev \
-            libgtk-3-dev \
-            libibumad-dev \
-            libibverbs-dev \
-            libiscsi-dev \
-            libjemalloc-dev \
-            libjpeg62-turbo-dev \
-            libjson-c-dev \
-            liblttng-ust-dev \
-            liblzo2-dev \
-            libncursesw5-dev \
-            libnfs-dev \
-            libnuma-dev \
-            libpam0g-dev \
-            libpcre2-dev \
-            libpixman-1-dev \
-            libpmem-dev \
-            libpng-dev \
-            libpulse-dev \
-            librbd-dev \
-            librdmacm-dev \
-            libsasl2-dev \
-            libsdl2-dev \
-            libsdl2-image-dev \
-            libseccomp-dev \
-            libselinux1-dev \
-            libslirp-dev \
-            libsnappy-dev \
-            libspice-protocol-dev \
-            libspice-server-dev \
-            libssh-gcrypt-dev \
-            libsystemd-dev \
-            libtasn1-6-dev \
-            libubsan1 \
-            libudev-dev \
-            liburing-dev \
-            libusb-1.0-0-dev \
-            libusbredirhost-dev \
-            libvdeplug-dev \
-            libvirglrenderer-dev \
-            libvte-2.91-dev \
-            libxen-dev \
-            libzstd-dev \
-            llvm \
-            locales \
-            make \
-            meson \
-            multipath-tools \
-            ncat \
-            nettle-dev \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            systemtap-sdt-dev \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo \
-            xfslibs-dev \
-            zlib1g-dev && \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      clang \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      g++ \
+                      gcc \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libaio-dev \
+                      libasan5 \
+                      libasound2-dev \
+                      libattr1-dev \
+                      libbpf-dev \
+                      libbrlapi-dev \
+                      libbz2-dev \
+                      libc6-dev \
+                      libcacard-dev \
+                      libcap-ng-dev \
+                      libcapstone-dev \
+                      libcmocka-dev \
+                      libcurl4-gnutls-dev \
+                      libdaxctl-dev \
+                      libdrm-dev \
+                      libepoxy-dev \
+                      libfdt-dev \
+                      libffi-dev \
+                      libfuse3-dev \
+                      libgbm-dev \
+                      libgcrypt20-dev \
+                      libglib2.0-dev \
+                      libglusterfs-dev \
+                      libgnutls28-dev \
+                      libgtk-3-dev \
+                      libibumad-dev \
+                      libibverbs-dev \
+                      libiscsi-dev \
+                      libjemalloc-dev \
+                      libjpeg62-turbo-dev \
+                      libjson-c-dev \
+                      liblttng-ust-dev \
+                      liblzo2-dev \
+                      libncursesw5-dev \
+                      libnfs-dev \
+                      libnuma-dev \
+                      libpam0g-dev \
+                      libpcre2-dev \
+                      libpixman-1-dev \
+                      libpmem-dev \
+                      libpng-dev \
+                      libpulse-dev \
+                      librbd-dev \
+                      librdmacm-dev \
+                      libsasl2-dev \
+                      libsdl2-dev \
+                      libsdl2-image-dev \
+                      libseccomp-dev \
+                      libselinux1-dev \
+                      libslirp-dev \
+                      libsnappy-dev \
+                      libspice-protocol-dev \
+                      libspice-server-dev \
+                      libssh-gcrypt-dev \
+                      libsystemd-dev \
+                      libtasn1-6-dev \
+                      libubsan1 \
+                      libudev-dev \
+                      liburing-dev \
+                      libusb-1.0-0-dev \
+                      libusbredirhost-dev \
+                      libvdeplug-dev \
+                      libvirglrenderer-dev \
+                      libvte-2.91-dev \
+                      libxen-dev \
+                      libzstd-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      multipath-tools \
+                      ncat \
+                      nettle-dev \
+                      ninja-build \
+                      openssh-client \
+                      perl-base \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      sparse \
+                      systemtap-sdt-dev \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      texinfo \
+                      xfslibs-dev \
+                      zlib1g-dev && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
@@ -140,11 +140,11 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 # netmap/cscope/global
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
   apt install -y --no-install-recommends \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 17a5709245..1fbe2b1376 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -11,62 +11,62 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get install -y eatmydata && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bison \
-            bsdextrautils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            flex \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            hostname \
-            libglib2.0-dev \
-            libpcre2-dev \
-            libspice-protocol-dev \
-            llvm \
-            locales \
-            make \
-            meson \
-            ncat \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo && \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      perl-base \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      texinfo && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
     dpkg-reconfigure locales
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     dpkg --add-architecture arm64 && \
@@ -74,75 +74,75 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
     eatmydata apt-get install --no-install-recommends -y \
-            g++-aarch64-linux-gnu \
-            gcc-aarch64-linux-gnu \
-            libaio-dev:arm64 \
-            libasan5:arm64 \
-            libasound2-dev:arm64 \
-            libattr1-dev:arm64 \
-            libbpf-dev:arm64 \
-            libbrlapi-dev:arm64 \
-            libbz2-dev:arm64 \
-            libc6-dev:arm64 \
-            libcacard-dev:arm64 \
-            libcap-ng-dev:arm64 \
-            libcapstone-dev:arm64 \
-            libcmocka-dev:arm64 \
-            libcurl4-gnutls-dev:arm64 \
-            libdaxctl-dev:arm64 \
-            libdrm-dev:arm64 \
-            libepoxy-dev:arm64 \
-            libfdt-dev:arm64 \
-            libffi-dev:arm64 \
-            libfuse3-dev:arm64 \
-            libgbm-dev:arm64 \
-            libgcrypt20-dev:arm64 \
-            libglib2.0-dev:arm64 \
-            libglusterfs-dev:arm64 \
-            libgnutls28-dev:arm64 \
-            libgtk-3-dev:arm64 \
-            libibumad-dev:arm64 \
-            libibverbs-dev:arm64 \
-            libiscsi-dev:arm64 \
-            libjemalloc-dev:arm64 \
-            libjpeg62-turbo-dev:arm64 \
-            libjson-c-dev:arm64 \
-            liblttng-ust-dev:arm64 \
-            liblzo2-dev:arm64 \
-            libncursesw5-dev:arm64 \
-            libnfs-dev:arm64 \
-            libnuma-dev:arm64 \
-            libpam0g-dev:arm64 \
-            libpixman-1-dev:arm64 \
-            libpng-dev:arm64 \
-            libpulse-dev:arm64 \
-            librbd-dev:arm64 \
-            librdmacm-dev:arm64 \
-            libsasl2-dev:arm64 \
-            libsdl2-dev:arm64 \
-            libsdl2-image-dev:arm64 \
-            libseccomp-dev:arm64 \
-            libselinux1-dev:arm64 \
-            libslirp-dev:arm64 \
-            libsnappy-dev:arm64 \
-            libspice-server-dev:arm64 \
-            libssh-gcrypt-dev:arm64 \
-            libsystemd-dev:arm64 \
-            libtasn1-6-dev:arm64 \
-            libubsan1:arm64 \
-            libudev-dev:arm64 \
-            liburing-dev:arm64 \
-            libusb-1.0-0-dev:arm64 \
-            libusbredirhost-dev:arm64 \
-            libvdeplug-dev:arm64 \
-            libvirglrenderer-dev:arm64 \
-            libvte-2.91-dev:arm64 \
-            libxen-dev:arm64 \
-            libzstd-dev:arm64 \
-            nettle-dev:arm64 \
-            systemtap-sdt-dev:arm64 \
-            xfslibs-dev:arm64 \
-            zlib1g-dev:arm64 && \
+                      g++-aarch64-linux-gnu \
+                      gcc-aarch64-linux-gnu \
+                      libaio-dev:arm64 \
+                      libasan5:arm64 \
+                      libasound2-dev:arm64 \
+                      libattr1-dev:arm64 \
+                      libbpf-dev:arm64 \
+                      libbrlapi-dev:arm64 \
+                      libbz2-dev:arm64 \
+                      libc6-dev:arm64 \
+                      libcacard-dev:arm64 \
+                      libcap-ng-dev:arm64 \
+                      libcapstone-dev:arm64 \
+                      libcmocka-dev:arm64 \
+                      libcurl4-gnutls-dev:arm64 \
+                      libdaxctl-dev:arm64 \
+                      libdrm-dev:arm64 \
+                      libepoxy-dev:arm64 \
+                      libfdt-dev:arm64 \
+                      libffi-dev:arm64 \
+                      libfuse3-dev:arm64 \
+                      libgbm-dev:arm64 \
+                      libgcrypt20-dev:arm64 \
+                      libglib2.0-dev:arm64 \
+                      libglusterfs-dev:arm64 \
+                      libgnutls28-dev:arm64 \
+                      libgtk-3-dev:arm64 \
+                      libibumad-dev:arm64 \
+                      libibverbs-dev:arm64 \
+                      libiscsi-dev:arm64 \
+                      libjemalloc-dev:arm64 \
+                      libjpeg62-turbo-dev:arm64 \
+                      libjson-c-dev:arm64 \
+                      liblttng-ust-dev:arm64 \
+                      liblzo2-dev:arm64 \
+                      libncursesw5-dev:arm64 \
+                      libnfs-dev:arm64 \
+                      libnuma-dev:arm64 \
+                      libpam0g-dev:arm64 \
+                      libpixman-1-dev:arm64 \
+                      libpng-dev:arm64 \
+                      libpulse-dev:arm64 \
+                      librbd-dev:arm64 \
+                      librdmacm-dev:arm64 \
+                      libsasl2-dev:arm64 \
+                      libsdl2-dev:arm64 \
+                      libsdl2-image-dev:arm64 \
+                      libseccomp-dev:arm64 \
+                      libselinux1-dev:arm64 \
+                      libslirp-dev:arm64 \
+                      libsnappy-dev:arm64 \
+                      libspice-server-dev:arm64 \
+                      libssh-gcrypt-dev:arm64 \
+                      libsystemd-dev:arm64 \
+                      libtasn1-6-dev:arm64 \
+                      libubsan1:arm64 \
+                      libudev-dev:arm64 \
+                      liburing-dev:arm64 \
+                      libusb-1.0-0-dev:arm64 \
+                      libusbredirhost-dev:arm64 \
+                      libvdeplug-dev:arm64 \
+                      libvirglrenderer-dev:arm64 \
+                      libvte-2.91-dev:arm64 \
+                      libxen-dev:arm64 \
+                      libzstd-dev:arm64 \
+                      nettle-dev:arm64 \
+                      systemtap-sdt-dev:arm64 \
+                      xfslibs-dev:arm64 \
+                      zlib1g-dev:arm64 && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index 701fc70db0..a430900505 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -11,62 +11,62 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get install -y eatmydata && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bison \
-            bsdextrautils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            flex \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            hostname \
-            libglib2.0-dev \
-            libpcre2-dev \
-            libspice-protocol-dev \
-            llvm \
-            locales \
-            make \
-            meson \
-            ncat \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo && \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      perl-base \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      texinfo && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
     dpkg-reconfigure locales
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     dpkg --add-architecture armel && \
@@ -74,74 +74,74 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
     eatmydata apt-get install --no-install-recommends -y \
-            g++-arm-linux-gnueabi \
-            gcc-arm-linux-gnueabi \
-            libaio-dev:armel \
-            libasan5:armel \
-            libasound2-dev:armel \
-            libattr1-dev:armel \
-            libbpf-dev:armel \
-            libbrlapi-dev:armel \
-            libbz2-dev:armel \
-            libc6-dev:armel \
-            libcacard-dev:armel \
-            libcap-ng-dev:armel \
-            libcapstone-dev:armel \
-            libcmocka-dev:armel \
-            libcurl4-gnutls-dev:armel \
-            libdaxctl-dev:armel \
-            libdrm-dev:armel \
-            libepoxy-dev:armel \
-            libfdt-dev:armel \
-            libffi-dev:armel \
-            libfuse3-dev:armel \
-            libgbm-dev:armel \
-            libgcrypt20-dev:armel \
-            libglib2.0-dev:armel \
-            libglusterfs-dev:armel \
-            libgnutls28-dev:armel \
-            libgtk-3-dev:armel \
-            libibumad-dev:armel \
-            libibverbs-dev:armel \
-            libiscsi-dev:armel \
-            libjemalloc-dev:armel \
-            libjpeg62-turbo-dev:armel \
-            libjson-c-dev:armel \
-            liblttng-ust-dev:armel \
-            liblzo2-dev:armel \
-            libncursesw5-dev:armel \
-            libnfs-dev:armel \
-            libnuma-dev:armel \
-            libpam0g-dev:armel \
-            libpixman-1-dev:armel \
-            libpng-dev:armel \
-            libpulse-dev:armel \
-            librbd-dev:armel \
-            librdmacm-dev:armel \
-            libsasl2-dev:armel \
-            libsdl2-dev:armel \
-            libsdl2-image-dev:armel \
-            libseccomp-dev:armel \
-            libselinux1-dev:armel \
-            libslirp-dev:armel \
-            libsnappy-dev:armel \
-            libspice-server-dev:armel \
-            libssh-gcrypt-dev:armel \
-            libsystemd-dev:armel \
-            libtasn1-6-dev:armel \
-            libubsan1:armel \
-            libudev-dev:armel \
-            liburing-dev:armel \
-            libusb-1.0-0-dev:armel \
-            libusbredirhost-dev:armel \
-            libvdeplug-dev:armel \
-            libvirglrenderer-dev:armel \
-            libvte-2.91-dev:armel \
-            libzstd-dev:armel \
-            nettle-dev:armel \
-            systemtap-sdt-dev:armel \
-            xfslibs-dev:armel \
-            zlib1g-dev:armel && \
+                      g++-arm-linux-gnueabi \
+                      gcc-arm-linux-gnueabi \
+                      libaio-dev:armel \
+                      libasan5:armel \
+                      libasound2-dev:armel \
+                      libattr1-dev:armel \
+                      libbpf-dev:armel \
+                      libbrlapi-dev:armel \
+                      libbz2-dev:armel \
+                      libc6-dev:armel \
+                      libcacard-dev:armel \
+                      libcap-ng-dev:armel \
+                      libcapstone-dev:armel \
+                      libcmocka-dev:armel \
+                      libcurl4-gnutls-dev:armel \
+                      libdaxctl-dev:armel \
+                      libdrm-dev:armel \
+                      libepoxy-dev:armel \
+                      libfdt-dev:armel \
+                      libffi-dev:armel \
+                      libfuse3-dev:armel \
+                      libgbm-dev:armel \
+                      libgcrypt20-dev:armel \
+                      libglib2.0-dev:armel \
+                      libglusterfs-dev:armel \
+                      libgnutls28-dev:armel \
+                      libgtk-3-dev:armel \
+                      libibumad-dev:armel \
+                      libibverbs-dev:armel \
+                      libiscsi-dev:armel \
+                      libjemalloc-dev:armel \
+                      libjpeg62-turbo-dev:armel \
+                      libjson-c-dev:armel \
+                      liblttng-ust-dev:armel \
+                      liblzo2-dev:armel \
+                      libncursesw5-dev:armel \
+                      libnfs-dev:armel \
+                      libnuma-dev:armel \
+                      libpam0g-dev:armel \
+                      libpixman-1-dev:armel \
+                      libpng-dev:armel \
+                      libpulse-dev:armel \
+                      librbd-dev:armel \
+                      librdmacm-dev:armel \
+                      libsasl2-dev:armel \
+                      libsdl2-dev:armel \
+                      libsdl2-image-dev:armel \
+                      libseccomp-dev:armel \
+                      libselinux1-dev:armel \
+                      libslirp-dev:armel \
+                      libsnappy-dev:armel \
+                      libspice-server-dev:armel \
+                      libssh-gcrypt-dev:armel \
+                      libsystemd-dev:armel \
+                      libtasn1-6-dev:armel \
+                      libubsan1:armel \
+                      libudev-dev:armel \
+                      liburing-dev:armel \
+                      libusb-1.0-0-dev:armel \
+                      libusbredirhost-dev:armel \
+                      libvdeplug-dev:armel \
+                      libvirglrenderer-dev:armel \
+                      libvte-2.91-dev:armel \
+                      libzstd-dev:armel \
+                      nettle-dev:armel \
+                      systemtap-sdt-dev:armel \
+                      xfslibs-dev:armel \
+                      zlib1g-dev:armel && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 5a11fe3900..4c54898420 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -11,62 +11,62 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get install -y eatmydata && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bison \
-            bsdextrautils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            flex \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            hostname \
-            libglib2.0-dev \
-            libpcre2-dev \
-            libspice-protocol-dev \
-            llvm \
-            locales \
-            make \
-            meson \
-            ncat \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo && \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      perl-base \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      texinfo && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
     dpkg-reconfigure locales
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     dpkg --add-architecture armhf && \
@@ -74,75 +74,75 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
     eatmydata apt-get install --no-install-recommends -y \
-            g++-arm-linux-gnueabihf \
-            gcc-arm-linux-gnueabihf \
-            libaio-dev:armhf \
-            libasan5:armhf \
-            libasound2-dev:armhf \
-            libattr1-dev:armhf \
-            libbpf-dev:armhf \
-            libbrlapi-dev:armhf \
-            libbz2-dev:armhf \
-            libc6-dev:armhf \
-            libcacard-dev:armhf \
-            libcap-ng-dev:armhf \
-            libcapstone-dev:armhf \
-            libcmocka-dev:armhf \
-            libcurl4-gnutls-dev:armhf \
-            libdaxctl-dev:armhf \
-            libdrm-dev:armhf \
-            libepoxy-dev:armhf \
-            libfdt-dev:armhf \
-            libffi-dev:armhf \
-            libfuse3-dev:armhf \
-            libgbm-dev:armhf \
-            libgcrypt20-dev:armhf \
-            libglib2.0-dev:armhf \
-            libglusterfs-dev:armhf \
-            libgnutls28-dev:armhf \
-            libgtk-3-dev:armhf \
-            libibumad-dev:armhf \
-            libibverbs-dev:armhf \
-            libiscsi-dev:armhf \
-            libjemalloc-dev:armhf \
-            libjpeg62-turbo-dev:armhf \
-            libjson-c-dev:armhf \
-            liblttng-ust-dev:armhf \
-            liblzo2-dev:armhf \
-            libncursesw5-dev:armhf \
-            libnfs-dev:armhf \
-            libnuma-dev:armhf \
-            libpam0g-dev:armhf \
-            libpixman-1-dev:armhf \
-            libpng-dev:armhf \
-            libpulse-dev:armhf \
-            librbd-dev:armhf \
-            librdmacm-dev:armhf \
-            libsasl2-dev:armhf \
-            libsdl2-dev:armhf \
-            libsdl2-image-dev:armhf \
-            libseccomp-dev:armhf \
-            libselinux1-dev:armhf \
-            libslirp-dev:armhf \
-            libsnappy-dev:armhf \
-            libspice-server-dev:armhf \
-            libssh-gcrypt-dev:armhf \
-            libsystemd-dev:armhf \
-            libtasn1-6-dev:armhf \
-            libubsan1:armhf \
-            libudev-dev:armhf \
-            liburing-dev:armhf \
-            libusb-1.0-0-dev:armhf \
-            libusbredirhost-dev:armhf \
-            libvdeplug-dev:armhf \
-            libvirglrenderer-dev:armhf \
-            libvte-2.91-dev:armhf \
-            libxen-dev:armhf \
-            libzstd-dev:armhf \
-            nettle-dev:armhf \
-            systemtap-sdt-dev:armhf \
-            xfslibs-dev:armhf \
-            zlib1g-dev:armhf && \
+                      g++-arm-linux-gnueabihf \
+                      gcc-arm-linux-gnueabihf \
+                      libaio-dev:armhf \
+                      libasan5:armhf \
+                      libasound2-dev:armhf \
+                      libattr1-dev:armhf \
+                      libbpf-dev:armhf \
+                      libbrlapi-dev:armhf \
+                      libbz2-dev:armhf \
+                      libc6-dev:armhf \
+                      libcacard-dev:armhf \
+                      libcap-ng-dev:armhf \
+                      libcapstone-dev:armhf \
+                      libcmocka-dev:armhf \
+                      libcurl4-gnutls-dev:armhf \
+                      libdaxctl-dev:armhf \
+                      libdrm-dev:armhf \
+                      libepoxy-dev:armhf \
+                      libfdt-dev:armhf \
+                      libffi-dev:armhf \
+                      libfuse3-dev:armhf \
+                      libgbm-dev:armhf \
+                      libgcrypt20-dev:armhf \
+                      libglib2.0-dev:armhf \
+                      libglusterfs-dev:armhf \
+                      libgnutls28-dev:armhf \
+                      libgtk-3-dev:armhf \
+                      libibumad-dev:armhf \
+                      libibverbs-dev:armhf \
+                      libiscsi-dev:armhf \
+                      libjemalloc-dev:armhf \
+                      libjpeg62-turbo-dev:armhf \
+                      libjson-c-dev:armhf \
+                      liblttng-ust-dev:armhf \
+                      liblzo2-dev:armhf \
+                      libncursesw5-dev:armhf \
+                      libnfs-dev:armhf \
+                      libnuma-dev:armhf \
+                      libpam0g-dev:armhf \
+                      libpixman-1-dev:armhf \
+                      libpng-dev:armhf \
+                      libpulse-dev:armhf \
+                      librbd-dev:armhf \
+                      librdmacm-dev:armhf \
+                      libsasl2-dev:armhf \
+                      libsdl2-dev:armhf \
+                      libsdl2-image-dev:armhf \
+                      libseccomp-dev:armhf \
+                      libselinux1-dev:armhf \
+                      libslirp-dev:armhf \
+                      libsnappy-dev:armhf \
+                      libspice-server-dev:armhf \
+                      libssh-gcrypt-dev:armhf \
+                      libsystemd-dev:armhf \
+                      libtasn1-6-dev:armhf \
+                      libubsan1:armhf \
+                      libudev-dev:armhf \
+                      liburing-dev:armhf \
+                      libusb-1.0-0-dev:armhf \
+                      libusbredirhost-dev:armhf \
+                      libvdeplug-dev:armhf \
+                      libvirglrenderer-dev:armhf \
+                      libvte-2.91-dev:armhf \
+                      libxen-dev:armhf \
+                      libzstd-dev:armhf \
+                      nettle-dev:armhf \
+                      systemtap-sdt-dev:armhf \
+                      xfslibs-dev:armhf \
+                      zlib1g-dev:armhf && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 9b90a4d6ff..c0d4b0df17 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -11,62 +11,62 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get install -y eatmydata && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bison \
-            bsdextrautils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            flex \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            hostname \
-            libglib2.0-dev \
-            libpcre2-dev \
-            libspice-protocol-dev \
-            llvm \
-            locales \
-            make \
-            meson \
-            ncat \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo && \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      perl-base \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      texinfo && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
     dpkg-reconfigure locales
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     dpkg --add-architecture mips64el && \
@@ -74,72 +74,72 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
     eatmydata apt-get install --no-install-recommends -y \
-            g++-mips64el-linux-gnuabi64 \
-            gcc-mips64el-linux-gnuabi64 \
-            libaio-dev:mips64el \
-            libasound2-dev:mips64el \
-            libattr1-dev:mips64el \
-            libbpf-dev:mips64el \
-            libbrlapi-dev:mips64el \
-            libbz2-dev:mips64el \
-            libc6-dev:mips64el \
-            libcacard-dev:mips64el \
-            libcap-ng-dev:mips64el \
-            libcapstone-dev:mips64el \
-            libcmocka-dev:mips64el \
-            libcurl4-gnutls-dev:mips64el \
-            libdaxctl-dev:mips64el \
-            libdrm-dev:mips64el \
-            libepoxy-dev:mips64el \
-            libfdt-dev:mips64el \
-            libffi-dev:mips64el \
-            libfuse3-dev:mips64el \
-            libgbm-dev:mips64el \
-            libgcrypt20-dev:mips64el \
-            libglib2.0-dev:mips64el \
-            libglusterfs-dev:mips64el \
-            libgnutls28-dev:mips64el \
-            libgtk-3-dev:mips64el \
-            libibumad-dev:mips64el \
-            libibverbs-dev:mips64el \
-            libiscsi-dev:mips64el \
-            libjemalloc-dev:mips64el \
-            libjpeg62-turbo-dev:mips64el \
-            libjson-c-dev:mips64el \
-            liblttng-ust-dev:mips64el \
-            liblzo2-dev:mips64el \
-            libncursesw5-dev:mips64el \
-            libnfs-dev:mips64el \
-            libnuma-dev:mips64el \
-            libpam0g-dev:mips64el \
-            libpixman-1-dev:mips64el \
-            libpng-dev:mips64el \
-            libpulse-dev:mips64el \
-            librbd-dev:mips64el \
-            librdmacm-dev:mips64el \
-            libsasl2-dev:mips64el \
-            libsdl2-dev:mips64el \
-            libsdl2-image-dev:mips64el \
-            libseccomp-dev:mips64el \
-            libselinux1-dev:mips64el \
-            libslirp-dev:mips64el \
-            libsnappy-dev:mips64el \
-            libspice-server-dev:mips64el \
-            libssh-gcrypt-dev:mips64el \
-            libsystemd-dev:mips64el \
-            libtasn1-6-dev:mips64el \
-            libudev-dev:mips64el \
-            liburing-dev:mips64el \
-            libusb-1.0-0-dev:mips64el \
-            libusbredirhost-dev:mips64el \
-            libvdeplug-dev:mips64el \
-            libvirglrenderer-dev:mips64el \
-            libvte-2.91-dev:mips64el \
-            libzstd-dev:mips64el \
-            nettle-dev:mips64el \
-            systemtap-sdt-dev:mips64el \
-            xfslibs-dev:mips64el \
-            zlib1g-dev:mips64el && \
+                      g++-mips64el-linux-gnuabi64 \
+                      gcc-mips64el-linux-gnuabi64 \
+                      libaio-dev:mips64el \
+                      libasound2-dev:mips64el \
+                      libattr1-dev:mips64el \
+                      libbpf-dev:mips64el \
+                      libbrlapi-dev:mips64el \
+                      libbz2-dev:mips64el \
+                      libc6-dev:mips64el \
+                      libcacard-dev:mips64el \
+                      libcap-ng-dev:mips64el \
+                      libcapstone-dev:mips64el \
+                      libcmocka-dev:mips64el \
+                      libcurl4-gnutls-dev:mips64el \
+                      libdaxctl-dev:mips64el \
+                      libdrm-dev:mips64el \
+                      libepoxy-dev:mips64el \
+                      libfdt-dev:mips64el \
+                      libffi-dev:mips64el \
+                      libfuse3-dev:mips64el \
+                      libgbm-dev:mips64el \
+                      libgcrypt20-dev:mips64el \
+                      libglib2.0-dev:mips64el \
+                      libglusterfs-dev:mips64el \
+                      libgnutls28-dev:mips64el \
+                      libgtk-3-dev:mips64el \
+                      libibumad-dev:mips64el \
+                      libibverbs-dev:mips64el \
+                      libiscsi-dev:mips64el \
+                      libjemalloc-dev:mips64el \
+                      libjpeg62-turbo-dev:mips64el \
+                      libjson-c-dev:mips64el \
+                      liblttng-ust-dev:mips64el \
+                      liblzo2-dev:mips64el \
+                      libncursesw5-dev:mips64el \
+                      libnfs-dev:mips64el \
+                      libnuma-dev:mips64el \
+                      libpam0g-dev:mips64el \
+                      libpixman-1-dev:mips64el \
+                      libpng-dev:mips64el \
+                      libpulse-dev:mips64el \
+                      librbd-dev:mips64el \
+                      librdmacm-dev:mips64el \
+                      libsasl2-dev:mips64el \
+                      libsdl2-dev:mips64el \
+                      libsdl2-image-dev:mips64el \
+                      libseccomp-dev:mips64el \
+                      libselinux1-dev:mips64el \
+                      libslirp-dev:mips64el \
+                      libsnappy-dev:mips64el \
+                      libspice-server-dev:mips64el \
+                      libssh-gcrypt-dev:mips64el \
+                      libsystemd-dev:mips64el \
+                      libtasn1-6-dev:mips64el \
+                      libudev-dev:mips64el \
+                      liburing-dev:mips64el \
+                      libusb-1.0-0-dev:mips64el \
+                      libusbredirhost-dev:mips64el \
+                      libvdeplug-dev:mips64el \
+                      libvirglrenderer-dev:mips64el \
+                      libvte-2.91-dev:mips64el \
+                      libzstd-dev:mips64el \
+                      nettle-dev:mips64el \
+                      systemtap-sdt-dev:mips64el \
+                      xfslibs-dev:mips64el \
+                      zlib1g-dev:mips64el && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 02feaf26cb..940b6794d1 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -11,62 +11,62 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get install -y eatmydata && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bison \
-            bsdextrautils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            flex \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            hostname \
-            libglib2.0-dev \
-            libpcre2-dev \
-            libspice-protocol-dev \
-            llvm \
-            locales \
-            make \
-            meson \
-            ncat \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo && \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      perl-base \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      texinfo && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
     dpkg-reconfigure locales
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     dpkg --add-architecture mipsel && \
@@ -74,72 +74,72 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
     eatmydata apt-get install --no-install-recommends -y \
-            g++-mipsel-linux-gnu \
-            gcc-mipsel-linux-gnu \
-            libaio-dev:mipsel \
-            libasound2-dev:mipsel \
-            libattr1-dev:mipsel \
-            libbpf-dev:mipsel \
-            libbrlapi-dev:mipsel \
-            libbz2-dev:mipsel \
-            libc6-dev:mipsel \
-            libcacard-dev:mipsel \
-            libcap-ng-dev:mipsel \
-            libcapstone-dev:mipsel \
-            libcmocka-dev:mipsel \
-            libcurl4-gnutls-dev:mipsel \
-            libdaxctl-dev:mipsel \
-            libdrm-dev:mipsel \
-            libepoxy-dev:mipsel \
-            libfdt-dev:mipsel \
-            libffi-dev:mipsel \
-            libfuse3-dev:mipsel \
-            libgbm-dev:mipsel \
-            libgcrypt20-dev:mipsel \
-            libglib2.0-dev:mipsel \
-            libglusterfs-dev:mipsel \
-            libgnutls28-dev:mipsel \
-            libgtk-3-dev:mipsel \
-            libibumad-dev:mipsel \
-            libibverbs-dev:mipsel \
-            libiscsi-dev:mipsel \
-            libjemalloc-dev:mipsel \
-            libjpeg62-turbo-dev:mipsel \
-            libjson-c-dev:mipsel \
-            liblttng-ust-dev:mipsel \
-            liblzo2-dev:mipsel \
-            libncursesw5-dev:mipsel \
-            libnfs-dev:mipsel \
-            libnuma-dev:mipsel \
-            libpam0g-dev:mipsel \
-            libpixman-1-dev:mipsel \
-            libpng-dev:mipsel \
-            libpulse-dev:mipsel \
-            librbd-dev:mipsel \
-            librdmacm-dev:mipsel \
-            libsasl2-dev:mipsel \
-            libsdl2-dev:mipsel \
-            libsdl2-image-dev:mipsel \
-            libseccomp-dev:mipsel \
-            libselinux1-dev:mipsel \
-            libslirp-dev:mipsel \
-            libsnappy-dev:mipsel \
-            libspice-server-dev:mipsel \
-            libssh-gcrypt-dev:mipsel \
-            libsystemd-dev:mipsel \
-            libtasn1-6-dev:mipsel \
-            libudev-dev:mipsel \
-            liburing-dev:mipsel \
-            libusb-1.0-0-dev:mipsel \
-            libusbredirhost-dev:mipsel \
-            libvdeplug-dev:mipsel \
-            libvirglrenderer-dev:mipsel \
-            libvte-2.91-dev:mipsel \
-            libzstd-dev:mipsel \
-            nettle-dev:mipsel \
-            systemtap-sdt-dev:mipsel \
-            xfslibs-dev:mipsel \
-            zlib1g-dev:mipsel && \
+                      g++-mipsel-linux-gnu \
+                      gcc-mipsel-linux-gnu \
+                      libaio-dev:mipsel \
+                      libasound2-dev:mipsel \
+                      libattr1-dev:mipsel \
+                      libbpf-dev:mipsel \
+                      libbrlapi-dev:mipsel \
+                      libbz2-dev:mipsel \
+                      libc6-dev:mipsel \
+                      libcacard-dev:mipsel \
+                      libcap-ng-dev:mipsel \
+                      libcapstone-dev:mipsel \
+                      libcmocka-dev:mipsel \
+                      libcurl4-gnutls-dev:mipsel \
+                      libdaxctl-dev:mipsel \
+                      libdrm-dev:mipsel \
+                      libepoxy-dev:mipsel \
+                      libfdt-dev:mipsel \
+                      libffi-dev:mipsel \
+                      libfuse3-dev:mipsel \
+                      libgbm-dev:mipsel \
+                      libgcrypt20-dev:mipsel \
+                      libglib2.0-dev:mipsel \
+                      libglusterfs-dev:mipsel \
+                      libgnutls28-dev:mipsel \
+                      libgtk-3-dev:mipsel \
+                      libibumad-dev:mipsel \
+                      libibverbs-dev:mipsel \
+                      libiscsi-dev:mipsel \
+                      libjemalloc-dev:mipsel \
+                      libjpeg62-turbo-dev:mipsel \
+                      libjson-c-dev:mipsel \
+                      liblttng-ust-dev:mipsel \
+                      liblzo2-dev:mipsel \
+                      libncursesw5-dev:mipsel \
+                      libnfs-dev:mipsel \
+                      libnuma-dev:mipsel \
+                      libpam0g-dev:mipsel \
+                      libpixman-1-dev:mipsel \
+                      libpng-dev:mipsel \
+                      libpulse-dev:mipsel \
+                      librbd-dev:mipsel \
+                      librdmacm-dev:mipsel \
+                      libsasl2-dev:mipsel \
+                      libsdl2-dev:mipsel \
+                      libsdl2-image-dev:mipsel \
+                      libseccomp-dev:mipsel \
+                      libselinux1-dev:mipsel \
+                      libslirp-dev:mipsel \
+                      libsnappy-dev:mipsel \
+                      libspice-server-dev:mipsel \
+                      libssh-gcrypt-dev:mipsel \
+                      libsystemd-dev:mipsel \
+                      libtasn1-6-dev:mipsel \
+                      libudev-dev:mipsel \
+                      liburing-dev:mipsel \
+                      libusb-1.0-0-dev:mipsel \
+                      libusbredirhost-dev:mipsel \
+                      libvdeplug-dev:mipsel \
+                      libvirglrenderer-dev:mipsel \
+                      libvte-2.91-dev:mipsel \
+                      libzstd-dev:mipsel \
+                      nettle-dev:mipsel \
+                      systemtap-sdt-dev:mipsel \
+                      xfslibs-dev:mipsel \
+                      zlib1g-dev:mipsel && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 97d3872ee2..2d59288622 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -11,62 +11,62 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get install -y eatmydata && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bison \
-            bsdextrautils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            flex \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            hostname \
-            libglib2.0-dev \
-            libpcre2-dev \
-            libspice-protocol-dev \
-            llvm \
-            locales \
-            make \
-            meson \
-            ncat \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo && \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      perl-base \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      texinfo && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
     dpkg-reconfigure locales
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     dpkg --add-architecture ppc64el && \
@@ -74,74 +74,74 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
     eatmydata apt-get install --no-install-recommends -y \
-            g++-powerpc64le-linux-gnu \
-            gcc-powerpc64le-linux-gnu \
-            libaio-dev:ppc64el \
-            libasan5:ppc64el \
-            libasound2-dev:ppc64el \
-            libattr1-dev:ppc64el \
-            libbpf-dev:ppc64el \
-            libbrlapi-dev:ppc64el \
-            libbz2-dev:ppc64el \
-            libc6-dev:ppc64el \
-            libcacard-dev:ppc64el \
-            libcap-ng-dev:ppc64el \
-            libcapstone-dev:ppc64el \
-            libcmocka-dev:ppc64el \
-            libcurl4-gnutls-dev:ppc64el \
-            libdaxctl-dev:ppc64el \
-            libdrm-dev:ppc64el \
-            libepoxy-dev:ppc64el \
-            libfdt-dev:ppc64el \
-            libffi-dev:ppc64el \
-            libfuse3-dev:ppc64el \
-            libgbm-dev:ppc64el \
-            libgcrypt20-dev:ppc64el \
-            libglib2.0-dev:ppc64el \
-            libglusterfs-dev:ppc64el \
-            libgnutls28-dev:ppc64el \
-            libgtk-3-dev:ppc64el \
-            libibumad-dev:ppc64el \
-            libibverbs-dev:ppc64el \
-            libiscsi-dev:ppc64el \
-            libjemalloc-dev:ppc64el \
-            libjpeg62-turbo-dev:ppc64el \
-            libjson-c-dev:ppc64el \
-            liblttng-ust-dev:ppc64el \
-            liblzo2-dev:ppc64el \
-            libncursesw5-dev:ppc64el \
-            libnfs-dev:ppc64el \
-            libnuma-dev:ppc64el \
-            libpam0g-dev:ppc64el \
-            libpixman-1-dev:ppc64el \
-            libpng-dev:ppc64el \
-            libpulse-dev:ppc64el \
-            librbd-dev:ppc64el \
-            librdmacm-dev:ppc64el \
-            libsasl2-dev:ppc64el \
-            libsdl2-dev:ppc64el \
-            libsdl2-image-dev:ppc64el \
-            libseccomp-dev:ppc64el \
-            libselinux1-dev:ppc64el \
-            libslirp-dev:ppc64el \
-            libsnappy-dev:ppc64el \
-            libspice-server-dev:ppc64el \
-            libssh-gcrypt-dev:ppc64el \
-            libsystemd-dev:ppc64el \
-            libtasn1-6-dev:ppc64el \
-            libubsan1:ppc64el \
-            libudev-dev:ppc64el \
-            liburing-dev:ppc64el \
-            libusb-1.0-0-dev:ppc64el \
-            libusbredirhost-dev:ppc64el \
-            libvdeplug-dev:ppc64el \
-            libvirglrenderer-dev:ppc64el \
-            libvte-2.91-dev:ppc64el \
-            libzstd-dev:ppc64el \
-            nettle-dev:ppc64el \
-            systemtap-sdt-dev:ppc64el \
-            xfslibs-dev:ppc64el \
-            zlib1g-dev:ppc64el && \
+                      g++-powerpc64le-linux-gnu \
+                      gcc-powerpc64le-linux-gnu \
+                      libaio-dev:ppc64el \
+                      libasan5:ppc64el \
+                      libasound2-dev:ppc64el \
+                      libattr1-dev:ppc64el \
+                      libbpf-dev:ppc64el \
+                      libbrlapi-dev:ppc64el \
+                      libbz2-dev:ppc64el \
+                      libc6-dev:ppc64el \
+                      libcacard-dev:ppc64el \
+                      libcap-ng-dev:ppc64el \
+                      libcapstone-dev:ppc64el \
+                      libcmocka-dev:ppc64el \
+                      libcurl4-gnutls-dev:ppc64el \
+                      libdaxctl-dev:ppc64el \
+                      libdrm-dev:ppc64el \
+                      libepoxy-dev:ppc64el \
+                      libfdt-dev:ppc64el \
+                      libffi-dev:ppc64el \
+                      libfuse3-dev:ppc64el \
+                      libgbm-dev:ppc64el \
+                      libgcrypt20-dev:ppc64el \
+                      libglib2.0-dev:ppc64el \
+                      libglusterfs-dev:ppc64el \
+                      libgnutls28-dev:ppc64el \
+                      libgtk-3-dev:ppc64el \
+                      libibumad-dev:ppc64el \
+                      libibverbs-dev:ppc64el \
+                      libiscsi-dev:ppc64el \
+                      libjemalloc-dev:ppc64el \
+                      libjpeg62-turbo-dev:ppc64el \
+                      libjson-c-dev:ppc64el \
+                      liblttng-ust-dev:ppc64el \
+                      liblzo2-dev:ppc64el \
+                      libncursesw5-dev:ppc64el \
+                      libnfs-dev:ppc64el \
+                      libnuma-dev:ppc64el \
+                      libpam0g-dev:ppc64el \
+                      libpixman-1-dev:ppc64el \
+                      libpng-dev:ppc64el \
+                      libpulse-dev:ppc64el \
+                      librbd-dev:ppc64el \
+                      librdmacm-dev:ppc64el \
+                      libsasl2-dev:ppc64el \
+                      libsdl2-dev:ppc64el \
+                      libsdl2-image-dev:ppc64el \
+                      libseccomp-dev:ppc64el \
+                      libselinux1-dev:ppc64el \
+                      libslirp-dev:ppc64el \
+                      libsnappy-dev:ppc64el \
+                      libspice-server-dev:ppc64el \
+                      libssh-gcrypt-dev:ppc64el \
+                      libsystemd-dev:ppc64el \
+                      libtasn1-6-dev:ppc64el \
+                      libubsan1:ppc64el \
+                      libudev-dev:ppc64el \
+                      liburing-dev:ppc64el \
+                      libusb-1.0-0-dev:ppc64el \
+                      libusbredirhost-dev:ppc64el \
+                      libvdeplug-dev:ppc64el \
+                      libvirglrenderer-dev:ppc64el \
+                      libvte-2.91-dev:ppc64el \
+                      libzstd-dev:ppc64el \
+                      nettle-dev:ppc64el \
+                      systemtap-sdt-dev:ppc64el \
+                      xfslibs-dev:ppc64el \
+                      zlib1g-dev:ppc64el && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 95585e9e56..a105c1066e 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -11,62 +11,62 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get install -y eatmydata && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bison \
-            bsdextrautils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            flex \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            hostname \
-            libglib2.0-dev \
-            libpcre2-dev \
-            libspice-protocol-dev \
-            llvm \
-            locales \
-            make \
-            meson \
-            ncat \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo && \
+                      bash \
+                      bc \
+                      bison \
+                      bsdextrautils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libglib2.0-dev \
+                      libpcre2-dev \
+                      libspice-protocol-dev \
+                      llvm \
+                      locales \
+                      make \
+                      meson \
+                      ncat \
+                      ninja-build \
+                      openssh-client \
+                      perl-base \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      sparse \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      texinfo && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
     dpkg-reconfigure locales
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     dpkg --add-architecture s390x && \
@@ -74,73 +74,73 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
     eatmydata apt-get install --no-install-recommends -y \
-            g++-s390x-linux-gnu \
-            gcc-s390x-linux-gnu \
-            libaio-dev:s390x \
-            libasan5:s390x \
-            libasound2-dev:s390x \
-            libattr1-dev:s390x \
-            libbpf-dev:s390x \
-            libbrlapi-dev:s390x \
-            libbz2-dev:s390x \
-            libc6-dev:s390x \
-            libcacard-dev:s390x \
-            libcap-ng-dev:s390x \
-            libcapstone-dev:s390x \
-            libcmocka-dev:s390x \
-            libcurl4-gnutls-dev:s390x \
-            libdaxctl-dev:s390x \
-            libdrm-dev:s390x \
-            libepoxy-dev:s390x \
-            libfdt-dev:s390x \
-            libffi-dev:s390x \
-            libfuse3-dev:s390x \
-            libgbm-dev:s390x \
-            libgcrypt20-dev:s390x \
-            libglib2.0-dev:s390x \
-            libglusterfs-dev:s390x \
-            libgnutls28-dev:s390x \
-            libgtk-3-dev:s390x \
-            libibumad-dev:s390x \
-            libibverbs-dev:s390x \
-            libiscsi-dev:s390x \
-            libjemalloc-dev:s390x \
-            libjpeg62-turbo-dev:s390x \
-            libjson-c-dev:s390x \
-            liblttng-ust-dev:s390x \
-            liblzo2-dev:s390x \
-            libncursesw5-dev:s390x \
-            libnfs-dev:s390x \
-            libnuma-dev:s390x \
-            libpam0g-dev:s390x \
-            libpixman-1-dev:s390x \
-            libpng-dev:s390x \
-            libpulse-dev:s390x \
-            librbd-dev:s390x \
-            librdmacm-dev:s390x \
-            libsasl2-dev:s390x \
-            libsdl2-dev:s390x \
-            libsdl2-image-dev:s390x \
-            libseccomp-dev:s390x \
-            libselinux1-dev:s390x \
-            libslirp-dev:s390x \
-            libsnappy-dev:s390x \
-            libssh-gcrypt-dev:s390x \
-            libsystemd-dev:s390x \
-            libtasn1-6-dev:s390x \
-            libubsan1:s390x \
-            libudev-dev:s390x \
-            liburing-dev:s390x \
-            libusb-1.0-0-dev:s390x \
-            libusbredirhost-dev:s390x \
-            libvdeplug-dev:s390x \
-            libvirglrenderer-dev:s390x \
-            libvte-2.91-dev:s390x \
-            libzstd-dev:s390x \
-            nettle-dev:s390x \
-            systemtap-sdt-dev:s390x \
-            xfslibs-dev:s390x \
-            zlib1g-dev:s390x && \
+                      g++-s390x-linux-gnu \
+                      gcc-s390x-linux-gnu \
+                      libaio-dev:s390x \
+                      libasan5:s390x \
+                      libasound2-dev:s390x \
+                      libattr1-dev:s390x \
+                      libbpf-dev:s390x \
+                      libbrlapi-dev:s390x \
+                      libbz2-dev:s390x \
+                      libc6-dev:s390x \
+                      libcacard-dev:s390x \
+                      libcap-ng-dev:s390x \
+                      libcapstone-dev:s390x \
+                      libcmocka-dev:s390x \
+                      libcurl4-gnutls-dev:s390x \
+                      libdaxctl-dev:s390x \
+                      libdrm-dev:s390x \
+                      libepoxy-dev:s390x \
+                      libfdt-dev:s390x \
+                      libffi-dev:s390x \
+                      libfuse3-dev:s390x \
+                      libgbm-dev:s390x \
+                      libgcrypt20-dev:s390x \
+                      libglib2.0-dev:s390x \
+                      libglusterfs-dev:s390x \
+                      libgnutls28-dev:s390x \
+                      libgtk-3-dev:s390x \
+                      libibumad-dev:s390x \
+                      libibverbs-dev:s390x \
+                      libiscsi-dev:s390x \
+                      libjemalloc-dev:s390x \
+                      libjpeg62-turbo-dev:s390x \
+                      libjson-c-dev:s390x \
+                      liblttng-ust-dev:s390x \
+                      liblzo2-dev:s390x \
+                      libncursesw5-dev:s390x \
+                      libnfs-dev:s390x \
+                      libnuma-dev:s390x \
+                      libpam0g-dev:s390x \
+                      libpixman-1-dev:s390x \
+                      libpng-dev:s390x \
+                      libpulse-dev:s390x \
+                      librbd-dev:s390x \
+                      librdmacm-dev:s390x \
+                      libsasl2-dev:s390x \
+                      libsdl2-dev:s390x \
+                      libsdl2-image-dev:s390x \
+                      libseccomp-dev:s390x \
+                      libselinux1-dev:s390x \
+                      libslirp-dev:s390x \
+                      libsnappy-dev:s390x \
+                      libssh-gcrypt-dev:s390x \
+                      libsystemd-dev:s390x \
+                      libtasn1-6-dev:s390x \
+                      libubsan1:s390x \
+                      libudev-dev:s390x \
+                      liburing-dev:s390x \
+                      libusb-1.0-0-dev:s390x \
+                      libusbredirhost-dev:s390x \
+                      libvdeplug-dev:s390x \
+                      libvirglrenderer-dev:s390x \
+                      libvte-2.91-dev:s390x \
+                      libzstd-dev:s390x \
+                      nettle-dev:s390x \
+                      systemtap-sdt-dev:s390x \
+                      xfslibs-dev:s390x \
+                      zlib1g-dev:s390x && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index aca37aabc4..75383ba185 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,46 +1,103 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross mingw32 fedora-35 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
 FROM registry.fedoraproject.org/fedora:35
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    bc \
-    bison \
-    bzip2 \
-    ccache \
-    diffutils \
-    findutils \
-    flex \
-    gcc \
-    gettext \
-    git \
-    glib2-devel \
-    hostname \
-    make \
-    meson \
-    mingw32-bzip2 \
-    mingw32-curl \
-    mingw32-glib2 \
-    mingw32-gmp \
-    mingw32-gnutls \
-    mingw32-gtk3 \
-    mingw32-libffi \
-    mingw32-libjpeg-turbo \
-    mingw32-libpng \
-    mingw32-libtasn1 \
-    mingw32-libusbx \
-    mingw32-nettle \
-    mingw32-nsis \
-    mingw32-pixman \
-    mingw32-pkg-config \
-    mingw32-SDL2 \
-    msitools \
-    perl \
-    python3 \
-    python3-PyYAML \
-    tar \
-    which
+RUN dnf install -y nosync && \
+    echo -e '#!/bin/sh\n\
+if test -d /usr/lib64\n\
+then\n\
+    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
+else\n\
+    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
+fi\n\
+exec "$@"' > /usr/bin/nosync && \
+    chmod +x /usr/bin/nosync && \
+    nosync dnf update -y && \
+    nosync dnf install -y \
+               bash \
+               bc \
+               bison \
+               bzip2 \
+               ca-certificates \
+               ccache \
+               ctags \
+               dbus-daemon \
+               diffutils \
+               findutils \
+               flex \
+               gcovr \
+               genisoimage \
+               git \
+               glib2-devel \
+               glibc-langpack-en \
+               hostname \
+               llvm \
+               make \
+               meson \
+               ninja-build \
+               nmap-ncat \
+               openssh-clients \
+               pcre-static \
+               perl-base \
+               python3 \
+               python3-PyYAML \
+               python3-numpy \
+               python3-opencv \
+               python3-pillow \
+               python3-pip \
+               python3-sphinx \
+               python3-sphinx_rtd_theme \
+               rpm \
+               sed \
+               sparse \
+               spice-protocol \
+               tar \
+               tesseract \
+               tesseract-langpack-eng \
+               texinfo \
+               util-linux \
+               which && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+RUN nosync dnf install -y \
+               mingw32-SDL2 \
+               mingw32-SDL2_image \
+               mingw32-bzip2 \
+               mingw32-curl \
+               mingw32-gcc \
+               mingw32-gcc-c++ \
+               mingw32-gettext \
+               mingw32-glib2 \
+               mingw32-gnutls \
+               mingw32-gtk3 \
+               mingw32-libgcrypt \
+               mingw32-libjpeg-turbo \
+               mingw32-libpng \
+               mingw32-libtasn1 \
+               mingw32-nettle \
+               mingw32-nsis \
+               mingw32-pixman \
+               mingw32-pkg-config && \
+    nosync dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-gcc
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
+ENV ABI "i686-w64-mingw32"
+ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw32.meson"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=i686-w64-mingw32-
+ENV DEF_TARGET_LIST i386-softmmu
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 3642766479..98c03dc13b 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,43 +1,103 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross mingw64 fedora-35 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
 FROM registry.fedoraproject.org/fedora:35
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    bc \
-    bison \
-    bzip2 \
-    ccache \
-    diffutils \
-    findutils \
-    flex \
-    gcc \
-    gettext \
-    git \
-    glib2-devel \
-    hostname \
-    make \
-    meson \
-    mingw32-nsis \
-    mingw64-bzip2 \
-    mingw64-curl \
-    mingw64-glib2 \
-    mingw64-gmp \
-    mingw64-gtk3 \
-    mingw64-libffi \
-    mingw64-libjpeg-turbo \
-    mingw64-libpng \
-    mingw64-libtasn1 \
-    mingw64-libusbx \
-    mingw64-pixman \
-    mingw64-pkg-config \
-    msitools \
-    perl \
-    python3 \
-    python3-PyYAML \
-    tar \
-    which
+RUN dnf install -y nosync && \
+    echo -e '#!/bin/sh\n\
+if test -d /usr/lib64\n\
+then\n\
+    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
+else\n\
+    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
+fi\n\
+exec "$@"' > /usr/bin/nosync && \
+    chmod +x /usr/bin/nosync && \
+    nosync dnf update -y && \
+    nosync dnf install -y \
+               bash \
+               bc \
+               bison \
+               bzip2 \
+               ca-certificates \
+               ccache \
+               ctags \
+               dbus-daemon \
+               diffutils \
+               findutils \
+               flex \
+               gcovr \
+               genisoimage \
+               git \
+               glib2-devel \
+               glibc-langpack-en \
+               hostname \
+               llvm \
+               make \
+               meson \
+               ninja-build \
+               nmap-ncat \
+               openssh-clients \
+               pcre-static \
+               perl-base \
+               python3 \
+               python3-PyYAML \
+               python3-numpy \
+               python3-opencv \
+               python3-pillow \
+               python3-pip \
+               python3-sphinx \
+               python3-sphinx_rtd_theme \
+               rpm \
+               sed \
+               sparse \
+               spice-protocol \
+               tar \
+               tesseract \
+               tesseract-langpack-eng \
+               texinfo \
+               util-linux \
+               which && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+RUN nosync dnf install -y \
+               mingw32-nsis \
+               mingw64-SDL2 \
+               mingw64-SDL2_image \
+               mingw64-bzip2 \
+               mingw64-curl \
+               mingw64-gcc \
+               mingw64-gcc-c++ \
+               mingw64-gettext \
+               mingw64-glib2 \
+               mingw64-gnutls \
+               mingw64-gtk3 \
+               mingw64-libgcrypt \
+               mingw64-libjpeg-turbo \
+               mingw64-libpng \
+               mingw64-libtasn1 \
+               mingw64-nettle \
+               mingw64-pixman \
+               mingw64-pkg-config && \
+    nosync dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-gcc
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32- --disable-capstone
+ENV ABI "x86_64-w64-mingw32"
+ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw64.meson"
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32-
+ENV DEF_TARGET_LIST x86_64-softmmu
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index fe84166ca1..d200c7fc10 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -18,120 +18,120 @@ exec "$@"' > /usr/bin/nosync && \
     chmod +x /usr/bin/nosync && \
     nosync dnf update -y && \
     nosync dnf install -y \
-        SDL2-devel \
-        SDL2_image-devel \
-        alsa-lib-devel \
-        bash \
-        bc \
-        bison \
-        brlapi-devel \
-        bzip2 \
-        bzip2-devel \
-        ca-certificates \
-        capstone-devel \
-        ccache \
-        clang \
-        ctags \
-        cyrus-sasl-devel \
-        daxctl-devel \
-        dbus-daemon \
-        device-mapper-multipath-devel \
-        diffutils \
-        findutils \
-        flex \
-        fuse3-devel \
-        gcc \
-        gcc-c++ \
-        gcovr \
-        genisoimage \
-        gettext \
-        git \
-        glib2-devel \
-        glib2-static \
-        glibc-langpack-en \
-        glibc-static \
-        glusterfs-api-devel \
-        gnutls-devel \
-        gtk3-devel \
-        hostname \
-        jemalloc-devel \
-        json-c-devel \
-        libaio-devel \
-        libasan \
-        libattr-devel \
-        libbpf-devel \
-        libcacard-devel \
-        libcap-ng-devel \
-        libcmocka-devel \
-        libcurl-devel \
-        libdrm-devel \
-        libepoxy-devel \
-        libfdt-devel \
-        libffi-devel \
-        libgcrypt-devel \
-        libiscsi-devel \
-        libjpeg-devel \
-        libnfs-devel \
-        libpmem-devel \
-        libpng-devel \
-        librbd-devel \
-        libseccomp-devel \
-        libselinux-devel \
-        libslirp-devel \
-        libssh-devel \
-        libtasn1-devel \
-        libubsan \
-        liburing-devel \
-        libusbx-devel \
-        libzstd-devel \
-        llvm \
-        lttng-ust-devel \
-        lzo-devel \
-        make \
-        mesa-libgbm-devel \
-        meson \
-        ncurses-devel \
-        nettle-devel \
-        ninja-build \
-        nmap-ncat \
-        numactl-devel \
-        openssh-clients \
-        pam-devel \
-        pcre-static \
-        perl-base \
-        pixman-devel \
-        pkgconfig \
-        pulseaudio-libs-devel \
-        python3 \
-        python3-PyYAML \
-        python3-numpy \
-        python3-opencv \
-        python3-pillow \
-        python3-pip \
-        python3-sphinx \
-        python3-sphinx_rtd_theme \
-        rdma-core-devel \
-        rpm \
-        sed \
-        snappy-devel \
-        sparse \
-        spice-protocol \
-        spice-server-devel \
-        systemd-devel \
-        systemtap-sdt-devel \
-        tar \
-        tesseract \
-        tesseract-langpack-eng \
-        texinfo \
-        usbredir-devel \
-        util-linux \
-        virglrenderer-devel \
-        vte291-devel \
-        which \
-        xen-devel \
-        xfsprogs-devel \
-        zlib-devel \
-        zlib-static && \
+               SDL2-devel \
+               SDL2_image-devel \
+               alsa-lib-devel \
+               bash \
+               bc \
+               bison \
+               brlapi-devel \
+               bzip2 \
+               bzip2-devel \
+               ca-certificates \
+               capstone-devel \
+               ccache \
+               clang \
+               ctags \
+               cyrus-sasl-devel \
+               daxctl-devel \
+               dbus-daemon \
+               device-mapper-multipath-devel \
+               diffutils \
+               findutils \
+               flex \
+               fuse3-devel \
+               gcc \
+               gcc-c++ \
+               gcovr \
+               genisoimage \
+               gettext \
+               git \
+               glib2-devel \
+               glib2-static \
+               glibc-langpack-en \
+               glibc-static \
+               glusterfs-api-devel \
+               gnutls-devel \
+               gtk3-devel \
+               hostname \
+               jemalloc-devel \
+               json-c-devel \
+               libaio-devel \
+               libasan \
+               libattr-devel \
+               libbpf-devel \
+               libcacard-devel \
+               libcap-ng-devel \
+               libcmocka-devel \
+               libcurl-devel \
+               libdrm-devel \
+               libepoxy-devel \
+               libfdt-devel \
+               libffi-devel \
+               libgcrypt-devel \
+               libiscsi-devel \
+               libjpeg-devel \
+               libnfs-devel \
+               libpmem-devel \
+               libpng-devel \
+               librbd-devel \
+               libseccomp-devel \
+               libselinux-devel \
+               libslirp-devel \
+               libssh-devel \
+               libtasn1-devel \
+               libubsan \
+               liburing-devel \
+               libusbx-devel \
+               libzstd-devel \
+               llvm \
+               lttng-ust-devel \
+               lzo-devel \
+               make \
+               mesa-libgbm-devel \
+               meson \
+               ncurses-devel \
+               nettle-devel \
+               ninja-build \
+               nmap-ncat \
+               numactl-devel \
+               openssh-clients \
+               pam-devel \
+               pcre-static \
+               perl-base \
+               pixman-devel \
+               pkgconfig \
+               pulseaudio-libs-devel \
+               python3 \
+               python3-PyYAML \
+               python3-numpy \
+               python3-opencv \
+               python3-pillow \
+               python3-pip \
+               python3-sphinx \
+               python3-sphinx_rtd_theme \
+               rdma-core-devel \
+               rpm \
+               sed \
+               snappy-devel \
+               sparse \
+               spice-protocol \
+               spice-server-devel \
+               systemd-devel \
+               systemtap-sdt-devel \
+               tar \
+               tesseract \
+               tesseract-langpack-eng \
+               texinfo \
+               usbredir-devel \
+               util-linux \
+               virglrenderer-devel \
+               vte291-devel \
+               which \
+               xen-devel \
+               xfsprogs-devel \
+               zlib-devel \
+               zlib-static && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y && \
     rpm -qa | sort > /packages.txt && \
@@ -142,8 +142,8 @@ exec "$@"' > /usr/bin/nosync && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index d80064756f..361979d6b3 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -132,8 +132,8 @@ RUN zypper update -y && \
 
 RUN /usr/bin/pip3 install meson==0.56.0
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 24594afc15..ac16383da7 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -11,122 +11,122 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get install -y eatmydata && \
     eatmydata apt-get dist-upgrade -y && \
     eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bison \
-            bsdmainutils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            clang \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            flex \
-            g++ \
-            gcc \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            hostname \
-            libaio-dev \
-            libasan5 \
-            libasound2-dev \
-            libattr1-dev \
-            libbrlapi-dev \
-            libbz2-dev \
-            libc6-dev \
-            libcacard-dev \
-            libcap-ng-dev \
-            libcapstone-dev \
-            libcmocka-dev \
-            libcurl4-gnutls-dev \
-            libdaxctl-dev \
-            libdrm-dev \
-            libepoxy-dev \
-            libfdt-dev \
-            libffi-dev \
-            libfuse3-dev \
-            libgbm-dev \
-            libgcrypt20-dev \
-            libglib2.0-dev \
-            libglusterfs-dev \
-            libgnutls28-dev \
-            libgtk-3-dev \
-            libibumad-dev \
-            libibverbs-dev \
-            libiscsi-dev \
-            libjemalloc-dev \
-            libjpeg-turbo8-dev \
-            libjson-c-dev \
-            liblttng-ust-dev \
-            liblzo2-dev \
-            libncursesw5-dev \
-            libnfs-dev \
-            libnuma-dev \
-            libpam0g-dev \
-            libpcre2-dev \
-            libpixman-1-dev \
-            libpmem-dev \
-            libpng-dev \
-            libpulse-dev \
-            librbd-dev \
-            librdmacm-dev \
-            libsasl2-dev \
-            libsdl2-dev \
-            libsdl2-image-dev \
-            libseccomp-dev \
-            libselinux1-dev \
-            libslirp-dev \
-            libsnappy-dev \
-            libspice-protocol-dev \
-            libspice-server-dev \
-            libssh-dev \
-            libsystemd-dev \
-            libtasn1-6-dev \
-            libubsan1 \
-            libudev-dev \
-            libusb-1.0-0-dev \
-            libusbredirhost-dev \
-            libvdeplug-dev \
-            libvirglrenderer-dev \
-            libvte-2.91-dev \
-            libxen-dev \
-            libzstd-dev \
-            llvm \
-            locales \
-            make \
-            multipath-tools \
-            ncat \
-            nettle-dev \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-setuptools \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-wheel \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            systemtap-sdt-dev \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo \
-            xfslibs-dev \
-            zlib1g-dev && \
+                      bash \
+                      bc \
+                      bison \
+                      bsdmainutils \
+                      bzip2 \
+                      ca-certificates \
+                      ccache \
+                      clang \
+                      dbus \
+                      debianutils \
+                      diffutils \
+                      exuberant-ctags \
+                      findutils \
+                      flex \
+                      g++ \
+                      gcc \
+                      gcovr \
+                      genisoimage \
+                      gettext \
+                      git \
+                      hostname \
+                      libaio-dev \
+                      libasan5 \
+                      libasound2-dev \
+                      libattr1-dev \
+                      libbrlapi-dev \
+                      libbz2-dev \
+                      libc6-dev \
+                      libcacard-dev \
+                      libcap-ng-dev \
+                      libcapstone-dev \
+                      libcmocka-dev \
+                      libcurl4-gnutls-dev \
+                      libdaxctl-dev \
+                      libdrm-dev \
+                      libepoxy-dev \
+                      libfdt-dev \
+                      libffi-dev \
+                      libfuse3-dev \
+                      libgbm-dev \
+                      libgcrypt20-dev \
+                      libglib2.0-dev \
+                      libglusterfs-dev \
+                      libgnutls28-dev \
+                      libgtk-3-dev \
+                      libibumad-dev \
+                      libibverbs-dev \
+                      libiscsi-dev \
+                      libjemalloc-dev \
+                      libjpeg-turbo8-dev \
+                      libjson-c-dev \
+                      liblttng-ust-dev \
+                      liblzo2-dev \
+                      libncursesw5-dev \
+                      libnfs-dev \
+                      libnuma-dev \
+                      libpam0g-dev \
+                      libpcre2-dev \
+                      libpixman-1-dev \
+                      libpmem-dev \
+                      libpng-dev \
+                      libpulse-dev \
+                      librbd-dev \
+                      librdmacm-dev \
+                      libsasl2-dev \
+                      libsdl2-dev \
+                      libsdl2-image-dev \
+                      libseccomp-dev \
+                      libselinux1-dev \
+                      libslirp-dev \
+                      libsnappy-dev \
+                      libspice-protocol-dev \
+                      libspice-server-dev \
+                      libssh-dev \
+                      libsystemd-dev \
+                      libtasn1-6-dev \
+                      libubsan1 \
+                      libudev-dev \
+                      libusb-1.0-0-dev \
+                      libusbredirhost-dev \
+                      libvdeplug-dev \
+                      libvirglrenderer-dev \
+                      libvte-2.91-dev \
+                      libxen-dev \
+                      libzstd-dev \
+                      llvm \
+                      locales \
+                      make \
+                      multipath-tools \
+                      ncat \
+                      nettle-dev \
+                      ninja-build \
+                      openssh-client \
+                      perl-base \
+                      pkgconf \
+                      python3 \
+                      python3-numpy \
+                      python3-opencv \
+                      python3-pillow \
+                      python3-pip \
+                      python3-setuptools \
+                      python3-sphinx \
+                      python3-sphinx-rtd-theme \
+                      python3-venv \
+                      python3-wheel \
+                      python3-yaml \
+                      rpm2cpio \
+                      sed \
+                      sparse \
+                      systemtap-sdt-dev \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      texinfo \
+                      xfslibs-dev \
+                      zlib1g-dev && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
@@ -141,11 +141,11 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
 
 RUN /usr/bin/pip3 install meson==0.56.0
 
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 # Apply patch https://reviews.llvm.org/D75820
 # This is required for TSan in clang-10 to compile with QEMU.
 RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index e3712b7912..a2633997ff 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit e3712b79122180fdb3b7a7ea8cbee47ece253f97
+Subproject commit a2633997ffb3830acc96c98c70122885d83bebf4
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index e45c99adbe..ce0b24c0b1 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -93,7 +93,7 @@ debian11_extras = [
 ]
 
 
-def debian_cross_build(prefix, targets):
+def cross_build(prefix, targets):
     conf = "ENV QEMU_CONFIGURE_OPTS --cross-prefix=%s\n" % (prefix)
     targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
     return "".join([conf, targets])
@@ -121,45 +121,55 @@ try:
     #
     generate_dockerfile("debian-amd64-cross", "debian-11",
                         cross="x86_64",
-                        trailer=debian_cross_build("x86_64-linux-gnu-",
-                                                   "x86_64-softmmu,"
-                                                   "x86_64-linux-user,"
-                                                   "i386-softmmu,i386-linux-user"))
+                        trailer=cross_build("x86_64-linux-gnu-",
+                                            "x86_64-softmmu,"
+                                            "x86_64-linux-user,"
+                                            "i386-softmmu,i386-linux-user"))
 
     generate_dockerfile("debian-arm64-cross", "debian-11",
                         cross="aarch64",
-                        trailer=debian_cross_build("aarch64-linux-gnu-",
-                                                   "aarch64-softmmu,aarch64-linux-user"))
+                        trailer=cross_build("aarch64-linux-gnu-",
+                                            "aarch64-softmmu,aarch64-linux-user"))
 
     generate_dockerfile("debian-armel-cross", "debian-11",
                         cross="armv6l",
-                        trailer=debian_cross_build("arm-linux-gnueabi-",
-                                                   "arm-softmmu,arm-linux-user,armeb-linux-user"))
+                        trailer=cross_build("arm-linux-gnueabi-",
+                                            "arm-softmmu,arm-linux-user,armeb-linux-user"))
 
     generate_dockerfile("debian-armhf-cross", "debian-11",
                         cross="armv7l",
-                        trailer=debian_cross_build("arm-linux-gnueabihf-",
-                                                   "arm-softmmu,arm-linux-user"))
+                        trailer=cross_build("arm-linux-gnueabihf-",
+                                            "arm-softmmu,arm-linux-user"))
 
     generate_dockerfile("debian-mips64el-cross", "debian-11",
                         cross="mips64el",
-                        trailer=debian_cross_build("mips64el-linux-gnuabi64-",
-                                                  "mips64el-softmmu,mips64el-linux-user"))
+                        trailer=cross_build("mips64el-linux-gnuabi64-",
+                                            "mips64el-softmmu,mips64el-linux-user"))
 
     generate_dockerfile("debian-mipsel-cross", "debian-11",
                         cross="mipsel",
-                        trailer=debian_cross_build("mipsel-linux-gnu-",
-                                                   "mipsel-softmmu,mipsel-linux-user"))
+                        trailer=cross_build("mipsel-linux-gnu-",
+                                            "mipsel-softmmu,mipsel-linux-user"))
 
     generate_dockerfile("debian-ppc64el-cross", "debian-11",
                         cross="ppc64le",
-                        trailer=debian_cross_build("powerpc64le-linux-gnu-",
-                                                   "ppc64-softmmu,ppc64-linux-user"))
+                        trailer=cross_build("powerpc64le-linux-gnu-",
+                                            "ppc64-softmmu,ppc64-linux-user"))
 
     generate_dockerfile("debian-s390x-cross", "debian-11",
                         cross="s390x",
-                        trailer=debian_cross_build("s390x-linux-gnu-",
-                                                   "s390x-softmmu,s390x-linux-user"))
+                        trailer=cross_build("s390x-linux-gnu-",
+                                            "s390x-softmmu,s390x-linux-user"))
+
+    generate_dockerfile("fedora-win32-cross", "fedora-35",
+                        cross="mingw32",
+                        trailer=cross_build("i686-w64-mingw32-",
+                                            "i386-softmmu"))
+
+    generate_dockerfile("fedora-win64-cross", "fedora-35",
+                        cross="mingw64",
+                        trailer=cross_build("x86_64-w64-mingw32-",
+                                            "x86_64-softmmu"))
 
     #
     # Cirrus packages lists for GitLab
-- 
2.34.1


