Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3896A915C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:00:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzOZ-0000cU-3Y; Fri, 03 Mar 2023 01:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOX-0000br-4k
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:57 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOV-00058a-H1
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677826795; x=1709362795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5c06kP7uiLMBm225ID3ugPiE38Li3/qoYRGLt7ECLs=;
 b=ZJZgS1Z7DwEu56u4ShUeilhdFUzavfuWeoc3sXKHCVSWXEj9AS1xGApA
 7MNTXIo5THIz6y1/YmIBGss4h/X+X4MiCJmBg11GJ7ukri20Mp8SG9pd3
 3TQIXk9IORzy0H1n7ODDqAd+gmXg2FbTRtDmVi09sZ3X+kGCzic4lpMph
 REjOJmr9LE1LvpX4rtCdgjk0gb/BnFzv9U3QfRNIHQ4pAuLa1adeQf2Vh
 ptHaDCTw7FTovVNil7kvxzM+zodJ5lZ9Gdv2aI5AlsK6/JeQqX2/RORAH
 JK0t5Y2ZALD1Q8C9Onh+GV5qbm2pEwY1tFtOKOUxeg0l+4c04axP/qwoA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="334995831"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="334995831"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:59:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668550454"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="668550454"
Received: from linux.bj.intel.com ([10.238.157.63])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 22:59:51 -0800
From: Tao Su <tao1.su@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com, philmd@linaro.org
Subject: [PATCH v2 4/6] target/i386: Add support for AVX-VNNI-INT8 in CPUID
 enumeration
Date: Fri,  3 Mar 2023 14:59:11 +0800
Message-Id: <20230303065913.1246327-5-tao1.su@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303065913.1246327-1-tao1.su@linux.intel.com>
References: <20230303065913.1246327-1-tao1.su@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=tao1.su@linux.intel.com; helo=mga14.intel.com
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

From: Jiaxi Chen <jiaxi.chen@linux.intel.com>

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
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
---
 target/i386/cpu.c | 22 +++++++++++++++++++++-
 target/i386/cpu.h |  4 ++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9aaa373e97..246d10aa49 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -664,6 +664,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_7_0_EDX_FEATURES CPUID_7_0_EDX_FSRM
 #define TCG_7_1_EAX_FEATURES (CPUID_7_1_EAX_FZRM | CPUID_7_1_EAX_FSRS | \
           CPUID_7_1_EAX_FSRC)
+#define TCG_7_1_EDX_FEATURES 0
 #define TCG_APM_FEATURES 0
 #define TCG_6_EAX_FEATURES CPUID_6_EAX_ARAT
 #define TCG_XSAVE_FEATURES (CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1)
@@ -887,6 +888,25 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
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
@@ -5516,9 +5536,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
index 8e50617efb..d53b960f23 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -623,6 +623,7 @@ typedef enum FeatureWord {
     FEAT_SGX_12_1_EAX,  /* CPUID[EAX=0x12,ECX=1].EAX (SGX ATTRIBUTES[31:0]) */
     FEAT_XSAVE_XSS_LO,     /* CPUID[EAX=0xd,ECX=1].ECX */
     FEAT_XSAVE_XSS_HI,     /* CPUID[EAX=0xd,ECX=1].EDX */
+    FEAT_7_1_EDX,       /* CPUID[EAX=7,ECX=1].EDX */
     FEATURE_WORDS,
 } FeatureWord;
 
@@ -917,6 +918,9 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 /* Support for VPMADD52[H,L]UQ */
 #define CPUID_7_1_EAX_AVX_IFMA          (1U << 23)
 
+/* Support for VPDPB[SU,UU,SS]D[,S] */
+#define CPUID_7_1_EDX_AVX_VNNI_INT8     (1U << 4)
+
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
 
-- 
2.34.1


