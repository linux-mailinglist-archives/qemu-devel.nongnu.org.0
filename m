Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7528431B6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:40:50 +0200 (CEST)
Received: from localhost ([::1]:35604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBvG-0001GX-1K
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46086)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBSq-0008O0-ID
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBSo-00089H-BB
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34084)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBSc-00081q-Ue; Wed, 12 Jun 2019 18:11:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3AE44300414E;
 Wed, 12 Jun 2019 22:11:14 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC5F860185;
 Wed, 12 Jun 2019 22:11:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:48 +0200
Message-Id: <20190612221004.2317-27-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 12 Jun 2019 22:11:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 26/42] backup: Deal with filters
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c |  9 +++++----
 blockdev.c     | 19 +++++++++++++++----
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 715e1d3be8..88435f883d 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -502,6 +502,7 @@ static int64_t backup_calculate_cluster_size(BlockDri=
verState *target,
 {
     int ret;
     BlockDriverInfo bdi;
+    bool target_does_cow =3D bdrv_backing_chain_next(target);
=20
     /*
      * If there is no backing file on the target, we cannot rely on COW =
if our
@@ -509,7 +510,7 @@ static int64_t backup_calculate_cluster_size(BlockDri=
verState *target,
      * targets with a backing file, try to avoid COW if possible.
      */
     ret =3D bdrv_get_info(target, &bdi);
-    if (ret =3D=3D -ENOTSUP && !target->backing) {
+    if (ret =3D=3D -ENOTSUP && !target_does_cow) {
         /* Cluster size is not defined */
         warn_report("The target block device doesn't provide "
                     "information about the block size and it doesn't hav=
e a "
@@ -518,14 +519,14 @@ static int64_t backup_calculate_cluster_size(BlockD=
riverState *target,
                     "this default, the backup may be unusable",
                     BACKUP_CLUSTER_SIZE_DEFAULT);
         return BACKUP_CLUSTER_SIZE_DEFAULT;
-    } else if (ret < 0 && !target->backing) {
+    } else if (ret < 0 && !target_does_cow) {
         error_setg_errno(errp, -ret,
             "Couldn't determine the cluster size of the target image, "
             "which has no backing file");
         error_append_hint(errp,
             "Aborting, since this may create an unusable destination ima=
ge\n");
         return ret;
-    } else if (ret < 0 && target->backing) {
+    } else if (ret < 0 && target_does_cow) {
         /* Not fatal; just trudge on ahead. */
         return BACKUP_CLUSTER_SIZE_DEFAULT;
     }
@@ -569,7 +570,7 @@ BlockJob *backup_job_create(const char *job_id, Block=
DriverState *bs,
         return NULL;
     }
=20
-    if (compress && target->drv->bdrv_co_pwritev_compressed =3D=3D NULL)=
 {
+    if (compress && !bdrv_supports_compressed_writes(target)) {
         error_setg(errp, "Compression is not supported for this drive %s=
",
                    bdrv_get_device_name(target));
         return NULL;
diff --git a/blockdev.c b/blockdev.c
index 68e8d33447..605e7b0994 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3500,7 +3500,13 @@ static BlockJob *do_drive_backup(DriveBackup *back=
up, JobTxn *txn,
     /* See if we have a backing HD we can use to create our new image
      * on top of. */
     if (backup->sync =3D=3D MIRROR_SYNC_MODE_TOP) {
-        source =3D backing_bs(bs);
+        /*
+         * Backup will not replace the source by the target, so none
+         * of the filters skipped here will be removed (in contrast to
+         * mirror).  Therefore, we can skip all of them when looking
+         * for the first COW relationship.
+         */
+        source =3D bdrv_filtered_cow_bs(bdrv_skip_rw_filters(bs));
         if (!source) {
             backup->sync =3D MIRROR_SYNC_MODE_FULL;
         }
@@ -3520,9 +3526,14 @@ static BlockJob *do_drive_backup(DriveBackup *back=
up, JobTxn *txn,
     if (backup->mode !=3D NEW_IMAGE_MODE_EXISTING) {
         assert(backup->format);
         if (source) {
-            bdrv_refresh_filename(source);
-            bdrv_img_create(backup->target, backup->format, source->file=
name,
-                            source->drv->format_name, NULL,
+            /* Implicit filters should not appear in the filename */
+            BlockDriverState *explicit_backing =3D
+                bdrv_skip_implicit_filters(source);
+
+            bdrv_refresh_filename(explicit_backing);
+            bdrv_img_create(backup->target, backup->format,
+                            explicit_backing->filename,
+                            explicit_backing->drv->format_name, NULL,
                             size, flags, false, &local_err);
         } else {
             bdrv_img_create(backup->target, backup->format, NULL, NULL, =
NULL,
--=20
2.21.0


