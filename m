Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3A2EB128
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:15:53 +0100 (CET)
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpw0-00032u-6m
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbg-0000WF-AR
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:52 -0500
Received: from mga11.intel.com ([192.55.52.93]:21242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbd-00012E-H1
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:52 -0500
IronPort-SDR: WpG+9QlwToE2uvmw4qlLCGrCa0gTgYNvhjl2alzyyGgCiF3U93N5KO9AxgxnPHk4lfnLTQodRA
 5F+/PoJ3BCuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629547"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629547"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:00 -0800
IronPort-SDR: 7es8giYrlAbj9CU/y2+kbnvV1pxPsRhwngo0E6lhQcFm1CEcuSr7NoswutUKjNHza3tZJymFPN
 J0PHqK2BJ6qg==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338029"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:59 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 19/32] hw/pci: Plumb _UID through host bridges
Date: Tue,  5 Jan 2021 08:53:10 -0800
Message-Id: <20210105165323.783725-20-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ben.widawsky@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, QEMU makes _UID equivalent to the bus number (_BBN). While
there is nothing wrong with doing it this way, CXL spec has a heavy
reliance on _UID to identify host bridges and there is no link to the
bus number. Having a distinct UID solves two problems. The first is it
gets us around the limitation of 256 (current max bus number). The
second is it allows us to replicate hardware configurations where bus
number and uid aren't equivalent. The latter has benefits for our
development and debugging using QEMU.

The other way to do this would be to implement the expanded bus
numbering, but having an explicit uid makes more sense when trying to
replicate real hardware configurations.

The QEMU commandline to utilize this would be:
  -device pxb-cxl,id=cxl.0,bus="pcie.0",bus_nr=1,uid=x

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

--

I'm guessing this patch will be somewhat controversial. For early CXL
work, this can be dropped without too much heartache.
---
 hw/i386/acpi-build.c                |  3 ++-
 hw/pci-bridge/pci_expander_bridge.c | 19 +++++++++++++++++++
 hw/pci/pci.c                        | 11 +++++++++++
 include/hw/pci/pci.h                |  1 +
 include/hw/pci/pci_bus.h            |  1 +
 5 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 3c214bba67..26e4ddd025 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1343,6 +1343,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         QLIST_FOREACH(bus, &bus->child, sibling) {
             uint8_t bus_num = pci_bus_num(bus);
             uint8_t numa_node = pci_bus_numa_node(bus);
+            int32_t uid = pci_bus_uid(bus);
 
             /* look only for expander root buses */
             if (!pci_bus_is_root(bus)) {
@@ -1356,7 +1357,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             scope = aml_scope("\\_SB");
             dev = aml_device("PC%.02X", bus_num);
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
-            init_pci_acpi(dev, bus_num, pci_bus_is_express(bus) ? PCIE : PCI);
+            init_pci_acpi(dev, uid, pci_bus_is_express(bus) ? PCIE : PCI);
 
             if (numa_node != NUMA_NODE_UNASSIGNED) {
                 aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index b42592e1ff..5021b60435 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -67,6 +67,7 @@ struct PXBDev {
 
     uint8_t bus_nr;
     uint16_t numa_node;
+    int32_t uid;
 };
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
@@ -98,12 +99,20 @@ static uint16_t pxb_bus_numa_node(PCIBus *bus)
     return pxb->numa_node;
 }
 
+static int32_t pxb_bus_uid(PCIBus *bus)
+{
+    PXBDev *pxb = convert_to_pxb(bus->parent_dev);
+
+    return pxb->uid;
+}
+
 static void pxb_bus_class_init(ObjectClass *class, void *data)
 {
     PCIBusClass *pbc = PCI_BUS_CLASS(class);
 
     pbc->bus_num = pxb_bus_num;
     pbc->numa_node = pxb_bus_numa_node;
+    pbc->uid = pxb_bus_uid;
 }
 
 static const TypeInfo pxb_bus_info = {
@@ -329,6 +338,7 @@ static Property pxb_dev_properties[] = {
     /* Note: 0 is not a legal PXB bus number. */
     DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
     DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
+    DEFINE_PROP_INT32("uid", PXBDev, uid, -1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -400,12 +410,21 @@ static const TypeInfo pxb_pcie_dev_info = {
 
 static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
 {
+    PXBDev *pxb = convert_to_pxb(dev);
+
     /* A CXL PXB's parent bus is still PCIe */
     if (!pci_bus_is_express(pci_get_bus(dev))) {
         error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus");
         return;
     }
 
+    if (pxb->uid < 0) {
+        error_setg(errp, "pxb-cxl devices must have a valid uid (0-2147483647)");
+        return;
+    }
+
+    /* FIXME: Check that uid doesn't collide with UIDs of other host bridges */
+
     pxb_dev_realize_common(dev, CXL, errp);
 }
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index fb454e2317..d2eae06e18 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -170,6 +170,11 @@ static uint16_t pcibus_numa_node(PCIBus *bus)
     return NUMA_NODE_UNASSIGNED;
 }
 
+static int32_t pcibus_uid(PCIBus *bus)
+{
+    return -1;
+}
+
 static void pci_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
@@ -184,6 +189,7 @@ static void pci_bus_class_init(ObjectClass *klass, void *data)
 
     pbc->bus_num = pcibus_num;
     pbc->numa_node = pcibus_numa_node;
+    pbc->uid = pcibus_uid;
 }
 
 static const TypeInfo pci_bus_info = {
@@ -530,6 +536,11 @@ int pci_bus_numa_node(PCIBus *bus)
     return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
 }
 
+int pci_bus_uid(PCIBus *bus)
+{
+    return PCI_BUS_GET_CLASS(bus)->uid(bus);
+}
+
 static int get_pci_config_device(QEMUFile *f, void *pv, size_t size,
                                  const VMStateField *field)
 {
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c464597e53..d65c2bceae 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -462,6 +462,7 @@ static inline int pci_dev_bus_num(const PCIDevice *dev)
 }
 
 int pci_bus_numa_node(PCIBus *bus);
+int pci_bus_uid(PCIBus *bus);
 void pci_for_each_device(PCIBus *bus, int bus_num,
                          void (*fn)(PCIBus *bus, PCIDevice *d, void *opaque),
                          void *opaque);
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index eb94e7e85c..3c9fbc55bb 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -17,6 +17,7 @@ struct PCIBusClass {
 
     int (*bus_num)(PCIBus *bus);
     uint16_t (*numa_node)(PCIBus *bus);
+    int32_t (*uid)(PCIBus *bus);
 };
 
 enum PCIBusFlags {
-- 
2.30.0


