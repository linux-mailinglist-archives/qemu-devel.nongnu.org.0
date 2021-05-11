Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E17F379FCE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:39:22 +0200 (CEST)
Received: from localhost ([::1]:52940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgM37-0003OV-OB
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLs5-0005yx-Ox
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:59 -0400
Received: from mga06.intel.com ([134.134.136.31]:46437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLs3-0004hV-Fz
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:57 -0400
IronPort-SDR: W9uI6zspDIl3pE2d8wlYay6cWJt5TqPR1gbdSlIwpXRvIY2xR/4CSjyNnv9HfKK9lQkMy93oRB
 D7Y+P8OyiIIg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631504"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631504"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:27:46 -0700
IronPort-SDR: NyQFkCmskqi7XOReiC6l2vYMxmMOpQxEr5wYxoZcH7Cv4n/+pbNwrwzVqH7sW+hhHKWdKZrcFy
 r96rarWGbTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281155"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:27:44 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/32] i386: Add SGX CPUID leaf FEAT_SGX_12_1_EAX
Date: Tue, 11 May 2021 14:20:28 +0800
Message-Id: <20210511062051.41948-10-yang.zhong@intel.com>
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

CPUID leaf 12_1_EAX is an Intel-defined feature bits leaf enumerating
the platform's SGX capabilities that may be utilized by an enclave, e.g.
whether or not an enclave can gain access to the provision key.
Currently there are six capabilities:

  - INIT: set when the enclave has has been initialized by EINIT.  Cannot
          be set by software, i.e. forced to zero in CPUID.
  - DEBUG: permits a debugger to read/write into the enclave.
  - MODE64BIT: the enclave runs in 64-bit mode
  - PROVISIONKEY: grants has access to the provision key
  - EINITTOKENKEY: grants access to the EINIT token key, i.e. the
                   enclave can generate EINIT tokens
  - KSS: Key Separation and Sharing enabled for the enclave.

Note that the entirety of CPUID.0x12.0x1, i.e. all registers, enumerates
the allowed ATTRIBUTES (128 bits), but only bits 31:0 are directly
exposed to the user (via FEAT_12_1_EAX).  Bits 63:32 are currently all
reserved and bits 127:64 correspond to the allowed XSAVE Feature Request
Mask, which is calculated based on other CPU features, e.g. XSAVE, MPX,
AVX, etc... and is not exposed to the user.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.c | 21 +++++++++++++++++++++
 target/i386/cpu.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e723f52e22..ec12e12a33 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -678,6 +678,7 @@ static void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_14_0_ECX_FEATURES 0
 #define TCG_SGX_12_0_EAX_FEATURES 0
 #define TCG_SGX_12_0_EBX_FEATURES 0
+#define TCG_SGX_12_1_EAX_FEATURES 0
 
 typedef enum FeatureWordType {
    CPUID_FEATURE_WORD,
@@ -1366,6 +1367,26 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .tcg_features = TCG_SGX_12_0_EBX_FEATURES,
     },
+
+    [FEAT_SGX_12_1_EAX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            NULL, "sgx-debug", "sgx-mode64", NULL,
+            "sgx-provisionkey", "sgx-tokenkey", NULL, "sgx-kss",
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .cpuid = {
+            .eax = 0x12,
+            .needs_ecx = true, .ecx = 1,
+            .reg = R_EAX,
+        },
+        .tcg_features = TCG_SGX_12_1_EAX_FEATURES,
+    },
 };
 
 typedef struct FeatureMask {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index bb8db45948..b23e0a90a8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -551,6 +551,7 @@ typedef enum FeatureWord {
     FEAT_14_0_ECX,
     FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
     FEAT_SGX_12_0_EBX,  /* CPUID[EAX=0x12,ECX=0].EBX (SGX MISCSELECT[31:0]) */
+    FEAT_SGX_12_1_EAX,  /* CPUID[EAX=0x12,ECX=1].EAX (SGX ATTRIBUTES[31:0]) */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.29.2.334.gfaefdd61ec


