Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF4E700C01
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:36:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUmx-0003JE-TZ; Fri, 12 May 2023 11:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmu-0003HH-Ei
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:32 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmr-00060V-9d
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:31 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so46487865e9.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905668; x=1686497668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kIU6WkE8HsxiJwKu+luu3cepl9J7rIWwpNf7ePFCk2Q=;
 b=nrL245xTN6/Nic7rK6qBWGelFZ48wwS6n+Arwwm5EJYuifHY+wSClVK9I11WcrtMf+
 vCKqoB2166pN+HbcGl/rYHbgUCRinzakVdk4ta4NsxWC63nc3u6Aq57GisntTilxb7za
 vkpsiLsOddpxHB/2lB0I0yeCGF+v/sIdrnRlML3KBCOUwnXx7S1IQX5ip6J3OU+F4/oL
 BNekjDm5IDYuPgfkpZ47TU9bS6NByIp8bG2uOcnvxAgwsKupANg7gqMOzI18Ca1nCwft
 IH+NAMADpjmrevFamGzDEJ5Yj+fQPPfBzmNR/q1C9i6D5u6c0lIV4ouKR6TzyGbbN2sL
 O4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905668; x=1686497668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIU6WkE8HsxiJwKu+luu3cepl9J7rIWwpNf7ePFCk2Q=;
 b=FgHrWSRVIRcxa+87g+a+1ySKjj2aE0/ByeVUtIqfpQBPkTn78AzxwGx394L1iXiI1E
 ybnhR5WDqPgOM10ZUpFZjG5AbwcoQGvTO+occGOdhmRco3AEh/9tzc8cmiRIx69/rxYL
 zRLd2ysZFgS4wkLLOzakUAsBSNba5jJui/ius3Ucup37ZEYclBBbZTQD5DFwyZMQ25bN
 sNQ8JwP+p4lZ+WLq3rZaOAI82CK4dWZUueynUbYkCat5obOEE0WVoOFdQRVRE1J60Rv+
 BShNYlnNV4BugMTWP3ayR8AOTQ8DgY4QTRVUdHPBO+4aJOjALVGJw9wzOoPGzgJDeywI
 BeuQ==
X-Gm-Message-State: AC+VfDxy9w9bf1gGueuatxn6hVHJzRnjp9iYbacuy9LA6cv/SPRIW3PB
 W85D6MO+qJTf7Ec7XY0WwgAKJ5TNUS65rnxVfvE=
X-Google-Smtp-Source: ACHHUZ5JjOxHGAdBWmRcTiXd2s06bJblWJBKrxFU8WMfBNr6+B1UEuzMw54ghDEp9P3orWfJxqnAVw==
X-Received: by 2002:a7b:c7c3:0:b0:3f3:195b:d18c with SMTP id
 z3-20020a7bc7c3000000b003f3195bd18cmr15852750wmk.30.1683905667935; 
 Fri, 12 May 2023 08:34:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] target/arm: Fix handling of SW and NSW bits for stage 2
 walks
Date: Fri, 12 May 2023 16:34:15 +0100
Message-Id: <20230512153423.3704893-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230504135425.2748672-3-peter.maydell@linaro.org
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


