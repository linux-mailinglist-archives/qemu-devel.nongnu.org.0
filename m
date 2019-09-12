Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AACB086C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 07:47:43 +0200 (CEST)
Received: from localhost ([::1]:58290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8HxG-0004nH-Jz
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 01:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56555)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1i8Hmv-0003W0-Io
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 01:37:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1i8Hmt-0002ws-DM
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 01:37:01 -0400
Received: from mga11.intel.com ([192.55.52.93]:18593)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1i8Hmt-0002tG-1C
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 01:36:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 22:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,495,1559545200"; d="scan'208";a="186030788"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2019 22:36:55 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Thu, 12 Sep 2019 13:36:34 +0800
Message-Id: <20190912053638.4858-8-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190912053638.4858-1-tao3.xu@intel.com>
References: <20190912053638.4858-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH v11 07/11] numa: Extend CLI to provide memory
 side cache information
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
 qemu-devel@nongnu.org, Daniel Black <daniel@linux.ibm.com>,
 jonathan.cameron@huawei.com, dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jingqi <jingqi.liu@intel.com>

Add -numa hmat-cache option to provide Memory Side Cache Information.
These memory attributes help to build Memory Side Cache Information
Structure(s) in ACPI Heterogeneous Memory Attribute Table (HMAT).

Reviewed-by: Daniel Black <daniel@linux.ibm.com>
Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

Changes in v11:
    - Move numa option patches forward.
---
 hw/core/numa.c        | 74 +++++++++++++++++++++++++++++++++++++++
 include/sysemu/numa.h | 31 +++++++++++++++++
 qapi/machine.json     | 81 +++++++++++++++++++++++++++++++++++++++++--
 qemu-options.hx       | 16 +++++++--
 4 files changed, 198 insertions(+), 4 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 82322734e3..6b8ed8b8c8 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -280,6 +280,67 @@ void parse_numa_hmat_lb(NumaState *nstat, NumaHmatLBOptions *node,
     }
 }
 
+void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
+                           Error **errp)
+{
+    int nb_numa_nodes = ms->numa_state->num_nodes;
+    HMAT_Cache_Info *hmat_cache = NULL;
+
+    if (node->node_id >= nb_numa_nodes) {
+        error_setg(errp, "Invalid node-id=%" PRIu32
+                   ", it should be less than %d.",
+                   node->node_id, nb_numa_nodes);
+        return;
+    }
+
+    if (node->total > MAX_HMAT_CACHE_LEVEL) {
+        error_setg(errp, "Invalid total=%" PRIu8
+                   ", it should be less than or equal to %d.",
+                   node->total, MAX_HMAT_CACHE_LEVEL);
+        return;
+    }
+    if (node->level > node->total) {
+        error_setg(errp, "Invalid level=%" PRIu8
+                   ", it should be less than or equal to"
+                   " total=%" PRIu8 ".",
+                   node->level, node->total);
+        return;
+    }
+    if (ms->numa_state->hmat_cache[node->node_id][node->level]) {
+        error_setg(errp, "Duplicate configuration of the side cache for "
+                   "node-id=%" PRIu32 " and level=%" PRIu8 ".",
+                   node->node_id, node->level);
+        return;
+    }
+
+    if ((node->level > 1) &&
+        ms->numa_state->hmat_cache[node->node_id][node->level - 1] &&
+        (node->size >=
+            ms->numa_state->hmat_cache[node->node_id][node->level - 1]->size)) {
+        error_setg(errp, "Invalid size=0x%" PRIx64
+                   ", the size of level=%" PRIu8
+                   " should be less than the size(0x%" PRIx64
+                   ") of level=%" PRIu8 ".",
+                   node->size, node->level,
+                   ms->numa_state->hmat_cache[node->node_id]
+                                             [node->level - 1]->size,
+                   node->level - 1);
+        return;
+    }
+
+    hmat_cache = g_malloc0(sizeof(*hmat_cache));
+
+    hmat_cache->mem_proximity = node->node_id;
+    hmat_cache->size = node->size;
+    hmat_cache->total_levels = node->total;
+    hmat_cache->level = node->level;
+    hmat_cache->associativity = node->assoc;
+    hmat_cache->write_policy = node->policy;
+    hmat_cache->line_size = node->line;
+
+    ms->numa_state->hmat_cache[node->node_id][node->level] = hmat_cache;
+}
+
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
 {
     Error *err = NULL;
@@ -331,6 +392,19 @@ void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
             goto end;
         }
         break;
+    case NUMA_OPTIONS_TYPE_HMAT_CACHE:
+        if (!ms->numa_state->hmat_enabled) {
+            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
+                       "(HMAT) is disabled, use -machine hmat=on before "
+                       "set initiator of NUMA");
+            return;
+        }
+
+        parse_numa_hmat_cache(ms, &object->u.hmat_cache, &err);
+        if (err) {
+            goto end;
+        }
+        break;
     default:
         abort();
     }
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 876beaee22..39312eefd4 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -35,6 +35,8 @@ enum {
 #define HMAT_LB_LEVELS    (HMAT_LB_MEM_CACHE_3RD_LEVEL + 1)
 #define HMAT_LB_TYPES     (HMAT_LB_DATA_WRITE_BANDWIDTH + 1)
 
+#define MAX_HMAT_CACHE_LEVEL        3
+
 struct NodeInfo {
     uint64_t node_mem;
     struct HostMemoryBackend *node_memdev;
@@ -65,6 +67,30 @@ struct HMAT_LB_Info {
 };
 typedef struct HMAT_LB_Info HMAT_LB_Info;
 
+struct HMAT_Cache_Info {
+    /* The memory proximity domain to which the memory belongs. */
+    uint32_t    mem_proximity;
+
+    /* Size of memory side cache in bytes. */
+    uint64_t    size;
+
+    /* Total cache levels for this memory proximity domain. */
+    uint8_t     total_levels;
+
+    /* Cache level described in this structure. */
+    uint8_t     level;
+
+    /* Cache Associativity: None/Direct Mapped/Comple Cache Indexing */
+    uint8_t     associativity;
+
+    /* Write Policy: None/Write Back(WB)/Write Through(WT) */
+    uint8_t     write_policy;
+
+    /* Cache Line size in bytes. */
+    uint16_t    line_size;
+};
+typedef struct HMAT_Cache_Info HMAT_Cache_Info;
+
 struct NumaState {
     /* Number of NUMA nodes */
     int num_nodes;
@@ -83,6 +109,9 @@ struct NumaState {
 
     /* NUMA nodes HMAT Locality Latency and Bandwidth Information */
     HMAT_LB_Info *hmat_lb[HMAT_LB_LEVELS][HMAT_LB_TYPES];
+
+    /* Memory Side Cache Information Structure */
+    HMAT_Cache_Info *hmat_cache[MAX_NODES][MAX_HMAT_CACHE_LEVEL + 1];
 };
 typedef struct NumaState NumaState;
 
@@ -90,6 +119,8 @@ void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp);
 void parse_numa_opts(MachineState *ms);
 void parse_numa_hmat_lb(NumaState *nstat, NumaHmatLBOptions *node,
                         Error **errp);
+void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
+                           Error **errp);
 void numa_complete_configuration(MachineState *ms);
 void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
 extern QemuOptsList qemu_numa_opts;
diff --git a/qapi/machine.json b/qapi/machine.json
index b6019335e8..088be81920 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -428,10 +428,12 @@
 #
 # @hmat-lb: memory latency and bandwidth information (Since: 4.2)
 #
+# @hmat-cache: memory side cache information (Since: 4.2)
+#
 # Since: 2.1
 ##
 { 'enum': 'NumaOptionsType',
-  'data': [ 'node', 'dist', 'cpu', 'hmat-lb' ] }
+  'data': [ 'node', 'dist', 'cpu', 'hmat-lb', 'hmat-cache' ] }
 
 ##
 # @NumaOptions:
@@ -447,7 +449,8 @@
     'node': 'NumaNodeOptions',
     'dist': 'NumaDistOptions',
     'cpu': 'NumaCpuOptions',
-    'hmat-lb': 'NumaHmatLBOptions' }}
+    'hmat-lb': 'NumaHmatLBOptions',
+    'hmat-cache': 'NumaHmatCacheOptions' }}
 
 ##
 # @NumaNodeOptions:
@@ -648,6 +651,80 @@
     '*latency': 'time',
     '*bandwidth': 'size' }}
 
+##
+# @HmatCacheAssociativity:
+#
+# Cache associativity in the Memory Side Cache
+# Information Structure of HMAT
+#
+# For more information of @HmatCacheAssociativity see
+# the chapter 5.2.27.5: Table 5-143 of ACPI 6.3 spec.
+#
+# @none: None
+#
+# @direct: Direct Mapped
+#
+# @complex: Complex Cache Indexing (implementation specific)
+#
+# Since: 4.2
+##
+{ 'enum': 'HmatCacheAssociativity',
+  'data': [ 'none', 'direct', 'complex' ] }
+
+##
+# @HmatCacheWritePolicy:
+#
+# Cache write policy in the Memory Side Cache
+# Information Structure of HMAT
+#
+# For more information of @HmatCacheWritePolicy see
+# the chapter 5.2.27.5: Table 5-143: Field "Cache Attributes" of ACPI 6.3 spec.
+#
+# @none: None
+#
+# @write-back: Write Back (WB)
+#
+# @write-through: Write Through (WT)
+#
+# Since: 4.2
+##
+{ 'enum': 'HmatCacheWritePolicy',
+  'data': [ 'none', 'write-back', 'write-through' ] }
+
+##
+# @NumaHmatCacheOptions:
+#
+# Set the memory side cache information for a given memory domain.
+#
+# For more information of @NumaHmatCacheOptions see
+# the chapter 5.2.27.5: Table 5-143: Field "Cache Attributes" of ACPI 6.3 spec.
+#
+# @node-id: the memory proximity domain to which the memory belongs.
+#
+# @size: the size of memory side cache in bytes.
+#
+# @total: the total cache levels for this memory proximity domain.
+#
+# @level: the cache level described in this structure.
+#
+# @assoc: the cache associativity, none/direct-mapped/complex(complex cache indexing).
+#
+# @policy: the write policy, none/write-back/write-through.
+#
+# @line: the cache Line size in bytes.
+#
+# Since: 4.2
+##
+{ 'struct': 'NumaHmatCacheOptions',
+  'data': {
+   'node-id': 'uint32',
+   'size': 'size',
+   'total': 'uint8',
+   'level': 'uint8',
+   'assoc': 'HmatCacheAssociativity',
+   'policy': 'HmatCacheWritePolicy',
+   'line': 'uint16' }}
+
 ##
 # @HostMemPolicy:
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 129da0cdc3..7cf214a653 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -169,7 +169,8 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
     "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
     "-numa dist,src=source,dst=destination,val=distance\n"
     "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n"
-    "-numa hmat-lb,initiator=node,target=node,hierarchy=memory|first-level|second-level|third-level,data-type=access-latency|read-latency|write-latency[,latency=lat][,bandwidth=bw]\n",
+    "-numa hmat-lb,initiator=node,target=node,hierarchy=memory|first-level|second-level|third-level,data-type=access-latency|read-latency|write-latency[,latency=lat][,bandwidth=bw]\n"
+    "-numa hmat-cache,node-id=node,size=size,total=total,level=level[,assoc=none|direct|complex][,policy=none|write-back|write-through][,line=size]\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
@@ -177,6 +178,7 @@ STEXI
 @itemx -numa dist,src=@var{source},dst=@var{destination},val=@var{distance}
 @itemx -numa cpu,node-id=@var{node}[,socket-id=@var{x}][,core-id=@var{y}][,thread-id=@var{z}]
 @itemx -numa hmat-lb,initiator=@var{node},target=@var{node},hierarchy=@var{str},data-type=@var{str}[,latency=@var{lat}][,bandwidth=@var{bw}]
+@itemx -numa hmat-cache,node-id=@var{node},size=@var{size},total=@var{total},level=@var{level}[,assoc=@var{str}][,policy=@var{str}][,line=@var{size}]
 @findex -numa
 Define a NUMA node and assign RAM and VCPUs to it.
 Set the NUMA distance from a source node to a destination node.
@@ -282,11 +284,19 @@ if NUM is 0, means the corresponding latency or bandwidth information is not pro
 And if input numbers without any unit, the latency unit will be 'ps' and the bandwidth
 will be MB/s.
 
+In @samp{hmat-cache} option, @var{node-id} is the NUMA-id of the memory belongs.
+@var{size} is the size of memory side cache in bytes. @var{total} is the total cache levels.
+@var{level} is the cache level described in this structure. @var{assoc} is the cache associativity,
+the possible value is 'none/direct(direct-mapped)/complex(complex cache indexing)'.
+@var{policy} is the write policy. @var{line} is the cache Line size in bytes.
+
 For example, the following option assigns NUMA node 0 and 1. Node 0 has 2 cpus and
 a ram, node 1 has only a ram. The processors in node 0 access memory in node
 0 with access-latency 5 nanoseconds, access-bandwidth is 200 MB/s;
 The processors in NUMA node 0 access memory in NUMA node 1 with access-latency 10
 nanoseconds, access-bandwidth is 100 MB/s.
+And for memory side cache information, NUMA node 0 and 1 both have 1 level memory
+cache, size is 0x20000 bytes, policy is write-back, the cache Line size is 8 bytes:
 @example
 -machine hmat=on \
 -m 2G \
@@ -300,7 +310,9 @@ nanoseconds, access-bandwidth is 100 MB/s.
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5ns \
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=200M \
 -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=10ns \
--numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M
+-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \
+-numa hmat-cache,node-id=0,size=0x20000,total=1,level=1,assoc=direct,policy=write-back,line=8 \
+-numa hmat-cache,node-id=1,size=0x20000,total=1,level=1,assoc=direct,policy=write-back,line=8
 @end example
 
 ETEXI
-- 
2.20.1


