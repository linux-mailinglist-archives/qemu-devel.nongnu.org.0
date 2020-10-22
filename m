Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56802959E4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 10:08:57 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVVea-0004jA-Mv
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 04:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luwei.kang@intel.com>)
 id 1kVVbh-0001aJ-TB
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 04:05:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:38762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luwei.kang@intel.com>)
 id 1kVVbe-0007JK-Uu
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 04:05:57 -0400
IronPort-SDR: IM5g/lqCN+NeXTqdy8pS4WbRPy7WxL12hbDPkbMaxMqHY8myAUzxuqczmXdEKXAQcGcc2CWa0T
 NNTfnmdsaaqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="146781853"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="146781853"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 01:05:49 -0700
IronPort-SDR: k14XtTapjmKLOa6BMnS2F5bJ/PmZ1K3rw6SOZZwc345LdLYChOsC4D+mo6+DO1ftatLCadcAib
 0Gg3clNXJwNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="524188772"
Received: from snr.bj.intel.com ([10.240.192.237])
 by fmsmga005.fm.intel.com with ESMTP; 22 Oct 2020 01:05:47 -0700
From: Luwei Kang <luwei.kang@intel.com>
To: pbonzini@redhat.com,
	rth@twiddle.net,
	ehabkost@redhat.com
Subject: [PATCH] i386/cpu: Expose the PTWRITE to the guest
Date: Thu, 22 Oct 2020 12:01:22 +0800
Message-Id: <20201022040122.30086-1-luwei.kang@intel.com>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=192.55.52.136; envelope-from=luwei.kang@intel.com;
 helo=mga12.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 04:05:49
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Luwei Kang <luwei.kang@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PTWRITE provides a mechanism by which software can instrument the
Intel PT trace. The current implementation will mask off this
feature when the PTWRITE is supported on the host because of the
Intel PT CPUID is a constant value(ICX CPUID) in qemu. This patch
will expose the PTWRITE feature to the guest.

Signed-off-by: Luwei Kang <luwei.kang@intel.com>
---
 target/i386/cpu.c | 24 ++++++++++++++++++++++++
 target/i386/cpu.h |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aeabdd5bd4..242ba8a870 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -672,6 +672,7 @@ static void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_XSAVE_FEATURES (CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1)
           /* missing:
           CPUID_XSAVE_XSAVEC, CPUID_XSAVE_XSAVES */
+#define TCG_14_0_EBX_FEATURES 0
 #define TCG_14_0_ECX_FEATURES 0
 
 typedef enum FeatureWordType {
@@ -1302,6 +1303,26 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         }
     },
 
+    [FEAT_14_0_EBX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            NULL, NULL, NULL, NULL,
+            "ptwrite", NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .cpuid = {
+            .eax = 0x14,
+            .needs_ecx = true, .ecx = 0,
+            .reg = R_EBX,
+        },
+        .tcg_features = TCG_14_0_EBX_FEATURES,
+    },
+
     [FEAT_14_0_ECX] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
@@ -5764,6 +5785,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *eax = INTEL_PT_MAX_SUBLEAF;
             *ebx = INTEL_PT_MINIMAL_EBX;
             *ecx = INTEL_PT_MINIMAL_ECX;
+            if (env->features[FEAT_14_0_EBX] & CPUID_14_0_EBX_PTWRITE) {
+                *ebx |= CPUID_14_0_EBX_PTWRITE;
+            }
             if (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP) {
                 *ecx |= CPUID_14_0_ECX_LIP;
             }
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1fcd93e39a..9fffe6eb6f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -541,6 +541,7 @@ typedef enum FeatureWord {
     FEAT_VMX_EPT_VPID_CAPS,
     FEAT_VMX_BASIC,
     FEAT_VMX_VMFUNC,
+    FEAT_14_0_EBX,
     FEAT_14_0_ECX,
     FEATURE_WORDS,
 } FeatureWord;
@@ -798,6 +799,9 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
 
+/* Intel PT support PTWRITE */
+#define CPUID_14_0_EBX_PTWRITE          (1U << 4)
+
 /* Packets which contain IP payload have LIP values */
 #define CPUID_14_0_ECX_LIP              (1U << 31)
 
-- 
2.18.4


