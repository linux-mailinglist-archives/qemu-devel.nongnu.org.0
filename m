Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1531A619572
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 12:36:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oquyw-0001F3-S2; Fri, 04 Nov 2022 07:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquys-0001BP-AR
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:26 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquyq-00086G-4g
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:26 -0400
Received: by mail-wr1-x430.google.com with SMTP id v1so6630064wrt.11
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gsbbbX/qa9xmeVzw5HZUsZ9ZpD/YYuH0dDHJDSfXWZQ=;
 b=ZeOHCQRrtNzIKgpELT9ADoKjafjVr+WCyoXI8lZ7l/sxpIfTL+3xnIFQQ2wUnYoVmV
 fuxV1NQ24BuM25YBsEEDr8BM8jcSq7UJYXO+3v3URbmkD1eFi4BYsXytzScstpTaXMgx
 GE22Cq2eaqRpBOPms5KSETdDeu7cfg5+VN372yWfyKNvgGXhp3Tf95ZBxGWpYs+VeYqo
 tMQOsvXkZD2815b7WuZezoI8AfIdVQoYKiuISqRZs1AATqyT48XPWu98ixLfFLV6FXsH
 aumtmfsV6TLR6E116WSMrGUe4zippnPnfLODP3VVa10GoK44uX+1BLCPez8kG3a7Y82A
 nMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gsbbbX/qa9xmeVzw5HZUsZ9ZpD/YYuH0dDHJDSfXWZQ=;
 b=h693VYy/Cbr4IglNEG93KtbqCn/1RqV9da8ktEIYz4fCAH5gZswGD9fyJaUcxHra23
 OicSMHtVMNAF0+aeGbsLO2Y9q1+jp4rdf6Gj/s41Ub6NhHf6WwtMqqY/uJuZfw8MzAXw
 RPpwJtfVZtr9vnxRJg64+qARUWL/oSXb40mieDsdyVdg7z2LOr11gMZ5W6Zum7IO6BPT
 cWH4LshrQxCPFdteUoHE8HHKs+REySMuaLDikupT1LCHSmB475r6OvmfZmkavCvZyBtQ
 wAHi3ZhQPaaqQxym5MEyPm1nfgTvubcYQnR3e5Ki8YA/nti+JfUZZVUlx6biuH+r2286
 3ffw==
X-Gm-Message-State: ANoB5pkd0RHRpavz1RkA+AoYG7YIjTHKMuJCGGfRrEkkzRYy5jcKE296
 nwJgwSDzUtrlJLiWrFJoFRh5/rE/FE6m6w==
X-Google-Smtp-Source: AA0mqf4s/FUqKF9myTrYg05tSzQ9bXp75jlQQv7akJ+/EFqUe5daqLKnIzDNZ1crC1qfOq8boYxFGA==
X-Received: by 2002:adf:f60f:0:b0:23a:d94d:40d1 with SMTP id
 t15-20020adff60f000000b0023ad94d40d1mr1581875wrp.18.1667561722499; 
 Fri, 04 Nov 2022 04:35:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b0023655e51c33sm3255743wrq.4.2022.11.04.04.35.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 04:35:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] target/arm: Fix Privileged Access Never (PAN) for aarch32
Date: Fri,  4 Nov 2022 11:35:12 +0000
Message-Id: <20221104113515.2278508-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104113515.2278508-1-peter.maydell@linaro.org>
References: <20221104113515.2278508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Timofey Kutergin <tkutergin@gmail.com>

When we implemented the PAN support we theoretically wanted
to support it for both AArch32 and AArch64, but in practice
several bugs made it essentially unusable with an AArch32
guest. Fix all those problems:

    - Use CPSR.PAN to check for PAN state in aarch32 mode
    - throw permission fault during address translation when PAN is
      enabled and kernel tries to access user acessible page
    - ignore SCTLR_XP bit for armv7 and armv8 (conflicts with SCTLR_SPAN).

Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221027112619.2205229-1-tkutergin@gmail.com
[PMM: tweak commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 13 +++++++++++--
 target/arm/ptw.c    | 35 ++++++++++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index efbdc657a2d..077581187e7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11003,6 +11003,15 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 }
 #endif
 
+static bool arm_pan_enabled(CPUARMState *env)
+{
+    if (is_a64(env)) {
+        return env->pstate & PSTATE_PAN;
+    } else {
+        return env->uncached_cpsr & CPSR_PAN;
+    }
+}
+
 ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
     ARMMMUIdx idx;
@@ -11023,7 +11032,7 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
         }
         break;
     case 1:
-        if (env->pstate & PSTATE_PAN) {
+        if (arm_pan_enabled(env)) {
             idx = ARMMMUIdx_E10_1_PAN;
         } else {
             idx = ARMMMUIdx_E10_1;
@@ -11032,7 +11041,7 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
     case 2:
         /* Note that TGE does not apply at EL2.  */
         if (arm_hcr_el2_eff(env) & HCR_E2H) {
-            if (env->pstate & PSTATE_PAN) {
+            if (arm_pan_enabled(env)) {
                 idx = ARMMMUIdx_E20_2_PAN;
             } else {
                 idx = ARMMMUIdx_E20_2;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 58a7bbda505..e04dccff44f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -503,12 +503,11 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
  * @mmu_idx:     MMU index indicating required translation regime
  * @ap:          The 3-bit access permissions (AP[2:0])
  * @domain_prot: The 2-bit domain access permissions
+ * @is_user: TRUE if accessing from PL0
  */
-static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
-                         int ap, int domain_prot)
+static int ap_to_rw_prot_is_user(CPUARMState *env, ARMMMUIdx mmu_idx,
+                         int ap, int domain_prot, bool is_user)
 {
-    bool is_user = regime_is_user(env, mmu_idx);
-
     if (domain_prot == 3) {
         return PAGE_READ | PAGE_WRITE;
     }
@@ -552,6 +551,20 @@ static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
+/*
+ * Translate section/page access permissions to page R/W protection flags
+ * @env:         CPUARMState
+ * @mmu_idx:     MMU index indicating required translation regime
+ * @ap:          The 3-bit access permissions (AP[2:0])
+ * @domain_prot: The 2-bit domain access permissions
+ */
+static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
+                         int ap, int domain_prot)
+{
+   return ap_to_rw_prot_is_user(env, mmu_idx, ap, domain_prot,
+                                regime_is_user(env, mmu_idx));
+}
+
 /*
  * Translate section/page access permissions to page R/W protection flags.
  * @ap:      The 2-bit simple AP (AP[2:1])
@@ -720,6 +733,7 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
     hwaddr phys_addr;
     uint32_t dacr;
     bool ns;
+    int user_prot;
 
     /* Pagetable walk.  */
     /* Lookup l1 descriptor.  */
@@ -831,8 +845,10 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
                 goto do_fault;
             }
             result->f.prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
+            user_prot = simple_ap_to_rw_prot_is_user(ap >> 1, 1);
         } else {
             result->f.prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+            user_prot = ap_to_rw_prot_is_user(env, mmu_idx, ap, domain_prot, 1);
         }
         if (result->f.prot && !xn) {
             result->f.prot |= PAGE_EXEC;
@@ -842,6 +858,14 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
             fi->type = ARMFault_Permission;
             goto do_fault;
         }
+        if (regime_is_pan(env, mmu_idx) &&
+            !regime_is_user(env, mmu_idx) &&
+            user_prot &&
+            access_type != MMU_INST_FETCH) {
+            /* Privileged Access Never fault */
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
     }
     if (ns) {
         /* The NS bit will (as required by the architecture) have no effect if
@@ -2773,7 +2797,8 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, ptw, address, access_type, false,
                                   result, fi);
-    } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
+    } else if (arm_feature(env, ARM_FEATURE_V7) ||
+               regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
     } else {
         return get_phys_addr_v5(env, ptw, address, access_type, result, fi);
-- 
2.25.1


