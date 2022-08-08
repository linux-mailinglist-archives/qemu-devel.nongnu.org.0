Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52B458C558
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 11:14:08 +0200 (CEST)
Received: from localhost ([::1]:38302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKypr-0000Rh-RB
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 05:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oKyb1-0005JU-Ot
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:58:50 -0400
Received: from mga09.intel.com ([134.134.136.24]:15910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oKyaz-0001oF-Nk
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659949125; x=1691485125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y6Bd+emfUrUHrQ4u0Fcrr+Ou+CgIfyt+4yF4G7TtuEY=;
 b=BdXb8K4ooEfZvjnpPdkWdQ71Dk+VtdgAm0trJ+O3LvJK2DczrQLRPlOE
 gnqgzs/3gfE19l1zwMi6gUsHiCgvTr2s3DNPKLRxtrzlR4AbfxI/rRQTU
 33TDWBWHImdmiuJP3igsWOA2f/jc0Lm7D9a6VEmkmU3G/YNMw/kZ7shZi
 NMxnDeR9UkYsRMv36kU8YoQ9zyt5Z32BgoTeESFHLNN63f95UcTgzIkll
 eLnbLe6MKDfHxMgmXDKFsTDWXhXDDgBX1ST6Juu3WMK8VKkzLmn4NkwfL
 WLe/pIWNR8R/ZPe4/v533wfwn9ud/hpBwOkszzoez7DfsyrjfUzz72tfg w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="291319275"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="291319275"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 01:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="931970607"
Received: from lxy-dell.sh.intel.com ([10.239.48.38])
 by fmsmga005.fm.intel.com with ESMTP; 08 Aug 2022 01:58:43 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v2 6/8] target/i386/intel-pt: Enable host pass through of
 Intel PT
Date: Mon,  8 Aug 2022 16:58:32 +0800
Message-Id: <20220808085834.3227541-7-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220808085834.3227541-1-xiaoyao.li@intel.com>
References: <20220808085834.3227541-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=xiaoyao.li@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit e37a5c7fa459 ("i386: Add Intel Processor Trace feature support")
added the support of Intel PT by making CPUID[14] of PT as fixed feature
set (from ICX) for any CPU model on any host. This truly breaks the PT
exposure on Intel SPR platform because SPR has less supported bitmap of
CPUID(0x14,1):EBX[15:0] than ICX.

To fix the problem, enable pass through of host's PT capabilities for
the cases "-cpu host/max" that it won't use default fixed PT feature set
of ICX but expand automatically based on get_supported_cpuid reported by
host. Meanwhile, it needs to ensure named CPU model still has the fixed
PT feature set to not break the live migration case of
"-cpu named_cpu_model,+intel-pt"

Introduces env->use_default_intel_pt flag.
 - True means it's old CPU model that uses fixed PT feature set of ICX.
 - False means the named CPU model has its own PT feature set.

Besides, to keep the same behavior for old CPU models that validate PT
feature set against default fixed PT feature set of ICX in addition to
validate from host's capabilities (via get_supported_cpuid) in
x86_cpu_filter_features().

In the future, new named CPU model, e.g., Sapphire Rapids, can define
its own PT feature set by setting @has_specific_intel_pt_feature_set to
true and defines it's own FEAT_14_0_EBX, FEAT_14_0_ECX, FEAT_14_1_EAX
and FEAT_14_1_EBX.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 71 ++++++++++++++++++++++++++---------------------
 target/i386/cpu.h |  1 +
 2 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b08d2d63d8bf..2664b527b8e8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5192,6 +5192,21 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
         env->features[w] = def->features[w];
     }
 
+    /*
+     * All (old) named CPU models have the same default values for INTEL_PT_*
+     *
+     * Assign the default value here since we don't want to manually copy/paste
+     * it to all entries in builtin_x86_defs.
+     */
+    if (!env->features[FEAT_14_0_EBX] && !env->features[FEAT_14_0_ECX] &&
+        !env->features[FEAT_14_1_EAX] && !env->features[FEAT_14_1_EBX]) {
+        env->use_default_intel_pt = true;
+        env->features[FEAT_14_0_EBX] = INTEL_PT_DEFAULT_0_EBX;
+        env->features[FEAT_14_0_ECX] = INTEL_PT_DEFAULT_0_ECX;
+        env->features[FEAT_14_1_EAX] = INTEL_PT_DEFAULT_1_EAX;
+        env->features[FEAT_14_1_EBX] = INTEL_PT_DEFAULT_1_EBX;
+    }
+
     /* legacy-cache defaults to 'off' if CPU model provides cache info */
     cpu->legacy_cache = !def->cache_info;
 
@@ -5714,14 +5729,11 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         if (count == 0) {
             *eax = INTEL_PT_MAX_SUBLEAF;
-            *ebx = INTEL_PT_DEFAULT_0_EBX;
-            *ecx = INTEL_PT_DEFAULT_0_ECX;
-            if (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP) {
-                *ecx |= CPUID_14_0_ECX_LIP;
-            }
+            *ebx = env->features[FEAT_14_0_EBX];
+            *ecx = env->features[FEAT_14_0_ECX];
         } else if (count == 1) {
-            *eax = INTEL_PT_DEFAULT_1_EAX;
-            *ebx = INTEL_PT_DEFAULT_1_EBX;
+            *eax = env->features[FEAT_14_1_EAX];
+            *ebx = env->features[FEAT_14_1_EBX];
         }
         break;
     }
@@ -6409,6 +6421,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
     CPUX86State *env = &cpu->env;
     FeatureWord w;
     const char *prefix = NULL;
+    uint64_t host_feat;
 
     if (verbose) {
         prefix = accel_uses_host_cpuid()
@@ -6417,8 +6430,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
     }
 
     for (w = 0; w < FEATURE_WORDS; w++) {
-        uint64_t host_feat =
-            x86_cpu_get_supported_feature_word(w, false);
+        host_feat = x86_cpu_get_supported_feature_word(w, false);
         uint64_t requested_features = env->features[w];
         uint64_t unavailable_features;
 
@@ -6442,31 +6454,26 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
         mark_unavailable_features(cpu, w, unavailable_features, prefix);
     }
 
-    if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) &&
-        kvm_enabled()) {
-        KVMState *s = CPU(cpu)->kvm_state;
-        uint32_t eax_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EAX);
-        uint32_t ebx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EBX);
-        uint32_t ecx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_ECX);
-        uint32_t eax_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EAX);
-        uint32_t ebx_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EBX);
-
-        if (!eax_0 ||
-           ((ebx_0 & INTEL_PT_DEFAULT_0_EBX) != INTEL_PT_DEFAULT_0_EBX) ||
-           ((ecx_0 & INTEL_PT_DEFAULT_0_ECX) != INTEL_PT_DEFAULT_0_ECX) ||
-           ((eax_1 & INTEL_PT_DEFAULT_MTC_BITMAP) != INTEL_PT_DEFAULT_MTC_BITMAP) ||
-           ((eax_1 & INTEL_PT_ADDR_RANGES_NUM_MASK) <
-                                      INTEL_PT_DEFAULT_ADDR_RANGES_NUM) ||
-           ((ebx_1 & INTEL_PT_DEFAULT_1_EBX) != INTEL_PT_DEFAULT_1_EBX) ||
-           ((ecx_0 & CPUID_14_0_ECX_LIP) !=
-                (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP))) {
-            /*
-             * Processor Trace capabilities aren't configurable, so if the
-             * host can't emulate the capabilities we report on
-             * cpu_x86_cpuid(), intel-pt can't be enabled on the current host.
-             */
+    if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) {
+        /*
+         * env->use_default_intel_pt is true means the CPU model doesn't have
+         * INTEL_PT_* specified. In this case, we need to check it has the
+         * value of default INTEL_PT to not break live migration
+         */
+        if (env->use_default_intel_pt &&
+            ((env->features[FEAT_14_0_EBX] != INTEL_PT_DEFAULT_0_EBX) ||
+             ((env->features[FEAT_14_0_ECX] & ~CPUID_14_0_ECX_LIP) !=
+              INTEL_PT_DEFAULT_0_ECX) ||
+             (env->features[FEAT_14_1_EAX] != INTEL_PT_DEFAULT_1_EAX) ||
+             (env->features[FEAT_14_1_EBX] != INTEL_PT_DEFAULT_1_EBX))) {
             mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, prefix);
         }
+
+        host_feat = x86_cpu_get_supported_feature_word(FEAT_14_0_ECX, false);
+        if ((env->features[FEAT_14_0_ECX] ^ host_feat) & CPUID_14_0_ECX_LIP) {
+            warn_report("Cannot configure different Intel PT IP payload format than hardware");
+            mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, NULL);
+        }
     }
 }
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 30aff5f0f41d..797f384e3fc4 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1749,6 +1749,7 @@ typedef struct CPUArchState {
     uint32_t cpuid_vendor2;
     uint32_t cpuid_vendor3;
     uint32_t cpuid_version;
+    bool use_default_intel_pt;
     FeatureWordArray features;
     /* Features that were explicitly enabled/disabled */
     FeatureWordArray user_features;
-- 
2.27.0


