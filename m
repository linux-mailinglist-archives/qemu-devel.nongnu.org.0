Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB236C0A9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:11:21 +0200 (CEST)
Received: from localhost ([::1]:44022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbIoQ-0007PI-Sa
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lbInP-0006un-22
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:10:15 -0400
Received: from mga06.intel.com ([134.134.136.31]:32266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lbInM-0007Qx-Uu
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:10:14 -0400
IronPort-SDR: O5nspSHZ3iZIyZX7yoV4hTJfLHqu77bq6c7VAEYpgTgrmMVxnuwJC5qIaBxvtAyr1T2vHpXW+b
 1l8Jbw16g+sQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="257772827"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="257772827"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 01:10:10 -0700
IronPort-SDR: sGbEaj+6M1sbxOiDxcF2mVKvjebr5hJh0R2S+CHmBt1UOrFT/td6jn6eRWjDa14v9IUBYlO1Ol
 nJzwdlakZtig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="457518850"
Received: from clx-ap-likexu.sh.intel.com ([10.239.48.108])
 by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2021 01:10:07 -0700
From: Like Xu <like.xu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v2] target/i386: add "-cpu,
 lbr-fmt=*" support to enable guest LBR
Date: Tue, 27 Apr 2021 16:09:48 +0800
Message-Id: <20210427080948.439432-1-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=like.xu@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei.w.wang@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last branch recording (LBR) is a performance monitor unit (PMU)
feature on Intel processors that records a running trace of the most
recent branches taken by the processor in the LBR stack. The QEMU
could configure whether it's enabled or not for each guest via CLI.

The LBR feature would be enabled on the guest if:
- the KVM is enabled and the PMU is enabled and,
- the msr-based-feature IA32_PERF_CAPABILITIES is supporterd on KVM and,
- the supported returned value for lbr_fmt from this msr is not zero and,
- the requested guest vcpu model does support FEAT_1_ECX.CPUID_EXT_PDCM,
- the configured lbr-fmt value is the same as the host lbr_fmt value
  OR use the QEMU option "-cpu host,migratable=no".

Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 target/i386/cpu.c     | 34 ++++++++++++++++++++++++++++++++++
 target/i386/cpu.h     | 10 ++++++++++
 target/i386/kvm/kvm.c | 10 ++++++++--
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7..9c8e54aa6f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6623,6 +6623,10 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
     }
 
     for (w = 0; w < FEATURE_WORDS; w++) {
+        if (w == FEAT_PERF_CAPABILITIES) {
+            continue;
+        }
+
         uint64_t host_feat =
             x86_cpu_get_supported_feature_word(w, false);
         uint64_t requested_features = env->features[w];
@@ -6630,6 +6634,27 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
         mark_unavailable_features(cpu, w, unavailable_features, prefix);
     }
 
+    uint64_t host_perf_cap =
+        x86_cpu_get_supported_feature_word(FEAT_PERF_CAPABILITIES, false);
+    if (!cpu->lbr_fmt && !cpu->migratable) {
+        cpu->lbr_fmt = host_perf_cap & PERF_CAP_LBR_FMT;
+        if (cpu->lbr_fmt) {
+            info_report("vPMU: The value of lbr-fmt has been adjusted "
+                        "to 0x%lx and guest LBR is enabled.",
+                        host_perf_cap & PERF_CAP_LBR_FMT);
+        }
+    } else {
+        uint64_t requested_lbr_fmt = cpu->lbr_fmt & PERF_CAP_LBR_FMT;
+        if (requested_lbr_fmt && kvm_enabled()) {
+            if (requested_lbr_fmt != (host_perf_cap & PERF_CAP_LBR_FMT)) {
+                cpu->lbr_fmt = 0;
+                warn_report("vPMU: The supported lbr-fmt value on the host "
+                            "is 0x%lx and guest LBR is disabled.",
+                            host_perf_cap & PERF_CAP_LBR_FMT);
+            }
+        }
+    }
+
     if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) &&
         kvm_enabled()) {
         KVMState *s = CPU(cpu)->kvm_state;
@@ -6734,6 +6759,14 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->lbr_fmt) {
+        if (!cpu->enable_pmu) {
+            error_setg(errp, "LBR is unsupported since guest PMU is disabled.");
+            return;
+        }
+        env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;
+    }
+
     /* mwait extended info: needed for Core compatibility */
     /* We always wake on interrupt even if host does not have the capability */
     cpu->mwait.ecx |= CPUID_MWAIT_EMX | CPUID_MWAIT_IBE;
@@ -7300,6 +7333,7 @@ static Property x86_cpu_properties[] = {
 #endif
     DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
+    DEFINE_PROP_UINT8("lbr-fmt", X86CPU, lbr_fmt, 0),
 
     DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
                        HYPERV_SPINLOCK_NEVER_NOTIFY),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878..b12c879fc4 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -354,6 +354,7 @@ typedef enum X86Seg {
 #define ARCH_CAP_TSX_CTRL_MSR		(1<<7)
 
 #define MSR_IA32_PERF_CAPABILITIES      0x345
+#define PERF_CAP_LBR_FMT      0x3f
 
 #define MSR_IA32_TSX_CTRL		0x122
 #define MSR_IA32_TSCDEADLINE            0x6e0
@@ -1726,6 +1727,15 @@ struct X86CPU {
      */
     bool enable_pmu;
 
+    /*
+     * Configure LBR_FMT bits on IA32_PERF_CAPABILITIES MSR.
+     * This can't be enabled by default yet because it doesn't have
+     * ABI stability guarantees, as it is only allowed to pass all
+     * LBR_FMT bits returned by kvm_arch_get_supported_msr_feature()
+     * (that depends on host CPU and kernel capabilities) to the guest.
+     */
+    uint8_t lbr_fmt;
+
     /* LMCE support can be enabled/disabled via cpu option 'lmce=on/off'. It is
      * disabled by default to avoid breaking migration between QEMU with
      * different LMCE configurations.
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 7fe9f52710..aa926984ae 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2732,8 +2732,14 @@ static void kvm_msr_entry_add_perf(X86CPU *cpu, FeatureWordArray f)
                                            MSR_IA32_PERF_CAPABILITIES);
 
     if (kvm_perf_cap) {
-        kvm_msr_entry_add(cpu, MSR_IA32_PERF_CAPABILITIES,
-                        kvm_perf_cap & f[FEAT_PERF_CAPABILITIES]);
+        kvm_perf_cap = (cpu->migratable) ?
+            (kvm_perf_cap & f[FEAT_PERF_CAPABILITIES]) : kvm_perf_cap;
+
+        if (!cpu->lbr_fmt) {
+            kvm_perf_cap &= ~PERF_CAP_LBR_FMT;
+        }
+
+        kvm_msr_entry_add(cpu, MSR_IA32_PERF_CAPABILITIES, kvm_perf_cap);
     }
 }
 
-- 
2.30.2


