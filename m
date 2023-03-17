Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B46BEEF8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:56:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDNH-0005kJ-Ry; Fri, 17 Mar 2023 12:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdDNG-0005j2-1A
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:56:14 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdDNC-0001vK-PU
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:56:13 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PdVcz2X6Dz67xNS;
 Sat, 18 Mar 2023 00:55:47 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 16:56:07 +0000
To: Michael Tsirkin <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <qemu-devel@nongnu.org>
CC: <linuxarm@huawei.com>, <ani@anisinha.ca>, <berrange@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, Dave Jiang <dave.jiang@intel.com>
Subject: [RFC PATCH 3/4] hw/i386/acpi: Separate PXB related parts of DSDT into
 an SSDT table.
Date: Fri, 17 Mar 2023 16:54:39 +0000
Message-ID: <20230317165440.24846-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
References: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The dependencies between the CRS entries and bus numbers due to
PCI eXpander Bridges taking resources from the primary bus make this
a slightly complex dance.

The rules we have to fit into are:
1) FACP is first table in RSDT and points to the DSDT.
2) Thus DSDT is created before FACP
3) SSDT must be pointed to by a later entry in RSDT so must
   be created after DSDT.
4) The main PCI bus in DSDT contains entries that are dependent on
   bus walks done to establish the entries for the PXB buses which
   are now in SSDT.

Solution is to precompute what will go in SSDT (CRS ranges and bus
numbers) then to create the DSDT + FACTP as normal.

After that create the SSDT, including rerunning some of the earlier
bus walking code (which will give the same answers).

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
RFC because:
 - There are lots of ways this could be done and I'm not sure people
   will like this one.
 - Is it a good idea in general?
 - Should we just move all the PCI stuff including the main bus
   to an SSDT table? - That feels like overkill to me.
---
 hw/i386/acpi-build.c | 250 +++++++++++++++++++++++++++----------------
 1 file changed, 160 insertions(+), 90 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d79d1d6f13..f0c4959455 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1423,28 +1423,158 @@ static void build_acpi0017(Aml *table)
     aml_append(table, scope);
 }
 
+/*
+ * Precompute the crs ranges and bus numbers that will be used in PXB entries
+ * in PXB SSDT.
+ */
+static void get_pxb_info(MachineState *machine, CrsRangeSet *crs_range_set,
+                         int *root_bus_limit)
+{
+    PCMachineState *pcms = PC_MACHINE(machine);
+    PCIBus *bus = PC_MACHINE(machine)->bus;
+    
+    QLIST_FOREACH(bus, &bus->child, sibling) {
+        uint8_t bus_num = pci_bus_num(bus);
+
+        /* look only for expander root buses */
+        if (!pci_bus_is_root(bus)) {
+            continue;
+        }
+
+        if (bus_num < *root_bus_limit) {
+            *root_bus_limit = bus_num - 1;
+        }
+
+        build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), crs_range_set,
+                  0, 0, 0, 0, NULL);
+
+        /* Handle the ranges for the PXB expanders */
+        if (pci_bus_is_cxl(bus)) {
+            MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
+            uint64_t base = mr->addr;
+
+            crs_range_insert(crs_range_set->mem_ranges, base,
+                             base + memory_region_size(mr) - 1);
+        }
+    }
+}
+
+static void build_pxb_ssdt(GArray *table_offsets, GArray *table_data, BIOSLinker *linker,
+                           MachineState *machine)
+{
+    X86MachineState *x86ms = X86_MACHINE(machine);
+    AcpiTable table = { .sig = "SSDT", .rev = 1,
+                        .oem_id = x86ms->oem_id, .oem_table_id = "PXB" };
+    Aml *ssdt, *scope, *dev, *crs;
+    bool cxl_present = false;
+    PCIBus *bus;
+
+    /*
+     * Check if there are any PXB instances so as to avoid the aml setup
+     * if there won't be a PXB SSDT
+     */
+    bus = PC_MACHINE(machine)->bus;
+    if (!bus) {
+        return;
+    }
+
+    QLIST_FOREACH(bus, &bus->child, sibling) {
+        if (pci_bus_is_root(bus)) {
+            break;
+        }
+    }
+    if (!bus) {
+        return;
+    }
+
+    /* SSDT will exist so add a pointer that will end up RSDT/XSDT */
+    acpi_add_table(table_offsets, table_data);
+    acpi_table_begin(&table, table_data);
+    ssdt = init_aml_allocator();
+
+    bus = PC_MACHINE(machine)->bus;
+
+    QLIST_FOREACH(bus, &bus->child, sibling) {
+        uint8_t bus_num = pci_bus_num(bus);
+        uint8_t numa_node = pci_bus_numa_node(bus);
+
+        /* look only for expander root buses */
+        if (!pci_bus_is_root(bus)) {
+            continue;
+        }
+
+        scope = aml_scope("\\_SB");
+
+        if (pci_bus_is_cxl(bus)) {
+            dev = aml_device("CL%.02X", bus_num);
+        } else {
+            dev = aml_device("PI%.02X", bus_num);
+        }
+        aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
+        aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
+        if (pci_bus_is_cxl(bus)) {
+            struct Aml *pkg = aml_package(2);
+
+            aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
+            aml_append(pkg, aml_eisaid("PNP0A08"));
+            aml_append(pkg, aml_eisaid("PNP0A03"));
+            aml_append(dev, aml_name_decl("_CID", pkg));
+            aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+            build_cxl_osc_method(dev);
+        } else if (pci_bus_is_express(bus)) {
+            aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
+            aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
+
+            /* Expander bridges do not have ACPI PCI Hot-plug enabled */
+            aml_append(dev, build_q35_osc_method(true));
+        } else {
+            aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
+        }
+
+        if (numa_node != NUMA_NODE_UNASSIGNED) {
+            aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
+        }
+
+        aml_append(dev, build_prt(false));
+        crs = aml_resource_template();
+        build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), NULL,
+                  0, 0, 0, 0, crs);
+        aml_append(dev, aml_name_decl("_CRS", crs));
+        aml_append(scope, dev);
+        aml_append(ssdt, scope);
+
+        if (pci_bus_is_cxl(bus)) {
+            cxl_present = true;
+        }
+    }
+
+    if (cxl_present) {
+        build_acpi0017(ssdt);
+    }
+    g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
+    acpi_table_end(linker, &table);
+    free_aml_allocator();
+}
+
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
-           Range *pci_hole, Range *pci_hole64, MachineState *machine)
+           Range *pci_hole, Range *pci_hole64, MachineState *machine,
+           CrsRangeSet *crs_range_set, int root_bus_limit)
 {
     Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
     Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
     CrsRangeEntry *entry;
     Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
-    CrsRangeSet crs_range_set;
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(machine);
     X86MachineState *x86ms = X86_MACHINE(machine);
     AcpiMcfgInfo mcfg;
     bool mcfg_valid = !!acpi_get_mcfg(&mcfg);
     uint32_t nr_mem = machine->ram_slots;
-    int root_bus_limit = 0xFF;
-    PCIBus *bus = NULL;
 #ifdef CONFIG_TPM
     TPMIf *tpm = tpm_find();
 #endif
-    bool cxl_present = false;
     int i;
     VMBusBridge *vmbus_bridge = vmbus_bridge_find();
     AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
@@ -1557,78 +1687,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                                  pcms->memhp_io_base);
     }
 
-    crs_range_set_init(&crs_range_set);
-    bus = PC_MACHINE(machine)->bus;
-    if (bus) {
-        QLIST_FOREACH(bus, &bus->child, sibling) {
-            uint8_t bus_num = pci_bus_num(bus);
-            uint8_t numa_node = pci_bus_numa_node(bus);
-
-            /* look only for expander root buses */
-            if (!pci_bus_is_root(bus)) {
-                continue;
-            }
-
-            if (bus_num < root_bus_limit) {
-                root_bus_limit = bus_num - 1;
-            }
-
-            scope = aml_scope("\\_SB");
-
-            if (pci_bus_is_cxl(bus)) {
-                dev = aml_device("CL%.02X", bus_num);
-            } else {
-                dev = aml_device("PC%.02X", bus_num);
-            }
-            aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
-            aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
-            if (pci_bus_is_cxl(bus)) {
-                struct Aml *pkg = aml_package(2);
-
-                aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
-                aml_append(pkg, aml_eisaid("PNP0A08"));
-                aml_append(pkg, aml_eisaid("PNP0A03"));
-                aml_append(dev, aml_name_decl("_CID", pkg));
-                aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-                build_cxl_osc_method(dev);
-            } else if (pci_bus_is_express(bus)) {
-                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-                aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
-
-                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
-                aml_append(dev, build_q35_osc_method(true));
-            } else {
-                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
-            }
-
-            if (numa_node != NUMA_NODE_UNASSIGNED) {
-                aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
-            }
-
-            aml_append(dev, build_prt(false));
-            crs = aml_resource_template();
-            build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
-                      0, 0, 0, 0, crs);
-            aml_append(dev, aml_name_decl("_CRS", crs));
-            aml_append(scope, dev);
-            aml_append(dsdt, scope);
-
-            /* Handle the ranges for the PXB expanders */
-            if (pci_bus_is_cxl(bus)) {
-                MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
-                uint64_t base = mr->addr;
-
-                cxl_present = true;
-                crs_range_insert(crs_range_set.mem_ranges, base,
-                                 base + memory_region_size(mr) - 1);
-            }
-        }
-    }
-
-    if (cxl_present) {
-        build_acpi0017(dsdt);
-    }
-
     /*
      * At this point crs_range_set has all the ranges used by pci
      * busses *other* than PCI0.  These ranges will be excluded from
@@ -1636,7 +1694,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
      * too.
      */
     if (mcfg_valid) {
-        crs_range_insert(crs_range_set.mem_ranges,
+        crs_range_insert(crs_range_set->mem_ranges,
                          mcfg.base, mcfg.base + mcfg.size - 1);
     }
 
@@ -1654,9 +1712,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                     AML_POS_DECODE, AML_ENTIRE_RANGE,
                     0x0000, 0x0000, 0x0CF7, 0x0000, 0x0CF8));
 
-    crs_replace_with_free_ranges(crs_range_set.io_ranges, 0x0D00, 0xFFFF);
-    for (i = 0; i < crs_range_set.io_ranges->len; i++) {
-        entry = g_ptr_array_index(crs_range_set.io_ranges, i);
+    crs_replace_with_free_ranges(crs_range_set->io_ranges, 0x0D00, 0xFFFF);
+    for (i = 0; i < crs_range_set->io_ranges->len; i++) {
+        entry = g_ptr_array_index(crs_range_set->io_ranges, i);
         aml_append(crs,
             aml_word_io(AML_MIN_FIXED, AML_MAX_FIXED,
                         AML_POS_DECODE, AML_ENTIRE_RANGE,
@@ -1669,11 +1727,11 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                          AML_CACHEABLE, AML_READ_WRITE,
                          0, 0x000A0000, 0x000BFFFF, 0, 0x00020000));
 
-    crs_replace_with_free_ranges(crs_range_set.mem_ranges,
+    crs_replace_with_free_ranges(crs_range_set->mem_ranges,
                                  range_lob(pci_hole),
                                  range_upb(pci_hole));
-    for (i = 0; i < crs_range_set.mem_ranges->len; i++) {
-        entry = g_ptr_array_index(crs_range_set.mem_ranges, i);
+    for (i = 0; i < crs_range_set->mem_ranges->len; i++) {
+        entry = g_ptr_array_index(crs_range_set->mem_ranges, i);
         aml_append(crs,
             aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
                              AML_NON_CACHEABLE, AML_READ_WRITE,
@@ -1682,11 +1740,11 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     }
 
     if (!range_is_empty(pci_hole64)) {
-        crs_replace_with_free_ranges(crs_range_set.mem_64bit_ranges,
+        crs_replace_with_free_ranges(crs_range_set->mem_64bit_ranges,
                                      range_lob(pci_hole64),
                                      range_upb(pci_hole64));
-        for (i = 0; i < crs_range_set.mem_64bit_ranges->len; i++) {
-            entry = g_ptr_array_index(crs_range_set.mem_64bit_ranges, i);
+        for (i = 0; i < crs_range_set->mem_64bit_ranges->len; i++) {
+            entry = g_ptr_array_index(crs_range_set->mem_64bit_ranges, i);
             aml_append(crs,
                        aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
                                         AML_MAX_FIXED,
@@ -1722,8 +1780,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     aml_append(dev, aml_name_decl("_CRS", crs));
     aml_append(scope, dev);
 
-    crs_range_set_free(&crs_range_set);
-
     /* reserve PCIHP resources */
     if (pm->pcihp_io_len && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
         dev = aml_device("PHPR");
@@ -2485,6 +2541,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     AcpiMiscInfo misc;
     AcpiMcfgInfo mcfg;
     Range pci_hole = {}, pci_hole64 = {};
+    int root_bus_limit = 0xFF;
+    CrsRangeSet crs_range_set;
     uint8_t *u;
     size_t aml_len = 0;
     GArray *tables_blob = tables->table_data;
@@ -2527,10 +2585,20 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     facs = tables_blob->len;
     build_facs(tables_blob);
 
+    crs_range_set_init(&crs_range_set);
+
+    /*
+     * Before creating the entries for the main PCI bus, establish
+     * if space needs to be made for any PXB instances.
+     */
+    get_pxb_info(machine, &crs_range_set, &root_bus_limit);
     /* DSDT is pointed to by FADT */
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, &pm, &misc,
-               &pci_hole, &pci_hole64, machine);
+               &pci_hole, &pci_hole64, machine, &crs_range_set,
+               root_bus_limit);
+
+    crs_range_set_free(&crs_range_set);
 
     /* Count the size of the DSDT and SSDT, we will need it for legacy
      * sizing of ACPI tables.
@@ -2546,6 +2614,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     build_fadt(tables_blob, tables->linker, &pm.fadt, oem_id, oem_table_id);
     aml_len += tables_blob->len - fadt;
 
+    build_pxb_ssdt(table_offsets, tables_blob, tables->linker, machine);
+
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, x86ms,
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
-- 
2.37.2


