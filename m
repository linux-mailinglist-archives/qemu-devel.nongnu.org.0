Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECF7694213
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQD-0002qU-Iw; Mon, 13 Feb 2023 04:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPw-0002F2-75
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:37 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPk-0002n2-SN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281584; x=1707817584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7e0HqmBGarsYKxE3WIICOxyMlzjga2EZEcRvyGGYmpE=;
 b=a4nKG/G7Xz4F4RhDW8jbikLdyMWG6+yvuYos3Pv+blBtW6P3AnH0Otuv
 H7GHhbAVvzUiAkEWAySrMB5Z8Cv+2RwkP0oYrJ3lgBXPi7ENYjcPVeNBv
 OPC69w7Dov0Cw1vScxqfTVVDTgaYLIyBEsxluyphcQ/mWYxIyDfFsUTCm
 CIe156jlKH+Dvhy2WDbZ8kMIoI+OU9u0Z//NdXmAMfWn7w6cSBd9Ho5yB
 99dm/uPKvx6rjgHoNoHysk+LJbB7Iha9pyokH4gNU4V3N/gHvzco9qRGS
 Fhi2DQU5b90vD+/ScaQJyuBcsqthyYvimMV+36/iy2iuyJfzPuJssYAHd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487143"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487143"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760647"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760647"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:41 -0800
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
Subject: [RFC 41/52] machine: Introduce core_type() hook
Date: Mon, 13 Feb 2023 17:50:24 +0800
Message-Id: <20230213095035.158240-42-zhao1.liu@linux.intel.com>
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

Since supported core types are architecture specific, we need this hook
to allow archs define its own parsing or validation method.

As the example, add the x86 core_type() which will be used in "-hybrid"
parameter parsing.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-topo.c | 14 ++++++++++++++
 hw/core/machine.c      |  1 +
 hw/i386/x86.c          | 15 +++++++++++++++
 include/hw/boards.h    |  7 +++++++
 4 files changed, 37 insertions(+)

diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index 12c05510c1b5..f9ab08a1252e 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -352,3 +352,17 @@ void machine_parse_smp_config(MachineState *ms,
         return;
     }
 }
+
+/*
+ * machine_parse_hybrid_core_type: the default hook to parse hybrid core
+ *                                 type corresponding to the coretype
+ *                                 string option.
+ */
+int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype)
+{
+    if (strcmp(coretype, "") == 0 || strcmp(coretype, "none") == 0) {
+        return 0;
+    }
+
+    return -1;
+}
diff --git a/hw/core/machine.c b/hw/core/machine.c
index fad990f49b03..acc32b3be5f6 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -926,6 +926,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
      * On Linux, each node's border has to be 8MB aligned
      */
     mc->numa_mem_align_shift = 23;
+    mc->core_type = machine_parse_hybrid_core_type;
 
     object_class_property_add_str(oc, "kernel",
         machine_get_kernel, machine_set_kernel);
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index f381fdc43180..f58a90359170 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1569,6 +1569,20 @@ static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
     qapi_free_SgxEPCList(list);
 }
 
+static int x86_parse_hybrid_core_type(MachineState *ms, const char *coretype)
+{
+    X86HybridCoreType type;
+
+    if (strcmp(coretype, "atom") == 0) {
+        type = INTEL_ATOM_TYPE;
+    } else if (strcmp(coretype, "core") == 0) {
+        type = INTEL_CORE_TYPE;
+    } else {
+        type = INVALID_HYBRID_TYPE;
+    }
+    return type;
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1596,6 +1610,7 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     x86mc->save_tsc_khz = true;
     x86mc->fwcfg_dma_enabled = true;
     nc->nmi_monitor_handler = x86_nmi;
+    mc->core_type = x86_parse_hybrid_core_type;
 
     object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
         x86_machine_get_smm, x86_machine_set_smm,
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 9364c90d5f1a..34ec035b5c9f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -36,6 +36,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                Error **errp);
 void machine_parse_smp_config(MachineState *ms,
                               const SMPConfiguration *config, Error **errp);
+int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype);
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
@@ -199,6 +200,11 @@ typedef struct {
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities.
  *    kvm-type may be NULL if it is not needed.
+ * @core_type:
+ *    Return the type of hybrid cores corresponding to the coretype string
+ *    option. The default hook only accept "none" or "" since the most generic
+ *    core topology should not specify any specific core type. Each arch can
+ *    define its own core_type() hook to override the default one.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
  * @hotplug_allowed:
@@ -237,6 +243,7 @@ struct MachineClass {
     void (*reset)(MachineState *state, ShutdownCause reason);
     void (*wakeup)(MachineState *state);
     int (*kvm_type)(MachineState *machine, const char *arg);
+    int (*core_type)(MachineState *state, const char *type);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
-- 
2.34.1


