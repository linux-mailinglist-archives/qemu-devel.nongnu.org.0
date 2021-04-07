Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C89356162
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 04:24:04 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTxrP-0004sP-62
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 22:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lTxqE-0004Ax-HU
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:22:50 -0400
Received: from mga07.intel.com ([134.134.136.100]:25389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lTxqB-00060D-Vs
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:22:49 -0400
IronPort-SDR: cMz0oQgQVvzzcroHsE09t7Hr6s9w3D0dqN+rlhjMaiy0A9zAsFy77YnGn/6KCFKh1mw6apbC17
 9/CrCuM8mI6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="257188186"
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="257188186"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 19:22:41 -0700
IronPort-SDR: g31IMfkSKpjwO4vgWH2/+aqf2cxdxwvKB3xugRN2R7dCMzzk+loc1Ai4AAmAx7r+RYqshcx+as
 GWtssP7kfQnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="415056899"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 06 Apr 2021 19:22:40 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] i386/cpu: Expose AVX_VNNI instruction to guest
Date: Wed,  7 Apr 2021 09:56:09 +0800
Message-Id: <20210407015609.22936-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expose AVX (VEX-encoded) versions of the Vector Neural Network
Instructions to guest.

The bit definition:
CPUID.(EAX=7,ECX=1):EAX[bit 4] AVX_VNNI

The following instructions are available when this feature is
present in the guest.
  1. VPDPBUS: Multiply and Add Unsigned and Signed Bytes
  2. VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
  3. VPDPWSSD: Multiply and Add Signed Word Integers
  4. VPDPWSSDS: Multiply and Add Signed Integers with Saturation

As for the kvm related code, please reference Linux commit id 1085a6b585d7.

The release document ref below link:
https://software.intel.com/content/www/us/en/develop/download/\
intel-architecture-instruction-set-extensions-programming-reference.html

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b3e9467f1..f0c48f06a2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -996,7 +996,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, NULL, NULL, NULL,
-            NULL, "avx512-bf16", NULL, NULL,
+            "avx-vnni", "avx512-bf16", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
@@ -3273,7 +3273,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO |
             MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
         .features[FEAT_7_1_EAX] =
-            CPUID_7_1_EAX_AVX512_BF16,
+            CPUID_7_1_EAX_AVX_VNNI | CPUID_7_1_EAX_AVX512_BF16,
         /*
          * Missing: XSAVES (not supported by some Linux versions,
          * including v4.1 to v4.12).
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878..edc8984448 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -804,6 +804,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 /* Speculative Store Bypass Disable */
 #define CPUID_7_0_EDX_SPEC_CTRL_SSBD    (1U << 31)
 
+/* AVX VNNI Instruction */
+#define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
 
-- 
2.29.2.334.gfaefdd61ec


