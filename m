Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1ED389D40
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:46:15 +0200 (CEST)
Received: from localhost ([::1]:53714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljbVe-0007yS-By
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ljbTI-0005Aq-El
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:43:52 -0400
Received: from mga06.intel.com ([134.134.136.31]:7413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ljbTG-00075Z-Eq
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:43:48 -0400
IronPort-SDR: AzJlXZq+xY1QBc8L7BUIiQ+WEFmWAa1hgPmgAylqq4doTrgVhlCfvjOKkkSfMn+U2jSAhibLK4
 i45a+1+FbPig==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262370931"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262370931"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 22:43:36 -0700
IronPort-SDR: uGMfOOcozJnBYZqIrDXGgVBRCe/m0H9ZGSCREuEbij73URjdKVHoq9lxMwRibbcacgw04qapq5
 v2Rz3mFpBaTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="440160285"
Received: from michael-optiplex-9020.sh.intel.com ([10.239.159.172])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2021 22:43:33 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v8 1/6] target/i386: Change XSAVE related feature-word names
Date: Thu, 20 May 2021 13:57:06 +0800
Message-Id: <1621490231-4765-2-git-send-email-weijiang.yang@intel.com>
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

Rename XSAVE related feature-words for introducing XSAVES related
feature-words.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.c | 24 ++++++++++++------------
 target/i386/cpu.h |  4 ++--
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7..5c76186883 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1077,7 +1077,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .cpuid = { .eax = 6, .reg = R_EAX, },
         .tcg_features = TCG_6_EAX_FEATURES,
     },
-    [FEAT_XSAVE_COMP_LO] = {
+    [FEAT_XSAVE_XCR0_LO] = {
         .type = CPUID_FEATURE_WORD,
         .cpuid = {
             .eax = 0xD,
@@ -1090,7 +1090,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             XSTATE_OPMASK_MASK | XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK |
             XSTATE_PKRU_MASK,
     },
-    [FEAT_XSAVE_COMP_HI] = {
+    [FEAT_XSAVE_XCR0_HI] = {
         .type = CPUID_FEATURE_WORD,
         .cpuid = {
             .eax = 0xD,
@@ -1519,8 +1519,8 @@ static inline bool accel_uses_host_cpuid(void)
 
 static inline uint64_t x86_cpu_xsave_components(X86CPU *cpu)
 {
-    return ((uint64_t)cpu->env.features[FEAT_XSAVE_COMP_HI]) << 32 |
-           cpu->env.features[FEAT_XSAVE_COMP_LO];
+    return ((uint64_t)cpu->env.features[FEAT_XSAVE_XCR0_HI]) << 32 |
+           cpu->env.features[FEAT_XSAVE_XCR0_LO];
 }
 
 /* Return name of 32-bit register, from a R_* constant */
@@ -4811,8 +4811,8 @@ static const char *x86_cpu_feature_name(FeatureWord w, int bitnr)
     /* XSAVE components are automatically enabled by other features,
      * so return the original feature name instead
      */
-    if (w == FEAT_XSAVE_COMP_LO || w == FEAT_XSAVE_COMP_HI) {
-        int comp = (w == FEAT_XSAVE_COMP_HI) ? bitnr + 32 : bitnr;
+    if (w == FEAT_XSAVE_XCR0_LO || w == FEAT_XSAVE_XCR0_HI) {
+        int comp = (w == FEAT_XSAVE_XCR0_HI) ? bitnr + 32 : bitnr;
 
         if (comp < ARRAY_SIZE(x86_ext_save_areas) &&
             x86_ext_save_areas[comp].bits) {
@@ -5860,8 +5860,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         if (count == 0) {
             *ecx = xsave_area_size(x86_cpu_xsave_components(cpu));
-            *eax = env->features[FEAT_XSAVE_COMP_LO];
-            *edx = env->features[FEAT_XSAVE_COMP_HI];
+            *eax = env->features[FEAT_XSAVE_XCR0_LO];
+            *edx = env->features[FEAT_XSAVE_XCR0_HI];
             /*
              * The initial value of xcr0 and ebx == 0, On host without kvm
              * commit 412a3c41(e.g., CentOS 6), the ebx's value always == 0
@@ -6431,8 +6431,8 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
     uint64_t mask;
 
     if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
-        env->features[FEAT_XSAVE_COMP_LO] = 0;
-        env->features[FEAT_XSAVE_COMP_HI] = 0;
+        env->features[FEAT_XSAVE_XCR0_LO] = 0;
+        env->features[FEAT_XSAVE_XCR0_HI] = 0;
         return;
     }
 
@@ -6444,8 +6444,8 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
         }
     }
 
-    env->features[FEAT_XSAVE_COMP_LO] = mask;
-    env->features[FEAT_XSAVE_COMP_HI] = mask >> 32;
+    env->features[FEAT_XSAVE_XCR0_LO] = mask;
+    env->features[FEAT_XSAVE_XCR0_HI] = mask >> 32;
 }
 
 /***** Steps involved on loading and filtering CPUID data
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878..84cb6adcaa 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -526,8 +526,8 @@ typedef enum FeatureWord {
     FEAT_SVM,           /* CPUID[8000_000A].EDX */
     FEAT_XSAVE,         /* CPUID[EAX=0xd,ECX=1].EAX */
     FEAT_6_EAX,         /* CPUID[6].EAX */
-    FEAT_XSAVE_COMP_LO, /* CPUID[EAX=0xd,ECX=0].EAX */
-    FEAT_XSAVE_COMP_HI, /* CPUID[EAX=0xd,ECX=0].EDX */
+    FEAT_XSAVE_XCR0_LO, /* CPUID[EAX=0xd,ECX=0].EAX */
+    FEAT_XSAVE_XCR0_HI, /* CPUID[EAX=0xd,ECX=0].EDX */
     FEAT_ARCH_CAPABILITIES,
     FEAT_CORE_CAPABILITY,
     FEAT_PERF_CAPABILITIES,
-- 
2.26.2


