Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7671C2F6190
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:10:08 +0100 (CET)
Received: from localhost ([::1]:54840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02O7-00076m-Gh
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02HV-0001UJ-FW
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02HQ-0007zz-Ng
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCwxzgKxVpp/vV/1gXS6NYWl1xBQ8crLNv1x4mZnyEU=;
 b=UCd46NORWDBifTLL6frVTF7xfgGf/A+SERJU76UPZXueEBrnjlihKcyWJseSDf43XJMTK1
 A2V0u4T813xNDtaY0t7aSQOq/naP/YgJ6LAWLeCWyYHTyV6Lwa0019NVFwF/VpyIbAGhhn
 OsSfpxoSfbWQB6x46q0Cd+HJVcYij+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-Ur2a-OfRNqyElUeoNYzqXw-1; Thu, 14 Jan 2021 08:03:10 -0500
X-MC-Unique: Ur2a-OfRNqyElUeoNYzqXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2363F1005D4D;
 Thu, 14 Jan 2021 13:03:09 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-77.ams2.redhat.com
 [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F6A25C276;
 Thu, 14 Jan 2021 13:03:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/25] tests/docker: fix mistakes in ubuntu package lists
Date: Thu, 14 Jan 2021 13:02:30 +0000
Message-Id: <20210114130245.1654081-11-berrange@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

librados-dev is not required by QEMU directly, only librbd-dev.

glusterfs-common is not directly needed by QEMU.

QEMU uses ncursesw only on non-Windows hosts.

The clang package is clang 10.

flex and bison are not required by QEMU.

Standardize on nmap ncat implementation to match Fedora/CentOS.

vim-nox is preferred over vim as it is smaller and graphics aren't
needed in containers.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/ubuntu1804.docker |  3 ---
 tests/docker/dockerfiles/ubuntu2004.docker | 11 +++--------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 58a373e205..f063cfe921 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -5,7 +5,6 @@ ENV PACKAGES \
     gcc \
     gettext \
     git \
-    glusterfs-common \
     libaio-dev \
     libattr1-dev \
     libbrlapi-dev \
@@ -23,12 +22,10 @@ ENV PACKAGES \
     libjemalloc-dev \
     libjpeg-turbo8-dev \
     liblzo2-dev \
-    libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
     libnuma-dev \
     libpixman-1-dev \
-    librados-dev \
     librbd-dev \
     librdmacm-dev \
     libsasl2-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 2bb7e2ab1e..84c617354c 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,14 +1,11 @@
 FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
-    bison \
     ccache \
-    clang-10\
-    flex \
+    clang \
     gcc \
     genisoimage \
     gettext \
     git \
-    glusterfs-common \
     libaio-dev \
     libattr1-dev \
     libbrlapi-dev \
@@ -27,12 +24,10 @@ ENV PACKAGES \
     libjpeg-turbo8-dev \
     liblttng-ust-dev \
     liblzo2-dev \
-    libncurses5-dev \
     libncursesw5-dev \
     libnfs-dev \
     libnuma-dev \
     libpixman-1-dev \
-    librados-dev \
     librbd-dev \
     librdmacm-dev \
     libsasl2-dev \
@@ -49,7 +44,7 @@ ENV PACKAGES \
     libxen-dev \
     libzstd-dev \
     make \
-    netcat-openbsd \
+    ncat \
     ninja-build \
     python3-numpy \
     python3-opencv \
@@ -62,7 +57,7 @@ ENV PACKAGES \
     sparse \
     tesseract-ocr \
     tesseract-ocr-eng \
-    vim \
+    vim-nox \
     xfslibs-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
-- 
2.29.2


