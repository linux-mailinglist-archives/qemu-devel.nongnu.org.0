Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E10463C3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 18:16:12 +0200 (CEST)
Received: from localhost ([::1]:53084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbos7-0004Ru-Gp
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 12:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hbobp-0001CN-0m
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hbobm-0005v2-4I
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:20 -0400
Received: from mga18.intel.com ([134.134.136.126]:2020)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hbobl-0005M2-Lo
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 08:59:12 -0700
X-ExtLoop1: 1
Received: from tao-optiplex-7060.sh.intel.com ([10.239.13.104])
 by orsmga008.jf.intel.com with ESMTP; 14 Jun 2019 08:59:10 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Fri, 14 Jun 2019 23:56:23 +0800
Message-Id: <20190614155626.27932-6-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614155626.27932-1-tao3.xu@intel.com>
References: <20190614155626.27932-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH v5 5/8] acpi: introduce
 AcpiDeviceIfClass.build_mem_ranges hook
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

Add build_mem_ranges callback to AcpiDeviceIfClass and use
it for generating SRAT and HMAT numa memory ranges.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Co-developed-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

Changes in v5 -> v4:
    - Add the missing if 'mem_len > 0' in pc_build_mem_ranges() (Igor)
    - Correct the descriptions of build_mem_ranges
    in AcpiDeviceIfClass (Igor)
    - Use GArray for NUMA memory ranges data (Igor)
    - Add the reason of using stub (Igor)
---
 hw/acpi/piix4.c                      |   1 +
 hw/i386/acpi-build.c                 | 133 +++++++++++++++++----------
 hw/isa/lpc_ich9.c                    |   1 +
 include/hw/acpi/acpi_dev_interface.h |   4 +
 include/hw/i386/pc.h                 |   1 +
 include/sysemu/numa.h                |  12 +++
 stubs/Makefile.objs                  |   1 +
 stubs/pc_build_mem_ranges.c          |  14 +++
 8 files changed, 120 insertions(+), 47 deletions(-)
 create mode 100644 stubs/pc_build_mem_ranges.c

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index ec4e186cec..bc078c1ad7 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -702,6 +702,7 @@ static void piix4_pm_class_init(ObjectClass *klass, void *data)
     adevc->ospm_status = piix4_ospm_status;
     adevc->send_event = piix4_send_gpe;
     adevc->madt_cpu = pc_madt_cpu_entry;
+    adevc->build_mem_ranges = pc_build_mem_ranges;
 }
 
 static const TypeInfo piix4_pm_info = {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 055e677c30..44dd447fa5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2279,18 +2279,89 @@ build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 #define HOLE_640K_START  (640 * KiB)
 #define HOLE_640K_END   (1 * MiB)
 
+void pc_build_mem_ranges(AcpiDeviceIf *adev, MachineState *ms)
+{
+    uint64_t mem_len, mem_base, next_base;
+    int i;
+    PCMachineState *pcms = PC_MACHINE(ms);
+    NumaState *nstat = ms->numa_state;
+    NumaMemRange *mem_range;
+    nstat->mem_ranges_num = 0;
+    next_base = 0;
+
+    /*
+     * the memory map is a bit tricky, it contains at least one hole
+     * from 640k-1M and possibly another one from 3.5G-4G.
+     */
+
+    for (i = 0; i < pcms->numa_nodes; ++i) {
+        mem_base = next_base;
+        mem_len = pcms->node_mem[i];
+        next_base = mem_base + mem_len;
+
+        /* Cut out the 640K hole */
+        if (mem_base <= HOLE_640K_START &&
+            next_base > HOLE_640K_START) {
+            mem_len -= next_base - HOLE_640K_START;
+            if (mem_len > 0) {
+                mem_range = acpi_data_push(nstat->mem_ranges,
+                                           sizeof *mem_range);
+                mem_range->base = mem_base;
+                mem_range->length = mem_len;
+                mem_range->node = i;
+                nstat->mem_ranges_num++;
+            }
+
+            /* Check for the rare case: 640K < RAM < 1M */
+            if (next_base <= HOLE_640K_END) {
+                next_base = HOLE_640K_END;
+                continue;
+            }
+            mem_base = HOLE_640K_END;
+            mem_len = next_base - HOLE_640K_END;
+        }
+
+        /* Cut out the ACPI_PCI hole */
+        if (mem_base <= pcms->below_4g_mem_size &&
+            next_base > pcms->below_4g_mem_size) {
+            mem_len -= next_base - pcms->below_4g_mem_size;
+            if (mem_len > 0) {
+                mem_range = acpi_data_push(nstat->mem_ranges,
+                                           sizeof *mem_range);
+                mem_range->base = mem_base;
+                mem_range->length = mem_len;
+                mem_range->node = i;
+                nstat->mem_ranges_num++;
+            }
+            mem_base = 1ULL << 32;
+            mem_len = next_base - pcms->below_4g_mem_size;
+            next_base = mem_base + mem_len;
+        }
+        if (mem_len > 0) {
+            mem_range = acpi_data_push(nstat->mem_ranges,
+                                       sizeof *mem_range);
+            mem_range->base = mem_base;
+            mem_range->length = mem_len;
+            mem_range->node = i;
+            nstat->mem_ranges_num++;
+        }
+    }
+}
+
 static void
 build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 {
     AcpiSystemResourceAffinityTable *srat;
     AcpiSratMemoryAffinity *numamem;
 
-    int i;
-    int srat_start, numa_start, slots;
-    uint64_t mem_len, mem_base, next_base;
+    int i, srat_start, numa_start, slots;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
     PCMachineState *pcms = PC_MACHINE(machine);
+    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(pcms->acpi_dev);
+    AcpiDeviceIf *adev = ACPI_DEVICE_IF(pcms->acpi_dev);
+    NumaState *nstat = machine->numa_state;
+    NumaMemRange *mem_range;
     ram_addr_t hotplugabble_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
@@ -2327,57 +2398,25 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         }
     }
 
+    if (pcms->numa_nodes && !nstat->mem_ranges_num) {
+        nstat->mem_ranges = g_array_new(false, true /* clear */,
+                                        sizeof *mem_range);
+        adevc->build_mem_ranges(adev, machine);
+    }
 
-    /* the memory map is a bit tricky, it contains at least one hole
-     * from 640k-1M and possibly another one from 3.5G-4G.
-     */
-    next_base = 0;
     numa_start = table_data->len;
 
-    for (i = 1; i < pcms->numa_nodes + 1; ++i) {
-        mem_base = next_base;
-        mem_len = pcms->node_mem[i - 1];
-        next_base = mem_base + mem_len;
-
-        /* Cut out the 640K hole */
-        if (mem_base <= HOLE_640K_START &&
-            next_base > HOLE_640K_START) {
-            mem_len -= next_base - HOLE_640K_START;
-            if (mem_len > 0) {
-                numamem = acpi_data_push(table_data, sizeof *numamem);
-                build_srat_memory(numamem, mem_base, mem_len, i - 1,
-                                  MEM_AFFINITY_ENABLED);
-            }
-
-            /* Check for the rare case: 640K < RAM < 1M */
-            if (next_base <= HOLE_640K_END) {
-                next_base = HOLE_640K_END;
-                continue;
-            }
-            mem_base = HOLE_640K_END;
-            mem_len = next_base - HOLE_640K_END;
-        }
-
-        /* Cut out the ACPI_PCI hole */
-        if (mem_base <= pcms->below_4g_mem_size &&
-            next_base > pcms->below_4g_mem_size) {
-            mem_len -= next_base - pcms->below_4g_mem_size;
-            if (mem_len > 0) {
-                numamem = acpi_data_push(table_data, sizeof *numamem);
-                build_srat_memory(numamem, mem_base, mem_len, i - 1,
-                                  MEM_AFFINITY_ENABLED);
-            }
-            mem_base = 1ULL << 32;
-            mem_len = next_base - pcms->below_4g_mem_size;
-            next_base = mem_base + mem_len;
-        }
-
-        if (mem_len > 0) {
+    for (i = 0; i < nstat->mem_ranges_num; i++) {
+        mem_range = &g_array_index(nstat->mem_ranges, NumaMemRange, i);
+        if (mem_range->length > 0) {
             numamem = acpi_data_push(table_data, sizeof *numamem);
-            build_srat_memory(numamem, mem_base, mem_len, i - 1,
+            build_srat_memory(numamem, mem_range->base,
+                              mem_range->length,
+                              mem_range->node,
                               MEM_AFFINITY_ENABLED);
         }
     }
+
     slots = (table_data->len - numa_start) / sizeof *numamem;
     for (; slots < pcms->numa_nodes + 2; slots++) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 35d17246e9..20d919c63d 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -801,6 +801,7 @@ static void ich9_lpc_class_init(ObjectClass *klass, void *data)
     adevc->ospm_status = ich9_pm_ospm_status;
     adevc->send_event = ich9_send_gpe;
     adevc->madt_cpu = pc_madt_cpu_entry;
+    adevc->build_mem_ranges = pc_build_mem_ranges;
 }
 
 static const TypeInfo ich9_lpc_info = {
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 43ff119179..5956b5ea33 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -39,6 +39,8 @@ void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event);
  *           for CPU indexed by @uid in @apic_ids array,
  *           returned structure types are:
  *           0 - Local APIC, 9 - Local x2APIC, 0xB - GICC
+ * build_mem_ranges: build memory ranges of ACPI SRAT (except misc
+ * and hotplug SRAT ranges) and HMAT
  *
  * Interface is designed for providing unified interface
  * to generic ACPI functionality that could be used without
@@ -54,5 +56,7 @@ typedef struct AcpiDeviceIfClass {
     void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
     void (*madt_cpu)(AcpiDeviceIf *adev, int uid,
                      const CPUArchIdList *apic_ids, GArray *entry);
+    void (*build_mem_ranges)(AcpiDeviceIf *adev, MachineState *ms);
+
 } AcpiDeviceIfClass;
 #endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 5d5636241e..21b9ac3d11 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -281,6 +281,7 @@ void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
 /* acpi-build.c */
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
+void pc_build_mem_ranges(AcpiDeviceIf *adev, MachineState *ms);
 
 /* e820 types */
 #define E820_RAM        1
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 437eb21fef..e3c85b77bc 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -20,6 +20,12 @@ struct NumaNodeMem {
     uint64_t node_plugged_mem;
 };
 
+typedef struct NumaMemRange {
+    uint64_t base;
+    uint64_t length;
+    uint32_t node;
+} NumaMemRange;
+
 struct NumaState {
     /* Number of NUMA nodes */
     int num_nodes;
@@ -29,6 +35,12 @@ struct NumaState {
 
     /* NUMA nodes information */
     NodeInfo nodes[MAX_NODES];
+
+    /* Number of NUMA memory ranges */
+    uint32_t mem_ranges_num;
+
+    /* NUMA memory ranges */
+    GArray *mem_ranges;
 };
 typedef struct NumaState NumaState;
 
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 9c7393b08c..4f0cdc1a45 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -33,6 +33,7 @@ stub-obj-y += qmp_memory_device.o
 stub-obj-y += target-monitor-defs.o
 stub-obj-y += target-get-monitor-def.o
 stub-obj-y += pc_madt_cpu_entry.o
+stub-obj-y += pc_build_mem_ranges.o
 stub-obj-y += vmgenid.o
 stub-obj-y += xen-common.o
 stub-obj-y += xen-hvm.o
diff --git a/stubs/pc_build_mem_ranges.c b/stubs/pc_build_mem_ranges.c
new file mode 100644
index 0000000000..997cdfe00b
--- /dev/null
+++ b/stubs/pc_build_mem_ranges.c
@@ -0,0 +1,14 @@
+/*
+ * Stub for pc_build_mem_ranges().
+ * piix4 is used not only pc, but also mips and etc. In order to add
+ * build_mem_ranges callback to AcpiDeviceIfClass and use pc_build_mem_ranges
+ * in hw/acpi/piix4.c, pc_build_mem_ranges() stub is added to make other arch
+ * can compile successfully.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i386/pc.h"
+
+void pc_build_mem_ranges(AcpiDeviceIf *adev, MachineState *ms)
+{
+}
-- 
2.20.1


