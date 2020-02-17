Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E982161593
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 16:08:37 +0100 (CET)
Received: from localhost ([::1]:46818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3i0i-0005Xm-4s
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 10:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvf-0004jo-HO
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hve-0007X3-Di
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:23 -0500
Received: from relay.sw.ru ([185.231.240.75]:47416)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hve-0007L7-50; Mon, 17 Feb 2020 10:03:22 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvE-0007Zt-3I; Mon, 17 Feb 2020 18:02:56 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/22] migration/block-dirty-bitmap: simplify
 dirty_bitmap_load_complete
Date: Mon, 17 Feb 2020 18:02:31 +0300
Message-Id: <20200217150246.29180-8-vsementsov@virtuozzo.com>
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

bdrv_enable_dirty_bitmap_locked() call does nothing, as if we are in
postcopy, bitmap successor must be enabled, and reclaim operation will
enable the bitmap.

So, actually we need just call _reclaim_ in both if branches, and
making differences only to add an assertion seems not really good. The
logic becomes simple: on load complete we do reclaim and that's all.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 migration/block-dirty-bitmap.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 440c41cfca..9cc750d93b 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -535,6 +535,10 @@ static void dirty_bitmap_load_complete(QEMUFile *f, DBMLoadState *s)
 
     qemu_mutex_lock(&s->lock);
 
+    if (bdrv_dirty_bitmap_has_successor(s->bitmap)) {
+        bdrv_reclaim_dirty_bitmap(s->bitmap, &error_abort);
+    }
+
     for (item = s->enabled_bitmaps; item; item = g_slist_next(item)) {
         LoadBitmapState *b = item->data;
 
@@ -544,27 +548,6 @@ static void dirty_bitmap_load_complete(QEMUFile *f, DBMLoadState *s)
         }
     }
 
-    if (bdrv_dirty_bitmap_has_successor(s->bitmap)) {
-        bdrv_dirty_bitmap_lock(s->bitmap);
-        if (s->enabled_bitmaps == NULL) {
-            /* in postcopy */
-            bdrv_reclaim_dirty_bitmap_locked(s->bitmap, &error_abort);
-            bdrv_enable_dirty_bitmap_locked(s->bitmap);
-        } else {
-            /* target not started, successor must be empty */
-            int64_t count = bdrv_get_dirty_count(s->bitmap);
-            BdrvDirtyBitmap *ret = bdrv_reclaim_dirty_bitmap_locked(s->bitmap,
-                                                                    NULL);
-            /* bdrv_reclaim_dirty_bitmap can fail only on no successor (it
-             * must be) or on merge fail, but merge can't fail when second
-             * bitmap is empty
-             */
-            assert(ret == s->bitmap &&
-                   count == bdrv_get_dirty_count(s->bitmap));
-        }
-        bdrv_dirty_bitmap_unlock(s->bitmap);
-    }
-
     qemu_mutex_unlock(&s->lock);
 }
 
-- 
2.21.0


