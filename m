Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D3F300950
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:11:36 +0100 (CET)
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2zyC-0003Uc-1I
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2zpI-0003qD-4X
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:02:24 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:20813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2zpF-0004BN-DD
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:02:23 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-D2W8w_zsMx22pWITZW4wZQ-1; Fri, 22 Jan 2021 12:02:01 -0500
X-MC-Unique: D2W8w_zsMx22pWITZW4wZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 084A88144E5;
 Fri, 22 Jan 2021 17:02:00 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 646C35DA33;
 Fri, 22 Jan 2021 17:01:58 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] spapr: Adjust firmware path of PCI devices
Date: Fri, 22 Jan 2021 18:01:57 +0100
Message-Id: <20210122170157.246374-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is currently not possible to perform a strict boot from USB storage:

$ qemu-system-ppc64 -accel kvm -nodefaults -nographic -serial stdio \
=09-boot strict=3Don \
=09-device qemu-xhci \
=09-device usb-storage,drive=3Ddisk,bootindex=3D0 \
=09-blockdev driver=3Dfile,node-name=3Ddisk,filename=3Dfedora-ppc64le.qcow2


SLOF **********************************************************************
QEMU Starting
 Build Date =3D Jul 17 2020 11:15:24
 FW Version =3D git-e18ddad8516ff2cf
 Press "s" to enter Open Firmware.

Populating /vdevice methods
Populating /vdevice/vty@71000000
Populating /vdevice/nvram@71000001
Populating /pci@800000020000000
                     00 0000 (D) : 1b36 000d    serial bus [ usb-xhci ]
No NVRAM common partition, re-initializing...
Scanning USB
  XHCI: Initializing
    USB Storage
       SCSI: Looking for devices
          101000000000000 DISK     : "QEMU     QEMU HARDDISK    2.5+"
Using default console: /vdevice/vty@71000000

  Welcome to Open Firmware

  Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
  This program and the accompanying materials are made available
  under the terms of the BSD License available at
  http://www.opensource.org/licenses/bsd-license.php


Trying to load:  from: /pci@800000020000000/usb@0/storage@1/disk@1010000000=
00000 ...
E3405: No such device

E3407: Load failed

  Type 'boot' and press return to continue booting the system.
  Type 'reset-all' and press return to reboot the system.


Ready!
0 >

The device tree handed over by QEMU to SLOF indeed contains:

qemu,boot-list =3D
=09"/pci@800000020000000/usb@0/storage@1/disk@101000000000000 HALT";

but the device node is named usb-xhci@0, not usb@0.

This happens because the firmware names of PCI devices returned
by get_boot_devices_list() come from pcibus_get_fw_dev_path(),
while the sPAPR PHB code uses a different naming scheme for
device nodes. This inconsistency has always been there but it was
hidden for a long time because SLOF used to rename USB device
nodes, until this commit, merged in QEMU 4.2.0 :

commit 85164ad4ed9960cac842fa4cc067c6b6699b0994
Author: Alexey Kardashevskiy <aik@ozlabs.ru>
Date:   Wed Sep 11 16:24:32 2019 +1000

    pseries: Update SLOF firmware image

    This fixes USB host bus adapter name in the device tree to match QEMU's
    one.

    Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Fortunately, sPAPR implements the firmware path provider interface.
This provides a way to override the default firmware paths.

Just factor out the sPAPR PHB naming logic from spapr_dt_pci_device()
to a helper, and use it in the sPAPR firmware path provider hook.

Fixes: 85164ad4ed99 ("pseries: Update SLOF firmware image")
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/pci-host/spapr.h |  2 ++
 hw/ppc/spapr.c              |  5 +++++
 hw/ppc/spapr_pci.c          | 33 ++++++++++++++++++---------------
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index bd014823a933..5b03a7b0eb3f 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -210,4 +210,6 @@ static inline unsigned spapr_phb_windows_supported(Spap=
rPhbState *sphb)
     return sphb->ddw_enabled ? SPAPR_PCI_DMA_MAX_WINDOWS : 1;
 }
=20
+char *spapr_pci_fw_dev_name(PCIDevice *dev);
+
 #endif /* PCI_HOST_SPAPR_H */
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6ab27ea269d5..632502c2ecf8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3048,6 +3048,7 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p,=
 BusState *bus,
     SCSIDevice *d =3D CAST(SCSIDevice,  dev, TYPE_SCSI_DEVICE);
     SpaprPhbState *phb =3D CAST(SpaprPhbState, dev, TYPE_SPAPR_PCI_HOST_BR=
IDGE);
     VHostSCSICommon *vsc =3D CAST(VHostSCSICommon, dev, TYPE_VHOST_SCSI_CO=
MMON);
+    PCIDevice *pcidev =3D CAST(PCIDevice, dev, TYPE_PCI_DEVICE);
=20
     if (d) {
         void *spapr =3D CAST(void, bus->parent, "spapr-vscsi");
@@ -3121,6 +3122,10 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p=
, BusState *bus,
         return g_strdup_printf("pci@%x", PCI_SLOT(pcidev->devfn));
     }
=20
+    if (pcidev) {
+        return spapr_pci_fw_dev_name(pcidev);
+    }
+
     return NULL;
 }
=20
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 76d7c91e9c64..da6eb58724c8 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1334,15 +1334,29 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, PC=
IBus *bus,
     return offset;
 }
=20
+char *spapr_pci_fw_dev_name(PCIDevice *dev)
+{
+    const gchar *basename;
+    int slot =3D PCI_SLOT(dev->devfn);
+    int func =3D PCI_FUNC(dev->devfn);
+    uint32_t ccode =3D pci_default_read_config(dev, PCI_CLASS_PROG, 3);
+
+    basename =3D dt_name_from_class((ccode >> 16) & 0xff, (ccode >> 8) & 0=
xff,
+                                  ccode & 0xff);
+
+    if (func !=3D 0) {
+        return g_strdup_printf("%s@%x,%x", basename, slot, func);
+    } else {
+        return g_strdup_printf("%s@%x", basename, slot);
+    }
+}
+
 /* create OF node for pci device and required OF DT properties */
 static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
                                void *fdt, int parent_offset)
 {
     int offset;
-    const gchar *basename;
-    gchar *nodename;
-    int slot =3D PCI_SLOT(dev->devfn);
-    int func =3D PCI_FUNC(dev->devfn);
+    g_autofree gchar *nodename =3D spapr_pci_fw_dev_name(dev);
     PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(dev);
     ResourceProps rp;
     SpaprDrc *drc =3D drc_from_dev(sphb, dev);
@@ -1359,19 +1373,8 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb, =
PCIDevice *dev,
     uint32_t pci_status =3D pci_default_read_config(dev, PCI_STATUS, 2);
     gchar *loc_code;
=20
-    basename =3D dt_name_from_class((ccode >> 16) & 0xff, (ccode >> 8) & 0=
xff,
-                                  ccode & 0xff);
-
-    if (func !=3D 0) {
-        nodename =3D g_strdup_printf("%s@%x,%x", basename, slot, func);
-    } else {
-        nodename =3D g_strdup_printf("%s@%x", basename, slot);
-    }
-
     _FDT(offset =3D fdt_add_subnode(fdt, parent_offset, nodename));
=20
-    g_free(nodename);
-
     /* in accordance with PAPR+ v2.7 13.6.3, Table 181 */
     _FDT(fdt_setprop_cell(fdt, offset, "vendor-id", vendor_id));
     _FDT(fdt_setprop_cell(fdt, offset, "device-id", device_id));
--=20
2.26.2


