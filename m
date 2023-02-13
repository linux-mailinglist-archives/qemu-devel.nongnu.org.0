Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767996941B8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:45:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVP1-0000Zv-3W; Mon, 13 Feb 2023 04:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOy-0000WS-8f
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:36 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOt-0002kj-Hv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281531; x=1707817531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=11laMp2QXACkaSARVXNSldLvCuWQP0Y2j1m1mmDAkdQ=;
 b=Q2Dnj1GILexMYy79zkcIhejoma/z13NY5Yqng/fw+Apa300hJL+38V0Q
 7NcS9yvChtmvsOntX3myz/u+6LkTTM8U7As6DuAh3eDHYSmikk7V1G5TM
 5SvpX+AIT6/Thvh8iU7MH2MiMX5LXL7b5LoSuRs3uCjvlG/n530/XR33f
 Rhu2b2sDuLEQyWLN9AYN/PEcTbAjwRpDeo0NTov13gGX/+yS1mwWzvLYQ
 wesv9fMqGdME8MnOYYLncuVFI8T7Ep2+ZzsOku6MWGd8I6h3oPJkm8RcC
 J4Mm4+h3dg3YyuZXnNUnYi1SubjqHZ2e+++VWM7Jr7nXdf2DKGZCbcSbU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486857"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486857"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760595"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760595"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:00 -0800
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
Subject: [RFC 30/52] i386: Drop nr_dies and nr_modules CPUX86State
Date: Mon, 13 Feb 2023 17:50:13 +0800
Message-Id: <20230213095035.158240-31-zhao1.liu@linux.intel.com>
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

Since CPUState has the complete topology information, there's no need
to keep i386 architecture specific topology.

This avoids the fragmentation of topological information.

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c         | 4 ----
 target/i386/cpu.c     | 7 +++----
 target/i386/cpu.h     | 8 --------
 target/i386/kvm/kvm.c | 2 +-
 4 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 91da2486d99e..52f7a19ceb7c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -280,7 +280,6 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     CPUArchId *cpu_slot;
     X86CPUTopoIDs topo_ids;
     X86CPU *cpu = X86_CPU(dev);
-    CPUX86State *env = &cpu->env;
     MachineState *ms = MACHINE(hotplug_dev);
     X86MachineState *x86ms = X86_MACHINE(hotplug_dev);
     X86CPUTopoInfo topo_info;
@@ -304,9 +303,6 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
 
     init_topo_info(&topo_info, x86ms);
 
-    env->nr_dies = machine_topo_get_dies(ms);
-    env->nr_modules = machine_topo_get_clusters(ms);
-
     /*
      * If APIC ID is not set,
      * set it based on socket/die/cluster/core/thread properties.
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fcea4ea1a7e2..2188097c3ee1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5499,7 +5499,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         break;
     case 0x1F:
         /* V2 Extended Topology Enumeration Leaf */
-        if (env->nr_dies < 2) {
+        if (cs->topo.dies_per_socket < 2) {
             *eax = *ebx = *ecx = *edx = 0;
             break;
         }
@@ -6227,6 +6227,7 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
 void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
 {
     CPUX86State *env = &cpu->env;
+    CPUState *cs = env_cpu(env);
     FeatureWord w;
     int i;
     GList *l;
@@ -6316,7 +6317,7 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
          * cpu->vendor_cpuid_only has been unset for compatibility with older
          * machine types.
          */
-        if ((env->nr_dies > 1) &&
+        if ((cs->topo.dies_per_socket > 1) &&
             (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
             x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
         }
@@ -6840,8 +6841,6 @@ static void x86_cpu_initfn(Object *obj)
     X86CPUClass *xcc = X86_CPU_GET_CLASS(obj);
     CPUX86State *env = &cpu->env;
 
-    env->nr_dies = 1;
-    env->nr_modules = 1;
     cpu_set_cpustate_pointers(cpu);
 
     object_property_add(obj, "feature-words", "X86CPUFeatureWordInfo",
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index aa7e96c586c7..30b2aa6ab10d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1825,14 +1825,6 @@ typedef struct CPUArchState {
     uint32_t umwait;
 
     TPRAccess tpr_access_type;
-
-    /* Number of dies per package. */
-    unsigned nr_dies;
-    /*
-     * Number of modules per die. Module level in x86 cpu topology is
-     * corresponding to smp.clusters.
-     */
-    unsigned nr_modules;
 } CPUX86State;
 
 struct kvm_msrs;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 77a8c381a73a..687c56825693 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1859,7 +1859,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
             break;
         }
         case 0x1f:
-            if (env->nr_dies < 2) {
+            if (cs->topo.dies_per_socket < 2) {
                 break;
             }
             /* fallthrough */
-- 
2.34.1


