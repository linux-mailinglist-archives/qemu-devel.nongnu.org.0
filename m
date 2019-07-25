Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D86E749BB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 11:21:07 +0200 (CEST)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqZvu-00069x-5C
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 05:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hqZtz-0007SM-Hx
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:19:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hqZty-000453-1u
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:19:07 -0400
Received: from relay.sw.ru ([185.231.240.75]:44220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hqZtx-00041Y-Nw; Thu, 25 Jul 2019 05:19:05 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hqZtv-0001bs-42; Thu, 25 Jul 2019 12:19:03 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 25 Jul 2019 12:18:55 +0300
Message-Id: <20190725091900.30542-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190725091900.30542-1-vsementsov@virtuozzo.com>
References: <20190725091900.30542-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v3 4/9] block/qcow2-bitmap: get rid of
 bdrv_has_changed_persistent_bitmaps
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Firstly, no reason to optimize failure path. Then, function name is
ambiguous: it checks for readonly and similar things, but someone may
think that it will ignore normal bitmaps which was just unchanged, and
this is in bad relation with the fact that we should drop IN_USE flag
for unchanged bitmaps in the image.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 include/block/dirty-bitmap.h |  1 -
 block/dirty-bitmap.c         | 12 ------------
 block/qcow2-bitmap.c         | 23 +++++++++++++----------
 3 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 62682eb865..acca86d0fc 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -104,7 +104,6 @@ bool bdrv_has_readonly_bitmaps(BlockDriverState *bs);
 bool bdrv_dirty_bitmap_get_autoload(const BdrvDirtyBitmap *bitmap);
 bool bdrv_dirty_bitmap_get_persistence(BdrvDirtyBitmap *bitmap);
 bool bdrv_dirty_bitmap_inconsistent(const BdrvDirtyBitmap *bitmap);
-bool bdrv_has_changed_persistent_bitmaps(BlockDriverState *bs);
 BdrvDirtyBitmap *bdrv_dirty_bitmap_next(BlockDriverState *bs,
                                         BdrvDirtyBitmap *bitmap);
 char *bdrv_dirty_bitmap_sha256(const BdrvDirtyBitmap *bitmap, Error **errp);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 95a9c2a5d8..2e0cecf5ff 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -774,18 +774,6 @@ bool bdrv_dirty_bitmap_inconsistent(const BdrvDirtyBitmap *bitmap)
     return bitmap->inconsistent;
 }
 
-bool bdrv_has_changed_persistent_bitmaps(BlockDriverState *bs)
-{
-    BdrvDirtyBitmap *bm;
-    QLIST_FOREACH(bm, &bs->dirty_bitmaps, list) {
-        if (bm->persistent && !bm->readonly && !bm->migration) {
-            return true;
-        }
-    }
-
-    return false;
-}
-
 BdrvDirtyBitmap *bdrv_dirty_bitmap_next(BlockDriverState *bs,
                                         BdrvDirtyBitmap *bitmap)
 {
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index b2487101ed..60b79f1dac 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1456,16 +1456,7 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs, Error **errp)
     Qcow2Bitmap *bm;
     QSIMPLEQ_HEAD(, Qcow2BitmapTable) drop_tables;
     Qcow2BitmapTable *tb, *tb_next;
-
-    if (!bdrv_has_changed_persistent_bitmaps(bs)) {
-        /* nothing to do */
-        return;
-    }
-
-    if (!can_write(bs)) {
-        error_setg(errp, "No write access");
-        return;
-    }
+    bool need_write = false;
 
     QSIMPLEQ_INIT(&drop_tables);
 
@@ -1493,6 +1484,8 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs, Error **errp)
             continue;
         }
 
+        need_write = true;
+
         if (check_constraints_on_bitmap(bs, name, granularity, errp) < 0) {
             error_prepend(errp, "Bitmap '%s' doesn't satisfy the constraints: ",
                           name);
@@ -1531,6 +1524,15 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs, Error **errp)
         bm->dirty_bitmap = bitmap;
     }
 
+    if (!need_write) {
+        goto success;
+    }
+
+    if (!can_write(bs)) {
+        error_setg(errp, "No write access");
+        goto fail;
+    }
+
     /* allocate clusters and store bitmaps */
     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
         if (bm->dirty_bitmap == NULL) {
@@ -1572,6 +1574,7 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs, Error **errp)
         bdrv_release_dirty_bitmap(bs, bm->dirty_bitmap);
     }
 
+success:
     bitmap_list_free(bm_list);
     return;
 
-- 
2.18.0


