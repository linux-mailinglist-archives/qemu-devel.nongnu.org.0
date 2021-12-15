Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144AA475AA8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:31:10 +0100 (CET)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVJE-0001FN-Jg
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:31:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxV92-0001UV-6A
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:20:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxV8q-0001EW-Uz
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639578021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OXgOaq/Yf6CDCcw4jDKdRSltF1R8pnxiBqeSni54oVc=;
 b=Z/9O72Gb104V59BcdVHcVspWcPZfvGeFz/gyw49XpMv2GxtACute4cVOz0xd1+RDFVLN1N
 F/QLty/ZKUAPdg0RVd1uCxYU3UzTjodyaU7jrpd1Ij+z+cmqBUHoPSZiesAoVI+TpiLNow
 +jmSTLF2NUFW+XjgOmWXE4Fv2j34IQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-Ynlcvmh9NYSxVwvGtyq-EA-1; Wed, 15 Dec 2021 09:20:18 -0500
X-MC-Unique: Ynlcvmh9NYSxVwvGtyq-EA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45E691853039;
 Wed, 15 Dec 2021 14:20:17 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.22.8.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92CF1101E59B;
 Wed, 15 Dec 2021 14:20:14 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/18] tests/docker: auto-generate fedora.docker with
 lcitool
Date: Wed, 15 Dec 2021 14:19:40 +0000
Message-Id: <20211215141949.3512719-10-berrange@redhat.com>
In-Reply-To: <20211215141949.3512719-1-berrange@redhat.com>
References: <20211215141949.3512719-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit is best examined using the "-b" option to diff.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/fedora.docker | 260 ++++++++++++++-----------
 tests/lcitool/refresh                  |   1 +
 2 files changed, 146 insertions(+), 115 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 855aefaac5..6784878b56 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,118 +1,148 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile fedora-35 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
 FROM registry.fedoraproject.org/fedora:35
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    SDL2-devel \
-    SDL2_image-devel \
-    alsa-lib-devel \
-    bc \
-    brlapi-devel \
-    bzip2 \
-    bzip2-devel \
-    ca-certificates \
-    capstone-devel \
-    ccache \
-    clang \
-    ctags \
-    cyrus-sasl-devel \
-    daxctl-devel \
-    dbus-daemon \
-    device-mapper-multipath-devel \
-    diffutils \
-    findutils \
-    gcc \
-    gcc-c++ \
-    gcovr \
-    genisoimage \
-    gettext \
-    git \
-    glib2-devel \
-    glibc-langpack-en \
-    glibc-static \
-    glusterfs-api-devel \
-    gnutls-devel \
-    gtk3-devel \
-    hostname \
-    jemalloc-devel \
-    libaio-devel \
-    libasan \
-    libattr-devel \
-    libbpf-devel \
-    libcacard-devel \
-    libcap-ng-devel \
-    libcurl-devel \
-    libdrm-devel \
-    libepoxy-devel \
-    libfdt-devel \
-    libffi-devel \
-    libgcrypt-devel \
-    libiscsi-devel \
-    libjpeg-devel \
-    libnfs-devel \
-    libpmem-devel \
-    libpng-devel \
-    librbd-devel \
-    libseccomp-devel \
-    libselinux-devel \
-    libslirp-devel \
-    libssh-devel \
-    libtasn1-devel \
-    libubsan \
-    libudev-devel \
-    liburing-devel \
-    libusbx-devel \
-    libxml2-devel \
-    libzstd-devel \
-    llvm \
-    lttng-ust-devel \
-    lzo-devel \
-    make \
-    mesa-libgbm-devel \
-    meson \
-    ncurses-devel \
-    nettle-devel \
-    ninja-build \
-    nmap-ncat \
-    numactl-devel \
-    openssh-clients \
-    pam-devel \
-    perl-Test-Harness \
-    perl-base \
-    pixman-devel \
-    pkgconfig \
-    pulseaudio-libs-devel \
-    python3 \
-    python3-PyYAML \
-    python3-numpy \
-    python3-opencv \
-    python3-pillow \
-    python3-pip \
-    python3-sphinx \
-    python3-sphinx_rtd_theme \
-    python3-virtualenv \
-    rdma-core-devel \
-    rpm \
-    sed \
-    snappy-devel \
-    sparse \
-    spice-protocol \
-    spice-server-devel \
-    systemd-devel \
-    systemtap-sdt-devel \
-    tar \
-    tesseract \
-    tesseract-langpack-eng \
-    texinfo \
-    usbredir-devel \
-    util-linux \
-    virglrenderer-devel \
-    vte291-devel \
-    which \
-    xen-devel \
-    xfsprogs-devel \
-    zlib-devel
-ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3
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
+        SDL2-devel \
+        SDL2_image-devel \
+        alsa-lib-devel \
+        bash \
+        bc \
+        brlapi-devel \
+        bzip2 \
+        bzip2-devel \
+        ca-certificates \
+        capstone-devel \
+        ccache \
+        clang \
+        ctags \
+        cyrus-sasl-devel \
+        daxctl-devel \
+        dbus-daemon \
+        device-mapper-multipath-devel \
+        diffutils \
+        findutils \
+        gcc \
+        gcc-c++ \
+        gcovr \
+        genisoimage \
+        gettext \
+        git \
+        glib2-devel \
+        glib2-static \
+        glibc-langpack-en \
+        glibc-static \
+        glusterfs-api-devel \
+        gnutls-devel \
+        gtk3-devel \
+        hostname \
+        jemalloc-devel \
+        libaio-devel \
+        libasan \
+        libattr-devel \
+        libbpf-devel \
+        libcacard-devel \
+        libcap-ng-devel \
+        libcurl-devel \
+        libdrm-devel \
+        libepoxy-devel \
+        libfdt-devel \
+        libffi-devel \
+        libgcrypt-devel \
+        libiscsi-devel \
+        libjpeg-devel \
+        libnfs-devel \
+        libpmem-devel \
+        libpng-devel \
+        librbd-devel \
+        libseccomp-devel \
+        libselinux-devel \
+        libslirp-devel \
+        libssh-devel \
+        libtasn1-devel \
+        libubsan \
+        libudev-devel \
+        liburing-devel \
+        libusbx-devel \
+        libxml2-devel \
+        libzstd-devel \
+        llvm \
+        lttng-ust-devel \
+        lzo-devel \
+        make \
+        mesa-libgbm-devel \
+        meson \
+        ncurses-devel \
+        nettle-devel \
+        ninja-build \
+        nmap-ncat \
+        numactl-devel \
+        openssh-clients \
+        pam-devel \
+        pcre-static \
+        perl-Test-Harness \
+        perl-base \
+        pixman-devel \
+        pkgconfig \
+        pulseaudio-libs-devel \
+        python3 \
+        python3-PyYAML \
+        python3-numpy \
+        python3-opencv \
+        python3-pillow \
+        python3-pip \
+        python3-sphinx \
+        python3-sphinx_rtd_theme \
+        python3-virtualenv \
+        rdma-core-devel \
+        rpm \
+        sed \
+        snappy-devel \
+        sparse \
+        spice-protocol \
+        spice-server-devel \
+        systemd-devel \
+        systemtap-sdt-devel \
+        tar \
+        tesseract \
+        tesseract-langpack-eng \
+        texinfo \
+        usbredir-devel \
+        util-linux \
+        virglrenderer-devel \
+        vte291-devel \
+        which \
+        xen-devel \
+        xfsprogs-devel \
+        zlib-devel \
+        zlib-static && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
-ENV PATH $PATH:/usr/libexec/python3-sphinx/
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 824b1c0ef2..d79d2b8c06 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -62,6 +62,7 @@ def generate_dockerfile(host, target, cross=None, trailer=None):
 
 try:
    generate_dockerfile("centos8", "centos-8")
+   generate_dockerfile("fedora", "fedora-35")
 
    sys.exit(0)
 except Exception as ex:
-- 
2.33.1


