Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F376E327731
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 06:44:22 +0100 (CET)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGbLx-0004uU-D3
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 00:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lGbKb-0003oH-Ky
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 00:42:57 -0500
Received: from mga12.intel.com ([192.55.52.136]:2505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lGbKY-0002Ax-PX
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 00:42:57 -0500
IronPort-SDR: F69+2DL8MU+lYdpkbpnZhsEScBxTXsnAk6ENzul+1CBMqdGKv9Ky/NWHUN82a/W9ER7+sK/YM7
 WWMk13KVSqLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="165595216"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; d="scan'208";a="165595216"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 21:42:50 -0800
IronPort-SDR: VVLhaRTGl4zmdi2yjt3iTqMNsS/jy58A7mGhDywcCFHY2u+ZfkIalKYnSTwA9eeKlVsgSCedhW
 S5i0KGD/gN7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; d="scan'208";a="397524231"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2021 21:42:48 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] i386/cpu: Expose AVX_VNNI instruction to guset
Date: Mon,  1 Mar 2021 13:15:52 +0800
Message-Id: <20210301051552.84828-2-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210301051552.84828-1-yang.zhong@intel.com>
References: <20210301051552.84828-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yang.zhong@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com
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

The release document ref below link:
https://software.intel.com/content/www/us/en/develop/download/\
intel-architecture-instruction-set-extensions-programming-reference.html

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a53446e6a..55545d8692 100644
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
index 8be39cfb62..ef5f145626 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -803,6 +803,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 /* Speculative Store Bypass Disable */
 #define CPUID_7_0_EDX_SPEC_CTRL_SSBD    (1U << 31)
 
+/* AVX VNNI Instruction */
+#define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
 
-- 
2.29.2.334.gfaefdd61ec


