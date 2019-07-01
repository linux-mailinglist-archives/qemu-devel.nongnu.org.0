Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD02F728
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 07:41:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWDou-0008Aq-V7
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 01:41:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hWDm3-0006Yn-KH
	for qemu-devel@nongnu.org; Thu, 30 May 2019 01:38:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hWDm2-0004Ct-2h
	for qemu-devel@nongnu.org; Thu, 30 May 2019 01:38:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33853 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hWDm1-00049X-E7; Thu, 30 May 2019 01:38:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DxFl4NR4z9s9T; Thu, 30 May 2019 15:38:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559194715;
	bh=fySpbhLIuV1xbHwCRwtBsMPg3+9Tjljv7iTKkbMSW14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ockaxCpIW4CK2PIFp58fSboSIBdGQUgVs2sgVO//nRSRhPJf85S/80cqvJ6fmcAMI
	RoXpHkcqEYOLN4YmOzdR4bwgcJz9osflRc6VHt+Nq5dzatNSUXzCleVQRawZOf8hUM
	DZE72NIHrw7riKdT2O340DSaFXSUWCYTiQHPUufI=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Thu, 30 May 2019 15:38:28 +1000
Message-Id: <20190530053831.22115-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530053831.22115-1-david@gibson.dropbear.id.au>
References: <20190530053831.22115-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PATCH v2 5/8] spapr: Clean up DRC index construction
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
Cc: mdroth@linux.ibm.com, mst@redhat.com, groug@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_pci.c currently has several confusingly similarly named functions f=
or
various conversions between representations of DRCs.  Make things clearer
by renaming things in a more consistent XXX_from_YYY() manner and remove
some called-only-once variants in favour of open coding.

While we're at it, move this code together in the file to avoid some extr=
a
forward references, and split out construction and removal of DRCs for th=
e
host bridge into helper functions.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/ppc/spapr_pci.c | 124 +++++++++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 56 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index efbbe705c7..9dd64bd0bd 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1216,8 +1216,60 @@ static const char *dt_name_from_class(uint8_t clas=
s, uint8_t subclass,
     return name;
 }
=20
-static uint32_t spapr_phb_get_pci_drc_index(SpaprPhbState *phb,
-                                            PCIDevice *pdev);
+/*
+ * DRC helper functions
+ */
+
+static uint32_t drc_id_from_devfn(SpaprPhbState *phb,
+                                  uint32_t busnr,
+                                  int32_t devfn)
+{
+    return (phb->index << 16) | (busnr << 8) | devfn;
+}
+
+static SpaprDrc *drc_from_devfn(SpaprPhbState *phb,
+                                uint32_t busnr, int32_t devfn)
+{
+    return spapr_drc_by_id(TYPE_SPAPR_DRC_PCI,
+                           drc_id_from_devfn(phb, busnr, devfn));
+}
+
+static SpaprDrc *drc_from_dev(SpaprPhbState *phb, PCIDevice *dev)
+{
+    uint32_t busnr =3D pci_bus_num(PCI_BUS(qdev_get_parent_bus(DEVICE(de=
v))));
+    return drc_from_devfn(phb, busnr, dev->devfn);
+}
+
+static void add_drcs(SpaprPhbState *phb)
+{
+    int i;
+
+    if (!phb->dr_enabled) {
+        return;
+    }
+
+    for (i =3D 0; i < PCI_SLOT_MAX * PCI_FUNC_MAX; i++) {
+        spapr_dr_connector_new(OBJECT(phb), TYPE_SPAPR_DRC_PCI,
+                               drc_id_from_devfn(phb, 0, i));
+    }
+}
+
+static void remove_drcs(SpaprPhbState *phb)
+{
+    int i;
+
+    if (!phb->dr_enabled) {
+        return;
+    }
+
+    for (i =3D PCI_SLOT_MAX * PCI_FUNC_MAX - 1; i >=3D 0; i--) {
+        SpaprDrc *drc =3D drc_from_devfn(phb, 0, i);
+
+        if (drc) {
+            object_unparent(OBJECT(drc));
+        }
+    }
+}
=20
 typedef struct PciWalkFdt {
     void *fdt;
@@ -1284,7 +1336,7 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb,=
 PCIDevice *dev,
     int func =3D PCI_FUNC(dev->devfn);
     PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(dev);
     ResourceProps rp;
-    uint32_t drc_index =3D spapr_phb_get_pci_drc_index(sphb, dev);
+    SpaprDrc *drc =3D drc_from_dev(sphb, dev);
     uint32_t vendor_id =3D pci_default_read_config(dev, PCI_VENDOR_ID, 2=
);
     uint32_t device_id =3D pci_default_read_config(dev, PCI_DEVICE_ID, 2=
);
     uint32_t revision_id =3D pci_default_read_config(dev, PCI_REVISION_I=
D, 1);
@@ -1351,8 +1403,9 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb,=
 PCIDevice *dev,
     _FDT(fdt_setprop_string(fdt, offset, "ibm,loc-code", loc_code));
     g_free(loc_code);
=20
-    if (drc_index) {
-        _FDT(fdt_setprop_cell(fdt, offset, "ibm,my-drc-index", drc_index=
));
+    if (drc) {
+        _FDT(fdt_setprop_cell(fdt, offset, "ibm,my-drc-index",
+                              spapr_drc_index(drc)));
     }
=20
     if (msi_present(dev)) {
@@ -1402,33 +1455,6 @@ void spapr_phb_remove_pci_device_cb(DeviceState *d=
ev)
     object_unparent(OBJECT(dev));
 }
=20
-static SpaprDrc *spapr_phb_get_pci_func_drc(SpaprPhbState *phb,
-                                                    uint32_t busnr,
-                                                    int32_t devfn)
-{
-    return spapr_drc_by_id(TYPE_SPAPR_DRC_PCI,
-                           (phb->index << 16) | (busnr << 8) | devfn);
-}
-
-static SpaprDrc *spapr_phb_get_pci_drc(SpaprPhbState *phb,
-                                               PCIDevice *pdev)
-{
-    uint32_t busnr =3D pci_bus_num(PCI_BUS(qdev_get_parent_bus(DEVICE(pd=
ev))));
-    return spapr_phb_get_pci_func_drc(phb, busnr, pdev->devfn);
-}
-
-static uint32_t spapr_phb_get_pci_drc_index(SpaprPhbState *phb,
-                                            PCIDevice *pdev)
-{
-    SpaprDrc *drc =3D spapr_phb_get_pci_drc(phb, pdev);
-
-    if (!drc) {
-        return 0;
-    }
-
-    return spapr_drc_index(drc);
-}
-
 int spapr_pci_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
                           void *fdt, int *fdt_start_offset, Error **errp=
)
 {
@@ -1445,7 +1471,7 @@ static void spapr_pci_plug(HotplugHandler *plug_han=
dler,
 {
     SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
     PCIDevice *pdev =3D PCI_DEVICE(plugged_dev);
-    SpaprDrc *drc =3D spapr_phb_get_pci_drc(phb, pdev);
+    SpaprDrc *drc =3D drc_from_dev(phb, pdev);
     Error *local_err =3D NULL;
     PCIBus *bus =3D PCI_BUS(qdev_get_parent_bus(DEVICE(pdev)));
     uint32_t slotnr =3D PCI_SLOT(pdev->devfn);
@@ -1496,8 +1522,8 @@ static void spapr_pci_plug(HotplugHandler *plug_han=
dler,
             SpaprDrcClass *func_drck;
             SpaprDREntitySense state;
=20
-            func_drc =3D spapr_phb_get_pci_func_drc(phb, pci_bus_num(bus=
),
-                                                  PCI_DEVFN(slotnr, i));
+            func_drc =3D drc_from_devfn(phb, pci_bus_num(bus),
+                                      PCI_DEVFN(slotnr, i));
             func_drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
             state =3D func_drck->dr_entity_sense(func_drc);
=20
@@ -1533,7 +1559,7 @@ static void spapr_pci_unplug_request(HotplugHandler=
 *plug_handler,
 {
     SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
     PCIDevice *pdev =3D PCI_DEVICE(plugged_dev);
-    SpaprDrc *drc =3D spapr_phb_get_pci_drc(phb, pdev);
+    SpaprDrc *drc =3D drc_from_dev(phb, pdev);
=20
     if (!phb->dr_enabled) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG,
@@ -1555,8 +1581,8 @@ static void spapr_pci_unplug_request(HotplugHandler=
 *plug_handler,
         /* ensure any other present functions are pending unplug */
         if (PCI_FUNC(pdev->devfn) =3D=3D 0) {
             for (i =3D 1; i < 8; i++) {
-                func_drc =3D spapr_phb_get_pci_func_drc(phb, pci_bus_num=
(bus),
-                                                      PCI_DEVFN(slotnr, =
i));
+                func_drc =3D drc_from_devfn(phb, pci_bus_num(bus),
+                                          PCI_DEVFN(slotnr, i));
                 func_drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
                 state =3D func_drck->dr_entity_sense(func_drc);
                 if (state =3D=3D SPAPR_DR_ENTITY_SENSE_PRESENT
@@ -1577,8 +1603,8 @@ static void spapr_pci_unplug_request(HotplugHandler=
 *plug_handler,
          */
         if (PCI_FUNC(pdev->devfn) =3D=3D 0) {
             for (i =3D 7; i >=3D 0; i--) {
-                func_drc =3D spapr_phb_get_pci_func_drc(phb, pci_bus_num=
(bus),
-                                                      PCI_DEVFN(slotnr, =
i));
+                func_drc =3D drc_from_devfn(phb, pci_bus_num(bus),
+                                          PCI_DEVFN(slotnr, i));
                 func_drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
                 state =3D func_drck->dr_entity_sense(func_drc);
                 if (state =3D=3D SPAPR_DR_ENTITY_SENSE_PRESENT) {
@@ -1626,16 +1652,7 @@ static void spapr_phb_unrealize(DeviceState *dev, =
Error **errp)
         }
     }
=20
-    if (sphb->dr_enabled) {
-        for (i =3D PCI_SLOT_MAX * 8 - 1; i >=3D 0; i--) {
-            SpaprDrc *drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_PCI,
-                                                    (sphb->index << 16) =
| i);
-
-            if (drc) {
-                object_unparent(OBJECT(drc));
-            }
-        }
-    }
+    remove_drcs(sphb);
=20
     for (i =3D PCI_NUM_PINS - 1; i >=3D 0; i--) {
         if (sphb->lsi_table[i].irq) {
@@ -1861,12 +1878,7 @@ static void spapr_phb_realize(DeviceState *dev, Er=
ror **errp)
     }
=20
     /* allocate connectors for child PCI devices */
-    if (sphb->dr_enabled) {
-        for (i =3D 0; i < PCI_SLOT_MAX * 8; i++) {
-            spapr_dr_connector_new(OBJECT(phb), TYPE_SPAPR_DRC_PCI,
-                                   (sphb->index << 16) | i);
-        }
-    }
+    add_drcs(sphb);
=20
     /* DMA setup */
     for (i =3D 0; i < windows_supported; ++i) {
--=20
2.21.0


