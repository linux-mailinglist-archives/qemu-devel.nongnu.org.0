Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697942CA978
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:23:44 +0100 (CET)
Received: from localhost ([::1]:53606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9NM-00012u-Dj
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9Ik-0004Ri-36
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:18:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9Ii-000257-6f
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606843131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UetW6JzgoHdPXT122Dxno5zPafevyCBtdh4WapSKVYc=;
 b=FLnnMTb+Fp7m2tebrZnDP5GUevtSnJMwgXb9T1F4647pWjfS6mwh9PLASfyY0dDIVOlQ9Z
 4Fp7bno7LCZw0AnvTkg2G8SBEe4atgPiB0O0CTJ3jPgVLGgcC+Ii/X783E+6XX9EqO0bA3
 CArj+vBCIv6rp+eud2gslW0r/4d/cr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-ZMXoJGC2Nw-ekT5GbqUGIg-1; Tue, 01 Dec 2020 12:18:47 -0500
X-MC-Unique: ZMXoJGC2Nw-ekT5GbqUGIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C13E6427C8;
 Tue,  1 Dec 2020 17:18:46 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 314B25D9C2;
 Tue,  1 Dec 2020 17:18:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/23] tests/docker: fix sorting in package lists
Date: Tue,  1 Dec 2020 17:18:09 +0000
Message-Id: <20201201171825.2243775-8-berrange@redhat.com>
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

This wil make diffs in later patches clearer.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/centos7.docker    | 4 ++--
 tests/docker/dockerfiles/fedora.docker     | 4 ++--
 tests/docker/dockerfiles/ubuntu1804.docker | 4 ++--
 tests/docker/dockerfiles/ubuntu2004.docker | 8 +++++---
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 35445becb8..4372e200d7 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -5,13 +5,14 @@ RUN yum -y update
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    SDL2-devel \
     bzip2 \
     bzip2-devel \
     ccache \
     csnappy-devel \
     dbus-daemon \
-    gcc-c++ \
     gcc \
+    gcc-c++ \
     gettext \
     git \
     glib2-devel \
@@ -32,7 +33,6 @@ ENV PACKAGES \
     perl-Test-Harness \
     pixman-devel \
     python3 \
-    SDL2-devel \
     spice-glib-devel \
     spice-server-devel \
     tar \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index d9b764aea2..03b88f1cfe 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -2,6 +2,7 @@ FROM registry.fedoraproject.org/fedora:32
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    SDL2-devel \
     bc \
     brlapi-devel \
     bzip2 \
@@ -74,10 +75,10 @@ ENV PACKAGES \
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
@@ -91,7 +92,6 @@ ENV PACKAGES \
     python3-sphinx \
     python3-virtualenv \
     rdma-core-devel \
-    SDL2-devel \
     snappy-devel \
     sparse \
     spice-server-devel \
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
index 552b57f903..2bb7e2ab1e 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,7 +1,9 @@
 FROM docker.io/library/ubuntu:20.04
-ENV PACKAGES flex bison \
+ENV PACKAGES \
+    bison \
     ccache \
     clang-10\
+    flex \
     gcc \
     genisoimage \
     gettext \
@@ -60,8 +62,8 @@ ENV PACKAGES flex bison \
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
2.28.0


