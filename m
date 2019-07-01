Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA711463AD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 18:12:56 +0200 (CEST)
Received: from localhost ([::1]:53054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hboox-0000Ol-GS
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 12:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33965)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hbobq-0001Cv-9O
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hbobn-0005vs-5r
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:22 -0400
Received: from mga18.intel.com ([134.134.136.126]:2019)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hbobm-0005LS-NK
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 08:59:14 -0700
X-ExtLoop1: 1
Received: from tao-optiplex-7060.sh.intel.com ([10.239.13.104])
 by orsmga008.jf.intel.com with ESMTP; 14 Jun 2019 08:59:12 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Fri, 14 Jun 2019 23:56:24 +0800
Message-Id: <20190614155626.27932-7-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614155626.27932-1-tao3.xu@intel.com>
References: <20190614155626.27932-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH v5 6/8] hmat acpi: Build Memory Subsystem
 Address Range Structure(s) in ACPI HMAT
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
Cc: jingqi.liu@intel.com, tao3.xu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jingqi <jingqi.liu@intel.com>

HMAT is defined in ACPI 6.2: 5.2.27 Heterogeneous Memory Attribute Table (HMAT).
The specification references below link:
http://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf

It describes the memory attributes, such as memory side cache
attributes and bandwidth and latency details, related to the
System Physical Address (SPA) Memory Ranges. The software is
expected to use this information as hint for optimization.

This structure describes the System Physical Address(SPA) range
occupied by memory subsystem and its associativity with processor
proximity domain as well as hint for memory usage.

Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

Changes in v5 -> v4:
    - Add more descriptions from ACPI spec (Igor)
    - Remove all the dependcy on PCMachineState (Igor)
---
 hw/acpi/Kconfig       |   5 ++
 hw/acpi/Makefile.objs |   1 +
 hw/acpi/hmat.c        | 153 ++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/hmat.h        |  43 ++++++++++++
 hw/core/machine.c     |   2 +
 hw/i386/acpi-build.c  |   3 +
 include/sysemu/numa.h |   2 +
 numa.c                |   6 ++
 8 files changed, 215 insertions(+)
 create mode 100644 hw/acpi/hmat.c
 create mode 100644 hw/acpi/hmat.h

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 7c59cf900b..039bb99efa 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -7,6 +7,7 @@ config ACPI_X86
     select ACPI_NVDIMM
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
+    select ACPI_HMAT
 
 config ACPI_X86_ICH
     bool
@@ -31,3 +32,7 @@ config ACPI_VMGENID
     bool
     default y
     depends on PC
+
+config ACPI_HMAT
+    bool
+    depends on ACPI
diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 661a9b8c2f..20cc2fb124 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) += memory_hotplug.o
 common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
 common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
 common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
+common-obj-$(CONFIG_ACPI_HMAT) += hmat.o
 common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
 
 common-obj-y += acpi_interface.o
diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
new file mode 100644
index 0000000000..6fd434c4d9
--- /dev/null
+++ b/hw/acpi/hmat.c
@@ -0,0 +1,153 @@
+/*
+ * HMAT ACPI Implementation
+ *
+ * Copyright(C) 2019 Intel Corporation.
+ *
+ * Author:
+ *  Liu jingqi <jingqi.liu@linux.intel.com>
+ *  Tao Xu <tao3.xu@intel.com>
+ *
+ * HMAT is defined in ACPI 6.2: 5.2.27 Heterogeneous Memory Attribute Table
+ * (HMAT)
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/numa.h"
+#include "hw/acpi/hmat.h"
+#include "hw/mem/pc-dimm.h"
+
+/* ACPI 6.2: 5.2.27.3 Memory Subsystem Address Range Structure: Table 5-141 */
+static void build_hmat_spa(GArray *table_data, uint16_t flags,
+                           uint64_t base, uint64_t length, int node)
+{
+
+    /* Memory Subsystem Address Range Structure */
+    /* Type */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Length */
+    build_append_int_noprefix(table_data, 40, 4);
+    /* Flags */
+    build_append_int_noprefix(table_data, flags, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Process Proximity Domain */
+    build_append_int_noprefix(table_data, node, 4);
+    /* Memory Proximity Domain */
+    build_append_int_noprefix(table_data, node, 4);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
+    /* System Physical Address Range Base */
+    build_append_int_noprefix(table_data, base, 8);
+    /* System Physical Address Range Length */
+    build_append_int_noprefix(table_data, length, 8);
+}
+
+static int pc_dimm_device_list(Object *obj, void *opaque)
+{
+    GSList **list = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PC_DIMM)) {
+        DeviceState *dev = DEVICE(obj);
+        if (dev->realized) { /* only realized memory devices matter */
+            *list = g_slist_append(*list, DEVICE(obj));
+        }
+    }
+
+    object_child_foreach(obj, pc_dimm_device_list, opaque);
+    return 0;
+}
+
+/* Build HMAT sub table structures */
+static void hmat_build_table_structs(GArray *table_data, MachineState *ms)
+{
+    GSList *device_list = NULL;
+    uint16_t flags;
+    uint64_t mem_base, mem_len;
+    int i;
+    NumaState *nstat = ms->numa_state;
+    NumaMemRange *mem_range;
+
+    Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
+    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
+    AcpiDeviceIf *adev = ACPI_DEVICE_IF(obj);
+
+    /*
+     * ACPI 6.2: 5.2.27.3 Memory Subsystem Address Range Structure:
+     * Table 5-141. The Proximity Domain of System Physical Address
+     * ranges defined in the HMAT, NFIT and SRAT tables shall match
+     * each other.
+     */
+    if (nstat->num_nodes && !nstat->mem_ranges_num) {
+        nstat->mem_ranges = g_array_new(false, true /* clear */,
+                                        sizeof *mem_range);
+        adevc->build_mem_ranges(adev, ms);
+    }
+
+    for (i = 0; i < nstat->mem_ranges_num; i++) {
+        mem_range = &g_array_index(nstat->mem_ranges, NumaMemRange, i);
+        flags = 0;
+
+        if (nstat->nodes[mem_range->node].is_initiator) {
+            flags |= HMAT_SPA_PROC_VALID;
+        }
+        if (nstat->nodes[mem_range->node].is_target) {
+            flags |= HMAT_SPA_MEM_VALID;
+        }
+
+        build_hmat_spa(table_data, flags, mem_range->base,
+                       mem_range->length,
+                       mem_range->node);
+    }
+
+    /* Build HMAT SPA structures for PC-DIMM devices. */
+    object_child_foreach(OBJECT(ms), pc_dimm_device_list, &device_list);
+
+    for (; device_list; device_list = device_list->next) {
+        PCDIMMDevice *dimm = device_list->data;
+        mem_base = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
+                                            NULL);
+        mem_len = object_property_get_uint(OBJECT(dimm), PC_DIMM_SIZE_PROP,
+                                           NULL);
+        i = object_property_get_uint(OBJECT(dimm), PC_DIMM_NODE_PROP, NULL);
+        flags = 0;
+
+        if (nstat->nodes[i].is_initiator) {
+            flags |= HMAT_SPA_PROC_VALID;
+        }
+        if (nstat->nodes[i].is_target) {
+            flags |= HMAT_SPA_MEM_VALID;
+        }
+        build_hmat_spa(table_data, flags, mem_base, mem_len, i);
+    }
+}
+
+void build_hmat(GArray *table_data, BIOSLinker *linker, MachineState *ms)
+{
+    uint64_t hmat_start;
+
+    hmat_start = table_data->len;
+
+    /* reserve space for HMAT header  */
+    acpi_data_push(table_data, 40);
+
+    hmat_build_table_structs(table_data, ms);
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + hmat_start),
+                 "HMAT", table_data->len - hmat_start, 1, NULL, NULL);
+}
diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
new file mode 100644
index 0000000000..e24b673fad
--- /dev/null
+++ b/hw/acpi/hmat.h
@@ -0,0 +1,43 @@
+/*
+ * HMAT ACPI Implementation Header
+ *
+ * Copyright(C) 2019 Intel Corporation.
+ *
+ * Author:
+ *  Liu jingqi <jingqi.liu@linux.intel.com>
+ *  Tao Xu <tao3.xu@intel.com>
+ *
+ * HMAT is defined in ACPI 6.2.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#ifndef HMAT_H
+#define HMAT_H
+
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "hw/acpi/aml-build.h"
+
+/* the values of AcpiHmatSpaRange flag */
+enum {
+    HMAT_SPA_PROC_VALID       = 0x1,
+    HMAT_SPA_MEM_VALID        = 0x2,
+    HMAT_SPA_RESERVATION_HINT = 0x4,
+};
+
+void build_hmat(GArray *table_data, BIOSLinker *linker, MachineState *ms);
+
+#endif
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 14b29de0a9..2ad09ec23e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -646,6 +646,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    NodeInfo *numa_info = machine->numa_state->nodes;
     bool match = false;
     int i;
 
@@ -706,6 +707,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
         match = true;
         slot->props.node_id = props->node_id;
         slot->props.has_node_id = props->has_node_id;
+        numa_info[props->node_id].is_initiator = true;
     }
 
     if (!match) {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 44dd447fa5..6584eac76e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -66,6 +66,7 @@
 #include "hw/i386/intel_iommu.h"
 
 #include "hw/acpi/ipmi.h"
+#include "hw/acpi/hmat.h"
 
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
@@ -2710,6 +2711,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
             acpi_add_table(table_offsets, tables_blob);
             build_slit(tables_blob, tables->linker, machine);
         }
+        acpi_add_table(table_offsets, tables_blob);
+        build_hmat(tables_blob, tables->linker, machine);
     }
     if (acpi_get_mcfg(&mcfg)) {
         acpi_add_table(table_offsets, tables_blob);
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index e3c85b77bc..13cff59112 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -10,6 +10,8 @@ struct NodeInfo {
     uint64_t node_mem;
     struct HostMemoryBackend *node_memdev;
     bool present;
+    bool is_initiator;
+    bool is_target;
     uint8_t distance[MAX_NODES];
 };
 
diff --git a/numa.c b/numa.c
index d23e130bce..5556d118c3 100644
--- a/numa.c
+++ b/numa.c
@@ -102,6 +102,10 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         }
     }
 
+    if (node->cpus) {
+        numa_info[nodenr].is_initiator = true;
+    }
+
     if (node->has_mem && node->has_memdev) {
         error_setg(errp, "cannot specify both mem= and memdev=");
         return;
@@ -118,6 +122,7 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
 
     if (node->has_mem) {
         numa_info[nodenr].node_mem = node->mem;
+        numa_info[nodenr].is_target = true;
     }
     if (node->has_memdev) {
         Object *o;
@@ -130,6 +135,7 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         object_ref(o);
         numa_info[nodenr].node_mem = object_property_get_uint(o, "size", NULL);
         numa_info[nodenr].node_memdev = MEMORY_BACKEND(o);
+        numa_info[nodenr].is_target = true;
     }
     numa_info[nodenr].present = true;
     max_numa_nodeid = MAX(max_numa_nodeid, nodenr + 1);
-- 
2.20.1


