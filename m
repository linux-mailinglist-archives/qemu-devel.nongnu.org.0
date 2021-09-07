Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E307402B44
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:01:04 +0200 (CEST)
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcat-0007dd-6F
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPQ-0007ls-Fe
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPN-0000Dd-V7
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2uSfQHtonuqYDhz/uy/0qP01sM+umkgkdxnVzWE+RY=;
 b=ehrON8Zp7PVr/hFumkh5OfPgU3pxJ+saszzP+bG77O+X0a2Oe3U4WKNCvXEe3HMA2v1sz5
 ovez5AHjXeP76n7FV/tPgxq0w8TggM5BgN58jZVVTOkmB9xxrolpLhnAzldXspEPkOqicM
 zj07d2an2uvtcRHFoiZjGhuAB6FPloU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-uzyR3pINPXKo5MjKMW2utQ-1; Tue, 07 Sep 2021 10:49:06 -0400
X-MC-Unique: uzyR3pINPXKo5MjKMW2utQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAF3E194092C;
 Tue,  7 Sep 2021 14:49:04 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56D555D9CA;
 Tue,  7 Sep 2021 14:49:01 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/35] acpi: use build_append_int_noprefix() API to compose
 SRAT table
Date: Tue,  7 Sep 2021 10:47:56 -0400
Message-Id: <20210907144814.741785-18-imammedo@redhat.com>
In-Reply-To: <20210907144814.741785-1-imammedo@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, xiaoguangrong.eric@gmail.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 eauger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop usage of packed structures and explicit endian conversions
when building SRAT tables for arm/x86 and use endian agnostic
build_append_int_noprefix() API to build it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
 * rebase on top of (e77af21a7a2 hw/i386/acpi-build: Get NUMA information from struct NumaState)
CC: xiaoguangrong.eric@gmail.com
CC: shannon.zhaosl@gmail.com
CC: peter.maydell@linaro.org
CC: marcel.apfelbaum@gmail.com
CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
CC: eauger@redhat.com
---
 include/hw/acpi/acpi-defs.h | 49 -----------------------
 include/hw/acpi/aml-build.h |  2 +-
 hw/acpi/aml-build.c         | 24 ++++++++----
 hw/acpi/nvdimm.c            |  4 +-
 hw/arm/virt-acpi-build.c    | 29 ++++++++------
 hw/i386/acpi-build.c        | 78 +++++++++++++++++++++----------------
 6 files changed, 80 insertions(+), 106 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 5826ee04b6..d293304f9c 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -358,55 +358,6 @@ struct AcpiGenericTimerTable {
 } QEMU_PACKED;
 typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
 
-#define ACPI_SRAT_PROCESSOR_APIC     0
-#define ACPI_SRAT_MEMORY             1
-#define ACPI_SRAT_PROCESSOR_x2APIC   2
-#define ACPI_SRAT_PROCESSOR_GICC     3
-
-struct AcpiSratProcessorAffinity {
-    ACPI_SUB_HEADER_DEF
-    uint8_t     proximity_lo;
-    uint8_t     local_apic_id;
-    uint32_t    flags;
-    uint8_t     local_sapic_eid;
-    uint8_t     proximity_hi[3];
-    uint32_t    reserved;
-} QEMU_PACKED;
-typedef struct AcpiSratProcessorAffinity AcpiSratProcessorAffinity;
-
-struct AcpiSratProcessorX2ApicAffinity {
-    ACPI_SUB_HEADER_DEF
-    uint16_t    reserved;
-    uint32_t    proximity_domain;
-    uint32_t    x2apic_id;
-    uint32_t    flags;
-    uint32_t    clk_domain;
-    uint32_t    reserved2;
-} QEMU_PACKED;
-typedef struct AcpiSratProcessorX2ApicAffinity AcpiSratProcessorX2ApicAffinity;
-
-struct AcpiSratMemoryAffinity {
-    ACPI_SUB_HEADER_DEF
-    uint32_t    proximity;
-    uint16_t    reserved1;
-    uint64_t    base_addr;
-    uint64_t    range_length;
-    uint32_t    reserved2;
-    uint32_t    flags;
-    uint32_t    reserved3[2];
-} QEMU_PACKED;
-typedef struct AcpiSratMemoryAffinity AcpiSratMemoryAffinity;
-
-struct AcpiSratProcessorGiccAffinity {
-    ACPI_SUB_HEADER_DEF
-    uint32_t    proximity;
-    uint32_t    acpi_processor_uid;
-    uint32_t    flags;
-    uint32_t    clock_domain;
-} QEMU_PACKED;
-
-typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
-
 /* DMAR - DMA Remapping table r2.2 */
 struct AcpiTableDmar {
     ACPI_TABLE_HEADER_DEF
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 4242382399..6e1f42e119 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -487,7 +487,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
                uint32_t mmio32_offset, uint64_t mmio64_offset,
                uint16_t bus_nr_offset);
 
-void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
+void build_srat_memory(GArray *table_data, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 5e8bfb631c..050fdb3f37 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1936,15 +1936,25 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
     acpi_table_end(linker, &table);
 }
 
-void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
+/*
+ * ACPI spec, Revision 4.0
+ * 5.2.16.2 Memory Affinity Structure
+ */
+void build_srat_memory(GArray *table_data, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags)
 {
-    numamem->type = ACPI_SRAT_MEMORY;
-    numamem->length = sizeof(*numamem);
-    numamem->proximity = cpu_to_le32(node);
-    numamem->flags = cpu_to_le32(flags);
-    numamem->base_addr = cpu_to_le64(base);
-    numamem->range_length = cpu_to_le64(len);
+    build_append_int_noprefix(table_data, 1, 1); /* Type */
+    build_append_int_noprefix(table_data, 40, 1); /* Length */
+    build_append_int_noprefix(table_data, node, 4); /* Proximity Domain */
+    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
+    build_append_int_noprefix(table_data, base, 4); /* Base Address Low */
+    /* Base Address High */
+    build_append_int_noprefix(table_data, base >> 32, 4);
+    build_append_int_noprefix(table_data, len, 4); /* Length Low */
+    build_append_int_noprefix(table_data, len >> 32, 4); /* Length High */
+    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    build_append_int_noprefix(table_data, flags, 4); /* Flags */
+    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 }
 
 /*
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index e050b47c2b..baab81f7a6 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -1336,7 +1336,6 @@ void nvdimm_build_srat(GArray *table_data)
     GSList *device_list = nvdimm_get_device_list();
 
     for (; device_list; device_list = device_list->next) {
-        AcpiSratMemoryAffinity *numamem = NULL;
         DeviceState *dev = device_list->data;
         Object *obj = OBJECT(dev);
         uint64_t addr, size;
@@ -1346,8 +1345,7 @@ void nvdimm_build_srat(GArray *table_data)
         addr = object_property_get_uint(obj, PC_DIMM_ADDR_PROP, &error_abort);
         size = object_property_get_uint(obj, PC_DIMM_SIZE_PROP, &error_abort);
 
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, addr, size, node,
+        build_srat_memory(table_data, addr, size, node,
                           MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
     }
     g_slist_free(device_list);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 21efe7fe34..6ba02cf281 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -474,11 +474,13 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  vms->oem_table_id);
 }
 
+/*
+ * ACPI spec, Revision 5.1
+ * 5.2.16 System Resource Affinity Table (SRAT)
+ */
 static void
 build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    AcpiSratProcessorGiccAffinity *core;
-    AcpiSratMemoryAffinity *numamem;
     int i;
     uint64_t mem_base;
     MachineClass *mc = MACHINE_GET_CLASS(vms);
@@ -492,19 +494,23 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 
     for (i = 0; i < cpu_list->len; ++i) {
-        core = acpi_data_push(table_data, sizeof(*core));
-        core->type = ACPI_SRAT_PROCESSOR_GICC;
-        core->length = sizeof(*core);
-        core->proximity = cpu_to_le32(cpu_list->cpus[i].props.node_id);
-        core->acpi_processor_uid = cpu_to_le32(i);
-        core->flags = cpu_to_le32(1);
+        uint32_t nodeid = cpu_list->cpus[i].props.node_id;
+        /*
+         * 5.2.16.4 GICC Affinity Structure
+         */
+        build_append_int_noprefix(table_data, 3, 1);      /* Type */
+        build_append_int_noprefix(table_data, 18, 1);     /* Length */
+        build_append_int_noprefix(table_data, nodeid, 4); /* Proximity Domain */
+        build_append_int_noprefix(table_data, i, 4); /* ACPI Processor UID */
+        /* Flags, Table 5-76 */
+        build_append_int_noprefix(table_data, 1 /* Enabled */, 4);
+        build_append_int_noprefix(table_data, 0, 4); /* Clock Domain */
     }
 
     mem_base = vms->memmap[VIRT_MEM].base;
     for (i = 0; i < ms->numa_state->num_nodes; ++i) {
         if (ms->numa_state->nodes[i].node_mem > 0) {
-            numamem = acpi_data_push(table_data, sizeof(*numamem));
-            build_srat_memory(numamem, mem_base,
+            build_srat_memory(table_data, mem_base,
                               ms->numa_state->nodes[i].node_mem, i,
                               MEM_AFFINITY_ENABLED);
             mem_base += ms->numa_state->nodes[i].node_mem;
@@ -516,8 +522,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     if (ms->device_memory) {
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, ms->device_memory->base,
+        build_srat_memory(table_data, ms->device_memory->base,
                           memory_region_size(&ms->device_memory->mr),
                           ms->numa_state->num_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 41c0a63b30..51e0ba07b6 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1917,13 +1917,15 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
 #define HOLE_640K_START  (640 * KiB)
 #define HOLE_640K_END   (1 * MiB)
 
+/*
+ * ACPI spec, Revision 3.0
+ * 5.2.15 System Resource Affinity Table (SRAT)
+ */
 static void
 build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 {
-    AcpiSratMemoryAffinity *numamem;
-
     int i;
-    int numa_start, slots;
+    int numa_mem_start, slots;
     uint64_t mem_len, mem_base, next_base;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     X86MachineState *x86ms = X86_MACHINE(machine);
@@ -1946,34 +1948,41 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         uint32_t apic_id = apic_ids->cpus[i].arch_id;
 
         if (apic_id < 255) {
-            AcpiSratProcessorAffinity *core;
-
-            core = acpi_data_push(table_data, sizeof *core);
-            core->type = ACPI_SRAT_PROCESSOR_APIC;
-            core->length = sizeof(*core);
-            core->local_apic_id = apic_id;
-            core->proximity_lo = node_id;
-            memset(core->proximity_hi, 0, 3);
-            core->local_sapic_eid = 0;
-            core->flags = cpu_to_le32(1);
+            /* 5.2.15.1 Processor Local APIC/SAPIC Affinity Structure */
+            build_append_int_noprefix(table_data, 0, 1);  /* Type  */
+            build_append_int_noprefix(table_data, 16, 1); /* Length */
+            /* Proximity Domain [7:0] */
+            build_append_int_noprefix(table_data, node_id, 1);
+            build_append_int_noprefix(table_data, apic_id, 1); /* APIC ID */
+            /* Flags, Table 5-36 */
+            build_append_int_noprefix(table_data, 1, 4);
+            build_append_int_noprefix(table_data, 0, 1); /* Local SAPIC EID */
+            /* Proximity Domain [31:8] */
+            build_append_int_noprefix(table_data, 0, 3);
+            build_append_int_noprefix(table_data, 0, 4); /* Reserved */
         } else {
-            AcpiSratProcessorX2ApicAffinity *core;
-
-            core = acpi_data_push(table_data, sizeof *core);
-            core->type = ACPI_SRAT_PROCESSOR_x2APIC;
-            core->length = sizeof(*core);
-            core->x2apic_id = cpu_to_le32(apic_id);
-            core->proximity_domain = cpu_to_le32(node_id);
-            core->flags = cpu_to_le32(1);
+            /*
+             * ACPI spec, Revision 4.0
+             * 5.2.16.3 Processor Local x2APIC Affinity Structure
+             */
+            build_append_int_noprefix(table_data, 2, 1);  /* Type  */
+            build_append_int_noprefix(table_data, 24, 1); /* Length */
+            build_append_int_noprefix(table_data, 0, 2); /* Reserved */
+            /* Proximity Domain */
+            build_append_int_noprefix(table_data, node_id, 4);
+            build_append_int_noprefix(table_data, apic_id, 4); /* X2APIC ID */
+            /* Flags, Table 5-39 */
+            build_append_int_noprefix(table_data, 1 /* Enabled */, 4);
+            build_append_int_noprefix(table_data, 0, 4); /* Clock Domain */
+            build_append_int_noprefix(table_data, 0, 4); /* Reserved */
         }
     }
 
-
     /* the memory map is a bit tricky, it contains at least one hole
      * from 640k-1M and possibly another one from 3.5G-4G.
      */
     next_base = 0;
-    numa_start = table_data->len;
+    numa_mem_start = table_data->len;
 
     for (i = 1; i < nb_numa_nodes + 1; ++i) {
         mem_base = next_base;
@@ -1985,8 +1994,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
             next_base > HOLE_640K_START) {
             mem_len -= next_base - HOLE_640K_START;
             if (mem_len > 0) {
-                numamem = acpi_data_push(table_data, sizeof *numamem);
-                build_srat_memory(numamem, mem_base, mem_len, i - 1,
+                build_srat_memory(table_data, mem_base, mem_len, i - 1,
                                   MEM_AFFINITY_ENABLED);
             }
 
@@ -2004,8 +2012,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
             next_base > x86ms->below_4g_mem_size) {
             mem_len -= next_base - x86ms->below_4g_mem_size;
             if (mem_len > 0) {
-                numamem = acpi_data_push(table_data, sizeof *numamem);
-                build_srat_memory(numamem, mem_base, mem_len, i - 1,
+                build_srat_memory(table_data, mem_base, mem_len, i - 1,
                                   MEM_AFFINITY_ENABLED);
             }
             mem_base = 1ULL << 32;
@@ -2014,8 +2021,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         }
 
         if (mem_len > 0) {
-            numamem = acpi_data_push(table_data, sizeof *numamem);
-            build_srat_memory(numamem, mem_base, mem_len, i - 1,
+            build_srat_memory(table_data, mem_base, mem_len, i - 1,
                               MEM_AFFINITY_ENABLED);
         }
     }
@@ -2024,10 +2030,15 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         nvdimm_build_srat(table_data);
     }
 
-    slots = (table_data->len - numa_start) / sizeof *numamem;
+    /*
+     * TODO: this part is not in ACPI spec and current linux kernel boots fine
+     * without these entries. But I recall there were issues the last time I
+     * tried to remove it with some ancient guest OS, however I can't remember
+     * what that was so keep this around for now
+     */
+    slots = (table_data->len - numa_mem_start) / 40 /* mem affinity len */;
     for (; slots < nb_numa_nodes + 2; slots++) {
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
+        build_srat_memory(table_data, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
     }
 
     /*
@@ -2039,8 +2050,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * providing _PXM method if necessary.
      */
     if (hotplugabble_address_space_size) {
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, machine->device_memory->base,
+        build_srat_memory(table_data, machine->device_memory->base,
                           hotplugabble_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
-- 
2.27.0


