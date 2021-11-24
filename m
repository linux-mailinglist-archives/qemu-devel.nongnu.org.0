Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE51445C0E1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:09:24 +0100 (CET)
Received: from localhost ([::1]:57808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mps1b-0000sq-3W
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:09:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprvW-0006Os-0T
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:03:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprvT-0005vy-Em
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637758982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkl6a9OPKocPqSXaQZH5gLgC00tV5yU/6F6cnMET9CY=;
 b=XmI45Xod1VX5R84iuIFQagnvGl62MG6DOTDVaLIFzqw5t4TL7Ap2fnFe7RCzTWQEQNu81z
 lgskF+NeNWiE9QiSw64x2INpu1A+EFupHGFRMd7909vWDHd1sa4XwEW/MRppD6Egmno76j
 YmL31//xeEaOsxOaWMURHKDyNCaByHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-11-2jIVx3eSPYy4biR5pm0xKA-1; Wed, 24 Nov 2021 08:02:59 -0500
X-MC-Unique: 2jIVx3eSPYy4biR5pm0xKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AD5684B9A1;
 Wed, 24 Nov 2021 13:02:58 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0A7279454;
 Wed, 24 Nov 2021 13:02:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/18] tests/docker: auto-generate ubuntu1804.docker with
 lcitool
Date: Wed, 24 Nov 2021 13:01:42 +0000
Message-Id: <20211124130150.268230-11-berrange@redhat.com>
In-Reply-To: <20211124130150.268230-1-berrange@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit is best examined using the "-b" option to diff.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 255 ++++++++++++---------
 tests/lcitool/refresh                      |   7 +
 2 files changed, 149 insertions(+), 113 deletions(-)

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
2.33.1


