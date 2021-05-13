Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F3337F59B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:29:39 +0200 (CEST)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8b4-0007Ih-AY
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh85f-00016t-KD
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:57:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh85Y-0007PA-9z
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620899823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wymWCrAHL10lCTlo9jG+KupAZOApZWdvu/jN6s18zc=;
 b=FN6hchAngetkvAYqijgmrGWMdT75XAQc5yxtKraZV2tB9eIRefMHt0uT/r/k/Vr6juXE9d
 WAxmPAiW1nDBn99j5Azf2h+/s6ScrBk7JE6eGDqhcQhKl1Q1tNJtZa86Z0C2xX9/9B0jHv
 bRLd4K4hQ/VEuVYTP07NpZsB6nEM7v0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-cpW1JLRKMnaE-MWVUTaPJw-1; Thu, 13 May 2021 05:56:59 -0400
X-MC-Unique: cpW1JLRKMnaE-MWVUTaPJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 416B41005D4E;
 Thu, 13 May 2021 09:56:58 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C61A810016F4;
 Thu, 13 May 2021 09:56:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/22] tests/docker: auto-generate opensuse-leap with
 lcitool
Date: Thu, 13 May 2021 10:55:18 +0100
Message-Id: <20210513095519.1213675-22-berrange@redhat.com>
In-Reply-To: <20210513095519.1213675-1-berrange@redhat.com>
References: <20210513095519.1213675-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit is best examined using the "-b" option to diff.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles-refresh.py           |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker | 233 ++++++++++--------
 2 files changed, 127 insertions(+), 107 deletions(-)

diff --git a/tests/docker/dockerfiles-refresh.py b/tests/docker/dockerfiles-refresh.py
index df2dfc60e8..ba37f38383 100755
--- a/tests/docker/dockerfiles-refresh.py
+++ b/tests/docker/dockerfiles-refresh.py
@@ -65,5 +65,6 @@ def generate_image(filename, host, cross=None, trailer=None):
                "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"]
    generate_image("ubuntu2004.docker", "ubuntu-2004",
                   trailer="".join(tsanhack))
+   generate_image("opensuse-leap.docker", "opensuse-leap-152")
 except Exception as ex:
    print(str(ex), file=sys.stderr)
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 0f67296a8f..b405267e81 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,110 +1,129 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile opensuse-leap-152 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci/-/commit/1c5d87ecd2283614a8b0c31cead0b6d7883afd28
+
 FROM registry.opensuse.org/opensuse/leap:15.2
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    Mesa-devel \
-    alsa-lib-devel \
-    bc \
-    brlapi-devel \
-    bzip2 \
-    ca-certificates \
-    ccache \
-    clang \
-    ctags \
-    cyrus-sasl-devel \
-    dbus-1 \
-    diffutils \
-    findutils \
-    gcc \
-    gcc-c++ \
-    gcovr \
-    gettext-runtime \
-    git \
-    glib2-devel \
-    glibc-locale \
-    glibc-static \
-    glusterfs-devel \
-    gtk3-devel \
-    hostname \
-    jemalloc-devel \
-    libSDL2-devel \
-    libSDL2_image-devel \
-    libaio-devel \
-    libasan6 \
-    libattr-devel \
-    libbz2-devel \
-    libcacard-devel \
-    libcap-ng-devel \
-    libcurl-devel \
-    libdrm-devel \
-    libepoxy-devel \
-    libfdt-devel \
-    libgcrypt-devel \
-    libgnutls-devel \
-    libiscsi-devel \
-    libjpeg8-devel \
-    libndctl-devel \
-    libnettle-devel \
-    libnfs-devel \
-    libnuma-devel \
-    libpixman-1-0-devel \
-    libpmem-devel \
-    libpng16-devel \
-    libpulse-devel \
-    librbd-devel \
-    libseccomp-devel \
-    libspice-server-devel \
-    libssh-devel \
-    libtasn1-devel \
-    libubsan1 \
-    libudev-devel \
-    libusb-1_0-devel \
-    libxml2-devel \
-    libzstd-devel \
-    llvm \
-    lttng-ust-devel \
-    lzo-devel \
-    make \
-    mkisofs \
-    ncat \
-    ncurses-devel \
-    ninja \
-    openssh \
-    pam-devel \
-    perl-Test-Harness \
-    perl-base \
-    pkgconfig \
-    python3-Pillow \
-    python3-PyYAML \
-    python3-Sphinx \
-    python3-base \
-    python3-numpy \
-    python3-opencv \
-    python3-pip \
-    python3-setuptools \
-    python3-virtualenv \
-    python3-wheel \
-    rdma-core-devel \
-    rpm \
-    sed \
-    snappy-devel \
-    sparse \
-    spice-protocol-devel \
-    systemd-devel \
-    systemtap-sdt-devel \
-    tar \
-    tesseract-ocr \
-    tesseract-ocr-traineddata-english \
-    texinfo \
-    usbredir-devel \
-    util-linux \
-    virglrenderer-devel \
-    vte-devel \
-    which \
-    xen-devel \
-    xfsprogs-devel \
-    zlib-devel
-ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
+RUN zypper update -y && \
+    zypper install -y \
+           Mesa-devel \
+           alsa-lib-devel \
+           bc \
+           brlapi-devel \
+           bzip2 \
+           ca-certificates \
+           ccache \
+           clang \
+           ctags \
+           cyrus-sasl-devel \
+           dbus-1 \
+           diffutils \
+           findutils \
+           gcc \
+           gcc-c++ \
+           gcovr \
+           gettext-runtime \
+           git \
+           glib2-devel \
+           glibc-locale \
+           glibc-static \
+           glusterfs-devel \
+           gtk3-devel \
+           hostname \
+           jemalloc-devel \
+           libSDL2-devel \
+           libSDL2_image-devel \
+           libaio-devel \
+           libasan6 \
+           libattr-devel \
+           libbz2-devel \
+           libcacard-devel \
+           libcap-ng-devel \
+           libcurl-devel \
+           libdrm-devel \
+           libepoxy-devel \
+           libfdt-devel \
+           libgcrypt-devel \
+           libgnutls-devel \
+           libiscsi-devel \
+           libjpeg8-devel \
+           libndctl-devel \
+           libnettle-devel \
+           libnfs-devel \
+           libnuma-devel \
+           libpixman-1-0-devel \
+           libpmem-devel \
+           libpng16-devel \
+           libpulse-devel \
+           librbd-devel \
+           libseccomp-devel \
+           libspice-server-devel \
+           libssh-devel \
+           libtasn1-devel \
+           libubsan1 \
+           libudev-devel \
+           libusb-1_0-devel \
+           libxml2-devel \
+           libzstd-devel \
+           llvm \
+           lttng-ust-devel \
+           lzo-devel \
+           make \
+           mkisofs \
+           ncat \
+           ncurses-devel \
+           ninja \
+           openssh \
+           pam-devel \
+           perl-Test-Harness \
+           perl-base \
+           pkgconfig \
+           python3-Pillow \
+           python3-PyYAML \
+           python3-Sphinx \
+           python3-base \
+           python3-numpy \
+           python3-opencv \
+           python3-pip \
+           python3-setuptools \
+           python3-virtualenv \
+           python3-wheel \
+           rdma-core-devel \
+           rpm \
+           sed \
+           snappy-devel \
+           sparse \
+           spice-protocol-devel \
+           systemd-devel \
+           systemtap-sdt-devel \
+           tar \
+           tesseract-ocr \
+           tesseract-ocr-traineddata-english \
+           texinfo \
+           usbredir-devel \
+           util-linux \
+           virglrenderer-devel \
+           vte-devel \
+           which \
+           xen-devel \
+           xfsprogs-devel \
+           zlib-devel && \
+    zypper clean --all && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
+RUN pip3 install \
+         meson==0.56.0
 
-RUN zypper update -y && zypper --non-interactive install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
-- 
2.31.1


