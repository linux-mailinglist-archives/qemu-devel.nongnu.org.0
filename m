Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D6479147
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 18:43:34 +0200 (CEST)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs8kH-0005e3-JU
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 12:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33183)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hs8jV-0005AF-6Y
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:42:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hs8jU-00074w-0N
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:42:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50790)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hs8jR-00073d-Mg; Mon, 29 Jul 2019 12:42:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1181B4A6FB;
 Mon, 29 Jul 2019 16:42:41 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-188.ams2.redhat.com
 [10.36.116.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDF1D5C1A1;
 Mon, 29 Jul 2019 16:42:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 29 Jul 2019 18:42:34 +0200
Message-Id: <20190729164234.11573-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 29 Jul 2019 16:42:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.1] scsi-cd: Fix inserting read-only media
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

scsi-disks decides whether it has a read-only device by looking at
whether the BlockBackend specified as drive=3D... is read-only. In the
case of an anonymous BlockBackend (with a node name specified in
drive=3D...), this is the read-only flag of the attached node. In the cas=
e
of an empty anonymous BlockBackend, it's always read-write because
nothing prevented it from being read-write.

This is a problem because scsi-cd would take write permissions on the
anonymous BlockBackend of an empty drive created without a drive=3D...
option. Using blockdev-insert-medium with a read-only node fails then
with the error message "Block node is read-only".

Fix scsi_realize() so that scsi-cd devices always take read-only
permissions on their BlockBackend instead.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1733920
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/scsi/scsi-disk.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 8e95e3e38d..af3e622dc5 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2318,6 +2318,7 @@ static void scsi_disk_unit_attention_reported(SCSID=
evice *dev)
 static void scsi_realize(SCSIDevice *dev, Error **errp)
 {
     SCSIDiskState *s =3D DO_UPCAST(SCSIDiskState, qdev, dev);
+    bool read_only;
=20
     if (!s->qdev.conf.blk) {
         error_setg(errp, "drive property not set");
@@ -2351,8 +2352,13 @@ static void scsi_realize(SCSIDevice *dev, Error **=
errp)
             return;
         }
     }
-    if (!blkconf_apply_backend_options(&dev->conf,
-                                       blk_is_read_only(s->qdev.conf.blk=
),
+
+    read_only =3D blk_is_read_only(s->qdev.conf.blk);
+    if (dev->type =3D=3D TYPE_ROM) {
+        read_only =3D true;
+    }
+
+    if (!blkconf_apply_backend_options(&dev->conf, read_only,
                                        dev->type =3D=3D TYPE_DISK, errp)=
) {
         return;
     }
--=20
2.20.1


