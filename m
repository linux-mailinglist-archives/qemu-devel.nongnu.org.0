Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E773169EA4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 07:43:49 +0100 (CET)
Received: from localhost ([::1]:60524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j67T2-00080w-Aa
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 01:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47384)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <longpeng2@huawei.com>) id 1j67SA-000793-10
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:42:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <longpeng2@huawei.com>) id 1j67S9-0008W6-0f
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:42:53 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:56948 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <longpeng2@huawei.com>)
 id 1j67S8-0008V3-Lp
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:42:52 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8754A4B616F13571ED7D;
 Mon, 24 Feb 2020 14:42:50 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.173.228.124) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Feb 2020 14:42:39 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <mst@redhat.com>, <alex.williamson@redhat.com>
Subject: [PATCH RESEND 1/3] vfio/pci: fix a null pointer reference in
 vfio_rom_read
Date: Mon, 24 Feb 2020 14:42:17 +0800
Message-ID: <20200224064219.1434-2-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20200224064219.1434-1-longpeng2@huawei.com>
References: <20200224064219.1434-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.228.124]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: longpeng2@huawei.com, arei.gonglei@huawei.com, huangzhichao@huawei.com,
 qemu-devel@nongnu.org, weifuqiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Longpeng <longpeng2@huawei.com>

vfio_pci_load_rom() maybe failed and then the vdev->rom is NULL in
some situation (though I've not encountered yet), maybe we should
avoid the VM abort.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/vfio/pci.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5e75a95..ed798ae 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -768,7 +768,7 @@ static void vfio_update_msi(VFIOPCIDevice *vdev)
     }
 }
=20
-static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
+static bool vfio_pci_load_rom(VFIOPCIDevice *vdev)
 {
     struct vfio_region_info *reg_info;
     uint64_t size;
@@ -778,7 +778,7 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
     if (vfio_get_region_info(&vdev->vbasedev,
                              VFIO_PCI_ROM_REGION_INDEX, &reg_info)) {
         error_report("vfio: Error getting ROM info: %m");
-        return;
+        return false;
     }
=20
     trace_vfio_pci_load_rom(vdev->vbasedev.name, (unsigned long)reg_info=
->size,
@@ -797,7 +797,7 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
         error_printf("Device option ROM contents are probably invalid "
                     "(check dmesg).\nSkip option ROM probe with rombar=3D=
0, "
                     "or load from file with romfile=3D\n");
-        return;
+        return false;
     }
=20
     vdev->rom =3D g_malloc(size);
@@ -849,6 +849,8 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
             data[6] =3D -csum;
         }
     }
+
+    return true;
 }
=20
 static uint64_t vfio_rom_read(void *opaque, hwaddr addr, unsigned size)
@@ -863,8 +865,9 @@ static uint64_t vfio_rom_read(void *opaque, hwaddr ad=
dr, unsigned size)
     uint64_t data =3D 0;
=20
     /* Load the ROM lazily when the guest tries to read it */
-    if (unlikely(!vdev->rom && !vdev->rom_read_failed)) {
-        vfio_pci_load_rom(vdev);
+    if (unlikely(!vdev->rom && !vdev->rom_read_failed) &&
+        !vfio_pci_load_rom(vdev)) {
+        return 0;
     }
=20
     memcpy(&val, vdev->rom + addr,
--=20
1.8.3.1


