Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B711DBA4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 02:25:03 +0100 (CET)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifZhV-0003AR-Rc
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 20:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1ifZcP-00069d-Ra
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 20:19:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1ifZcN-0006zO-R4
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 20:19:45 -0500
Received: from mga11.intel.com ([192.55.52.93]:9641)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1ifZcN-0006im-HX
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 20:19:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 17:19:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,307,1571727600"; d="scan'208";a="216480533"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by orsmga003.jf.intel.com with ESMTP; 12 Dec 2019 17:19:40 -0800
From: Tao Xu <tao3.xu@intel.com>
To: mst@redhat.com, imammedo@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 sw@weilnetz.de, mdroth@linux.vnet.ibm.com, thuth@redhat.com,
 lvivier@redhat.com
Subject: [PATCH RESEND v20 3/8] numa: Extend CLI to provide memory side cache
 information
Date: Fri, 13 Dec 2019 09:19:24 +0800
Message-Id: <20191213011929.2520-4-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213011929.2520-1-tao3.xu@intel.com>
References: <20191213011929.2520-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
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
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jingqi <jingqi.liu@intel.com>

Add -numa hmat-cache option to provide Memory Side Cache Information.
These memory attributes help to build Memory Side Cache Information
Structure(s) in ACPI Heterogeneous Memory Attribute Table (HMAT).
Before using hmat-cache option, enable HMAT with -machine hmat=on.

Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

Changes in v20:
    - Disable cache level 0 in hmat-cache option (Igor)
    - Update the QAPI description (Markus)

Changes in v19:
    - Add description about the machine property 'hmat' in commit
      message (Markus)
    - Update the QAPI comments
    - Add a check for no memory side cache

Changes in v18:
    - Update the error message (Igor)

Changes in v17:
    - Use NumaHmatCacheOptions to replace HMAT_Cache_Info (Igor)
    - Add check for unordered cache level input (Igor)

Changes in v16:
    - Add cross check with hmat_lb data (Igor)
    - Drop total_levels in struct HMAT_Cache_Info (Igor)
    - Correct the error table number (Igor)
---
 hw/core/numa.c        | 80 ++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/numa.h |  5 +++
 qapi/machine.json     | 81 +++++++++++++++++++++++++++++++++++++++++--
 qemu-options.hx       | 17 +++++++--
 4 files changed, 179 insertions(+), 4 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 34eb413f5d..33fda31a4c 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -379,6 +379,73 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
     g_array_append_val(hmat_lb->list, lb_data);
 }
 
+void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
+                           Error **errp)
+{
+    int nb_numa_nodes = ms->numa_state->num_nodes;
+    NodeInfo *numa_info = ms->numa_state->nodes;
+    NumaHmatCacheOptions *hmat_cache = NULL;
+
+    if (node->node_id >= nb_numa_nodes) {
+        error_setg(errp, "Invalid node-id=%" PRIu32 ", it should be less "
+                   "than %d", node->node_id, nb_numa_nodes);
+        return;
+    }
+
+    if (numa_info[node->node_id].lb_info_provided != (BIT(0) | BIT(1))) {
+        error_setg(errp, "The latency and bandwidth information of "
+                   "node-id=%" PRIu32 " should be provided before memory side "
+                   "cache attributes", node->node_id);
+        return;
+    }
+
+    if (node->level < 1 || node->level >= HMAT_LB_LEVELS) {
+        error_setg(errp, "Invalid level=%" PRIu8 ", it should be larger than 0 "
+                   "and less than or equal to %d", node->level,
+                   HMAT_LB_LEVELS - 1);
+        return;
+    }
+
+    assert(node->associativity < HMAT_CACHE_ASSOCIATIVITY__MAX);
+    assert(node->policy < HMAT_CACHE_WRITE_POLICY__MAX);
+    if (ms->numa_state->hmat_cache[node->node_id][node->level]) {
+        error_setg(errp, "Duplicate configuration of the side cache for "
+                   "node-id=%" PRIu32 " and level=%" PRIu8,
+                   node->node_id, node->level);
+        return;
+    }
+
+    if ((node->level > 1) &&
+        ms->numa_state->hmat_cache[node->node_id][node->level - 1] &&
+        (node->size >=
+            ms->numa_state->hmat_cache[node->node_id][node->level - 1]->size)) {
+        error_setg(errp, "Invalid size=%" PRIu64 ", the size of level=%" PRIu8
+                   " should be less than the size(%" PRIu64 ") of "
+                   "level=%" PRIu8, node->size, node->level,
+                   ms->numa_state->hmat_cache[node->node_id]
+                                             [node->level - 1]->size,
+                   node->level - 1);
+        return;
+    }
+
+    if ((node->level < HMAT_LB_LEVELS - 1) &&
+        ms->numa_state->hmat_cache[node->node_id][node->level + 1] &&
+        (node->size <=
+            ms->numa_state->hmat_cache[node->node_id][node->level + 1]->size)) {
+        error_setg(errp, "Invalid size=%" PRIu64 ", the size of level=%" PRIu8
+                   " should be larger than the size(%" PRIu64 ") of "
+                   "level=%" PRIu8, node->size, node->level,
+                   ms->numa_state->hmat_cache[node->node_id]
+                                             [node->level + 1]->size,
+                   node->level + 1);
+        return;
+    }
+
+    hmat_cache = g_malloc0(sizeof(*hmat_cache));
+    memcpy(hmat_cache, node, sizeof(*hmat_cache));
+    ms->numa_state->hmat_cache[node->node_id][node->level] = hmat_cache;
+}
+
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
 {
     Error *err = NULL;
@@ -430,6 +497,19 @@ void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
             goto end;
         }
         break;
+    case NUMA_OPTIONS_TYPE_HMAT_CACHE:
+        if (!ms->numa_state->hmat_enabled) {
+            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
+                       "(HMAT) is disabled, enable it with -machine hmat=on "
+                       "before using any of hmat specific options");
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
index 70f93c83d7..ba693cc80b 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -91,6 +91,9 @@ struct NumaState {
 
     /* NUMA nodes HMAT Locality Latency and Bandwidth Information */
     HMAT_LB_Info *hmat_lb[HMAT_LB_LEVELS][HMAT_LB_TYPES];
+
+    /* Memory Side Cache Information Structure */
+    NumaHmatCacheOptions *hmat_cache[MAX_NODES][HMAT_LB_LEVELS];
 };
 typedef struct NumaState NumaState;
 
@@ -98,6 +101,8 @@ void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp);
 void parse_numa_opts(MachineState *ms);
 void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
                         Error **errp);
+void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
+                           Error **errp);
 void numa_complete_configuration(MachineState *ms);
 void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
 extern QemuOptsList qemu_numa_opts;
diff --git a/qapi/machine.json b/qapi/machine.json
index cf8faf5a2a..b3d30bc816 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -428,10 +428,12 @@
 #
 # @hmat-lb: memory latency and bandwidth information (Since: 5.0)
 #
+# @hmat-cache: memory side cache information (Since: 5.0)
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
@@ -646,6 +649,80 @@
     '*latency': 'uint64',
     '*bandwidth': 'size' }}
 
+##
+# @HmatCacheAssociativity:
+#
+# Cache associativity in the Memory Side Cache Information Structure
+# of HMAT
+#
+# For more information of @HmatCacheAssociativity, see chapter
+# 5.2.27.5: Table 5-147 of ACPI 6.3 spec.
+#
+# @none: None (no memory side cache in this proximity domain,
+#              or cache associativity unknown)
+#
+# @direct: Direct Mapped
+#
+# @complex: Complex Cache Indexing (implementation specific)
+#
+# Since: 5.0
+##
+{ 'enum': 'HmatCacheAssociativity',
+  'data': [ 'none', 'direct', 'complex' ] }
+
+##
+# @HmatCacheWritePolicy:
+#
+# Cache write policy in the Memory Side Cache Information Structure
+# of HMAT
+#
+# For more information of @HmatCacheWritePolicy, see chapter
+# 5.2.27.5: Table 5-147: Field "Cache Attributes" of ACPI 6.3 spec.
+#
+# @none: None (no memory side cache in this proximity domain,
+#              or cache write policy unknown)
+#
+# @write-back: Write Back (WB)
+#
+# @write-through: Write Through (WT)
+#
+# Since: 5.0
+##
+{ 'enum': 'HmatCacheWritePolicy',
+  'data': [ 'none', 'write-back', 'write-through' ] }
+
+##
+# @NumaHmatCacheOptions:
+#
+# Set the memory side cache information for a given memory domain.
+#
+# For more information of @NumaHmatCacheOptions, see chapter
+# 5.2.27.5: Table 5-147: Field "Cache Attributes" of ACPI 6.3 spec.
+#
+# @node-id: the memory proximity domain to which the memory belongs.
+#
+# @size: the size of memory side cache in bytes.
+#
+# @level: the cache level described in this structure.
+#
+# @associativity: the cache associativity,
+#         none/direct-mapped/complex(complex cache indexing).
+#
+# @policy: the write policy, none/write-back/write-through.
+#
+# @line: the cache Line size in bytes.
+#
+# Since: 5.0
+##
+{ 'struct': 'NumaHmatCacheOptions',
+  'data': {
+   'node-id': 'uint32',
+   'size': 'size',
+   'level': 'uint8',
+   'associativity': 'HmatCacheAssociativity',
+   'policy': 'HmatCacheWritePolicy',
+   'line': 'uint16' }}
+
 ##
 # @HostMemPolicy:
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index c45e2ae513..16e8888fcc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -169,7 +169,8 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
     "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
     "-numa dist,src=source,dst=destination,val=distance\n"
     "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n"
-    "-numa hmat-lb,initiator=node,target=node,hierarchy=memory|first-level|second-level|third-level,data-type=access-latency|read-latency|write-latency[,latency=lat][,bandwidth=bw]\n",
+    "-numa hmat-lb,initiator=node,target=node,hierarchy=memory|first-level|second-level|third-level,data-type=access-latency|read-latency|write-latency[,latency=lat][,bandwidth=bw]\n"
+    "-numa hmat-cache,node-id=node,size=size,level=level[,associativity=none|direct|complex][,policy=none|write-back|write-through][,line=size]\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
@@ -177,6 +178,7 @@ STEXI
 @itemx -numa dist,src=@var{source},dst=@var{destination},val=@var{distance}
 @itemx -numa cpu,node-id=@var{node}[,socket-id=@var{x}][,core-id=@var{y}][,thread-id=@var{z}]
 @itemx -numa hmat-lb,initiator=@var{node},target=@var{node},hierarchy=@var{hierarchy},data-type=@var{tpye}[,latency=@var{lat}][,bandwidth=@var{bw}]
+@itemx -numa hmat-cache,node-id=@var{node},size=@var{size},level=@var{level}[,associativity=@var{str}][,policy=@var{str}][,line=@var{size}]
 @findex -numa
 Define a NUMA node and assign RAM and VCPUs to it.
 Set the NUMA distance from a source node to a destination node.
@@ -280,11 +282,20 @@ NUM byte per second (or MB/s, GB/s or TB/s depending on used suffix).
 Note that if latency or bandwidth value is 0, means the corresponding latency or
 bandwidth information is not provided.
 
+In @samp{hmat-cache} option, @var{node-id} is the NUMA-id of the memory belongs.
+@var{size} is the size of memory side cache in bytes. @var{level} is the cache
+level described in this structure, note that the cache level 0 should not be used
+with @samp{hmat-cache} option. @var{associativity} is the cache associativity,
+the possible value is 'none/direct(direct-mapped)/complex(complex cache indexing)'.
+@var{policy} is the write policy. @var{line} is the cache Line size in bytes.
+
 For example, the following options describe 2 NUMA nodes. Node 0 has 2 cpus and
 a ram, node 1 has only a ram. The processors in node 0 access memory in node
 0 with access-latency 5 nanoseconds, access-bandwidth is 200 MB/s;
 The processors in NUMA node 0 access memory in NUMA node 1 with access-latency 10
 nanoseconds, access-bandwidth is 100 MB/s.
+And for memory side cache information, NUMA node 0 and 1 both have 1 level memory
+cache, size is 10KB, policy is write-back, the cache Line size is 8 bytes:
 @example
 -machine hmat=on \
 -m 2G \
@@ -298,7 +309,9 @@ nanoseconds, access-bandwidth is 100 MB/s.
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5 \
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=200M \
 -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
--numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M
+-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \
+-numa hmat-cache,node-id=0,size=10K,level=1,associativity=direct,policy=write-back,line=8 \
+-numa hmat-cache,node-id=1,size=10K,level=1,associativity=direct,policy=write-back,line=8
 @end example
 
 ETEXI
-- 
2.20.1


