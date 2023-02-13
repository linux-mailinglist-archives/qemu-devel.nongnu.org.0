Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8748369421B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:58:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQv-00044a-5K; Mon, 13 Feb 2023 04:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQr-000426-10
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:33 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQm-0002o2-73
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281648; x=1707817648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZHT8BeBElGkAL2saMHhPbqEcdepnC0wUMbvXOsAXTqU=;
 b=UET0RKcrhg2tVUngzH1/6YKAOyRAWd2n8ytlAfqA0qt/pXerJAQw8srj
 ZwJxfTsgtPAp0z22HX2ZotFZfvzNPL1MkOaoS0HATj2wMzi5bK9jOlriR
 btDUL/87h4WAn893eTuC0XAUw2SgEVxhVFMLdIf6Au5a+qjgMP64j4Eva
 +hUhwf+c7sYQfx4JODxw1nhJ6PqjE35AVWPcjF3gDW38tpSHYOfcIK1iN
 4BJS61eXTPAWV0jdiGk5Mk0rHOLEMwT5+J1aF/0XPNan3gcBiDDAv7vGa
 4crZ4dCF1PSzQtRkVvGoLUHnVeP2O2QTRP0iJb0Ac0t0FOQUFYcR2KBCu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487342"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487342"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:46:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760707"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760707"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:46:23 -0800
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
Subject: [RFC 52/52] i386: Support cpu_index_to_core_type() for x86
Date: Mon, 13 Feb 2023 17:50:35 +0800
Message-Id: <20230213095035.158240-53-zhao1.liu@linux.intel.com>
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

The cpu_index_to_core_type() of MachineClass is implemented in x86 to
obtain the string name of core type, so that users can get the basic
topology information (topology type and core type) of x86 machine
(currently, only PC machine) in query_cpus_fast.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index f58a90359170..67318a527c6c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1583,6 +1583,38 @@ static int x86_parse_hybrid_core_type(MachineState *ms, const char *coretype)
     return type;
 }
 
+static const char *x86_cpu_index_to_hybrid_core_type(MachineState *machine,
+                                                     unsigned cpu_index)
+{
+    CPUState *cs;
+
+    if (machine_topo_is_smp(machine)) {
+        return NULL;
+    }
+
+    CPU_FOREACH(cs) {
+        X86CPU *cpu = X86_CPU(cs);
+        CPUX86State *env = &cpu->env;
+
+        if (cs->cpu_index == cpu_index) {
+            const char *core_type;
+
+            switch (env->hybrid_core_type) {
+            case INTEL_ATOM_TYPE:
+                core_type = "atom";
+                break;
+            case INTEL_CORE_TYPE:
+                core_type = "core";
+                break;
+            default:
+                abort();
+            }
+            return core_type;
+        }
+    }
+    return NULL;
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1611,6 +1643,7 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     x86mc->fwcfg_dma_enabled = true;
     nc->nmi_monitor_handler = x86_nmi;
     mc->core_type = x86_parse_hybrid_core_type;
+    mc->cpu_index_to_core_type = x86_cpu_index_to_hybrid_core_type;
 
     object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
         x86_machine_get_smm, x86_machine_set_smm,
-- 
2.34.1


