Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A2AA49CE
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Sep 2019 16:28:05 +0200 (CEST)
Received: from localhost ([::1]:57776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4Qpn-0001SR-LW
	for lists+qemu-devel@lfdr.de; Sun, 01 Sep 2019 10:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1i4Qji-0004ka-9Y
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 10:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1i4Qjg-0004rA-8J
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 10:21:46 -0400
Received: from mga12.intel.com ([192.55.52.136]:16719)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1i4Qjf-0004jJ-5S
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 10:21:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Sep 2019 07:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,455,1559545200"; d="scan'208";a="211453134"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2019 07:21:40 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Sun,  1 Sep 2019 22:21:17 +0800
Message-Id: <20190901142119.20482-10-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190901142119.20482-1-tao3.xu@intel.com>
References: <20190901142119.20482-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: [Qemu-devel] [PATCH v10 09/11] numa: Extend CLI to provide memory
 latency and bandwidth information
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
 qemu-devel@nongnu.org, daniel@linux.ibm.com, jonathan.cameron@huawei.com,
 dan.j.williams@intel.com
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

Changes in v10:
    - use new builtin type 'time' as qapi input.
---
 hw/core/numa.c        | 164 ++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/numa.h |   2 +
 qapi/machine.json     |  95 +++++++++++++++++++++++-
 qemu-options.hx       |  49 ++++++++++++-
 4 files changed, 307 insertions(+), 3 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 1e75c26e49..7387547793 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -42,6 +42,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/cutils.h"
+#include "hw/acpi/hmat.h"
 
 QemuOptsList qemu_numa_opts = {
     .name = "numa",
@@ -186,6 +187,152 @@ void parse_numa_distance(MachineState *ms, NumaDistOptions *dist, Error **errp)
     ms->numa_state->have_numa_distance = true;
 }
 
+static uint64_t hmat_get_base(uint64_t lb_data, int unit)
+{
+    uint64_t base = 1;
+
+    while (lb_data >= UINT16_MAX && QEMU_IS_ALIGNED(lb_data, unit)) {
+        lb_data /= unit;
+        base *= unit;
+    }
+
+    if (lb_data < UINT16_MAX) {
+        return base;
+    } else {
+        return 0;
+    }
+}
+
+void parse_numa_hmat_lb(MachineState *ms, NumaHmatLBOptions *node,
+                        Error **errp)
+{
+    int nb_numa_nodes = ms->numa_state->num_nodes;
+    NodeInfo *numa_info = ms->numa_state->nodes;
+    HMAT_LB_Info *hmat_lb = NULL;
+    uint64_t base_lat = 0, base_bw = 0, bw_mb;
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
+    }
+
+    if (node->initiator >= nb_numa_nodes) {
+        error_setg(errp, "Invalid initiator=%"
+                   PRIu16 ", it should be less than %d.",
+                   node->initiator, nb_numa_nodes);
+        return;
+    }
+    if (!numa_info[node->initiator].has_cpu) {
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
+    if (!numa_info[node->target].present) {
+        error_setg(errp, "Invalid target=%"
+                   PRIu16 ", it hasn't a valid NUMA node.",
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
+        base_lat = hmat_get_base(node->latency, 1000);
+        if (base_lat == 0) {
+            error_setg(errp, "Latency value %" PRIu64 " overflow, max value"
+                " is %" PRIu16, node->latency, UINT16_MAX - 1);
+            return;
+        }
+
+        /* Only the first time of setting the base unit is valid. */
+        if (hmat_lb->base_lat == 0) {
+            hmat_lb->base_lat = base_lat;
+        } else if (hmat_lb->base_lat != base_lat) {
+            error_setg(errp, "Invalid base latency unit %" PRIu64 ", all "
+            "latencies must be specified in the same units.", base_lat);
+            return;
+        }
+
+        hmat_lb->latency[node->initiator][node->target] =
+            node->latency / base_lat;
+    }
+
+    if (node->has_bandwidth) {
+        hmat_lb = ms->numa_state->hmat_lb[node->hierarchy][node->data_type];
+        bw_mb = node->bandwidth / 1024 / 1024;
+
+	if (!hmat_lb) {
+            hmat_lb = g_malloc0(sizeof(*hmat_lb));
+            ms->numa_state->hmat_lb[node->hierarchy][node->data_type] = hmat_lb;
+        } else if (hmat_lb->bandwidth[node->initiator][node->target]) {
+            error_setg(errp, "Duplicate configuration of the bandwidth for "
+                       "initiator=%" PRIu16 " and target=%" PRIu16 ".",
+                       node->initiator, node->target);
+            return;
+        }
+
+        base_bw = hmat_get_base(bw_mb, 1024);
+        if (base_bw == 0) {
+            error_setg(errp, "Bandwidth value %" PRIu64 " overflow, max value"
+                " is %" PRIu16, bw_mb, UINT16_MAX - 1);
+            return;
+        }
+
+        /* Only the first time of setting the base unit is valid. */
+        if (hmat_lb->base_bw == 0) {
+            hmat_lb->base_bw = base_bw;
+        } else if (hmat_lb->base_bw != base_bw) {
+            error_setg(errp, "Invalid base bandwidth unit %" PRIu64 ", all "
+            "bandwidths must be specified in the same units.", base_bw);
+            return;
+        }
+
+        hmat_lb->bandwidth[node->initiator][node->target] = bw_mb;
+    }
+
+    if (hmat_lb) {
+        hmat_lb->hierarchy = node->hierarchy;
+        hmat_lb->data_type = node->data_type;
+    }
+}
+
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
 {
     Error *err = NULL;
@@ -224,6 +371,12 @@ void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
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
@@ -251,6 +404,17 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
         qemu_strtosz_MiB(mem_str, NULL, &object->u.node.mem);
     }
 
+    if (object->type == NUMA_OPTIONS_TYPE_HMAT_LB) {
+        if (object->u.hmat_lb.has_latency) {
+            const char *lat_str = qemu_opt_get(opts, "latency");
+            qemu_strtotime_ps(lat_str, NULL, &object->u.hmat_lb.latency);
+        }
+        if (object->u.hmat_lb.has_bandwidth) {
+            const char *bw_str = qemu_opt_get(opts, "bandwidth");
+            qemu_strtosz_MiB(bw_str, NULL, &object->u.hmat_lb.bandwidth);
+        }
+    }
+
     set_numa_options(ms, object, &err);
 
 end:
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index dc48d39439..c18e939395 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -75,6 +75,8 @@ typedef struct NumaState NumaState;
 
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp);
 void parse_numa_opts(MachineState *ms);
+void parse_numa_hmat_lb(MachineState *ms, NumaHmatLBOptions *node,
+                        Error **errp);
 void numa_complete_configuration(MachineState *ms);
 void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
 extern QemuOptsList qemu_numa_opts;
diff --git a/qapi/machine.json b/qapi/machine.json
index 3c2914cd1c..b6019335e8 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -426,10 +426,12 @@
 #
 # @cpu: property based CPU(s) to node mapping (Since: 2.10)
 #
+# @hmat-lb: memory latency and bandwidth information (Since: 4.2)
+#
 # Since: 2.1
 ##
 { 'enum': 'NumaOptionsType',
-  'data': [ 'node', 'dist', 'cpu' ] }
+  'data': [ 'node', 'dist', 'cpu', 'hmat-lb' ] }
 
 ##
 # @NumaOptions:
@@ -444,7 +446,8 @@
   'data': {
     'node': 'NumaNodeOptions',
     'dist': 'NumaDistOptions',
-    'cpu': 'NumaCpuOptions' }}
+    'cpu': 'NumaCpuOptions',
+    'hmat-lb': 'NumaHmatLBOptions' }}
 
 ##
 # @NumaNodeOptions:
@@ -557,6 +560,94 @@
    'base': 'CpuInstanceProperties',
    'data' : {} }
 
+##
+# @HmatLBMemoryHierarchy:
+#
+# The memory hierarchy in the System Locality Latency
+# and Bandwidth Information Structure of HMAT (Heterogeneous
+# Memory Attribute Table)
+#
+# For more information of @HmatLBMemoryHierarchy see
+# the chapter 5.2.27.4: Table 5-142: Field "Flags" of ACPI 6.3 spec.
+#
+# @memory: the structure represents the memory performance
+#
+# @first-level: first level memory of memory side cached memory
+#
+# @second-level: second level memory of memory side cached memory
+#
+# @third-level: third level memory of memory side cached memory
+#
+# Since: 4.2
+##
+{ 'enum': 'HmatLBMemoryHierarchy',
+  'data': [ 'memory', 'first-level', 'second-level', 'third-level' ] }
+
+##
+# @HmatLBDataType:
+#
+# Data type in the System Locality Latency
+# and Bandwidth Information Structure of HMAT (Heterogeneous
+# Memory Attribute Table)
+#
+# For more information of @HmatLBDataType see
+# the chapter 5.2.27.4: Table 5-142:  Field "Data Type" of ACPI 6.3 spec.
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
+# Since: 4.2
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
+# For more information of @NumaHmatLBOptions see
+# the chapter 5.2.27.4: Table 5-142 of ACPI 6.3 spec.
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
+# @latency: the value of latency from @initiator to @target proximity domain,
+#           the latency units are "ps(picosecond)", "ns(nanosecond)" or
+#           "us(microsecond)".
+#
+# @bandwidth: the value of bandwidth between @initiator and @target proximity
+#             domain, the bandwidth units are "MB(/s)","GB(/s)" or "TB(/s)".
+#
+# Since: 4.2
+##
+{ 'struct': 'NumaHmatLBOptions',
+    'data': {
+    'initiator': 'uint16',
+    'target': 'uint16',
+    'hierarchy': 'HmatLBMemoryHierarchy',
+    'data-type': 'HmatLBDataType',
+    '*latency': 'time',
+    '*bandwidth': 'size' }}
+
 ##
 # @HostMemPolicy:
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 9f568c58d1..252495c288 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -168,16 +168,19 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
     "-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
     "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
     "-numa dist,src=source,dst=destination,val=distance\n"
-    "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n",
+    "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n"
+    "-numa hmat-lb,initiator=node,target=node,hierarchy=memory|first-level|second-level|third-level,data-type=access-latency|read-latency|write-latency[,latency=lat][,bandwidth=bw]\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
 @itemx -numa node[,memdev=@var{id}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
 @itemx -numa dist,src=@var{source},dst=@var{destination},val=@var{distance}
 @itemx -numa cpu,node-id=@var{node}[,socket-id=@var{x}][,core-id=@var{y}][,thread-id=@var{z}]
+@itemx -numa hmat-lb,initiator=@var{node},target=@var{node},hierarchy=@var{str},data-type=@var{str}[,latency=@var{lat}][,bandwidth=@var{bw}]
 @findex -numa
 Define a NUMA node and assign RAM and VCPUs to it.
 Set the NUMA distance from a source node to a destination node.
+Set the ACPI Heterogeneous Memory Attributes for the given nodes.
 
 Legacy VCPU assignment uses @samp{cpus} option where
 @var{firstcpu} and @var{lastcpu} are CPU indexes. Each
@@ -256,6 +259,50 @@ specified resources, it just assigns existing resources to NUMA
 nodes. This means that one still has to use the @option{-m},
 @option{-smp} options to allocate RAM and VCPUs respectively.
 
+Use @samp{hmat-lb} to set System Locality Latency and Bandwidth Information
+between initiator and target NUMA nodes in ACPI Heterogeneous Attribute Memory Table (HMAT).
+Initiator NUMA node can create memory requests, usually including one or more processors.
+Target NUMA node contains addressable memory.
+
+In @samp{hmat-lb} option, @var{node} are NUMA node IDs. @var{str} of 'hierarchy'
+is the memory hierarchy of the target NUMA node: if @var{str} is 'memory', the structure
+represents the memory performance; if @var{str} is 'first-level|second-level|third-level',
+this structure represents aggregated performance of memory side caches for each domain.
+@var{str} of 'data-type' is type of data represented by this structure instance:
+if 'hierarchy' is 'memory', 'data-type' is 'access|read|write' latency(nanoseconds)
+or 'access|read|write' bandwidth(MB/s) of the target memory; if 'hierarchy' is
+'first-level|second-level|third-level', 'data-type' is 'access|read|write' hit latency
+or 'access|read|write' hit bandwidth of the target memory side cache.
+
+@var{lat} of 'latency' is latency value, the possible value and units are
+NUM[ps|ns|us] (picosecond|nanosecond|microsecond), the recommended unit is 'ns'. @var{bw}
+is bandwidth value, the possible value and units are NUM[M|G|T], mean that
+the bandwidth value are NUM MB/s, GB/s or TB/s. Note that max NUM is 65534,
+if NUM is 0, means the corresponding latency or bandwidth information is not provided.
+And if input numbers without any unit, the latency unit will be 'ps' and the bandwidth
+will be MB/s.
+
+For example, the following option assigns NUMA node 0 and 1. Node 0 has 2 cpus and
+a ram, node 1 has only a ram. The processors in node 0 access memory in node
+0 with access-latency 5 nanoseconds, access-bandwidth is 200 MB/s;
+The processors in NUMA node 0 access memory in NUMA node 1 with access-latency 10
+nanoseconds, access-bandwidth is 100 MB/s.
+@example
+-machine hmat=on \
+-m 2G \
+-object memory-backend-ram,size=1G,id=m0 \
+-object memory-backend-ram,size=1G,id=m1 \
+-smp 2 \
+-numa node,nodeid=0,memdev=m0 \
+-numa node,nodeid=1,memdev=m1,initiator=0 \
+-numa cpu,node-id=0,socket-id=0 \
+-numa cpu,node-id=0,socket-id=1 \
+-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5ns \
+-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=200M \
+-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=10ns \
+-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M
+@end example
+
 ETEXI
 
 DEF("add-fd", HAS_ARG, QEMU_OPTION_add_fd,
-- 
2.20.1


