Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5E3713C2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:47:57 +0200 (CEST)
Received: from localhost ([::1]:59122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldW7I-0005I2-Um
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4Z-0003e2-3A
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4X-0003M1-F6
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620038704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50nK3eQJeYnjGF/obTurUMSfugLrcaikTvfgKjpL2yc=;
 b=RdYtabHAWNqwMqNkIyrRY/zGt5uYixXPorPW5wBcv4meAJvsUaSQMch+7VaQ6BNbIZbvrq
 b6/zGqMnQUrCTwRZBJBKwRnAkm7InRBV3Fmp35/zxpXklMDL9VPrpR9i5VSNfNWyn0UQzB
 UdULwpDQ/F0ehxR8cNAq0TePXXp3Pag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-q0T6-_tKMf2ZNmD873TBug-1; Mon, 03 May 2021 06:45:02 -0400
X-MC-Unique: q0T6-_tKMf2ZNmD873TBug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85C0C512A;
 Mon,  3 May 2021 10:45:01 +0000 (UTC)
Received: from thuth.com (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D593E5D9D5;
 Mon,  3 May 2021 10:45:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/10] tests/docker/dockerfiles: Add ccache to containers where
 it was missing
Date: Mon,  3 May 2021 12:44:48 +0200
Message-Id: <20210503104456.1036472-3-thuth@redhat.com>
In-Reply-To: <20210503104456.1036472-1-thuth@redhat.com>
References: <20210503104456.1036472-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make sure that ccache is available in all containers.

Message-Id: <20210414081907.871437-2-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker             | 1 +
 tests/docker/dockerfiles/fedora-i386-cross.docker  | 1 +
 tests/docker/dockerfiles/fedora-win32-cross.docker | 1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
 tests/docker/dockerfiles/opensuse-leap.docker      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index d63a269aef..a1ef408a6a 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -9,6 +9,7 @@ ENV PACKAGES \
 	alsa-lib-dev \
 	bash \
 	binutils \
+	ccache \
 	coreutils \
 	curl-dev \
 	g++ \
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 966072c08e..66cdb06c19 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,6 +1,7 @@
 FROM fedora:33
 ENV PACKAGES \
     bzip2 \
+    ccache \
     diffutils \
     findutils \
     gcc \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 81b5659e9c..3733df63e9 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -4,6 +4,7 @@ FROM fedora:33
 ENV PACKAGES \
     bc \
     bzip2 \
+    ccache \
     diffutils \
     findutils \
     gcc \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index bcb428e724..2564ce4979 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -4,6 +4,7 @@ FROM fedora:33
 ENV PACKAGES \
     bc \
     bzip2 \
+    ccache \
     diffutils \
     findutils \
     gcc \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 0e64893e4a..f7e1cbfbe6 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -5,6 +5,7 @@ ENV PACKAGES \
     bc \
     brlapi-devel \
     bzip2 \
+    ccache \
     cyrus-sasl-devel \
     gcc \
     gcc-c++ \
-- 
2.27.0


