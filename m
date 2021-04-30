Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B4436F5CA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:42:00 +0200 (CEST)
Received: from localhost ([::1]:37690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcMqd-0008Nj-Bs
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMdr-0004Pu-07
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:28:50 -0400
Received: from mga11.intel.com ([192.55.52.93]:63447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMdh-00017U-NY
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:28:46 -0400
IronPort-SDR: +fSxKvdtfyPYxIyjSUnKVhAJsOJru7h7bcXi6u+q5tcowiA+wfhVORyr2VKd1j/y0Akt+dv8th
 2OH64Qh3CD9w==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194023061"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="194023061"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 23:28:28 -0700
IronPort-SDR: HEnlWbLSLR2zzAA7kVCGWzCtiyAlR+QsGl2Ilco95YWWjdlpUhz/YjSCyIfuMrnZHD0/ZdxY2c
 qtPYGBDanqRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="387258469"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 23:28:26 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH 08/32] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EBX
Date: Fri, 30 Apr 2021 14:24:31 +0800
Message-Id: <20210430062455.8117-9-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210430062455.8117-1-yang.zhong@intel.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

CPUID leaf 12_0_EBX is an Intel-defined feature bits leaf enumerating
the platform's SGX extended capabilities.  Currently there is a single
capabilitiy:

  - EXINFO: record information about #PFs and #GPs in the enclave's SSA

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.c | 21 +++++++++++++++++++++
 target/i386/cpu.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5443f69fa5..e723f52e22 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -677,6 +677,7 @@ static void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_XSAVE_XSAVEC, CPUID_XSAVE_XSAVES */
 #define TCG_14_0_ECX_FEATURES 0
 #define TCG_SGX_12_0_EAX_FEATURES 0
+#define TCG_SGX_12_0_EBX_FEATURES 0
 
 typedef enum FeatureWordType {
    CPUID_FEATURE_WORD,
@@ -1345,6 +1346,26 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .tcg_features = TCG_SGX_12_0_EAX_FEATURES,
     },
+
+    [FEAT_SGX_12_0_EBX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            "sgx-exinfo" , NULL, NULL, NULL,
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
+            .reg = R_EBX,
+        },
+        .tcg_features = TCG_SGX_12_0_EBX_FEATURES,
+    },
 };
 
 typedef struct FeatureMask {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7aba71a982..a3c91d5848 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -550,6 +550,7 @@ typedef enum FeatureWord {
     FEAT_VMX_VMFUNC,
     FEAT_14_0_ECX,
     FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
+    FEAT_SGX_12_0_EBX,  /* CPUID[EAX=0x12,ECX=0].EBX (SGX MISCSELECT[31:0]) */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.29.2.334.gfaefdd61ec


