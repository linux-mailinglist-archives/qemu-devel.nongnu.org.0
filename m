Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3020D49EE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 23:34:11 +0200 (CEST)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ2Y6-00085n-B6
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 17:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iJ2QP-0002Ir-69
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:26:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iJ2QN-00011a-QU
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:26:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54948)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iJ2QK-00010S-Ho; Fri, 11 Oct 2019 17:26:08 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B848080F81;
 Fri, 11 Oct 2019 21:26:07 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-173.bos.redhat.com [10.18.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F42C1EC;
 Fri, 11 Oct 2019 21:26:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 05/19] block/dirty-bitmap: drop meta
Date: Fri, 11 Oct 2019 17:25:36 -0400
Message-Id: <20191011212550.27269-6-jsnow@redhat.com>
In-Reply-To: <20191011212550.27269-1-jsnow@redhat.com>
References: <20191011212550.27269-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 11 Oct 2019 21:26:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, libvir-list@redhat.com,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Drop meta bitmaps, as they are unused.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20190916141911.5255-2-vsementsov@virtuozzo.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 include/block/dirty-bitmap.h |  5 ----
 block/dirty-bitmap.c         | 46 ------------------------------------
 2 files changed, 51 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 07503b03b53..973056778aa 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -18,9 +18,6 @@ BdrvDirtyBitmap *bdrv_create_dirty_bitmap(BlockDriverSt=
ate *bs,
                                           uint32_t granularity,
                                           const char *name,
                                           Error **errp);
-void bdrv_create_meta_dirty_bitmap(BdrvDirtyBitmap *bitmap,
-                                   int chunk_size);
-void bdrv_release_meta_dirty_bitmap(BdrvDirtyBitmap *bitmap);
 int bdrv_dirty_bitmap_create_successor(BlockDriverState *bs,
                                        BdrvDirtyBitmap *bitmap,
                                        Error **errp);
@@ -54,7 +51,6 @@ void bdrv_set_dirty_bitmap(BdrvDirtyBitmap *bitmap,
                            int64_t offset, int64_t bytes);
 void bdrv_reset_dirty_bitmap(BdrvDirtyBitmap *bitmap,
                              int64_t offset, int64_t bytes);
-BdrvDirtyBitmapIter *bdrv_dirty_meta_iter_new(BdrvDirtyBitmap *bitmap);
 BdrvDirtyBitmapIter *bdrv_dirty_iter_new(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_iter_free(BdrvDirtyBitmapIter *iter);
=20
@@ -96,7 +92,6 @@ void bdrv_reset_dirty_bitmap_locked(BdrvDirtyBitmap *bi=
tmap,
 int64_t bdrv_dirty_iter_next(BdrvDirtyBitmapIter *iter);
 void bdrv_set_dirty_iter(BdrvDirtyBitmapIter *hbi, int64_t offset);
 int64_t bdrv_get_dirty_count(BdrvDirtyBitmap *bitmap);
-int64_t bdrv_get_meta_dirty_count(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_truncate(BlockDriverState *bs, int64_t bytes);
 bool bdrv_dirty_bitmap_readonly(const BdrvDirtyBitmap *bitmap);
 bool bdrv_has_readonly_bitmaps(BlockDriverState *bs);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 03e0872b972..4ecf18d5df7 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -31,7 +31,6 @@
 struct BdrvDirtyBitmap {
     QemuMutex *mutex;
     HBitmap *bitmap;            /* Dirty bitmap implementation */
-    HBitmap *meta;              /* Meta dirty bitmap */
     bool busy;                  /* Bitmap is busy, it can't be used via =
QMP */
     BdrvDirtyBitmap *successor; /* Anonymous child, if any. */
     char *name;                 /* Optional non-empty unique ID */
@@ -127,36 +126,6 @@ BdrvDirtyBitmap *bdrv_create_dirty_bitmap(BlockDrive=
rState *bs,
     return bitmap;
 }
=20
-/* bdrv_create_meta_dirty_bitmap
- *
- * Create a meta dirty bitmap that tracks the changes of bits in @bitmap=
. I.e.
- * when a dirty status bit in @bitmap is changed (either from reset to s=
et or
- * the other way around), its respective meta dirty bitmap bit will be m=
arked
- * dirty as well.
- *
- * @bitmap: the block dirty bitmap for which to create a meta dirty bitm=
ap.
- * @chunk_size: how many bytes of bitmap data does each bit in the meta =
bitmap
- * track.
- */
-void bdrv_create_meta_dirty_bitmap(BdrvDirtyBitmap *bitmap,
-                                   int chunk_size)
-{
-    assert(!bitmap->meta);
-    qemu_mutex_lock(bitmap->mutex);
-    bitmap->meta =3D hbitmap_create_meta(bitmap->bitmap,
-                                       chunk_size * BITS_PER_BYTE);
-    qemu_mutex_unlock(bitmap->mutex);
-}
-
-void bdrv_release_meta_dirty_bitmap(BdrvDirtyBitmap *bitmap)
-{
-    assert(bitmap->meta);
-    qemu_mutex_lock(bitmap->mutex);
-    hbitmap_free_meta(bitmap->bitmap);
-    bitmap->meta =3D NULL;
-    qemu_mutex_unlock(bitmap->mutex);
-}
-
 int64_t bdrv_dirty_bitmap_size(const BdrvDirtyBitmap *bitmap)
 {
     return bitmap->size;
@@ -320,7 +289,6 @@ static void bdrv_release_dirty_bitmap_locked(BdrvDirt=
yBitmap *bitmap)
     assert(!bitmap->active_iterators);
     assert(!bdrv_dirty_bitmap_busy(bitmap));
     assert(!bdrv_dirty_bitmap_has_successor(bitmap));
-    assert(!bitmap->meta);
     QLIST_REMOVE(bitmap, list);
     hbitmap_free(bitmap->bitmap);
     g_free(bitmap->name);
@@ -666,15 +634,6 @@ BdrvDirtyBitmapIter *bdrv_dirty_iter_new(BdrvDirtyBi=
tmap *bitmap)
     return iter;
 }
=20
-BdrvDirtyBitmapIter *bdrv_dirty_meta_iter_new(BdrvDirtyBitmap *bitmap)
-{
-    BdrvDirtyBitmapIter *iter =3D g_new(BdrvDirtyBitmapIter, 1);
-    hbitmap_iter_init(&iter->hbi, bitmap->meta, 0);
-    iter->bitmap =3D bitmap;
-    bitmap->active_iterators++;
-    return iter;
-}
-
 void bdrv_dirty_iter_free(BdrvDirtyBitmapIter *iter)
 {
     if (!iter) {
@@ -821,11 +780,6 @@ int64_t bdrv_get_dirty_count(BdrvDirtyBitmap *bitmap=
)
     return hbitmap_count(bitmap->bitmap);
 }
=20
-int64_t bdrv_get_meta_dirty_count(BdrvDirtyBitmap *bitmap)
-{
-    return hbitmap_count(bitmap->meta);
-}
-
 bool bdrv_dirty_bitmap_readonly(const BdrvDirtyBitmap *bitmap)
 {
     return bitmap->readonly;
--=20
2.21.0


