Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C272694215
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:57:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNA-0003qJ-KD; Mon, 13 Feb 2023 04:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVN2-0003kg-6H
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:36 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMw-0002ea-QW
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281410; x=1707817410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eduXy6aAvN9CnJvzl28ZwonbiXCbTv+ZAhjbz4nyVU0=;
 b=FeSsPDz6SHlsEui7vxqbi75g7iXopgBOwMQcqmEnb3sIqdINsJdK/POB
 8xRyyHJ7GjxhncZqIJCrBkr9NoTww2QgkBy1FRw8DW0qGg+lhda0mraa1
 V4Sv1seaBp5xdUYD4UiVXhbBkVGu53WNGow+ITNn2gdttns9JXcdPjaTK
 gwogAtlugMr2jxF1kn3wUxk4kYFBxy6E1QkdO/dlg2OtzDxt6ghLQf0Ba
 zihA2diaCbxKcurAOohgyIILk4OKmmjAaehwIv1RXxhmPy5/BAOlH+W9R
 cbv64TLd2wbYfzNku3niK1b+v1fWbNNZZ8p6I7LY+/GHXuT+99WW1zU8w w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486418"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486418"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759823"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759823"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:25 -0800
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
Subject: [RFC 07/52] hw/core/machine: Add the new topology support in
 MachineState
Date: Mon, 13 Feb 2023 17:49:50 +0800
Message-Id: <20230213095035.158240-8-zhao1.liu@linux.intel.com>
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

Add MachineState.topo to represent CPU topology, and initialize this
field as smp topology.

Also collect topology information from MachineState.topo in
machine_get_smp().

Additionally, check the validity of MachineState.topo instead of
MachineState.smp.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-topo.c | 26 +++++++++++++++++---------
 hw/core/machine.c      | 23 ++++++++++++++++-------
 include/hw/boards.h    |  2 ++
 3 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index 8066d2c46bef..7223f73f99b0 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -31,18 +31,18 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     GString *s = g_string_new(NULL);
 
-    g_string_append_printf(s, "sockets (%u)", ms->smp.sockets);
+    g_string_append_printf(s, "sockets (%u)", ms->topo.smp.sockets);
 
     if (mc->smp_props.dies_supported) {
-        g_string_append_printf(s, " * dies (%u)", ms->smp.dies);
+        g_string_append_printf(s, " * dies (%u)", ms->topo.smp.dies);
     }
 
     if (mc->smp_props.clusters_supported) {
-        g_string_append_printf(s, " * clusters (%u)", ms->smp.clusters);
+        g_string_append_printf(s, " * clusters (%u)", ms->topo.smp.clusters);
     }
 
-    g_string_append_printf(s, " * cores (%u)", ms->smp.cores);
-    g_string_append_printf(s, " * threads (%u)", ms->smp.threads);
+    g_string_append_printf(s, " * cores (%u)", ms->topo.smp.cores);
+    g_string_append_printf(s, " * threads (%u)", ms->topo.smp.threads);
 
     return g_string_free(s, false);
 }
@@ -159,6 +159,14 @@ void machine_parse_smp_config(MachineState *ms,
     ms->smp.threads = threads;
     ms->smp.max_cpus = maxcpus;
 
+    ms->topo.cpus = cpus;
+    ms->topo.max_cpus = maxcpus;
+    ms->topo.smp.sockets = sockets;
+    ms->topo.smp.dies = dies;
+    ms->topo.smp.clusters = clusters;
+    ms->topo.smp.cores = cores;
+    ms->topo.smp.threads = threads;
+
     mc->smp_props.has_clusters = config->has_clusters;
 
     /* sanity-check of the computed topology */
@@ -180,18 +188,18 @@ void machine_parse_smp_config(MachineState *ms,
         return;
     }
 
-    if (ms->smp.cpus < mc->min_cpus) {
+    if (ms->topo.cpus < mc->min_cpus) {
         error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
                    "supported by machine '%s' is %d",
-                   ms->smp.cpus,
+                   ms->topo.cpus,
                    mc->name, mc->min_cpus);
         return;
     }
 
-    if (ms->smp.max_cpus > mc->max_cpus) {
+    if (ms->topo.max_cpus > mc->max_cpus) {
         error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
                    "supported by machine '%s' is %d",
-                   ms->smp.max_cpus,
+                   ms->topo.max_cpus,
                    mc->name, mc->max_cpus);
         return;
     }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f73fc4c45c41..56e796c18873 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -829,13 +829,13 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
 {
     MachineState *ms = MACHINE(obj);
     SMPConfiguration *config = &(SMPConfiguration){
-        .has_cpus = true, .cpus = ms->smp.cpus,
-        .has_sockets = true, .sockets = ms->smp.sockets,
-        .has_dies = true, .dies = ms->smp.dies,
-        .has_clusters = true, .clusters = ms->smp.clusters,
-        .has_cores = true, .cores = ms->smp.cores,
-        .has_threads = true, .threads = ms->smp.threads,
-        .has_maxcpus = true, .maxcpus = ms->smp.max_cpus,
+        .has_cpus = true, .cpus = ms->topo.cpus,
+        .has_sockets = true, .sockets = ms->topo.smp.sockets,
+        .has_dies = true, .dies = ms->topo.smp.dies,
+        .has_clusters = true, .clusters = ms->topo.smp.clusters,
+        .has_cores = true, .cores = ms->topo.smp.cores,
+        .has_threads = true, .threads = ms->topo.smp.threads,
+        .has_maxcpus = true, .maxcpus = ms->topo.max_cpus,
     };
 
     if (!visit_type_SMPConfiguration(v, name, &config, &error_abort)) {
@@ -1101,6 +1101,15 @@ static void machine_initfn(Object *obj)
     ms->smp.cores = 1;
     ms->smp.threads = 1;
 
+    ms->topo.cpus = mc->default_cpus;
+    ms->topo.max_cpus = mc->default_cpus;
+    ms->topo.topo_type = CPU_TOPO_TYPE_SMP;
+    ms->topo.smp.sockets = 1;
+    ms->topo.smp.dies = 1;
+    ms->topo.smp.clusters = 1;
+    ms->topo.smp.cores = 1;
+    ms->topo.smp.threads = 1;
+
     machine_copy_boot_config(ms, &(BootConfiguration){ 0 });
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 6fbbfd56c808..0a61855499e3 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -10,6 +10,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "hw/core/cpu.h"
+#include "hw/cpu/cpu-topology.h"
 
 #define TYPE_MACHINE_SUFFIX "-machine"
 
@@ -360,6 +361,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
+    GeneralCpuTopology topo; /* TODO: Completely replace MachineState.smp */
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
-- 
2.34.1


