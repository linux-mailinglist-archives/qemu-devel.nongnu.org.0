Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E4837F522
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 11:58:16 +0200 (CEST)
Received: from localhost ([::1]:48890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh86h-0001UM-CC
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 05:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh84V-00071Z-UF
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh84T-0006nz-R6
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620899756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fHiZtNIUfcuxWe6ngAmOWiSSUkBcdrRmg32a9D+FY0=;
 b=K3tyTvNgP2fS6aac3y71Y4/AWh9GFbIJCtzvC8/zjAoOIs5I7pn7RurCXJeJmrh4l5Ph7b
 PcD/xdPimC6YiiDrVGSNpWgWNC0341HYIDeuGAwkjQgjMADjvDrrt8e457pasv63KaZTa4
 MPKwogTjdK/JdHpEf9XhoQwj2MXo/TI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-eifnIHbrMCCrbpy0L3TnDw-1; Thu, 13 May 2021 05:55:55 -0400
X-MC-Unique: eifnIHbrMCCrbpy0L3TnDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3DD0801817;
 Thu, 13 May 2021 09:55:53 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8847310027A5;
 Thu, 13 May 2021 09:55:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/22] tests/docker: fix sorting in package lists
Date: Thu, 13 May 2021 10:55:03 +0100
Message-Id: <20210513095519.1213675-7-berrange@redhat.com>
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

This will make diffs in later patches clearer.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/centos8.docker       |  2 +-
 tests/docker/dockerfiles/fedora.docker        |  4 ++--
 tests/docker/dockerfiles/opensuse-leap.docker | 16 ++++++++--------
 tests/docker/dockerfiles/ubuntu1804.docker    |  4 ++--
 tests/docker/dockerfiles/ubuntu2004.docker    |  8 +++++---
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 4f77c754e2..f1023d1cec 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -21,9 +21,9 @@ ENV PACKAGES \
     lzo-devel \
     make \
     mesa-libEGL-devel \
-    nmap-ncat \
     nettle-devel \
     ninja-build \
+    nmap-ncat \
     perl-Test-Harness \
     pixman-devel \
     python36 \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index fee33a84d1..6528b57a2f 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -2,6 +2,7 @@ FROM registry.fedoraproject.org/fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    SDL2-devel \
     bc \
     brlapi-devel \
     bzip2 \
@@ -77,10 +78,10 @@ ENV PACKAGES \
     mingw64-pixman \
     mingw64-pkg-config \
     mingw64-SDL2 \
-    nmap-ncat \
     ncurses-devel \
     nettle-devel \
     ninja-build \
+    nmap-ncat \
     numactl-devel \
     perl \
     perl-Test-Harness \
@@ -94,7 +95,6 @@ ENV PACKAGES \
     python3-sphinx \
     python3-virtualenv \
     rdma-core-devel \
-    SDL2-devel \
     snappy-devel \
     sparse \
     spice-server-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index e7dc14bf99..ed194125a7 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -8,46 +8,46 @@ ENV PACKAGES \
     cyrus-sasl-devel \
     gcc \
     gcc-c++ \
-    mkisofs \
     gettext-runtime \
     git \
     glib2-devel \
     glusterfs-devel \
-    libgnutls-devel \
     gtk3-devel \
+    libSDL2-devel \
+    libSDL2_image-devel \
     libaio-devel \
     libattr-devel \
     libcap-ng-devel \
     libepoxy-devel \
     libfdt-devel \
+    libgnutls-devel \
     libiscsi-devel \
     libjpeg8-devel \
+    libnuma-devel \
+    libpixman-1-0-devel \
     libpmem-devel \
     libpng16-devel \
     librbd-devel \
     libseccomp-devel \
+    libspice-server-devel \
     libssh-devel \
     lzo-devel \
     make \
-    libSDL2_image-devel \
+    mkisofs \
     ncurses-devel \
     ninja \
-    libnuma-devel \
     perl \
-    libpixman-1-0-devel \
     python3-base \
     python3-virtualenv \
     rdma-core-devel \
-    libSDL2-devel \
     snappy-devel \
-    libspice-server-devel \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
     usbredir-devel \
     virglrenderer-devel \
-    xen-devel \
     vte-devel \
+    xen-devel \
     zlib-devel
 ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
 
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 3534111637..58a373e205 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -45,9 +45,9 @@ ENV PACKAGES \
     libxen-dev \
     libzstd-dev \
     make \
-    python3-yaml \
-    python3-sphinx \
     ninja-build \
+    python3-sphinx \
+    python3-yaml \
     sparse \
     xfslibs-dev
 RUN apt-get update && \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 1f3dbd3b91..5044f4d9b7 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,8 +1,10 @@
 FROM docker.io/library/ubuntu:20.04
-ENV PACKAGES flex bison \
+ENV PACKAGES \
+    bison \
     bsdmainutils \
     ccache \
     clang-10\
+    flex \
     gcc \
     gcovr \
     genisoimage \
@@ -63,8 +65,8 @@ ENV PACKAGES flex bison \
     sparse \
     tesseract-ocr \
     tesseract-ocr-eng \
-    xfslibs-dev\
-    vim
+    vim \
+    xfslibs-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
-- 
2.31.1


