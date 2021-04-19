Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754B4363F9E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:31:09 +0200 (CEST)
Received: from localhost ([::1]:38258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRBM-0004E3-Fy
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR3H-0003xT-IG
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:22:49 -0400
Received: from mga17.intel.com ([192.55.52.151]:24099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR3E-00025K-53
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:22:47 -0400
IronPort-SDR: 0/5guTeO0dcDmW67WBl/1ToEx7sas2Oq5bspY0RZLOsP07s7CICNupu2PvLyzGu9fSBR8xmIms
 7bzDTwKJekSA==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="175409267"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="175409267"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:22:39 -0700
IronPort-SDR: U8ZRwwND6nnQW98R5fF59erlZZzWC/KR60nFA3Y5lmtmNIWX8qdKGqmk+ftd4wAe/48P7lLBsj
 rkfhF4ene0NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="419947328"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 03:22:38 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/32] i386: Add primary SGX CPUID and MSR defines
Date: Mon, 19 Apr 2021 18:01:30 +0800
Message-Id: <20210419100156.53504-7-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210419100156.53504-1-yang.zhong@intel.com>
References: <20210419100156.53504-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
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

Add CPUID defines for SGX and SGX Launch Control (LC), as well as
defines for their associated FEATURE_CONTROL MSR bits.  Define the
Launch Enclave Public Key Hash MSRs (LE Hash MSRs), which exist
when SGX LC is present (in CPUID), and are writable when SGX LC is
enabled (in FEATURE_CONTROL).

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.c |  4 ++--
 target/i386/cpu.h | 12 ++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7..544d7be43c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -938,7 +938,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     [FEAT_7_0_EBX] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
-            "fsgsbase", "tsc-adjust", NULL, "bmi1",
+            "fsgsbase", "tsc-adjust", "sgx", "bmi1",
             "hle", "avx2", NULL, "smep",
             "bmi2", "erms", "invpcid", "rtm",
             NULL, NULL, "mpx", NULL,
@@ -964,7 +964,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "la57", NULL, NULL, NULL,
             NULL, NULL, "rdpid", NULL,
             "bus-lock-detect", "cldemote", NULL, "movdiri",
-            "movdir64b", NULL, NULL, "pks",
+            "movdir64b", NULL, "sgxlc", "pks",
         },
         .cpuid = {
             .eax = 7,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878..f074a315d1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -360,9 +360,17 @@ typedef enum X86Seg {
 #define MSR_IA32_PKRS                   0x6e1
 
 #define FEATURE_CONTROL_LOCKED                    (1<<0)
+#define FEATURE_CONTROL_VMXON_ENABLED_INSIDE_SMX  (1 << 1)
 #define FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX (1<<2)
+#define FEATURE_CONTROL_SGX_LC                    (1 << 17)
+#define FEATURE_CONTROL_SGX                       (1 << 18)
 #define FEATURE_CONTROL_LMCE                      (1<<20)
 
+#define MSR_IA32_SGXLEPUBKEYHASH0       0x8c
+#define MSR_IA32_SGXLEPUBKEYHASH1       0x8d
+#define MSR_IA32_SGXLEPUBKEYHASH2       0x8e
+#define MSR_IA32_SGXLEPUBKEYHASH3       0x8f
+
 #define MSR_P6_PERFCTR0                 0xc1
 
 #define MSR_IA32_SMBASE                 0x9e
@@ -689,6 +697,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 
 /* Support RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE */
 #define CPUID_7_0_EBX_FSGSBASE          (1U << 0)
+/* Support SGX */
+#define CPUID_7_0_EBX_SGX               (1U << 2)
 /* 1st Group of Advanced Bit Manipulation Extensions */
 #define CPUID_7_0_EBX_BMI1              (1U << 3)
 /* Hardware Lock Elision */
@@ -776,6 +786,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_ECX_MOVDIRI           (1U << 27)
 /* Move 64 Bytes as Direct Store Instruction */
 #define CPUID_7_0_ECX_MOVDIR64B         (1U << 28)
+/* Support SGX Launch Control */
+#define CPUID_7_0_ECX_SGX_LC            (1U << 30)
 /* Protection Keys for Supervisor-mode Pages */
 #define CPUID_7_0_ECX_PKS               (1U << 31)
 
-- 
2.29.2.334.gfaefdd61ec


