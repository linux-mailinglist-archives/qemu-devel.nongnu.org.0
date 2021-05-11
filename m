Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5F379FDE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:42:40 +0200 (CEST)
Received: from localhost ([::1]:33002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgM6K-0000dc-0G
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLs5-0005yv-Kg
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:59 -0400
Received: from mga06.intel.com ([134.134.136.31]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLs0-0004ZR-D4
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:57 -0400
IronPort-SDR: avp58aZtbIQhkFJrADcQVGXj5joLDdqbpGyIwTQYqk7KMcA3es7bpCvGAkjPGMVHdP0J8rtUSe
 ve+rGDC0ripQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631500"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631500"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:27:42 -0700
IronPort-SDR: N4VAIcb+CUOHNzWGdCNOiBKHIKehqvCCylBZa5QDJv158ppkEW+997+NG14bv8rTjSLdtuw6MW
 DRBUofl3kiMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281124"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:27:40 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/32] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EAX
Date: Tue, 11 May 2021 14:20:26 +0800
Message-Id: <20210511062051.41948-8-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210511062051.41948-1-yang.zhong@intel.com>
References: <20210511062051.41948-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

CPUID leaf 12_0_EAX is an Intel-defined feature bits leaf enumerating
the CPU's SGX capabilities, e.g. supported SGX instruction sets.
Currently there are four enumerated capabilities:

  - SGX1 instruction set, i.e. "base" SGX
  - SGX2 instruction set for dynamic EPC management
  - ENCLV instruction set for VMM oversubscription of EPC
  - ENCLS-C instruction set for thread safe variants of ENCLS

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.c | 20 ++++++++++++++++++++
 target/i386/cpu.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 544d7be43c..5443f69fa5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -676,6 +676,7 @@ static void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           /* missing:
           CPUID_XSAVE_XSAVEC, CPUID_XSAVE_XSAVES */
 #define TCG_14_0_ECX_FEATURES 0
+#define TCG_SGX_12_0_EAX_FEATURES 0
 
 typedef enum FeatureWordType {
    CPUID_FEATURE_WORD,
@@ -1325,6 +1326,25 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .tcg_features = TCG_14_0_ECX_FEATURES,
      },
 
+    [FEAT_SGX_12_0_EAX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            "sgx1", "sgx2", NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .cpuid = {
+            .eax = 0x12,
+            .needs_ecx = true, .ecx = 0,
+            .reg = R_EAX,
+        },
+        .tcg_features = TCG_SGX_12_0_EAX_FEATURES,
+    },
 };
 
 typedef struct FeatureMask {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index a3f4cbcfb9..db946cf044 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -549,6 +549,7 @@ typedef enum FeatureWord {
     FEAT_VMX_BASIC,
     FEAT_VMX_VMFUNC,
     FEAT_14_0_ECX,
+    FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.29.2.334.gfaefdd61ec


