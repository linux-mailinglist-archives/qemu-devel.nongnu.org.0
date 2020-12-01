Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD7C2CA9E8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:42:01 +0100 (CET)
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9f6-00037N-3H
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9JC-0004tp-8K
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9JA-00028D-1b
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606843159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuCCFjUtW8GeDmsCQ6uezC6WhYl4tw5GCx6xjMY8iSQ=;
 b=CHy6046v5ZHKOCc8roW2yMJVqEBgMB/aQ/Mqi9ZQf64ZPK2UlJMDLkkCFkR9WQ6r+4sbLc
 DOrrArv/j528rLZ8pN1Lxi0YV4tCGvJT8WbRURbBhCdJ1HobONS6n63amrRUMka7UNUnOI
 gQy3NtEakWucnKjpo1m7gjFjLIgqQBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-jK5izRhUN4KEPziQTD-qUQ-1; Tue, 01 Dec 2020 12:19:16 -0500
X-MC-Unique: jK5izRhUN4KEPziQTD-qUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46FB21005E45;
 Tue,  1 Dec 2020 17:19:15 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F21075D9C2;
 Tue,  1 Dec 2020 17:19:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/23] tests/docker: auto-generate centos8 with lcitool
Date: Tue,  1 Dec 2020 17:18:21 +0000
Message-Id: <20201201171825.2243775-20-berrange@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 tests/docker/dockerfiles/centos7.docker |   2 +-
 tests/docker/dockerfiles/centos8.docker | 216 +++++++++++++-----------
 tests/docker/dockerfiles/refresh        |   1 +
 3 files changed, 120 insertions(+), 99 deletions(-)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 2bdb268076..97e06bbc65 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -2,7 +2,7 @@
 #
 #  $ lcitool dockerfile centos-7 qemu
 #
-# https://gitlab.com/berrange/libvirt-ci/-/commit/5ae4c04258978fae40be7113ac33587d71fe3c4f
+# https://gitlab.com/libvirt/libvirt-ci/-/commit/5ae4c04258978fae40be7113ac33587d71fe3c4f
 
 FROM registry.centos.org/centos:7
 
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 96b231ee18..7c8b2194ff 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,101 +1,121 @@
+# THIS FILE IS AUTO-GENERATED
+#
+#  $ lcitool dockerfile centos-8 qemu
+#
+# https://gitlab.com/berrange/libvirt-ci/-/commit/5ae4c04258978fae40be7113ac33587d71fe3c4f
+
 FROM registry.centos.org/centos:8
 
-RUN dnf -y update
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
-    dbus-daemon \
-    device-mapper-multipath-devel \
-    diffutils \
-    findutils \
-    gcc \
-    gcc-c++ \
-    genisoimage \
-    gettext \
-    git \
-    glib2-devel \
-    glibc-langpack-en \
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
-    librbd-devel \
-    libseccomp-devel \
-    libslirp-devel \
-    libssh-devel \
-    libtasn1-devel \
-    libubsan \
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
-    spice-protocol \
-    spice-server-devel \
-    systemd-devel \
-    systemtap-sdt-devel \
-    tar \
-    texinfo \
-    usbredir-devel \
-    vim-minimal \
-    virglrenderer-devel \
-    vte291-devel \
-    which \
-    xfsprogs-devel \
-    zlib-devel
+RUN dnf install 'dnf-command(config-manager)' -y && \
+    dnf config-manager --set-enabled -y PowerTools && \
+    dnf install -y centos-release-advanced-virtualization && \
+    dnf install -y epel-release && \
+    dnf update -y && \
+    dnf install -y \
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
+        dbus-daemon \
+        device-mapper-multipath-devel \
+        diffutils \
+        findutils \
+        gcc \
+        gcc-c++ \
+        genisoimage \
+        gettext \
+        git \
+        glib2-devel \
+        glibc-langpack-en \
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
+        librbd-devel \
+        libseccomp-devel \
+        libslirp-devel \
+        libssh-devel \
+        libtasn1-devel \
+        libubsan \
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
+        spice-protocol \
+        spice-server-devel \
+        systemd-devel \
+        systemtap-sdt-devel \
+        tar \
+        texinfo \
+        usbredir-devel \
+        vim-minimal \
+        virglrenderer-devel \
+        vte291-devel \
+        which \
+        xfsprogs-devel \
+        zlib-devel && \
+    dnf autoremove -y && \
+    dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)
+
+RUN pip3 install \
+         meson==0.54.0
 
-RUN dnf install -y dnf-plugins-core && \
-  dnf config-manager --set-enabled PowerTools && \
-  dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/docker/dockerfiles/refresh b/tests/docker/dockerfiles/refresh
index a6f0adee81..90030117b0 100755
--- a/tests/docker/dockerfiles/refresh
+++ b/tests/docker/dockerfiles/refresh
@@ -49,5 +49,6 @@ def generate_image(filename, host, cross=None, trailer=None):
 
 try:
    generate_image("centos7.docker", "centos-7")
+   generate_image("centos8.docker", "centos-8")
 except Exception as ex:
    print(str(ex), file=sys.stderr)
-- 
2.28.0


