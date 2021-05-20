Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4BC389D3F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:46:13 +0200 (CEST)
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljbVc-0007on-Eu
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ljbTF-00055s-S0
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:43:45 -0400
Received: from mga06.intel.com ([134.134.136.31]:7412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ljbTD-000736-St
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:43:45 -0400
IronPort-SDR: 0YcZntxZmMWRXg8pRQQm0s7XZMDFAX7yp5qF5sOeoLj9p8PNgeq6Fjx8BLVVMLvNEcSh3U2Z7r
 0NhFSf9HeipQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262370940"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262370940"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 22:43:41 -0700
IronPort-SDR: ar0N9UY+xr+HJvOfO2f4rKmGcGWNRQKYWaLSpahhINj89QNu6AMCJASfI73y9NJnpau60EGe0A
 iKFoBQEL3N9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="440160306"
Received: from michael-optiplex-9020.sh.intel.com ([10.239.159.172])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2021 22:43:38 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v8 3/6] target/i386: Enable XSAVES support for CET states
Date: Thu, 20 May 2021 13:57:08 +0800
Message-Id: <1621490231-4765-4-git-send-email-weijiang.yang@intel.com>
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

CET Shadow Stack(SHSTK) and Indirect Branch Tracking(IBT) are enumerated
via CPUID.(EAX=07H,ECX=0H):ECX[bit 7] and EDX[bit 20] respectively.
Two CET bits (bit 11 and 12) are defined in MSR_IA32_XSS for XSAVES.
They correspond to CET states in user and supervisor mode respectively.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 target/i386/cpu.h | 21 +++++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d74d68e319..bae827c8d5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1064,6 +1064,16 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
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
@@ -1472,7 +1482,7 @@ typedef struct ExtSaveArea {
 } ExtSaveArea;
 
 /* CPUID feature bits available in XSS */
-#define CPUID_XSTATE_XSS_MASK    0
+#define CPUID_XSTATE_XSS_MASK    (XSTATE_CET_U_MASK)
 
 static const ExtSaveArea x86_ext_save_areas[] = {
     [XSTATE_FP_BIT] = {
@@ -1517,6 +1527,19 @@ static const ExtSaveArea x86_ext_save_areas[] = {
           { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
             .offset = offsetof(X86XSaveArea, pkru_state),
             .size = sizeof(XSavePKRU) },
+    [XSTATE_CET_U_BIT] = {
+            .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_CET_SHSTK,
+        /*
+         * The features enabled in XSS MSR always use compacted format
+         * to store the data, in this case .offset == 0. And CET bits
+         * fall into this category.
+         */
+            .offset = 0,
+            .size = sizeof(XSavesCETU) },
+    [XSTATE_CET_S_BIT] = {
+            .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_CET_SHSTK,
+            .offset = 0,
+            .size = sizeof(XSavesCETS) },
 };
 
 static uint32_t xsave_area_size(uint64_t mask, bool compacted)
@@ -6486,6 +6509,23 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
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
index 42f835d455..593a2d6823 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -492,6 +492,8 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_BIT            6
 #define XSTATE_Hi16_ZMM_BIT             7
 #define XSTATE_PKRU_BIT                 9
+#define XSTATE_CET_U_BIT                11
+#define XSTATE_CET_S_BIT                12
 
 #define XSTATE_FP_MASK                  (1ULL << XSTATE_FP_BIT)
 #define XSTATE_SSE_MASK                 (1ULL << XSTATE_SSE_BIT)
@@ -502,6 +504,8 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
+#define XSTATE_CET_U_MASK               (1ULL << XSTATE_CET_U_BIT)
+#define XSTATE_CET_S_MASK               (1ULL << XSTATE_CET_S_BIT)
 
 /* CPUID feature bits available in XCR0 */
 #define CPUID_XSTATE_XCR0_MASK  (XSTATE_FP_MASK | XSTATE_SSE_MASK | \
@@ -761,6 +765,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_ECX_WAITPKG           (1U << 5)
 /* Additional AVX-512 Vector Byte Manipulation Instruction */
 #define CPUID_7_0_ECX_AVX512_VBMI2      (1U << 6)
+/* CET SHSTK feature */
+#define CPUID_7_0_ECX_CET_SHSTK         (1U << 7)
 /* Galois Field New Instructions */
 #define CPUID_7_0_ECX_GFNI              (1U << 8)
 /* Vector AES Instructions */
@@ -800,6 +806,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_SERIALIZE         (1U << 14)
 /* TSX Suspend Load Address Tracking instruction */
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
+/* CET IBT feature */
+#define CPUID_7_0_EDX_CET_IBT           (1U << 20)
 /* AVX512_FP16 instruction */
 #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
 /* Speculation Control */
@@ -1301,6 +1309,19 @@ typedef struct XSavePKRU {
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


