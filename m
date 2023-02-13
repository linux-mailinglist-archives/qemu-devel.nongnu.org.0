Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C869421D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:58:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQR-000376-Fg; Mon, 13 Feb 2023 04:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQB-0002pq-Ka
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:51 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQ6-0002n2-Fw
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281606; x=1707817606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g1K5klHHTTwTv1FCc72EbH4ILWvTTsSMGOHgih3qbPo=;
 b=OTq7wemwdo8dQkHDQixOI5icRZ46EeRBHkLZlVLkbuqc770bKc8NjJ5l
 sLomQYRgTgqvYUOskkJDZqNbN18gFT2s6EpO43SN7lQset3ut8PzYDWMj
 jKqjol0p4aCJZEQjywvt5hAysNbetki5gKKVIuq25voiHlkKgcefJgosQ
 1V0dMBokqID+OEQ5ve8bPK1A+jYpNwVK11r1Pe9p4UcP54Ba3myv6XlNf
 okJmpTnJUO7dZgmsZ/iKwXunlQGUXdolIdtdYc1SsdND/bgkaXRFRgq2/
 G89pe17hYYF32PvBV59TUcCqjy1lLuCSYeOMzyqX87w9Gu/OcT/j88BfR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487198"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487198"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760666"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760666"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:53 -0800
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
Subject: [RFC 44/52] machine: Add "-hybrid" parsing rule
Date: Mon, 13 Feb 2023 17:50:27 +0800
Message-Id: <20230213095035.158240-45-zhao1.liu@linux.intel.com>
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

The "-hybrid" format is like:
-hybrid socket,sockets=n
-hybrid die,dies=n
-hybrid cluster,clusters=n
-hybrid core,cores=n,type=core_type[,threads=threads]
        [,clusterid=cluster]

For example:
-hybrid socket,sockets=1
-hybrid die,dies=1
-hybrid cluster,clusters=4
-hybrid core,cores=1,coretype="core",threads=2,clusterid=0-1
-hybrid core,cores=1,coretype="core",threads=2,clusterid=0-1,clusterid=3
-hybrid core,cores=4,coretype="atom",threads=1,clusterid=3

In order to support "-hybrid core" can be inserted into the specified
cluster, introduce HybridCorePack to pack HybridCore and help to parse
"-hybrid core" command. HybridCorePack will be used to build core level
topology later.

Since hybrid cpu topology allocates memory by g_malloc0(), free the
memory when machine finalizes.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-topo.c        | 259 ++++++++++++++++++++++++++++++++++
 hw/core/machine.c             |   4 +
 include/hw/boards.h           |   4 +
 include/hw/cpu/cpu-topology.h |  23 +++
 4 files changed, 290 insertions(+)

diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index 8540b473b8db..6e4a9ec1495d 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -366,3 +366,262 @@ int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype)
 
     return -1;
 }
+
+static void parse_hybrid_socket(MachineState *ms,
+                                const HybridSocketOptions *config,
+                                Error **errp)
+{
+    if (ms->topo.hybrid.sockets != 1) {
+        error_setg(errp, "socket cannot be set repeatedly");
+        return;
+    }
+
+    /*
+     * Since sockets = 0 is deprecated CPU topology for -smp,
+     * now -hybrid returns error directly.
+     */
+    if (!config->sockets) {
+        error_setg(errp, "Invalid sockets. sockets mustn't be zero");
+        return;
+    }
+
+    ms->topo.hybrid.sockets = config->sockets;
+
+    /*
+     * Even though we require that the "socket" must be set before the "core",
+     * in order to simplify the code logic, we do not check the order of the
+     * "socket" subcommand. Instead, multiply the "sockets" for the cpus and
+     * max_cpus here as a compensation measure.
+     */
+    ms->topo.cpus *= ms->topo.hybrid.sockets;
+    ms->topo.max_cpus *= ms->topo.hybrid.sockets;
+}
+
+static void parse_hybrid_die(MachineState *ms,
+                             const HybridDieOptions *config, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    if (ms->topo.hybrid.dies != 1) {
+        error_setg(errp, "die cannot be set repeatedly");
+        return;
+    }
+
+    /*
+     * Since dies = 0 is deprecated CPU topology for -smp,
+     * now -hybrid returns error directly.
+     */
+    if (!config->dies) {
+        error_setg(errp, "Invalid dies. dies mustn't be zero");
+        return;
+    }
+    if (!mc->topo_props.dies_supported && config->dies > 1) {
+        error_setg(errp, "dies not supported by this machine's CPU topology");
+        return;
+    }
+
+    ms->topo.hybrid.dies = config->dies;
+
+    /*
+     * Even though we require that the "die" must be set before the "core",
+     * in order to simplify the code logic, we do not check the order of the
+     * "die" subcommand. Instead, multiply the "dies" for the cpus and
+     * max_cpus here as a compensation measure.
+     */
+    ms->topo.cpus *= ms->topo.hybrid.dies;
+    ms->topo.max_cpus *= ms->topo.hybrid.dies;
+}
+
+static void parse_hybrid_cluster(MachineState *ms,
+                                 const HybridClusterOptions *config,
+                                 Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    if (ms->topo.hybrid.cluster_list != NULL) {
+        error_setg(errp, "The cluster configuration "
+                   "clusters=%" PRIu32 " should be provided before"
+                   "core configuration", config->clusters);
+        return;
+    }
+
+    /*
+     * Since clusters = 0 is deprecated CPU topology for -smp,
+     * now -hybrid returns error directly.
+     */
+    if (!config->clusters) {
+        error_setg(errp, "Invalid clusters. clusters mustn't be zero");
+        return;
+    }
+
+    if (!mc->topo_props.clusters_supported && config->clusters > 1) {
+        error_setg(errp, "clusters not supported by this "
+                   "machine's CPU topology");
+        return;
+    }
+
+    mc->topo_props.has_clusters = true;
+
+    ms->topo.hybrid.clusters = config->clusters;
+    ms->topo.hybrid.cluster_list = g_malloc0(sizeof(HybridCluster) *
+                                             ms->topo.hybrid.clusters);
+
+    for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
+        QSLIST_INIT(&ms->topo.hybrid.cluster_list[i].core_pack_list);
+    }
+}
+
+static void insert_core_into_cluster(MachineState *ms,
+                                     HybridCluster *cluster,
+                                     const HybridCoreOptions *config,
+                                     Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    HybridCorePack *core_pack;
+    int ret;
+
+    /*
+     * Since cores = 0 or threads = 0 is deprecated CPU topology for
+     * -smp, now -hybrid return error directly.
+     */
+    if (!config->cores) {
+        error_setg(errp, "Invalid cores. cores=%u mustn't be zero",
+                   config->cores);
+        return;
+    }
+    if (config->has_threads && !config->threads) {
+        error_setg(errp, "Invalid threads. threads=%u mustn't be zero",
+                   config->threads);
+        return;
+    }
+
+    core_pack = g_malloc0(sizeof(*core_pack));
+    core_pack->core_num = config->cores;
+    core_pack->core.threads = config->has_threads ? config->threads : 1;
+
+    ret = mc->core_type(ms, config->coretype);
+    if (!ret) {
+        error_setg(errp, "Invalid coretype=%s", config->coretype);
+    }
+    core_pack->core.core_type = ret;
+
+    QSLIST_INSERT_HEAD(&cluster->core_pack_list, core_pack, node);
+    cluster->cores += core_pack->core_num;
+
+    /*
+     * Note here we just multiply by "dies" and "sockets" other that
+     * "clusters".
+     *
+     * This function caculates cluster's topology one by one, and different
+     * cluster in the same die may have different topology. So we can't
+     * multiply by "clusters". But for current hybrid topology support, we
+     * suppose sockets and dies are same. So "sockets" and "dies" should be
+     * considerred.
+     */
+    ms->topo.cpus += core_pack->core.threads * core_pack->core_num *
+                     ms->topo.hybrid.dies * ms->topo.hybrid.sockets;
+    /*
+     * Because of the "-hybrid" format limitation, before all the cores are
+     * configured, the cpus and max_cpus cannot be obtained. At the same
+     * time, because of heterogeneous, if user wants to specify the online
+     * cpus, user must subdivide it into a specific core. So currently,
+     * temporarily limit max_cpus to be consistent with cpus.
+     *
+     * TODO: Consider adding more complete online cpus configuration support
+     * in the future.
+     */
+    ms->topo.max_cpus = ms->topo.cpus;
+}
+
+static void parse_hybrid_core(MachineState *ms,
+                              const HybridCoreOptions *config, Error **errp)
+{
+    if (!ms->topo.hybrid.cluster_list) {
+        if (config->has_clusterid) {
+            error_setg(errp, "The core configuration clusterid "
+                       "should be provided after"
+                       "cluster configuration");
+            return;
+        }
+        /* Set 1 cluster per die by default. */
+        ms->topo.hybrid.clusters = 1;
+        ms->topo.hybrid.cluster_list = g_malloc0(sizeof(HybridCluster) *
+                                                 ms->topo.hybrid.clusters);
+        QSLIST_INIT(&ms->topo.hybrid.cluster_list[0].core_pack_list);
+    }
+
+    if (config->has_clusterid) {
+        for (uint32List *clusterid = config->clusterid; clusterid;
+             clusterid = clusterid->next) {
+            if (clusterid->value >= ms->topo.hybrid.clusters) {
+                error_setg(errp, "Invalid clusterid. "
+                           "clusterid=%" PRIu32 " is out of range "
+                           "(only %" PRIu32 "clusters)",
+                           clusterid->value, ms->topo.hybrid.clusters);
+                return;
+            }
+            insert_core_into_cluster(ms,
+                &ms->topo.hybrid.cluster_list[clusterid->value], config, errp);
+        }
+    } else {
+        for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
+            insert_core_into_cluster(ms,
+                &ms->topo.hybrid.cluster_list[i], config, errp);
+        }
+    }
+}
+
+void set_hybrid_options(MachineState *ms,
+                        const HybridOptions *config,
+                        Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    if (!mc->topo_props.hybrid_supported) {
+        error_setg(errp, "hybrid topology not supported "
+                   "by this machine's CPU");
+        return;
+    }
+
+    switch (config->type) {
+    case HYBRID_OPTIONS_TYPE_SOCKET:
+        parse_hybrid_socket(ms, &config->u.socket, errp);
+        break;
+    case HYBRID_OPTIONS_TYPE_DIE:
+        parse_hybrid_die(ms, &config->u.die, errp);
+        break;
+    case HYBRID_OPTIONS_TYPE_CLUSTER:
+        parse_hybrid_cluster(ms, &config->u.cluster, errp);
+        break;
+    case HYBRID_OPTIONS_TYPE_CORE:
+        parse_hybrid_core(ms, &config->u.core, errp);
+        break;
+    default:
+        abort();
+    }
+}
+
+void machine_free_hybrid_topology(MachineState *ms)
+{
+    HybridCluster *cluster;
+    HybridCorePack *core_pack;
+    HybridCorePack *tmp;
+
+    if (ms->topo.hybrid.clusters) {
+        for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
+            cluster = &ms->topo.hybrid.cluster_list[i];
+
+            /*
+             * TODO: Temporarily free core_pack_list here. When the
+             * building of core_list array is supported, it will be
+             * freeed there.
+             */
+            QSLIST_FOREACH_SAFE(core_pack, &cluster->core_pack_list,
+                                node, tmp) {
+                QSLIST_REMOVE_HEAD(&cluster->core_pack_list, node);
+                g_free(core_pack);
+            }
+        }
+        g_free(ms->topo.hybrid.cluster_list);
+    }
+}
diff --git a/hw/core/machine.c b/hw/core/machine.c
index acc32b3be5f6..f2c6aac4ef94 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1122,6 +1122,10 @@ static void machine_finalize(Object *obj)
     g_free(ms->device_memory);
     g_free(ms->nvdimms_state);
     g_free(ms->numa_state);
+
+    if (!machine_topo_is_smp(ms)) {
+        machine_free_hybrid_topology(ms);
+    }
 }
 
 bool machine_usb(MachineState *machine)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 48444ab7275b..09b93c17a245 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -37,6 +37,10 @@ void machine_set_cpu_numa_node(MachineState *machine,
 void machine_parse_smp_config(MachineState *ms,
                               const SMPConfiguration *config, Error **errp);
 int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype);
+void set_hybrid_options(MachineState *ms,
+                        const HybridOptions *config,
+                        Error **errp);
+void machine_free_hybrid_topology(MachineState *ms);
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
diff --git a/include/hw/cpu/cpu-topology.h b/include/hw/cpu/cpu-topology.h
index 829f98d3a73f..eef752d5168d 100644
--- a/include/hw/cpu/cpu-topology.h
+++ b/include/hw/cpu/cpu-topology.h
@@ -52,15 +52,38 @@ typedef struct HybridCore {
     unsigned int core_type;
 } HybridCore;
 
+/**
+ * HybridCorePack - Wrapper of HybridCore to pack the same
+ *                  cores in one cluster.
+ *
+ * HybridCorePack is used for `-hybrid` parsing and will help to build
+ * core_list array.
+ *
+ * @core_num: the number of threads in one core.
+ * @core: the specific core information of current core pack.
+ * @node: the singly-linked list node of current core pack. This node
+ *        is added to the core_pack_list of a cluster which the current
+ *        core pack belongs to.
+ */
+typedef struct HybridCorePack {
+    unsigned int core_num;
+    HybridCore core;
+    QSLIST_ENTRY(HybridCorePack) node;
+} HybridCorePack;
+
 /**
  * HybridCluster - hybrid cluster topology defination:
  * @cores: the number of cores in current cluster.
  * @core_list: the array includes all the cores that belong to current
  *             cluster.
+ * @core_pack_list: the list that links all the core packs that belong to
+ *                  current cluster. It is used for `-hybrid` parsing and
+ *                  will help to build core_list array.
  */
 typedef struct HybridCluster {
     unsigned int cores;
     HybridCore *core_list;
+    QSLIST_HEAD(, HybridCorePack) core_pack_list;
 } HybridCluster;
 
 /**
-- 
2.34.1


