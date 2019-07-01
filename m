Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D85431C7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:53:33 +0200 (CEST)
Received: from localhost ([::1]:35748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbC7Y-00076o-Ro
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBSz-00007K-7Z
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBSx-0008F6-3H
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49166)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBSo-00088Q-CP; Wed, 12 Jun 2019 18:11:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 771E8C049D67;
 Wed, 12 Jun 2019 22:11:24 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 097B260CCD;
 Wed, 12 Jun 2019 22:11:23 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:52 +0200
Message-Id: <20190612221004.2317-31-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 12 Jun 2019 22:11:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 30/42] qemu-img: Use child access functions
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This changes iotest 204's output, because blkdebug on top of a COW node
used to make qemu-img map disregard the rest of the backing chain (the
backing chain was broken by the filter).  With this patch, the
allocation in the base image is reported correctly.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qemu-img.c                 | 36 ++++++++++++++++++++----------------
 tests/qemu-iotests/204.out |  1 +
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 07b6e2a808..7bfa6e5d40 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -992,7 +992,7 @@ static int img_commit(int argc, char **argv)
     if (!blk) {
         return 1;
     }
-    bs =3D blk_bs(blk);
+    bs =3D bdrv_skip_implicit_filters(blk_bs(blk));
=20
     qemu_progress_init(progress, 1.f);
     qemu_progress_print(0.f, 100);
@@ -1009,7 +1009,7 @@ static int img_commit(int argc, char **argv)
         /* This is different from QMP, which by default uses the deepest=
 file in
          * the backing chain (i.e., the very base); however, the traditi=
onal
          * behavior of qemu-img commit is using the immediate backing fi=
le. */
-        base_bs =3D backing_bs(bs);
+        base_bs =3D bdrv_filtered_cow_bs(bs);
         if (!base_bs) {
             error_setg(&local_err, "Image does not have a backing file")=
;
             goto done;
@@ -1626,19 +1626,18 @@ static int convert_iteration_sectors(ImgConvertSt=
ate *s, int64_t sector_num)
=20
     if (s->sector_next_status <=3D sector_num) {
         int64_t count =3D n * BDRV_SECTOR_SIZE;
+        BlockDriverState *src_bs =3D blk_bs(s->src[src_cur]);
+        BlockDriverState *base;
=20
         if (s->target_has_backing) {
-
-            ret =3D bdrv_block_status(blk_bs(s->src[src_cur]),
-                                    (sector_num - src_cur_offset) *
-                                    BDRV_SECTOR_SIZE,
-                                    count, &count, NULL, NULL);
+            base =3D bdrv_backing_chain_next(src_bs);
         } else {
-            ret =3D bdrv_block_status_above(blk_bs(s->src[src_cur]), NUL=
L,
-                                          (sector_num - src_cur_offset) =
*
-                                          BDRV_SECTOR_SIZE,
-                                          count, &count, NULL, NULL);
+            base =3D NULL;
         }
+        ret =3D bdrv_block_status_above(src_bs, base,
+                                      (sector_num - src_cur_offset) *
+                                      BDRV_SECTOR_SIZE,
+                                      count, &count, NULL, NULL);
         if (ret < 0) {
             error_report("error while reading block status of sector %" =
PRId64
                          ": %s", sector_num, strerror(-ret));
@@ -2439,7 +2438,8 @@ static int img_convert(int argc, char **argv)
          * s.target_backing_sectors has to be negative, which it will
          * be automatically).  The backing file length is used only
          * for optimizations, so such a case is not fatal. */
-        s.target_backing_sectors =3D bdrv_nb_sectors(out_bs->backing->bs=
);
+        s.target_backing_sectors =3D
+            bdrv_nb_sectors(bdrv_filtered_cow_bs(out_bs));
     } else {
         s.target_backing_sectors =3D -1;
     }
@@ -2802,6 +2802,7 @@ static int get_block_status(BlockDriverState *bs, i=
nt64_t offset,
=20
     depth =3D 0;
     for (;;) {
+        bs =3D bdrv_skip_rw_filters(bs);
         ret =3D bdrv_block_status(bs, offset, bytes, &bytes, &map, &file=
);
         if (ret < 0) {
             return ret;
@@ -2810,7 +2811,7 @@ static int get_block_status(BlockDriverState *bs, i=
nt64_t offset,
         if (ret & (BDRV_BLOCK_ZERO|BDRV_BLOCK_DATA)) {
             break;
         }
-        bs =3D backing_bs(bs);
+        bs =3D bdrv_filtered_cow_bs(bs);
         if (bs =3D=3D NULL) {
             ret =3D 0;
             break;
@@ -2949,7 +2950,7 @@ static int img_map(int argc, char **argv)
     if (!blk) {
         return 1;
     }
-    bs =3D blk_bs(blk);
+    bs =3D bdrv_skip_implicit_filters(blk_bs(blk));
=20
     if (output_format =3D=3D OFORMAT_HUMAN) {
         printf("%-16s%-16s%-16s%s\n", "Offset", "Length", "Mapped to", "=
File");
@@ -3165,6 +3166,7 @@ static int img_rebase(int argc, char **argv)
     uint8_t *buf_old =3D NULL;
     uint8_t *buf_new =3D NULL;
     BlockDriverState *bs =3D NULL, *prefix_chain_bs =3D NULL;
+    BlockDriverState *unfiltered_bs;
     char *filename;
     const char *fmt, *cache, *src_cache, *out_basefmt, *out_baseimg;
     int c, flags, src_flags, ret;
@@ -3299,6 +3301,8 @@ static int img_rebase(int argc, char **argv)
     }
     bs =3D blk_bs(blk);
=20
+    unfiltered_bs =3D bdrv_skip_rw_filters(bs);
+
     if (out_basefmt !=3D NULL) {
         if (bdrv_find_format(out_basefmt) =3D=3D NULL) {
             error_report("Invalid format name: '%s'", out_basefmt);
@@ -3310,7 +3314,7 @@ static int img_rebase(int argc, char **argv)
     /* For safe rebasing we need to compare old and new backing file */
     if (!unsafe) {
         QDict *options =3D NULL;
-        BlockDriverState *base_bs =3D backing_bs(bs);
+        BlockDriverState *base_bs =3D bdrv_filtered_cow_bs(unfiltered_bs=
);
=20
         if (base_bs) {
             blk_old_backing =3D blk_new(qemu_get_aio_context(),
@@ -3463,7 +3467,7 @@ static int img_rebase(int argc, char **argv)
                  * If cluster wasn't changed since prefix_chain, we don'=
t need
                  * to take action
                  */
-                ret =3D bdrv_is_allocated_above(backing_bs(bs), prefix_c=
hain_bs,
+                ret =3D bdrv_is_allocated_above(unfiltered_bs, prefix_ch=
ain_bs,
                                               offset, n, &n);
                 if (ret < 0) {
                     error_report("error while reading image metadata: %s=
",
diff --git a/tests/qemu-iotests/204.out b/tests/qemu-iotests/204.out
index f3a10fbe90..684774d763 100644
--- a/tests/qemu-iotests/204.out
+++ b/tests/qemu-iotests/204.out
@@ -59,5 +59,6 @@ Offset          Length          File
 0x900000        0x2400000       TEST_DIR/t.IMGFMT
 0x3c00000       0x1100000       TEST_DIR/t.IMGFMT
 0x6a00000       0x400000        TEST_DIR/t.IMGFMT
+0x6e00000       0x1200000       TEST_DIR/t.IMGFMT.base
 No errors were found on the image.
 *** done
--=20
2.21.0


