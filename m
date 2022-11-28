Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F91663A288
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZ5s-0005MF-QX; Mon, 28 Nov 2022 03:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5h-0005H3-Gm
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5f-0008Hv-0p
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669622530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUKc1xYzdtx/vn9EdYCV6wGVbFdAiCJ+Q+dJwQEoCfg=;
 b=SlvlS33IMz0wTiEWCCRUxm1OcKEum4wFKi9EKd1N9+vo5g9L2kZakPObNUKHbkLQOQ3J2/
 /Kub4sPeTT6HXShmPo/9u8/Y05gdHAFywytfl18ABDKBVNuVbr97mWxhdg4r036CE0J7Et
 V6tI9tjGGgW+KJmtoaEpsmLKuFYcY5M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-FDFWMZf-PVCgGfcgrGUYDQ-1; Mon, 28 Nov 2022 03:02:06 -0500
X-MC-Unique: FDFWMZf-PVCgGfcgrGUYDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58925833A06;
 Mon, 28 Nov 2022 08:02:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D17312166B2B;
 Mon, 28 Nov 2022 08:02:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8D19421E6936; Mon, 28 Nov 2022 09:02:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	marcel.apfelbaum@gmail.com,
	dgilbert@redhat.com
Subject: [PATCH 02/12] pci: Move QMP commands to new hw/pci/pci-qmp-cmds.c
Date: Mon, 28 Nov 2022 09:01:52 +0100
Message-Id: <20221128080202.2570543-3-armbru@redhat.com>
In-Reply-To: <20221128080202.2570543-1-armbru@redhat.com>
References: <20221128080202.2570543-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci/pci-internal.h |  20 +++++
 hw/pci/pci-qmp-cmds.c | 201 ++++++++++++++++++++++++++++++++++++++++++
 hw/pci/pci.c          | 188 +--------------------------------------
 hw/pci/meson.build    |   1 +
 4 files changed, 226 insertions(+), 184 deletions(-)
 create mode 100644 hw/pci/pci-internal.h
 create mode 100644 hw/pci/pci-qmp-cmds.c

diff --git a/hw/pci/pci-internal.h b/hw/pci/pci-internal.h
new file mode 100644
index 0000000000..4903a26cbf
--- /dev/null
+++ b/hw/pci/pci-internal.h
@@ -0,0 +1,20 @@
+#ifndef HW_PCI_PCI_INTERNAL_H
+#define HW_PCI_PCI_INTERNAL_H
+
+#include "qemu/queue.h"
+
+typedef struct {
+    uint16_t class;
+    const char *desc;
+    const char *fw_name;
+    uint16_t fw_ign_bits;
+} pci_class_desc;
+
+typedef QLIST_HEAD(, PCIHostState) PCIHostStateList;
+
+extern PCIHostStateList pci_host_bridges;
+
+const pci_class_desc *get_class_desc(int class);
+PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
+
+#endif
diff --git a/hw/pci/pci-qmp-cmds.c b/hw/pci/pci-qmp-cmds.c
new file mode 100644
index 0000000000..4b434dcfda
--- /dev/null
+++ b/hw/pci/pci-qmp-cmds.c
@@ -0,0 +1,201 @@
+/*
+ * QMP commands related to PCI
+ *
+ * Copyright (c) 2004 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_bridge.h"
+#include "pci-internal.h"
+#include "qapi/qapi-commands-pci.h"
+
+static PciDeviceInfoList *qmp_query_pci_devices(PCIBus *bus, int bus_num);
+
+static PciMemoryRegionList *qmp_query_pci_regions(const PCIDevice *dev)
+{
+    PciMemoryRegionList *head = NULL, **tail = &head;
+    int i;
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        const PCIIORegion *r = &dev->io_regions[i];
+        PciMemoryRegion *region;
+
+        if (!r->size) {
+            continue;
+        }
+
+        region = g_malloc0(sizeof(*region));
+
+        if (r->type & PCI_BASE_ADDRESS_SPACE_IO) {
+            region->type = g_strdup("io");
+        } else {
+            region->type = g_strdup("memory");
+            region->has_prefetch = true;
+            region->prefetch = !!(r->type & PCI_BASE_ADDRESS_MEM_PREFETCH);
+            region->has_mem_type_64 = true;
+            region->mem_type_64 = !!(r->type & PCI_BASE_ADDRESS_MEM_TYPE_64);
+        }
+
+        region->bar = i;
+        region->address = r->addr;
+        region->size = r->size;
+
+        QAPI_LIST_APPEND(tail, region);
+    }
+
+    return head;
+}
+
+static PciBridgeInfo *qmp_query_pci_bridge(PCIDevice *dev, PCIBus *bus,
+                                           int bus_num)
+{
+    PciBridgeInfo *info;
+    PciMemoryRange *range;
+
+    info = g_new0(PciBridgeInfo, 1);
+
+    info->bus = g_new0(PciBusInfo, 1);
+    info->bus->number = dev->config[PCI_PRIMARY_BUS];
+    info->bus->secondary = dev->config[PCI_SECONDARY_BUS];
+    info->bus->subordinate = dev->config[PCI_SUBORDINATE_BUS];
+
+    range = info->bus->io_range = g_new0(PciMemoryRange, 1);
+    range->base = pci_bridge_get_base(dev, PCI_BASE_ADDRESS_SPACE_IO);
+    range->limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_SPACE_IO);
+
+    range = info->bus->memory_range = g_new0(PciMemoryRange, 1);
+    range->base = pci_bridge_get_base(dev, PCI_BASE_ADDRESS_SPACE_MEMORY);
+    range->limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_SPACE_MEMORY);
+
+    range = info->bus->prefetchable_range = g_new0(PciMemoryRange, 1);
+    range->base = pci_bridge_get_base(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
+    range->limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
+
+    if (dev->config[PCI_SECONDARY_BUS] != 0) {
+        PCIBus *child_bus = pci_find_bus_nr(bus,
+                                            dev->config[PCI_SECONDARY_BUS]);
+        if (child_bus) {
+            info->has_devices = true;
+            info->devices = qmp_query_pci_devices(child_bus,
+                                            dev->config[PCI_SECONDARY_BUS]);
+        }
+    }
+
+    return info;
+}
+
+static PciDeviceInfo *qmp_query_pci_device(PCIDevice *dev, PCIBus *bus,
+                                           int bus_num)
+{
+    const pci_class_desc *desc;
+    PciDeviceInfo *info;
+    uint8_t type;
+    int class;
+
+    info = g_new0(PciDeviceInfo, 1);
+    info->bus = bus_num;
+    info->slot = PCI_SLOT(dev->devfn);
+    info->function = PCI_FUNC(dev->devfn);
+
+    info->class_info = g_new0(PciDeviceClass, 1);
+    class = pci_get_word(dev->config + PCI_CLASS_DEVICE);
+    info->class_info->q_class = class;
+    desc = get_class_desc(class);
+    if (desc->desc) {
+        info->class_info->has_desc = true;
+        info->class_info->desc = g_strdup(desc->desc);
+    }
+
+    info->id = g_new0(PciDeviceId, 1);
+    info->id->vendor = pci_get_word(dev->config + PCI_VENDOR_ID);
+    info->id->device = pci_get_word(dev->config + PCI_DEVICE_ID);
+    info->regions = qmp_query_pci_regions(dev);
+    info->qdev_id = g_strdup(dev->qdev.id ? dev->qdev.id : "");
+
+    info->irq_pin = dev->config[PCI_INTERRUPT_PIN];
+    if (dev->config[PCI_INTERRUPT_PIN] != 0) {
+        info->has_irq = true;
+        info->irq = dev->config[PCI_INTERRUPT_LINE];
+    }
+
+    type = dev->config[PCI_HEADER_TYPE] & ~PCI_HEADER_TYPE_MULTI_FUNCTION;
+    if (type == PCI_HEADER_TYPE_BRIDGE) {
+        info->has_pci_bridge = true;
+        info->pci_bridge = qmp_query_pci_bridge(dev, bus, bus_num);
+    } else if (type == PCI_HEADER_TYPE_NORMAL) {
+        info->id->has_subsystem = info->id->has_subsystem_vendor = true;
+        info->id->subsystem = pci_get_word(dev->config + PCI_SUBSYSTEM_ID);
+        info->id->subsystem_vendor =
+            pci_get_word(dev->config + PCI_SUBSYSTEM_VENDOR_ID);
+    } else if (type == PCI_HEADER_TYPE_CARDBUS) {
+        info->id->has_subsystem = info->id->has_subsystem_vendor = true;
+        info->id->subsystem = pci_get_word(dev->config + PCI_CB_SUBSYSTEM_ID);
+        info->id->subsystem_vendor =
+            pci_get_word(dev->config + PCI_CB_SUBSYSTEM_VENDOR_ID);
+    }
+
+    return info;
+}
+
+static PciDeviceInfoList *qmp_query_pci_devices(PCIBus *bus, int bus_num)
+{
+    PciDeviceInfoList *head = NULL, **tail = &head;
+    PCIDevice *dev;
+    int devfn;
+
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
+        dev = bus->devices[devfn];
+        if (dev) {
+            QAPI_LIST_APPEND(tail, qmp_query_pci_device(dev, bus, bus_num));
+        }
+    }
+
+    return head;
+}
+
+static PciInfo *qmp_query_pci_bus(PCIBus *bus, int bus_num)
+{
+    PciInfo *info = NULL;
+
+    bus = pci_find_bus_nr(bus, bus_num);
+    if (bus) {
+        info = g_malloc0(sizeof(*info));
+        info->bus = bus_num;
+        info->devices = qmp_query_pci_devices(bus, bus_num);
+    }
+
+    return info;
+}
+
+PciInfoList *qmp_query_pci(Error **errp)
+{
+    PciInfoList *head = NULL, **tail = &head;
+    PCIHostState *host_bridge;
+
+    QLIST_FOREACH(host_bridge, &pci_host_bridges, next) {
+        QAPI_LIST_APPEND(tail,
+                         qmp_query_pci_bus(host_bridge->bus,
+                                           pci_bus_num(host_bridge->bus)));
+    }
+
+    return head;
+}
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 53ed447115..81ffc74925 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -47,8 +47,8 @@
 #include "hw/hotplug.h"
 #include "hw/boards.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-pci.h"
 #include "qemu/cutils.h"
+#include "pci-internal.h"
 
 //#define DEBUG_PCI
 #ifdef DEBUG_PCI
@@ -234,7 +234,6 @@ static const TypeInfo cxl_bus_info = {
     .class_init = pcie_bus_class_init,
 };
 
-static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
 static void pci_update_mappings(PCIDevice *d);
 static void pci_irq_handler(void *opaque, int irq_num, int level);
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
@@ -243,7 +242,7 @@ static void pci_del_option_rom(PCIDevice *pdev);
 static uint16_t pci_default_sub_vendor_id = PCI_SUBVENDOR_ID_REDHAT_QUMRANET;
 static uint16_t pci_default_sub_device_id = PCI_SUBDEVICE_ID_QEMU;
 
-static QLIST_HEAD(, PCIHostState) pci_host_bridges;
+PCIHostStateList pci_host_bridges;
 
 int pci_bar(PCIDevice *d, int reg)
 {
@@ -1662,13 +1661,6 @@ int pci_swizzle_map_irq_fn(PCIDevice *pci_dev, int pin)
 /***********************************************************/
 /* monitor info on PCI */
 
-typedef struct {
-    uint16_t class;
-    const char *desc;
-    const char *fw_name;
-    uint16_t fw_ign_bits;
-} pci_class_desc;
-
 static const pci_class_desc pci_class_descriptions[] =
 {
     { 0x0001, "VGA controller", "display"},
@@ -1776,7 +1768,7 @@ void pci_for_each_device(PCIBus *bus, int bus_num,
     }
 }
 
-static const pci_class_desc *get_class_desc(int class)
+const pci_class_desc *get_class_desc(int class)
 {
     const pci_class_desc *desc;
 
@@ -1788,178 +1780,6 @@ static const pci_class_desc *get_class_desc(int class)
     return desc;
 }
 
-static PciDeviceInfoList *qmp_query_pci_devices(PCIBus *bus, int bus_num);
-
-static PciMemoryRegionList *qmp_query_pci_regions(const PCIDevice *dev)
-{
-    PciMemoryRegionList *head = NULL, **tail = &head;
-    int i;
-
-    for (i = 0; i < PCI_NUM_REGIONS; i++) {
-        const PCIIORegion *r = &dev->io_regions[i];
-        PciMemoryRegion *region;
-
-        if (!r->size) {
-            continue;
-        }
-
-        region = g_malloc0(sizeof(*region));
-
-        if (r->type & PCI_BASE_ADDRESS_SPACE_IO) {
-            region->type = g_strdup("io");
-        } else {
-            region->type = g_strdup("memory");
-            region->has_prefetch = true;
-            region->prefetch = !!(r->type & PCI_BASE_ADDRESS_MEM_PREFETCH);
-            region->has_mem_type_64 = true;
-            region->mem_type_64 = !!(r->type & PCI_BASE_ADDRESS_MEM_TYPE_64);
-        }
-
-        region->bar = i;
-        region->address = r->addr;
-        region->size = r->size;
-
-        QAPI_LIST_APPEND(tail, region);
-    }
-
-    return head;
-}
-
-static PciBridgeInfo *qmp_query_pci_bridge(PCIDevice *dev, PCIBus *bus,
-                                           int bus_num)
-{
-    PciBridgeInfo *info;
-    PciMemoryRange *range;
-
-    info = g_new0(PciBridgeInfo, 1);
-
-    info->bus = g_new0(PciBusInfo, 1);
-    info->bus->number = dev->config[PCI_PRIMARY_BUS];
-    info->bus->secondary = dev->config[PCI_SECONDARY_BUS];
-    info->bus->subordinate = dev->config[PCI_SUBORDINATE_BUS];
-
-    range = info->bus->io_range = g_new0(PciMemoryRange, 1);
-    range->base = pci_bridge_get_base(dev, PCI_BASE_ADDRESS_SPACE_IO);
-    range->limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_SPACE_IO);
-
-    range = info->bus->memory_range = g_new0(PciMemoryRange, 1);
-    range->base = pci_bridge_get_base(dev, PCI_BASE_ADDRESS_SPACE_MEMORY);
-    range->limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_SPACE_MEMORY);
-
-    range = info->bus->prefetchable_range = g_new0(PciMemoryRange, 1);
-    range->base = pci_bridge_get_base(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
-    range->limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
-
-    if (dev->config[PCI_SECONDARY_BUS] != 0) {
-        PCIBus *child_bus = pci_find_bus_nr(bus,
-                                            dev->config[PCI_SECONDARY_BUS]);
-        if (child_bus) {
-            info->has_devices = true;
-            info->devices = qmp_query_pci_devices(child_bus,
-                                            dev->config[PCI_SECONDARY_BUS]);
-        }
-    }
-
-    return info;
-}
-
-static PciDeviceInfo *qmp_query_pci_device(PCIDevice *dev, PCIBus *bus,
-                                           int bus_num)
-{
-    const pci_class_desc *desc;
-    PciDeviceInfo *info;
-    uint8_t type;
-    int class;
-
-    info = g_new0(PciDeviceInfo, 1);
-    info->bus = bus_num;
-    info->slot = PCI_SLOT(dev->devfn);
-    info->function = PCI_FUNC(dev->devfn);
-
-    info->class_info = g_new0(PciDeviceClass, 1);
-    class = pci_get_word(dev->config + PCI_CLASS_DEVICE);
-    info->class_info->q_class = class;
-    desc = get_class_desc(class);
-    if (desc->desc) {
-        info->class_info->has_desc = true;
-        info->class_info->desc = g_strdup(desc->desc);
-    }
-
-    info->id = g_new0(PciDeviceId, 1);
-    info->id->vendor = pci_get_word(dev->config + PCI_VENDOR_ID);
-    info->id->device = pci_get_word(dev->config + PCI_DEVICE_ID);
-    info->regions = qmp_query_pci_regions(dev);
-    info->qdev_id = g_strdup(dev->qdev.id ? dev->qdev.id : "");
-
-    info->irq_pin = dev->config[PCI_INTERRUPT_PIN];
-    if (dev->config[PCI_INTERRUPT_PIN] != 0) {
-        info->has_irq = true;
-        info->irq = dev->config[PCI_INTERRUPT_LINE];
-    }
-
-    type = dev->config[PCI_HEADER_TYPE] & ~PCI_HEADER_TYPE_MULTI_FUNCTION;
-    if (type == PCI_HEADER_TYPE_BRIDGE) {
-        info->has_pci_bridge = true;
-        info->pci_bridge = qmp_query_pci_bridge(dev, bus, bus_num);
-    } else if (type == PCI_HEADER_TYPE_NORMAL) {
-        info->id->has_subsystem = info->id->has_subsystem_vendor = true;
-        info->id->subsystem = pci_get_word(dev->config + PCI_SUBSYSTEM_ID);
-        info->id->subsystem_vendor =
-            pci_get_word(dev->config + PCI_SUBSYSTEM_VENDOR_ID);
-    } else if (type == PCI_HEADER_TYPE_CARDBUS) {
-        info->id->has_subsystem = info->id->has_subsystem_vendor = true;
-        info->id->subsystem = pci_get_word(dev->config + PCI_CB_SUBSYSTEM_ID);
-        info->id->subsystem_vendor =
-            pci_get_word(dev->config + PCI_CB_SUBSYSTEM_VENDOR_ID);
-    }
-
-    return info;
-}
-
-static PciDeviceInfoList *qmp_query_pci_devices(PCIBus *bus, int bus_num)
-{
-    PciDeviceInfoList *head = NULL, **tail = &head;
-    PCIDevice *dev;
-    int devfn;
-
-    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
-        dev = bus->devices[devfn];
-        if (dev) {
-            QAPI_LIST_APPEND(tail, qmp_query_pci_device(dev, bus, bus_num));
-        }
-    }
-
-    return head;
-}
-
-static PciInfo *qmp_query_pci_bus(PCIBus *bus, int bus_num)
-{
-    PciInfo *info = NULL;
-
-    bus = pci_find_bus_nr(bus, bus_num);
-    if (bus) {
-        info = g_malloc0(sizeof(*info));
-        info->bus = bus_num;
-        info->devices = qmp_query_pci_devices(bus, bus_num);
-    }
-
-    return info;
-}
-
-PciInfoList *qmp_query_pci(Error **errp)
-{
-    PciInfoList *head = NULL, **tail = &head;
-    PCIHostState *host_bridge;
-
-    QLIST_FOREACH(host_bridge, &pci_host_bridges, next) {
-        QAPI_LIST_APPEND(tail,
-                         qmp_query_pci_bus(host_bridge->bus,
-                                           pci_bus_num(host_bridge->bus)));
-    }
-
-    return head;
-}
-
 /* Initialize a PCI NIC.  */
 PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
                                const char *default_model,
@@ -2108,7 +1928,7 @@ static bool pci_root_bus_in_range(PCIBus *bus, int bus_num)
     return false;
 }
 
-static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num)
+PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num)
 {
     PCIBus *sec;
 
diff --git a/hw/pci/meson.build b/hw/pci/meson.build
index 5aff7ed1c6..40721f1514 100644
--- a/hw/pci/meson.build
+++ b/hw/pci/meson.build
@@ -5,6 +5,7 @@ pci_ss.add(files(
   'pci.c',
   'pci_bridge.c',
   'pci_host.c',
+  'pci-qmp-cmds.c',
   'pcie_sriov.c',
   'shpc.c',
   'slotid_cap.c'
-- 
2.37.3


