Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624B0D6A50
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 21:48:26 +0200 (CEST)
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK6KP-0001qp-6A
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 15:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iK62e-0006Bo-QV
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 15:30:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iK62d-0002vN-GA
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 15:30:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36460)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iK62Y-0002s8-Vi; Mon, 14 Oct 2019 15:30:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2D7A03084025;
 Mon, 14 Oct 2019 19:29:58 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-152.bos.redhat.com [10.18.17.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBDE260BE2;
 Mon, 14 Oct 2019 19:29:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 12/19] block/qcow2-bitmap: get rid of
 bdrv_has_changed_persistent_bitmaps
Date: Mon, 14 Oct 2019 15:29:02 -0400
Message-Id: <20191014192909.16044-13-jsnow@redhat.com>
In-Reply-To: <20191014192909.16044-1-jsnow@redhat.com>
References: <20191014192909.16044-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 14 Oct 2019 19:29:58 +0000 (UTC)
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

Firstly, no reason to optimize failure path. Then, function name is
ambiguous: it checks for readonly and similar things, but someone may
think that it will ignore normal bitmaps which was just unchanged, and
this is in bad relation with the fact that we should drop IN_USE flag
for unchanged bitmaps in the image.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20190927122355.7344-5-vsementsov@virtuozzo.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 include/block/dirty-bitmap.h |  1 -
 block/dirty-bitmap.c         | 12 ------------
 block/qcow2-bitmap.c         | 23 +++++++++++++----------
 3 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 257f0f6704..958e7474fb 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -95,7 +95,6 @@ bool bdrv_has_readonly_bitmaps(BlockDriverState *bs);
 bool bdrv_dirty_bitmap_get_autoload(const BdrvDirtyBitmap *bitmap);
 bool bdrv_dirty_bitmap_get_persistence(BdrvDirtyBitmap *bitmap);
 bool bdrv_dirty_bitmap_inconsistent(const BdrvDirtyBitmap *bitmap);
-bool bdrv_has_changed_persistent_bitmaps(BlockDriverState *bs);
=20
 BdrvDirtyBitmap *bdrv_dirty_bitmap_first(BlockDriverState *bs);
 BdrvDirtyBitmap *bdrv_dirty_bitmap_next(BdrvDirtyBitmap *bitmap);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 6065db8094..4bbb251b2c 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -839,18 +839,6 @@ bool bdrv_dirty_bitmap_inconsistent(const BdrvDirtyB=
itmap *bitmap)
     return bitmap->inconsistent;
 }
=20
-bool bdrv_has_changed_persistent_bitmaps(BlockDriverState *bs)
-{
-    BdrvDirtyBitmap *bm;
-    QLIST_FOREACH(bm, &bs->dirty_bitmaps, list) {
-        if (bm->persistent && !bm->readonly && !bm->skip_store) {
-            return true;
-        }
-    }
-
-    return false;
-}
-
 BdrvDirtyBitmap *bdrv_dirty_bitmap_first(BlockDriverState *bs)
 {
     return QLIST_FIRST(&bs->dirty_bitmaps);
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 99812b418b..6dfc083548 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1464,16 +1464,7 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDri=
verState *bs, Error **errp)
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
+    bool need_write =3D false;
=20
     QSIMPLEQ_INIT(&drop_tables);
=20
@@ -1499,6 +1490,8 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriv=
erState *bs, Error **errp)
             continue;
         }
=20
+        need_write =3D true;
+
         if (check_constraints_on_bitmap(bs, name, granularity, errp) < 0=
) {
             error_prepend(errp, "Bitmap '%s' doesn't satisfy the constra=
ints: ",
                           name);
@@ -1537,6 +1530,15 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDri=
verState *bs, Error **errp)
         bm->dirty_bitmap =3D bitmap;
     }
=20
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
         if (bm->dirty_bitmap =3D=3D NULL) {
@@ -1578,6 +1580,7 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriv=
erState *bs, Error **errp)
         bdrv_release_dirty_bitmap(bm->dirty_bitmap);
     }
=20
+success:
     bitmap_list_free(bm_list);
     return;
=20
--=20
2.21.0


