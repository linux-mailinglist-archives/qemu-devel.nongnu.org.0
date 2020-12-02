Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0E2CBB43
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:12:17 +0100 (CET)
Received: from localhost ([::1]:38836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQ3U-0001i4-Kl
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luwei.kang@intel.com>)
 id 1kkP78-0000UE-Hj
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:11:58 -0500
Received: from mga03.intel.com ([134.134.136.65]:9630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luwei.kang@intel.com>)
 id 1kkP75-0001RB-Fl
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:11:58 -0500
IronPort-SDR: Y1fT9tiAQigFuc+qpREtg+o9DWHpGvlcHRgXIJ8ymoLiRAAPBq/r0pSNf1WHXA8y7xcYZNcH9Y
 CkSzElcDsj4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="173088513"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="173088513"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 02:11:48 -0800
IronPort-SDR: hfj/d3Tapuw3gQJ6L+QGHXseF0PlO5Ev0pXwab/t4YGw6VyOgc06QswZUsMUqHjbNh6klK0nQ3
 K1lAB63OtJnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="481496447"
Received: from snr.bj.intel.com ([10.240.192.134])
 by orsmga004.jf.intel.com with ESMTP; 02 Dec 2020 02:11:46 -0800
From: Luwei Kang <luwei.kang@intel.com>
To: pbonzini@redhat.com,
	rth@twiddle.net,
	ehabkost@redhat.com
Subject: [PATCH v2] i386/cpu: Make the Intel PT LIP feature configurable
Date: Wed,  2 Dec 2020 18:10:42 +0800
Message-Id: <20201202101042.11967-1-luwei.kang@intel.com>
X-Mailer: git-send-email 2.18.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=luwei.kang@intel.com;
 helo=mga03.intel.com
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
Cc: Luwei Kang <luwei.kang@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current implementation will disable the guest Intel PT feature
if the Intel PT LIP feature is supported on the host, but the LIP
feature is comming soon(e.g. SnowRidge and later).

This patch will make the guest LIP feature configurable and Intel
PT feature can be enabled in guest when the guest LIP status same
with the host.

Signed-off-by: Luwei Kang <luwei.kang@intel.com>
Message-Id: <20201014080443.23751-2-luwei.kang@intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
v1->v2:
    Add a dependency on the Intel PT flag.

    Test on SnowRidge Server(HW support LIP feature)：
    1. "-cpu host" : Intel PT enabled in guest;
    2. "-cpu Snowridge" : Intel PT disabled in guest because
       Intel PT is disabled by default;
    3. "-cpu Snowridge,+intel-pt" : Intel PT disabled in
       guest(Host LIP different from guest)
    4. "-cpu Snowridge,+intel-pt,+intel-pt-lip" : Intel PT enabled
       in guest(Host LIP same with guest)
    5. "-cpu Snowridge,+intel-pt-lip" : Intel PT disabled in guest
       and output:
       warning: This feature depends on other features that were
       not requested: CPUID.14H:ECX.intel-pt-lip [bit 31]

    Test on IceLake Server(HW don't support LIP feature)：
    1. "-cpu host" : Intel PT enabled in guest;
    2. "-cpu Icelake-Server" : Intel PT disabled in guest because
       Intel PT is disabled by default;
    3. "-cpu Icelake-Server,+intel-pt" : Intel PT enabled in
       guest(Host LIP same with guest)
    4. "-cpu Icelake-Server,+intel-pt,+intel-pt-lip" : Intel PT
       disabled in guest(Host LIP different from guest)

---
 target/i386/cpu.c | 31 ++++++++++++++++++++++++++++++-
 target/i386/cpu.h |  4 ++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5a8c96072e..900ea08283 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -672,6 +672,7 @@ static void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_XSAVE_FEATURES (CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1)
           /* missing:
           CPUID_XSAVE_XSAVEC, CPUID_XSAVE_XSAVES */
+#define TCG_14_0_ECX_FEATURES 0
 
 typedef enum FeatureWordType {
    CPUID_FEATURE_WORD,
@@ -1301,6 +1302,26 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         }
     },
 
+    [FEAT_14_0_ECX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, "intel-pt-lip",
+        },
+        .cpuid = {
+            .eax = 0x14,
+            .needs_ecx = true, .ecx = 0,
+            .reg = R_ECX,
+        },
+        .tcg_features = TCG_14_0_ECX_FEATURES,
+     },
+
 };
 
 typedef struct FeatureMask {
@@ -1373,6 +1394,10 @@ static FeatureDep feature_dependencies[] = {
         .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_RDSEED },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDSEED_EXITING },
     },
+    {
+        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
+        .to = { FEAT_14_0_ECX,              ~0ull },
+    },
     {
         .from = { FEAT_8000_0001_EDX,       CPUID_EXT2_RDTSCP },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDTSCP },
@@ -5752,6 +5777,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *eax = INTEL_PT_MAX_SUBLEAF;
             *ebx = INTEL_PT_MINIMAL_EBX;
             *ecx = INTEL_PT_MINIMAL_ECX;
+            if (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP) {
+                *ecx |= CPUID_14_0_ECX_LIP;
+            }
         } else if (count == 1) {
             *eax = INTEL_PT_MTC_BITMAP | INTEL_PT_ADDR_RANGES_NUM;
             *ebx = INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP;
@@ -6498,7 +6526,8 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
                                            INTEL_PT_ADDR_RANGES_NUM) ||
            ((ebx_1 & (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) !=
                 (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) ||
-           (ecx_0 & INTEL_PT_IP_LIP)) {
+           ((ecx_0 & CPUID_14_0_ECX_LIP) !=
+                (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP))) {
             /*
              * Processor Trace capabilities aren't configurable, so if the
              * host can't emulate the capabilities we report on
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 88e8586f8f..c4a49c06a8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -541,6 +541,7 @@ typedef enum FeatureWord {
     FEAT_VMX_EPT_VPID_CAPS,
     FEAT_VMX_BASIC,
     FEAT_VMX_VMFUNC,
+    FEAT_14_0_ECX,
     FEATURE_WORDS,
 } FeatureWord;
 
@@ -797,6 +798,9 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
 
+/* Packets which contain IP payload have LIP values */
+#define CPUID_14_0_ECX_LIP              (1U << 31)
+
 /* CLZERO instruction */
 #define CPUID_8000_0008_EBX_CLZERO      (1U << 0)
 /* Always save/restore FP error pointers */
-- 
2.18.4


