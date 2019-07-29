Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2B784FC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 08:36:06 +0200 (CEST)
Received: from localhost ([::1]:49869 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hrzGP-00021j-LX
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 02:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54166)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hrzCY-0005K1-5n
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 02:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hrzCV-0001jw-E9
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 02:32:05 -0400
Received: from mga11.intel.com ([192.55.52.93]:47119)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hrzCS-0001Ef-FA
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 02:32:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jul 2019 23:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,321,1559545200"; d="scan'208";a="370357253"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.37])
 by fmsmga005.fm.intel.com with ESMTP; 28 Jul 2019 23:31:40 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Mon, 29 Jul 2019 14:31:21 +0800
Message-Id: <20190729063127.2801-6-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729063127.2801-1-tao3.xu@intel.com>
References: <20190729063127.2801-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH v8 05/11] numa: Extend CLI to provide initiator
 information for numa nodes
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
Cc: Jingqi Liu <Jingqi.liu@intel.com>, tao3.xu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com, dan.j.williams@intel.com
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

Reviewed-by: Jingqi Liu <Jingqi.liu@intel.com>
Suggested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

No changes in v8.
---
 hw/core/machine.c     | 24 ++++++++++++++++++++++++
 hw/core/numa.c        | 13 +++++++++++++
 include/sysemu/numa.h |  3 +++
 qapi/machine.json     |  6 +++++-
 qemu-options.hx       | 27 +++++++++++++++++++++++----
 5 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1b6a304e1c..a2b88b4fb3 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -656,6 +656,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    NodeInfo *numa_info = machine->numa_state->nodes;
     bool match = false;
     int i;
 
@@ -725,6 +726,16 @@ void machine_set_cpu_numa_node(MachineState *machine,
         match = true;
         slot->props.node_id = props->node_id;
         slot->props.has_node_id = props->has_node_id;
+
+        if (numa_info[props->node_id].initiator_valid &&
+            (props->node_id != numa_info[props->node_id].initiator)) {
+            error_setg(errp, "The initiator of CPU NUMA node %" PRId64
+                       " should be itself.", props->node_id);
+            return;
+        }
+        numa_info[props->node_id].initiator_valid = true;
+        numa_info[props->node_id].has_cpu = true;
+        numa_info[props->node_id].initiator = props->node_id;
     }
 
     if (!match) {
@@ -1066,6 +1077,7 @@ static void machine_numa_finish_cpu_init(MachineState *machine)
     GString *s = g_string_new(NULL);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
+    NodeInfo *numa_info = machine->numa_state->nodes;
 
     assert(machine->numa_state->num_nodes);
     for (i = 0; i < possible_cpus->len; i++) {
@@ -1099,6 +1111,18 @@ static void machine_numa_finish_cpu_init(MachineState *machine)
             machine_set_cpu_numa_node(machine, &props, &error_fatal);
         }
     }
+
+    for (i = 0; i < machine->numa_state->num_nodes; i++) {
+        if (numa_info[i].initiator_valid &&
+            !numa_info[numa_info[i].initiator].has_cpu) {
+            error_report("The initiator-id %"PRIu16 " of NUMA node %d"
+                         " does not exist.", numa_info[i].initiator, i);
+            error_printf("\n");
+
+            exit(1);
+        }
+    }
+
     if (s->len && !qtest_enabled()) {
         warn_report("CPU(s) not present in any NUMA nodes: %s",
                     s->str);
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 8fcbba05d6..cfb6339810 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -128,6 +128,19 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         numa_info[nodenr].node_mem = object_property_get_uint(o, "size", NULL);
         numa_info[nodenr].node_memdev = MEMORY_BACKEND(o);
     }
+
+    if (node->has_initiator) {
+        if (numa_info[nodenr].initiator_valid &&
+            (node->initiator != numa_info[nodenr].initiator)) {
+            error_setg(errp, "The initiator of NUMA node %" PRIu16 " has been "
+                       "set to node %" PRIu16, nodenr,
+                       numa_info[nodenr].initiator);
+            return;
+        }
+
+        numa_info[nodenr].initiator_valid = true;
+        numa_info[nodenr].initiator = node->initiator;
+    }
     numa_info[nodenr].present = true;
     max_numa_nodeid = MAX(max_numa_nodeid, nodenr + 1);
     ms->numa_state->num_nodes++;
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 76da3016db..46ad06e000 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -10,6 +10,9 @@ struct NodeInfo {
     uint64_t node_mem;
     struct HostMemoryBackend *node_memdev;
     bool present;
+    bool has_cpu;
+    bool initiator_valid;
+    uint16_t initiator;
     uint8_t distance[MAX_NODES];
 };
 
diff --git a/qapi/machine.json b/qapi/machine.json
index 6db8a7e2ec..05e367d26a 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -414,6 +414,9 @@
 # @memdev: memory backend object.  If specified for one node,
 #          it must be specified for all nodes.
 #
+# @initiator: the initiator numa nodeid that is closest (as in directly
+#             attached) to this numa node (since 4.2)
+#
 # Since: 2.1
 ##
 { 'struct': 'NumaNodeOptions',
@@ -421,7 +424,8 @@
    '*nodeid': 'uint16',
    '*cpus':   ['uint16'],
    '*mem':    'size',
-   '*memdev': 'str' }}
+   '*memdev': 'str',
+   '*initiator': 'uint16' }}
 
 ##
 # @NumaDistOptions:
diff --git a/qemu-options.hx b/qemu-options.hx
index 9621e934c0..c480781992 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -161,14 +161,14 @@ If any on the three values is given, the total number of CPUs @var{n} can be omi
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
@@ -215,6 +215,25 @@ split equally between them.
 @samp{mem} and @samp{memdev} are mutually exclusive. Furthermore,
 if one node uses @samp{memdev}, all of them have to use it.
 
+@samp{initiator} indicate the initiator NUMA @var{initiator} that is
+closest (as in directly attached) to this NUMA @var{node}.
+
+For example, the following option assigns 2 NUMA nodes, node 0 has CPU.
+node 1 has only memory, and its' initiator is node 0. Note that because
+node 0 has CPU, by default the initiator of node 0 is itself and must be
+itself.
+@example
+-M pc \
+-m 2G,slots=2,maxmem=4G \
+-object memory-backend-ram,size=1G,id=m0 \
+-object memory-backend-ram,size=1G,id=m1 \
+-numa node,nodeid=0,memdev=m0 \
+-numa node,nodeid=1,memdev=m1,initiator=0 \
+-smp 2,sockets=2,maxcpus=2  \
+-numa cpu,node-id=0,socket-id=0 \
+-numa cpu,node-id=0,socket-id=1 \
+@end example
+
 @var{source} and @var{destination} are NUMA node IDs.
 @var{distance} is the NUMA distance from @var{source} to @var{destination}.
 The distance from a node to itself is always 10. If any pair of nodes is
-- 
2.20.1


