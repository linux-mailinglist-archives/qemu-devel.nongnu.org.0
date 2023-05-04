Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582A6F7108
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:36:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpX-0001ZI-D3; Thu, 04 May 2023 13:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puZPk-0006tS-Ti
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:54:33 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puZPh-0008Ep-KM
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:54:32 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-306281edf15so460638f8f.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 06:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683208468; x=1685800468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHggXn20obPu0Drt0U7lWzebCMRiMj7MrkPBTmqQn7c=;
 b=vHLRx/6FbDWcPKIA0RobEh7Ykg7AEwoYAj/AcnQRCusuI7ZAbGVMsW2ArdR30Z0gtL
 aHoTFKDOY9uQQO8EHum8rsu4sj50MgD8f6PdwaJk/c5+PkqIFPqUsclccsmiRDdpAZyB
 uEjH46oiR6ps39v2Q9gL6/wUhyMUqL1aU28kuN/c0H0mWEo6pP1typWuYmN0QHs1t/nb
 QPS/H0ic/LOGXthEQxKp4shn7Fi96vqkdGNEOETA4YwhyPcwY2kSfzJbst3FH4D8Y5fr
 ucjNKZ+2qsEH5WN2ZQP52MKmiDGLphLZmEHKDEfPf5QxzCVvaYPCkmozIqEHK7f5PTUy
 yLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683208468; x=1685800468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHggXn20obPu0Drt0U7lWzebCMRiMj7MrkPBTmqQn7c=;
 b=Jhhvge0BEnPNcHudcblR8yOCQhq99ylF5pPQorRiZ4ASjIAWPpE4qYXbhuOa4UwpBr
 fHYYN8IKt2uBBJOOfoP37B7hp8zvkwxou3Px/WjFtaxLhIElWGKZk1tAYoBtdgXtO5Bb
 7e66NXd9Ykv8YCYmRQufN0/2QrwHzzyopGbtybb5WAQ6N3zxFKZJR16+uilfrG0d9d4B
 2tYcwI7HJ4bhb6kpu8aady1e1zuqnMOefveiPTs58gWNp0HY2bDs8V9PT8mdUZQ9bJiK
 xb72YOSuhEe9LiP2vfd5YsrW08PgUYhl/Z0Hzf5Eg5mMYgpSM+R3gsp4KPK5Ia2bKpQC
 n9Ww==
X-Gm-Message-State: AC+VfDy8brVA7FOhvmypbzTD+n0Hewi52cEE6PWu6t2FWyDnmBjcWCuD
 M7ZSHyk73M9xDI/WvltyEfYwaA==
X-Google-Smtp-Source: ACHHUZ7SvLlUGOcc574TEjMHENPAZGQMjDvNNawphHUWE/QEG+iGg/j4ES1Wy4LQ2NM05nf+ibxKNw==
X-Received: by 2002:adf:ebc5:0:b0:306:266a:2dc8 with SMTP id
 v5-20020adfebc5000000b00306266a2dc8mr2871773wrn.64.1683208468091; 
 Thu, 04 May 2023 06:54:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003f40049a65bsm3800428wmr.21.2023.05.04.06.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 06:54:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/2] target/arm: Fix handling of SW and NSW bits for stage
 2 walks
Date: Thu,  4 May 2023 14:54:25 +0100
Message-Id: <20230504135425.2748672-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504135425.2748672-1-peter.maydell@linaro.org>
References: <20230504135425.2748672-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We currently don't correctly handle the VSTCR_EL2.SW and VTCR_EL2.NSW
configuration bits.  These allow configuration of whether the stage 2
page table walks for Secure IPA and NonSecure IPA should do their
descriptor reads from Secure or NonSecure physical addresses. (This
is separate from how the translation table base address and other
parameters are set: an NS IPA always uses VTTBR_EL2 and VTCR_EL2
for its base address and walk parameters, regardless of the NSW bit,
and similarly for Secure.)

Provide a new function ptw_idx_for_stage_2() which returns the
MMU index to use for descriptor reads, and use it to set up
the .in_ptw_idx wherever we call get_phys_addr_lpae().

For a stage 2 walk, wherever we call get_phys_addr_lpae():
 * .in_ptw_idx should be ptw_idx_for_stage_2() of the .in_mmu_idx
 * .in_secure should be true if .in_mmu_idx is Stage2_S

This allows us to correct S1_ptw_translate() so that it consistently
always sets its (out_secure, out_phys) to the result it gets from the
S2 walk (either by calling get_phys_addr_lpae() or by TLB lookup).
This makes better conceptual sense because the S2 walk should return
us an (address space, address) tuple, not an address that we then
randomly assign to S or NS.

Our previous handling of SW and NSW was broken, so guest code
trying to use these bits to put the s2 page tables in the "other"
address space wouldn't work correctly.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1600
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 76 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 25 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8ac6d9b1d0c..a89aa70b8b2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -103,6 +103,37 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
     return stage_1_mmu_idx(arm_mmu_idx(env));
 }
 
+/*
+ * Return where we should do ptw loads from for a stage 2 walk.
+ * This depends on whether the address we are looking up is a
+ * Secure IPA or a NonSecure IPA, which we know from whether this is
+ * Stage2 or Stage2_S.
+ * If this is the Secure EL1&0 regime we need to check the NSW and SW bits.
+ */
+static ARMMMUIdx ptw_idx_for_stage_2(CPUARMState *env, ARMMMUIdx stage2idx)
+{
+    bool s2walk_secure;
+
+    /*
+     * We're OK to check the current state of the CPU here because
+     * (1) we always invalidate all TLBs when the SCR_EL3.NS bit changes
+     * (2) there's no way to do a lookup that cares about Stage 2 for a
+     * different security state to the current one for AArch64, and AArch32
+     * never has a secure EL2. (AArch32 ATS12NSO[UP][RW] allow EL3 to do
+     * an NS stage 1+2 lookup while the NS bit is 0.)
+     */
+    if (!arm_is_secure_below_el3(env) || !arm_el_is_aa64(env, 3)) {
+        return ARMMMUIdx_Phys_NS;
+    }
+    if (stage2idx == ARMMMUIdx_Stage2_S) {
+        s2walk_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
+    } else {
+        s2walk_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
+    }
+    return s2walk_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+
+}
+
 static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
@@ -220,7 +251,6 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s2_mmu_idx = ptw->in_ptw_idx;
     uint8_t pte_attrs;
-    bool pte_secure;
 
     ptw->out_virt = addr;
 
@@ -232,8 +262,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         if (regime_is_stage2(s2_mmu_idx)) {
             S1Translate s2ptw = {
                 .in_mmu_idx = s2_mmu_idx,
-                .in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS,
-                .in_secure = is_secure,
+                .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
+                .in_secure = s2_mmu_idx == ARMMMUIdx_Stage2_S,
                 .in_debug = true,
             };
             GetPhysAddrResult s2 = { };
@@ -244,12 +274,12 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             }
             ptw->out_phys = s2.f.phys_addr;
             pte_attrs = s2.cacheattrs.attrs;
-            pte_secure = s2.f.attrs.secure;
+            ptw->out_secure = s2.f.attrs.secure;
         } else {
             /* Regime is physical. */
             ptw->out_phys = addr;
             pte_attrs = 0;
-            pte_secure = is_secure;
+            ptw->out_secure = s2_mmu_idx == ARMMMUIdx_Phys_S;
         }
         ptw->out_host = NULL;
         ptw->out_rw = false;
@@ -270,7 +300,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_phys = full->phys_addr | (addr & ~TARGET_PAGE_MASK);
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
-        pte_secure = full->attrs.secure;
+        ptw->out_secure = full->attrs.secure;
 #else
         g_assert_not_reached();
 #endif
@@ -293,11 +323,6 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         }
     }
 
-    /* Check if page table walk is to secure or non-secure PA space. */
-    ptw->out_secure = (is_secure
-                       && !(pte_secure
-                            ? env->cp15.vstcr_el2 & VSTCR_SW
-                            : env->cp15.vtcr_el2 & VTCR_NSW));
     ptw->out_be = regime_translation_big_endian(env, mmu_idx);
     return true;
 
@@ -2726,7 +2751,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     hwaddr ipa;
     int s1_prot, s1_lgpgsz;
     bool is_secure = ptw->in_secure;
-    bool ret, ipa_secure, s2walk_secure;
+    bool ret, ipa_secure;
     ARMCacheAttrs cacheattrs1;
     bool is_el0;
     uint64_t hcr;
@@ -2740,20 +2765,11 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     ipa = result->f.phys_addr;
     ipa_secure = result->f.attrs.secure;
-    if (is_secure) {
-        /* Select TCR based on the NS bit from the S1 walk. */
-        s2walk_secure = !(ipa_secure
-                          ? env->cp15.vstcr_el2 & VSTCR_SW
-                          : env->cp15.vtcr_el2 & VTCR_NSW);
-    } else {
-        assert(!ipa_secure);
-        s2walk_secure = false;
-    }
 
     is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
-    ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-    ptw->in_ptw_idx = s2walk_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
-    ptw->in_secure = s2walk_secure;
+    ptw->in_mmu_idx = ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    ptw->in_secure = ipa_secure;
+    ptw->in_ptw_idx = ptw_idx_for_stage_2(env, ptw->in_mmu_idx);
 
     /*
      * S1 is done, now do S2 translation.
@@ -2861,6 +2877,16 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
         ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
         break;
 
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
+        /*
+         * Second stage lookup uses physical for ptw; whether this is S or
+         * NS may depend on the SW/NSW bits if this is a stage 2 lookup for
+         * the Secure EL2&0 regime.
+         */
+        ptw->in_ptw_idx = ptw_idx_for_stage_2(env, mmu_idx);
+        break;
+
     case ARMMMUIdx_E10_0:
         s1_mmu_idx = ARMMMUIdx_Stage1_E0;
         goto do_twostage;
@@ -2884,7 +2910,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
         /* fall through */
 
     default:
-        /* Single stage and second stage uses physical for ptw. */
+        /* Single stage uses physical for ptw. */
         ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
         break;
     }
-- 
2.34.1


