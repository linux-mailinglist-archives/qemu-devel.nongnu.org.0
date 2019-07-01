Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B656A41BF8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 08:07:10 +0200 (CEST)
Received: from localhost ([::1]:56892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hawPc-0001NR-Ld
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 02:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58575)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1haw8o-0004Zp-P7
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:49:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1haw8k-00072p-LQ
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:49:46 -0400
Received: from ozlabs.org ([203.11.71.1]:54437)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1haw8k-00070v-0m; Wed, 12 Jun 2019 01:49:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45NwtR0HDnz9sND; Wed, 12 Jun 2019 15:49:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1560318575;
 bh=5mQj3sa0x70jnY5xmg5WskDu7xryaD4fDO6cG7edD8s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R0nKqTghPz6JQ8Eq2AKLQ8le+MAwhe+WZLTva9eRdKB0Envz/NRr6f0W6POMwaYmf
 DWoviui49qKpDFOvToSMqj41PItnsJUdJLozQlGBBuhaAaXE8xWIC1dP0cl3+GTxrz
 nGtI0maUxYwHD9JMBqJ319OrLjYTtnSrttgcTjKg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 12 Jun 2019 15:49:21 +1000
Message-Id: <20190612054929.21136-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612054929.21136-1-david@gibson.dropbear.id.au>
References: <20190612054929.21136-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 05/13] spapr: Clean up dt creation for PCI buses
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
Cc: lvivier@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Device nodes for PCI bridges (both host and P2P) describe both the bridge
device itself and the bus hanging off it, handling of this is a bit of a
mess.

spapr_dt_pci_device() has a few things it only adds for non-bridges, but
always adds #address-cells and #size-cells which should only appear for
bridges.  But the walking down the subordinate PCI bus is done in one of
its callers spapr_populate_pci_devices_dt().  The PHB dt creation in
spapr_populate_pci_dt() open codes some similar logic to the bridge case.

This patch consolidates things in a bunch of ways:
 * Bus specific dt info is now created in spapr_dt_pci_bus() used for bot=
h
   P2P bridges and the host bridge.  This includes walking subordinate
   devices
 * spapr_dt_pci_device() now calls spapr_dt_pci_bus() when called on a
   P2P bridge
 * We do detection of bridges with the is_bridge field of the device clas=
s,
   rather than checking PCI config space directly, for consistency with
   qemu's core PCI code.
 * Several things are renamed for brevity and clarity

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/ppc/spapr.c              |   7 +-
 hw/ppc/spapr_pci.c          | 140 +++++++++++++++++++-----------------
 include/hw/pci-host/spapr.h |   4 +-
 3 files changed, 79 insertions(+), 72 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e2b33e5890..44573adce7 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1309,8 +1309,7 @@ static void *spapr_build_fdt(SpaprMachineState *spa=
pr)
     }
=20
     QLIST_FOREACH(phb, &spapr->phbs, list) {
-        ret =3D spapr_populate_pci_dt(phb, PHANDLE_INTC, fdt,
-                                    spapr->irq->nr_msis, NULL);
+        ret =3D spapr_dt_phb(phb, PHANDLE_INTC, fdt, spapr->irq->nr_msis=
, NULL);
         if (ret < 0) {
             error_report("couldn't setup PCI devices in fdt");
             exit(1);
@@ -3917,8 +3916,8 @@ int spapr_phb_dt_populate(SpaprDrc *drc, SpaprMachi=
neState *spapr,
         return -1;
     }
=20
-    if (spapr_populate_pci_dt(sphb, intc_phandle, fdt, spapr->irq->nr_ms=
is,
-                              fdt_start_offset)) {
+    if (spapr_dt_phb(sphb, intc_phandle, fdt, spapr->irq->nr_msis,
+                     fdt_start_offset)) {
         error_setg(errp, "unable to create FDT node for PHB %d", sphb->i=
ndex);
         return -1;
     }
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 8e10fc6857..dc5e46e6d4 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1219,6 +1219,60 @@ static const char *dt_name_from_class(uint8_t clas=
s, uint8_t subclass,
 static uint32_t spapr_phb_get_pci_drc_index(SpaprPhbState *phb,
                                             PCIDevice *pdev);
=20
+typedef struct PciWalkFdt {
+    void *fdt;
+    int offset;
+    SpaprPhbState *sphb;
+    int err;
+} PciWalkFdt;
+
+static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
+                               void *fdt, int parent_offset);
+
+static void spapr_dt_pci_device_cb(PCIBus *bus, PCIDevice *pdev,
+                                   void *opaque)
+{
+    PciWalkFdt *p =3D opaque;
+    int err;
+
+    if (p->err) {
+        /* Something's already broken, don't keep going */
+        return;
+    }
+
+    err =3D spapr_dt_pci_device(p->sphb, pdev, p->fdt, p->offset);
+    if (err < 0) {
+        p->err =3D err;
+    }
+}
+
+/* Augment PCI device node with bridge specific information */
+static int spapr_dt_pci_bus(SpaprPhbState *sphb, PCIBus *bus,
+                               void *fdt, int offset)
+{
+    PciWalkFdt cbinfo =3D {
+        .fdt =3D fdt,
+        .offset =3D offset,
+        .sphb =3D sphb,
+        .err =3D 0,
+    };
+
+    _FDT(fdt_setprop_cell(fdt, offset, "#address-cells",
+                          RESOURCE_CELLS_ADDRESS));
+    _FDT(fdt_setprop_cell(fdt, offset, "#size-cells",
+                          RESOURCE_CELLS_SIZE));
+
+    if (bus) {
+        pci_for_each_device_reverse(bus, pci_bus_num(bus),
+                                    spapr_dt_pci_device_cb, &cbinfo);
+        if (cbinfo.err) {
+            return cbinfo.err;
+        }
+    }
+
+    return offset;
+}
+
 /* create OF node for pci device and required OF DT properties */
 static int spapr_dt_pci_device(SpaprPhbState *sphb, PCIDevice *dev,
                                void *fdt, int parent_offset)
@@ -1228,10 +1282,9 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb=
, PCIDevice *dev,
     gchar *nodename;
     int slot =3D PCI_SLOT(dev->devfn);
     int func =3D PCI_FUNC(dev->devfn);
+    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(dev);
     ResourceProps rp;
     uint32_t drc_index =3D spapr_phb_get_pci_drc_index(sphb, dev);
-    uint32_t header_type =3D pci_default_read_config(dev, PCI_HEADER_TYP=
E, 1);
-    bool is_bridge =3D (header_type =3D=3D PCI_HEADER_TYPE_BRIDGE);
     uint32_t vendor_id =3D pci_default_read_config(dev, PCI_VENDOR_ID, 2=
);
     uint32_t device_id =3D pci_default_read_config(dev, PCI_DEVICE_ID, 2=
);
     uint32_t revision_id =3D pci_default_read_config(dev, PCI_REVISION_I=
D, 1);
@@ -1268,13 +1321,6 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb=
, PCIDevice *dev,
         _FDT(fdt_setprop_cell(fdt, offset, "interrupts", irq_pin));
     }
=20
-    if (!is_bridge) {
-        uint32_t min_grant =3D pci_default_read_config(dev, PCI_MIN_GNT,=
 1);
-        uint32_t max_latency =3D pci_default_read_config(dev, PCI_MAX_LA=
T, 1);
-        _FDT(fdt_setprop_cell(fdt, offset, "min-grant", min_grant));
-        _FDT(fdt_setprop_cell(fdt, offset, "max-latency", max_latency));
-    }
-
     if (subsystem_id) {
         _FDT(fdt_setprop_cell(fdt, offset, "subsystem-id", subsystem_id)=
);
     }
@@ -1309,11 +1355,6 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb=
, PCIDevice *dev,
         _FDT(fdt_setprop_cell(fdt, offset, "ibm,my-drc-index", drc_index=
));
     }
=20
-    _FDT(fdt_setprop_cell(fdt, offset, "#address-cells",
-                          RESOURCE_CELLS_ADDRESS));
-    _FDT(fdt_setprop_cell(fdt, offset, "#size-cells",
-                          RESOURCE_CELLS_SIZE));
-
     if (msi_present(dev)) {
         uint32_t max_msi =3D msi_nr_vectors_allocated(dev);
         if (max_msi) {
@@ -1338,7 +1379,18 @@ static int spapr_dt_pci_device(SpaprPhbState *sphb=
, PCIDevice *dev,
=20
     spapr_phb_nvgpu_populate_pcidev_dt(dev, fdt, offset, sphb);
=20
-    return offset;
+    if (!pc->is_bridge) {
+        /* Properties only for non-bridges */
+        uint32_t min_grant =3D pci_default_read_config(dev, PCI_MIN_GNT,=
 1);
+        uint32_t max_latency =3D pci_default_read_config(dev, PCI_MAX_LA=
T, 1);
+        _FDT(fdt_setprop_cell(fdt, offset, "min-grant", min_grant));
+        _FDT(fdt_setprop_cell(fdt, offset, "max-latency", max_latency));
+        return offset;
+    } else {
+        PCIBus *sec_bus =3D pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
+
+        return spapr_dt_pci_bus(sphb, sec_bus, fdt, offset);
+    }
 }
=20
 /* Callback to be called during DRC release. */
@@ -2057,44 +2109,6 @@ static const TypeInfo spapr_phb_info =3D {
     }
 };
=20
-typedef struct SpaprFdt {
-    void *fdt;
-    int node_off;
-    SpaprPhbState *sphb;
-} SpaprFdt;
-
-static void spapr_populate_pci_devices_dt(PCIBus *bus, PCIDevice *pdev,
-                                          void *opaque)
-{
-    PCIBus *sec_bus;
-    SpaprFdt *p =3D opaque;
-    int offset;
-    SpaprFdt s_fdt;
-
-    offset =3D spapr_dt_pci_device(p->sphb, pdev, p->fdt, p->node_off);
-    if (!offset) {
-        error_report("Failed to create pci child device tree node");
-        return;
-    }
-
-    if ((pci_default_read_config(pdev, PCI_HEADER_TYPE, 1) !=3D
-         PCI_HEADER_TYPE_BRIDGE)) {
-        return;
-    }
-
-    sec_bus =3D pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
-    if (!sec_bus) {
-        return;
-    }
-
-    s_fdt.fdt =3D p->fdt;
-    s_fdt.node_off =3D offset;
-    s_fdt.sphb =3D p->sphb;
-    pci_for_each_device_reverse(sec_bus, pci_bus_num(sec_bus),
-                                spapr_populate_pci_devices_dt,
-                                &s_fdt);
-}
-
 static void spapr_phb_pci_enumerate_bridge(PCIBus *bus, PCIDevice *pdev,
                                            void *opaque)
 {
@@ -2132,8 +2146,8 @@ static void spapr_phb_pci_enumerate(SpaprPhbState *=
phb)
=20
 }
=20
-int spapr_populate_pci_dt(SpaprPhbState *phb, uint32_t intc_phandle, voi=
d *fdt,
-                          uint32_t nr_msis, int *node_offset)
+int spapr_dt_phb(SpaprPhbState *phb, uint32_t intc_phandle, void *fdt,
+                 uint32_t nr_msis, int *node_offset)
 {
     int bus_off, i, j, ret;
     uint32_t bus_range[] =3D { cpu_to_be32(0), cpu_to_be32(0xff) };
@@ -2180,8 +2194,6 @@ int spapr_populate_pci_dt(SpaprPhbState *phb, uint3=
2_t intc_phandle, void *fdt,
                                 cpu_to_be32(0x0),
                                 cpu_to_be32(phb->numa_node)};
     SpaprTceTable *tcet;
-    PCIBus *bus =3D PCI_HOST_BRIDGE(phb)->bus;
-    SpaprFdt s_fdt;
     SpaprDrc *drc;
     Error *errp =3D NULL;
=20
@@ -2194,8 +2206,6 @@ int spapr_populate_pci_dt(SpaprPhbState *phb, uint3=
2_t intc_phandle, void *fdt,
     /* Write PHB properties */
     _FDT(fdt_setprop_string(fdt, bus_off, "device_type", "pci"));
     _FDT(fdt_setprop_string(fdt, bus_off, "compatible", "IBM,Logical_PHB=
"));
-    _FDT(fdt_setprop_cell(fdt, bus_off, "#address-cells", 0x3));
-    _FDT(fdt_setprop_cell(fdt, bus_off, "#size-cells", 0x2));
     _FDT(fdt_setprop_cell(fdt, bus_off, "#interrupt-cells", 0x1));
     _FDT(fdt_setprop(fdt, bus_off, "used-by-rtas", NULL, 0));
     _FDT(fdt_setprop(fdt, bus_off, "bus-range", &bus_range, sizeof(bus_r=
ange)));
@@ -2260,13 +2270,11 @@ int spapr_populate_pci_dt(SpaprPhbState *phb, uin=
t32_t intc_phandle, void *fdt,
     spapr_phb_pci_enumerate(phb);
     _FDT(fdt_setprop_cell(fdt, bus_off, "qemu,phb-enumerated", 0x1));
=20
-    /* Populate tree nodes with PCI devices attached */
-    s_fdt.fdt =3D fdt;
-    s_fdt.node_off =3D bus_off;
-    s_fdt.sphb =3D phb;
-    pci_for_each_device_reverse(bus, pci_bus_num(bus),
-                                spapr_populate_pci_devices_dt,
-                                &s_fdt);
+    /* Walk the bridge and subordinate buses */
+    ret =3D spapr_dt_pci_bus(phb, PCI_HOST_BRIDGE(phb)->bus, fdt, bus_of=
f);
+    if (ret < 0) {
+        return ret;
+    }
=20
     ret =3D spapr_drc_populate_dt(fdt, bus_off, OBJECT(phb),
                                 SPAPR_DR_CONNECTOR_TYPE_PCI);
diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 53519c835e..1b61162f91 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -131,8 +131,8 @@ static inline qemu_irq spapr_phb_lsi_qirq(struct Spap=
rPhbState *phb, int pin)
     return spapr_qirq(spapr, phb->lsi_table[pin].irq);
 }
=20
-int spapr_populate_pci_dt(SpaprPhbState *phb, uint32_t intc_phandle, voi=
d *fdt,
-                          uint32_t nr_msis, int *node_offset);
+int spapr_dt_phb(SpaprPhbState *phb, uint32_t intc_phandle, void *fdt,
+                 uint32_t nr_msis, int *node_offset);
=20
 void spapr_pci_rtas_init(void);
=20
--=20
2.21.0


