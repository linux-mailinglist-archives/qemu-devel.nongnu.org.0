Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FCD6469A1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 08:19:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3BBe-0001fw-6H; Thu, 08 Dec 2022 02:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxi.chen@linux.intel.com>)
 id 1p3BBU-0001d9-Vg
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:19:09 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxi.chen@linux.intel.com>)
 id 1p3BBT-0006cu-98
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670483947; x=1702019947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qf0GNk59NHI7jyBhbQufqfXZz6fUEohFJIgaFuYpNM8=;
 b=jqhuzjzsc0zrGh8Bg1jZQafnpNU5oIbyH/YUyu8MpYtd+WLifMt9Y1tY
 Pj/Q3M7dLxr3NbrDEe0s2TqPYnnC0zA73srbOHM/BY33nSCjaZDfcDHZf
 KT2xJRuKryhlOjJwVu4rlaugKlneqZJQKX3oS9dAQ/uoy1VaJC2PC/sDr
 Gq/ef8ov6I/Lv/mKwCsckPPCIr58TK3uIHQFexsjLlUY4bhYxvcWcxfla
 rneva4L/zmYmDltRif+Qi0krdraTWPeBb7G42Tl/rvjuBFYPb2B7ainep
 7WRKnjhpBhwCkHYc5+Ok5sXcf0paSbF7NmT6gNdTwY0aGyWhLrJIuUC8s A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379263823"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="379263823"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 23:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="771381001"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="771381001"
Received: from jiaxichen-precision-3650-tower.sh.intel.com ([10.239.159.75])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2022 23:19:03 -0800
From: Jiaxi Chen <jiaxi.chen@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com
Subject: [PATCH 4/6] target/i386: Add support for AVX-VNNI-INT8 in CPUID
 enumeration
Date: Thu,  8 Dec 2022 15:19:15 +0800
Message-Id: <20221208071917.1923093-5-jiaxi.chen@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221208071917.1923093-1-jiaxi.chen@linux.intel.com>
References: <20221208071917.1923093-1-jiaxi.chen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=jiaxi.chen@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

AVX-VNNI-INT8 is a new set of instructions in the latest Intel platform
Sierra Forest, aims for the platform to have superior AI capabilities.
This instruction multiplies the individual bytes of two unsigned or
unsigned source operands, then adds and accumulates the results into the
destination dword element size operand.

The bit definition:
CPUID.(EAX=7,ECX=1):EDX[bit 4]

AVX-VNNI-INT8 is on a new feature bits leaf. Add a CPUID feature word
FEAT_7_1_EDX for this leaf.

Add CPUID definition for AVX-VNNI-INT8.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
---
 target/i386/cpu.c | 22 +++++++++++++++++++++-
 target/i386/cpu.h |  4 ++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5ba0fc61d2..ea1daf6b7e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -663,6 +663,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS | CPUID_7_0_ECX_VAES)
 #define TCG_7_0_EDX_FEATURES 0
 #define TCG_7_1_EAX_FEATURES 0
+#define TCG_7_1_EDX_FEATURES 0
 #define TCG_APM_FEATURES 0
 #define TCG_6_EAX_FEATURES CPUID_6_EAX_ARAT
 #define TCG_XSAVE_FEATURES (CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1)
@@ -886,6 +887,25 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .tcg_features = TCG_7_1_EAX_FEATURES,
     },
+    [FEAT_7_1_EDX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            NULL, NULL, NULL, NULL,
+            "avx-vnni-int8", NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .cpuid = {
+            .eax = 7,
+            .needs_ecx = true, .ecx = 1,
+            .reg = R_EDX,
+        },
+        .tcg_features = TCG_7_1_EDX_FEATURES,
+    },
     [FEAT_8000_0007_EDX] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
@@ -5387,9 +5407,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             }
         } else if (count == 1) {
             *eax = env->features[FEAT_7_1_EAX];
+            *edx = env->features[FEAT_7_1_EDX];
             *ebx = 0;
             *ecx = 0;
-            *edx = 0;
         } else {
             *eax = 0;
             *ebx = 0;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1223f0018b..da4fb1cfca 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -623,6 +623,7 @@ typedef enum FeatureWord {
     FEAT_SGX_12_1_EAX,  /* CPUID[EAX=0x12,ECX=1].EAX (SGX ATTRIBUTES[31:0]) */
     FEAT_XSAVE_XSS_LO,     /* CPUID[EAX=0xd,ECX=1].ECX */
     FEAT_XSAVE_XSS_HI,     /* CPUID[EAX=0xd,ECX=1].EDX */
+    FEAT_7_1_EDX,       /* CPUID[EAX=7,ECX=1].EDX */
     FEATURE_WORDS,
 } FeatureWord;
 
@@ -907,6 +908,9 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 /* Support for VPMADD52[H,L]UQ */
 #define CPUID_7_1_EAX_AVX_IFMA          (1U << 23)
 
+/* Support for VPDPB[SU,UU,SS]D[,S] */
+#define CPUID_7_1_EDX_AVX_VNNI_INT8     (1U << 4)
+
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
 
-- 
2.27.0


