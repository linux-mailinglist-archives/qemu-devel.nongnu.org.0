Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39E23E28A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 21:49:07 +0200 (CEST)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3lsw-0002vy-MP
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 15:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lPP-00073F-H8
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:18:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32183
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lPN-0006ea-OM
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/BkKF3IuFX7t+/khBwbH7uKOv0bkDuacFqnSU2zWCQ=;
 b=hvstUa71CHtYN+WUjU/8rSua6xdrXECYB1399kXZW+8cOAGxq142lIqvKXLy06Tu+QKFr7
 8TJj7ibucFshmfDyRRg7yPpcUh3StcykuDbZ6vb2VnZZVu1TvExauCebstdtp9i1v/x+RT
 6k3QGRuWtoPiVM4iT7uZEdgIiBGspEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-trL8VVIiNtCDXnOrVzggCA-1; Thu, 06 Aug 2020 15:18:30 -0400
X-MC-Unique: trL8VVIiNtCDXnOrVzggCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00FBC107BEF5
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:18:30 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 127CC5F9DC;
 Thu,  6 Aug 2020 19:18:28 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 074/143] meson: convert replay directory to Meson
Date: Thu,  6 Aug 2020 21:15:10 +0200
Message-Id: <1596741379-12902-75-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 05:03:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.objs        |  1 -
 meson.build          |  1 +
 replay/Makefile.objs | 10 ----------
 replay/meson.build   | 12 ++++++++++++
 4 files changed, 13 insertions(+), 11 deletions(-)
 delete mode 100644 replay/Makefile.objs
 create mode 100644 replay/meson.build

diff --git a/Makefile.objs b/Makefile.objs
index bbb6f8c..544877a 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -67,7 +67,6 @@ common-obj-$(if $(and $(CONFIG_BZIP2),$(CONFIG_DMG)),m) += block-dmg-bz2$(DSOSUF
 common-obj-y += hw/
 common-obj-m += hw/
 
-common-obj-y += replay/
 common-obj-y += backends/
 
 common-obj-y += qapi/
diff --git a/meson.build b/meson.build
index 2071686..c592241 100644
--- a/meson.build
+++ b/meson.build
@@ -629,6 +629,7 @@ common_ss.add(files('cpus-common.c'))
 
 subdir('softmmu')
 subdir('monitor')
+subdir('replay')
 
 # needed for fuzzing binaries
 subdir('tests/qtest/libqos')
diff --git a/replay/Makefile.objs b/replay/Makefile.objs
deleted file mode 100644
index 939be96..0000000
--- a/replay/Makefile.objs
+++ /dev/null
@@ -1,10 +0,0 @@
-common-obj-y += replay.o
-common-obj-y += replay-internal.o
-common-obj-y += replay-events.o
-common-obj-y += replay-time.o
-common-obj-y += replay-input.o
-common-obj-y += replay-char.o
-common-obj-y += replay-snapshot.o
-common-obj-y += replay-net.o
-common-obj-y += replay-audio.o
-common-obj-y += replay-random.o
diff --git a/replay/meson.build b/replay/meson.build
new file mode 100644
index 0000000..8783aea
--- /dev/null
+++ b/replay/meson.build
@@ -0,0 +1,12 @@
+softmmu_ss.add(files(
+  'replay.c',
+  'replay-internal.c',
+  'replay-events.c',
+  'replay-time.c',
+  'replay-input.c',
+  'replay-char.c',
+  'replay-snapshot.c',
+  'replay-net.c',
+  'replay-audio.c',
+  'replay-random.c',
+))
-- 
1.8.3.1



