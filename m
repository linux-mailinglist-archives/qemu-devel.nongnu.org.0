Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F51B98C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 17:08:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQCZT-00079P-LD
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 11:08:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hQCXg-0006N2-C7
	for qemu-devel@nongnu.org; Mon, 13 May 2019 11:07:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hQCXc-0003Ll-D8
	for qemu-devel@nongnu.org; Mon, 13 May 2019 11:07:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60234)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hQCXO-00036z-TG; Mon, 13 May 2019 11:06:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B53F2C0495A1;
	Mon, 13 May 2019 15:06:42 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-188.bos.redhat.com [10.18.17.188])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2C4C1001E65;
	Mon, 13 May 2019 15:06:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 13 May 2019 11:06:38 -0400
Message-Id: <20190513150638.14622-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 13 May 2019 15:06:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] blockdev: fix missed target unref for
 drive-backup
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, aihua liang <aliang@redhat.com>,
	John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the bitmap can't be used for whatever reason, we skip putting down
the reference. Fix that.

In practice, this means that if you attempt to gracefully exit QEMU
after a backup command being rejected, bdrv_close_all will fail and
tell you some unpleasant things via assert().

Reported-by: aihua liang <aliang@redhat.com>
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1703916
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 79fbac8450..e856ca4be9 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3525,8 +3525,7 @@ static BlockJob *do_drive_backup(DriveBackup *backu=
p, JobTxn *txn,
     if (set_backing_hd) {
         bdrv_set_backing_hd(target_bs, source, &local_err);
         if (local_err) {
-            bdrv_unref(target_bs);
-            goto out;
+            goto unref;
         }
     }
=20
@@ -3534,11 +3533,10 @@ static BlockJob *do_drive_backup(DriveBackup *bac=
kup, JobTxn *txn,
         bmap =3D bdrv_find_dirty_bitmap(bs, backup->bitmap);
         if (!bmap) {
             error_setg(errp, "Bitmap '%s' could not be found", backup->b=
itmap);
-            bdrv_unref(target_bs);
-            goto out;
+            goto unref;
         }
         if (bdrv_dirty_bitmap_check(bmap, BDRV_BITMAP_DEFAULT, errp)) {
-            goto out;
+            goto unref;
         }
     }
     if (!backup->auto_finalize) {
@@ -3552,12 +3550,13 @@ static BlockJob *do_drive_backup(DriveBackup *bac=
kup, JobTxn *txn,
                             backup->sync, bmap, backup->compress,
                             backup->on_source_error, backup->on_target_e=
rror,
                             job_flags, NULL, NULL, txn, &local_err);
-    bdrv_unref(target_bs);
     if (local_err !=3D NULL) {
         error_propagate(errp, local_err);
-        goto out;
+        goto unref;
     }
=20
+unref:
+    bdrv_unref(target_bs);
 out:
     aio_context_release(aio_context);
     return job;
--=20
2.20.1


