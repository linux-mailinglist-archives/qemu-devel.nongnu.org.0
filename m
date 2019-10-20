Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9CDDE34
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Oct 2019 13:15:37 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iM9BP-0004QT-Td
	for lists+qemu-devel@lfdr.de; Sun, 20 Oct 2019 07:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iM97e-0002eC-KY
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iM97c-0002yJ-HX
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:42 -0400
Received: from mga12.intel.com ([192.55.52.136]:63374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iM97c-0002wA-4W
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Oct 2019 04:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,319,1566889200"; d="scan'208";a="371917562"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by orsmga005.jf.intel.com with ESMTP; 20 Oct 2019 04:11:37 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Subject: [PATCH v13 05/12] numa: Extend CLI to provide initiator information
 for numa nodes
Date: Sun, 20 Oct 2019 19:11:18 +0800
Message-Id: <20191020111125.27659-6-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191020111125.27659-1-tao3.xu@intel.com>
References: <20191020111125.27659-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
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
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In ACPI 6.3 chapter 5.2.27 Heterogeneous Memory Attribute Table (HMAT),
The initiator represents processor which access to memory. And in 5.2.27.3
Memory Proximity Domain Attributes Structure, the attached initiator is
defined as where the memory controller responsible for a memory proximity
domain. With attached initiator information, the topology of heterogeneous
memory can be described.

Extend CLI of "-numa node" option to indicate the initiator numa node-id.
In the linux kernel, the codes in drivers/acpi/hmat/hmat.c parse and report
the platform's HMAT tables.

Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Suggested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

Changes in v13:
    - Modify some text description
    - Drop "initiator_valid" field in struct NodeInfo (Igor)

Changes in v12:
    - Fix the bug that a memory-only node without initiator setting
      doesn't report error. (reported by Danmei Wei)
---
 hw/core/machine.c     | 70 +++++++++++++++++++++++++++++++++++++++++++
 hw/core/numa.c        | 23 ++++++++++++++
 include/sysemu/numa.h |  5 ++++
 qapi/machine.json     | 10 ++++++-
 qemu-options.hx       | 35 ++++++++++++++++++----
 5 files changed, 137 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1689ad3bf8..32a451bd84 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -518,6 +518,20 @@ static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
     ms->nvdimms_state->is_enabled = value;
 }
 
+static bool machine_get_hmat(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->numa_state->hmat_enabled;
+}
+
+static void machine_set_hmat(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->numa_state->hmat_enabled = value;
+}
+
 static char *machine_get_nvdimm_persistence(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -645,6 +659,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    NodeInfo *numa_info = machine->numa_state->nodes;
     bool match = false;
     int i;
 
@@ -714,6 +729,17 @@ void machine_set_cpu_numa_node(MachineState *machine,
         match = true;
         slot->props.node_id = props->node_id;
         slot->props.has_node_id = props->has_node_id;
+
+        if (machine->numa_state->hmat_enabled) {
+            if ((numa_info[props->node_id].initiator < MAX_NODES) &&
+                (props->node_id != numa_info[props->node_id].initiator)) {
+                error_setg(errp, "The initiator of CPU NUMA node %" PRId64
+                        " should be itself.", props->node_id);
+                return;
+            }
+            numa_info[props->node_id].has_cpu = true;
+            numa_info[props->node_id].initiator = props->node_id;
+        }
     }
 
     if (!match) {
@@ -960,6 +986,13 @@ static void machine_initfn(Object *obj)
 
     if (mc->numa_mem_supported) {
         ms->numa_state = g_new0(NumaState, 1);
+        object_property_add_bool(obj, "hmat",
+                                 machine_get_hmat, machine_set_hmat,
+                                 &error_abort);
+        object_property_set_description(obj, "hmat",
+                                        "Set on/off to enable/disable "
+                                        "ACPI Heterogeneous Memory Attribute "
+                                        "Table (HMAT)", NULL);
     }
 
     /* Register notifier when init is done for sysbus sanity checks */
@@ -1048,6 +1081,38 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
     return g_string_free(s, false);
 }
 
+static void numa_validate_initiator(NumaState *numa_state)
+{
+    int i;
+    NodeInfo *numa_info = numa_state->nodes;
+
+    for (i = 0; i < numa_state->num_nodes; i++) {
+        if (numa_info[i].initiator == MAX_NODES) {
+            error_report("The initiator of NUMA node %d is missing, use "
+                         "'-numa node,initiator' option to declare it.", i);
+            goto err;
+        }
+
+        if (!numa_info[numa_info[i].initiator].present) {
+            error_report("NUMA node %" PRIu16 " is missing, use "
+                         "'-numa node' option to declare it first.",
+                         numa_info[i].initiator);
+            goto err;
+        }
+
+        if (!numa_info[numa_info[i].initiator].has_cpu) {
+            error_report("The initiator of NUMA node %d is invalid.", i);
+            goto err;
+        }
+    }
+
+    return;
+
+err:
+    error_printf("\n");
+    exit(1);
+}
+
 static void machine_numa_finish_cpu_init(MachineState *machine)
 {
     int i;
@@ -1088,6 +1153,11 @@ static void machine_numa_finish_cpu_init(MachineState *machine)
             machine_set_cpu_numa_node(machine, &props, &error_fatal);
         }
     }
+
+    if (machine->numa_state->hmat_enabled) {
+        numa_validate_initiator(machine->numa_state);
+    }
+
     if (s->len && !qtest_enabled()) {
         warn_report("CPU(s) not present in any NUMA nodes: %s",
                     s->str);
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 038c96d4ab..eba66ab768 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -133,6 +133,29 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         numa_info[nodenr].node_mem = object_property_get_uint(o, "size", NULL);
         numa_info[nodenr].node_memdev = MEMORY_BACKEND(o);
     }
+
+    /*
+     * If not set the initiator, set it to MAX_NODES. And if
+     * HMAT is enabled and this node has no cpus, QEMU will raise error.
+     */
+    numa_info[nodenr].initiator = MAX_NODES;
+    if (node->has_initiator) {
+        if (!ms->numa_state->hmat_enabled) {
+            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
+                       "(HMAT) is disabled, enable it with -machine hmat=on "
+                       "before using any of hmat specific options.");
+            return;
+        }
+
+        if (node->initiator >= MAX_NODES) {
+            error_report("The initiator id %" PRIu16 " expects an integer "
+                         "between 0 and %d", node->initiator,
+                         MAX_NODES - 1);
+            return;
+        }
+
+        numa_info[nodenr].initiator = node->initiator;
+    }
     numa_info[nodenr].present = true;
     max_numa_nodeid = MAX(max_numa_nodeid, nodenr + 1);
     ms->numa_state->num_nodes++;
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index ae9c41d02b..788cbec7a2 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -18,6 +18,8 @@ struct NodeInfo {
     uint64_t node_mem;
     struct HostMemoryBackend *node_memdev;
     bool present;
+    bool has_cpu;
+    uint16_t initiator;
     uint8_t distance[MAX_NODES];
 };
 
@@ -33,6 +35,9 @@ struct NumaState {
     /* Allow setting NUMA distance for different NUMA nodes */
     bool have_numa_distance;
 
+    /* Detect if HMAT support is enabled. */
+    bool hmat_enabled;
+
     /* NUMA nodes information */
     NodeInfo nodes[MAX_NODES];
 };
diff --git a/qapi/machine.json b/qapi/machine.json
index ca26779f1a..f1b07b3486 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -463,6 +463,13 @@
 # @memdev: memory backend object.  If specified for one node,
 #          it must be specified for all nodes.
 #
+# @initiator: defined in ACPI 6.3 Chapter 5.2.27.3 Table 5-145,
+#             points to the nodeid which has the memory controller
+#             responsible for this NUMA node. This field provides
+#             additional information as to the initiator node that
+#             is closest (as in directly attached) to this node, and
+#             therefore has the best performance (since 4.2)
+#
 # Since: 2.1
 ##
 { 'struct': 'NumaNodeOptions',
@@ -470,7 +477,8 @@
    '*nodeid': 'uint16',
    '*cpus':   ['uint16'],
    '*mem':    'size',
-   '*memdev': 'str' }}
+   '*memdev': 'str',
+   '*initiator': 'uint16' }}
 
 ##
 # @NumaDistOptions:
diff --git a/qemu-options.hx b/qemu-options.hx
index 996b6fba74..1f96399521 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -43,7 +43,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
     "                nvdimm=on|off controls NVDIMM support (default=off)\n"
     "                enforce-config-section=on|off enforce configuration section migration (default=off)\n"
-    "                memory-encryption=@var{} memory encryption object to use (default=none)\n",
+    "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
+    "                hmat=on|off controls ACPI HMAT support (default=off)\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -machine [type=]@var{name}[,prop=@var{value}[,...]]
@@ -103,6 +104,9 @@ NOTE: this parameter is deprecated. Please use @option{-global}
 @option{migration.send-configuration}=@var{on|off} instead.
 @item memory-encryption=@var{}
 Memory encryption object to use. The default is none.
+@item hmat=on|off
+Enables or disables ACPI Heterogeneous Memory Attribute Table (HMAT) support.
+The default is off.
 @end table
 ETEXI
 
@@ -161,14 +165,14 @@ If any on the three values is given, the total number of CPUs @var{n} can be omi
 ETEXI
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-    "-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node]\n"
-    "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node]\n"
+    "-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
+    "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
     "-numa dist,src=source,dst=destination,val=distance\n"
     "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n",
     QEMU_ARCH_ALL)
 STEXI
-@item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}]
-@itemx -numa node[,memdev=@var{id}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}]
+@item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
+@itemx -numa node[,memdev=@var{id}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
 @itemx -numa dist,src=@var{source},dst=@var{destination},val=@var{distance}
 @itemx -numa cpu,node-id=@var{node}[,socket-id=@var{x}][,core-id=@var{y}][,thread-id=@var{z}]
 @findex -numa
@@ -215,6 +219,27 @@ split equally between them.
 @samp{mem} and @samp{memdev} are mutually exclusive. Furthermore,
 if one node uses @samp{memdev}, all of them have to use it.
 
+@samp{initiator} is an additional option that points to an @var{initiator}
+NUMA node that has best performance (the lowest latency or largest bandwidth)
+to this NUMA @var{node}. Note that this option can be set only when
+the machine property 'hmat' is set to 'on'.
+
+Following example creates a machine with 2 NUMA nodes, node 0 has CPU.
+node 1 has only memory, and its initiator is node 0. Note that because
+node 0 has CPU, by default the initiator of node 0 is itself and must be
+itself.
+@example
+-machine hmat=on \
+-m 2G,slots=2,maxmem=4G \
+-object memory-backend-ram,size=1G,id=m0 \
+-object memory-backend-ram,size=1G,id=m1 \
+-numa node,nodeid=0,memdev=m0 \
+-numa node,nodeid=1,memdev=m1,initiator=0 \
+-smp 2,sockets=2,maxcpus=2  \
+-numa cpu,node-id=0,socket-id=0 \
+-numa cpu,node-id=0,socket-id=1
+@end example
+
 @var{source} and @var{destination} are NUMA node IDs.
 @var{distance} is the NUMA distance from @var{source} to @var{destination}.
 The distance from a node to itself is always 10. If any pair of nodes is
-- 
2.20.1


