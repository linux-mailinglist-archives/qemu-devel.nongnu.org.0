Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF7960C5C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 22:28:47 +0200 (CEST)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjUp4-0000G7-A7
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 16:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32974)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hjUeI-0005cJ-Dm
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:17:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hjUeG-0007Ib-Le
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:17:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53196)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hjUe6-00079J-FG; Fri, 05 Jul 2019 16:17:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61427308FEC0;
 Fri,  5 Jul 2019 20:17:20 +0000 (UTC)
Received: from probe.redhat.com (ovpn-122-149.rdu2.redhat.com [10.10.122.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05F81867E6;
 Fri,  5 Jul 2019 20:17:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Fri,  5 Jul 2019 16:16:24 -0400
Message-Id: <20190705201631.26266-12-jsnow@redhat.com>
In-Reply-To: <20190705201631.26266-1-jsnow@redhat.com>
References: <20190705201631.26266-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 05 Jul 2019 20:17:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 11/18] block/backup: upgrade copy_bitmap to
 BdrvDirtyBitmap
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
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simplifies some interface matters; namely the initialization and
(later) merging the manifest back into the sync_bitmap if it was
provided.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 block/backup.c | 81 ++++++++++++++++++++++++++------------------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index efd0dcd2e7..3c08d057cc 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -38,7 +38,10 @@ typedef struct CowRequest {
 typedef struct BackupBlockJob {
     BlockJob common;
     BlockBackend *target;
+
     BdrvDirtyBitmap *sync_bitmap;
+    BdrvDirtyBitmap *copy_bitmap;
+
     MirrorSyncMode sync_mode;
     BitmapSyncMode bitmap_mode;
     BlockdevOnError on_source_error;
@@ -51,7 +54,6 @@ typedef struct BackupBlockJob {
     NotifierWithReturn before_write;
     QLIST_HEAD(, CowRequest) inflight_reqs;
=20
-    HBitmap *copy_bitmap;
     bool use_copy_range;
     int64_t copy_range_size;
=20
@@ -113,7 +115,7 @@ static int coroutine_fn backup_cow_with_bounce_buffer=
(BackupBlockJob *job,
     int write_flags =3D job->serialize_target_writes ? BDRV_REQ_SERIALIS=
ING : 0;
=20
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
-    hbitmap_reset(job->copy_bitmap, start, job->cluster_size);
+    bdrv_reset_dirty_bitmap(job->copy_bitmap, start, job->cluster_size);
     nbytes =3D MIN(job->cluster_size, job->len - start);
     if (!*bounce_buffer) {
         *bounce_buffer =3D blk_blockalign(blk, job->cluster_size);
@@ -146,7 +148,7 @@ static int coroutine_fn backup_cow_with_bounce_buffer=
(BackupBlockJob *job,
=20
     return nbytes;
 fail:
-    hbitmap_set(job->copy_bitmap, start, job->cluster_size);
+    bdrv_set_dirty_bitmap(job->copy_bitmap, start, job->cluster_size);
     return ret;
=20
 }
@@ -169,12 +171,14 @@ static int coroutine_fn backup_cow_with_offload(Bac=
kupBlockJob *job,
     assert(QEMU_IS_ALIGNED(start, job->cluster_size));
     nbytes =3D MIN(job->copy_range_size, end - start);
     nr_clusters =3D DIV_ROUND_UP(nbytes, job->cluster_size);
-    hbitmap_reset(job->copy_bitmap, start, job->cluster_size * nr_cluste=
rs);
+    bdrv_reset_dirty_bitmap(job->copy_bitmap, start,
+                            job->cluster_size * nr_clusters);
     ret =3D blk_co_copy_range(blk, start, job->target, start, nbytes,
                             read_flags, write_flags);
     if (ret < 0) {
         trace_backup_do_cow_copy_range_fail(job, start, ret);
-        hbitmap_set(job->copy_bitmap, start, job->cluster_size * nr_clus=
ters);
+        bdrv_set_dirty_bitmap(job->copy_bitmap, start,
+                              job->cluster_size * nr_clusters);
         return ret;
     }
=20
@@ -202,7 +206,7 @@ static int coroutine_fn backup_do_cow(BackupBlockJob =
*job,
     cow_request_begin(&cow_request, job, start, end);
=20
     while (start < end) {
-        if (!hbitmap_get(job->copy_bitmap, start)) {
+        if (!bdrv_dirty_bitmap_get(job->copy_bitmap, start)) {
             trace_backup_do_cow_skip(job, start);
             start +=3D job->cluster_size;
             continue; /* already copied */
@@ -298,14 +302,16 @@ static void backup_abort(Job *job)
 static void backup_clean(Job *job)
 {
     BackupBlockJob *s =3D container_of(job, BackupBlockJob, common.job);
+    BlockDriverState *target_bs =3D blk_bs(s->target);
+
+    if (s->copy_bitmap) {
+        bdrv_release_dirty_bitmap(target_bs, s->copy_bitmap);
+        s->copy_bitmap =3D NULL;
+    }
+
     assert(s->target);
     blk_unref(s->target);
     s->target =3D NULL;
-
-    if (s->copy_bitmap) {
-        hbitmap_free(s->copy_bitmap);
-        s->copy_bitmap =3D NULL;
-    }
 }
=20
 void backup_do_checkpoint(BlockJob *job, Error **errp)
@@ -320,7 +326,7 @@ void backup_do_checkpoint(BlockJob *job, Error **errp=
)
         return;
     }
=20
-    hbitmap_set(backup_job->copy_bitmap, 0, backup_job->len);
+    bdrv_set_dirty_bitmap(backup_job->copy_bitmap, 0, backup_job->len);
 }
=20
 static void backup_drain(BlockJob *job)
@@ -389,59 +395,52 @@ static bool bdrv_is_unallocated_range(BlockDriverSt=
ate *bs,
=20
 static int coroutine_fn backup_loop(BackupBlockJob *job)
 {
-    int ret;
     bool error_is_read;
     int64_t offset;
-    HBitmapIter hbi;
+    BdrvDirtyBitmapIter *bdbi;
     BlockDriverState *bs =3D blk_bs(job->common.blk);
+    int ret =3D 0;
=20
-    hbitmap_iter_init(&hbi, job->copy_bitmap, 0);
-    while ((offset =3D hbitmap_iter_next(&hbi)) !=3D -1) {
+    bdbi =3D bdrv_dirty_iter_new(job->copy_bitmap);
+    while ((offset =3D bdrv_dirty_iter_next(bdbi)) !=3D -1) {
         if (job->sync_mode =3D=3D MIRROR_SYNC_MODE_TOP &&
             bdrv_is_unallocated_range(bs, offset, job->cluster_size))
         {
-            hbitmap_reset(job->copy_bitmap, offset, job->cluster_size);
+            bdrv_reset_dirty_bitmap(job->copy_bitmap, offset,
+                                    job->cluster_size);
             continue;
         }
=20
         do {
             if (yield_and_check(job)) {
-                return 0;
+                goto out;
             }
             ret =3D backup_do_cow(job, offset,
                                 job->cluster_size, &error_is_read, false=
);
             if (ret < 0 && backup_error_action(job, error_is_read, -ret)=
 =3D=3D
                            BLOCK_ERROR_ACTION_REPORT)
             {
-                return ret;
+                goto out;
             }
         } while (ret < 0);
     }
=20
-    return 0;
+ out:
+    bdrv_dirty_iter_free(bdbi);
+    return ret;
 }
=20
 /* init copy_bitmap from sync_bitmap */
 static void backup_incremental_init_copy_bitmap(BackupBlockJob *job)
 {
-    uint64_t offset =3D 0;
-    uint64_t bytes =3D job->len;
-
-    while (bdrv_dirty_bitmap_next_dirty_area(job->sync_bitmap,
-                                             &offset, &bytes))
-    {
-        hbitmap_set(job->copy_bitmap, offset, bytes);
-
-        offset +=3D bytes;
-        if (offset >=3D job->len) {
-            break;
-        }
-        bytes =3D job->len - offset;
-    }
+    bool ret =3D bdrv_dirty_bitmap_merge_internal(job->copy_bitmap,
+                                                job->sync_bitmap,
+                                                NULL, true);
+    assert(ret);
=20
     /* TODO job_progress_set_remaining() would make more sense */
     job_progress_update(&job->common.job,
-        job->len - hbitmap_count(job->copy_bitmap));
+                        job->len - bdrv_get_dirty_count(job->copy_bitmap=
));
 }
=20
 static int coroutine_fn backup_run(Job *job, Error **errp)
@@ -458,7 +457,7 @@ static int coroutine_fn backup_run(Job *job, Error **=
errp)
     if (s->sync_mode =3D=3D MIRROR_SYNC_MODE_BITMAP) {
         backup_incremental_init_copy_bitmap(s);
     } else {
-        hbitmap_set(s->copy_bitmap, 0, s->len);
+        bdrv_set_dirty_bitmap(s->copy_bitmap, 0, s->len);
     }
=20
     s->before_write.notify =3D backup_before_write_notify;
@@ -551,7 +550,7 @@ BlockJob *backup_job_create(const char *job_id, Block=
DriverState *bs,
     BackupBlockJob *job =3D NULL;
     int ret;
     int64_t cluster_size;
-    HBitmap *copy_bitmap =3D NULL;
+    BdrvDirtyBitmap *copy_bitmap =3D NULL;
=20
     assert(bs);
     assert(target);
@@ -621,7 +620,11 @@ BlockJob *backup_job_create(const char *job_id, Bloc=
kDriverState *bs,
         goto error;
     }
=20
-    copy_bitmap =3D hbitmap_alloc(len, ctz32(cluster_size));
+    copy_bitmap =3D bdrv_create_dirty_bitmap(target, cluster_size, NULL,=
 errp);
+    if (!copy_bitmap) {
+        goto error;
+    }
+    bdrv_disable_dirty_bitmap(copy_bitmap);
=20
     /* job->len is fixed, so we can't allow resize */
     job =3D block_job_create(job_id, &backup_job_driver, txn, bs,
@@ -672,7 +675,7 @@ BlockJob *backup_job_create(const char *job_id, Block=
DriverState *bs,
  error:
     if (copy_bitmap) {
         assert(!job || !job->copy_bitmap);
-        hbitmap_free(copy_bitmap);
+        bdrv_release_dirty_bitmap(target, copy_bitmap);
     }
     if (sync_bitmap) {
         bdrv_reclaim_dirty_bitmap(bs, sync_bitmap, NULL);
--=20
2.21.0


