Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5174EB129F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 18:19:20 +0200 (CEST)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8RoU-0001rf-UY
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 12:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1i8Rn8-0001Ci-Fv
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 12:17:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1i8Rn5-00033d-9h
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 12:17:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49208)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>)
 id 1i8Rmy-0002xw-IU; Thu, 12 Sep 2019 12:17:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ECF795AFF8;
 Thu, 12 Sep 2019 16:17:42 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C46B43DB2;
 Thu, 12 Sep 2019 16:17:38 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 12 Sep 2019 18:16:25 +0200
Message-Id: <20190912161624.40886-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 12 Sep 2019 16:17:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] blockdev: avoid acquiring AioContext lock
 twice at do_drive_backup()
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 Sergio Lopez <slp@redhat.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

do_drive_backup() acquires the AioContext lock of the corresponding
BlockDriverState. This is not a problem when it's called from
qmp_drive_backup(), but drive_backup_prepare() also acquires the lock
before calling it.

This change adds a BlockDriverState argument to do_drive_backup(),
which is used to signal that the context lock is already acquired and
to save a couple of redundant calls.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 blockdev.c | 54 ++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index fbef6845c8..0cc6c69ceb 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1762,8 +1762,10 @@ typedef struct DriveBackupState {
     BlockJob *job;
 } DriveBackupState;
=20
-static BlockJob *do_drive_backup(DriveBackup *backup, JobTxn *txn,
-                            Error **errp);
+static BlockJob *do_drive_backup(DriveBackup *backup,
+                                 BlockDriverState *backup_bs,
+                                 JobTxn *txn,
+                                 Error **errp);
=20
 static void drive_backup_prepare(BlkActionState *common, Error **errp)
 {
@@ -1781,6 +1783,11 @@ static void drive_backup_prepare(BlkActionState *c=
ommon, Error **errp)
         return;
     }
=20
+    if (!bs->drv) {
+        error_setg(errp, "Device has no medium");
+        return;
+    }
+
     aio_context =3D bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
=20
@@ -1789,7 +1796,9 @@ static void drive_backup_prepare(BlkActionState *co=
mmon, Error **errp)
=20
     state->bs =3D bs;
=20
-    state->job =3D do_drive_backup(backup, common->block_job_txn, &local=
_err);
+    state->job =3D do_drive_backup(backup, bs,
+                                 common->block_job_txn,
+                                 &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out;
@@ -3607,7 +3616,9 @@ static BlockJob *do_backup_common(BackupCommon *bac=
kup,
     return job;
 }
=20
-static BlockJob *do_drive_backup(DriveBackup *backup, JobTxn *txn,
+static BlockJob *do_drive_backup(DriveBackup *backup,
+                                 BlockDriverState *backup_bs,
+                                 JobTxn *txn,
                                  Error **errp)
 {
     BlockDriverState *bs;
@@ -3625,18 +3636,27 @@ static BlockJob *do_drive_backup(DriveBackup *bac=
kup, JobTxn *txn,
         backup->mode =3D NEW_IMAGE_MODE_ABSOLUTE_PATHS;
     }
=20
-    bs =3D bdrv_lookup_bs(backup->device, backup->device, errp);
-    if (!bs) {
-        return NULL;
-    }
+    if (backup_bs) {
+        bs =3D backup_bs;
+        /*
+         * If the caller passes us a BDS, we assume it has already
+         * acquired the context lock.
+         */
+        aio_context =3D bdrv_get_aio_context(bs);
+    } else {
+        bs =3D bdrv_lookup_bs(backup->device, backup->device, errp);
+        if (!bs) {
+            return NULL;
+        }
=20
-    if (!bs->drv) {
-        error_setg(errp, "Device has no medium");
-        return NULL;
-    }
+        if (!bs->drv) {
+            error_setg(errp, "Device has no medium");
+            return NULL;
+        }
=20
-    aio_context =3D bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
+        aio_context =3D bdrv_get_aio_context(bs);
+        aio_context_acquire(aio_context);
+    }
=20
     if (!backup->has_format) {
         backup->format =3D backup->mode =3D=3D NEW_IMAGE_MODE_EXISTING ?
@@ -3713,7 +3733,9 @@ static BlockJob *do_drive_backup(DriveBackup *backu=
p, JobTxn *txn,
 unref:
     bdrv_unref(target_bs);
 out:
-    aio_context_release(aio_context);
+    if (!backup_bs) {
+        aio_context_release(aio_context);
+    }
     return job;
 }
=20
@@ -3721,7 +3743,7 @@ void qmp_drive_backup(DriveBackup *arg, Error **err=
p)
 {
=20
     BlockJob *job;
-    job =3D do_drive_backup(arg, NULL, errp);
+    job =3D do_drive_backup(arg, NULL, NULL, errp);
     if (job) {
         job_start(&job->job);
     }
--=20
2.21.0


