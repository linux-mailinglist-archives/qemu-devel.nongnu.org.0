Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A32836517
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 22:07:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYcCG-000829-58
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 16:07:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hYc5K-00031d-AO
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:00:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hYc5I-0005Tl-AS
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:00:34 -0400
Received: from mail-qt1-f180.google.com ([209.85.160.180]:39745)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hYc5H-0004wo-9n
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:00:32 -0400
Received: by mail-qt1-f180.google.com with SMTP id i34so6103790qta.6
	for <qemu-devel@nongnu.org>; Wed, 05 Jun 2019 13:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=iR2D90tah69MokQaIVILyAA+SIy2IC9y7WqtDpQZwCc=;
	b=bsloq+2DPK4mJooqIevtfZ5vrnZ5rxUf/rHHgio20jqPYRWwt42wAgp0qqSb07kCLA
	jwDvFEOw4zxQT7F3hYgicRMhcEH85whb0RVtTl/d17vstp+G3nqA7cZMCSjKu7ggymVV
	1fyVZzMlX4zJ/UJgncRhKwdIyuGbxp94PcdU7MUOhPSLp4cStODvJcnhmcVWyNfjiQvC
	Ui0vhIS03ns4NjV+rhqJ+nlX1Is9JXlOhVR4XnffaWEVF4e1uC0dfz23aMzC7TzQDY7K
	PB13VuoRw4YXwBgzc/TCyvH4Uh7krc5y1BxI02hljTKer9DqnQWwGBTgqzkhTvnXxWDd
	/L1A==
X-Gm-Message-State: APjAAAWmckYDq5MXPWHo1CkURA7HIRkaTijJKHzuFIv2ohGA5UVXwPfk
	8W/ZzdM3bJXchJa0q3Sj1gDejFQKcnY=
X-Google-Smtp-Source: APXvYqwlD2YEC1fGT7ytr+H5IVmfS38gJYQGJrjUsShmeJ706z8LxFD98qoTXABsiZkOddkO1t6x3w==
X-Received: by 2002:aed:22a9:: with SMTP id p38mr13404584qtc.188.1559764813357;
	Wed, 05 Jun 2019 13:00:13 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103])
	by smtp.gmail.com with ESMTPSA id f6sm7174977qkk.79.2019.06.05.13.00.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 05 Jun 2019 13:00:12 -0700 (PDT)
Date: Wed, 5 Jun 2019 16:00:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190513061939.3464-4-david@gibson.dropbear.id.au>
References: <20190605195913.12243-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605195913.12243-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.180
Subject: [Qemu-devel] [PULL v3 03/17] pcie: Simplify
 pci_adjust_config_limit()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
	Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Gibson <david@gibson.dropbear.id.au>

Since c2077e2c "pci: Adjust PCI config limit based on bus topology",
pci_adjust_config_limit() has been used in the config space read and write
paths to only permit access to extended config space on buses which permit
it.  Specifically it prevents access on devices below a vanilla-PCI bus via
some combination of bridges, even if both the host bridge and the device
itself are PCI-E.

It accomplishes this with a somewhat complex call up the chain of bridges
to see if any of them prohibit extended config space access.  This is
overly complex, since we can always know if the bus will support such
access at the point it is constructed.

This patch simplifies the test by using a flag in the PCIBus instance
indicating whether extended configuration space is accessible.  It is
false for vanilla PCI buses.  For PCI-E buses, it is true for root
buses and equal to the parent bus's's capability otherwise.

For the special case of sPAPR's paravirtualized PCI root bus, which
acts mostly like vanilla PCI, but does allow extended config space
access, we override the default value of the flag from the host bridge
code.

This should cause no behavioural change.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20190513061939.3464-4-david@gibson.dropbear.id.au>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h     |  1 -
 include/hw/pci/pci_bus.h |  8 +++++++-
 hw/pci/pci.c             | 41 ++++++++++++++++++++++------------------
 hw/pci/pci_host.c        | 13 +++----------
 hw/ppc/spapr_pci.c       | 34 ++++++++++-----------------------
 5 files changed, 43 insertions(+), 54 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index edf44de21d..da20c915ef 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -395,7 +395,6 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
 #define TYPE_PCIE_BUS "PCIE"
 
 bool pci_bus_is_express(PCIBus *bus);
-bool pci_bus_allows_extended_config_space(PCIBus *bus);
 
 void pci_root_bus_new_inplace(PCIBus *bus, size_t bus_size, DeviceState *parent,
                               const char *name,
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index aea98d5040..0714f578af 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -17,12 +17,13 @@ typedef struct PCIBusClass {
 
     int (*bus_num)(PCIBus *bus);
     uint16_t (*numa_node)(PCIBus *bus);
-    bool (*allows_extended_config_space)(PCIBus *bus);
 } PCIBusClass;
 
 enum PCIBusFlags {
     /* This bus is the root of a PCI domain */
     PCI_BUS_IS_ROOT                                         = 0x0001,
+    /* PCIe extended configuration space is accessible on this bus */
+    PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
 };
 
 struct PCIBus {
@@ -57,4 +58,9 @@ static inline bool pci_bus_is_root(PCIBus *bus)
     return !!(bus->flags & PCI_BUS_IS_ROOT);
 }
 
+static inline bool pci_bus_allows_extended_config_space(PCIBus *bus)
+{
+    return !!(bus->flags & PCI_BUS_EXTENDED_CONFIG_SPACE);
+}
+
 #endif /* QEMU_PCI_BUS_H */
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index b386777045..7e5f8d001b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -120,6 +120,27 @@ static void pci_bus_realize(BusState *qbus, Error **errp)
     vmstate_register(NULL, -1, &vmstate_pcibus, bus);
 }
 
+static void pcie_bus_realize(BusState *qbus, Error **errp)
+{
+    PCIBus *bus = PCI_BUS(qbus);
+
+    pci_bus_realize(qbus, errp);
+
+    /*
+     * A PCI-E bus can support extended config space if it's the root
+     * bus, or if the bus/bridge above it does as well
+     */
+    if (pci_bus_is_root(bus)) {
+        bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
+    } else {
+        PCIBus *parent_bus = pci_get_bus(bus->parent_dev);
+
+        if (pci_bus_allows_extended_config_space(parent_bus)) {
+            bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
+        }
+    }
+}
+
 static void pci_bus_unrealize(BusState *qbus, Error **errp)
 {
     PCIBus *bus = PCI_BUS(qbus);
@@ -142,11 +163,6 @@ static uint16_t pcibus_numa_node(PCIBus *bus)
     return NUMA_NODE_UNASSIGNED;
 }
 
-static bool pcibus_allows_extended_config_space(PCIBus *bus)
-{
-    return false;
-}
-
 static void pci_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
@@ -161,7 +177,6 @@ static void pci_bus_class_init(ObjectClass *klass, void *data)
 
     pbc->bus_num = pcibus_num;
     pbc->numa_node = pcibus_numa_node;
-    pbc->allows_extended_config_space = pcibus_allows_extended_config_space;
 }
 
 static const TypeInfo pci_bus_info = {
@@ -182,16 +197,11 @@ static const TypeInfo conventional_pci_interface_info = {
     .parent        = TYPE_INTERFACE,
 };
 
-static bool pciebus_allows_extended_config_space(PCIBus *bus)
-{
-    return true;
-}
-
 static void pcie_bus_class_init(ObjectClass *klass, void *data)
 {
-    PCIBusClass *pbc = PCI_BUS_CLASS(klass);
+    BusClass *k = BUS_CLASS(klass);
 
-    pbc->allows_extended_config_space = pciebus_allows_extended_config_space;
+    k->realize = pcie_bus_realize;
 }
 
 static const TypeInfo pcie_bus_info = {
@@ -410,11 +420,6 @@ bool pci_bus_is_express(PCIBus *bus)
     return object_dynamic_cast(OBJECT(bus), TYPE_PCIE_BUS);
 }
 
-bool pci_bus_allows_extended_config_space(PCIBus *bus)
-{
-    return PCI_BUS_GET_CLASS(bus)->allows_extended_config_space(bus);
-}
-
 void pci_root_bus_new_inplace(PCIBus *bus, size_t bus_size, DeviceState *parent,
                               const char *name,
                               MemoryRegion *address_space_mem,
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 9d64b2e12f..5f3497256c 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -53,16 +53,9 @@ static inline PCIDevice *pci_dev_find_by_addr(PCIBus *bus, uint32_t addr)
 
 static void pci_adjust_config_limit(PCIBus *bus, uint32_t *limit)
 {
-    if (*limit > PCI_CONFIG_SPACE_SIZE) {
-        if (!pci_bus_allows_extended_config_space(bus)) {
-            *limit = PCI_CONFIG_SPACE_SIZE;
-            return;
-        }
-
-        if (!pci_bus_is_root(bus)) {
-            PCIDevice *bridge = pci_bridge_get_device(bus);
-            pci_adjust_config_limit(pci_get_bus(bridge), limit);
-        }
+    if ((*limit > PCI_CONFIG_SPACE_SIZE) &&
+        !pci_bus_allows_extended_config_space(bus)) {
+        *limit = PCI_CONFIG_SPACE_SIZE;
     }
 }
 
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 97961b0128..9cf2c41b8c 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1626,28 +1626,6 @@ static void spapr_phb_unrealize(DeviceState *dev, Error **errp)
     memory_region_del_subregion(get_system_memory(), &sphb->mem32window);
 }
 
-static bool spapr_phb_allows_extended_config_space(PCIBus *bus)
-{
-    SpaprPhbState *sphb = SPAPR_PCI_HOST_BRIDGE(BUS(bus)->parent);
-
-    return sphb->pcie_ecs;
-}
-
-static void spapr_phb_root_bus_class_init(ObjectClass *klass, void *data)
-{
-    PCIBusClass *pbc = PCI_BUS_CLASS(klass);
-
-    pbc->allows_extended_config_space = spapr_phb_allows_extended_config_space;
-}
-
-#define TYPE_SPAPR_PHB_ROOT_BUS "pci"
-
-static const TypeInfo spapr_phb_root_bus_info = {
-    .name = TYPE_SPAPR_PHB_ROOT_BUS,
-    .parent = TYPE_PCI_BUS,
-    .class_init = spapr_phb_root_bus_class_init,
-};
-
 static void spapr_phb_realize(DeviceState *dev, Error **errp)
 {
     /* We don't use SPAPR_MACHINE() in order to exit gracefully if the user
@@ -1753,7 +1731,16 @@ static void spapr_phb_realize(DeviceState *dev, Error **errp)
                                 pci_spapr_set_irq, pci_swizzle_map_irq_fn, sphb,
                                 &sphb->memspace, &sphb->iospace,
                                 PCI_DEVFN(0, 0), PCI_NUM_PINS,
-                                TYPE_SPAPR_PHB_ROOT_BUS);
+                                TYPE_PCI_BUS);
+
+    /*
+     * Despite resembling a vanilla PCI bus in most ways, the PAPR
+     * para-virtualized PCI bus *does* permit PCI-E extended config
+     * space access
+     */
+    if (sphb->pcie_ecs) {
+        bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
+    }
     phb->bus = bus;
     qbus_set_hotplug_handler(BUS(phb->bus), OBJECT(sphb), NULL);
 
@@ -2348,7 +2335,6 @@ void spapr_pci_rtas_init(void)
 static void spapr_pci_register_types(void)
 {
     type_register_static(&spapr_phb_info);
-    type_register_static(&spapr_phb_root_bus_info);
 }
 
 type_init(spapr_pci_register_types)
-- 
MST


