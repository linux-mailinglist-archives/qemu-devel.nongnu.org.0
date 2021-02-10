Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765BB315F50
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:19:59 +0100 (CET)
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ir0-0003lD-FL
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip1-0001UK-1x; Wed, 10 Feb 2021 01:17:55 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ioq-0000CX-Mh; Wed, 10 Feb 2021 01:17:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gk4Zx4z9sVw; Wed, 10 Feb 2021 17:17:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937858;
 bh=qzAwIBtA882E4DN3wvB1mY19mX5+5eCP3AXsSQ+IcGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oR5h318bVB7kGd/HJNMF2LXsNzpAyZy1QCr7Tset8oYAj1EhCq5iEqcbiJpnmXGgL
 cbb9+dS1KG0X9DGRaJCEroqW/bKIgfq+RfnEaQ6vfaQfowCGlLWkTPrN3VtfkJzd8z
 CVotZx7FTL/w8ED3ZvOtL8WJz0s7TJNNGT5Ltkr8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 03/19] spapr: Adjust firmware path of PCI devices
Date: Wed, 10 Feb 2021 17:17:19 +1100
Message-Id: <20210210061735.304384-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

It is currently not possible to perform a strict boot from USB storage:

$ qemu-system-ppc64 -accel kvm -nodefaults -nographic -serial stdio \
	-boot strict=on \
	-device qemu-xhci \
	-device usb-storage,drive=disk,bootindex=0 \
	-blockdev driver=file,node-name=disk,filename=fedora-ppc64le.qcow2

SLOF **********************************************************************
QEMU Starting
 Build Date = Jul 17 2020 11:15:24
 FW Version = git-e18ddad8516ff2cf
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

Trying to load:  from: /pci@800000020000000/usb@0/storage@1/disk@101000000000000 ...
E3405: No such device

E3407: Load failed

  Type 'boot' and press return to continue booting the system.
  Type 'reset-all' and press return to reboot the system.

Ready!
0 >

The device tree handed over by QEMU to SLOF indeed contains:

qemu,boot-list =
	"/pci@800000020000000/usb@0/storage@1/disk@101000000000000 HALT";

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
Message-Id: <20210122170157.246374-1-groug@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c              |  5 +++++
 hw/ppc/spapr_pci.c          | 33 ++++++++++++++++++---------------
 include/hw/pci-host/spapr.h |  2 ++
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0ecc193468..f9ea9d1097 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3054,6 +3054,7 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
     SCSIDevice *d = CAST(SCSIDevice,  dev, TYPE_SCSI_DEVICE);
     SpaprPhbState *phb = CAST(SpaprPhbState, dev, TYPE_SPAPR_PCI_HOST_BRIDGE);
     VHostSCSICommon *vsc = CAST(VHostSCSICommon, dev, TYPE_VHOST_SCSI_COMMON);
+    PCIDevice *pcidev = CAST(PCIDevice, dev, TYPE_PCI_DEVICE);
 
     if (d) {
         void *spapr = CAST(void, bus->parent, "spapr-vscsi");
@@ -3127,6 +3128,10 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
         return g_strdup_printf("pci@%x", PCI_SLOT(pcidev->devfn));
     }
 
+    if (pcidev) {
+        return spapr_pci_fw_dev_name(pcidev);
+    }
+
     return NULL;
 }
 
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 24b4972300..f1c7479816 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1344,15 +1344,29 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, PCIBus *bus,
     return offset;
 }
 
+char *spapr_pci_fw_dev_name(PCIDevice *dev)
+{
+    const gchar *basename;
+    int slot = PCI_SLOT(dev->devfn);
+    int func = PCI_FUNC(dev->devfn);
+    uint32_t ccode = pci_default_read_config(dev, PCI_CLASS_PROG, 3);
+
+    basename = dt_name_from_class((ccode >> 16) & 0xff, (ccode >> 8) & 0xff,
+                                  ccode & 0xff);
+
+    if (func != 0) {
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
-    int slot = PCI_SLOT(dev->devfn);
-    int func = PCI_FUNC(dev->devfn);
+    g_autofree gchar *nodename = spapr_pci_fw_dev_name(dev);
     PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
     ResourceProps rp;
     SpaprDrc *drc = drc_from_dev(sphb, dev);
@@ -1369,19 +1383,8 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
     uint32_t pci_status = pci_default_read_config(dev, PCI_STATUS, 2);
     gchar *loc_code;
 
-    basename = dt_name_from_class((ccode >> 16) & 0xff, (ccode >> 8) & 0xff,
-                                  ccode & 0xff);
-
-    if (func != 0) {
-        nodename = g_strdup_printf("%s@%x,%x", basename, slot, func);
-    } else {
-        nodename = g_strdup_printf("%s@%x", basename, slot);
-    }
-
     _FDT(offset = fdt_add_subnode(fdt, parent_offset, nodename));
 
-    g_free(nodename);
-
     /* in accordance with PAPR+ v2.7 13.6.3, Table 181 */
     _FDT(fdt_setprop_cell(fdt, offset, "vendor-id", vendor_id));
     _FDT(fdt_setprop_cell(fdt, offset, "device-id", device_id));
diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index bd014823a9..5b03a7b0eb 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -210,4 +210,6 @@ static inline unsigned spapr_phb_windows_supported(SpaprPhbState *sphb)
     return sphb->ddw_enabled ? SPAPR_PCI_DMA_MAX_WINDOWS : 1;
 }
 
+char *spapr_pci_fw_dev_name(PCIDevice *dev);
+
 #endif /* PCI_HOST_SPAPR_H */
-- 
2.29.2


