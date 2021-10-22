Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05244437596
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:34:33 +0200 (CEST)
Received: from localhost ([::1]:40790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrse-0003po-2K
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mdrqI-00015E-8F
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:32:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:5672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mdrqF-0000Bk-2X
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:32:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="290113942"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="290113942"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 03:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="595506370"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga004.jf.intel.com with ESMTP; 22 Oct 2021 03:31:57 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] numa: Enable numa for SGX EPC sections
Date: Fri, 22 Oct 2021 15:27:50 -0400
Message-Id: <20211022192754.58196-2-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022192754.58196-1-yang.zhong@intel.com>
References: <20211022192754.58196-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, jarkko@kernel.org,
 eblake@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The basic SGX did not enable numa for SGX EPC sections, which
result in all EPC sections located in numa node 0. This patch
enable SGX numa function in the guest and the EPC section can
work with RAM as one numa node.

The Guest kernel related log:
[    0.009981] ACPI: SRAT: Node 0 PXM 0 [mem 0x180000000-0x183ffffff]
[    0.009982] ACPI: SRAT: Node 1 PXM 1 [mem 0x184000000-0x185bfffff]
The SRAT table can normally show SGX EPC sections menory info in different
numa nodes.

The SGX EPC numa related command:
 ......
 -m 4G,maxmem=20G \
 -smp sockets=2,cores=2 \
 -cpu host,+sgx-provisionkey \
 -object memory-backend-ram,size=2G,host-nodes=0,policy=bind,id=node0 \
 -object memory-backend-epc,id=mem0,size=64M,prealloc=on,host-nodes=0,policy=bind \
 -numa node,nodeid=0,cpus=0-1,memdev=node0 \
 -object memory-backend-ram,size=2G,host-nodes=1,policy=bind,id=node1 \
 -object memory-backend-epc,id=mem1,size=28M,prealloc=on,host-nodes=1,policy=bind \
 -numa node,nodeid=1,cpus=2-3,memdev=node1 \
 -M sgx-epc.0.memdev=mem0,sgx-epc.0.node=0,sgx-epc.1.memdev=mem1,sgx-epc.1.node=1 \
 ......

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 qapi/machine.json         | 10 ++++++++-
 include/hw/i386/sgx-epc.h |  3 +++
 hw/i386/acpi-build.c      |  4 ++++
 hw/i386/sgx-epc.c         |  3 +++
 hw/i386/sgx.c             | 44 +++++++++++++++++++++++++++++++++++++++
 monitor/hmp-cmds.c        |  1 +
 qemu-options.hx           |  4 ++--
 7 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 5db54df298..38a1e3438f 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1207,12 +1207,15 @@
 #
 # @memdev: memory backend linked with device
 #
+# @node: the numa node
+#
 # Since: 6.2
 ##
 { 'struct': 'SgxEPCDeviceInfo',
   'data': { '*id': 'str',
             'memaddr': 'size',
             'size': 'size',
+            'node': 'int',
             'memdev': 'str'
           }
 }
@@ -1285,10 +1288,15 @@
 #
 # @memdev: memory backend linked with device
 #
+# @node: the numa node
+#
 # Since: 6.2
 ##
 { 'struct': 'SgxEPC',
-  'data': { 'memdev': 'str' } }
+  'data': { 'memdev': 'str',
+            'node': 'int'
+          }
+}
 
 ##
 # @SgxEPCProperties:
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index a6a65be854..581fac389a 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -25,6 +25,7 @@
 #define SGX_EPC_ADDR_PROP "addr"
 #define SGX_EPC_SIZE_PROP "size"
 #define SGX_EPC_MEMDEV_PROP "memdev"
+#define SGX_EPC_NUMA_NODE_PROP "node"
 
 /**
  * SGXEPCDevice:
@@ -38,6 +39,7 @@ typedef struct SGXEPCDevice {
 
     /* public */
     uint64_t addr;
+    uint32_t node;
     HostMemoryBackendEpc *hostmem;
 } SGXEPCDevice;
 
@@ -56,6 +58,7 @@ typedef struct SGXEPCState {
 } SGXEPCState;
 
 bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
+void sgx_epc_build_srat(GArray *table_data);
 
 static inline uint64_t sgx_epc_above_4g_end(SGXEPCState *sgx_epc)
 {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 81418b7911..563a38992f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2062,6 +2062,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         nvdimm_build_srat(table_data);
     }
 
+    if (pcms->sgx_epc.size != 0) {
+        sgx_epc_build_srat(table_data);
+    }
+
     /*
      * TODO: this part is not in ACPI spec and current linux kernel boots fine
      * without these entries. But I recall there were issues the last time I
diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 55e2217eae..e5cd2789be 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -21,6 +21,7 @@
 
 static Property sgx_epc_properties[] = {
     DEFINE_PROP_UINT64(SGX_EPC_ADDR_PROP, SGXEPCDevice, addr, 0),
+    DEFINE_PROP_UINT32(SGX_EPC_NUMA_NODE_PROP, SGXEPCDevice, node, 0),
     DEFINE_PROP_LINK(SGX_EPC_MEMDEV_PROP, SGXEPCDevice, hostmem,
                      TYPE_MEMORY_BACKEND_EPC, HostMemoryBackendEpc *),
     DEFINE_PROP_END_OF_LIST(),
@@ -139,6 +140,8 @@ static void sgx_epc_md_fill_device_info(const MemoryDeviceState *md,
     se->memaddr = epc->addr;
     se->size = object_property_get_uint(OBJECT(epc), SGX_EPC_SIZE_PROP,
                                         NULL);
+    se->node = object_property_get_uint(OBJECT(epc), SGX_EPC_NUMA_NODE_PROP,
+                                        NULL);
     se->memdev = object_get_canonical_path(OBJECT(epc->hostmem));
 
     info->u.sgx_epc.data = se;
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 11607568b6..9a77519609 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -21,6 +21,7 @@
 #include "qapi/qapi-commands-misc-target.h"
 #include "exec/address-spaces.h"
 #include "sysemu/hw_accel.h"
+#include "hw/acpi/aml-build.h"
 
 #define SGX_MAX_EPC_SECTIONS            8
 #define SGX_CPUID_EPC_INVALID           0x0
@@ -29,6 +30,46 @@
 #define SGX_CPUID_EPC_SECTION           0x1
 #define SGX_CPUID_EPC_MASK              0xF
 
+static int sgx_epc_device_list(Object *obj, void *opaque)
+{
+    GSList **list = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_SGX_EPC)) {
+        *list = g_slist_append(*list, DEVICE(obj));
+    }
+
+    object_child_foreach(obj, sgx_epc_device_list, opaque);
+    return 0;
+}
+
+static GSList *sgx_epc_get_device_list(void)
+{
+    GSList *list = NULL;
+
+    object_child_foreach(qdev_get_machine(), sgx_epc_device_list, &list);
+    return list;
+}
+
+void sgx_epc_build_srat(GArray *table_data)
+{
+    GSList *device_list = sgx_epc_get_device_list();
+
+    for (; device_list; device_list = device_list->next) {
+        DeviceState *dev = device_list->data;
+        Object *obj = OBJECT(dev);
+        uint64_t addr, size;
+        int node;
+
+        node = object_property_get_uint(obj, SGX_EPC_NUMA_NODE_PROP,
+                                        &error_abort);
+        addr = object_property_get_uint(obj, SGX_EPC_ADDR_PROP, &error_abort);
+        size = object_property_get_uint(obj, SGX_EPC_SIZE_PROP, &error_abort);
+
+        build_srat_memory(table_data, addr, size, node, MEM_AFFINITY_ENABLED);
+    }
+    g_slist_free(device_list);
+}
+
 static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
 {
     return (low & MAKE_64BIT_MASK(12, 20)) +
@@ -179,6 +220,9 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
         /* set the memdev link with memory backend */
         object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
                               &error_fatal);
+        /* set the numa node property for sgx epc object */
+        object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
+                             &error_fatal);
         object_property_set_bool(obj, "realized", true, &error_fatal);
         object_unref(obj);
     }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bcaa41350e..8af26e3e20 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1878,6 +1878,7 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
                                se->id ? se->id : "");
                 monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", se->memaddr);
                 monitor_printf(mon, "  size: %" PRIu64 "\n", se->size);
+                monitor_printf(mon, "  node: %" PRId64 "\n", se->node);
                 monitor_printf(mon, "  memdev: %s\n", se->memdev);
                 break;
             default:
diff --git a/qemu-options.hx b/qemu-options.hx
index 5f375bbfa6..aaa5a1926d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -127,11 +127,11 @@ SRST
 ERST
 
 DEF("M", HAS_ARG, QEMU_OPTION_M,
-    "                sgx-epc.0.memdev=memid\n",
+    "                sgx-epc.0.memdev=memid,sgx-epc.0.node=numaid\n",
     QEMU_ARCH_ALL)
 
 SRST
-``sgx-epc.0.memdev=@var{memid}``
+``sgx-epc.0.memdev=@var{memid},sgx-epc.0.node=@var{numaid}``
     Define an SGX EPC section.
 ERST
 

