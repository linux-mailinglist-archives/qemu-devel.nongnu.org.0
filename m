Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C666E6F52
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 00:22:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pothz-0002sm-9R; Tue, 18 Apr 2023 18:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1poths-0002rk-Kq
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:21:48 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pothq-0004DW-DG
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681856506; x=1713392506;
 h=subject:from:to:cc:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c6d2H+L7ajL8aeKAWmHeT6pXCZmAxqtjt6gKbl0Shj4=;
 b=bm9TxNgolicDhG7kmKQ3BvtDHzkpG6smzPXVr6Wsc6nQx23kdZkg7HPD
 AMlUThoMFXhn9xvou4tXhrnW8ilkwcM84SsZHvime1YL+2Ys1Cas4J4Up
 vrg7VFrONhQPVAZ8Qgrg3ECMfHTZ2+3fnHbF/kK0XLuLX74D1dyqUOZKj
 G0b9fp3r9JptnMXqH9fLAGCckCt4etIg3OHvHjeYhZtjJxX7sryVwlJLR
 cu4hcA422TmyXuuHST6n/yd9wpeMAKEQ3akPyroPH7QQ3VLAzHpOLX1jJ
 +kVz+D63hXcfPz5v54VBcI17mXYdqztAvLYvwxLjHiCd3figE/vN5ECGJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="329472095"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="329472095"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 15:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693796509"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="693796509"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [192.168.1.177])
 ([10.212.29.141])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 15:21:42 -0700
Subject: [RFC PATCH 1/3] hw/acpi: Add support for Generic Port Affinity
 Structure to SRAT
From: Dave Jiang <dave.jiang@intel.com>
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com, Jonathan.Cameron@huawei.com, ira.weiny@intel.com,
 mst@redhat.com, bwidawsk@kernel.org
Date: Tue, 18 Apr 2023 15:21:42 -0700
Message-ID: <168185650287.899932.7842807135894727711.stgit@djiang5-mobl3>
In-Reply-To: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
References: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=dave.jiang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The Generic Port Affinity Structure is added for the System Resource
Affinity Table in ACPI r6.4. It provides information on the proximity
domain that's associated with a device handle. This information in
combination with HMAT can be used by the CXL driver to calculate the
bandwidth and latency information between the CPU and the CXL Host Bridge
(HB).

Add a list to account for the ACPI0016 (CXL HB ACPI devices) being
created. Create GAPS entries equivalent to the number of HB devices
constructed by qemu using the list and inject the relevant device handle.

The proximity domain will be set to 0 for simplicity to enable Linux kernel
side debugging and usage of the new SRAT sub-tables.

Signed-off-by: Dave Jiang <dave.jiang@intel.com>
---
 hw/acpi/aml-build.c         |   21 +++++++++++++++++++++
 hw/i386/acpi-build.c        |   27 +++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h |   27 +++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index ea331a20d131..949759efc0a7 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1938,6 +1938,27 @@ void build_srat_memory(GArray *table_data, uint64_t base,
     build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 }
 
+/*
+ * ACPI spec, Revision 6.5
+ * 5.2.16.7 Generic Port Affinity Structure
+ */
+void build_srat_generic_port_affinity(GArray *table_data, uint8_t htype,
+                                      int node, ACPIDeviceHandle *handle,
+                                      GenericAffinityFlags flags)
+{
+    build_append_int_noprefix(table_data, 6, 1);     /* Type */
+    build_append_int_noprefix(table_data, 32, 1);    /* Length */
+    build_append_int_noprefix(table_data, 0, 1);     /* Reserved */
+    build_append_int_noprefix(table_data, htype, 1); /* Device Handle Type */
+    build_append_int_noprefix(table_data, node, 4);  /* Proximity Domain */
+    build_append_int_noprefix(table_data, handle->raw[0],
+                              8); /* Device Handle part 1 */
+    build_append_int_noprefix(table_data, handle->raw[1],
+                              8);                    /* Device Handle part 2 */
+    build_append_int_noprefix(table_data, flags, 4); /* Flags */
+    build_append_int_noprefix(table_data, 0, 4);     /* Reserved */
+}
+
 /*
  * ACPI spec 5.2.17 System Locality Distance Information Table
  * (Revision 2.0 or later)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d449e5b76f30..0d9e610af12b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -132,6 +132,13 @@ const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio = {
     .bit_width = NVDIMM_ACPI_IO_LEN << 3
 };
 
+typedef struct CxlHBDev {
+    uint32_t uid;
+    QSLIST_ENTRY(CxlHBDev) entry;
+} CxlHBDev;
+
+static QSLIST_HEAD(, CxlHBDev) cxl_hb_list_head;
+
 static void init_common_fadt_data(MachineState *ms, Object *o,
                                   AcpiFadtData *data)
 {
@@ -1507,8 +1514,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
             if (pci_bus_is_cxl(bus)) {
+                CxlHBDev *hb_entry;
                 struct Aml *pkg = aml_package(2);
 
+                hb_entry = g_malloc0(sizeof(*hb_entry));
+                hb_entry->uid = bus_num;
+                QSLIST_INSERT_HEAD(&cxl_hb_list_head, hb_entry, entry);
+
                 aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
                 aml_append(pkg, aml_eisaid("PNP0A08"));
                 aml_append(pkg, aml_eisaid("PNP0A03"));
@@ -1866,6 +1878,7 @@ static void
 build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 {
     int i;
+    CxlHBDev *hb_entry;
     int numa_mem_start, slots;
     uint64_t mem_len, mem_base, next_base;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
@@ -1973,6 +1986,18 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 
     sgx_epc_build_srat(table_data);
 
+    QSLIST_FOREACH(hb_entry, &cxl_hb_list_head, entry)
+    {
+        ACPIDeviceHandle handle = {
+            .hid = "ACPI0016",
+            .uid = hb_entry->uid,
+        };
+        uint32_t flags = GEN_AFFINITY_ENABLED;
+
+        build_srat_generic_port_affinity(table_data, 0, nb_numa_nodes,
+                                         &handle, flags);
+    }
+
     /*
      * TODO: this part is not in ACPI spec and current linux kernel boots fine
      * without these entries. But I recall there were issues the last time I
@@ -2728,6 +2753,8 @@ void acpi_setup(void)
         return;
     }
 
+    QSLIST_INIT(&cxl_hb_list_head);
+
     build_state = g_malloc0(sizeof *build_state);
 
     acpi_build_tables_init(&tables);
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index d1fb08514bfa..32a4f574abaa 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -204,6 +204,10 @@ typedef enum {
     AML_PULL_NONE = 3,
 } AmlPinConfig;
 
+/*
+ * ACPI 6.5: Table 5-68 Flags - Generic Initiator/Port Affinity Structure
+ * Flags field definition
+ */
 typedef enum {
     MEM_AFFINITY_NOFLAGS      = 0,
     MEM_AFFINITY_ENABLED      = (1 << 0),
@@ -211,6 +215,25 @@ typedef enum {
     MEM_AFFINITY_NON_VOLATILE = (1 << 2),
 } MemoryAffinityFlags;
 
+/*
+ * ACPI 6.5: Table 5-65 Device Handle - ACPI
+ * Device Handle definition
+ */
+typedef union ACPIDeviceHandle {
+    struct {
+        uint8_t hid[8];
+        uint32_t uid;
+        uint32_t reserved;
+    };
+    uint64_t raw[2];
+} ACPIDeviceHandle;
+
+typedef enum {
+    GEN_AFFINITY_NOFLAGS = 0,
+    GEN_AFFINITY_ENABLED = (1 << 0),
+    GEN_AFFINITY_ARCH_TRANS = (2 << 0),
+} GenericAffinityFlags;
+
 typedef
 struct AcpiBuildTables {
     GArray *table_data;
@@ -486,6 +509,10 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
 void build_srat_memory(GArray *table_data, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
+void build_srat_generic_port_affinity(GArray *table_data, uint8_t htype,
+                                      int node, ACPIDeviceHandle *handle,
+                                      GenericAffinityFlags flags);
+
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id);
 



