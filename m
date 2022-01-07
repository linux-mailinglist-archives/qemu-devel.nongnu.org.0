Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0EB4874C8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 10:35:20 +0100 (CET)
Received: from localhost ([::1]:55104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5leZ-00089c-G8
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 04:35:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbO-0005xv-Sf
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:02 -0500
Received: from mga05.intel.com ([192.55.52.43]:22268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbL-00078O-Nb
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641547919; x=1673083919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bjEbZOqNPQg+4twx2D0e5cvrOJH4PkiI9d217mb5H/A=;
 b=AAVDg3rD73EYFp/lkUNtb7sjW/GMHVfaQuv+OX3EATanZDdK39dZCmOR
 xULRzV4kEW3Rf0K4DV2ZzWbZp8A9jWPjRdV82YjuWfzH7iJ0s8t+QhyLO
 whqbaC8mhIgZAy7VI+xHiFd9S6vI0nugbrZ/9wEVW3CEIJ+a6qqowj5B3
 MHfmLAli7JY7PSHr+4nXK9P6Aua4v0odzgCYeQLCyHZbE6+BY7j4fUWlN
 yrV/CbYjvCiB4WGzBUqLzMxXGnr448xpYFA6jFvDzn8l/CLHxtRjEi/ht
 clvjyuzaaT5WvYFBU59ojzHkq0gLm6+C1BKQ9+KYMvSlXYWh93sRB5+ce A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="329184204"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="329184204"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 01:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="527239111"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jan 2022 01:31:43 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/7] x86: Add AMX CPUIDs enumeration
Date: Fri,  7 Jan 2022 01:31:32 -0800
Message-Id: <20220107093134.136441-6-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107093134.136441-1-yang.zhong@intel.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

Add AMX primary feature bits XFD and AMX_TILE to
enumerate the CPU's AMX capability. Meanwhile, add
AMX TILE and TMUL CPUID leaf and subleaves which
exist when AMX TILE is present to provide the maximum
capability of TILE and TMUL.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.h     |  2 ++
 target/i386/cpu.c     | 55 ++++++++++++++++++++++++++++++++++++++++---
 target/i386/kvm/kvm.c |  3 ++-
 3 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 22f7ff40a6..245e8b5a1a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -849,6 +849,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
 /* AVX512_FP16 instruction */
 #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
+/* AMX tile (two-dimensional register)*/
+#define CPUID_7_0_EDX_AMX_TILE          (1U << 24)
 /* Speculation Control */
 #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
 /* Single Thread Indirect Branch Predictors */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1adc3f0f99..025e35471f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -574,6 +574,18 @@ static CPUCacheInfo legacy_l3_cache = {
 #define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
 #define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
 
+/* CPUID Leaf 0x1D constants: */
+#define INTEL_AMX_TILE_MAX_SUBLEAF     0x1
+#define INTEL_AMX_TOTAL_TILE_BYTES     0x2000
+#define INTEL_AMX_BYTES_PER_TILE       0x400
+#define INTEL_AMX_BYTES_PER_ROW        0x40
+#define INTEL_AMX_TILE_MAX_NAMES       0x8
+#define INTEL_AMX_TILE_MAX_ROWS        0x10
+
+/* CPUID Leaf 0x1E constants: */
+#define INTEL_AMX_TMUL_MAX_K           0x10
+#define INTEL_AMX_TMUL_MAX_N           0x40
+
 void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
                               uint32_t vendor2, uint32_t vendor3)
 {
@@ -843,8 +855,8 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "avx512-vp2intersect", NULL, "md-clear", NULL,
             NULL, NULL, "serialize", NULL,
             "tsx-ldtrk", NULL, NULL /* pconfig */, NULL,
-            NULL, NULL, NULL, "avx512-fp16",
-            NULL, NULL, "spec-ctrl", "stibp",
+            NULL, NULL, "amx-bf16", "avx512-fp16",
+            "amx-tile", "amx-int8", "spec-ctrl", "stibp",
             NULL, "arch-capabilities", "core-capability", "ssbd",
         },
         .cpuid = {
@@ -909,7 +921,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             "xsaveopt", "xsavec", "xgetbv1", "xsaves",
-            NULL, NULL, NULL, NULL,
+            "xfd", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
@@ -5584,6 +5596,43 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         }
         break;
     }
+    case 0x1D: {
+        /* AMX TILE */
+        *eax = 0;
+        *ebx = 0;
+        *ecx = 0;
+        *edx = 0;
+        if (!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE)) {
+            break;
+        }
+
+        if (count == 0) {
+            /* Highest numbered palette subleaf */
+            *eax = INTEL_AMX_TILE_MAX_SUBLEAF;
+        } else if (count == 1) {
+            *eax = INTEL_AMX_TOTAL_TILE_BYTES |
+                   (INTEL_AMX_BYTES_PER_TILE << 16);
+            *ebx = INTEL_AMX_BYTES_PER_ROW | (INTEL_AMX_TILE_MAX_NAMES << 16);
+            *ecx = INTEL_AMX_TILE_MAX_ROWS;
+        }
+        break;
+    }
+    case 0x1E: {
+        /* AMX TMUL */
+        *eax = 0;
+        *ebx = 0;
+        *ecx = 0;
+        *edx = 0;
+        if (!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE)) {
+            break;
+        }
+
+        if (count == 0) {
+            /* Highest numbered palette subleaf */
+            *ebx = INTEL_AMX_TMUL_MAX_K | (INTEL_AMX_TMUL_MAX_N << 8);
+        }
+        break;
+    }
     case 0x40000000:
         /*
          * CPUID code in kvm_arch_init_vcpu() ignores stuff
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 13f8e30c2a..3fb3ddbe2b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1758,7 +1758,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
                 c = &cpuid_data.entries[cpuid_i++];
             }
             break;
-        case 0x14: {
+        case 0x14:
+        case 0x1d: {
             uint32_t times;
 
             c->function = i;

