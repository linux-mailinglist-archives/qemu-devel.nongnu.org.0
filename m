Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D52F6191
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:10:09 +0100 (CET)
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02O8-00076P-8L
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02HS-0001Ns-BL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02HO-0007yz-PL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yq1iTyMAJSkctdABXRtlCAxPYIUIWDs2X/OCm1/I0Ps=;
 b=HlrQWeYDScNYzd/HC4F113R2DOV5GcWr8LwaaLPASlv/vaX8ssemOxrcMxrGiLfhCgIeCk
 vK/K6DHyr7WqlRpV1H1fzqNQJGJ7naRDKIIk++V5SI8Gu5lBV7g7ff+qpEavMUeTSz+9ti
 eJWm0H70ybUYclSsyoI+w88wRf5n38o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-sH2oDTdaOQ2KzxczS31dUw-1; Thu, 14 Jan 2021 08:03:06 -0500
X-MC-Unique: sH2oDTdaOQ2KzxczS31dUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A08E1005D4F;
 Thu, 14 Jan 2021 13:03:05 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-77.ams2.redhat.com
 [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB8A85F9B5;
 Thu, 14 Jan 2021 13:03:03 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/25] tests/docker: fix mistakes in centos package lists
Date: Thu, 14 Jan 2021 13:02:28 +0000
Message-Id: <20210114130245.1654081-9-berrange@redhat.com>
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

dbus-daemon doesn't exist in centos7, it is part of dbus.

snappy is used by QEMU, not csnappy.

mesa-libEGL-devel is not used in QEMU at all, but mesa-libgbm-devel is.

vte291-devel is required for GTK3, not vte-devel.

spice-glib-devel is not use in QEMU at all, but spice-protocol is.

librdmacm-devel is a virtual provides for compat, the actual package
used is rdma-core-devel.

There is no need to specifically refer to python36, we can just
use python3 as in other distros.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/centos7.docker | 11 +++++------
 tests/docker/dockerfiles/centos8.docker | 10 +++++-----
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index b2a4719284..1eb3455144 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -9,8 +9,7 @@ ENV PACKAGES \
     bzip2 \
     bzip2-devel \
     ccache \
-    csnappy-devel \
-    dbus-daemon \
+    dbus \
     gcc \
     gcc-c++ \
     gettext \
@@ -22,21 +21,21 @@ ENV PACKAGES \
     libepoxy-devel \
     libfdt-devel \
     libgcrypt-devel \
-    librdmacm-devel \
     libzstd-devel \
     lzo-devel \
     make \
-    mesa-libEGL-devel \
     mesa-libgbm-devel \
     nettle-devel \
     ninja-build \
     perl-Test-Harness \
     pixman-devel \
     python3 \
-    spice-glib-devel \
+    rdma-core-devel \
+    snappy-devel \
+    spice-protocol \
     spice-server-devel \
     tar \
-    vte-devel \
+    vte291-devel \
     xen-devel \
     zlib-devel
 RUN yum install -y $PACKAGES
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index a95350466a..b64ee7071d 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -19,16 +19,16 @@ ENV PACKAGES \
     libgcrypt-devel \
     lzo-devel \
     make \
-    mesa-libEGL-devel \
-    nmap-ncat \
+    mesa-libgbm-devel \
     nettle-devel \
     ninja-build \
+    nmap-ncat \
     perl-Test-Harness \
     pixman-devel \
-    python36 \
+    python3 \
     rdma-core-devel \
-    spice-glib-devel \
-    spice-server \
+    spice-protocol \
+    spice-server-devel \
     tar \
     zlib-devel
 
-- 
2.29.2


