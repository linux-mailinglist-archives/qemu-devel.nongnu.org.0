Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706504B843D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:29:03 +0100 (CET)
Received: from localhost ([::1]:55048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGcQ-0002lf-HH
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:29:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5g-0005UB-Bu
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:12 -0500
Received: from mga14.intel.com ([192.55.52.115]:10641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5e-0002zd-J2
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645001710; x=1676537710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QzBCP5M4wMF4q22jDeU36YFp1BmxRx/56eXR+XroOIE=;
 b=EWJd7H7/oXqVgbt5pSww7u4Hc7orRJgF1s7cMhbpPUH441YxSt4zOSnP
 qjTWiGRiBJYm2EDQ1HowmTr1Om5WYShi3a8CgcswRgmrLksJOvv8I+m9S
 CnrJ5cgbaHTAn7VXme1RL6mXWsQmNfEJhsqrCOjRn72RxoK1w2qbzJSe3
 pKBowkszz+j1thCh5jpMq3MyHZLSx03HubamdElikKhRQKsX/EbTukMLe
 Xa+rqHs7oWAl8ryfNi+AM52Y1A73L56Lfk+3W8FgUXy23UHBsEw9j7z6n
 ps0Uv4kyX1WCNv0OzF5QtxCrr0BVyKvfH3mGKT28H/E3U2DTAd9p7Nsmp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250756928"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="250756928"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="633418296"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:07 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, like.xu.linux@gmail.com,
 wei.w.wang@intel.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH 8/8] target/i386: Support Arch LBR in CPUID enumeration
Date: Tue, 15 Feb 2022 14:52:58 -0500
Message-Id: <20220215195258.29149-9-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220215195258.29149-1-weijiang.yang@intel.com>
References: <20220215195258.29149-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=weijiang.yang@intel.com; helo=mga14.intel.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.083, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If CPUID.(EAX=07H, ECX=0):EDX[19] is set to 1, the processor
supports Architectural LBRs. In this case, CPUID leaf 01CH
indicates details of the Architectural LBRs capabilities.
XSAVE support for Architectural LBRs is enumerated in
CPUID.(EAX=0DH, ECX=0FH).

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e505c926b2..1092618683 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -858,7 +858,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "fsrm", NULL, NULL, NULL,
             "avx512-vp2intersect", NULL, "md-clear", NULL,
             NULL, NULL, "serialize", NULL,
-            "tsx-ldtrk", NULL, NULL /* pconfig */, NULL,
+            "tsx-ldtrk", NULL, NULL /* pconfig */, "arch-lbr",
             NULL, NULL, "amx-bf16", "avx512-fp16",
             "amx-tile", "amx-int8", "spec-ctrl", "stibp",
             NULL, "arch-capabilities", "core-capability", "ssbd",
@@ -5494,6 +5494,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         assert(!(*eax & ~0x1f));
         *ebx &= 0xffff; /* The count doesn't need to be reliable. */
         break;
+    case 0x1C:
+        *eax = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x1C, 0, R_EAX);
+        *ebx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x1C, 0, R_EBX);
+        *ecx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x1C, 0, R_ECX);
+        *edx = 0;
+        break;
     case 0x1F:
         /* V2 Extended Topology Enumeration Leaf */
         if (env->nr_dies < 2) {
@@ -5556,6 +5562,19 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *ebx = xsave_area_size(xstate, true);
             *ecx = env->features[FEAT_XSAVE_XSS_LO];
             *edx = env->features[FEAT_XSAVE_XSS_HI];
+            if (kvm_enabled() && cpu->enable_pmu &&
+                (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR) &&
+                (*eax & CPUID_XSAVE_XSAVES)) {
+                *ecx |= XSTATE_ARCH_LBR_MASK;
+            } else {
+                *ecx &= ~XSTATE_ARCH_LBR_MASK;
+            }
+        } else if (count == 0xf && kvm_enabled() && cpu->enable_pmu &&
+                   (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR)) {
+            *eax = kvm_arch_get_supported_cpuid(cs->kvm_state, 0xD, 0xf, R_EAX);
+            *ebx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0xD, 0xf, R_EBX);
+            *ecx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0xD, 0xf, R_ECX);
+            *edx = kvm_arch_get_supported_cpuid(cs->kvm_state, 0xD, 0xf, R_EDX);
         } else if (count < ARRAY_SIZE(x86_ext_save_areas)) {
             const ExtSaveArea *esa = &x86_ext_save_areas[count];
 
-- 
2.27.0


