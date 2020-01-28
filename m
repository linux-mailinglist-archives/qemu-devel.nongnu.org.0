Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77E14B382
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 12:30:01 +0100 (CET)
Received: from localhost ([::1]:57504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwP4C-0003rK-Ba
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 06:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iwP3G-0003Jc-Fn
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 06:29:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iwP3F-00018F-1R
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 06:29:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43201
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iwP3D-00013y-0x
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 06:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580210938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OI8mBVqEcBZzaiINjHqhGlUuIS1h5Vf43Ur1+cM7j6c=;
 b=FoSgo4/P3uwD1T0L910vKMWYm4HoDuvedXe7opl+afge3DB23SfDZqygpdCoZ7vH4VaU73
 svYg4DUE02aIzdTMS7I2Xj2XcKNU9qlEdi/zejkjJKq1kQrtKyQ7s/lm+3dgUYtXqg5Cvw
 UTqAgU81vmlb92r3ZZbRnh3+WxiWiGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-Yw361nmmM9yzTYQLpRGmkQ-1; Tue, 28 Jan 2020 06:28:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5875213E4;
 Tue, 28 Jan 2020 11:28:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.36.118.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BED188883;
 Tue, 28 Jan 2020 11:28:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 71D2F9D61; Tue, 28 Jan 2020 12:28:51 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qxl: introduce hardware revision 5
Date: Tue, 28 Jan 2020 12:28:51 +0100
Message-Id: <20200128112851.15895-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Yw361nmmM9yzTYQLpRGmkQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only difference to hardware revision 4 is that the device doesn't
switch to VGA mode in case someone happens to touch a VGA register,
which should make things more robust in configurations with multiple
vga devices.

Swtiching back to VGA mode happens on reset, either full machine
reset or qxl device reset (QXL_IO_RESET ioport command).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl.h  | 2 +-
 hw/core/machine.c | 2 ++
 hw/display/qxl.c  | 7 ++++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index 80eb0d267269..707631a1f573 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -144,7 +144,7 @@ typedef struct PCIQXLDevice {
         }                                                               \
     } while (0)
=20
-#define QXL_DEFAULT_REVISION QXL_REVISION_STABLE_V12
+#define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)
=20
 /* qxl.c */
 void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 3e288bfceb7f..13a3b2c9c425 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -34,6 +34,8 @@ GlobalProperty hw_compat_4_2[] =3D {
     { "vhost-blk-device", "seg_max_adjust", "off"},
     { "usb-host", "suppress-remote-wake", "off" },
     { "usb-redir", "suppress-remote-wake", "off" },
+    { "qxl", "revision", "4" },
+    { "qxl-vga", "revision", "4" },
 };
 const size_t hw_compat_4_2_len =3D G_N_ELEMENTS(hw_compat_4_2);
=20
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 6d43b7433cff..c2e89ea40924 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1309,7 +1309,8 @@ static void qxl_vga_ioport_write(void *opaque, uint32=
_t addr, uint32_t val)
     PCIQXLDevice *qxl =3D container_of(vga, PCIQXLDevice, vga);
=20
     trace_qxl_io_write_vga(qxl->id, qxl_mode_to_string(qxl->mode), addr, v=
al);
-    if (qxl->mode !=3D QXL_MODE_VGA) {
+    if (qxl->mode !=3D QXL_MODE_VGA &&
+        qxl->revision <=3D QXL_REVISION_STABLE_V12) {
         qxl_destroy_primary(qxl, QXL_SYNC);
         qxl_soft_reset(qxl);
     }
@@ -2121,6 +2122,10 @@ static void qxl_realize_common(PCIQXLDevice *qxl, Er=
ror **errp)
         pci_device_rev =3D QXL_REVISION_STABLE_V12;
         io_size =3D pow2ceil(QXL_IO_RANGE_SIZE);
         break;
+    case 5: /* qxl-5 */
+        pci_device_rev =3D QXL_REVISION_STABLE_V12 + 1;
+        io_size =3D pow2ceil(QXL_IO_RANGE_SIZE);
+        break;
     default:
         error_setg(errp, "Invalid revision %d for qxl device (max %d)",
                    qxl->revision, QXL_DEFAULT_REVISION);
--=20
2.18.1


