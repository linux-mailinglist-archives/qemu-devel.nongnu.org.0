Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494269421A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:57:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQR-00037c-PU; Mon, 13 Feb 2023 04:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQG-00030C-Cp
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:56 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQB-0002kj-It
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281611; x=1707817611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wj/bN6Hc9fsYvCcuqfm9P/uTyrkzAnjA3UY9VV1x6r4=;
 b=MXXeQfyiWWO/tNcna32A/64AG9+mnAq3R/+mOYc7epSAEM+C7N21RAbk
 ndIZkrS2Nh/RMTtXXvwFleB1PGBSAhFXigVjDXAykLsnDJ8mwE1Bafc4A
 NCTP4/b4YDyv8DFd/+jVpvRwF426W+L3znvxcbdxMXm/esW9NqXRSl3D7
 paLxDc0293GmF/SvWQR8pi6S+n8ifHbc2IdrRfnY+STxfJfuvm8b1oxZQ
 5RVDophlh2AcYoXPm6F40Yk57qXsNXuEXj5579YwekkaMNoDHVYOP32Ik
 RibbGbZYp761aOhu8bzVd/3sCLzMrVQQ87k5If3+D6UH3EJ8ZZttV7L/E Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487210"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487210"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760672"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760672"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:57 -0800
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
Subject: [RFC 45/52] hw/machine: Add hybrid cpu topology validation
Date: Mon, 13 Feb 2023 17:50:28 +0800
Message-Id: <20230213095035.158240-46-zhao1.liu@linux.intel.com>
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

Because of the "-hybrid" format, in the process of parsing the command
line, we cannot know exactly the complete topology details until all the
hybrid commands have been parsed, so we cannot verify the hybrid
topology during the parsing process.

Thus validate the hybrid topology before machine running. At this moment,
the hybrid topology must have been parsed.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-topo.c | 126 +++++++++++++++++++++++++++++++++++++++++
 hw/core/machine.c      |   4 ++
 include/hw/boards.h    |   1 +
 3 files changed, 131 insertions(+)

diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index 6e4a9ec1495d..2cf71cc466aa 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -625,3 +625,129 @@ void machine_free_hybrid_topology(MachineState *ms)
         g_free(ms->topo.hybrid.cluster_list);
     }
 }
+
+/*
+ * Report information of a machine's supported CPU hybrid topology
+ * hierarchy. Topology members will be ordered in the string as:
+ * sockets (%u) * dies (%u) * ( cluster0:[ core0:[ cores (type: %s, %u) *
+ * threads (%u) ] + ... + core_n:[ cores (type: %s, %u) * threads (%u) ] ] +
+ * ... + cluster_m:[ core0:[ cores (type: %s, %u) * threads (%u) ] + ... +
+ * core_m:[ cores (type: %s, %u) * threads (%u)) ] ].
+ */
+static char *hybrid_cpu_hierarchy_to_string(MachineState *ms)
+{
+    HybridCluster *cluster;
+    HybridCorePack *core_pack;
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    GString *s = g_string_new(NULL);
+
+    g_string_append_printf(s, "sockets (%u)", ms->topo.hybrid.sockets);
+
+    if (mc->topo_props.dies_supported) {
+        g_string_append_printf(s, " * dies (%u)", ms->topo.hybrid.dies);
+    }
+
+    if (ms->topo.hybrid.cluster_list != NULL) {
+        g_string_append_printf(s, " * ( ");
+        for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
+            if (i) {
+                g_string_append_printf(s, " + ");
+            }
+            if (mc->topo_props.clusters_supported) {
+                g_string_append_printf(s, "cluster%u ", i);
+            }
+            if (ms->topo.hybrid.cluster_list[i].cores) {
+                int core_idx = 0;
+                cluster = &ms->topo.hybrid.cluster_list[i];
+
+                QSLIST_FOREACH(core_pack, &cluster->core_pack_list, node) {
+                    if (!core_idx) {
+                        g_string_append_printf(
+                            s, "%s ",
+                            mc->topo_props.clusters_supported ?
+                            ":[" : "[");
+                    } else {
+                        g_string_append_printf(s, " + ");
+                    }
+                    g_string_append_printf(
+                        s, "core%u:[ cores (type: %u, "
+                        "num: %u) * threads (%u) ]",
+                        core_idx++, core_pack->core.core_type,
+                        core_pack->core_num, core_pack->core.threads);
+                }
+                if (mc->topo_props.clusters_supported) {
+                    g_string_append_printf(s, " ] ");
+                }
+            }
+        }
+        g_string_append_printf(s, " )");
+    }
+
+    return g_string_free(s, false);
+}
+
+void machine_validate_hybrid_topology(MachineState *ms, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    HybridCluster *cluster;
+
+    if (ms->topo.max_cpus == 0) {
+        /*
+         * Cores are not set, and maybe clusters are also not set.
+         * At present, since the coretype cannot be omitted, the core
+         * level must be specified.
+         *
+         * TODO: Support coretype and core level can be omitted.
+         */
+        g_autofree char *topo_msg = hybrid_cpu_hierarchy_to_string(ms);
+        error_setg(errp, "Invalid hybrid CPU topology: Lack "
+                   "of core configuration, unable to generate "
+                   "valid topology: %s", topo_msg);
+        exit(1);
+    } else {
+        /*
+         * Though currently max_cpus equals to cpus, still check cpus here
+         * as the complete code logic.
+         *
+         * TODO: Consider adding more complete online cpus configuration
+         * support in the future.
+         *
+         * Since cpus = 0 is deprecated CPU topology for smp, now -hybrid
+         * returns error directly.
+         */
+        if (ms->topo.cpus == 0) {
+            error_setg(errp, "Must set at least one cpu online");
+            exit(1);
+        }
+    }
+
+    /* Each cluster need at least one core. */
+    for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
+        cluster = &ms->topo.hybrid.cluster_list[i];
+
+        if (!cluster->cores) {
+            g_autofree char *topo_msg = hybrid_cpu_hierarchy_to_string(ms);
+            error_setg(errp, "Invalid hybrid CPU topology: no core is "
+                       "specified for cluster (id: %d), unable to "
+                       "generate valid topology: %s",
+                       i, topo_msg);
+            exit(1);
+        }
+    }
+
+    if (ms->topo.cpus < mc->min_cpus) {
+        g_autofree char *topo_msg = hybrid_cpu_hierarchy_to_string(ms);
+        error_setg(errp, "Invalid Hybrid CPUs %d. The min CPUs "
+                   "supported by machine '%s' is %d. Topology: %s",
+                   ms->topo.cpus, mc->name, mc->min_cpus, topo_msg);
+        exit(1);
+    }
+
+    if (ms->topo.max_cpus > mc->max_cpus) {
+        g_autofree char *topo_msg = hybrid_cpu_hierarchy_to_string(ms);
+        error_setg(errp, "Invalid Hybrid CPUs %d. The max CPUs "
+                   "supported by machine '%s' is %d. Topology: %s",
+                   ms->topo.max_cpus, mc->name, mc->max_cpus, topo_msg);
+        exit(1);
+    }
+}
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f2c6aac4ef94..630934317e3c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1327,6 +1327,10 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
         }
     }
 
+    if (!machine_topo_is_smp(machine)) {
+        machine_validate_hybrid_topology(machine, errp);
+    }
+
     if (machine->memdev) {
         ram_addr_t backend_size = object_property_get_uint(OBJECT(machine->memdev),
                                                            "size",  &error_abort);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 09b93c17a245..9156982e4de6 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -41,6 +41,7 @@ void set_hybrid_options(MachineState *ms,
                         const HybridOptions *config,
                         Error **errp);
 void machine_free_hybrid_topology(MachineState *ms);
+void machine_validate_hybrid_topology(MachineState *ms, Error **errp);
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
-- 
2.34.1


