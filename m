Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8D694208
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:55:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQW-0003Sc-Re; Mon, 13 Feb 2023 04:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQP-000372-A3
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:05 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQI-0002o2-Cr
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281618; x=1707817618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7NJLNBryoXSzXJiJoYo302BIRIEezDxIPG/22JmzpoE=;
 b=nWTC1UBOtCQYXpaPR0EDiE0Xp0E9sI+UNl+bOyCBTuBjroM3bGF+RMFY
 iBymcpU1ydvNYOBh16xUzYKnngYPUGPS4M2hQqjx3urmUVX6wtvoVClCI
 RrICkRNUEV+GGBV11RlCvPOL6jbApE13OLsK+xMytRpQnIhOeRtgbGHKx
 zWtsHXEA6SMkNAmpbCQpBOPtNGldOb0JWOPeSq5iy+bvyCT55FhOwwc2J
 AgJZFofmi+r82IThVNvLXtEah5hhlW79VbmsV/01SCDC+9iTbeEGIavLI
 W+yeD2eGPYz4W2/g3iiAO3Vhe9HS7ye+ZW65fuumhhINA1dNC5vjlzANh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487228"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487228"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760677"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760677"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:46:00 -0800
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
Subject: [RFC 46/52] hw/machine: build core level hybrid topology form
 HybridCorePack
Date: Mon, 13 Feb 2023 17:50:29 +0800
Message-Id: <20230213095035.158240-47-zhao1.liu@linux.intel.com>
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

After verifying the hybrid topology, we need to convert the topology
structure of the core level from a single linked list to an array,
so that we can make full use of the core-id to quickly access the
corresponding core.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-topo.c | 48 ++++++++++++++++++++++++++++++++----------
 hw/core/machine.c      |  1 +
 include/hw/boards.h    |  1 +
 3 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index 2cf71cc466aa..ebd2c40396a2 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -604,22 +604,13 @@ void set_hybrid_options(MachineState *ms,
 void machine_free_hybrid_topology(MachineState *ms)
 {
     HybridCluster *cluster;
-    HybridCorePack *core_pack;
-    HybridCorePack *tmp;
 
     if (ms->topo.hybrid.clusters) {
         for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
             cluster = &ms->topo.hybrid.cluster_list[i];
 
-            /*
-             * TODO: Temporarily free core_pack_list here. When the
-             * building of core_list array is supported, it will be
-             * freeed there.
-             */
-            QSLIST_FOREACH_SAFE(core_pack, &cluster->core_pack_list,
-                                node, tmp) {
-                QSLIST_REMOVE_HEAD(&cluster->core_pack_list, node);
-                g_free(core_pack);
+            if (cluster->core_list != NULL) {
+                g_free(cluster->core_list);
             }
         }
         g_free(ms->topo.hybrid.cluster_list);
@@ -751,3 +742,38 @@ void machine_validate_hybrid_topology(MachineState *ms, Error **errp)
         exit(1);
     }
 }
+
+void machine_consolidate_hybrid_topology(MachineState *ms)
+{
+    HybridCluster *cluster;
+    HybridCorePack *core_pack;
+    HybridCorePack *tmp;
+    int core_num;
+
+    for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
+        cluster = &ms->topo.hybrid.cluster_list[i];
+        cluster->core_list = g_malloc0(sizeof(HybridCore) * cluster->cores);
+
+        core_num = cluster->cores;
+        QSLIST_FOREACH_SAFE(core_pack, &cluster->core_pack_list, node, tmp) {
+            QSLIST_REMOVE_HEAD(&cluster->core_pack_list, node);
+
+            /*
+             * Here we add cores in "reverse order" because core_pack_list uses
+             * "QSLIST_INSERT_HEAD()" to collect the cores in the "-hybrid"
+             * command line in reverse order.
+             *
+             * The "reverse order" here can ensure that the growth of core-id
+             * is consistent with the order of adding cores in "-hybrid".
+             */
+            for (int j = 0; j < core_pack->core_num; j++) {
+                cluster->core_list[core_num - j - 1].core_type =
+                    core_pack->core.core_type;
+                cluster->core_list[core_num - j - 1].threads =
+                    core_pack->core.threads;
+            }
+            core_num -= core_pack->core_num;
+            g_free(core_pack);
+        }
+    }
+}
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 630934317e3c..08a0c117ce1b 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1329,6 +1329,7 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
 
     if (!machine_topo_is_smp(machine)) {
         machine_validate_hybrid_topology(machine, errp);
+        machine_consolidate_hybrid_topology(machine);
     }
 
     if (machine->memdev) {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 9156982e4de6..0f865c21e2a8 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -42,6 +42,7 @@ void set_hybrid_options(MachineState *ms,
                         Error **errp);
 void machine_free_hybrid_topology(MachineState *ms);
 void machine_validate_hybrid_topology(MachineState *ms, Error **errp);
+void machine_consolidate_hybrid_topology(MachineState *ms);
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
-- 
2.34.1


