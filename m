Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97064134513
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 15:34:32 +0100 (CET)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipCPn-0002nL-Bw
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 09:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1ipCNN-0000nE-Md
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 09:32:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1ipCNM-0005t1-8d
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 09:32:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38823
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1ipCNM-0005sp-4m
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 09:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578493919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GeR/kB0OOigsbJM+7ZB53eBBcETmade9NqJj0AS9eu8=;
 b=ZprMk4tObF4H1CKVbeRtJ5FokI7r/xYMqeIQyP1v8gLMt9UKvC5/8wU39xP5pW8NosGAou
 l13wp9Px7UYblamlYb40bD5FV5Wf0Xabiij2m6iF5rgVSdGtPhdRXIOWvZtDU7drWuoLey
 2e//8rv+sFp8hOnvzv0iUUksH2y7JeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-R05EYAfIP3m61PEM-IBckA-1; Wed, 08 Jan 2020 09:31:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80E341005502;
 Wed,  8 Jan 2020 14:31:55 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A743460BE2;
 Wed,  8 Jan 2020 14:31:53 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/8] blockdev: honor bdrv_try_set_aio_context() context
 requirements
Date: Wed,  8 Jan 2020 15:31:34 +0100
Message-Id: <20200108143138.129909-5-slp@redhat.com>
In-Reply-To: <20200108143138.129909-1-slp@redhat.com>
References: <20200108143138.129909-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: R05EYAfIP3m61PEM-IBckA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Sergio Lopez <slp@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_try_set_aio_context() requires that the old context is held, and
the new context is not held. Fix all the occurrences where it's not
done this way.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 blockdev.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 8 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 152a0f7454..1dacbc20ec 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1535,6 +1535,7 @@ static void external_snapshot_prepare(BlkActionState =
*common,
                              DO_UPCAST(ExternalSnapshotState, common, comm=
on);
     TransactionAction *action =3D common->action;
     AioContext *aio_context;
+    AioContext *old_context;
     int ret;
=20
     /* 'blockdev-snapshot' and 'blockdev-snapshot-sync' have similar
@@ -1675,7 +1676,16 @@ static void external_snapshot_prepare(BlkActionState=
 *common,
         goto out;
     }
=20
+    /* Honor bdrv_try_set_aio_context() context acquisition requirements. =
*/
+    old_context =3D bdrv_get_aio_context(state->new_bs);
+    aio_context_release(aio_context);
+    aio_context_acquire(old_context);
+
     ret =3D bdrv_try_set_aio_context(state->new_bs, aio_context, errp);
+
+    aio_context_release(old_context);
+    aio_context_acquire(aio_context);
+
     if (ret < 0) {
         goto out;
     }
@@ -1775,11 +1785,13 @@ static void drive_backup_prepare(BlkActionState *co=
mmon, Error **errp)
     BlockDriverState *target_bs;
     BlockDriverState *source =3D NULL;
     AioContext *aio_context;
+    AioContext *old_context;
     QDict *options;
     Error *local_err =3D NULL;
     int flags;
     int64_t size;
     bool set_backing_hd =3D false;
+    int ret;
=20
     assert(common->action->type =3D=3D TRANSACTION_ACTION_KIND_DRIVE_BACKU=
P);
     backup =3D common->action->u.drive_backup.data;
@@ -1868,6 +1880,21 @@ static void drive_backup_prepare(BlkActionState *com=
mon, Error **errp)
         goto out;
     }
=20
+    /* Honor bdrv_try_set_aio_context() context acquisition requirements. =
*/
+    old_context =3D bdrv_get_aio_context(target_bs);
+    aio_context_release(aio_context);
+    aio_context_acquire(old_context);
+
+    ret =3D bdrv_try_set_aio_context(target_bs, aio_context, errp);
+    if (ret < 0) {
+        bdrv_unref(target_bs);
+        aio_context_release(old_context);
+        return;
+    }
+
+    aio_context_release(old_context);
+    aio_context_acquire(aio_context);
+
     if (set_backing_hd) {
         bdrv_set_backing_hd(target_bs, source, &local_err);
         if (local_err) {
@@ -1947,6 +1974,8 @@ static void blockdev_backup_prepare(BlkActionState *c=
ommon, Error **errp)
     BlockDriverState *bs;
     BlockDriverState *target_bs;
     AioContext *aio_context;
+    AioContext *old_context;
+    int ret;
=20
     assert(common->action->type =3D=3D TRANSACTION_ACTION_KIND_BLOCKDEV_BA=
CKUP);
     backup =3D common->action->u.blockdev_backup.data;
@@ -1961,7 +1990,18 @@ static void blockdev_backup_prepare(BlkActionState *=
common, Error **errp)
         return;
     }
=20
+    /* Honor bdrv_try_set_aio_context() context acquisition requirements. =
*/
     aio_context =3D bdrv_get_aio_context(bs);
+    old_context =3D bdrv_get_aio_context(target_bs);
+    aio_context_acquire(old_context);
+
+    ret =3D bdrv_try_set_aio_context(target_bs, aio_context, errp);
+    if (ret < 0) {
+        aio_context_release(old_context);
+        return;
+    }
+
+    aio_context_release(old_context);
     aio_context_acquire(aio_context);
     state->bs =3D bs;
=20
@@ -3562,7 +3602,6 @@ static BlockJob *do_backup_common(BackupCommon *backu=
p,
     BlockJob *job =3D NULL;
     BdrvDirtyBitmap *bmap =3D NULL;
     int job_flags =3D JOB_DEFAULT;
-    int ret;
=20
     if (!backup->has_speed) {
         backup->speed =3D 0;
@@ -3586,11 +3625,6 @@ static BlockJob *do_backup_common(BackupCommon *back=
up,
         backup->compress =3D false;
     }
=20
-    ret =3D bdrv_try_set_aio_context(target_bs, aio_context, errp);
-    if (ret < 0) {
-        return NULL;
-    }
-
     if ((backup->sync =3D=3D MIRROR_SYNC_MODE_BITMAP) ||
         (backup->sync =3D=3D MIRROR_SYNC_MODE_INCREMENTAL)) {
         /* done before desugaring 'incremental' to print the right message=
 */
@@ -3825,6 +3859,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     BlockDriverState *bs;
     BlockDriverState *source, *target_bs;
     AioContext *aio_context;
+    AioContext *old_context;
     BlockMirrorBackingMode backing_mode;
     Error *local_err =3D NULL;
     QDict *options =3D NULL;
@@ -3937,12 +3972,22 @@ void qmp_drive_mirror(DriveMirror *arg, Error **err=
p)
                    (arg->mode =3D=3D NEW_IMAGE_MODE_EXISTING ||
                     !bdrv_has_zero_init(target_bs)));
=20
+
+    /* Honor bdrv_try_set_aio_context() context acquisition requirements. =
*/
+    old_context =3D bdrv_get_aio_context(target_bs);
+    aio_context_release(aio_context);
+    aio_context_acquire(old_context);
+
     ret =3D bdrv_try_set_aio_context(target_bs, aio_context, errp);
     if (ret < 0) {
         bdrv_unref(target_bs);
-        goto out;
+        aio_context_release(old_context);
+        return;
     }
=20
+    aio_context_release(old_context);
+    aio_context_acquire(aio_context);
+
     blockdev_mirror_common(arg->has_job_id ? arg->job_id : NULL, bs, targe=
t_bs,
                            arg->has_replaces, arg->replaces, arg->sync,
                            backing_mode, zero_target,
@@ -3984,6 +4029,7 @@ void qmp_blockdev_mirror(bool has_job_id, const char =
*job_id,
     BlockDriverState *bs;
     BlockDriverState *target_bs;
     AioContext *aio_context;
+    AioContext *old_context;
     BlockMirrorBackingMode backing_mode =3D MIRROR_LEAVE_BACKING_CHAIN;
     Error *local_err =3D NULL;
     bool zero_target;
@@ -4001,10 +4047,16 @@ void qmp_blockdev_mirror(bool has_job_id, const cha=
r *job_id,
=20
     zero_target =3D (sync =3D=3D MIRROR_SYNC_MODE_FULL);
=20
+    /* Honor bdrv_try_set_aio_context() context acquisition requirements. =
*/
+    old_context =3D bdrv_get_aio_context(target_bs);
     aio_context =3D bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
+    aio_context_acquire(old_context);
=20
     ret =3D bdrv_try_set_aio_context(target_bs, aio_context, errp);
+
+    aio_context_release(old_context);
+    aio_context_acquire(aio_context);
+
     if (ret < 0) {
         goto out;
     }
--=20
2.23.0


