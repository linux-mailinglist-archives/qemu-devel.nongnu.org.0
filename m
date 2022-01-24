Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01C1497A20
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:20:04 +0100 (CET)
Received: from localhost ([::1]:60632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBua3-0003Jq-7W
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCN-0004eM-1I
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:35 -0500
Received: from mga07.intel.com ([134.134.136.100]:15228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCK-0001XC-KU
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643010932; x=1674546932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=giCWaF29Nv79Ra8oQgu1LyBma/S7UqTm0P+zed50Vqs=;
 b=hCToPum/KjCdSp68I7mL1rlS0J+WT9MNtcOralL82WG0/RJXLkyezb+j
 5DLQ79azaNIbYlKJ+PBn+CB7p9EamkNiA+1fkxFoXMYZEuq7M1fXXDJ1h
 4QlmT3oj4mPHL0x4Dxj6G9ajU5rp80tX/bT1mQJRxv21mr+huBSguB3hs
 e8Vu3NLpOdx6E4TOPZvQrU0Tn9TwxFzJ7eVKn5dJw2Jvv3I5uO5lC6o6N
 3fGKDojHy9E34EojdtX7L6mgo0Qf2ry8cARdNmYKb21bGsdWFc9aJK4RU
 /IDhGKG658AGecFufyeou/PpkmEGO/l1U8ML+Ayff6bHNgr3j2joD6RjZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="309310868"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="309310868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 23:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="494530990"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by orsmga002.jf.intel.com with ESMTP; 23 Jan 2022 23:55:23 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] x86: Add AMX CPUIDs enumeration
Date: Sun, 23 Jan 2022 23:55:21 -0800
Message-Id: <20220124075523.108875-6-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124075523.108875-1-yang.zhong@intel.com>
References: <20220124075523.108875-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
 target/i386/cpu.c     | 55 ++++++++++++++++++++++++++++++++++++++++---
 target/i386/kvm/kvm.c |  3 ++-
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ea13be0a19..9543762e7e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -578,6 +578,18 @@ static CPUCacheInfo legacy_l3_cache = {
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
@@ -847,8 +859,8 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
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
@@ -913,7 +925,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             "xsaveopt", "xsavec", "xgetbv1", "xsaves",
-            NULL, NULL, NULL, NULL,
+            "xfd", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
@@ -5589,6 +5601,43 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
index caf1388d8b..25d26a15f8 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1765,7 +1765,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
                 c = &cpuid_data.entries[cpuid_i++];
             }
             break;
-        case 0x14: {
+        case 0x14:
+        case 0x1d: {
             uint32_t times;
 
             c->function = i;

