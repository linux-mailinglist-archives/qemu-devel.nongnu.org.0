Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231253CCC24
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 04:14:05 +0200 (CEST)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5InD-0005UJ-W8
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 22:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1m5Ilb-00043t-Ku
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 22:12:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:9491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1m5IlY-00047z-TG
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 22:12:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="198181449"
X-IronPort-AV: E=Sophos;i="5.84,250,1620716400"; d="scan'208";a="198181449"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2021 19:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,250,1620716400"; d="scan'208";a="499560593"
Received: from icx-hcc-jingqi.sh.intel.com ([10.239.48.6])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jul 2021 19:12:14 -0700
From: Jingqi Liu <jingqi.liu@intel.com>
To: imammedo@redhat.com, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, ehabkost@redhat.com
Subject: [PATCH v2 1/1] nvdimm: add 'target-node' option
Date: Mon, 19 Jul 2021 10:01:53 +0800
Message-Id: <20210719020153.30574-2-jingqi.liu@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20210719020153.30574-1-jingqi.liu@intel.com>
References: <20210719020153.30574-1-jingqi.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=jingqi.liu@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Jingqi Liu <jingqi.liu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux kernel version 5.1 brings in support for the volatile-use of
persistent memory as a hotplugged memory region (KMEM DAX).
When this feature is enabled, persistent memory can be seen as a
separate memory-only NUMA node(s). This newly-added memory can be
selected by its unique NUMA node.

Add 'target-node' option for 'nvdimm' device to indicate this NUMA
node. It can be extended to a new node after all existing NUMA nodes.

The 'node' option of 'pc-dimm' device is to add the DIMM to an
existing NUMA node. The 'node' should be in the available NUMA nodes.
For KMEM DAX mode, persistent memory can be in a new separate
memory-only NUMA node. The new node is created dynamically.
So users use 'target-node' to control whether persistent memory
is added to an existing NUMA node or a new NUMA node.

An example of configuration is as follows.

Using the following QEMU command:
 -object memory-backend-file,id=nvmem1,share=on,mem-path=/dev/dax0.0,size=3G,align=2M
 -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K,targe-node=2

To list DAX devices:
 # daxctl list -u
 {
   "chardev":"dax0.0",
   "size":"3.00 GiB (3.22 GB)",
   "target_node":2,
   "mode":"devdax"
 }

To create a namespace in Device-DAX mode as a standard memory:
 $ ndctl create-namespace --mode=devdax --map=mem
To reconfigure DAX device from devdax mode to a system-ram mode:
 $ daxctl reconfigure-device dax0.0 --mode=system-ram

There are two existing NUMA nodes in Guest. After these operations,
persistent memory is configured as a separate Node 2 and
can be used as a volatile memory. This NUMA node is dynamically
created according to 'target-node'.

Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
---
 docs/nvdimm.txt         | 93 +++++++++++++++++++++++++++++++++++++++++
 hw/acpi/nvdimm.c        | 18 ++++----
 hw/i386/acpi-build.c    | 12 +++++-
 hw/i386/pc.c            |  4 ++
 hw/mem/nvdimm.c         | 43 ++++++++++++++++++-
 include/hw/mem/nvdimm.h | 17 +++++++-
 util/nvdimm-utils.c     | 22 ++++++++++
 7 files changed, 198 insertions(+), 11 deletions(-)

diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index 0aae682be3..083d954bb4 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -107,6 +107,99 @@ Note:
    may result guest data corruption (e.g. breakage of guest file
    system).
 
+Target node
+-----------
+
+Linux kernel version 5.1 brings in support for the volatile-use of
+persistent memory as a hotplugged memory region (KMEM DAX).
+When this feature is enabled, persistent memory can be seen as a
+separate memory-only NUMA node(s). This newly-added memory can be
+selected by its unique NUMA node.
+Add 'target-node' option for nvdimm device to indicate this NUMA node.
+It can be extended after all existing NUMA nodes.
+
+An example of configuration is presented below.
+
+Using the following QEMU command:
+ -object memory-backend-file,id=nvmem1,share=on,mem-path=/dev/dax0.0,size=3G,align=2M
+ -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K,targe-node=1
+
+The below operations are in Guest.
+
+To list available NUMA nodes using numactl:
+ # numactl -H
+ available: 1 nodes (0)
+ node 0 cpus: 0 1 2 3 4 5 6 7
+ node 0 size: 5933 MB
+ node 0 free: 5457 MB
+ node distances:
+ node   0
+   0:  10
+
+To create a namespace in Device-DAX mode as a standard memory from
+all the available capacity of NVDIMM:
+
+ # ndctl create-namespace --mode=devdax --map=mem
+ {
+   "dev":"namespace0.0",
+   "mode":"devdax",
+   "map":"mem",
+   "size":"3.00 GiB (3.22 GB)",
+   "uuid":"4e4d8293-dd3b-4e43-8ad9-7f3d2a8d1680",
+   "daxregion":{
+     "id":0,
+     "size":"3.00 GiB (3.22 GB)",
+     "align":2097152,
+     "devices":[
+       {
+         "chardev":"dax0.0",
+         "size":"3.00 GiB (3.22 GB)",
+         "target_node":1,
+         "mode":"devdax"
+       }
+     ]
+   },
+   "align":2097152
+ }
+
+To list DAX devices:
+ # daxctl list -u
+ {
+   "chardev":"dax0.0",
+   "size":"3.00 GiB (3.22 GB)",
+   "target_node":1,
+   "mode":"devdax"
+ }
+
+To reconfigure DAX device from devdax mode to a system-ram mode:
+ # daxctl reconfigure-device dax0.0 --mode=system-ram
+ [
+   {
+     "chardev":"dax0.0",
+     "size":3217031168,
+     "target_node":1,
+     "mode":"system-ram",
+     "movable":false
+   }
+ ]
+
+After this operation, persistent memory is configured as a separate NUMA node
+and can be used as a volatile memory.
+The new NUMA node is Node 1:
+ # numactl -H
+ available: 2 nodes (0-1)
+ node 0 cpus: 0 1 2 3 4 5 6 7
+ node 0 size: 5933 MB
+ node 0 free: 5339 MB
+ node 1 cpus:
+ node 1 size: 2816 MB
+ node 1 free: 2815 MB
+ node distances:
+ node   0   1
+   0:  10  20
+   1:  20  10
+
+
 Hotplug
 -------
 
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index e3d5fe1939..ebce0d6e68 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -228,8 +228,8 @@ nvdimm_build_structure_spa(GArray *structures, DeviceState *dev)
                                              NULL);
     uint64_t size = object_property_get_uint(OBJECT(dev), PC_DIMM_SIZE_PROP,
                                              NULL);
-    uint32_t node = object_property_get_uint(OBJECT(dev), PC_DIMM_NODE_PROP,
-                                             NULL);
+    int target_node = object_property_get_uint(OBJECT(dev), NVDIMM_TARGET_NODE_PROP,
+                                               NULL);
     int slot = object_property_get_int(OBJECT(dev), PC_DIMM_SLOT_PROP,
                                        NULL);
 
@@ -251,7 +251,7 @@ nvdimm_build_structure_spa(GArray *structures, DeviceState *dev)
                                        valid*/);
 
     /* NUMA node. */
-    nfit_spa->proximity_domain = cpu_to_le32(node);
+    nfit_spa->proximity_domain = cpu_to_le32(target_node);
     /* the region reported as PMEM. */
     memcpy(nfit_spa->type_guid, nvdimm_nfit_spa_uuid,
            sizeof(nvdimm_nfit_spa_uuid));
@@ -1337,8 +1337,9 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
     free_aml_allocator();
 }
 
-void nvdimm_build_srat(GArray *table_data)
+int nvdimm_build_srat(GArray *table_data)
 {
+    int max_target_node = nvdimm_check_target_nodes();
     GSList *device_list = nvdimm_get_device_list();
 
     for (; device_list; device_list = device_list->next) {
@@ -1346,17 +1347,20 @@ void nvdimm_build_srat(GArray *table_data)
         DeviceState *dev = device_list->data;
         Object *obj = OBJECT(dev);
         uint64_t addr, size;
-        int node;
+        int target_node;
 
-        node = object_property_get_int(obj, PC_DIMM_NODE_PROP, &error_abort);
+        target_node = object_property_get_uint(obj, NVDIMM_TARGET_NODE_PROP,
+                                               &error_abort);
         addr = object_property_get_uint(obj, PC_DIMM_ADDR_PROP, &error_abort);
         size = object_property_get_uint(obj, PC_DIMM_SIZE_PROP, &error_abort);
 
         numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, addr, size, node,
+        build_srat_memory(numamem, addr, size, target_node,
                           MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
     }
     g_slist_free(device_list);
+
+   return max_target_node;
 }
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 796ffc6f5c..19bf91063f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1879,6 +1879,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     AcpiSratMemoryAffinity *numamem;
 
     int i;
+    int max_node = 0;
     int srat_start, numa_start, slots;
     uint64_t mem_len, mem_base, next_base;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
@@ -1974,7 +1975,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     }
 
     if (machine->nvdimms_state->is_enabled) {
-        nvdimm_build_srat(table_data);
+        max_node = nvdimm_build_srat(table_data);
     }
 
     slots = (table_data->len - numa_start) / sizeof *numamem;
@@ -1992,9 +1993,16 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * providing _PXM method if necessary.
      */
     if (hotplugabble_address_space_size) {
+        if (max_node < 0) {
+            max_node = pcms->numa_nodes - 1;
+        } else {
+            max_node = max_node > pcms->numa_nodes - 1 ?
+                       max_node : pcms->numa_nodes - 1;
+        }
+
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, machine->device_memory->base,
-                          hotplugabble_address_space_size, pcms->numa_nodes - 1,
+                          hotplugabble_address_space_size, max_node,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c6d8d0d84d..debf26b31e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1251,6 +1251,10 @@ static void pc_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev),
                      pcmc->enforce_aligned_dimm ? NULL : &legacy_align, errp);
+
+    if (is_nvdimm) {
+        nvdimm_pre_plug(NVDIMM(dev), MACHINE(hotplug_dev), errp);
+    }
 }
 
 static void pc_memory_plug(HotplugHandler *hotplug_dev,
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 7397b67156..c864e6717b 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -27,11 +27,52 @@
 #include "qemu/pmem.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
+#include "hw/boards.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/qdev-properties.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/hostmem.h"
 
+unsigned long nvdimm_target_nodes[BITS_TO_LONGS(MAX_NODES)];
+int nvdimm_max_target_node;
+
+void nvdimm_pre_plug(NVDIMMDevice *nvdimm, MachineState *machine,
+                     Error **errp)
+{
+    int node;
+
+    node = object_property_get_uint(OBJECT(nvdimm), PC_DIMM_NODE_PROP,
+                                    &error_abort);
+    if (node && (nvdimm->target_node != -1)) {
+        error_setg(errp, "Both property '" PC_DIMM_NODE_PROP
+                   "' and '" NVDIMM_TARGET_NODE_PROP
+                   "' cannot be set!");
+        return;
+    }
+
+    if (nvdimm->target_node != -1) {
+        if (nvdimm->target_node >= MAX_NODES) {
+            error_setg(errp, "'NVDIMM property " NVDIMM_TARGET_NODE_PROP
+                       " has value %" PRIu32
+                       "' which exceeds the max number of numa nodes: %d",
+                       nvdimm->target_node, MAX_NODES);
+            return;
+        }
+        if (nvdimm->target_node >= machine->numa_state->num_nodes) {
+            set_bit(nvdimm->target_node, nvdimm_target_nodes);
+            if (nvdimm->target_node > nvdimm_max_target_node) {
+                nvdimm_max_target_node = nvdimm->target_node;
+            }
+        }
+    } else {
+        /*
+         * If the 'target-node' option is not set,
+         * the value of 'node' is used as target node.
+         */
+        nvdimm->target_node = node;
+    }
+}
+
 static void nvdimm_get_label_size(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
@@ -96,7 +137,6 @@ static void nvdimm_set_uuid(Object *obj, Visitor *v, const char *name,
     g_free(value);
 }
 
-
 static void nvdimm_init(Object *obj)
 {
     object_property_add(obj, NVDIMM_LABEL_SIZE_PROP, "int",
@@ -229,6 +269,7 @@ static void nvdimm_write_label_data(NVDIMMDevice *nvdimm, const void *buf,
 
 static Property nvdimm_properties[] = {
     DEFINE_PROP_BOOL(NVDIMM_UNARMED_PROP, NVDIMMDevice, unarmed, false),
+    DEFINE_PROP_UINT32(NVDIMM_TARGET_NODE_PROP, NVDIMMDevice, target_node, -1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index bcf62f825c..4f490d0c2a 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -51,6 +51,7 @@ OBJECT_DECLARE_TYPE(NVDIMMDevice, NVDIMMClass, NVDIMM)
 #define NVDIMM_LABEL_SIZE_PROP "label-size"
 #define NVDIMM_UUID_PROP       "uuid"
 #define NVDIMM_UNARMED_PROP    "unarmed"
+#define NVDIMM_TARGET_NODE_PROP "target-node"
 
 struct NVDIMMDevice {
     /* private */
@@ -89,6 +90,14 @@ struct NVDIMMDevice {
      * The PPC64 - spapr requires each nvdimm device have a uuid.
      */
     QemuUUID uuid;
+
+    /*
+     * Support for the volatile-use of persistent memory as normal RAM.
+     * This newly-added memory can be selected by its unique NUMA node.
+     * This node can be extended to a new node after all existing NUMA
+     * nodes.
+     */
+    uint32_t target_node;
 };
 
 struct NVDIMMClass {
@@ -148,14 +157,20 @@ struct NVDIMMState {
 };
 typedef struct NVDIMMState NVDIMMState;
 
+extern unsigned long nvdimm_target_nodes[];
+extern int nvdimm_max_target_node;
+
 void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
                             struct AcpiGenericAddress dsm_io,
                             FWCfgState *fw_cfg, Object *owner);
-void nvdimm_build_srat(GArray *table_data);
+int nvdimm_build_srat(GArray *table_data);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
                        uint32_t ram_slots, const char *oem_id,
                        const char *oem_table_id);
 void nvdimm_plug(NVDIMMState *state);
 void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev);
+int nvdimm_check_target_nodes(void);
+void nvdimm_pre_plug(NVDIMMDevice *dimm, MachineState *machine,
+                     Error **errp);
 #endif
diff --git a/util/nvdimm-utils.c b/util/nvdimm-utils.c
index aa3d199f2d..767f1e4787 100644
--- a/util/nvdimm-utils.c
+++ b/util/nvdimm-utils.c
@@ -1,5 +1,7 @@
 #include "qemu/osdep.h"
 #include "qemu/nvdimm-utils.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
 #include "hw/mem/nvdimm.h"
 
 static int nvdimm_device_list(Object *obj, void *opaque)
@@ -28,3 +30,23 @@ GSList *nvdimm_get_device_list(void)
     object_child_foreach(qdev_get_machine(), nvdimm_device_list, &list);
     return list;
 }
+
+int nvdimm_check_target_nodes(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    int nb_numa_nodes = ms->numa_state->num_nodes;
+    int node;
+
+    if (!nvdimm_max_target_node) {
+        return -1;
+    }
+
+    for (node = nb_numa_nodes; node <= nvdimm_max_target_node; node++) {
+        if (!test_bit(node, nvdimm_target_nodes)) {
+            error_report("nvdimm target-node: Node ID missing: %d", node);
+            exit(1);
+        }
+    }
+
+    return nvdimm_max_target_node;
+}
-- 
2.21.3


