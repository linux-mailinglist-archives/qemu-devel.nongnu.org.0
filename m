Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6F72757B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 07:32:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTgLW-0001QH-5T
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 01:32:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTgIP-00080k-Bv
	for qemu-devel@nongnu.org; Thu, 23 May 2019 01:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTgIM-0005jw-Mx
	for qemu-devel@nongnu.org; Thu, 23 May 2019 01:29:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42073)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTgIL-0005hz-2P; Thu, 23 May 2019 01:29:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 458dNM3BjTz9sBb; Thu, 23 May 2019 15:29:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558589363;
	bh=6+yFFKzxCwb7KFLMf7OJjNXUm4RPq6kPWKgMltQOp3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KdqarK2HGcHpAHgrWdxi2C6JbZ6pm0IF0nvCwVk4G0Z9jdozawx1Ot6eekLHMajwp
	5RbE8WyFA42JyRwDziKnJFCCn1+tyoO8Rc7BhZTNKCM07F5HHBf0f15xWI+aS8y13r
	5QWuH9SbfhQImxMDJ+6QxEYMXFSexWgvyhyTquUE=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org
Date: Thu, 23 May 2019 15:29:18 +1000
Message-Id: <20190523052918.1129-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190523052918.1129-1-david@gibson.dropbear.id.au>
References: <20190523052918.1129-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PATCH 8/8] spapr: Allow hot plug/unplug of PCI
 bridges and devices under PCI bridges
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, groug@kaod.org, clg@kaod.org,
	mdroth@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pseries machine type already allows PCI hotplug and unplug via the
PAPR mechanism, but only on the root bus of each PHB.  This patch extends
this to allow PCI to PCI bridges to be hotplugged, and devices to be
hotplugged or unplugged under P2P bridges.

For now we disallow hot unplugging P2P bridges.  I tried doing that, but
haven't managed to get it working, I think due to some guest side problem=
s
that need further investigation.

To do this we dynamically construct DRCs when bridges are hot (or cold)
added, which can in turn be used to hotplug devices under the bridge.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 115 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 102 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 94691fcfc2..a4d5e46525 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1257,30 +1257,53 @@ static SpaprDrc *drc_from_dev(SpaprPhbState *phb,=
 PCIDevice *dev)
     return drc_from_devfn(phb, chassis, dev->devfn);
 }
=20
-static void add_drcs(SpaprPhbState *phb)
+static void add_drcs(SpaprPhbState *phb, PCIBus *bus, Error **errp)
 {
+    Object *owner;
     int i;
+    uint8_t chassis;
+    Error *local_err =3D NULL;
=20
     if (!phb->dr_enabled) {
         return;
     }
=20
+    chassis =3D chassis_from_bus(bus, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (pci_bus_is_root(bus)) {
+        owner =3D OBJECT(phb);
+    } else {
+        owner =3D OBJECT(pci_bridge_get_device(bus));
+    }
+
     for (i =3D 0; i < PCI_SLOT_MAX * PCI_FUNC_MAX; i++) {
-        spapr_dr_connector_new(OBJECT(phb), TYPE_SPAPR_DRC_PCI,
-                               drc_id_from_devfn(phb, 0, i));
+        spapr_dr_connector_new(owner, TYPE_SPAPR_DRC_PCI,
+                               drc_id_from_devfn(phb, chassis, i));
     }
 }
=20
-static void remove_drcs(SpaprPhbState *phb)
+static void remove_drcs(SpaprPhbState *phb, PCIBus *bus, Error **errp)
 {
     int i;
+    uint8_t chassis;
+    Error *local_err =3D NULL;
=20
     if (!phb->dr_enabled) {
         return;
     }
=20
+    chassis =3D chassis_from_bus(bus, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     for (i =3D PCI_SLOT_MAX * PCI_FUNC_MAX - 1; i >=3D 0; i--) {
-        SpaprDrc *drc =3D drc_from_devfn(phb, 0, i);
+        SpaprDrc *drc =3D drc_from_devfn(phb, chassis, i);
=20
         if (drc) {
             object_unparent(OBJECT(drc));
@@ -1325,6 +1348,7 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, PC=
IBus *bus,
         .sphb =3D sphb,
         .err =3D 0,
     };
+    int ret;
=20
     _FDT(fdt_setprop_cell(fdt, offset, "#address-cells",
                           RESOURCE_CELLS_ADDRESS));
@@ -1339,6 +1363,12 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, P=
CIBus *bus,
         }
     }
=20
+    ret =3D spapr_dt_drc(fdt, offset, OBJECT(bus->parent_dev),
+                       SPAPR_DR_CONNECTOR_TYPE_PCI);
+    if (ret) {
+        return ret;
+    }
+
     return offset;
 }
=20
@@ -1483,11 +1513,26 @@ int spapr_pci_dt_populate(SpaprDrc *drc, SpaprMac=
hineState *spapr,
     return 0;
 }
=20
+static void spapr_pci_bridge_plug(SpaprPhbState *phb,
+                                  PCIBridge *bridge,
+                                  Error **errp)
+{
+    Error *local_err =3D NULL;
+    PCIBus *bus =3D pci_bridge_get_sec_bus(bridge);
+
+    add_drcs(phb, bus, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+}
+
 static void spapr_pci_plug(HotplugHandler *plug_handler,
                            DeviceState *plugged_dev, Error **errp)
 {
     SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
     PCIDevice *pdev =3D PCI_DEVICE(plugged_dev);
+    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(plugged_dev);
     SpaprDrc *drc =3D drc_from_dev(phb, pdev);
     Error *local_err =3D NULL;
     PCIBus *bus =3D PCI_BUS(qdev_get_parent_bus(DEVICE(pdev)));
@@ -1509,6 +1554,14 @@ static void spapr_pci_plug(HotplugHandler *plug_ha=
ndler,
=20
     g_assert(drc);
=20
+    if (pc->is_bridge) {
+        spapr_pci_bridge_plug(phb, PCI_BRIDGE(plugged_dev), &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
     /* Following the QEMU convention used for PCIe multifunction
      * hotplug, we do not allow functions to be hotplugged to a
      * slot that already has function 0 present
@@ -1559,9 +1612,26 @@ out:
     error_propagate(errp, local_err);
 }
=20
+static void spapr_pci_bridge_unplug(SpaprPhbState *phb,
+                                    PCIBridge *bridge,
+                                    Error **errp)
+{
+    Error *local_err =3D NULL;
+    PCIBus *bus =3D pci_bridge_get_sec_bus(bridge);
+
+    remove_drcs(phb, bus, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+}
+
 static void spapr_pci_unplug(HotplugHandler *plug_handler,
                              DeviceState *plugged_dev, Error **errp)
 {
+    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(plugged_dev);
+    SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
+
     /* some version guests do not wait for completion of a device
      * cleanup (generally done asynchronously by the kernel) before
      * signaling to QEMU that the device is safe, but instead sleep
@@ -1573,6 +1643,16 @@ static void spapr_pci_unplug(HotplugHandler *plug_=
handler,
      * an 'idle' state, as the device cleanup code expects.
      */
     pci_device_reset(PCI_DEVICE(plugged_dev));
+
+    if (pc->is_bridge) {
+        Error *local_err =3D NULL;
+        spapr_pci_bridge_unplug(phb, PCI_BRIDGE(plugged_dev), &local_err=
);
+        if (local_err) {
+            error_propagate(errp, local_err);
+        }
+        return;
+    }
+
     object_property_set_bool(OBJECT(plugged_dev), false, "realized", NUL=
L);
 }
=20
@@ -1593,6 +1673,7 @@ static void spapr_pci_unplug_request(HotplugHandler=
 *plug_handler,
     g_assert(drc->dev =3D=3D plugged_dev);
=20
     if (!spapr_drc_unplug_requested(drc)) {
+        PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(plugged_dev);
         uint32_t slotnr =3D PCI_SLOT(pdev->devfn);
         SpaprDrc *func_drc;
         SpaprDrcClass *func_drck;
@@ -1606,6 +1687,10 @@ static void spapr_pci_unplug_request(HotplugHandle=
r *plug_handler,
             return;
         }
=20
+        if (pc->is_bridge) {
+            error_setg(errp, "PCI: Hot unplug of PCI bridges not support=
ed");
+        }
+
         /* ensure any other present functions are pending unplug */
         if (PCI_FUNC(pdev->devfn) =3D=3D 0) {
             for (i =3D 1; i < 8; i++) {
@@ -1658,6 +1743,7 @@ static void spapr_phb_unrealize(DeviceState *dev, E=
rror **errp)
     SpaprTceTable *tcet;
     int i;
     const unsigned windows_supported =3D spapr_phb_windows_supported(sph=
b);
+    Error *local_err =3D NULL;
=20
     spapr_phb_nvgpu_free(sphb);
=20
@@ -1678,7 +1764,11 @@ static void spapr_phb_unrealize(DeviceState *dev, =
Error **errp)
         }
     }
=20
-    remove_drcs(sphb);
+    remove_drcs(sphb, phb->bus, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
=20
     for (i =3D PCI_NUM_PINS - 1; i >=3D 0; i--) {
         if (sphb->lsi_table[i].irq) {
@@ -1743,6 +1833,7 @@ static void spapr_phb_realize(DeviceState *dev, Err=
or **errp)
     uint64_t msi_window_size =3D 4096;
     SpaprTceTable *tcet;
     const unsigned windows_supported =3D spapr_phb_windows_supported(sph=
b);
+    Error *local_err =3D NULL;
=20
     if (!spapr) {
         error_setg(errp, TYPE_SPAPR_PCI_HOST_BRIDGE " needs a pseries ma=
chine");
@@ -1879,7 +1970,6 @@ static void spapr_phb_realize(DeviceState *dev, Err=
or **errp)
     /* Initialize the LSI table */
     for (i =3D 0; i < PCI_NUM_PINS; i++) {
         uint32_t irq =3D SPAPR_IRQ_PCI_LSI + sphb->index * PCI_NUM_PINS =
+ i;
-        Error *local_err =3D NULL;
=20
         if (smc->legacy_irq_allocation) {
             irq =3D spapr_irq_findone(spapr, &local_err);
@@ -1904,7 +1994,11 @@ static void spapr_phb_realize(DeviceState *dev, Er=
ror **errp)
     }
=20
     /* allocate connectors for child PCI devices */
-    add_drcs(sphb);
+    add_drcs(sphb, phb->bus, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        goto unrealize;
+    }
=20
     /* DMA setup */
     for (i =3D 0; i < windows_supported; ++i) {
@@ -2320,11 +2414,6 @@ int spapr_dt_phb(SpaprPhbState *phb, uint32_t intc=
_phandle, void *fdt,
         return ret;
     }
=20
-    ret =3D spapr_dt_drc(fdt, bus_off, OBJECT(phb), SPAPR_DR_CONNECTOR_T=
YPE_PCI);
-    if (ret) {
-        return ret;
-    }
-
     spapr_phb_nvgpu_populate_dt(phb, fdt, bus_off, &errp);
     if (errp) {
         error_report_err(errp);
--=20
2.21.0


