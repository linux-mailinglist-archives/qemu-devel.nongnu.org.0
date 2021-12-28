Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC34807C9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 10:25:09 +0100 (CET)
Received: from localhost ([::1]:40570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n28jE-00023N-HE
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 04:25:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h2-0007cG-DF; Tue, 28 Dec 2021 04:22:52 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28gz-000794-Q3; Tue, 28 Dec 2021 04:22:52 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JNTZ60H9Jz9rvl;
 Tue, 28 Dec 2021 17:21:50 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:22:44 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 04/14] tests/unit/test-smp-parse: Add testcases for CPU
 clusters
Date: Tue, 28 Dec 2021 17:22:11 +0800
Message-ID: <20211228092221.21068-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211228092221.21068-1-wangyanan55@huawei.com>
References: <20211228092221.21068-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-devel@nongnu.org>

Add testcases for parsing of the four-level CPU topology hierarchy,
ie sockets/clusters/cores/threads, which will be supported on ARM
virt machines.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/unit/test-smp-parse.c | 130 ++++++++++++++++++++++++++++++++++--
 1 file changed, 123 insertions(+), 7 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index b6df8137fc..331719bbc4 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -61,6 +61,20 @@
             .has_maxcpus = hf, .maxcpus = f,                  \
         }
 
+/*
+ * Currently a 4-level topology hierarchy is supported on ARM virt machines
+ *  -sockets/clusters/cores/threads
+ */
+#define SMP_CONFIG_WITH_CLUSTERS(ha, a, hb, b, hc, c, hd, d, he, e, hf, f) \
+        {                                                     \
+            .has_cpus     = ha, .cpus     = a,                \
+            .has_sockets  = hb, .sockets  = b,                \
+            .has_clusters = hc, .clusters = c,                \
+            .has_cores    = hd, .cores    = d,                \
+            .has_threads  = he, .threads  = e,                \
+            .has_maxcpus  = hf, .maxcpus  = f,                \
+        }
+
 /**
  * @config - the given SMP configuration
  * @expect_prefer_sockets - the expected parsing result for the
@@ -290,6 +304,10 @@ static const struct SMPTestData data_generic_invalid[] = {
         /* config: -smp 2,dies=2 */
         .config = SMP_CONFIG_WITH_DIES(T, 2, F, 0, T, 2, F, 0, F, 0, F, 0),
         .expect_error = "dies not supported by this machine's CPU topology",
+    }, {
+        /* config: -smp 2,clusters=2 */
+        .config = SMP_CONFIG_WITH_CLUSTERS(T, 2, F, 0, T, 2, F, 0, F, 0, F, 0),
+        .expect_error = "clusters not supported by this machine's CPU topology",
     }, {
         /* config: -smp 8,sockets=2,cores=4,threads=2,maxcpus=8 */
         .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, T, 2, T, 8),
@@ -337,20 +355,40 @@ static const struct SMPTestData data_with_dies_invalid[] = {
     },
 };
 
+static const struct SMPTestData data_with_clusters_invalid[] = {
+    {
+        /* config: -smp 16,sockets=2,clusters=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_CLUSTERS(T, 16, T, 2, T, 2, T, 4, T, 2, T, 16),
+        .expect_error = "Invalid CPU topology: "
+                        "product of the hierarchy must match maxcpus: "
+                        "sockets (2) * clusters (2) * cores (4) * threads (2) "
+                        "!= maxcpus (16)",
+    }, {
+        /* config: -smp 34,sockets=2,clusters=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_CLUSTERS(T, 34, T, 2, T, 2, T, 4, T, 2, T, 32),
+        .expect_error = "Invalid CPU topology: "
+                        "maxcpus must be equal to or greater than smp: "
+                        "sockets (2) * clusters (2) * cores (4) * threads (2) "
+                        "== maxcpus (32) < smp_cpus (34)",
+    },
+};
+
 static char *smp_config_to_string(const SMPConfiguration *config)
 {
     return g_strdup_printf(
         "(SMPConfiguration) {\n"
-        "    .has_cpus    = %5s, cpus    = %" PRId64 ",\n"
-        "    .has_sockets = %5s, sockets = %" PRId64 ",\n"
-        "    .has_dies    = %5s, dies    = %" PRId64 ",\n"
-        "    .has_cores   = %5s, cores   = %" PRId64 ",\n"
-        "    .has_threads = %5s, threads = %" PRId64 ",\n"
-        "    .has_maxcpus = %5s, maxcpus = %" PRId64 ",\n"
+        "    .has_cpus     = %5s, cpus     = %" PRId64 ",\n"
+        "    .has_sockets  = %5s, sockets  = %" PRId64 ",\n"
+        "    .has_dies     = %5s, dies     = %" PRId64 ",\n"
+        "    .has_clusters = %5s, clusters = %" PRId64 ",\n"
+        "    .has_cores    = %5s, cores    = %" PRId64 ",\n"
+        "    .has_threads  = %5s, threads  = %" PRId64 ",\n"
+        "    .has_maxcpus  = %5s, maxcpus  = %" PRId64 ",\n"
         "}",
         config->has_cpus ? "true" : "false", config->cpus,
         config->has_sockets ? "true" : "false", config->sockets,
         config->has_dies ? "true" : "false", config->dies,
+        config->has_clusters ? "true" : "false", config->clusters,
         config->has_cores ? "true" : "false", config->cores,
         config->has_threads ? "true" : "false", config->threads,
         config->has_maxcpus ? "true" : "false", config->maxcpus);
@@ -363,11 +401,12 @@ static char *cpu_topology_to_string(const CpuTopology *topo)
         "    .cpus     = %u,\n"
         "    .sockets  = %u,\n"
         "    .dies     = %u,\n"
+        "    .clusters = %u,\n"
         "    .cores    = %u,\n"
         "    .threads  = %u,\n"
         "    .max_cpus = %u,\n"
         "}",
-        topo->cpus, topo->sockets, topo->dies,
+        topo->cpus, topo->sockets, topo->dies, topo->clusters,
         topo->cores, topo->threads, topo->max_cpus);
 }
 
@@ -391,6 +430,7 @@ static void check_parse(MachineState *ms, const SMPConfiguration *config,
             (ms->smp.cpus == expect_topo->cpus) &&
             (ms->smp.sockets == expect_topo->sockets) &&
             (ms->smp.dies == expect_topo->dies) &&
+            (ms->smp.clusters == expect_topo->clusters) &&
             (ms->smp.cores == expect_topo->cores) &&
             (ms->smp.threads == expect_topo->threads) &&
             (ms->smp.max_cpus == expect_topo->max_cpus)) {
@@ -472,6 +512,11 @@ static void unsupported_params_init(const MachineClass *mc, SMPTestData *data)
         data->expect_prefer_sockets.dies = 1;
         data->expect_prefer_cores.dies = 1;
     }
+
+    if (!mc->smp_props.clusters_supported) {
+        data->expect_prefer_sockets.clusters = 1;
+        data->expect_prefer_cores.clusters = 1;
+    }
 }
 
 static void machine_base_class_init(ObjectClass *oc, void *data)
@@ -491,6 +536,7 @@ static void machine_generic_valid_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
 
     mc->smp_props.dies_supported = false;
+    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
@@ -502,6 +548,7 @@ static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 511;
 
     mc->smp_props.dies_supported = false;
+    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_with_dies_class_init(ObjectClass *oc, void *data)
@@ -512,6 +559,18 @@ static void machine_with_dies_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
 
     mc->smp_props.dies_supported = true;
+    mc->smp_props.clusters_supported = false;
+}
+
+static void machine_with_clusters_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->min_cpus = MIN_CPUS;
+    mc->max_cpus = MAX_CPUS;
+
+    mc->smp_props.clusters_supported = true;
+    mc->smp_props.dies_supported = false;
 }
 
 static void test_generic_valid(const void *opaque)
@@ -607,6 +666,56 @@ static void test_with_dies(const void *opaque)
     object_unref(obj);
 }
 
+static void test_with_clusters(const void *opaque)
+{
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData data = {};
+    unsigned int num_clusters = 2;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
+        data = data_generic_valid[i];
+        unsupported_params_init(mc, &data);
+
+        /* when clusters parameter is omitted, it will be set as 1 */
+        data.expect_prefer_sockets.clusters = 1;
+        data.expect_prefer_cores.clusters = 1;
+
+        smp_parse_test(ms, &data, true);
+
+        /* when clusters parameter is specified */
+        data.config.has_clusters = true;
+        data.config.clusters = num_clusters;
+        if (data.config.has_cpus) {
+            data.config.cpus *= num_clusters;
+        }
+        if (data.config.has_maxcpus) {
+            data.config.maxcpus *= num_clusters;
+        }
+
+        data.expect_prefer_sockets.clusters = num_clusters;
+        data.expect_prefer_sockets.cpus *= num_clusters;
+        data.expect_prefer_sockets.max_cpus *= num_clusters;
+        data.expect_prefer_cores.clusters = num_clusters;
+        data.expect_prefer_cores.cpus *= num_clusters;
+        data.expect_prefer_cores.max_cpus *= num_clusters;
+
+        smp_parse_test(ms, &data, true);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(data_with_clusters_invalid); i++) {
+        data = data_with_clusters_invalid[i];
+        unsupported_params_init(mc, &data);
+
+        smp_parse_test(ms, &data, false);
+    }
+
+    object_unref(obj);
+}
+
 /* Type info of the tested machine */
 static const TypeInfo smp_machine_types[] = {
     {
@@ -628,6 +737,10 @@ static const TypeInfo smp_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("smp-with-dies"),
         .parent         = TYPE_MACHINE,
         .class_init     = machine_with_dies_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("smp-with-clusters"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = machine_with_clusters_class_init,
     }
 };
 
@@ -648,6 +761,9 @@ int main(int argc, char *argv[])
     g_test_add_data_func("/test-smp-parse/with_dies",
                          MACHINE_TYPE_NAME("smp-with-dies"),
                          test_with_dies);
+    g_test_add_data_func("/test-smp-parse/with_clusters",
+                         MACHINE_TYPE_NAME("smp-with-clusters"),
+                         test_with_clusters);
 
     g_test_run();
 
-- 
2.27.0


