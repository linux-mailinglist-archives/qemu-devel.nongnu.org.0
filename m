Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3687A389D3E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:46:12 +0200 (CEST)
Received: from localhost ([::1]:53358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljbVb-0007je-3o
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ljbTE-00055R-Af
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:43:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:7415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ljbTB-00077a-3L
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:43:44 -0400
IronPort-SDR: koB/Bo5SQBLg3kGrUP5a6vm4HnQJFzzjOpgHwZcO9oLyxfV2wnIi2CGT6q2DigH76AIc+vPWvH
 KtD9QU5CIqTg==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262370935"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262370935"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 22:43:38 -0700
IronPort-SDR: X046M9kit6O+KxosRLzmdIpqGw7kIR0IPI+3yCpsCuxmdVSCNn2vqSQLT3FBAhMFdV/cbZvV/v
 V2jOpawWE8tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="440160296"
Received: from michael-optiplex-9020.sh.intel.com ([10.239.159.172])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2021 22:43:36 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v8 2/6] target/i386: Enable XSS feature CPUID enumeration
Date: Thu, 20 May 2021 13:57:07 +0800
Message-Id: <1621490231-4765-3-git-send-email-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621490231-4765-1-git-send-email-weijiang.yang@intel.com>
References: <1621490231-4765-1-git-send-email-weijiang.yang@intel.com>
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=weijiang.yang@intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, CPUID.(EAX=0DH,ECX=01H) doesn't enumerate features in XSS
properly, so enable the support. XCR0 bits indicate user-mode XSAVE
components, and XSS bits indicate supervisor-mode XSAVE components.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.c | 68 +++++++++++++++++++++++++++++++++++++++--------
 target/i386/cpu.h |  9 +++++++
 2 files changed, 66 insertions(+), 11 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5c76186883..d74d68e319 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1062,6 +1062,24 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .tcg_features = TCG_XSAVE_FEATURES,
     },
+    [FEAT_XSAVE_XSS_LO] = {
+        .type = CPUID_FEATURE_WORD,
+        .cpuid = {
+            .eax = 0xD,
+            .needs_ecx = true,
+            .ecx = 1,
+            .reg = R_ECX,
+        },
+    },
+    [FEAT_XSAVE_XSS_HI] = {
+        .type = CPUID_FEATURE_WORD,
+        .cpuid = {
+            .eax = 0xD,
+            .needs_ecx = true,
+            .ecx = 1,
+            .reg = R_EDX
+        },
+    },
     [FEAT_6_EAX] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
@@ -1453,6 +1471,9 @@ typedef struct ExtSaveArea {
     uint32_t offset, size;
 } ExtSaveArea;
 
+/* CPUID feature bits available in XSS */
+#define CPUID_XSTATE_XSS_MASK    0
+
 static const ExtSaveArea x86_ext_save_areas[] = {
     [XSTATE_FP_BIT] = {
         /* x87 FP state component is always enabled if XSAVE is supported */
@@ -1498,15 +1519,18 @@ static const ExtSaveArea x86_ext_save_areas[] = {
             .size = sizeof(XSavePKRU) },
 };
 
-static uint32_t xsave_area_size(uint64_t mask)
+static uint32_t xsave_area_size(uint64_t mask, bool compacted)
 {
+    uint64_t ret = x86_ext_save_areas[0].size;
+    const ExtSaveArea *esa;
+    uint32_t offset = 0;
     int i;
-    uint64_t ret = 0;
 
-    for (i = 0; i < ARRAY_SIZE(x86_ext_save_areas); i++) {
-        const ExtSaveArea *esa = &x86_ext_save_areas[i];
+    for (i = 2; i < ARRAY_SIZE(x86_ext_save_areas); i++) {
+        esa = &x86_ext_save_areas[i];
         if ((mask >> i) & 1) {
-            ret = MAX(ret, esa->offset + esa->size);
+            offset = compacted ? ret : esa->offset;
+            ret = MAX(ret, offset + esa->size);
         }
     }
     return ret;
@@ -1517,7 +1541,7 @@ static inline bool accel_uses_host_cpuid(void)
     return kvm_enabled() || hvf_enabled();
 }
 
-static inline uint64_t x86_cpu_xsave_components(X86CPU *cpu)
+static inline uint64_t x86_cpu_xsave_xcr0_components(X86CPU *cpu)
 {
     return ((uint64_t)cpu->env.features[FEAT_XSAVE_XCR0_HI]) << 32 |
            cpu->env.features[FEAT_XSAVE_XCR0_LO];
@@ -1532,6 +1556,12 @@ static const char *get_register_name_32(unsigned int reg)
     return x86_reg_info_32[reg].name;
 }
 
+static inline uint64_t x86_cpu_xsave_xss_components(X86CPU *cpu)
+{
+    return ((uint64_t)cpu->env.features[FEAT_XSAVE_XSS_HI]) << 32 |
+           cpu->env.features[FEAT_XSAVE_XSS_LO];
+}
+
 /*
  * Returns the set of feature flags that are supported and migratable by
  * QEMU, for a given FeatureWord.
@@ -5859,7 +5889,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         }
 
         if (count == 0) {
-            *ecx = xsave_area_size(x86_cpu_xsave_components(cpu));
+            *ecx = xsave_area_size(x86_cpu_xsave_xcr0_components(cpu), false);
             *eax = env->features[FEAT_XSAVE_XCR0_LO];
             *edx = env->features[FEAT_XSAVE_XCR0_HI];
             /*
@@ -5868,14 +5898,25 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
              * even through guest update xcr0, this will crash some legacy guest
              * (e.g., CentOS 6), So set ebx == ecx to workaroud it.
              */
-            *ebx = kvm_enabled() ? *ecx : xsave_area_size(env->xcr0);
+            *ebx = kvm_enabled() ? *ecx : xsave_area_size(env->xcr0, false);
         } else if (count == 1) {
+            uint64_t xstate = x86_cpu_xsave_xcr0_components(cpu) |
+                              x86_cpu_xsave_xss_components(cpu);
+
             *eax = env->features[FEAT_XSAVE];
+            *ebx = xsave_area_size(xstate, true);
+            *ecx = env->features[FEAT_XSAVE_XSS_LO];
+            *edx = env->features[FEAT_XSAVE_XSS_HI];
         } else if (count < ARRAY_SIZE(x86_ext_save_areas)) {
-            if ((x86_cpu_xsave_components(cpu) >> count) & 1) {
-                const ExtSaveArea *esa = &x86_ext_save_areas[count];
+            const ExtSaveArea *esa = &x86_ext_save_areas[count];
+
+            if ((x86_cpu_xsave_xcr0_components(cpu) >> count) & 1) {
                 *eax = esa->size;
                 *ebx = esa->offset;
+            } else if ((x86_cpu_xsave_xss_components(cpu) >> count) & 1) {
+                *eax = esa->size;
+                *ebx = 0;
+                *ecx = 1;
             }
         }
         break;
@@ -6206,6 +6247,9 @@ static void x86_cpu_reset(DeviceState *dev)
     }
     for (i = 2; i < ARRAY_SIZE(x86_ext_save_areas); i++) {
         const ExtSaveArea *esa = &x86_ext_save_areas[i];
+        if (!((1 << i) & CPUID_XSTATE_XCR0_MASK)) {
+            continue;
+        }
         if (env->features[esa->feature] & esa->bits) {
             xcr0 |= 1ull << i;
         }
@@ -6444,8 +6488,10 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
         }
     }
 
-    env->features[FEAT_XSAVE_XCR0_LO] = mask;
+    env->features[FEAT_XSAVE_XCR0_LO] = mask & CPUID_XSTATE_XCR0_MASK;
     env->features[FEAT_XSAVE_XCR0_HI] = mask >> 32;
+    env->features[FEAT_XSAVE_XSS_LO] = mask & CPUID_XSTATE_XSS_MASK;
+    env->features[FEAT_XSAVE_XSS_HI] = mask >> 32;
 }
 
 /***** Steps involved on loading and filtering CPUID data
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 84cb6adcaa..42f835d455 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -503,6 +503,13 @@ typedef enum X86Seg {
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
 
+/* CPUID feature bits available in XCR0 */
+#define CPUID_XSTATE_XCR0_MASK  (XSTATE_FP_MASK | XSTATE_SSE_MASK | \
+                                 XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK | \
+                                 XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK | \
+                                 XSTATE_ZMM_Hi256_MASK | \
+                                 XSTATE_Hi16_ZMM_MASK | XSTATE_PKRU_MASK)
+
 /* CPUID feature words */
 typedef enum FeatureWord {
     FEAT_1_EDX,         /* CPUID[1].EDX */
@@ -541,6 +548,8 @@ typedef enum FeatureWord {
     FEAT_VMX_BASIC,
     FEAT_VMX_VMFUNC,
     FEAT_14_0_ECX,
+    FEAT_XSAVE_XSS_LO,     /* CPUID[EAX=0xd,ECX=1].ECX */
+    FEAT_XSAVE_XSS_HI,     /* CPUID[EAX=0xd,ECX=1].EDX */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.26.2


