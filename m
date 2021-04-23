Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1381368AFF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 04:22:22 +0200 (CEST)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZlSX-0003AX-Ae
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 22:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lZlRF-0002MQ-72
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 22:21:01 -0400
Received: from mga05.intel.com ([192.55.52.43]:52063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lZlRB-0001ko-D8
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 22:21:00 -0400
IronPort-SDR: 6LQ1BnHtoT83X6XpPJVHa2minEeK/DySjmycOUK9vVs71l05NiGo/3JlwBS04DAqxqxPls/xuS
 ocgNkdboUVrA==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="281334003"
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="281334003"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 19:20:51 -0700
IronPort-SDR: HS4/TlqfrSwkFPONMNHienVPx9IlChwDr3nSDwwRV+BJtE6gkthOUmMCoboKLDWO34AmdRGjHC
 xj2GUizJIlWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="421603812"
Received: from clx-ap-likexu.sh.intel.com ([10.239.48.108])
 by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2021 19:20:50 -0700
From: Like Xu <like.xu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH RESEND 1/2] target/i386: add "-cpu,
 lbr-fmt=*" support to enable guest LBR
Date: Fri, 23 Apr 2021 10:20:36 +0800
Message-Id: <20210423022037.24733-1-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=like.xu@linux.intel.com; helo=mga05.intel.com
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
  or use the QEMU option "-cpu host,migratable=no".

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 target/i386/cpu.c     | 16 ++++++++++++++++
 target/i386/cpu.h     | 10 ++++++++++
 target/i386/kvm/kvm.c |  5 +++--
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7..eee6da3ad8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6627,6 +6627,13 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
             x86_cpu_get_supported_feature_word(w, false);
         uint64_t requested_features = env->features[w];
         uint64_t unavailable_features = requested_features & ~host_feat;
+        if (kvm_enabled() && w == FEAT_PERF_CAPABILITIES &&
+            (requested_features & PERF_CAP_LBR_FMT)) {
+            if ((host_feat & PERF_CAP_LBR_FMT) !=
+                (requested_features & PERF_CAP_LBR_FMT)) {
+                unavailable_features |= PERF_CAP_LBR_FMT;
+            }
+        }
         mark_unavailable_features(cpu, w, unavailable_features, prefix);
     }
 
@@ -6734,6 +6741,14 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -7300,6 +7315,7 @@ static Property x86_cpu_properties[] = {
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
index 7fe9f52710..4d842d32a6 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2732,8 +2732,9 @@ static void kvm_msr_entry_add_perf(X86CPU *cpu, FeatureWordArray f)
                                            MSR_IA32_PERF_CAPABILITIES);
 
     if (kvm_perf_cap) {
-        kvm_msr_entry_add(cpu, MSR_IA32_PERF_CAPABILITIES,
-                        kvm_perf_cap & f[FEAT_PERF_CAPABILITIES]);
+        kvm_perf_cap = cpu->migratable ?
+            (kvm_perf_cap & f[FEAT_PERF_CAPABILITIES]) : kvm_perf_cap;
+        kvm_msr_entry_add(cpu, MSR_IA32_PERF_CAPABILITIES, kvm_perf_cap);
     }
 }
 
-- 
2.30.2


