Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27A24B8373
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:58:02 +0100 (CET)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKG8P-0007q5-Qp
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:58:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5a-00059d-DL
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:06 -0500
Received: from mga12.intel.com ([192.55.52.136]:38500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5W-0002nD-JL
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645001702; x=1676537702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pb5fomvJCsmkZJ5lEHv4lA8W0IQScN7xG932ihf1WPo=;
 b=UYgDkHcRpZFwJBS74QKvcIFDaX/G0v3TJvdkyPxgzEx4f9yaOWXHe3Ih
 YiXNX10dgCWA6IRlt6ZAp2+YOZKVMnwI3wndNeityV/qzslZM3HFv5xCG
 em2dQZm/IFpyLRVk0JYQz8S2KFHUMwujjqibvOUxDOYRIZr0e/95zS9rg
 kRgi0P6NSNX0auzNTDARHZvd53fP5jEYrDMtToGVmdPd+AaPic/7Q2Chr
 J25UK6A4BMaB4/06QdJz6hHWlieYf8xSyAs25XgUenuuxg/FU8w4wpWHN
 F+8pbIyp7xTd2QdJiKqBM+gDO9adMkCBQjM5dimEiHudb1WNmufqBy0PA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="230518904"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="230518904"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="633418271"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:05 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, like.xu.linux@gmail.com,
 wei.w.wang@intel.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH 2/8] target/i386: Add lbr-fmt vPMU option to support guest LBR
Date: Tue, 15 Feb 2022 14:52:52 -0500
Message-Id: <20220215195258.29149-3-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220215195258.29149-1-weijiang.yang@intel.com>
References: <20220215195258.29149-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=weijiang.yang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.083, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Weijiang <weijiang.yang@intel.com>, Like Xu <like.xu@linux.intel.com>
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
index 9543762e7e..a037bba387 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6370,6 +6370,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
     static bool ht_warned;
+    uint64_t requested_lbr_fmt;
 
     if (cpu->apic_id == UNASSIGNED_APIC_ID) {
         error_setg(errp, "apic-id property was not initialized properly");
@@ -6387,6 +6388,42 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -6739,6 +6776,8 @@ static void x86_cpu_initfn(Object *obj)
     object_property_add_alias(obj, "sse4_2", obj, "sse4.2");
 
     object_property_add_alias(obj, "hv-apicv", obj, "hv-avic");
+    cpu->lbr_fmt = ~PERF_CAP_LBR_FMT;
+    object_property_add_alias(obj, "lbr_fmt", obj, "lbr-fmt");
 
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
@@ -6894,6 +6933,7 @@ static Property x86_cpu_properties[] = {
 #endif
     DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
+    DEFINE_PROP_UINT64_CHECKMASK("lbr-fmt", X86CPU, lbr_fmt, PERF_CAP_LBR_FMT),
 
     DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
                        HYPERV_SPINLOCK_NEVER_NOTIFY),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 509c16323a..852afabe0b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -383,6 +383,7 @@ typedef enum X86Seg {
 #define ARCH_CAP_TSX_CTRL_MSR		(1<<7)
 
 #define MSR_IA32_PERF_CAPABILITIES      0x345
+#define PERF_CAP_LBR_FMT                0x3f
 
 #define MSR_IA32_TSX_CTRL		0x122
 #define MSR_IA32_TSCDEADLINE            0x6e0
@@ -1819,6 +1820,15 @@ struct X86CPU {
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


