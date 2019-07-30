Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F747ABB4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 16:59:33 +0200 (CEST)
Received: from localhost ([::1]:33704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsTb9-00068U-Sl
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 10:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39578)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hsTa1-00050j-Nt
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 10:58:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hsTa0-0007xX-Mu
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 10:58:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33044)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hsTZx-0007uv-Tk; Tue, 30 Jul 2019 10:58:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2FC5F308402E;
 Tue, 30 Jul 2019 14:58:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-75.ams2.redhat.com
 [10.36.117.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70D925D6A7;
 Tue, 30 Jul 2019 14:58:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 16:57:26 +0200
Message-Id: <20190730145727.28965-2-kwolf@redhat.com>
In-Reply-To: <20190730145727.28965-1-kwolf@redhat.com>
References: <20190730145727.28965-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 30 Jul 2019 14:58:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.1 1/2] fdc: Fix inserting read-only media
 in empty drive
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
Cc: kwolf@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to insert a read-only medium (i.e. a read-only block node) to
the BlockBackend of a floppy drive, we must not have taken write
permissions on that BlockBackend, or the operation will fail with the
error message "Block node is read-only".

The device already takes care to remove all permissions when the medium
is ejected, but the state isn't correct if the drive is initially empty:
It uses blk_is_read_only() to check whether write permissions should be
taken, but this function returns false for empty BlockBackends in the
common case.

Fix floppy_drive_realize() to avoid taking write permissions if the
drive is empty.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/fdc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 77af9979de..9b24cb9b85 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -514,6 +514,7 @@ static void floppy_drive_realize(DeviceState *qdev, E=
rror **errp)
     FloppyDrive *dev =3D FLOPPY_DRIVE(qdev);
     FloppyBus *bus =3D FLOPPY_BUS(qdev->parent_bus);
     FDrive *drive;
+    bool read_only;
     int ret;
=20
     if (dev->unit =3D=3D -1) {
@@ -542,6 +543,12 @@ static void floppy_drive_realize(DeviceState *qdev, =
Error **errp)
         dev->conf.blk =3D blk_new(qemu_get_aio_context(), 0, BLK_PERM_AL=
L);
         ret =3D blk_attach_dev(dev->conf.blk, qdev);
         assert(ret =3D=3D 0);
+
+        /* Don't take write permissions on an empty drive to allow attac=
hing a
+         * read-only node later */
+        read_only =3D true;
+    } else {
+        read_only =3D !blk_bs(dev->conf.blk) || blk_is_read_only(dev->co=
nf.blk);
     }
=20
     blkconf_blocksizes(&dev->conf);
@@ -559,9 +566,7 @@ static void floppy_drive_realize(DeviceState *qdev, E=
rror **errp)
     dev->conf.rerror =3D BLOCKDEV_ON_ERROR_AUTO;
     dev->conf.werror =3D BLOCKDEV_ON_ERROR_AUTO;
=20
-    if (!blkconf_apply_backend_options(&dev->conf,
-                                       blk_is_read_only(dev->conf.blk),
-                                       false, errp)) {
+    if (!blkconf_apply_backend_options(&dev->conf, read_only, false, err=
p)) {
         return;
     }
=20
--=20
2.20.1


