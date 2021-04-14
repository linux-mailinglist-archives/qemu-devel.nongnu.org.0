Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD2035EF31
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:21:10 +0200 (CEST)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWalp-0002oQ-L4
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWakD-0001V7-CP
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:19:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWakB-0004mM-FK
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618388366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LKkbXoNihWQt0D51fYTu2bQKolsz1YuGbNaDqD31uM=;
 b=bnrGu6EwQIGVoaiSp2OJQwX6nup2WbE7YHPdknZqzr729gcKO6YPH3z0yQKIyWcEqc9aTQ
 RrYGAVzv+DSWJy48Mx3DQhhsCeprpEYajDtpcshzfoXD80OmE3pitUCz+Z4HOVqyeK5+l4
 GZHHVSNfsjhHe9StSGnOGiaI37NPNJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-RSsJ8W_mMe-OkoHKJNNrHg-1; Wed, 14 Apr 2021 04:19:24 -0400
X-MC-Unique: RSsJ8W_mMe-OkoHKJNNrHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95DDB83DD20;
 Wed, 14 Apr 2021 08:19:23 +0000 (UTC)
Received: from thuth.com (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBE9E5D9CA;
 Wed, 14 Apr 2021 08:19:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 1/5] tests/docker/dockerfiles: Add ccache to containers
 where it was missing
Date: Wed, 14 Apr 2021 10:19:03 +0200
Message-Id: <20210414081907.871437-2-thuth@redhat.com>
In-Reply-To: <20210414081907.871437-1-thuth@redhat.com>
References: <20210414081907.871437-1-thuth@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to enable ccache in our gitlab-CI. Make sure that it is
available in all containers.

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


