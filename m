Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3E4405965
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 16:44:25 +0200 (CEST)
Received: from localhost ([::1]:46836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLHr-0006gW-Mf
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 10:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mOLFc-0003yS-9L
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:42:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:11393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mOLFZ-0001Ru-NL
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:42:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="284510182"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="284510182"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 07:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="696346343"
Received: from lxy-dell.sh.intel.com ([10.239.159.31])
 by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2021 07:41:54 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [RFC PATCH 2/5] target/i386: Introduce FeatureWordInfo for Intel PT
 CPUID leaf 0xD
Date: Thu,  9 Sep 2021 22:41:47 +0800
Message-Id: <20210909144150.1728418-3-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210909144150.1728418-1-xiaoyao.li@intel.com>
References: <20210909144150.1728418-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=1,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xiaoyao.li@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CPUID leaf 0x14 subleaf 0x0 and 0x1 enumerate the resource and
capability of Intel PT.

Introduce FeatureWord FEAT_14_0_EBX, FEAT_14_1_EAX and FEAT_14_1_EBX,
and complete FEAT_14_0_ECX. Thus all the features of Intel PT can be
expanded when "-cpu host/max" and can be configured in named CPU model.

Regarding FEAT_14_1_EAX and FEAT_14_1_EBX, don't define the name for
them since each bit of them doesn't represent a standalone sub-feature
of Intel PT. However, explicitly mark them as migratable. So the
meaningful bits of them can be autoenabled in x86_cpu_expand_features().

It has special handling for FEAT_14_1_EAX[2:0], because the 3 bits as a
whole represents the number of PT ADDRn_CFG ranges. Thus it has special
handling in mark_unavailable_features() and x86_cpu_filter_features().

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 87 +++++++++++++++++++++++++++++++++++++++++------
 target/i386/cpu.h | 37 +++++++++++++++++++-
 2 files changed, 112 insertions(+), 12 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a06473c9e84c..58e98210f219 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -567,7 +567,7 @@ static CPUCacheInfo legacy_l3_cache = {
 /* generated packets which contain IP payloads have LIP values */
 #define INTEL_PT_IP_LIP          (1 << 31)
 #define INTEL_PT_ADDR_RANGES_NUM 0x2 /* Number of configurable address ranges */
-#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x3
+#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x7
 #define INTEL_PT_MTC_BITMAP      (0x0249 << 16) /* Support ART(0,3,6,9) */
 #define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
 #define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
@@ -1161,17 +1161,32 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         }
     },
 
+    [FEAT_14_0_EBX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            [0] = "intel-pt-cr3-filter",
+            [1] = "intel-pt-PSB",
+            [2] = "intel-pt-ip-filter",
+            [3] = "intel-pt-mtc",
+            [4] = "intel-pt-ptwrite",
+            [5] = "intel-pt-power-event",
+            [6] = "intel-pt-psb-pmi-preservation",
+        },
+        .cpuid = {
+            .eax = 0x14,
+            .needs_ecx = true, .ecx = 0,
+            .reg = R_EBX,
+        },
+    },
+
     [FEAT_14_0_ECX] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, "intel-pt-lip",
+            [0] = "intel-pt-topa",
+            [1] = "intel-pt-multi-topa-entries",
+            [2] = "intel-pt-single-range",
+            [3] = "intel-pt-trace-transport-subsystem",
+            [31] = "intel-pt-lip",
         },
         .cpuid = {
             .eax = 0x14,
@@ -1181,6 +1196,26 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .tcg_features = TCG_14_0_ECX_FEATURES,
      },
 
+    [FEAT_14_1_EAX] = {
+        .type = CPUID_FEATURE_WORD,
+        .cpuid = {
+            .eax = 0x14,
+            .needs_ecx = true, .ecx = 1,
+            .reg = R_EAX,
+        },
+        .migratable_flags = ~0ull,
+    },
+
+    [FEAT_14_1_EBX] = {
+        .type = CPUID_FEATURE_WORD,
+        .cpuid = {
+            .eax = 0x14,
+            .needs_ecx = true, .ecx = 1,
+            .reg = R_EBX,
+        },
+        .migratable_flags = ~0ull,
+    },
+
 };
 
 typedef struct FeatureMask {
@@ -1253,10 +1288,22 @@ static FeatureDep feature_dependencies[] = {
         .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_RDSEED },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDSEED_EXITING },
     },
+    {
+        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
+        .to = { FEAT_14_0_EBX,              ~0ull },
+    },
     {
         .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
         .to = { FEAT_14_0_ECX,              ~0ull },
     },
+    {
+        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
+        .to = { FEAT_14_1_EAX,              ~0ull },
+    },
+    {
+        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
+        .to = { FEAT_14_1_EBX,              ~0ull },
+    },
     {
         .from = { FEAT_8000_0001_EDX,       CPUID_EXT2_RDTSCP },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDTSCP },
@@ -4260,7 +4307,14 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
         return;
     }
 
-    for (i = 0; i < 64; ++i) {
+    if ((w == FEAT_14_1_EAX) && (mask & INTEL_PT_ADDR_RANGES_NUM_MASK)) {
+        warn_report("%s: CPUID.14H_01H:EAX [bit 2:0]", verbose_prefix);
+        i = 3;
+    } else {
+        i = 0;
+    }
+
+    for (; i < 64; ++i) {
         if ((1ULL << i) & mask) {
             g_autofree char *feat_word_str = feature_word_description(f, i);
             warn_report("%s: %s%s%s [bit %d]",
@@ -6038,7 +6092,18 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
         uint64_t host_feat =
             x86_cpu_get_supported_feature_word(w, false);
         uint64_t requested_features = env->features[w];
-        uint64_t unavailable_features = requested_features & ~host_feat;
+        uint64_t unavailable_features;
+        if (w == FEAT_14_1_EAX) {
+            unavailable_features = (requested_features & ~host_feat) &
+                                   ~INTEL_PT_ADDR_RANGES_NUM_MASK;
+            if ((requested_features & INTEL_PT_ADDR_RANGES_NUM_MASK) >
+                (host_feat & INTEL_PT_ADDR_RANGES_NUM_MASK)) {
+                unavailable_features |= requested_features &
+                                        INTEL_PT_ADDR_RANGES_NUM_MASK;
+            }
+        } else {
+            unavailable_features = requested_features & ~host_feat;
+        }
         mark_unavailable_features(cpu, w, unavailable_features, prefix);
     }
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c50d3ab4f1d..f5478a169f9a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -566,7 +566,10 @@ typedef enum FeatureWord {
     FEAT_VMX_EPT_VPID_CAPS,
     FEAT_VMX_BASIC,
     FEAT_VMX_VMFUNC,
+    FEAT_14_0_EBX,
     FEAT_14_0_ECX,
+    FEAT_14_1_EAX,
+    FEAT_14_1_EBX,
     FEATURE_WORDS,
 } FeatureWord;
 
@@ -835,8 +838,40 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
 
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


