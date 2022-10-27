Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2A760EDC6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 04:09:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onsCy-0001eO-Sp; Wed, 26 Oct 2022 22:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1onsCh-0001Zc-37
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:01:09 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1onsCc-0004uO-AY
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666836062; x=1698372062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F9Rn29zR/Z9XakMroorv4VOXbXgVF+MyPK2naYDp0yY=;
 b=ijf2/mREEGpo4Zm2FCf6jbE0An2lXRgiW8eZ78USoESal5R7ogETPOAl
 q/2hMPArsl5yDjfHxrRl3kUaQjwdCOjQ7BSO/UxFLYP55UcrQkmpilsKo
 lbRkAW41RhsVefGMgRyrZwZmIAuZd0o3jMAKcc4pMvLk2mF6ozE0ljZ3i
 QXmh8g98SNpt9l/9oCqh7N39GLS7NaXFNBKezN8jJaxD2sPU83uCaVE5T
 s1yNoUzIaQw2d1NGAZFDqD9YZSXgnNe3JQZRs32ivW/b08gjT2n+Rojzs
 PhBTLTZC2Skg9CBqQmbuboUo6ni3xdjNV7riKIkIcKmHlZzhlzpHYp4yv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="370174872"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="370174872"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:00:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="877407939"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="877407939"
Received: from b49691a74b20.jf.intel.com ([10.45.76.123])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:00:38 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: [PATCH 4/6] i386: Mask and report unavailable multi-bit feature values
Date: Wed, 26 Oct 2022 19:00:34 -0700
Message-Id: <20221027020036.373140-5-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027020036.373140-1-lei4.wang@intel.com>
References: <20221027020036.373140-1-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=lei4.wang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Some feature words, e.g., feature words in AMX-related CPUID leaf 0x1D and
0x1E are not bit-wise but multiple bits represents one value. Handle this
situation when the values specified are not the same as which are reported
by KVM. The handling includes:

 - The responsibility of masking bits and giving warnings are delegated to
   the feature enabler. A framwork is also provided to enable this.
 - To simplify the initialization, a default function is provided if the
   the function is not specified.

The reason why delegating this responsibility rather than just marking
them as zeros when they are not same is because different multi-bit
features may have different logic, which is case by case, for example:

 1. CPUID.0x14_0x1:EBX[15:0]. Even though it's multi-bits field, it's a
    bitmap and each bit represents a separate capability.

 2. CPUID.0x14_0x1:EAX[2:0] represents the number of configurable Address
    Ranges. 3 bits as a whole to represent a integer value. It means the
    maximum capability of HW. If KVM reports M, then M to 0 is legal
    value to configure (because KVM can emulate each value correctly).

 3. CPUID.0x1D_0x1:EAX[31:16] represents palette 1 bytes_per_tile. 16 bits
    as a whole represent an integer value. It's not like case 2 and SW
    needs to configure the same value as reported. Because it's not
    possible for SW to configure to a different value and KVM cannot
    emulate it.

So marking them blindly as zeros is incorrect, and delegating this
responsibility can let each multi-bit feature have its own way to mask bits.

Signed-off-by: Wang, Lei <lei4.wang@intel.com>
---
 target/i386/cpu-internal.h |  2 ++
 target/i386/cpu.c          | 39 ++++++++++++++++++++++++++++++++++----
 target/i386/cpu.h          |  2 ++
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
index 66b3d66cb4..f973046b4e 100644
--- a/target/i386/cpu-internal.h
+++ b/target/i386/cpu-internal.h
@@ -30,6 +30,8 @@ typedef struct MultiBitFeatureInfo {
     uint64_t mask;
     unsigned high_bit_position;
     unsigned low_bit_position;
+    void (*mark_unavailable_bits)(X86CPU *cpu, FeatureWord w, int index,
+                                  const char *verbose_prefix);
 } MultiBitFeatureInfo;
 
 typedef struct FeatureWordInfo {
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 7ae232ab18..fc120c0694 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4377,6 +4377,26 @@ static bool x86_cpu_have_filtered_features(X86CPU *cpu)
     return false;
 }
 
+void mark_unavailable_bits(X86CPU *cpu, FeatureWord w, int index,
+                           const char *verbose_prefix)
+{
+    FeatureWordInfo *f = &feature_word_info[w];
+    g_autofree char *feat_word_str = feature_word_description(f);
+    uint64_t host_feat = x86_cpu_get_supported_feature_word(w, false);
+    MultiBitFeatureInfo mf = f->multi_bit_features[index];
+
+    if ((cpu->env.features[w] ^ host_feat) & mf.mask) {
+        if (!cpu->force_features) {
+            cpu->env.features[w] &= ~mf.mask;
+        }
+        cpu->filtered_features[w] |= mf.mask;
+        if (verbose_prefix)
+            warn_report("%s: %s.%s [%u:%u]", verbose_prefix, feat_word_str,
+                        mf.feat_name, mf.high_bit_position,
+                        mf.low_bit_position);
+    }
+}
+
 static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
                                       const char *verbose_prefix)
 {
@@ -6424,10 +6444,21 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
     }
 
     for (w = 0; w < FEATURE_WORDS; w++) {
-        uint64_t host_feat =
-            x86_cpu_get_supported_feature_word(w, false);
-        uint64_t requested_features = env->features[w];
-        uint64_t unavailable_features = requested_features & ~host_feat;
+        uint64_t host_feat = x86_cpu_get_supported_feature_word(w, false);
+        FeatureWordInfo f = feature_word_info[w];
+        uint64_t unavailable_features = env->features[w] & ~host_feat;
+        int i;
+
+        for (i = 0; i < f.num_multi_bit_features; i++) {
+            MultiBitFeatureInfo mf = f.multi_bit_features[i];
+            if (!mf.mark_unavailable_bits) {
+                mf.mark_unavailable_bits = mark_unavailable_bits;
+            }
+            mf.mark_unavailable_bits(cpu, w, i, prefix);
+
+            unavailable_features &= ~mf.mask;
+        }
+
         mark_unavailable_features(cpu, w, unavailable_features, prefix);
     }
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1c90fb6c9d..824a2b0f85 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2103,6 +2103,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 void cpu_clear_apic_feature(CPUX86State *env);
 void host_cpuid(uint32_t function, uint32_t count,
                 uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx);
+void mark_unavailable_bits(X86CPU *cpu, FeatureWord w, int index,
+                           const char *verbose_prefix);
 
 /* helper.c */
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
-- 
2.34.1


