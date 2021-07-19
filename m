Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBFB3CD3FE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:37:50 +0200 (CEST)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Ran-0007GH-By
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RQi-0004EI-Vz
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:27:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:16178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RQh-000611-3B
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:27:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="211035212"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="211035212"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 04:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="656813592"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2021 04:27:19 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/33] i386: Add SGX CPUID leaf FEAT_SGX_12_1_EAX
Date: Mon, 19 Jul 2021 19:21:12 +0800
Message-Id: <20210719112136.57018-10-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210719112136.57018-1-yang.zhong@intel.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
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
index 0525a4cf7f..840f825431 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -655,6 +655,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_14_0_ECX_FEATURES 0
 #define TCG_SGX_12_0_EAX_FEATURES 0
 #define TCG_SGX_12_0_EBX_FEATURES 0
+#define TCG_SGX_12_1_EAX_FEATURES 0
 
 FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     [FEAT_1_EDX] = {
@@ -1222,6 +1223,26 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
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
index a71d1c8fd0..e4d46cca80 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -563,6 +563,7 @@ typedef enum FeatureWord {
     FEAT_14_0_ECX,
     FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
     FEAT_SGX_12_0_EBX,  /* CPUID[EAX=0x12,ECX=0].EBX (SGX MISCSELECT[31:0]) */
+    FEAT_SGX_12_1_EAX,  /* CPUID[EAX=0x12,ECX=1].EAX (SGX ATTRIBUTES[31:0]) */
     FEATURE_WORDS,
 } FeatureWord;
 

