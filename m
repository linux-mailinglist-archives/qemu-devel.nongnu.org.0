Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B940C2EB146
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:22:51 +0100 (CET)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwq2k-0005Lq-Rg
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpce-0001IQ-CG
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:52 -0500
Received: from mga11.intel.com ([192.55.52.93]:21248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpcQ-00012W-PB
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:51 -0500
IronPort-SDR: 9dyIny0vMF9DcS+Ofl/eGJwEheX77fUJPkHoSQXQvxpwhvkAL7je+9OjGCtDo+1x9Wu2Iqnyoi
 tmR27UqgzImA==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629584"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629584"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:07 -0800
IronPort-SDR: CiqgcqYv72zvWsLX39IAKTTBju7Loi7Sh99FqLkpDC1soQe9WsTV7tEgGpVvM8HizJEZhP8DbY
 H1WEL6VL8Wqg==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338088"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:06 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 28/32] acpi/cxl: Create the CEDT (9.14.1)
Date: Tue,  5 Jan 2021 08:53:19 -0800
Message-Id: <20210105165323.783725-29-ben.widawsky@intel.com>
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

The CXL Early Discovery Table is defined in the CXL 2.0 specification as
a way for the OS to get CXL specific information from the system
firmware.

As of CXL 2.0 spec, only 1 sub structure is defined, the CXL Host Bridge
Structure (CHBS) which is primarily useful for telling the OS exactly
where the MMIO for the host bridge is.

v2: Update CHBS to spec released definition

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/acpi/cxl.c                       | 69 +++++++++++++++++++++++++++++
 hw/i386/acpi-build.c                |  6 ++-
 hw/pci-bridge/pci_expander_bridge.c | 21 +--------
 include/hw/acpi/cxl.h               |  4 ++
 include/hw/pci/pci_bridge.h         | 25 +++++++++++
 5 files changed, 104 insertions(+), 21 deletions(-)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 7124d5a1a3..68db0fe3a8 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -18,14 +18,83 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_host.h"
 #include "hw/cxl/cxl.h"
+#include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/cxl.h"
+#include "hw/acpi/cxl.h"
 #include "qapi/error.h"
 #include "qemu/uuid.h"
 
+static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(cxl->cxl.cxl_host_bridge);
+    struct MemoryRegion *mr = sbd->mmio[0].memory;
+
+    /* Type */
+    build_append_int_noprefix(table_data, 0, 1);
+
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 1);
+
+    /* Record Length */
+    build_append_int_noprefix(table_data, 32, 2);
+
+    /* UID */
+    build_append_int_noprefix(table_data, cxl->uid, 4);
+
+    /* Version */
+    build_append_int_noprefix(table_data, 1, 4);
+
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
+
+    /* Base */
+    build_append_int_noprefix(table_data, mr->addr, 8);
+
+    /* Length */
+    build_append_int_noprefix(table_data, memory_region_size(mr), 8);
+}
+
+static int cxl_foreach_pxb_hb(Object *obj, void *opaque)
+{
+    Aml *cedt = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PXB_CXL_DEVICE)) {
+        PXBDev *pxb = PXB_CXL_DEV(obj);
+
+        cedt_build_chbs(cedt->buf, pxb);
+    }
+
+    return 0;
+}
+
+void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
+                    BIOSLinker *linker)
+{
+    const int cedt_start = table_data->len;
+    Aml *cedt;
+
+    cedt = init_aml_allocator();
+
+    /* reserve space for CEDT header */
+    acpi_add_table(table_offsets, table_data);
+    acpi_data_push(cedt->buf, sizeof(AcpiTableHeader));
+
+    object_child_foreach_recursive(object_get_root(), cxl_foreach_pxb_hb, cedt);
+
+    /* copy AML table into ACPI tables blob and patch header there */
+    g_array_append_vals(table_data, cedt->buf->data, cedt->buf->len);
+    build_header(linker, table_data, (void *)(table_data->data + cedt_start),
+                 "CEDT", table_data->len - cedt_start, 1, NULL, NULL);
+    free_aml_allocator();
+}
+
 static Aml *__build_cxl_osc_method(void)
 {
     Aml *method, *if_uuid, *else_uuid, *if_arg1_not_1, *if_cxl, *if_caps_masked;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 3eb07b9741..49242eb8f3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -75,6 +75,8 @@
 #include "hw/acpi/ipmi.h"
 #include "hw/acpi/hmat.h"
 
+#include "hw/acpi/cxl.h"
+
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
  * a little bit, there should be plenty of free space since the DSDT
@@ -1371,7 +1373,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
             scope = aml_scope("\\_SB");
             if (type == CXL) {
-                dev = aml_device("CXL%.01X", pci_bus_uid(bus));
+                dev = aml_device("CXL%.01X", uid);
             } else {
                 dev = aml_device("PC%.02X", bus_num);
             }
@@ -2277,6 +2279,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                           machine->nvdimms_state, machine->ram_slots);
     }
 
+    cxl_build_cedt(table_offsets, tables_blob, tables->linker);
+
     acpi_add_table(table_offsets, tables_blob);
     build_waet(tables_blob, tables->linker);
 
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index af1450c69d..6458d5b76e 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -57,26 +57,6 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
                          TYPE_PXB_PCIE_DEVICE)
 
-#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
-DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
-                         TYPE_PXB_CXL_DEVICE)
-
-struct PXBDev {
-    /*< private >*/
-    PCIDevice parent_obj;
-    /*< public >*/
-
-    uint8_t bus_nr;
-    uint16_t numa_node;
-    int32_t uid;
-    struct cxl_dev {
-        HostMemoryBackend *memory_window[CXL_WINDOW_MAX];
-
-        uint32_t num_windows;
-        hwaddr *window_base[CXL_WINDOW_MAX];
-    } cxl;
-};
-
 typedef struct CXLHost {
     PCIHostState parent_obj;
 
@@ -351,6 +331,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
         bus->flags |= PCI_BUS_CXL;
         PXB_CXL_HOST(ds)->dev = PXB_CXL_DEV(dev);
+        PXB_CXL_DEV(dev)->cxl.cxl_host_bridge = ds;
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
         bds = qdev_new("pci-bridge");
diff --git a/include/hw/acpi/cxl.h b/include/hw/acpi/cxl.h
index 7b8f3b8a2e..db2063f8c9 100644
--- a/include/hw/acpi/cxl.h
+++ b/include/hw/acpi/cxl.h
@@ -18,6 +18,10 @@
 #ifndef HW_ACPI_CXL_H
 #define HW_ACPI_CXL_H
 
+#include "hw/acpi/bios-linker-loader.h"
+
+void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
+                    BIOSLinker *linker);
 void build_cxl_osc_method(Aml *dev);
 
 #endif
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index a94d350034..50dd7fdf33 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -28,6 +28,7 @@
 
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/cxl/cxl.h"
 #include "qom/object.h"
 
 typedef struct PCIBridgeWindows PCIBridgeWindows;
@@ -81,6 +82,30 @@ struct PCIBridge {
 #define PCI_BRIDGE_DEV_PROP_MSI        "msi"
 #define PCI_BRIDGE_DEV_PROP_SHPC       "shpc"
 
+struct PXBDev {
+    /*< private >*/
+    PCIDevice parent_obj;
+    /*< public >*/
+
+    uint8_t bus_nr;
+    uint16_t numa_node;
+    int32_t uid;
+
+    struct cxl_dev {
+        HostMemoryBackend *memory_window[CXL_WINDOW_MAX];
+
+        uint32_t num_windows;
+        hwaddr *window_base[CXL_WINDOW_MAX];
+
+        void *cxl_host_bridge; /* Pointer to a CXLHost */
+    } cxl;
+};
+
+typedef struct PXBDev PXBDev;
+#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
+DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
+                         TYPE_PXB_CXL_DEVICE)
+
 int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
                           uint16_t svid, uint16_t ssid,
                           Error **errp);
-- 
2.30.0


