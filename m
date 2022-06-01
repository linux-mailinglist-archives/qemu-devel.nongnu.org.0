Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E64053AC8D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:13:35 +0200 (CEST)
Received: from localhost ([::1]:34560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSqc-0006iR-MH
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjG-00010h-0h
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:58 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjD-0004yF-ML
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:57 -0400
Received: by mail-ej1-x62a.google.com with SMTP id q21so5405098ejm.1
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ecc3mXE6mp8N/4GPnB4052TSKmG288rQCUrww9LGKCw=;
 b=pUp7NmB/xOpNq+oYxq0Pzd7r3f4zPvoc61YZAR4Jd7zrJhFIosv9QwL8nfI42YUhon
 r8UGSySE5imtYjwKtj8g3cvbFlquY3qhwd/pwfUp3xYvTzH7B/PVqqEGEOJddprScGI5
 CTkcGoADFkL7rNWOOnz0n0UPJ4eqnMQe74fbvt3SepiutZFVYZjUdfrIvVDEFekzp4vb
 dlVA32fAjWXvEUIG8ZR8y/ZMXxlXAq14+LFbXhrD4iLX0gV7vY53M7gpVfkRbi66GkET
 Fzy/AQGExfMMl0bGBsYPO36liQMtdx4n3zpJgQA+RzKZ6K/MlIRX+ZNbJVcVftm/T5cS
 cFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ecc3mXE6mp8N/4GPnB4052TSKmG288rQCUrww9LGKCw=;
 b=JhgvihtX+eDivRD3MDscFnrnLgQKAd+58KrjJ8Ad4sdTWdWw88FCP2mWLzqDZGAeu8
 gKYwXGc/T+6SujsCg8KZOEzDurCWtkmGx7fE40d3wgdfQYc9DhbNn8aLSkqPkIv44rCo
 b9w4EcvPILlkul+hNV/HWRwoCZ9zUS+LRqr5OApMAsCXlWKUP4sQEMkPBKc5FHFxiPHO
 r9zB9sRLn84ThZB32EX4o1GSZvS/hcYsERzVeAT1L8lhpwoYXP620V5SzldYzkxr86WM
 PjYn2An1RT/NDVoDHqcTaJ/38fiEm+bBWMJ+UYNDkFSjk8Xol4UMGDBFYJkL/04bIGIJ
 Y30Q==
X-Gm-Message-State: AOAM5311XXnYKC3XC7Dfim2ZUNXa6rXhiSZU20QJeuVtpt+EW5RVpdZE
 P3XV46CZ3BgWVXLs1tIHut++og==
X-Google-Smtp-Source: ABdhPJyfkunjv979cuJn00yT8j5i7ek/NoYnpsvjCj6aEWY4liDhlooqFbH+EoTRr+94SLE+NrZrYw==
X-Received: by 2002:a17:907:1b1c:b0:6fe:f1a9:ef5a with SMTP id
 mp28-20020a1709071b1c00b006fef1a9ef5amr679851ejc.233.1654106754258; 
 Wed, 01 Jun 2022 11:05:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a056402048b00b0042ab02e3485sm1296731edv.44.2022.06.01.11.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C5F81FFC0;
 Wed,  1 Jun 2022 19:05:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 08/33] tests/docker: update debian-mipsel-cross with lcitool
Date: Wed,  1 Jun 2022 19:05:12 +0100
Message-Id: <20220601180537.2329566-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

Use lcitool to update debian-mipsel-cross to a Debian 11 based system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220527153603.887929-9-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index caef7decf4..1a533e6fc0 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -102,8 +102,7 @@ mips-debian-cross-container:
 
 mipsel-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  stage: containers
   variables:
     NAME: debian-mipsel-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index d9109bcc77..0ac5975419 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -94,7 +94,6 @@ docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
 docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-mips64el-cross: docker-image-debian10
-docker-image-debian-mipsel-cross: docker-image-debian10
 docker-image-debian-ppc64el-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 0e5dd42d3c..b6d99ae324 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -1,31 +1,162 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker mipsel cross-compiler target
+#  $ lcitool dockerfile --layers all --cross mipsel debian-11 qemu
 #
-# This docker target builds on the debian Stretch base image.
-#
-FROM qemu/debian10
+# https://gitlab.com/libvirt/libvirt-ci
 
-MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
+FROM docker.io/library/debian:11-slim
 
-# Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture mipsel
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        gcc-mipsel-linux-gnu
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
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a mipsel --arch-only qemu
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=mipsel-linux-gnu-
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture mipsel && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+            g++-mipsel-linux-gnu \
+            gcc-mipsel-linux-gnu \
+            libaio-dev:mipsel \
+            libasound2-dev:mipsel \
+            libattr1-dev:mipsel \
+            libbpf-dev:mipsel \
+            libbrlapi-dev:mipsel \
+            libbz2-dev:mipsel \
+            libc6-dev:mipsel \
+            libcacard-dev:mipsel \
+            libcap-ng-dev:mipsel \
+            libcapstone-dev:mipsel \
+            libcurl4-gnutls-dev:mipsel \
+            libdaxctl-dev:mipsel \
+            libdrm-dev:mipsel \
+            libepoxy-dev:mipsel \
+            libfdt-dev:mipsel \
+            libffi-dev:mipsel \
+            libfuse3-dev:mipsel \
+            libgbm-dev:mipsel \
+            libgcrypt20-dev:mipsel \
+            libglib2.0-dev:mipsel \
+            libglusterfs-dev:mipsel \
+            libgnutls28-dev:mipsel \
+            libgtk-3-dev:mipsel \
+            libibumad-dev:mipsel \
+            libibverbs-dev:mipsel \
+            libiscsi-dev:mipsel \
+            libjemalloc-dev:mipsel \
+            libjpeg62-turbo-dev:mipsel \
+            liblttng-ust-dev:mipsel \
+            liblzo2-dev:mipsel \
+            libncursesw5-dev:mipsel \
+            libnfs-dev:mipsel \
+            libnuma-dev:mipsel \
+            libpam0g-dev:mipsel \
+            libpixman-1-dev:mipsel \
+            libpng-dev:mipsel \
+            libpulse-dev:mipsel \
+            librbd-dev:mipsel \
+            librdmacm-dev:mipsel \
+            libsasl2-dev:mipsel \
+            libsdl2-dev:mipsel \
+            libsdl2-image-dev:mipsel \
+            libseccomp-dev:mipsel \
+            libselinux1-dev:mipsel \
+            libslirp-dev:mipsel \
+            libsnappy-dev:mipsel \
+            libspice-server-dev:mipsel \
+            libssh-gcrypt-dev:mipsel \
+            libsystemd-dev:mipsel \
+            libtasn1-6-dev:mipsel \
+            libudev-dev:mipsel \
+            liburing-dev:mipsel \
+            libusb-1.0-0-dev:mipsel \
+            libusbredirhost-dev:mipsel \
+            libvdeplug-dev:mipsel \
+            libvirglrenderer-dev:mipsel \
+            libvte-2.91-dev:mipsel \
+            libzstd-dev:mipsel \
+            nettle-dev:mipsel \
+            systemtap-sdt-dev:mipsel \
+            xfslibs-dev:mipsel \
+            zlib1g-dev:mipsel && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    echo "[binaries]\n\
+c = '/usr/bin/mipsel-linux-gnu-gcc'\n\
+ar = '/usr/bin/mipsel-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/mipsel-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/mipsel-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'mips'\n\
+cpu = 'mipsel'\n\
+endian = 'little'" > /usr/local/share/meson/cross/mipsel-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mipsel-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mipsel-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mipsel-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mipsel-linux-gnu-gcc
 
-# Install extra libraries to increase code coverage
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libbz2-dev:mipsel \
-        liblzo2-dev:mipsel \
-        librdmacm-dev:mipsel \
-        libsnappy-dev:mipsel
+ENV ABI "mipsel-linux-gnu"
+ENV MESON_OPTS "--cross-file=mipsel-linux-gnu"
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=mipsel-linux-gnu-
+ENV DEF_TARGET_LIST mipsel-softmmu,mipsel-linux-user
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 4dc5527234..a4b7452189 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -115,6 +115,11 @@ try:
                         trailer=debian_cross_build("arm-linux-gnueabihf-",
                                                    "arm-softmmu,arm-linux-user"))
 
+    generate_dockerfile("debian-mipsel-cross", "debian-11",
+                        cross="mipsel",
+                        trailer=debian_cross_build("mipsel-linux-gnu-",
+                                                   "mipsel-softmmu,mipsel-linux-user"))
+
     generate_dockerfile("debian-s390x-cross", "debian-11",
                         cross="s390x",
                         trailer=debian_cross_build("s390x-linux-gnu-",
-- 
2.30.2


