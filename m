Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B72CA9AD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:32:00 +0100 (CET)
Received: from localhost ([::1]:42938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9VP-0000Dg-Br
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9JA-0004oP-1y
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:19:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9J8-000282-2R
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606843157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4ontcMxSBjBrxbZmxfa5P2XACqY+Z3NhHwELotpzLM=;
 b=d5ltUAZHmg17N9gKEl+xz6Ix3kcMv8Qmu1UH2reJdjoSzBjR+CEr1vyh8VFjOKZzC9n+a8
 ykUkLEs4b2La6GysQAmbTHr4ZrM5mzgC4kpX7Tnc4RJBRDdCbgVxAW3pVqeCmltOGJT+3R
 BrnNW8LwFnNJkS79OY/eMpFFft9m3IA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-AuFYt2zfP4qwhhnC2sQG1A-1; Tue, 01 Dec 2020 12:19:15 -0500
X-MC-Unique: AuFYt2zfP4qwhhnC2sQG1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F3AE858182;
 Tue,  1 Dec 2020 17:19:13 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E4BB5D9C2;
 Tue,  1 Dec 2020 17:19:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/23] tests/docker: auto-generate centos7 with lcitool
Date: Tue,  1 Dec 2020 17:18:20 +0000
Message-Id: <20201201171825.2243775-19-berrange@redhat.com>
In-Reply-To: <20201201171825.2243775-1-berrange@redhat.com>
References: <20201201171825.2243775-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit is best examined using the "-b" option to diff.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/centos7.docker | 213 +++++++++++++-----------
 tests/docker/dockerfiles/refresh        |   2 +-
 2 files changed, 117 insertions(+), 98 deletions(-)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 8750395bbe..2bdb268076 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -1,100 +1,119 @@
+# THIS FILE IS AUTO-GENERATED
+#
+#  $ lcitool dockerfile centos-7 qemu
+#
+# https://gitlab.com/berrange/libvirt-ci/-/commit/5ae4c04258978fae40be7113ac33587d71fe3c4f
+
 FROM registry.centos.org/centos:7
-RUN yum install -y epel-release centos-release-xen-48
 
-RUN yum -y update
+RUN echo 'skip_missing_names_on_install=0' >> /etc/yum.conf && \
+    yum install -y epel-release && \
+    yum install -y centos-release-xen-48 && \
+    yum update -y && \
+    yum install -y \
+        SDL2-devel \
+        alsa-lib-devel \
+        bc \
+        brlapi-devel \
+        bzip2 \
+        bzip2-devel \
+        ca-certificates \
+        capstone-devel \
+        ccache \
+        clang \
+        cyrus-sasl-devel \
+        daxctl-devel \
+        dbus \
+        device-mapper-multipath-devel \
+        diffutils \
+        findutils \
+        gcc \
+        gcc-c++ \
+        genisoimage \
+        gettext \
+        git \
+        glib2-devel \
+        glibc-common \
+        glusterfs-api-devel \
+        gnutls-devel \
+        gtk3-devel \
+        hostname \
+        libaio-devel \
+        libasan \
+        libattr-devel \
+        libcacard-devel \
+        libcap-ng-devel \
+        libcurl-devel \
+        libdrm-devel \
+        libepoxy-devel \
+        libfdt-devel \
+        libgcrypt-devel \
+        libiscsi-devel \
+        libjpeg-devel \
+        libnfs-devel \
+        libpmem-devel \
+        libpng-devel \
+        librbd1-devel \
+        libseccomp-devel \
+        libssh-devel \
+        libtasn1-devel \
+        libudev-devel \
+        libusbx-devel \
+        libxml2-devel \
+        libzstd-devel \
+        lzo-devel \
+        make \
+        mesa-libgbm-devel \
+        ncurses-devel \
+        nettle-devel \
+        ninja-build \
+        nmap-ncat \
+        numactl-devel \
+        openssh-clients \
+        pam-devel \
+        perl \
+        perl-Test-Harness \
+        pixman-devel \
+        pkgconfig \
+        pulseaudio-libs-devel \
+        python3 \
+        python3-PyYAML \
+        python3-numpy \
+        python3-pillow \
+        python3-pip \
+        python3-setuptools \
+        python3-sphinx \
+        python3-virtualenv \
+        python3-wheel \
+        rdma-core-devel \
+        rpm \
+        snappy-devel \
+        sparse \
+        spice-protocol \
+        spice-server-devel \
+        systemd-devel \
+        systemtap-sdt-devel \
+        tar \
+        texinfo \
+        usbredir-devel \
+        vim-minimal \
+        vte291-devel \
+        which \
+        xen-devel \
+        xfsprogs-devel \
+        zlib-devel && \
+    yum autoremove -y && \
+    yum clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)
+
+RUN pip3 install \
+         meson==0.54.0
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    SDL2-devel \
-    alsa-lib-devel \
-    bc \
-    brlapi-devel \
-    bzip2 \
-    bzip2-devel \
-    ca-certificates \
-    capstone-devel \
-    ccache \
-    clang \
-    cyrus-sasl-devel \
-    daxctl-devel \
-    dbus \
-    device-mapper-multipath-devel \
-    diffutils \
-    findutils \
-    gcc \
-    gcc-c++ \
-    genisoimage \
-    gettext \
-    git \
-    glib2-devel \
-    glibc-common \
-    glusterfs-api-devel \
-    gnutls-devel \
-    gtk3-devel \
-    hostname \
-    libaio-devel \
-    libasan \
-    libattr-devel \
-    libcacard-devel \
-    libcap-ng-devel \
-    libcurl-devel \
-    libdrm-devel \
-    libepoxy-devel \
-    libfdt-devel \
-    libgcrypt-devel \
-    libiscsi-devel \
-    libjpeg-devel \
-    libnfs-devel \
-    libpmem-devel \
-    libpng-devel \
-    librbd1-devel \
-    libseccomp-devel \
-    libssh-devel \
-    libtasn1-devel \
-    libudev-devel \
-    libusbx-devel \
-    libxml2-devel \
-    libzstd-devel \
-    lzo-devel \
-    make \
-    mesa-libgbm-devel \
-    ncurses-devel \
-    nettle-devel \
-    ninja-build \
-    nmap-ncat \
-    numactl-devel \
-    openssh-clients \
-    pam-devel \
-    perl \
-    perl-Test-Harness \
-    pixman-devel \
-    pkgconfig \
-    pulseaudio-libs-devel \
-    python3 \
-    python3-PyYAML \
-    python3-numpy \
-    python3-pillow \
-    python3-pip \
-    python3-setuptools \
-    python3-sphinx \
-    python3-virtualenv \
-    python3-wheel \
-    rdma-core-devel \
-    rpm \
-    snappy-devel \
-    sparse \
-    spice-protocol \
-    spice-server-devel \
-    systemd-devel \
-    systemtap-sdt-devel \
-    tar \
-    texinfo \
-    usbredir-devel \
-    vim-minimal \
-    vte291-devel \
-    which \
-    xen-devel \
-    xfsprogs-devel \
-    zlib-devel
-RUN yum install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja-build"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/docker/dockerfiles/refresh b/tests/docker/dockerfiles/refresh
index b1d99963e9..a6f0adee81 100755
--- a/tests/docker/dockerfiles/refresh
+++ b/tests/docker/dockerfiles/refresh
@@ -48,6 +48,6 @@ def generate_image(filename, host, cross=None, trailer=None):
    atomic_write(filename, content)
 
 try:
-   pass
+   generate_image("centos7.docker", "centos-7")
 except Exception as ex:
    print(str(ex), file=sys.stderr)
-- 
2.28.0


