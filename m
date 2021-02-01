Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B344D30A100
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 06:04:47 +0100 (CET)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ROI-0002Pw-BL
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 00:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1l6RML-0001Wc-Fj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 00:02:45 -0500
Received: from mga01.intel.com ([192.55.52.88]:15891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1l6RMG-0003NA-CX
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 00:02:45 -0500
IronPort-SDR: H5Cm86s4xcfTLYmudWBaYEIUEu85/C9GQT5m/JPFdilAMQMGIJkCoK8F0U4oUcZh4edzopDTPE
 NsCposXabKkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="199523989"
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; d="scan'208";a="199523989"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2021 21:01:22 -0800
IronPort-SDR: nnd3WJquSgM3mwMtYwqN1zwFoDZGaur/Sx+v/5WK7C2a/dNTk+73bgWCUkPb1j3q5Cutl2D3R+
 UbidhUjHN+KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; d="scan'208";a="390690211"
Received: from clx-ap-likexu.sh.intel.com ([10.239.48.108])
 by orsmga008.jf.intel.com with ESMTP; 31 Jan 2021 21:01:19 -0800
From: Like Xu <like.xu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v2 1/2] target/i386: add "-cpu,
 lbr-fmt=*" support to enable guest LBR
Date: Mon,  1 Feb 2021 12:54:52 +0800
Message-Id: <20210201045453.240258-1-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=like.xu@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
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
index ae89024d36..80a5d3f0c2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6504,6 +6504,13 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
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
 
@@ -6611,6 +6618,14 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -7184,6 +7199,7 @@ static Property x86_cpu_properties[] = {
 #endif
     DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
+    DEFINE_PROP_UINT8("lbr-fmt", X86CPU, lbr_fmt, 0),
 
     DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
                        HYPERV_SPINLOCK_NEVER_NOTIFY),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a..64320bced2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -354,6 +354,7 @@ typedef enum X86Seg {
 #define ARCH_CAP_TSX_CTRL_MSR		(1<<7)
 
 #define MSR_IA32_PERF_CAPABILITIES      0x345
+#define PERF_CAP_LBR_FMT      0x3f
 
 #define MSR_IA32_TSX_CTRL		0x122
 #define MSR_IA32_TSCDEADLINE            0x6e0
@@ -1709,6 +1710,15 @@ struct X86CPU {
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
index 6dc1ee052d..49745efb78 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2705,8 +2705,9 @@ static void kvm_msr_entry_add_perf(X86CPU *cpu, FeatureWordArray f)
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
2.29.2


