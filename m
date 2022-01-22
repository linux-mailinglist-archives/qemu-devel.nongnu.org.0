Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC3496B0E
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 09:39:18 +0100 (CET)
Received: from localhost ([::1]:53804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBBvZ-0002W2-EY
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 03:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nBBuF-0000UM-DB
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 03:37:55 -0500
Received: from mga17.intel.com ([192.55.52.151]:14296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nBBuD-0006dF-Hj
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 03:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642840673; x=1674376673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2yKZZzBR/4spt2HHQNijmNABVsLfrNg0wchrY9Olw8=;
 b=i+XXUmJfvxRWw38ZUw17/JYo6xwgxFwNw7RmdnxzE/KWBJfG5hSD/FNH
 Z0ZW7pK1sqdf4foTkAuzQiSH/Tr8XGyphynD6JMgKP7pzrjk4olcZ1yRC
 LGESYbbnQUravKovOrOQTGVe9e3K1AiNBBDQ7LJayOerUH4PmXN4RApNY
 vZF7MdTJcLBSiE1rAoEjfk2F0HyNW8paHR59VtmLcutrF2vPLcYwbJLXI
 3LdKgJgxgewnL4hQJBpayha25ZJKqJ1u0rkSfQJ9P9qJFcrsS7dh0ZXOC
 Zv5+7qlUQddCIfJ0aWZ+1kN6bhZCTvOM5bM5cXVfyOREqYgBGhHCMKo9L A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="226481881"
X-IronPort-AV: E=Sophos;i="5.88,307,1635231600"; d="scan'208";a="226481881"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2022 00:37:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,307,1635231600"; d="scan'208";a="765937386"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2022 00:37:46 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 likexu@tencent.com, wei.w.wang@intel.com
Subject: [PATCH v5 2/2] target/i386: Add lbr-fmt vPMU option to support guest
 LBR
Date: Sun, 23 Jan 2022 00:12:01 +0800
Message-Id: <20220122161201.73528-3-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220122161201.73528-1-weijiang.yang@intel.com>
References: <20220122161201.73528-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=weijiang.yang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: weijiang.yang@intel.com, Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Last Branch Recording (LBR) is a performance monitor unit (PMU)
feature on Intel processors which records a running trace of the most
recent branches taken by the processor in the LBR stack. This option
indicates the LBR format to enable for guest perf.

The LBR feature is enabled if below conditions are met:
1) KVM is enabled and the PMU is enabled.
2) msr-based-feature IA32_PERF_CAPABILITIES is supporterd on KVM.
3) Supported returned value for lbr_fmt from above msr is non-zero.
4) Guest vcpu model does support FEAT_1_ECX.CPUID_EXT_PDCM.
5) User-provided lbr-fmt value doesn't violate its bitmask (0x3f).
6) Target guest LBR format matches that of host.

Co-developed-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.c | 40 ++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h | 10 ++++++++++
 2 files changed, 50 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e636800..55eb519214 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6280,6 +6280,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
     static bool ht_warned;
+    uint64_t requested_lbr_fmt;
 
     if (cpu->apic_id == UNASSIGNED_APIC_ID) {
         error_setg(errp, "apic-id property was not initialized properly");
@@ -6297,6 +6298,42 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         goto out;
     }
 
+    /*
+     * Override env->features[FEAT_PERF_CAPABILITIES].LBR_FMT
+     * with user-provided setting.
+     */
+    if (cpu->lbr_fmt != ~PERF_CAP_LBR_FMT) {
+        if ((cpu->lbr_fmt & PERF_CAP_LBR_FMT) != cpu->lbr_fmt) {
+            error_setg(errp, "invalid lbr-fmt");
+            return;
+        }
+        env->features[FEAT_PERF_CAPABILITIES] &= ~PERF_CAP_LBR_FMT;
+        env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;
+    }
+
+    /*
+     * vPMU LBR is supported when 1) KVM is enabled 2) Option pmu=on and
+     * 3)vPMU LBR format matches that of host setting.
+     */
+    requested_lbr_fmt =
+        env->features[FEAT_PERF_CAPABILITIES] & PERF_CAP_LBR_FMT;
+    if (requested_lbr_fmt && kvm_enabled()) {
+        uint64_t host_perf_cap =
+            x86_cpu_get_supported_feature_word(FEAT_PERF_CAPABILITIES, false);
+        uint64_t host_lbr_fmt = host_perf_cap & PERF_CAP_LBR_FMT;
+
+        if (!cpu->enable_pmu) {
+            error_setg(errp, "vPMU: LBR is unsupported without pmu=on");
+            return;
+        }
+        if (requested_lbr_fmt != host_lbr_fmt) {
+            error_setg(errp, "vPMU: the lbr-fmt value (0x%lx) mismatches "
+                        "the host supported value (0x%lx).",
+                        requested_lbr_fmt, host_lbr_fmt);
+            return;
+        }
+    }
+
     x86_cpu_filter_features(cpu, cpu->check_cpuid || cpu->enforce_cpuid);
 
     if (cpu->enforce_cpuid && x86_cpu_have_filtered_features(cpu)) {
@@ -6649,6 +6686,8 @@ static void x86_cpu_initfn(Object *obj)
     object_property_add_alias(obj, "sse4_2", obj, "sse4.2");
 
     object_property_add_alias(obj, "hv-apicv", obj, "hv-avic");
+    cpu->lbr_fmt = ~PERF_CAP_LBR_FMT;
+    object_property_add_alias(obj, "lbr_fmt", obj, "lbr-fmt");
 
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
@@ -6804,6 +6843,7 @@ static Property x86_cpu_properties[] = {
 #endif
     DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
+    DEFINE_PROP_UINT64_CHECKMASK("lbr-fmt", X86CPU, lbr_fmt, PERF_CAP_LBR_FMT),
 
     DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
                        HYPERV_SPINLOCK_NEVER_NOTIFY),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9911d7c871..ee8974abc9 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -383,6 +383,7 @@ typedef enum X86Seg {
 #define ARCH_CAP_TSX_CTRL_MSR		(1<<7)
 
 #define MSR_IA32_PERF_CAPABILITIES      0x345
+#define PERF_CAP_LBR_FMT                0x3f
 
 #define MSR_IA32_TSX_CTRL		0x122
 #define MSR_IA32_TSCDEADLINE            0x6e0
@@ -1775,6 +1776,15 @@ struct X86CPU {
      */
     bool enable_pmu;
 
+    /*
+     * Enable LBR_FMT bits of IA32_PERF_CAPABILITIES MSR.
+     * This can't be initialized with a default because it doesn't have
+     * stable ABI support yet. It is only allowed to pass all LBR_FMT bits
+     * returned by kvm_arch_get_supported_msr_feature()(which depends on both
+     * host CPU and kernel capabilities) to the guest.
+     */
+    uint64_t lbr_fmt;
+
     /* LMCE support can be enabled/disabled via cpu option 'lmce=on/off'. It is
      * disabled by default to avoid breaking migration between QEMU with
      * different LMCE configurations.
-- 
2.27.0


