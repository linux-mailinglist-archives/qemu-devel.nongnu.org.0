Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70A3325B7C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 03:11:22 +0100 (CET)
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFSbB-0007fo-QB
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 21:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lFSZa-0005zk-FB
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 21:09:42 -0500
Received: from mga14.intel.com ([192.55.52.115]:7378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lFSZY-0002dW-Q8
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 21:09:42 -0500
IronPort-SDR: afjBJSzs5Hw7SIdwBEYNI5Kn05wJ8IlBnzuBQ4JFMUPAYDU9v3GaUdyS2rqAZE3Ye6k9s0arES
 1PJMiOsqXIBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="185057319"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="185057319"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 18:09:40 -0800
IronPort-SDR: wStmTtDX93fdampCzql84sre2j4URVf8d/sD4BMi2z7RCR0l6gO3bB84MWA3sTVRSV0/SDqp3v
 if4FVIWtiHRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="404680191"
Received: from unknown (HELO local-michael-cet-test.sh.intel.com)
 ([10.239.159.166])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2021 18:09:37 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 mtosatti@redhat.com, sean.j.christopherson@intel.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v7 6/6] target/i386: Advise CET bits in CPU/MSR feature words
Date: Fri, 26 Feb 2021 10:20:58 +0800
Message-Id: <20210226022058.24562-7-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210226022058.24562-1-weijiang.yang@intel.com>
References: <20210226022058.24562-1-weijiang.yang@intel.com>
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=weijiang.yang@intel.com; helo=mga14.intel.com
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CET SHSTK and IBT feature are enumerated via CPUID.(EAX=07H,ECX=0H):ECX[bit 7]
and EDX[bit 20]. CET state load/restore at vmentry/vmexit are enabled via
VMX_ENTRY_CTLS[bit 20] and VMX_EXIT_CTLS[bit 28].

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ef786b920e..d1dcc7210d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -954,7 +954,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, "avx512vbmi", "umip", "pku",
-            NULL /* ospke */, "waitpkg", "avx512vbmi2", NULL,
+            NULL /* ospke */, "waitpkg", "avx512vbmi2", "shstk",
             "gfni", "vaes", "vpclmulqdq", "avx512vnni",
             "avx512bitalg", NULL, "avx512-vpopcntdq", NULL,
             "la57", NULL, NULL, NULL,
@@ -977,7 +977,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "avx512-vp2intersect", NULL, "md-clear", NULL,
             NULL, NULL, "serialize", NULL,
             "tsx-ldtrk", NULL, NULL /* pconfig */, NULL,
-            NULL, NULL, NULL, NULL,
+            "ibt", NULL, NULL, NULL,
             NULL, NULL, "spec-ctrl", "stibp",
             NULL, "arch-capabilities", "core-capability", "ssbd",
         },
@@ -1239,7 +1239,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "vmx-exit-save-efer", "vmx-exit-load-efer",
                 "vmx-exit-save-preemption-timer", "vmx-exit-clear-bndcfgs",
             NULL, "vmx-exit-clear-rtit-ctl", NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            "vmx-exit-save-cet-ctl", NULL, NULL, NULL,
         },
         .msr = {
             .index = MSR_IA32_VMX_TRUE_EXIT_CTLS,
@@ -1254,7 +1254,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, "vmx-entry-ia32e-mode", NULL, NULL,
             NULL, "vmx-entry-load-perf-global-ctrl", "vmx-entry-load-pat", "vmx-entry-load-efer",
             "vmx-entry-load-bndcfgs", NULL, "vmx-entry-load-rtit-ctl", NULL,
-            NULL, NULL, NULL, NULL,
+            "vmx-entry-load-cet-ctl", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
         },
-- 
2.26.2


