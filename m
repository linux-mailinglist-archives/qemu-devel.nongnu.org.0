Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF55830A0FF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 06:04:47 +0100 (CET)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ROI-0002RM-8j
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 00:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1l6RMN-0001Wj-PX
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 00:02:47 -0500
Received: from mga01.intel.com ([192.55.52.88]:15891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1l6RML-0003NA-S1
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 00:02:47 -0500
IronPort-SDR: xJ4Sho8vQCjMpLe9+JT2O6HQNn3H0DRaG/yfZPaC5tIa3DHdKHVq3NIzdHtwGyD3miuXy1W9Jk
 4Ewzw+6rGGTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="199523990"
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; d="scan'208";a="199523990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2021 21:01:22 -0800
IronPort-SDR: TrJipL50C9kzAIHzlR6VRHMU+k3JBIzUgZPSrGloCmBk8kyzDXXVon5b/t8P8fMHZjTytVEC/3
 Xul0MrHzS9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; d="scan'208";a="390690218"
Received: from clx-ap-likexu.sh.intel.com ([10.239.48.108])
 by orsmga008.jf.intel.com with ESMTP; 31 Jan 2021 21:01:21 -0800
From: Like Xu <like.xu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v2 2/2] target/i386: add kvm_exact_match_flags to
 FeatureWordInfo
Date: Mon,  1 Feb 2021 12:54:53 +0800
Message-Id: <20210201045453.240258-2-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201045453.240258-1-like.xu@linux.intel.com>
References: <20210201045453.240258-1-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=like.xu@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo has a suggestion: instead of hardcoding the
PERF_CAPABILITIES rules in this loop, this could become a
FeatureWordInfo field. It would be very useful for other
features like intel-pt, where we need some bits to match the
host too.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 target/i386/cpu.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 80a5d3f0c2..8eaa5879ea 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -708,6 +708,8 @@ typedef struct FeatureWordInfo {
     uint64_t migratable_flags; /* Feature flags known to be migratable */
     /* Features that shouldn't be auto-enabled by "-cpu host" */
     uint64_t no_autoenable_flags;
+    /* Bits that must match host exactly when using KVM */
+    uint64_t kvm_exact_match_flags;
 } FeatureWordInfo;
 
 static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
@@ -1147,6 +1149,11 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .msr = {
             .index = MSR_IA32_PERF_CAPABILITIES,
         },
+        /*
+         * KVM is not able to emulate a VCPU with LBR_FMT different
+         * from the host, so LBR_FMT must match the host exactly.
+         */
+        .kvm_exact_match_flags = PERF_CAP_LBR_FMT,
     },
 
     [FEAT_VMX_PROCBASED_CTLS] = {
@@ -6500,16 +6507,18 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
     }
 
     for (w = 0; w < FEATURE_WORDS; w++) {
+        FeatureWordInfo *fi = &feature_word_info[w];
+        uint64_t match_flags = fi->kvm_exact_match_flags;
         uint64_t host_feat =
             x86_cpu_get_supported_feature_word(w, false);
         uint64_t requested_features = env->features[w];
         uint64_t unavailable_features = requested_features & ~host_feat;
-        if (kvm_enabled() && w == FEAT_PERF_CAPABILITIES &&
-            (requested_features & PERF_CAP_LBR_FMT)) {
-            if ((host_feat & PERF_CAP_LBR_FMT) !=
-                (requested_features & PERF_CAP_LBR_FMT)) {
-                unavailable_features |= PERF_CAP_LBR_FMT;
-            }
+        if (kvm_enabled() && match_flags) {
+            uint64_t mismatches = (requested_features & match_flags) &&
+                (requested_features ^ host_feat) & match_flags;
+            mark_unavailable_features(cpu, w,
+                mismatches, "feature doesn't match host");
+            unavailable_features &= ~match_flags;
         }
         mark_unavailable_features(cpu, w, unavailable_features, prefix);
     }
-- 
2.29.2


