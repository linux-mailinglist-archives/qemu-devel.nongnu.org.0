Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E7F1615EC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 16:16:00 +0100 (CET)
Received: from localhost ([::1]:47016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3i7s-0000hu-2B
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 10:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvk-0004wK-6i
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvj-0007aE-2G
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:28 -0500
Received: from relay.sw.ru ([185.231.240.75]:47536)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvi-0007RY-Ou; Mon, 17 Feb 2020 10:03:26 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvD-0007Zt-0G; Mon, 17 Feb 2020 18:02:55 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/22] migration/block-dirty-bitmap: rename
 dirty_bitmap_mig_cleanup
Date: Mon, 17 Feb 2020 18:02:27 +0300
Message-Id: <20200217150246.29180-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200217150246.29180-1-vsementsov@virtuozzo.com>
References: <20200217150246.29180-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: Fam Zheng <fam@euphon.net>, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 quintela@redhat.com, dgilbert@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, andrey.shinkevich@virtuozzo.com,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename dirty_bitmap_mig_cleanup to dirty_bitmap_do_save_cleanup, to
stress that it is on save part.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 migration/block-dirty-bitmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 73792ab005..4e8959ae52 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -259,7 +259,7 @@ static void send_bitmap_bits(QEMUFile *f, SaveBitmapState *dbms,
 }
 
 /* Called with iothread lock taken.  */
-static void dirty_bitmap_mig_cleanup(void)
+static void dirty_bitmap_do_save_cleanup(void)
 {
     SaveBitmapState *dbms;
 
@@ -338,7 +338,7 @@ static int init_dirty_bitmap_migration(void)
     return 0;
 
 fail:
-    dirty_bitmap_mig_cleanup();
+    dirty_bitmap_do_save_cleanup();
 
     return -1;
 }
@@ -377,7 +377,7 @@ static void bulk_phase(QEMUFile *f, bool limit)
 /* for SaveVMHandlers */
 static void dirty_bitmap_save_cleanup(void *opaque)
 {
-    dirty_bitmap_mig_cleanup();
+    dirty_bitmap_do_save_cleanup();
 }
 
 static int dirty_bitmap_save_iterate(QEMUFile *f, void *opaque)
@@ -412,7 +412,7 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
 
     trace_dirty_bitmap_save_complete_finish();
 
-    dirty_bitmap_mig_cleanup();
+    dirty_bitmap_do_save_cleanup();
     return 0;
 }
 
-- 
2.21.0


