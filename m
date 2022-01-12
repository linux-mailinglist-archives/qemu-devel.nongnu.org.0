Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07D148C33D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:34:55 +0100 (CET)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7bu2-00030E-PB
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:34:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn4-0002eO-Ce
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:42 -0500
Received: from [2607:f8b0:4864:20::929] (port=42588
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn2-0003P6-ED
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:42 -0500
Received: by mail-ua1-x929.google.com with SMTP id p1so4063644uap.9
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3SEUvhH2k3bXiCX3jQVqzLtDpgP952xbxksksJlo+H4=;
 b=trGeMLPw+kCMdwD5u4GA3fzR819BqGHUO3sdOEV1jI7jhc0KqbmP+Gu+CkgLHakCSL
 qzkkCzzyOKSgf+lWqzDFtb/albvXCExyBpDkwZ1Jg+5zyubwCZngE2ERENRsLWHKEO8W
 uV0OSbPrck0BRixWaypOrbK5xILG264kbFg3Adlf49njc46CM+TBdpWH9b8RnhI5ZQ1v
 4pcsHcCo2hwEcspMA8lrt2uJ/THIReF3W8RFO7ksykrjA1q2X5DTfuvKXqhWk/1UqxJv
 M0IoeHF3qfgIayg1fqVCfY9rV3f4rM7unKwoSWQqPnMYs6Kz/lP6PPor2KLH7GvUYq5l
 AUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3SEUvhH2k3bXiCX3jQVqzLtDpgP952xbxksksJlo+H4=;
 b=r7mEQJ4rQX1XC27Qt14gBuOq76UX+68OzKjTdrOjqfN+2vZ/XuTHy0HvpfO+/8Tjwg
 x+UE+Tr2W2upRUjebtIJQibJ0bTiqSBSrQ3hbEONfQixN34KWtF4tj3BlkV8V6T+Lnmo
 YvwuicWrHM3WiJz6zbzPt3pVLk8SyE4UQAgzudvokSr4wuVtY+3Wrbbm+St3+/x9iQP9
 haSDCkeZwc4rGcIkVgWgkfHVObx0wtcooP6eoeq5gnNAx/Xv9NneIglmvIMsWMeryO6v
 TvRy4cBrbgv/vONVhu6m+9o30rHFSpwjymas5VZPW3XPYJ7zplFZWOADwqSa5XL9Kbki
 K1Zg==
X-Gm-Message-State: AOAM533yqdUHqcYSUMM0phWnIaXqYv57ZrYVlFSWHM1XBF+LJQxrekzj
 xyg9gejeoijAu0YD6z7ampC0nQ==
X-Google-Smtp-Source: ABdhPJxUkLgYJjwNM+I57k2tqRaJyEvaV6+Y/McfCseowgvKUdu80NUmn2F57sqNIn6d2UQtb3D7yw==
X-Received: by 2002:a05:6102:38d0:: with SMTP id
 k16mr1804876vst.46.1641986858818; 
 Wed, 12 Jan 2022 03:27:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u8sm8097836vsi.18.2022.01.12.03.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3925B1FFC2;
 Wed, 12 Jan 2022 11:27:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/31] tests/docker: auto-generate ubuntu1804.docker with
 lcitool
Date: Wed, 12 Jan 2022 11:27:01 +0000
Message-Id: <20220112112722.3641051-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x929.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This commit is best examined using the "-b" option to diff.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-11-berrange@redhat.com>
Message-Id: <20220105135009.1584676-11-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 450fd06d0d..0ffa3c4d4b 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -1,117 +1,146 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile ubuntu-1804 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
 FROM docker.io/library/ubuntu:18.04
-ENV PACKAGES \
-    bc \
-    bsdmainutils \
-    bzip2 \
-    ca-certificates \
-    ccache \
-    clang \
-    dbus \
-    debianutils \
-    diffutils \
-    exuberant-ctags \
-    findutils \
-    g++ \
-    gcc \
-    gcovr \
-    genisoimage \
-    gettext \
-    git \
-    glusterfs-common \
-    hostname \
-    libaio-dev \
-    libasan5 \
-    libasound2-dev \
-    libattr1-dev \
-    libbrlapi-dev \
-    libbz2-dev \
-    libc6-dev \
-    libcacard-dev \
-    libcap-ng-dev \
-    libcapstone-dev \
-    libcurl4-gnutls-dev \
-    libdaxctl-dev \
-    libdrm-dev \
-    libepoxy-dev \
-    libfdt-dev \
-    libffi-dev \
-    libgbm-dev \
-    libgcrypt20-dev \
-    libglib2.0-dev \
-    libgnutls28-dev \
-    libgtk-3-dev \
-    libibverbs-dev \
-    libiscsi-dev \
-    libjemalloc-dev \
-    libjpeg-turbo8-dev \
-    liblttng-ust-dev \
-    liblzo2-dev \
-    libncursesw5-dev \
-    libnfs-dev \
-    libnuma-dev \
-    libpam0g-dev \
-    libpixman-1-dev \
-    libpmem-dev \
-    libpng-dev \
-    libpulse-dev \
-    librbd-dev \
-    librdmacm-dev \
-    libsasl2-dev \
-    libsdl2-dev \
-    libsdl2-image-dev \
-    libseccomp-dev \
-    libselinux-dev \
-    libsnappy-dev \
-    libspice-protocol-dev \
-    libspice-server-dev \
-    libssh-dev \
-    libsystemd-dev \
-    libtasn1-6-dev \
-    libtest-harness-perl \
-    libubsan1 \
-    libudev-dev \
-    libusb-1.0-0-dev \
-    libusbredirhost-dev \
-    libvdeplug-dev \
-    libvirglrenderer-dev \
-    libvte-2.91-dev \
-    libxen-dev \
-    libxml2-dev \
-    libzstd-dev \
-    llvm \
-    locales \
-    make \
-    multipath-tools \
-    netcat-openbsd \
-    nettle-dev \
-    ninja-build \
-    openssh-client \
-    perl-base \
-    pkgconf \
-    python3 \
-    python3-numpy \
-    python3-opencv \
-    python3-pillow \
-    python3-pip \
-    python3-setuptools \
-    python3-sphinx \
-    python3-sphinx-rtd-theme \
-    python3-venv \
-    python3-wheel \
-    python3-yaml \
-    rpm2cpio \
-    sed \
-    sparse \
-    systemtap-sdt-dev \
-    tar \
-    tesseract-ocr \
-    tesseract-ocr-eng \
-    texinfo \
-    xfslibs-dev \
-    zlib1g-dev
-RUN apt-get update && \
-    DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
-RUN dpkg -l $PACKAGES | sort > /packages.txt
 
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+            bash \
+            bc \
+            bsdmainutils \
+            bzip2 \
+            ca-certificates \
+            ccache \
+            clang \
+            dbus \
+            debianutils \
+            diffutils \
+            exuberant-ctags \
+            findutils \
+            g++ \
+            gcc \
+            gcovr \
+            genisoimage \
+            gettext \
+            git \
+            glusterfs-common \
+            hostname \
+            libaio-dev \
+            libasan5 \
+            libasound2-dev \
+            libattr1-dev \
+            libbrlapi-dev \
+            libbz2-dev \
+            libc6-dev \
+            libcacard-dev \
+            libcap-ng-dev \
+            libcapstone-dev \
+            libcurl4-gnutls-dev \
+            libdaxctl-dev \
+            libdrm-dev \
+            libepoxy-dev \
+            libfdt-dev \
+            libffi-dev \
+            libgbm-dev \
+            libgcrypt20-dev \
+            libglib2.0-dev \
+            libgnutls28-dev \
+            libgtk-3-dev \
+            libibverbs-dev \
+            libiscsi-dev \
+            libjemalloc-dev \
+            libjpeg-turbo8-dev \
+            liblttng-ust-dev \
+            liblzo2-dev \
+            libncursesw5-dev \
+            libnfs-dev \
+            libnuma-dev \
+            libpam0g-dev \
+            libpcre2-dev \
+            libpixman-1-dev \
+            libpmem-dev \
+            libpng-dev \
+            libpulse-dev \
+            librbd-dev \
+            librdmacm-dev \
+            libsasl2-dev \
+            libsdl2-dev \
+            libsdl2-image-dev \
+            libseccomp-dev \
+            libselinux1-dev \
+            libsnappy-dev \
+            libspice-protocol-dev \
+            libspice-server-dev \
+            libssh-dev \
+            libsystemd-dev \
+            libtasn1-6-dev \
+            libtest-harness-perl \
+            libubsan1 \
+            libudev-dev \
+            libusb-1.0-0-dev \
+            libusbredirhost-dev \
+            libvdeplug-dev \
+            libvirglrenderer-dev \
+            libvte-2.91-dev \
+            libxen-dev \
+            libxml2-dev \
+            libzstd-dev \
+            llvm \
+            locales \
+            make \
+            multipath-tools \
+            netcat-openbsd \
+            nettle-dev \
+            ninja-build \
+            openssh-client \
+            perl-base \
+            pkgconf \
+            python3 \
+            python3-numpy \
+            python3-opencv \
+            python3-pillow \
+            python3-pip \
+            python3-setuptools \
+            python3-sphinx \
+            python3-sphinx-rtd-theme \
+            python3-venv \
+            python3-wheel \
+            python3-yaml \
+            rpm2cpio \
+            sed \
+            sparse \
+            systemtap-sdt-dev \
+            tar \
+            tesseract-ocr \
+            tesseract-ocr-eng \
+            texinfo \
+            xfslibs-dev \
+            zlib1g-dev && \
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
+RUN pip3 install \
+         meson==0.56.0
+
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 # https://bugs.launchpad.net/qemu/+bug/1838763
 ENV QEMU_CONFIGURE_OPTS --disable-libssh
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index d79d2b8c06..1e30674d67 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -60,9 +60,16 @@ def generate_dockerfile(host, target, cross=None, trailer=None):
    cmd.extend([target, "qemu"])
    generate(filename, cmd, trailer)
 
+ubuntu1804_skipssh = [
+   "# https://bugs.launchpad.net/qemu/+bug/1838763\n",
+   "ENV QEMU_CONFIGURE_OPTS --disable-libssh\n"
+]
+
 try:
    generate_dockerfile("centos8", "centos-8")
    generate_dockerfile("fedora", "fedora-35")
+   generate_dockerfile("ubuntu1804", "ubuntu-1804",
+                       trailer="".join(ubuntu1804_skipssh))
 
    sys.exit(0)
 except Exception as ex:
-- 
2.30.2


