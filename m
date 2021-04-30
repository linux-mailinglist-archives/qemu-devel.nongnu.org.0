Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EAA36F5BD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:35:10 +0200 (CEST)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcMk1-0001Ib-7I
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMdq-0004Ps-Ui
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:28:50 -0400
Received: from mga11.intel.com ([192.55.52.93]:63436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMdc-00015T-0R
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:28:44 -0400
IronPort-SDR: CXQJHmCQbjLFmlaWCHJBLPrC7/SqrzHLXKWtNO0/9jyua6E9nohc2oM5B+UEYrcuzkCNKbpBYk
 fdykk2uqGq4w==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194023056"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="194023056"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 23:28:26 -0700
IronPort-SDR: NJjs9cT+0rhxTVlzsmaBTvWE5VOGxVDVa8F3/CXfKMqXNrUSWOqQTnX1kGJGxDYbYZFSk2R91N
 /X2PIkfKK5PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="387258460"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 23:28:24 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH 07/32] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EAX
Date: Fri, 30 Apr 2021 14:24:30 +0800
Message-Id: <20210430062455.8117-8-yang.zhong@intel.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index f6afea22ca..7aba71a982 100644
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


