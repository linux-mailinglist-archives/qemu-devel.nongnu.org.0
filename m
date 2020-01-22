Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6481455E7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 14:28:47 +0100 (CET)
Received: from localhost ([::1]:42072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuG3q-000402-91
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 08:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iuFyw-0006ml-My
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iuFyv-0002Mn-Io
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:23:42 -0500
Received: from relay.sw.ru ([185.231.240.75]:42304)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iuFys-0002I3-NB; Wed, 22 Jan 2020 08:23:38 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iuFyj-00057B-Ol; Wed, 22 Jan 2020 16:23:29 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/7] migration/block-dirty-bitmap: simplify
 dirty_bitmap_load_complete
Date: Wed, 22 Jan 2020 16:23:24 +0300
Message-Id: <20200122132328.31156-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200122132328.31156-1-vsementsov@virtuozzo.com>
References: <20200122132328.31156-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 quintela@redhat.com, dgilbert@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com
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
index 502e858c31..eeaab2174e 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -526,6 +526,10 @@ static void dirty_bitmap_load_complete(QEMUFile *f)
 
     qemu_mutex_lock(&dbm_load_state.lock);
 
+    if (bdrv_dirty_bitmap_has_successor(s->bitmap)) {
+        bdrv_reclaim_dirty_bitmap(s->bitmap, &error_abort);
+    }
+
     for (item = dbm_load_state.enabled_bitmaps; item;
          item = g_slist_next(item))
     {
@@ -537,27 +541,6 @@ static void dirty_bitmap_load_complete(QEMUFile *f)
         }
     }
 
-    if (bdrv_dirty_bitmap_has_successor(s->bitmap)) {
-        bdrv_dirty_bitmap_lock(s->bitmap);
-        if (dbm_load_state.enabled_bitmaps == NULL) {
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
     qemu_mutex_unlock(&dbm_load_state.lock);
 }
 
-- 
2.21.0


