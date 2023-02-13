Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF9694143
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:33:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRV9a-0005fy-EE; Mon, 13 Feb 2023 04:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRV9Y-0005fp-TF
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:29:40 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRV9X-0006TH-9s
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676280579; x=1707816579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZCPVTglqTWHh9tmwzxjZ8ECKho/SBNd5BkeIKrK8rCs=;
 b=IYc3v/q1fKaD4zjaedTD9R0RmzfDBm3nVH8u1Mm6MqQZUct5Jm4bE50I
 am7uhrKN57m7fVb5APjRB3ZnerUdf/9Qikq43XKgJA5cCGW9biU5qum+5
 q/wU8s6L71BpC1wljRY4Pir7KbLqZbxm2RaMuPA5BOb3YIdFG+VRY3nO6
 UuXSK6459LwRfSOLD/WLaBJjlBt7lt/6kFmVfxK5oehzwE85jKsZ3kbfP
 Ap/VnC7jyFCMFTeRGCI8eZ1m0tpCqyrahcM8byzllfwodW1FUImBeUH6y
 AakZpdjg3qOfhLO8hcLMsri85tb9f+urIucF9y3ylra8oZKrz8t17DJXk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="318875741"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="318875741"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:29:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="792660203"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="792660203"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 01:29:32 -0800
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
 Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH RESEND 10/18] i386: Update APIC ID parsing rule to support
 module level
Date: Mon, 13 Feb 2023 17:36:17 +0800
Message-Id: <20230213093625.158170-11-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhuocheng Ding <zhuocheng.ding@intel.com>

Add the module level parsing support for APIC ID.

With this support, now the conversion between X86CPUTopoIDs,
X86CPUTopoInfo and APIC ID is completed.

Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Co-developed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c              | 19 ++++++++-----------
 include/hw/i386/topology.h | 36 ++++++++++++++++++------------------
 2 files changed, 26 insertions(+), 29 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b90c6584930a..2a9d080a8e7a 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -311,11 +311,11 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
 
     /*
      * If APIC ID is not set,
-     * set it based on socket/die/core/thread properties.
+     * set it based on socket/die/cluster/core/thread properties.
      */
     if (cpu->apic_id == UNASSIGNED_APIC_ID) {
-        int max_socket = (ms->smp.max_cpus - 1) /
-                                smp_threads / smp_cores / ms->smp.dies;
+        int max_socket = (ms->smp.max_cpus - 1) / smp_threads / smp_cores /
+                                ms->smp.clusters / ms->smp.dies;
 
         /*
          * die-id was optional in QEMU 4.0 and older, so keep it optional
@@ -379,15 +379,12 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
 
         x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
 
-        /*
-         * TODO: Before APIC ID supports module level parsing, there's no need
-         * to expose module_id info.
-         */
         error_setg(errp,
-            "Invalid CPU [socket: %u, die: %u, core: %u, thread: %u] with"
-            " APIC ID %" PRIu32 ", valid index range 0:%d",
-            topo_ids.pkg_id, topo_ids.die_id, topo_ids.core_id, topo_ids.smt_id,
-            cpu->apic_id, ms->possible_cpus->len - 1);
+            "Invalid CPU [socket: %u, die: %u, module: %u, core: %u, thread: %u]"
+            " with APIC ID %" PRIu32 ", valid index range 0:%d",
+            topo_ids.pkg_id, topo_ids.die_id, topo_ids.module_id,
+            topo_ids.core_id, topo_ids.smt_id, cpu->apic_id,
+            ms->possible_cpus->len - 1);
         return;
     }
 
diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
index 5de905dc00d3..3cec97b377f2 100644
--- a/include/hw/i386/topology.h
+++ b/include/hw/i386/topology.h
@@ -79,12 +79,13 @@ static inline unsigned apicid_smt_width(X86CPUTopoInfo *topo_info)
 /* Bit width of the Core_ID field */
 static inline unsigned apicid_core_width(X86CPUTopoInfo *topo_info)
 {
-    /*
-     * TODO: Will separate module info from core_width when update
-     * APIC ID with module level.
-     */
-    return apicid_bitwidth_for_count(topo_info->cores_per_module *
-                                     topo_info->modules_per_die);
+    return apicid_bitwidth_for_count(topo_info->cores_per_module);
+}
+
+/* Bit width of the Module_ID (cluster ID) field */
+static inline unsigned apicid_module_width(X86CPUTopoInfo *topo_info)
+{
+    return apicid_bitwidth_for_count(topo_info->modules_per_die);
 }
 
 /* Bit width of the Die_ID field */
@@ -99,10 +100,16 @@ static inline unsigned apicid_core_offset(X86CPUTopoInfo *topo_info)
     return apicid_smt_width(topo_info);
 }
 
+/* Bit offset of the Module_ID (cluster ID) field */
+static inline unsigned apicid_module_offset(X86CPUTopoInfo *topo_info)
+{
+    return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
+}
+
 /* Bit offset of the Die_ID field */
 static inline unsigned apicid_die_offset(X86CPUTopoInfo *topo_info)
 {
-    return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
+    return apicid_module_offset(topo_info) + apicid_module_width(topo_info);
 }
 
 /* Bit offset of the Pkg_ID (socket ID) field */
@@ -121,6 +128,7 @@ static inline apic_id_t x86_apicid_from_topo_ids(X86CPUTopoInfo *topo_info,
 {
     return (topo_ids->pkg_id  << apicid_pkg_offset(topo_info)) |
            (topo_ids->die_id  << apicid_die_offset(topo_info)) |
+           (topo_ids->module_id << apicid_module_offset(topo_info)) |
            (topo_ids->core_id << apicid_core_offset(topo_info)) |
            topo_ids->smt_id;
 }
@@ -138,11 +146,6 @@ static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
     unsigned nr_cores = topo_info->cores_per_module;
     unsigned nr_threads = topo_info->threads_per_core;
 
-    /*
-     * Currently smp for i386 doesn't support "clusters", modules_per_die is
-     * only 1. Therefore, the module_id generated from the module topology will
-     * not conflict with the module_id generated according to the apicid.
-     */
     topo_ids->pkg_id = cpu_index / (nr_dies * nr_modules *
                        nr_cores * nr_threads);
     topo_ids->die_id = cpu_index / (nr_modules * nr_cores *
@@ -166,12 +169,9 @@ static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
     topo_ids->core_id =
             (apicid >> apicid_core_offset(topo_info)) &
             ~(0xFFFFFFFFUL << apicid_core_width(topo_info));
-    /*
-     * TODO: This is the temporary initialization for topo_ids.module_id to
-     * avoid "maybe-uninitialized" compilation errors. Will remove when APIC
-     * ID supports module level parsing.
-     */
-    topo_ids->module_id = 0;
+    topo_ids->module_id =
+            (apicid >> apicid_module_offset(topo_info)) &
+            ~(0xFFFFFFFFUL << apicid_module_width(topo_info));
     topo_ids->die_id =
             (apicid >> apicid_die_offset(topo_info)) &
             ~(0xFFFFFFFFUL << apicid_die_width(topo_info));
-- 
2.34.1


