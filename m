Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C43B1C80
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:30:17 +0200 (CEST)
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3tQ-0006wJ-BT
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3nE-0001X1-Fe
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:23:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3n9-0006XD-PR
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624458227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/PpYWPhDEANV9pVW+Wm5OID/sdySZEnrb/hk3Ee/18=;
 b=ZyfqAneeFPdoZNZ9RYmfESBIF7slkfT/tvFRH3Z6V2vpS+cQW64tfpr1qIfaaA/QGTgazb
 5uGYnYG5u4gZg+eipzWhgPFiEZ5ldnJsD3YlgbjOwoWHicwMnjQQb20ek+xvt/tieRNge1
 4FKosa2LPqYA8UosdzpTkvaKAg4BFP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-SUKPAAvgP9KIh7grh06YRw-1; Wed, 23 Jun 2021 10:23:45 -0400
X-MC-Unique: SUKPAAvgP9KIh7grh06YRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A56B5100C660;
 Wed, 23 Jun 2021 14:23:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-176.ams2.redhat.com
 [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FC6C60854;
 Wed, 23 Jun 2021 14:23:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/22] tests/docker: fix mistakes in ubuntu package lists
Date: Wed, 23 Jun 2021 15:22:32 +0100
Message-Id: <20210623142245.307776-10-berrange@redhat.com>
In-Reply-To: <20210623142245.307776-1-berrange@redhat.com>
References: <20210623142245.307776-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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

librados-dev is not required by QEMU directly, only librbd-dev.

glusterfs-common is not directly needed by QEMU.

QEMU uses ncursesw only on non-Windows hosts.

The clang package is clang 10.

flex and bison are not required by QEMU.

Standardize on nmap ncat implementation to match Fedora/CentOS.

Remove vim since it is not a build pre-requisite and no other containers
include it.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/ubuntu1804.docker |  3 ---
 tests/docker/dockerfiles/ubuntu2004.docker | 10 ++--------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index a50a35e6fe..ee8545e4b1 100644
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
@@ -24,12 +23,10 @@ ENV PACKAGES \
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
index eee2ef3cac..25f56adfb2 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,16 +1,13 @@
 FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
-    bison \
     bsdmainutils \
     ccache \
-    clang-10\
-    flex \
+    clang \
     gcc \
     gcovr \
     genisoimage \
     gettext \
     git \
-    glusterfs-common \
     libaio-dev \
     libattr1-dev \
     libbrlapi-dev \
@@ -30,12 +27,10 @@ ENV PACKAGES \
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
@@ -53,7 +48,7 @@ ENV PACKAGES \
     libxen-dev \
     libzstd-dev \
     make \
-    netcat-openbsd \
+    ncat \
     ninja-build \
     python3-numpy \
     python3-opencv \
@@ -67,7 +62,6 @@ ENV PACKAGES \
     sparse \
     tesseract-ocr \
     tesseract-ocr-eng \
-    vim \
     xfslibs-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
-- 
2.31.1


