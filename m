Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B033463E6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 18:20:21 +0200 (CEST)
Received: from localhost ([::1]:53128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbow6-0007QL-AN
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 12:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33968)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hbobq-0001Cw-9t
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hbobn-0005vo-58
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:22 -0400
Received: from mga18.intel.com ([134.134.136.126]:2024)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hbobm-0005Pa-Mg
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 08:59:17 -0700
X-ExtLoop1: 1
Received: from tao-optiplex-7060.sh.intel.com ([10.239.13.104])
 by orsmga008.jf.intel.com with ESMTP; 14 Jun 2019 08:59:15 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Fri, 14 Jun 2019 23:56:26 +0800
Message-Id: <20190614155626.27932-9-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614155626.27932-1-tao3.xu@intel.com>
References: <20190614155626.27932-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH v5 8/8] numa: Extend the command-line to
 provide memory latency and bandwidth information
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

Add -numa hmat-lb option to provide System Locality Latency and
Bandwidth Information. These memory attributes help to build
System Locality Latency and Bandwidth Information Structure(s)
in ACPI Heterogeneous Memory Attribute Table (HMAT).

Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

Changes in v5 -> v4:
    - Add error message when base unit < 10
    - Add more descriptions about option hmat-lb (Igor)
    - Fix some spell error
    - Update the hmat-lb option example by using '-numa cpu'
    and '-numa memdev' (Igor)
---
 numa.c          | 135 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/misc.json  |  94 ++++++++++++++++++++++++++++++++-
 qemu-options.hx |  45 +++++++++++++++-
 3 files changed, 271 insertions(+), 3 deletions(-)

diff --git a/numa.c b/numa.c
index 5556d118c3..ca9d99743a 100644
--- a/numa.c
+++ b/numa.c
@@ -40,6 +40,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/cutils.h"
+#include "hw/acpi/hmat.h"
 
 QemuOptsList qemu_numa_opts = {
     .name = "numa",
@@ -179,6 +180,134 @@ void parse_numa_distance(MachineState *ms, NumaDistOptions *dist, Error **errp)
     ms->numa_state->have_numa_distance = true;
 }
 
+static void parse_numa_hmat_lb(MachineState *ms, NumaHmatLBOptions *node,
+                               Error **errp)
+{
+    int nb_numa_nodes = ms->numa_state->num_nodes;
+    NodeInfo *numa_info = ms->numa_state->nodes;
+    HMAT_LB_Info *hmat_lb = NULL;
+
+    if (node->data_type <= HMATLB_DATA_TYPE_WRITE_LATENCY) {
+        if (!node->has_latency) {
+            error_setg(errp, "Missing 'latency' option.");
+            return;
+        }
+        if (node->has_bandwidth) {
+            error_setg(errp, "Invalid option 'bandwidth' since "
+                       "the data type is latency.");
+            return;
+        }
+        if (node->has_base_bw) {
+            error_setg(errp, "Invalid option 'base_bw' since "
+                       "the data type is latency.");
+            return;
+        }
+    }
+
+    if (node->data_type >= HMATLB_DATA_TYPE_ACCESS_BANDWIDTH) {
+        if (!node->has_bandwidth) {
+            error_setg(errp, "Missing 'bandwidth' option.");
+            return;
+        }
+        if (node->has_latency) {
+            error_setg(errp, "Invalid option 'latency' since "
+                       "the data type is bandwidth.");
+            return;
+        }
+        if (node->has_base_lat) {
+            error_setg(errp, "Invalid option 'base_lat' since "
+                       "the data type is bandwidth.");
+            return;
+        }
+    }
+
+    if (node->initiator >= nb_numa_nodes) {
+        error_setg(errp, "Invalid initiator=%"
+                   PRIu16 ", it should be less than %d.",
+                   node->initiator, nb_numa_nodes);
+        return;
+    }
+    if (!numa_info[node->initiator].is_initiator) {
+        error_setg(errp, "Invalid initiator=%"
+                   PRIu16 ", it isn't an initiator proximity domain.",
+                   node->initiator);
+        return;
+    }
+
+    if (node->target >= nb_numa_nodes) {
+        error_setg(errp, "Invalid target=%"
+                   PRIu16 ", it should be less than %d.",
+                   node->target, nb_numa_nodes);
+        return;
+    }
+    if (!numa_info[node->target].is_target) {
+        error_setg(errp, "Invalid target=%"
+                   PRIu16 ", it isn't a target proximity domain.",
+                   node->target);
+        return;
+    }
+
+    if (node->has_latency) {
+        hmat_lb = ms->numa_state->hmat_lb[node->hierarchy][node->data_type];
+
+        if (!hmat_lb) {
+            hmat_lb = g_malloc0(sizeof(*hmat_lb));
+            ms->numa_state->hmat_lb[node->hierarchy][node->data_type] = hmat_lb;
+        } else if (hmat_lb->latency[node->initiator][node->target]) {
+            error_setg(errp, "Duplicate configuration of the latency for "
+                       "initiator=%" PRIu16 " and target=%" PRIu16 ".",
+                       node->initiator, node->target);
+            return;
+        }
+
+        /* Only the first time of setting the base unit is valid. */
+        if ((hmat_lb->base_lat == 0) && (node->has_base_lat)) {
+            if (node->base_lat >= 10) {
+                hmat_lb->base_lat = node->base_lat;
+            } else {
+                error_setg(errp, "The minimum latency base unit is 10.");
+                return;
+            }
+        }
+
+        hmat_lb->latency[node->initiator][node->target] = node->latency;
+    }
+
+    if (node->has_bandwidth) {
+        hmat_lb = ms->numa_state->hmat_lb[node->hierarchy][node->data_type];
+
+        if (!hmat_lb) {
+            hmat_lb = g_malloc0(sizeof(*hmat_lb));
+            ms->numa_state->hmat_lb[node->hierarchy][node->data_type] = hmat_lb;
+        } else if (hmat_lb->bandwidth[node->initiator][node->target]) {
+            error_setg(errp, "Duplicate configuration of the bandwidth for "
+                       "initiator=%" PRIu16 " and target=%" PRIu16 ".",
+                       node->initiator, node->target);
+            return;
+        }
+
+        /* Only the first time of setting the base unit is valid. */
+        if (hmat_lb->base_bw == 0) {
+            if (!node->has_base_bw) {
+                error_setg(errp, "Missing 'base-bw' option");
+                return;
+            } else if (node->base_bw < 10) {
+                error_setg(errp, "The minimum bandwidth base unit is 10.");
+                return;
+            } else {
+                hmat_lb->base_bw = node->base_bw;
+            }
+        }
+
+        hmat_lb->bandwidth[node->initiator][node->target] = node->bandwidth;
+    }
+
+    if (hmat_lb) {
+        hmat_lb->hierarchy = node->hierarchy;
+        hmat_lb->data_type = node->data_type;
+    }
+}
+
 static
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
 {
@@ -218,6 +347,12 @@ void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
         machine_set_cpu_numa_node(ms, qapi_NumaCpuOptions_base(&object->u.cpu),
                                   &err);
         break;
+    case NUMA_OPTIONS_TYPE_HMAT_LB:
+        parse_numa_hmat_lb(ms, &object->u.hmat_lb, &err);
+        if (err) {
+            goto end;
+        }
+        break;
     default:
         abort();
     }
diff --git a/qapi/misc.json b/qapi/misc.json
index 8b3ca4fdd3..a3fe411137 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -2539,10 +2539,12 @@
 #
 # @cpu: property based CPU(s) to node mapping (Since: 2.10)
 #
+# @hmat-lb: memory latency and bandwidth information (Since: 4.1)
+#
 # Since: 2.1
 ##
 { 'enum': 'NumaOptionsType',
-  'data': [ 'node', 'dist', 'cpu' ] }
+  'data': [ 'node', 'dist', 'cpu', 'hmat-lb' ] }
 
 ##
 # @NumaOptions:
@@ -2557,7 +2559,8 @@
   'data': {
     'node': 'NumaNodeOptions',
     'dist': 'NumaDistOptions',
-    'cpu': 'NumaCpuOptions' }}
+    'cpu': 'NumaCpuOptions',
+    'hmat-lb': 'NumaHmatLBOptions' }}
 
 ##
 # @NumaNodeOptions:
@@ -2620,6 +2623,93 @@
    'base': 'CpuInstanceProperties',
    'data' : {} }
 
+##
+# @HmatLBMemoryHierarchy:
+#
+# The memory hierarchy in the System Locality Latency
+# and Bandwidth Information Structure of HMAT (Heterogeneous
+# Memory Attribute Table)
+#
+# @memory: the structure represents the memory performance
+#
+# @last-level: last level memory of memory side cached memory
+#
+# @first-level: first level memory of memory side cached memory
+#
+# @second-level: second level memory of memory side cached memory
+#
+# @third-level: third level memory of memory side cached memory
+#
+# Since: 4.1
+##
+{ 'enum': 'HmatLBMemoryHierarchy',
+  'data': [ 'memory', 'last-level', 'first-level',
+            'second-level', 'third-level' ] }
+
+##
+# @HmatLBDataType:
+#
+# Data type in the System Locality Latency
+# and Bandwidth Information Structure of HMAT (Heterogeneous
+# Memory Attribute Table)
+#
+# @access-latency: access latency (nanoseconds)
+#
+# @read-latency: read latency (nanoseconds)
+#
+# @write-latency: write latency (nanoseconds)
+#
+# @access-bandwidth: access bandwidth (MB/s)
+#
+# @read-bandwidth: read bandwidth (MB/s)
+#
+# @write-bandwidth: write bandwidth (MB/s)
+#
+# Since: 4.1
+##
+{ 'enum': 'HmatLBDataType',
+  'data': [ 'access-latency', 'read-latency', 'write-latency',
+            'access-bandwidth', 'read-bandwidth', 'write-bandwidth' ] }
+
+##
+# @NumaHmatLBOptions:
+#
+# Set the system locality latency and bandwidth information
+# between Initiator and Target proximity Domains.
+#
+# @initiator: the Initiator Proximity Domain.
+#
+# @target: the Target Proximity Domain.
+#
+# @hierarchy: the Memory Hierarchy. Indicates the performance
+#             of memory or side cache.
+#
+# @data-type: presents the type of data, access/read/write
+#             latency or hit latency.
+#
+# @base-lat: the base unit for latency in nanoseconds.
+#
+# @base-bw: the base unit for bandwidth in megabytes per second(MB/s).
+#
+# @latency: the value of latency based on Base Unit from @initiator
+#           to @target proximity domain.
+#
+# @bandwidth: the value of bandwidth based on Base Unit between
+#             @initiator and @target proximity domain.
+#
+# Since: 4.1
+##
+{ 'struct': 'NumaHmatLBOptions',
+    'data': {
+    'initiator': 'uint16',
+    'target': 'uint16',
+    'hierarchy': 'HmatLBMemoryHierarchy',
+    'data-type': 'HmatLBDataType',
+    '*base-lat': 'uint64',
+    '*base-bw': 'uint64',
+    '*latency': 'uint16',
+    '*bandwidth': 'uint16' }}
+
 ##
 # @HostMemPolicy:
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 0d8beb4afd..4179be516f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -163,16 +163,19 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
     "-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node]\n"
     "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node]\n"
     "-numa dist,src=source,dst=destination,val=distance\n"
-    "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n",
+    "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n"
+    "-numa hmat-lb,initiator=node,target=node,hierarchy=memory|last-level|first-level|second-level|third-level,data-type=access-latency|read-latency|write-latency[,base-lat=blat][,base-bw=bbw][,latency=lat][,bandwidth=bw]\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}]
 @itemx -numa node[,memdev=@var{id}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}]
 @itemx -numa dist,src=@var{source},dst=@var{destination},val=@var{distance}
 @itemx -numa cpu,node-id=@var{node}[,socket-id=@var{x}][,core-id=@var{y}][,thread-id=@var{z}]
+@itemx -numa hmat-lb,initiator=@var{node},target=@var{node},hierarchy=@var{str},data-type=@var{str}[,base-lat=@var{blat}][,base-bw=@var{bbw}][,latency=@var{lat}][,bandwidth=@var{bw}]
 @findex -numa
 Define a NUMA node and assign RAM and VCPUs to it.
 Set the NUMA distance from a source node to a destination node.
+Set the ACPI Heterogeneous Memory Attributes for the given nodes.
 
 Legacy VCPU assignment uses @samp{cpus} option where
 @var{firstcpu} and @var{lastcpu} are CPU indexes. Each
@@ -230,6 +233,46 @@ specified resources, it just assigns existing resources to NUMA
 nodes. This means that one still has to use the @option{-m},
 @option{-smp} options to allocate RAM and VCPUs respectively.
 
+Use @samp{hmat-lb} to set System Locality Latency and Bandwidth Information
+between initiator and target NUMA nodes in ACPI Heterogeneous Attribute Memory Table (HMAT).
+Initiator NUMA node can create memory requests, usually including one or more processors.
+Target NUMA node contains addressable memory.
+[,base-lat=@var{blat}][,base-bw=@var{bbw}][,latency=@var{lat}][,bandwidth=@var{bw}]
+
+In @samp{hmat-lb} option, @var{node} are NUMA node IDs. @var{str} of 'hierarchy'
+is the memory hierarchy of the target NUMA node: if @var{str} is 'memory', the structure
+represents the memory performance; if @var{str} is 'last-level|first-level|second-level|third-level',
+this structure represents aggregated performance of memory side caches for each domain.
+@var{str} of 'data-type' is type of data represented by this structure instance:
+if 'hierarchy' is 'memory', 'data-type' is 'access|read|write' latency(nanoseconds)
+or 'access|read|write' bandwidth(MB/s) of the target memory; if 'hierarchy' is
+'last-level|first-level|second-level|third-level', 'data-type' is 'access|read|write' hit latency(nanoseconds)
+or 'access|read|write' hit bandwidth of the target memory side cache. @var{blat}
+or @var{bbw} is Matrix Entry Values(latency or bandwidth) base unit used for normalizing
+the matrix entry values(which store the latency or bandwidth values). Base unit
+for latency in nanoseconds. Base unit for bandwidth in megabytes per second(MB/s).
+Note: Due to the minimum matrix value entry value being 10, the base unit corresponds
+to a value of 10. And @var{blat} or @var{bbw} should be an integer. @var{lat} or
+@var{bw} is the latency/bandwidth value.
+
+For example, the following option assigns NUMA node 0 and 1. Node 0 has 2 cpus and
+a ram, node 1 has only a ran. The processors in node 0 access memory in node
+0 with access-latency 5 nanoseconds(base latency is 10), access-bandwidth 5 MB/s(base latency is 20);
+The processors in NUMA node 0 access memory in NUMA node 1 with access-latency 10
+nanoseconds(base latency is 10), access-bandwidth 10 MB/s(base latency is 20):
+@example
+-m 2G \
+-object memory-backend-ram,size=1024M,policy=bind,host-nodes=0,id=ram-node0 -numa node,nodeid=0,memdev=ram-node0 \
+-object memory-backend-ram,size=1024M,policy=bind,host-nodes=1,id=ram-node1 -numa node,nodeid=1,memdev=ram-node1 \
+-smp 2 \
+-numa cpu,node-id=0,socket-id=0 \
+-numa cpu,node-id=0,socket-id=1 \
+-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,base-lat=10,latency=5 \
+-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,base-bw=20,bandwidth=5 \
+-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,base-lat=10,latency=10 \
+-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,base-bw=20,bandwidth=10 \
+@end example
+
 ETEXI
 
 DEF("add-fd", HAS_ARG, QEMU_OPTION_add_fd,
-- 
2.20.1


