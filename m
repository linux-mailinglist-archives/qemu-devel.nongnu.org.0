Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6635C90B64
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 01:24:58 +0200 (CEST)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hylab-0003oD-5c
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 19:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1hylPe-0006Ky-7h
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hylPb-0005nI-En
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13630)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hylPX-0005hX-Ud; Fri, 16 Aug 2019 19:13:32 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2E9F9859FB;
 Fri, 16 Aug 2019 23:13:31 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78A03165D8;
 Fri, 16 Aug 2019 23:13:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 19:12:52 -0400
Message-Id: <20190816231318.8650-11-jsnow@redhat.com>
In-Reply-To: <20190816231318.8650-1-jsnow@redhat.com>
References: <20190816231318.8650-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 16 Aug 2019 23:13:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 10/36] block/dirty-bitmap: add
 bdrv_dirty_bitmap_get
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
Cc: peter.maydell@linaro.org, jsnow@redhat.com, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a public interface for get. While we're at it,
rename "bdrv_get_dirty_bitmap_locked" to "bdrv_dirty_bitmap_get_locked".

(There are more functions to rename to the bdrv_dirty_bitmap_VERB form,
but they will wait until the conclusion of this series.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190709232550.10724-11-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 block/dirty-bitmap.c         | 19 ++++++++++++-------
 block/mirror.c               |  2 +-
 include/block/dirty-bitmap.h |  4 ++--
 migration/block.c            |  5 ++---
 nbd/server.c                 |  2 +-
 5 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 7881fea684b..75a5daf116f 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -509,14 +509,19 @@ BlockDirtyInfoList *bdrv_query_dirty_bitmaps(BlockD=
riverState *bs)
 }
=20
 /* Called within bdrv_dirty_bitmap_lock..unlock */
-bool bdrv_get_dirty_locked(BlockDriverState *bs, BdrvDirtyBitmap *bitmap=
,
-                           int64_t offset)
+bool bdrv_dirty_bitmap_get_locked(BdrvDirtyBitmap *bitmap, int64_t offse=
t)
 {
-    if (bitmap) {
-        return hbitmap_get(bitmap->bitmap, offset);
-    } else {
-        return false;
-    }
+    return hbitmap_get(bitmap->bitmap, offset);
+}
+
+bool bdrv_dirty_bitmap_get(BdrvDirtyBitmap *bitmap, int64_t offset)
+{
+    bool ret;
+    bdrv_dirty_bitmap_lock(bitmap);
+    ret =3D bdrv_dirty_bitmap_get_locked(bitmap, offset);
+    bdrv_dirty_bitmap_unlock(bitmap);
+
+    return ret;
 }
=20
 /**
diff --git a/block/mirror.c b/block/mirror.c
index 70f24d9ef63..2b870683f14 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -476,7 +476,7 @@ static uint64_t coroutine_fn mirror_iteration(MirrorB=
lockJob *s)
         int64_t next_offset =3D offset + nb_chunks * s->granularity;
         int64_t next_chunk =3D next_offset / s->granularity;
         if (next_offset >=3D s->bdev_length ||
-            !bdrv_get_dirty_locked(source, s->dirty_bitmap, next_offset)=
) {
+            !bdrv_dirty_bitmap_get_locked(s->dirty_bitmap, next_offset))=
 {
             break;
         }
         if (test_bit(next_chunk, s->in_flight_bitmap)) {
diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 62682eb865f..0120ef3f05a 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -84,12 +84,12 @@ void bdrv_dirty_bitmap_set_busy(BdrvDirtyBitmap *bitm=
ap, bool busy);
 void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitma=
p *src,
                              HBitmap **backup, Error **errp);
 void bdrv_dirty_bitmap_set_migration(BdrvDirtyBitmap *bitmap, bool migra=
tion);
+bool bdrv_dirty_bitmap_get(BdrvDirtyBitmap *bitmap, int64_t offset);
=20
 /* Functions that require manual locking.  */
 void bdrv_dirty_bitmap_lock(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_unlock(BdrvDirtyBitmap *bitmap);
-bool bdrv_get_dirty_locked(BlockDriverState *bs, BdrvDirtyBitmap *bitmap=
,
-                           int64_t offset);
+bool bdrv_dirty_bitmap_get_locked(BdrvDirtyBitmap *bitmap, int64_t offse=
t);
 void bdrv_set_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
                                   int64_t offset, int64_t bytes);
 void bdrv_reset_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
diff --git a/migration/block.c b/migration/block.c
index e81fd7e14fa..aa747b55fa8 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -521,7 +521,6 @@ static int mig_save_device_dirty(QEMUFile *f, BlkMigD=
evState *bmds,
                                  int is_async)
 {
     BlkMigBlock *blk;
-    BlockDriverState *bs =3D blk_bs(bmds->blk);
     int64_t total_sectors =3D bmds->total_sectors;
     int64_t sector;
     int nr_sectors;
@@ -536,8 +535,8 @@ static int mig_save_device_dirty(QEMUFile *f, BlkMigD=
evState *bmds,
             blk_mig_unlock();
         }
         bdrv_dirty_bitmap_lock(bmds->dirty_bitmap);
-        if (bdrv_get_dirty_locked(bs, bmds->dirty_bitmap,
-                                  sector * BDRV_SECTOR_SIZE)) {
+        if (bdrv_dirty_bitmap_get_locked(bmds->dirty_bitmap,
+                                         sector * BDRV_SECTOR_SIZE)) {
             if (total_sectors - sector < BDRV_SECTORS_PER_DIRTY_CHUNK) {
                 nr_sectors =3D total_sectors - sector;
             } else {
diff --git a/nbd/server.c b/nbd/server.c
index 3eacb898757..f55ccf8edfd 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2004,7 +2004,7 @@ static unsigned int bitmap_to_extents(BdrvDirtyBitm=
ap *bitmap, uint64_t offset,
     bdrv_dirty_bitmap_lock(bitmap);
=20
     it =3D bdrv_dirty_iter_new(bitmap);
-    dirty =3D bdrv_get_dirty_locked(NULL, bitmap, offset);
+    dirty =3D bdrv_dirty_bitmap_get_locked(bitmap, offset);
=20
     assert(begin < overall_end && nb_extents);
     while (begin < overall_end && i < nb_extents) {
--=20
2.21.0


