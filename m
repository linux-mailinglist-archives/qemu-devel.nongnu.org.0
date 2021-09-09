Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7388140596A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 16:44:41 +0200 (CEST)
Received: from localhost ([::1]:47302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLI6-000719-Pl
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 10:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mOLFe-00040D-5z
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:42:06 -0400
Received: from mga07.intel.com ([134.134.136.100]:11385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mOLFc-0001Nx-7n
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:42:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="284510183"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="284510183"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 07:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="696346350"
Received: from lxy-dell.sh.intel.com ([10.239.159.31])
 by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2021 07:41:56 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [RFC PATCH 3/5] target/i386: Enable host pass through of Intel PT
Date: Thu,  9 Sep 2021 22:41:48 +0800
Message-Id: <20210909144150.1728418-4-xiaoyao.li@intel.com>
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

commit e37a5c7fa459 ("i386: Add Intel Processor Trace feature support")
added the support of Intel PT by making CPUID[14] of PT as fixed feature
set (from ICX) for any CPU model on any host.

This truly breaks the PT exposing on Intel SPR platform because SPR has
less supported bitmap CPUID(0x14,1):EBX[15:0] than ICX.

This patch enables passing through host's PT capabilities for the case
"-cpu host/max" while ensure named CPU model still has the fixed
PT feature set to not break the live migration.

It introduces @has_specific_intel_pt_feature_set field for name CPU
model. If a named CPU model has this field as false, it will use fixed
PT feature set of ICX. Besides same to previous behavior, if fixed PT
feature set of ICX cannot be satisfied/supported by host, it disables PT
instead of adjusting the feature set based on host's capabilities.

In the future, new named CPU model, e.g., Sapphire Rapids, can define
its own PT feature set by setting @has_specific_intel_pt_feature_set to
true and defines it's own FEAT_14_0_EBX, FEAT_14_0_ECX, FEAT_14_1_EAX
and FEAT_14_1_EBX.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 106 ++++++++++++++++++++--------------------------
 target/i386/cpu.h |   1 +
 2 files changed, 47 insertions(+), 60 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 58e98210f219..00c4ad23110d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -543,34 +543,24 @@ static CPUCacheInfo legacy_l3_cache = {
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
+#define INTEL_PT_MAX_SUBLEAF                0x1
+#define INTEL_PT_DEFAULT_ADDR_RANGES_NUM    0x2
+#define INTEL_PT_ADDR_RANGES_NUM_MASK       0x7
+/* Support ART(0,3,6,9) */
+#define INTEL_PT_DEFAULT_MTC_BITMAP         0x0249
+/* Support 0,2^(0~11) */
+#define INTEL_PT_DEFAULT_CYCLE_BITMAP       0x1fff
+/* Support 2K,4K,8K,16K,32K,64K */
+#define INTEL_PT_DEFAULT_PSB_BITMAP         0x003f
+
+#define INTEL_PT_DEFAULT_0_EBX  (CPUID_14_0_EBX_CR3_FILTER | \
+            CPUID_14_0_EBX_PSB | CPUID_14_0_EBX_IP_FILTER | CPUID_14_0_EBX_MTC)
+#define INTEL_PT_DEFAULT_0_ECX  (CPUID_14_0_ECX_TOPA | \
+            CPUID_14_0_ECX_MULTI_ENTRIES | CPUID_14_0_ECX_SINGLE_RANGE)
+#define INTEL_PT_DEFAULT_1_EAX  (INTEL_PT_DEFAULT_MTC_BITMAP << 16 | \
+                                 INTEL_PT_DEFAULT_ADDR_RANGES_NUM)
+#define INTEL_PT_DEFAULT_1_EBX  (INTEL_PT_DEFAULT_PSB_BITMAP << 16 | \
+                                 INTEL_PT_DEFAULT_CYCLE_BITMAP)
 
 void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
                               uint32_t vendor2, uint32_t vendor3)
@@ -1517,6 +1507,7 @@ typedef struct X86CPUDefinition {
     int family;
     int model;
     int stepping;
+    bool has_specific_intel_pt_feature_set;
     FeatureWordArray features;
     const char *model_id;
     const CPUCaches *const cache_info;
@@ -5061,6 +5052,14 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
         env->features[w] = def->features[w];
     }
 
+    if (!def->has_specific_intel_pt_feature_set) {
+        env->use_default_intel_pt = true;
+        env->features[FEAT_14_0_EBX] = INTEL_PT_DEFAULT_0_EBX;
+        env->features[FEAT_14_0_ECX] = INTEL_PT_DEFAULT_0_ECX;
+        env->features[FEAT_14_1_EAX] = INTEL_PT_DEFAULT_1_EAX;
+        env->features[FEAT_14_1_EBX] = INTEL_PT_DEFAULT_1_EBX;
+    }
+
     /* legacy-cache defaults to 'off' if CPU model provides cache info */
     cpu->legacy_cache = !def->cache_info;
 
@@ -5465,14 +5464,11 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         if (count == 0) {
             *eax = INTEL_PT_MAX_SUBLEAF;
-            *ebx = INTEL_PT_MINIMAL_EBX;
-            *ecx = INTEL_PT_MINIMAL_ECX;
-            if (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP) {
-                *ecx |= CPUID_14_0_ECX_LIP;
-            }
+            *ebx = env->features[FEAT_14_0_EBX];
+            *ecx = env->features[FEAT_14_0_ECX];
         } else if (count == 1) {
-            *eax = INTEL_PT_MTC_BITMAP | INTEL_PT_ADDR_RANGES_NUM;
-            *ebx = INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP;
+            *eax = env->features[FEAT_14_1_EAX];
+            *ebx = env->features[FEAT_14_1_EBX];
         }
         break;
     }
@@ -6081,6 +6077,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
     CPUX86State *env = &cpu->env;
     FeatureWord w;
     const char *prefix = NULL;
+    uint64_t host_feat;
 
     if (verbose) {
         prefix = accel_uses_host_cpuid()
@@ -6089,8 +6086,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
     }
 
     for (w = 0; w < FEATURE_WORDS; w++) {
-        uint64_t host_feat =
-            x86_cpu_get_supported_feature_word(w, false);
+        host_feat = x86_cpu_get_supported_feature_word(w, false);
         uint64_t requested_features = env->features[w];
         uint64_t unavailable_features;
         if (w == FEAT_14_1_EAX) {
@@ -6107,32 +6103,22 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
         mark_unavailable_features(cpu, w, unavailable_features, prefix);
     }
 
-    if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) &&
-        kvm_enabled()) {
-        KVMState *s = CPU(cpu)->kvm_state;
-        uint32_t eax_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EAX);
-        uint32_t ebx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EBX);
-        uint32_t ecx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_ECX);
-        uint32_t eax_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EAX);
-        uint32_t ebx_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EBX);
+    if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) {
+        host_feat = x86_cpu_get_supported_feature_word(FEAT_14_0_ECX, false);
 
-        if (!eax_0 ||
-           ((ebx_0 & INTEL_PT_MINIMAL_EBX) != INTEL_PT_MINIMAL_EBX) ||
-           ((ecx_0 & INTEL_PT_MINIMAL_ECX) != INTEL_PT_MINIMAL_ECX) ||
-           ((eax_1 & INTEL_PT_MTC_BITMAP) != INTEL_PT_MTC_BITMAP) ||
-           ((eax_1 & INTEL_PT_ADDR_RANGES_NUM_MASK) <
-                                           INTEL_PT_ADDR_RANGES_NUM) ||
-           ((ebx_1 & (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) !=
-                (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) ||
-           ((ecx_0 & CPUID_14_0_ECX_LIP) !=
-                (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP))) {
-            /*
-             * Processor Trace capabilities aren't configurable, so if the
-             * host can't emulate the capabilities we report on
-             * cpu_x86_cpuid(), intel-pt can't be enabled on the current host.
-             */
+        if (env->use_default_intel_pt &&
+            ((env->features[FEAT_14_0_EBX] != INTEL_PT_DEFAULT_0_EBX) ||
+             ((env->features[FEAT_14_0_ECX] & ~CPUID_14_0_ECX_LIP) !=
+              INTEL_PT_DEFAULT_0_ECX) ||
+             (env->features[FEAT_14_1_EAX] != INTEL_PT_DEFAULT_1_EAX) ||
+             (env->features[FEAT_14_1_EBX] != INTEL_PT_DEFAULT_1_EBX))) {
             mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, prefix);
         }
+
+        if ((env->features[FEAT_14_0_ECX] ^ host_feat) & CPUID_14_0_ECX_LIP) {
+            warn_report("Cannot configure different Intel PT IP payload format than hardware");
+            mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, NULL);
+        }
     }
 }
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index f5478a169f9a..e6236c371c4f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1639,6 +1639,7 @@ typedef struct CPUX86State {
     uint32_t cpuid_vendor2;
     uint32_t cpuid_vendor3;
     uint32_t cpuid_version;
+    bool use_default_intel_pt;
     FeatureWordArray features;
     /* Features that were explicitly enabled/disabled */
     FeatureWordArray user_features;
-- 
2.27.0


