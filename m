Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA06A5F43
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:08:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5K9-0002Q1-Rj; Tue, 28 Feb 2023 14:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jh-0002GS-Qw
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:15 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JT-0002on-8Y
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:05 -0500
Received: by mail-wr1-x429.google.com with SMTP id bv17so10875354wrb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kgpiyoiDnwYrQTKVCYiVzF8Lw6o6o1RMnLYNYIVbOdo=;
 b=L8O4qAodJWW2ALBRwums7l1EiF40LMicMk3fVml0WVhh2v+ATIjs+nGyS1y4S+n1xc
 aYmHsgwZWQLRHwu39qu4cUaU2+zpeCH54pDK7yS8ynbGH+Oxd8bDeXjcRmk07vBXtHhT
 BlTAx2tlmNneFN3T/uT2GFKqzR3TYZlObnJ4XUep1Fde7WaSgPTWV1hrxnBKqySc1BVM
 jkSXGHcIr+Wb6TDFjWDb2TLSaNpdBMEZUsLRsUs9UmZMabwN2JHS7wcT6vlQS/ibOc/B
 Y31a/67tKVR0BwJ616Toyv/aLQ+FstV1XiG5GuCfSy98LGELrxoMFiB67/wlnYTaSubG
 1g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kgpiyoiDnwYrQTKVCYiVzF8Lw6o6o1RMnLYNYIVbOdo=;
 b=tV1clB4On++vW7Djwv7Tn31SXLWNxd9WfLzA75cffKB3+nfZYbXaMB73QS2cT+wwwC
 tfR6sMkI9BJ7wCOMqLOKSlpJRktHHo07aoBmoVADTLTonOKivdgq5sWT0PGHlP+Tfgp+
 vCKaJhsXbnLXkcEDdBd0r027SLIlITcFeq3b5pXuC0HmOMBfDc7K4NpCWKOgQcf0mNvC
 A35eYAqN+Gg4zfS1YWeCWkdjkdj0Vl6nIZUR6DpPpMy25jGrHVsioQobjJz1HxCgIsfC
 pTGRcexgVewmIDueb+1TRmaSS9/ZYbSFJBEfiZYInKyXTkTDcNbp7Zt7UZdWp2rioR+V
 qADA==
X-Gm-Message-State: AO0yUKVgl/y8FW8l5mnyga58kth6O61VRGwoOivGdQ6amvKSKUtuYRhz
 slTekJY6oJSKsL4qIypQOMUueA==
X-Google-Smtp-Source: AK7set9DVYuI70q7fZpcmlxRfpn3hyfgbU+I//nI3cDojAyBQBF8ofPMFzhcox9RPD2DeFGtzdrv3A==
X-Received: by 2002:adf:f48b:0:b0:2c7:1dae:ad78 with SMTP id
 l11-20020adff48b000000b002c71daead78mr2583305wro.64.1677611217747; 
 Tue, 28 Feb 2023 11:06:57 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b10-20020adfee8a000000b002c54c8e70b1sm11052279wro.9.2023.02.28.11.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 403E91FFB8;
 Tue, 28 Feb 2023 19:06:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 08/24] testing: update ubuntu2004 to ubuntu2204
Date: Tue, 28 Feb 2023 19:06:37 +0000
Message-Id: <20230228190653.1602033-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

The 22.04 LTS release has been out for almost a year now so its time
to update all the remaining images to the current LTS. We can also
drop some hacks we need for older clang TSAN support.

We will keep the ubuntu2004 container around for those who wish to
test builds on the currently still supported baseline.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230221094558.2864616-10-alex.bennee@linaro.org>
---
 docs/devel/testing.rst                     |   4 +-
 .gitlab-ci.d/buildtest.yml                 |  18 +--
 .gitlab-ci.d/containers.yml                |   4 +-
 tests/docker/dockerfiles/ubuntu2004.docker |   3 -
 tests/docker/dockerfiles/ubuntu2204.docker | 147 +++++++++++++++++++++
 tests/docker/test-tsan                     |   2 +-
 tests/lcitool/refresh                      |  11 +-
 7 files changed, 163 insertions(+), 26 deletions(-)
 create mode 100644 tests/docker/dockerfiles/ubuntu2204.docker

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index e10c47b5a7..309a575abe 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -574,13 +574,13 @@ https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual
 
 Thread Sanitizer in Docker
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-TSan is currently supported in the ubuntu2004 docker.
+TSan is currently supported in the ubuntu2204 docker.
 
 The test-tsan test will build using TSan and then run make check.
 
 .. code::
 
-  make docker-test-tsan@ubuntu2004
+  make docker-test-tsan@ubuntu2204
 
 TSan warnings under docker are placed in files located at build/tsan/.
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 7b92767689..43f9e4a81d 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -38,9 +38,9 @@ avocado-system-alpine:
 build-system-ubuntu:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-docs
     TARGETS: alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
@@ -56,7 +56,7 @@ check-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     MAKE_CHECK_ARGS: check
 
 avocado-system-ubuntu:
@@ -65,7 +65,7 @@ avocado-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     MAKE_CHECK_ARGS: check-avocado
 
 build-system-debian:
@@ -457,10 +457,10 @@ avocado-cfi-x86_64:
 tsan-build:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
+    IMAGE: ubuntu2204
+    CONFIGURE_ARGS: --enable-tsan --cc=clang --cxx=clang++
           --enable-trace-backends=ust --disable-slirp
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
 
@@ -468,10 +468,10 @@ tsan-build:
 gcov:
   extends: .native_build_job_template
   needs:
-    job: amd64-ubuntu2004-container
+    job: amd64-ubuntu2204-container
   timeout: 80m
   variables:
-    IMAGE: ubuntu2004
+    IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-gcov
     TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
     MAKE_CHECK_ARGS: check
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 96d2a3b58b..8637a13d86 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -13,10 +13,10 @@ amd64-debian-container:
   variables:
     NAME: debian-amd64
 
-amd64-ubuntu2004-container:
+amd64-ubuntu2204-container:
   extends: .container_job_template
   variables:
-    NAME: ubuntu2004
+    NAME: ubuntu2204
 
 amd64-opensuse-leap-container:
   extends: .container_job_template
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index f34d88d33d..75233064de 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -146,6 +146,3 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
-# Apply patch https://reviews.llvm.org/D75820
-# This is required for TSan in clang-10 to compile with QEMU.
-RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
new file mode 100644
index 0000000000..30b9e56793
--- /dev/null
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -0,0 +1,147 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all ubuntu-2204 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/ubuntu:22.04
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
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
+                      libsndio-dev \
+                      libspice-protocol-dev \
+                      libspice-server-dev \
+                      libssh-dev \
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
+                      socat \
+                      sparse \
+                      systemtap-sdt-dev \
+                      tar \
+                      tesseract-ocr \
+                      tesseract-ocr-eng \
+                      xfslibs-dev \
+                      zlib1g-dev && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
diff --git a/tests/docker/test-tsan b/tests/docker/test-tsan
index 53d90d2f79..f6d6590e39 100755
--- a/tests/docker/test-tsan
+++ b/tests/docker/test-tsan
@@ -21,7 +21,7 @@ setup_tsan()
     tsan_log_dir="/tmp/qemu-test/build/tsan"
     mkdir -p $tsan_log_dir > /dev/null || true
     EXTRA_CONFIGURE_OPTS="${EXTRA_CONFIGURE_OPTS} --enable-tsan \
-                          --cc=clang-10 --cxx=clang++-10 \
+                          --cc=clang --cxx=clang++ \
                           --disable-werror --extra-cflags=-O0"
     # detect deadlocks is false currently simply because
     # TSan crashes immediately with deadlock detector enabled.
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index a5ea0efc3b..cc9e34ac87 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -69,13 +69,6 @@ def generate_cirrus(target, trailer=None):
     generate(filename, cmd, trailer)
 
 
-ubuntu2004_tsanhack = [
-    "# Apply patch https://reviews.llvm.org/D75820\n",
-    "# This is required for TSan in clang-10 to compile with QEMU.\n",
-    "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"
-]
-
-
 # Netmap still needs to be manually built as it is yet to be packaged
 # into a distro. We also add cscope and gtags which are used in the CI
 # test
@@ -113,8 +106,8 @@ try:
                         trailer="".join(debian11_extras))
     generate_dockerfile("fedora", "fedora-37")
     generate_dockerfile("opensuse-leap", "opensuse-leap-153")
-    generate_dockerfile("ubuntu2004", "ubuntu-2004",
-                        trailer="".join(ubuntu2004_tsanhack))
+    generate_dockerfile("ubuntu2004", "ubuntu-2004")
+    generate_dockerfile("ubuntu2204", "ubuntu-2204")
 
     #
     # Cross compiling builds
-- 
2.39.2


