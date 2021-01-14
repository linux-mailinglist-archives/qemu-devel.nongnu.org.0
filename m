Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51512F61AE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:17:59 +0100 (CET)
Received: from localhost ([::1]:43456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02Vi-0006hx-WE
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02Hu-00025L-Ko
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02Hs-0008BE-C3
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=plgZQlamVAOwaLo1sWpq1oJzjeZNkifi4j2P530m8MM=;
 b=JNiAE/h66zjK6o/YUrrnnMyJZQjbvjZyOgdCHLlrecuepeofo8SnBNbMelbwGzRv1COaKS
 uqDTHdbMnAWwjvA87p4LKu/N/AHepibNk1mR9K7olsYOpNoBkgim8oa8lovk11Ac4HNz9k
 KdIrys44GBNJf7GcR901AgWkdIKKdWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-pBMGV625PP-XyNiKe03fpQ-1; Thu, 14 Jan 2021 08:03:37 -0500
X-MC-Unique: pBMGV625PP-XyNiKe03fpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84DE3180A09E;
 Thu, 14 Jan 2021 13:03:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-77.ams2.redhat.com
 [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7D165F708;
 Thu, 14 Jan 2021 13:03:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/25] tests/docker: auto-generate ubuntu2004 with lcitool
Date: Thu, 14 Jan 2021 13:02:43 +0000
Message-Id: <20210114130245.1654081-24-berrange@redhat.com>
In-Reply-To: <20210114130245.1654081-1-berrange@redhat.com>
References: <20210114130245.1654081-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit is best examined using the "-b" option to diff.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/refresh           |   6 +
 tests/docker/dockerfiles/ubuntu2004.docker | 237 +++++++++++----------
 2 files changed, 136 insertions(+), 107 deletions(-)

diff --git a/tests/docker/dockerfiles/refresh b/tests/docker/dockerfiles/refresh
index ab1d00fcf8..658a57c28c 100755
--- a/tests/docker/dockerfiles/refresh
+++ b/tests/docker/dockerfiles/refresh
@@ -57,5 +57,11 @@ try:
 
    generate_image("ubuntu1804.docker", "ubuntu-1804",
                   trailer="".join(skipssh))
+
+   tsanhack = ["# Apply patch https://reviews.llvm.org/D75820\n",
+               "# This is required for TSan in clang-10 to compile with QEMU.\n",
+               "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"]
+   generate_image("ubuntu2004.docker", "ubuntu-2004",
+                  trailer="".join(tsanhack))
 except Exception as ex:
    print(str(ex), file=sys.stderr)
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 27ff46d2e4..6db8393b35 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,112 +1,135 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile ubuntu-2004 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci/-/commit/945dce80da3ebde4033bcf2bd4763ea472118fc9
 FROM docker.io/library/ubuntu:20.04
-ENV PACKAGES \
-    bc \
-    bzip2 \
-    ca-certificates \
-    ccache \
-    clang \
-    dbus \
-    debianutils \
-    diffutils \
-    findutils \
-    g++ \
-    gcc \
-    genisoimage \
-    gettext \
-    git \
-    hostname \
-    libaio-dev \
-    libasan5 \
-    libasound2-dev \
-    libattr1-dev \
-    libbrlapi-dev \
-    libbz2-dev \
-    libcacard-dev \
-    libcap-ng-dev \
-    libcapstone-dev \
-    libcurl4-gnutls-dev \
-    libdaxctl-dev \
-    libdrm-dev \
-    libepoxy-dev \
-    libfdt-dev \
-    libgbm-dev \
-    libgcrypt20-dev \
-    libglib2.0-dev \
-    libglusterfs-dev \
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
-    libslirp-dev \
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
-    locales \
-    make \
-    multipath-tools \
-    ncat \
-    nettle-dev \
-    ninja-build \
-    openssh-client \
-    perl \
-    pkgconf \
-    python3 \
-    python3-numpy \
-    python3-opencv \
-    python3-pil \
-    python3-pip \
-    python3-setuptools \
-    python3-sphinx \
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
-    vim-nox \
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
+            bc \
+            bzip2 \
+            ca-certificates \
+            ccache \
+            clang \
+            dbus \
+            debianutils \
+            diffutils \
+            findutils \
+            g++ \
+            gcc \
+            genisoimage \
+            gettext \
+            git \
+            hostname \
+            libaio-dev \
+            libasan5 \
+            libasound2-dev \
+            libattr1-dev \
+            libbrlapi-dev \
+            libbz2-dev \
+            libcacard-dev \
+            libcap-ng-dev \
+            libcapstone-dev \
+            libcurl4-gnutls-dev \
+            libdaxctl-dev \
+            libdrm-dev \
+            libepoxy-dev \
+            libfdt-dev \
+            libgbm-dev \
+            libgcrypt20-dev \
+            libglib2.0-dev \
+            libglusterfs-dev \
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
+            libslirp-dev \
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
+            locales \
+            make \
+            multipath-tools \
+            ncat \
+            nettle-dev \
+            ninja-build \
+            openssh-client \
+            perl \
+            pkgconf \
+            python3 \
+            python3-numpy \
+            python3-opencv \
+            python3-pil \
+            python3-pip \
+            python3-setuptools \
+            python3-sphinx \
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
+            vim-nox \
+            xfslibs-dev \
+            zlib1g-dev && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)
+
+RUN pip3 install \
+         meson==0.54.0
+
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 # Apply patch https://reviews.llvm.org/D75820
 # This is required for TSan in clang-10 to compile with QEMU.
 RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h
-- 
2.29.2


