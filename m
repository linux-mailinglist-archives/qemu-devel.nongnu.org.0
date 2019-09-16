Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BD4B3CB6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 16:38:35 +0200 (CEST)
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9s9B-0000f7-O7
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 10:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i9rqa-0007Cd-LH
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:19:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i9rqY-0007uk-Tj
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:19:20 -0400
Received: from relay.sw.ru ([185.231.240.75]:58108)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i9rqV-0007si-AH; Mon, 16 Sep 2019 10:19:15 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i9rqS-0003EA-BD; Mon, 16 Sep 2019 17:19:12 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Mon, 16 Sep 2019 17:19:08 +0300
Message-Id: <20190916141911.5255-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190916141911.5255-1-vsementsov@virtuozzo.com>
References: <20190916141911.5255-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 1/4] block/dirty-bitmap: drop meta
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
 quintela@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, den@openvz.org, mreitz@redhat.com, jsnow@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop meta bitmaps, as they are unused.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/dirty-bitmap.h |  5 ----
 block/dirty-bitmap.c         | 46 ------------------------------------
 2 files changed, 51 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 4b4b731b46..848dfc6590 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -18,9 +18,6 @@ BdrvDirtyBitmap *bdrv_create_dirty_bitmap(BlockDriverState *bs,
                                           uint32_t granularity,
                                           const char *name,
                                           Error **errp);
-void bdrv_create_meta_dirty_bitmap(BdrvDirtyBitmap *bitmap,
-                                   int chunk_size);
-void bdrv_release_meta_dirty_bitmap(BdrvDirtyBitmap *bitmap);
 int bdrv_dirty_bitmap_create_successor(BlockDriverState *bs,
                                        BdrvDirtyBitmap *bitmap,
                                        Error **errp);
@@ -55,7 +52,6 @@ void bdrv_set_dirty_bitmap(BdrvDirtyBitmap *bitmap,
                            int64_t offset, int64_t bytes);
 void bdrv_reset_dirty_bitmap(BdrvDirtyBitmap *bitmap,
                              int64_t offset, int64_t bytes);
-BdrvDirtyBitmapIter *bdrv_dirty_meta_iter_new(BdrvDirtyBitmap *bitmap);
 BdrvDirtyBitmapIter *bdrv_dirty_iter_new(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_iter_free(BdrvDirtyBitmapIter *iter);
 
@@ -97,7 +93,6 @@ void bdrv_reset_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
 int64_t bdrv_dirty_iter_next(BdrvDirtyBitmapIter *iter);
 void bdrv_set_dirty_iter(BdrvDirtyBitmapIter *hbi, int64_t offset);
 int64_t bdrv_get_dirty_count(BdrvDirtyBitmap *bitmap);
-int64_t bdrv_get_meta_dirty_count(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_truncate(BlockDriverState *bs, int64_t bytes);
 bool bdrv_dirty_bitmap_readonly(const BdrvDirtyBitmap *bitmap);
 bool bdrv_has_readonly_bitmaps(BlockDriverState *bs);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 134e0c9a0c..acfc3077f1 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -30,7 +30,6 @@
 struct BdrvDirtyBitmap {
     QemuMutex *mutex;
     HBitmap *bitmap;            /* Dirty bitmap implementation */
-    HBitmap *meta;              /* Meta dirty bitmap */
     bool busy;                  /* Bitmap is busy, it can't be used via QMP */
     BdrvDirtyBitmap *successor; /* Anonymous child, if any. */
     char *name;                 /* Optional non-empty unique ID */
@@ -126,36 +125,6 @@ BdrvDirtyBitmap *bdrv_create_dirty_bitmap(BlockDriverState *bs,
     return bitmap;
 }
 
-/* bdrv_create_meta_dirty_bitmap
- *
- * Create a meta dirty bitmap that tracks the changes of bits in @bitmap. I.e.
- * when a dirty status bit in @bitmap is changed (either from reset to set or
- * the other way around), its respective meta dirty bitmap bit will be marked
- * dirty as well.
- *
- * @bitmap: the block dirty bitmap for which to create a meta dirty bitmap.
- * @chunk_size: how many bytes of bitmap data does each bit in the meta bitmap
- * track.
- */
-void bdrv_create_meta_dirty_bitmap(BdrvDirtyBitmap *bitmap,
-                                   int chunk_size)
-{
-    assert(!bitmap->meta);
-    qemu_mutex_lock(bitmap->mutex);
-    bitmap->meta = hbitmap_create_meta(bitmap->bitmap,
-                                       chunk_size * BITS_PER_BYTE);
-    qemu_mutex_unlock(bitmap->mutex);
-}
-
-void bdrv_release_meta_dirty_bitmap(BdrvDirtyBitmap *bitmap)
-{
-    assert(bitmap->meta);
-    qemu_mutex_lock(bitmap->mutex);
-    hbitmap_free_meta(bitmap->bitmap);
-    bitmap->meta = NULL;
-    qemu_mutex_unlock(bitmap->mutex);
-}
-
 int64_t bdrv_dirty_bitmap_size(const BdrvDirtyBitmap *bitmap)
 {
     return bitmap->size;
@@ -319,7 +288,6 @@ static void bdrv_release_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap)
     assert(!bitmap->active_iterators);
     assert(!bdrv_dirty_bitmap_busy(bitmap));
     assert(!bdrv_dirty_bitmap_has_successor(bitmap));
-    assert(!bitmap->meta);
     QLIST_REMOVE(bitmap, list);
     hbitmap_free(bitmap->bitmap);
     g_free(bitmap->name);
@@ -557,15 +525,6 @@ BdrvDirtyBitmapIter *bdrv_dirty_iter_new(BdrvDirtyBitmap *bitmap)
     return iter;
 }
 
-BdrvDirtyBitmapIter *bdrv_dirty_meta_iter_new(BdrvDirtyBitmap *bitmap)
-{
-    BdrvDirtyBitmapIter *iter = g_new(BdrvDirtyBitmapIter, 1);
-    hbitmap_iter_init(&iter->hbi, bitmap->meta, 0);
-    iter->bitmap = bitmap;
-    bitmap->active_iterators++;
-    return iter;
-}
-
 void bdrv_dirty_iter_free(BdrvDirtyBitmapIter *iter)
 {
     if (!iter) {
@@ -712,11 +671,6 @@ int64_t bdrv_get_dirty_count(BdrvDirtyBitmap *bitmap)
     return hbitmap_count(bitmap->bitmap);
 }
 
-int64_t bdrv_get_meta_dirty_count(BdrvDirtyBitmap *bitmap)
-{
-    return hbitmap_count(bitmap->meta);
-}
-
 bool bdrv_dirty_bitmap_readonly(const BdrvDirtyBitmap *bitmap)
 {
     return bitmap->readonly;
-- 
2.21.0


