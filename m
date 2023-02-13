Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD1D6941EB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:50:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVOr-0000AQ-Gg; Mon, 13 Feb 2023 04:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOj-00086J-AL
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:21 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOc-0002kj-DT
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281514; x=1707817514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oKB6GgoCo/BzOtEhJhVfmhnZ7QnPb4S9n1ggdhgGhBQ=;
 b=h9oH22cUY6noSATxpocUOPN+BhExgOE2UoFJ/9m0o8q/1B6a4TyAsazG
 DGZErrPTsYs9mVRGU040iZB6f8E9x3TPKPRDmp217xi9Sp0t6E/vFA5gv
 iBC+mgDEKXfPIfWLQiK7diHL3manPxFXICumUmQYMwS2b8LAdDWLa2ejL
 9I7m1LxzTj/VlydvcPCguFswcf5pr8C7RxgmF5yWfuA7t/fKjmq53CR1m
 PYfWsCk4lcDEjjGDGzLcBjwqrx+ScLYcm6eUSL3we5Mc6XXBcDiOwFGkY
 JAQrqU63pk+gCPDMcwgcH74JWSABQXRungvqUjI8bGxg3DF7hQJA0ORIc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486804"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486804"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760579"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760579"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:48 -0800
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
Subject: [RFC 27/52] test/test-smp-parse: Check fields of MachineState.topo.smp
Date: Mon, 13 Feb 2023 17:50:10 +0800
Message-Id: <20230213095035.158240-28-zhao1.liu@linux.intel.com>
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

MachineState.smp is being replaced by MachineState.topo.smp, so test
MachineState.topo.smp fields parsing for smp command.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 tests/unit/test-smp-parse.c | 62 ++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index fdc39a846ca6..d6816f109084 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -41,10 +41,13 @@
 #define CPU_TOPOLOGY_GENERIC(a, b, c, d, e)                   \
         {                                                     \
             .cpus     = a,                                    \
-            .sockets  = b,                                    \
-            .cores    = c,                                    \
-            .threads  = d,                                    \
             .max_cpus = e,                                    \
+            .topo_type = CPU_TOPO_TYPE_SMP,                   \
+            .smp = {                                          \
+                .sockets  = b,                                \
+                .cores    = c,                                \
+                .threads  = d,                                \
+            }                                                 \
         }
 
 /*
@@ -406,8 +409,8 @@ static char *cpu_topology_to_string(const CpuTopology *topo)
         "    .threads  = %u,\n"
         "    .max_cpus = %u,\n"
         "}",
-        topo->cpus, topo->sockets, topo->dies, topo->clusters,
-        topo->cores, topo->threads, topo->max_cpus);
+        topo->cpus, topo->smp.sockets, topo->smp.dies, topo->smp.clusters,
+        topo->smp.cores, topo->smp.threads, topo->max_cpus);
 }
 
 static void check_parse(MachineState *ms, const SMPConfiguration *config,
@@ -422,18 +425,19 @@ static void check_parse(MachineState *ms, const SMPConfiguration *config,
     /* call the generic parser */
     machine_parse_smp_config(ms, config, &err);
 
-    output_topo_str = cpu_topology_to_string(&ms->smp);
+    output_topo_str = cpu_topology_to_string(&ms->topo);
 
     /* when the configuration is supposed to be valid */
     if (is_valid) {
         if ((err == NULL) &&
-            (ms->smp.cpus == expect_topo->cpus) &&
-            (ms->smp.sockets == expect_topo->sockets) &&
-            (ms->smp.dies == expect_topo->dies) &&
-            (ms->smp.clusters == expect_topo->clusters) &&
-            (ms->smp.cores == expect_topo->cores) &&
-            (ms->smp.threads == expect_topo->threads) &&
-            (ms->smp.max_cpus == expect_topo->max_cpus)) {
+            (machine_topo_is_smp(ms) == true) &&
+            (machine_topo_get_cpus(ms) == expect_topo->cpus) &&
+            (machine_topo_get_sockets(ms) == expect_topo->smp.sockets) &&
+            (machine_topo_get_dies(ms) == expect_topo->smp.dies) &&
+            (machine_topo_get_clusters(ms) == expect_topo->smp.clusters) &&
+            (machine_topo_get_smp_cores(ms) == expect_topo->smp.cores) &&
+            (machine_topo_get_smp_threads(ms) == expect_topo->smp.threads) &&
+            (machine_topo_get_max_cpus(ms) == expect_topo->max_cpus)) {
             return;
         }
 
@@ -509,13 +513,13 @@ static void smp_parse_test(MachineState *ms, SMPTestData *data, bool is_valid)
 static void unsupported_params_init(const MachineClass *mc, SMPTestData *data)
 {
     if (!mc->smp_props.dies_supported) {
-        data->expect_prefer_sockets.dies = 1;
-        data->expect_prefer_cores.dies = 1;
+        data->expect_prefer_sockets.smp.dies = 1;
+        data->expect_prefer_cores.smp.dies = 1;
     }
 
     if (!mc->smp_props.clusters_supported) {
-        data->expect_prefer_sockets.clusters = 1;
-        data->expect_prefer_cores.clusters = 1;
+        data->expect_prefer_sockets.smp.clusters = 1;
+        data->expect_prefer_cores.smp.clusters = 1;
     }
 }
 
@@ -529,6 +533,13 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
+static void machine_smp_topo_initfn(Object *obj)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->topo.topo_type = CPU_TOPO_TYPE_SMP;
+}
+
 static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -610,8 +621,8 @@ static void test_with_dies(const void *opaque)
         unsupported_params_init(mc, &data);
 
         /* when dies parameter is omitted, it will be set as 1 */
-        data.expect_prefer_sockets.dies = 1;
-        data.expect_prefer_cores.dies = 1;
+        data.expect_prefer_sockets.smp.dies = 1;
+        data.expect_prefer_cores.smp.dies = 1;
 
         smp_parse_test(ms, &data, true);
 
@@ -625,10 +636,10 @@ static void test_with_dies(const void *opaque)
             data.config.maxcpus *= num_dies;
         }
 
-        data.expect_prefer_sockets.dies = num_dies;
+        data.expect_prefer_sockets.smp.dies = num_dies;
         data.expect_prefer_sockets.cpus *= num_dies;
         data.expect_prefer_sockets.max_cpus *= num_dies;
-        data.expect_prefer_cores.dies = num_dies;
+        data.expect_prefer_cores.smp.dies = num_dies;
         data.expect_prefer_cores.cpus *= num_dies;
         data.expect_prefer_cores.max_cpus *= num_dies;
 
@@ -660,8 +671,8 @@ static void test_with_clusters(const void *opaque)
         unsupported_params_init(mc, &data);
 
         /* when clusters parameter is omitted, it will be set as 1 */
-        data.expect_prefer_sockets.clusters = 1;
-        data.expect_prefer_cores.clusters = 1;
+        data.expect_prefer_sockets.smp.clusters = 1;
+        data.expect_prefer_cores.smp.clusters = 1;
 
         smp_parse_test(ms, &data, true);
 
@@ -675,10 +686,10 @@ static void test_with_clusters(const void *opaque)
             data.config.maxcpus *= num_clusters;
         }
 
-        data.expect_prefer_sockets.clusters = num_clusters;
+        data.expect_prefer_sockets.smp.clusters = num_clusters;
         data.expect_prefer_sockets.cpus *= num_clusters;
         data.expect_prefer_sockets.max_cpus *= num_clusters;
-        data.expect_prefer_cores.clusters = num_clusters;
+        data.expect_prefer_cores.smp.clusters = num_clusters;
         data.expect_prefer_cores.cpus *= num_clusters;
         data.expect_prefer_cores.max_cpus *= num_clusters;
 
@@ -704,6 +715,7 @@ static const TypeInfo smp_machine_types[] = {
         .class_init     = machine_base_class_init,
         .class_size     = sizeof(MachineClass),
         .instance_size  = sizeof(MachineState),
+        .instance_init  = machine_smp_topo_initfn,
     }, {
         .name           = MACHINE_TYPE_NAME("smp-generic-valid"),
         .parent         = TYPE_MACHINE,
-- 
2.34.1


