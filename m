Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D240646922
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 07:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ALr-0000jv-Qo; Thu, 08 Dec 2022 01:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALb-0000iB-MW
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:32 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALZ-0005LP-KM
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670480729; x=1702016729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lch6sm3NRezR1vVEDr9IXJOolqbfpx/CiBwZlMb65y4=;
 b=XhR294C1bPIyblQ3ayB+DQKE8P9jy8Or91/AKdUbj6aDMaJwpv0JZ/uY
 UvkL9RIcTW0n+U2xqMvcaFjDRg0Lf8b7iwTKPM90T9YkssTQegb1i+Ag7
 Ziy6UlCuAVT6zbqdjVLeeGniWRUsaQu26EdaLV6eNslwfUT6JNaLefEwI
 9sE2SakQLlvDMLBzSF9MGWPQk3C6obXNlPyIECQeC967IENlkkHxqbGQK
 OthDGTMz6uRqxYhBKfAWK12XqRRSMduGoXN3wRsGgRnTOxQ1iu7FAMiMY
 P4poIuxak9NeSiC0OXTnBnNPaOkX5Uk7ZlLo+l+nEBeFfTs7A2YgZ4O7N g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="297444481"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="297444481"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 22:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="679413421"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="679413421"
Received: from lxy-dell.sh.intel.com ([10.239.48.100])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2022 22:25:22 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	xiaoyao.li@intel.com
Subject: [PATCH v3 5/8] target/i386/intel-pt: Rework/rename the default
 INTEL-PT feature set
Date: Thu,  8 Dec 2022 14:25:10 +0800
Message-Id: <20221208062513.2589476-6-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221208062513.2589476-1-xiaoyao.li@intel.com>
References: <20221208062513.2589476-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Historically the Intel PT feature set reported from ICX silicon
was chosen as the fixed feature set for Intel PT. If want to enable
and expose INTEL-PT to guest, the supported Intel PT reported by host
must cover the fixed feature set, which are named with MINIMAL in
INTEL_PT_MINIMAL_EBX and INTEL_PT_MINIMAL_ECX. However, it's not
accurate that it's more as default than minimal since SPR has less
capabilities regarding CPUID(0x14,1):EBX[15:0].

Rename the feature set name to avoid future confusion and
opportunistically define each feature bit.

No functional change intended.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 70 ++++++++++++++++++++++-------------------------
 target/i386/cpu.h | 34 ++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 39 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4d7beccc0af7..e302cbbebfc5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -546,34 +546,29 @@ static CPUCacheInfo legacy_l3_cache = {
 #define L2_ITLB_4K_ASSOC       4
 #define L2_ITLB_4K_ENTRIES   512
 
-/* CPUID Leaf 0x14 constants: */
-#define INTEL_PT_MAX_SUBLEAF     0x1
-/*
- * bit[00]: IA32_RTIT_CTL.CR3 filter can be set to 1 and IA32_RTIT_CR3_MATCH
- *          MSR can be accessed;
- * bit[01]: Support Configurable PSB and Cycle-Accurate Mode;
- * bit[02]: Support IP Filtering, TraceStop filtering, and preservation
- *          of Intel PT MSRs across warm reset;
- * bit[03]: Support MTC timing packet and suppression of COFI-based packets;
- */
-#define INTEL_PT_MINIMAL_EBX     0xf
-/*
- * bit[00]: Tracing can be enabled with IA32_RTIT_CTL.ToPA = 1 and
- *          IA32_RTIT_OUTPUT_BASE and IA32_RTIT_OUTPUT_MASK_PTRS MSRs can be
- *          accessed;
- * bit[01]: ToPA tables can hold any number of output entries, up to the
- *          maximum allowed by the MaskOrTableOffset field of
- *          IA32_RTIT_OUTPUT_MASK_PTRS;
- * bit[02]: Support Single-Range Output scheme;
- */
-#define INTEL_PT_MINIMAL_ECX     0x7
-/* generated packets which contain IP payloads have LIP values */
-#define INTEL_PT_IP_LIP          (1 << 31)
-#define INTEL_PT_ADDR_RANGES_NUM 0x2 /* Number of configurable address ranges */
-#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x7
-#define INTEL_PT_MTC_BITMAP      (0x0249 << 16) /* Support ART(0,3,6,9) */
-#define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
-#define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
+/* INTEL PT definitions: */
+
+#define INTEL_PT_MAX_SUBLEAF                0x1
+
+#define INTEL_PT_ADDR_RANGES_NUM_MASK       0x7
+#define INTEL_PT_DEFAULT_ADDR_RANGES_NUM    0x2
+
+/* Support ART(0,3,6,9) */
+#define INTEL_PT_DEFAULT_MTC_BITMAP         (0x0249 << 16)
+/* Support 0,2^(0~11) */
+#define INTEL_PT_DEFAULT_CYCLE_BITMAP       0x1fff
+/* Support 2K,4K,8K,16K,32K,64K */
+#define INTEL_PT_DEFAULT_PSB_BITMAP         (0x003f << 16)
+
+#define INTEL_PT_DEFAULT_0_EBX  (CPUID_14_0_EBX_CR3_FILTER | CPUID_14_0_EBX_PSB | \
+                                 CPUID_14_0_EBX_IP_FILTER | CPUID_14_0_EBX_MTC)
+
+#define INTEL_PT_DEFAULT_0_ECX  (CPUID_14_0_ECX_TOPA | CPUID_14_0_ECX_MULTI_ENTRIES | \
+                                 CPUID_14_0_ECX_SINGLE_RANGE)
+
+#define INTEL_PT_DEFAULT_1_EAX  (INTEL_PT_DEFAULT_MTC_BITMAP | INTEL_PT_DEFAULT_ADDR_RANGES_NUM)
+
+#define INTEL_PT_DEFAULT_1_EBX  (INTEL_PT_DEFAULT_PSB_BITMAP | INTEL_PT_DEFAULT_CYCLE_BITMAP)
 
 /* CPUID Leaf 0x1D constants: */
 #define INTEL_AMX_TILE_MAX_SUBLEAF     0x1
@@ -5721,14 +5716,14 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         if (count == 0) {
             *eax = INTEL_PT_MAX_SUBLEAF;
-            *ebx = INTEL_PT_MINIMAL_EBX;
-            *ecx = INTEL_PT_MINIMAL_ECX;
+            *ebx = INTEL_PT_DEFAULT_0_EBX;
+            *ecx = INTEL_PT_DEFAULT_0_ECX;
             if (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP) {
                 *ecx |= CPUID_14_0_ECX_LIP;
             }
         } else if (count == 1) {
-            *eax = INTEL_PT_MTC_BITMAP | INTEL_PT_ADDR_RANGES_NUM;
-            *ebx = INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP;
+            *eax = INTEL_PT_DEFAULT_1_EAX;
+            *ebx = INTEL_PT_DEFAULT_1_EBX;
         }
         break;
     }
@@ -6473,13 +6468,12 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
         uint32_t ebx_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EBX);
 
         if (!eax_0 ||
-           ((ebx_0 & INTEL_PT_MINIMAL_EBX) != INTEL_PT_MINIMAL_EBX) ||
-           ((ecx_0 & INTEL_PT_MINIMAL_ECX) != INTEL_PT_MINIMAL_ECX) ||
-           ((eax_1 & INTEL_PT_MTC_BITMAP) != INTEL_PT_MTC_BITMAP) ||
+           ((ebx_0 & INTEL_PT_DEFAULT_0_EBX) != INTEL_PT_DEFAULT_0_EBX) ||
+           ((ecx_0 & INTEL_PT_DEFAULT_0_ECX) != INTEL_PT_DEFAULT_0_ECX) ||
+           ((eax_1 & INTEL_PT_DEFAULT_MTC_BITMAP) != INTEL_PT_DEFAULT_MTC_BITMAP) ||
            ((eax_1 & INTEL_PT_ADDR_RANGES_NUM_MASK) <
-                                           INTEL_PT_ADDR_RANGES_NUM) ||
-           ((ebx_1 & (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) !=
-                (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) ||
+                                      INTEL_PT_DEFAULT_ADDR_RANGES_NUM) ||
+           ((ebx_1 & INTEL_PT_DEFAULT_1_EBX) != INTEL_PT_DEFAULT_1_EBX) ||
            ((ecx_0 & CPUID_14_0_ECX_LIP) !=
                 (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP))) {
             /*
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d8b3535d5aa7..93fb5a87b40e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -906,8 +906,40 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
 
+/*
+ * IA32_RTIT_CTL.CR3 filter can be set to 1 and
+ * IA32_RTIT_CR3_MATCH can be accessed
+ */
+#define CPUID_14_0_EBX_CR3_FILTER               (1U << 0)
+/* Support Configurable PSB and Cycle-Accurate Mode */
+#define CPUID_14_0_EBX_PSB                      (1U << 1)
+/*
+ * Support IP Filtering, IP TraceStop, and preservation
+ * of Intel PT MSRs across warm reset
+ */
+#define CPUID_14_0_EBX_IP_FILTER                (1U << 2)
+/* Support MTC timing packet */
+#define CPUID_14_0_EBX_MTC                      (1U << 3)
+/* Support PTWRITE */
+#define CPUID_14_0_EBX_PTWRITE                  (1U << 4)
+/* Support Power Event Trace packet generation */
+#define CPUID_14_0_EBX_POWER_EVENT              (1U << 5)
+/* Support PSB and PMI Preservation */
+#define CPUID_14_0_EBX_PSB_PMI_PRESERVATION     (1U << 6)
+
+/* Tracing can be enabled with IA32_RTIT_CTL.ToPA = 1 */
+#define CPUID_14_0_ECX_TOPA                     (1U << 0)
+/*
+ * ToPA tables can hold any number of output entries, up to the maximum allowed
+ * by the MaskOrTableOffset field of IA32_RTIT_OUTPUT_MASK_PTRS
+ */
+#define CPUID_14_0_ECX_MULTI_ENTRIES            (1U << 1)
+/* Support Single-Range Output scheme */
+#define CPUID_14_0_ECX_SINGLE_RANGE             (1U << 2)
+/* Support IA32_RTIT_CTL.FabricEn */
+#define CPUID_14_0_ECX_TRACE_TRANS_SUBSYSTEM    (1U << 3)
 /* Packets which contain IP payload have LIP values */
-#define CPUID_14_0_ECX_LIP              (1U << 31)
+#define CPUID_14_0_ECX_LIP                      (1U << 31)
 
 /* CLZERO instruction */
 #define CPUID_8000_0008_EBX_CLZERO      (1U << 0)
-- 
2.27.0


