Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB52CA988
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:26:19 +0100 (CET)
Received: from localhost ([::1]:33812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9Pt-0004dM-W1
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9Il-0004SE-V5
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:18:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9Ii-000259-6L
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606843131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCTFTRTZypDcNN9I4Mq4/81YhoIsBnVvp4XLUhGJvlU=;
 b=du4Sn7SWhdSzz9wklVHhrniDRZAeIKv5nHhBrhJhfzmG/5kcfZc5sIoB1Avb+l+X4cklE1
 bj2fP2Y0T6Cs+0mmMiW3Pzv31h2lQriMCszMqAdmDr8WQTd+yH0KUao1ZQdAnHAXnRCs+q
 nverNVn8zF1fLNk3xi1VixkUNOAOXpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-QfC-HKxgOgiFljGKkNyYhw-1; Tue, 01 Dec 2020 12:18:50 -0500
X-MC-Unique: QfC-HKxgOgiFljGKkNyYhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C423D858186;
 Tue,  1 Dec 2020 17:18:48 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 244255D9C2;
 Tue,  1 Dec 2020 17:18:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/23] tests/docker: fix mistakes in centos package lists
Date: Tue,  1 Dec 2020 17:18:10 +0000
Message-Id: <20201201171825.2243775-9-berrange@redhat.com>
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
index 4372e200d7..f3ef2cf8d8 100644
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
index 9560bb06e2..1d10b8c263 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -18,16 +18,16 @@ ENV PACKAGES \
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
2.28.0


