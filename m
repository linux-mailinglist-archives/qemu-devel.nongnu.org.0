Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1479694214
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQs-00040J-AF; Mon, 13 Feb 2023 04:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQm-0003w2-Dd
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:28 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQf-0002kj-Rd
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281641; x=1707817641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IWiRdBHGXgojFO0IqMVUTsFru4z7jqsB2wt3kc9yKJY=;
 b=U/mi6v0PpN1LOT4+rVP0hBq522j67e2kMVoBXnvFLlbNuOKVBHf7e0mc
 f3+dyKu+Twy6IGolZNuWpQ3DeCvVOxT9Wp0CzfyNVTVLlEkh/DXVKY86s
 Nvj7IoDVkwmPyaoai8GK/xhPWBDuAUfiMBnkYdyDpjmHkDnDWrBXMGdYN
 6TKlNSgJn55nUG6jy51h7BPbd2jrLpIev3U8H5ImGL7hFkKAcsRM2PZmS
 uX2hTL6tIxD6VvYuUDzPoXbuU1gffzVfHN8GKHLExfIZ8DJYCpd+9gFxY
 1HgBzIeXOoMguUN+VTZ/ltjDxx3jFWPtx7/5v6jVP9/ts8wocQgGV+eBG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487320"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487320"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:46:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760701"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760701"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:46:19 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 51/52] qapi: Expose CPU topology info in query_cpus_fast
Date: Mon, 13 Feb 2023 17:50:34 +0800
Message-Id: <20230213095035.158240-52-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Zhao Liu <zhao1.liu@intel.com>

The topology type and core type are useful to users, so expose them
in query_cpus_fast.

Since the hybrid core is pre-set and does not support hotplug for
the entire core, the topology type and core type are not exposed in
query-hotpluggable-cpus.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-qmp-cmds.c | 11 +++++++++++
 hw/core/machine-topo.c     |  5 +++++
 include/hw/boards.h        |  5 +++++
 qapi/machine.json          | 19 +++++++++++++++++--
 4 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 44b5da888024..6be7148a8374 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -67,6 +67,17 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
             value->props = props;
         }
 
+        if (mc->cpu_index_to_core_type) {
+            CpuTopoInfo *topo;
+            const char *core_type;
+
+            topo = g_malloc0(sizeof(CpuTopoInfo));
+            topo->topo_type = machine_topo_get_type(ms);
+            core_type = mc->cpu_index_to_core_type(ms, cpu->cpu_index);
+            topo->core_type = g_strdup(core_type);
+            value->topo = topo;
+        }
+
         value->target = target;
         if (target == SYS_EMU_TARGET_S390X) {
             cpustate_to_cpuinfo_s390(&value->u.s390x, cpu);
diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index f38b8c683026..f0ff550a2519 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -177,6 +177,11 @@ unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
     return ms->topo.max_cpus / sockets;
 }
 
+CpuTopoType machine_topo_get_type(const MachineState *ms)
+{
+    return ms->topo.topo_type;
+}
+
 void machine_init_topology_default(MachineState *ms, bool smp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index c93bb1206244..d925e8af9ed6 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -239,6 +239,8 @@ typedef struct {
  *    purposes only.
  *    Applies only to default memory backend, i.e., explicit memory backend
  *    wasn't used.
+ * @cpu_index_to_core_type:
+ *    Return the core_type of specified CPU with @cpu_index.
  */
 struct MachineClass {
     /*< private >*/
@@ -305,6 +307,8 @@ struct MachineClass {
     const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
     int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
     ram_addr_t (*fixup_ram_size)(ram_addr_t size);
+    const char *(*cpu_index_to_core_type)(MachineState *machine,
+                                          unsigned cpu_index);
 };
 
 /**
@@ -496,5 +500,6 @@ unsigned int machine_topo_get_cores_by_idx(const MachineState *ms,
                                            unsigned int cpu_index);
 unsigned int machine_topo_get_cores_per_socket(const MachineState *ms);
 unsigned int machine_topo_get_threads_per_socket(const MachineState *ms);
+CpuTopoType machine_topo_get_type(const MachineState *ms);
 
 #endif
diff --git a/qapi/machine.json b/qapi/machine.json
index 931c6dea9819..e86778b7a777 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -40,7 +40,6 @@
 # @CpuTopoType:
 #
 # An enumeration of cpu topology type
-# TODO: Expose topology type in query-cpus-fast
 #
 # Since: 8.0
 ##
@@ -48,6 +47,21 @@
   'prefix': 'CPU_TOPO_TYPE',
   'data': [ 'smp', 'hybrid' ] }
 
+##
+# @CpuTopoInfo:
+#
+# Additional information about basic CPU topology
+#
+# @topo-type: the type of CPU topology
+#
+# @core-type: the type of CPU core
+#
+# Since: 8.0
+##
+{ 'struct' : 'CpuTopoInfo',
+  'data'   : { 'topo-type': 'CpuTopoType',
+               'core-type': 'str'} }
+
 ##
 # @CpuS390State:
 #
@@ -95,7 +109,8 @@
                       'qom-path'     : 'str',
                       'thread-id'    : 'int',
                       '*props'       : 'CpuInstanceProperties',
-                      'target'       : 'SysEmuTarget' },
+                      'target'       : 'SysEmuTarget',
+                      '*topo'         : 'CpuTopoInfo' },
   'discriminator' : 'target',
   'data'          : { 's390x'        : 'CpuInfoS390' } }
 
-- 
2.34.1


