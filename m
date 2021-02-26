Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EAD325B7B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 03:11:21 +0100 (CET)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFSbA-0007bO-Ol
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 21:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lFSZW-0005sh-Hx
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 21:09:38 -0500
Received: from mga14.intel.com ([192.55.52.115]:7375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lFSZU-0002ce-It
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 21:09:38 -0500
IronPort-SDR: bGgG9aAIsVolAXPFHWeSZ+vRPPSQq0HLOyU+Hzyeh30j7jnsQU5xZqXAuFMuq6V6I4mkxtnTc+
 X/caTNLhWPqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="185057288"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="185057288"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 18:09:33 -0800
IronPort-SDR: UeD3u/olY9BJc1HeewxWiOGPguAkQ3LHsi5ShKkODOggqjxM7pppYq9G7ej4IeoZfdTLgNHyM7
 JC0VJu6A8ugQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="404680036"
Received: from unknown (HELO local-michael-cet-test.sh.intel.com)
 ([10.239.159.166])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2021 18:09:31 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 mtosatti@redhat.com, sean.j.christopherson@intel.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v7 3/6] target/i386: Enable CET components support for XSAVES
Date: Fri, 26 Feb 2021 10:20:55 +0800
Message-Id: <20210226022058.24562-4-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210226022058.24562-1-weijiang.yang@intel.com>
References: <20210226022058.24562-1-weijiang.yang@intel.com>
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=weijiang.yang@intel.com; helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

CET Shadow Stack(SHSTK) and Indirect Branch Tracking(IBT) are enumerated
via CPUID.(EAX=07H,ECX=0H):ECX[bit 7] and EDX[bit 20] respectively.
Two CET bits (bit 11 and 12) are defined in MSR_IA32_XSS for XSAVES.
They correspond to CET states in user and supervisor mode respectively.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.c | 35 +++++++++++++++++++++++++++++++++++
 target/i386/cpu.h | 23 ++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index f3923988ed..ef786b920e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1060,6 +1060,16 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     },
     [FEAT_XSAVE_XSS_LO] = {
         .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, "cet-u",
+            "cet-s", NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
         .cpuid = {
             .eax = 0xD,
             .needs_ecx = true,
@@ -1486,6 +1496,14 @@ static const ExtSaveArea x86_ext_save_areas[] = {
           { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
             .offset = offsetof(X86XSaveArea, pkru_state),
             .size = sizeof(XSavePKRU) },
+    [XSTATE_CET_U_BIT] = {
+            .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_CET_SHSTK,
+            .offset = 0,
+            .size = sizeof(XSavesCETU) },
+    [XSTATE_CET_S_BIT] = {
+            .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_CET_SHSTK,
+            .offset = 0,
+            .size = sizeof(XSavesCETS) },
 };
 
 static uint32_t xsave_area_size(uint64_t mask)
@@ -6329,6 +6347,23 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
         if (env->features[esa->feature] & esa->bits) {
             mask |= (1ULL << i);
         }
+
+        /*
+         * Both CET SHSTK and IBT feature requires XSAVES support, but two
+         * features can be controlled independently by kernel, and we only
+         * have one correlated bit set in x86_ext_save_areas, so if either
+         * of two features is enabled, we set the XSAVES support bit to make
+         * the enabled feature work.
+         */
+        if (i == XSTATE_CET_U_BIT || i == XSTATE_CET_S_BIT) {
+            uint64_t ecx = env->features[FEAT_7_0_ECX];
+            uint64_t edx = env->features[FEAT_7_0_EDX];
+
+            if ((ecx & CPUID_7_0_ECX_CET_SHSTK) ||
+                (edx & CPUID_7_0_EDX_CET_IBT)) {
+                mask |= (1ULL << i);
+            }
+        }
     }
 
     env->features[FEAT_XSAVE_XCR0_LO] = mask & CPUID_XSTATE_XCR0_MASK;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8aeaa8869a..a43fb6d597 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -493,6 +493,8 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_BIT            6
 #define XSTATE_Hi16_ZMM_BIT             7
 #define XSTATE_PKRU_BIT                 9
+#define XSTATE_CET_U_BIT                11
+#define XSTATE_CET_S_BIT                12
 
 #define XSTATE_FP_MASK                  (1ULL << XSTATE_FP_BIT)
 #define XSTATE_SSE_MASK                 (1ULL << XSTATE_SSE_BIT)
@@ -503,6 +505,8 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
+#define XSTATE_CET_U_MASK               (1ULL << XSTATE_CET_U_BIT)
+#define XSTATE_CET_S_MASK               (1ULL << XSTATE_CET_S_BIT)
 
 /* CPUID feature bits available in XCR0 */
 #define CPUID_XSTATE_XCR0_MASK  (XSTATE_FP_MASK | XSTATE_SSE_MASK | \
@@ -512,7 +516,7 @@ typedef enum X86Seg {
                                  XSTATE_Hi16_ZMM_MASK | XSTATE_PKRU_MASK)
 
 /* CPUID feature bits available in XSS */
-#define CPUID_XSTATE_XSS_MASK    0
+#define CPUID_XSTATE_XSS_MASK    (XSTATE_CET_U_MASK)
 
 /* CPUID feature words */
 typedef enum FeatureWord {
@@ -760,6 +764,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_ECX_WAITPKG           (1U << 5)
 /* Additional AVX-512 Vector Byte Manipulation Instruction */
 #define CPUID_7_0_ECX_AVX512_VBMI2      (1U << 6)
+/* CET SHSTK feature */
+#define CPUID_7_0_ECX_CET_SHSTK         (1U << 7)
 /* Galois Field New Instructions */
 #define CPUID_7_0_ECX_GFNI              (1U << 8)
 /* Vector AES Instructions */
@@ -795,6 +801,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_SERIALIZE         (1U << 14)
 /* TSX Suspend Load Address Tracking instruction */
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
+/* CET IBT feature */
+#define CPUID_7_0_EDX_CET_IBT           (1U << 20)
 /* Speculation Control */
 #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
 /* Single Thread Indirect Branch Predictors */
@@ -1285,6 +1293,19 @@ typedef struct XSavePKRU {
     uint32_t padding;
 } XSavePKRU;
 
+/* Ext. save area 11: User mode CET state */
+typedef struct XSavesCETU {
+    uint64_t u_cet;
+    uint64_t user_ssp;
+} XSavesCETU;
+
+/* Ext. save area 12: Supervisor mode CET state */
+typedef struct XSavesCETS {
+    uint64_t kernel_ssp;
+    uint64_t pl1_ssp;
+    uint64_t pl2_ssp;
+} XSavesCETS;
+
 typedef struct X86XSaveArea {
     X86LegacyXSaveArea legacy;
     X86XSaveHeader header;
-- 
2.26.2


