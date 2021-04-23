Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B1A368B00
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 04:22:23 +0200 (CEST)
Received: from localhost ([::1]:42696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZlSZ-0003B4-4C
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 22:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lZlRI-0002Mf-Sq
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 22:21:04 -0400
Received: from mga05.intel.com ([192.55.52.43]:52063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lZlRF-0001ko-GE
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 22:21:04 -0400
IronPort-SDR: o0zbc+uod8R8X3iFq+LOSTHkN4kJRcEDRPUbsxLzdJtFrgvbfr59arB8W82L9pCPIBu0SQaxri
 kZINY5N4h/Vw==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="281334010"
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="281334010"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 19:20:53 -0700
IronPort-SDR: G4SHfjP27ethb6yl/xFcsoXXnt973ix6vwyIqbDVE9Ndq2lA06wziuJbE1jqNAV5qetoT0eT2H
 t4uUcIQVaGog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="421603820"
Received: from clx-ap-likexu.sh.intel.com ([10.239.48.108])
 by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2021 19:20:52 -0700
From: Like Xu <like.xu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH RESEND 2/2] target/i386: add kvm_exact_match_flags to
 FeatureWordInfo
Date: Fri, 23 Apr 2021 10:20:37 +0800
Message-Id: <20210423022037.24733-2-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423022037.24733-1-like.xu@linux.intel.com>
References: <20210423022037.24733-1-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=like.xu@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: wei.w.wang@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of hardcoding the PERF_CAPABILITIES rules in this loop,
this could become a FeatureWordInfo field. It would be very useful
for other features like intel-pt, where we need some bits to match
the host bits too.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 target/i386/cpu.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index eee6da3ad8..56a486b498 100644
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
@@ -6623,16 +6630,18 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
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
2.30.2


