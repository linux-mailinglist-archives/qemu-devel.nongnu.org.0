Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4D35B8D65
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:45:46 +0200 (CEST)
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVWD-0007Kc-3N
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUtz-0001P7-Cb
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUtw-0003qp-T5
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id h8so19484699wrf.3
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ECDuZFyCXgxzb5T4QRP2tWAs5cywxGurwT3H7qt6mNg=;
 b=t7EN3ZD5yw+KZLb4H1uITUFxgQR5rZtpuWUc/NB+8yuPS1R5Y8jgO+/yq5fAEHz4MD
 RISQ/2uEwflJZGe2kppJbhUPZvIBLygxXOqCZ8n+wQGd6xHMjK+w3KXjUSIz6EGKnFey
 CWD0USPOB2pQGnxMVcQeUTN3RD/A+8XkFKGEkj7coh74SQwAhYN9E2EDkaov2XXb/am8
 916S1bHepP+yhdrEUDiBgCXi0hlY4wrJ1nqcmofYMaxlfTuve40nczoWoN+zFYXyOviP
 3KlCk3y/V+jznpZ803GTIIFXx+IV33/i6u3ANhHlm7evaOthFZLgwuAOATInX1hwN6H1
 AW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ECDuZFyCXgxzb5T4QRP2tWAs5cywxGurwT3H7qt6mNg=;
 b=zAMm50RyDhT23iigTTSyb/f6wS314Gr4el2L5oieT/xyXyQZhTJcX7GUMx3Us4MoLw
 8mvrjti7zpH147TUyAlyaPestO2RiYYtazoVXgQNEyyj8whoAfgcV1HYlBP3/95t64KR
 oTUAJaQPNGgg0adSZHlZ9i/GPeVfFWUqA24fxjz1LpYgAxvwlsoPA9s8Xx3w/7YC3DP5
 2+BaEQUqb/v16m+xTAJ+owKZuPafdlhCSmD0AbNTgNCJ8xrlh83nxeo8kcJ+rcyOR9LC
 a/p7xTKMrOvrbDuPMqtErrB7+cb11xSNDfcI8OpR2nMnwhILyf4LfW7kTXsX6Y74oFDp
 RnWw==
X-Gm-Message-State: ACgBeo3SZOkhZy66oSX88CW//FRLT+qjXKvsWZ7oI8XZ0dKANxme0Tw+
 TQdFEfkHwdIexlbq/6cIta8FwQ==
X-Google-Smtp-Source: AA6agR6NJBZeYL+U06qI0IBe1LTyeYd8hvRJndWawCH8qMjaJSFI40fvymoyz3Lv99hF6cyN0bzDqw==
X-Received: by 2002:a05:6000:178a:b0:22a:2c1d:f563 with SMTP id
 e10-20020a056000178a00b0022a2c1df563mr19074572wrg.384.1663171571500; 
 Wed, 14 Sep 2022 09:06:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d5610000000b0021e43b4edf0sm14042547wrv.20.2022.09.14.09.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A71B31FFD0;
 Wed, 14 Sep 2022 16:59:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 25/30] tests/docker: update and flatten debian-amd64-cross
Date: Wed, 14 Sep 2022 16:59:45 +0100
Message-Id: <20220914155950.804707-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now lcitool has support for building a x86_64 cross image we can use
it for this.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-20-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml              |   1 -
 tests/docker/Makefile.include                 |   1 -
 .../dockerfiles/debian-amd64-cross.docker     | 178 ++++++++++++++++--
 tests/lcitool/refresh                         |   7 +
 4 files changed, 169 insertions(+), 18 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 091c0d8fcb..2d560e9764 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -7,7 +7,6 @@ alpha-debian-cross-container:
 amd64-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-amd64-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ddcc502049..a0f5109628 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -75,7 +75,6 @@ DOCKER_PARTIAL_IMAGES := debian10 debian11
 ifeq ($(HOST_ARCH),x86_64)
 DOCKER_PARTIAL_IMAGES += debian-amd64-cross
 else
-docker-image-debian-amd64-cross: docker-image-debian10
 DOCKER_PARTIAL_IMAGES += debian-amd64
 endif
 
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 870109ef6a..7d2feb7bf7 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -1,22 +1,168 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker x86_64 cross target
+#  $ lcitool dockerfile --layers all --cross x86_64 debian-11 qemu
 #
-# This docker target is used on non-x86_64 machines which need the
-# x86_64 cross compilers installed.
-#
-FROM qemu/debian10
-MAINTAINER Alex Bennée <alex.bennee@linaro.org>
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+            bash \
+            bc \
+            bsdextrautils \
+            bzip2 \
+            ca-certificates \
+            ccache \
+            dbus \
+            debianutils \
+            diffutils \
+            exuberant-ctags \
+            findutils \
+            gcovr \
+            genisoimage \
+            gettext \
+            git \
+            hostname \
+            libpcre2-dev \
+            libspice-protocol-dev \
+            llvm \
+            locales \
+            make \
+            meson \
+            ncat \
+            ninja-build \
+            openssh-client \
+            perl-base \
+            pkgconf \
+            python3 \
+            python3-numpy \
+            python3-opencv \
+            python3-pillow \
+            python3-pip \
+            python3-sphinx \
+            python3-sphinx-rtd-theme \
+            python3-venv \
+            python3-yaml \
+            rpm2cpio \
+            sed \
+            sparse \
+            tar \
+            tesseract-ocr \
+            tesseract-ocr-eng \
+            texinfo && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-# Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture amd64
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        crossbuild-essential-amd64
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a amd64 --arch-only qemu
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture amd64 && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+            g++-x86-64-linux-gnu \
+            gcc-x86-64-linux-gnu \
+            libaio-dev:amd64 \
+            libasan5:amd64 \
+            libasound2-dev:amd64 \
+            libattr1-dev:amd64 \
+            libbpf-dev:amd64 \
+            libbrlapi-dev:amd64 \
+            libbz2-dev:amd64 \
+            libc6-dev:amd64 \
+            libcacard-dev:amd64 \
+            libcap-ng-dev:amd64 \
+            libcapstone-dev:amd64 \
+            libcmocka-dev:amd64 \
+            libcurl4-gnutls-dev:amd64 \
+            libdaxctl-dev:amd64 \
+            libdrm-dev:amd64 \
+            libepoxy-dev:amd64 \
+            libfdt-dev:amd64 \
+            libffi-dev:amd64 \
+            libfuse3-dev:amd64 \
+            libgbm-dev:amd64 \
+            libgcrypt20-dev:amd64 \
+            libglib2.0-dev:amd64 \
+            libglusterfs-dev:amd64 \
+            libgnutls28-dev:amd64 \
+            libgtk-3-dev:amd64 \
+            libibumad-dev:amd64 \
+            libibverbs-dev:amd64 \
+            libiscsi-dev:amd64 \
+            libjemalloc-dev:amd64 \
+            libjpeg62-turbo-dev:amd64 \
+            libjson-c-dev:amd64 \
+            liblttng-ust-dev:amd64 \
+            liblzo2-dev:amd64 \
+            libncursesw5-dev:amd64 \
+            libnfs-dev:amd64 \
+            libnuma-dev:amd64 \
+            libpam0g-dev:amd64 \
+            libpixman-1-dev:amd64 \
+            libpmem-dev:amd64 \
+            libpng-dev:amd64 \
+            libpulse-dev:amd64 \
+            librbd-dev:amd64 \
+            librdmacm-dev:amd64 \
+            libsasl2-dev:amd64 \
+            libsdl2-dev:amd64 \
+            libsdl2-image-dev:amd64 \
+            libseccomp-dev:amd64 \
+            libselinux1-dev:amd64 \
+            libslirp-dev:amd64 \
+            libsnappy-dev:amd64 \
+            libspice-server-dev:amd64 \
+            libssh-gcrypt-dev:amd64 \
+            libsystemd-dev:amd64 \
+            libtasn1-6-dev:amd64 \
+            libubsan1:amd64 \
+            libudev-dev:amd64 \
+            liburing-dev:amd64 \
+            libusb-1.0-0-dev:amd64 \
+            libusbredirhost-dev:amd64 \
+            libvdeplug-dev:amd64 \
+            libvirglrenderer-dev:amd64 \
+            libvte-2.91-dev:amd64 \
+            libxen-dev:amd64 \
+            libzstd-dev:amd64 \
+            nettle-dev:amd64 \
+            systemtap-sdt-dev:amd64 \
+            xfslibs-dev:amd64 \
+            zlib1g-dev:amd64 && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    echo "[binaries]\n\
+c = '/usr/bin/x86_64-linux-gnu-gcc'\n\
+ar = '/usr/bin/x86_64-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/x86_64-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/x86_64-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'x86_64'\n\
+cpu = 'x86_64'\n\
+endian = 'little'" > /usr/local/share/meson/cross/x86_64-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-linux-gnu-gcc
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
+ENV ABI "x86_64-linux-gnu"
+ENV MESON_OPTS "--cross-file=x86_64-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-linux-gnu-
 ENV DEF_TARGET_LIST x86_64-softmmu,x86_64-linux-user,i386-softmmu,i386-linux-user
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 2a59150322..fc604d8a21 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -119,6 +119,13 @@ try:
     #
     # Cross compiling builds
     #
+    generate_dockerfile("debian-amd64-cross", "debian-11",
+                        cross="x86_64",
+                        trailer=debian_cross_build("x86_64-linux-gnu-",
+                                                   "x86_64-softmmu,"
+                                                   "x86_64-linux-user,"
+                                                   "i386-softmmu,i386-linux-user"))
+
     generate_dockerfile("debian-arm64-cross", "debian-11",
                         cross="aarch64",
                         trailer=debian_cross_build("aarch64-linux-gnu-",
-- 
2.34.1


