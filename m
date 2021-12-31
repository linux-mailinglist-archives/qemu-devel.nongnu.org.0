Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B164B48240D
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:55:54 +0100 (CET)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HRp-00061u-Qb
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:55:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLI-0006jA-8k
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLF-0000nr-GH
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCjuVcTQ882USvAWxyDE+kQvzyHlN9CrhkHSlEa88PU=;
 b=d3ffUxkNdjzX4e+c7+oBjq1rc4g78T6BpaVR9IULYegM3quhGEOL082n9O5gU29VI9DRg5
 X3mubTv1/snOZ03jSrYpZs7KHB0fDp2UY7lwoE2iluldf0lhBHD5/Zn2GpTUhV3Eqg9Cng
 lh15+sxcpzkxpL3NiUwa9+ET4uxJzoI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-BVDzD5f8NNOiAPcm1jf85g-1; Fri, 31 Dec 2021 07:49:02 -0500
X-MC-Unique: BVDzD5f8NNOiAPcm1jf85g-1
Received: by mail-wr1-f69.google.com with SMTP id
 s30-20020adfa29e000000b001a25caee635so7526837wra.19
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XCjuVcTQ882USvAWxyDE+kQvzyHlN9CrhkHSlEa88PU=;
 b=7g+aTj0hv38bL5Mq2kublYtqYutdfclQGNYRmFOgXKhdrAeFc7X9XUAgEoRn4qGDWy
 y6a+Sc6nSMaPXzTDE8iedR6ythUcv52Hvs5bdyfjJhJvGJiq6EqmOuBh2BQOX5vq4aF1
 bCp5rkjgmX1VjvCN6b6Xwb/4PcXwclUbHZf0dST/nVZ1tZ2P/sVr29Q/JgmCp2Rud3s0
 fOAfTzwFilrOFUOP1DT6i85IO00/NYcKY33aOg5ez3HSXlTMO+MI7QeIuMaHc/O7uv8/
 Pnp6xqPiA/o3C0tdjf9IPqNLtWXUmjsZFtdBz5A8mdsLgRmOReL5AscOlt9AA9yqIliV
 Qiqw==
X-Gm-Message-State: AOAM530qzzfW1hAz+iaYPcUMveengF0wMJYzyhsxQDu4sts3nsOV1R0i
 Wqp3L+KlM/sjiAPKiBGhI/xPnJ4q4XEI5YpG0D/Bhr1i+IcctGf63UsdbkJOcmtkIifg4LQGhkG
 Txb/kyxrESjtG6f0RL1pbEkzfIYagOaMnfWXln/TGG+N4s45E11MwvD3rsOCtlvQn
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr6677514wrw.310.1640954941186; 
 Fri, 31 Dec 2021 04:49:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMuznmFowzZ1h+S1ZeWEN3+iVQLWSKwyrbZ8HMnUgP/RVSfhjOhYbrTiwdRISEOt+j2Qn0OQ==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr6677498wrw.310.1640954940877; 
 Fri, 31 Dec 2021 04:49:00 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id m3sm26831117wrv.95.2021.12.31.04.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:49:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/20] tests/unit/test-smp-parse: Add testcases for CPU clusters
Date: Fri, 31 Dec 2021 13:47:49 +0100
Message-Id: <20211231124754.1005747-16-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Add testcases for parsing of the four-level CPU topology hierarchy,
ie sockets/clusters/cores/threads, which will be supported on ARM
virt machines.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211228092221.21068-5-wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 130 ++++++++++++++++++++++++++++++++++--
 1 file changed, 123 insertions(+), 7 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index b6df8137fcc..331719bbc4b 100644
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
2.33.1


