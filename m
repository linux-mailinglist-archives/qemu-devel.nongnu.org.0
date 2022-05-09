Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA7B51FC97
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:21:17 +0200 (CEST)
Received: from localhost ([::1]:35384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2O4-0004TI-Cj
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22c-0007WQ-TX
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:06 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22a-0001IW-UC
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w4so19070775wrg.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1JiIEt3yGg5HPcE3kQ4SQjm2oZBNqFx24lYyJ3rca6I=;
 b=k6a6FnzjtuLxRa5xTeEomWQuTq6DPNw8ibtIjtsBC9NZ21odfRDf81YqddlqA5y/xX
 I8UcBLLPPWON0VfPeNj8QlqiG2sBRjvNhmSOuIsq06f7c7XXj5Dya63DEo9n/jAtB8Ek
 FLkMEAmw2ub9UNELvGb/P6sSwtiJW03qfxWTY/Bm5VeL5zgMzxiEqX6MNUiHk5ifLhI6
 aXgkdvneKrel8+ooN9IfKl0SkKTbXcMbUiFPm8+OstpIhUNPdV6g0V39PxYLGvQJ//C+
 vz5Hq0YbzJMccixSZxwUt+KzG7/Ppy5dfjOA0dBpGcdMT5aBIwJC+MxgHco43aSLEzyD
 2OUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JiIEt3yGg5HPcE3kQ4SQjm2oZBNqFx24lYyJ3rca6I=;
 b=MQ5Kj3oFOnZIEH4a7L2MOKTxf7lcJpbRLLE4hL4T2bd/6nxC4TxyBAxUYH07t5Kl/9
 SSAWEPAAqXy83TEdLbngfIFduewe1IlUjR+i2LQySqv147AIMhMJYodlGyQTNaAz8OgN
 WpwvJXTRBFbAVlsSYe+DgGzQcsGjWO1zZVmxa6mlVXpGcNtxTd+fbz/pis7RzgRqfWeD
 CmPhlNMQdTak3YovBt5Pxqch8HG/hhoBfOrp0BSjNWpUfYJ+smi2J3PADix7YU7IN+ZI
 9S+lU1LCv+nii2F0l0rHjdYrbj1E7OAkR/on+FtqtYiAX4FAj2NNNXzyHWmI4JEisU3J
 sQbg==
X-Gm-Message-State: AOAM530mBWMu3WTytfYvkEh7FAnRHCMeWG/ASWsdhhH2QfqJB0+jpF2y
 43DF3F53chQYhklSAMhBFomoTF6z4T1YpA==
X-Google-Smtp-Source: ABdhPJx/aI8PgXmA+9tz5Pm5lKvO+q4B3O8CrPQABVGynC5dP0cxlh46442WDhR2TImoxQhW5yYhcQ==
X-Received: by 2002:a5d:598e:0:b0:20c:57ef:6083 with SMTP id
 n14-20020a5d598e000000b0020c57ef6083mr13535905wri.457.1652097544166; 
 Mon, 09 May 2022 04:59:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/32] target/arm: Implement ESB instruction
Date: Mon,  9 May 2022 12:58:33 +0100
Message-Id: <20220509115848.3521805-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Check for and defer any pending virtual SError.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/a32.decode      | 16 ++++++++------
 target/arm/t32.decode      | 18 ++++++++--------
 target/arm/op_helper.c     | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 17 +++++++++++++++
 target/arm/translate.c     | 23 ++++++++++++++++++++
 6 files changed, 103 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b463d9343bc..b1334e0c42e 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -54,6 +54,7 @@ DEF_HELPER_1(wfe, void, env)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
 DEF_HELPER_2(pre_smc, void, env, i32)
+DEF_HELPER_1(vesb, void, env)
 
 DEF_HELPER_3(cpsr_write, void, env, i32, i32)
 DEF_HELPER_2(cpsr_write_eret, void, env, i32)
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index fcd8cd4f7d9..f2ca4809495 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -187,13 +187,17 @@ SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
 
 {
   {
-    YIELD        ---- 0011 0010 0000 1111 ---- 0000 0001
-    WFE          ---- 0011 0010 0000 1111 ---- 0000 0010
-    WFI          ---- 0011 0010 0000 1111 ---- 0000 0011
+    [
+      YIELD      ---- 0011 0010 0000 1111 ---- 0000 0001
+      WFE        ---- 0011 0010 0000 1111 ---- 0000 0010
+      WFI        ---- 0011 0010 0000 1111 ---- 0000 0011
 
-    # TODO: Implement SEV, SEVL; may help SMP performance.
-    # SEV        ---- 0011 0010 0000 1111 ---- 0000 0100
-    # SEVL       ---- 0011 0010 0000 1111 ---- 0000 0101
+      # TODO: Implement SEV, SEVL; may help SMP performance.
+      # SEV      ---- 0011 0010 0000 1111 ---- 0000 0100
+      # SEVL     ---- 0011 0010 0000 1111 ---- 0000 0101
+
+      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
+    ]
 
     # The canonical nop ends in 00000000, but the whole of the
     # rest of the space executes as nop if otherwise unsupported.
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 78fadef9d62..f21ad0167ab 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -364,17 +364,17 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
   [
     # Hints, and CPS
     {
-      YIELD      1111 0011 1010 1111 1000 0000 0000 0001
-      WFE        1111 0011 1010 1111 1000 0000 0000 0010
-      WFI        1111 0011 1010 1111 1000 0000 0000 0011
+      [
+        YIELD    1111 0011 1010 1111 1000 0000 0000 0001
+        WFE      1111 0011 1010 1111 1000 0000 0000 0010
+        WFI      1111 0011 1010 1111 1000 0000 0000 0011
 
-      # TODO: Implement SEV, SEVL; may help SMP performance.
-      # SEV      1111 0011 1010 1111 1000 0000 0000 0100
-      # SEVL     1111 0011 1010 1111 1000 0000 0000 0101
+        # TODO: Implement SEV, SEVL; may help SMP performance.
+        # SEV    1111 0011 1010 1111 1000 0000 0000 0100
+        # SEVL   1111 0011 1010 1111 1000 0000 0000 0101
 
-      # For M-profile minimal-RAS ESB can be a NOP, which is the
-      # default behaviour since it is in the hint space.
-      # ESB      1111 0011 1010 1111 1000 0000 0001 0000
+        ESB      1111 0011 1010 1111 1000 0000 0001 0000
+      ]
 
       # The canonical nop ends in 0000 0000, but the whole rest
       # of the space is "reserved hint, behaves as nop".
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 76499ffa149..390b6578a89 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -960,3 +960,46 @@ void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
                      access_type, mmu_idx, ra);
     }
 }
+
+/*
+ * This function corresponds to AArch64.vESBOperation().
+ * Note that the AArch32 version is not functionally different.
+ */
+void HELPER(vesb)(CPUARMState *env)
+{
+    /*
+     * The EL2Enabled() check is done inside arm_hcr_el2_eff,
+     * and will return HCR_EL2.VSE == 0, so nothing happens.
+     */
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    bool enabled = !(hcr & HCR_TGE) && (hcr & HCR_AMO);
+    bool pending = enabled && (hcr & HCR_VSE);
+    bool masked  = (env->daif & PSTATE_A);
+
+    /* If VSE pending and masked, defer the exception.  */
+    if (pending && masked) {
+        uint32_t syndrome;
+
+        if (arm_el_is_aa64(env, 1)) {
+            /* Copy across IDS and ISS from VSESR. */
+            syndrome = env->cp15.vsesr_el2 & 0x1ffffff;
+        } else {
+            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal };
+
+            if (extended_addresses_enabled(env)) {
+                syndrome = arm_fi_to_lfsc(&fi);
+            } else {
+                syndrome = arm_fi_to_sfsc(&fi);
+            }
+            /* Copy across AET and ExT from VSESR. */
+            syndrome |= env->cp15.vsesr_el2 & 0xd000;
+        }
+
+        /* Set VDISR_EL2.A along with the syndrome. */
+        env->cp15.vdisr_el2 = syndrome | (1u << 31);
+
+        /* Clear pending virtual SError */
+        env->cp15.hcr_el2 &= ~HCR_VSE;
+        cpu_reset_interrupt(env_cpu(env), CPU_INTERRUPT_VSERR);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b80313670f9..5a02e076b7f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1454,6 +1454,23 @@ static void handle_hint(DisasContext *s, uint32_t insn,
             gen_helper_autib(cpu_X[17], cpu_env, cpu_X[17], cpu_X[16]);
         }
         break;
+    case 0b10000: /* ESB */
+        /* Without RAS, we must implement this as NOP. */
+        if (dc_isar_feature(aa64_ras, s)) {
+            /*
+             * QEMU does not have a source of physical SErrors,
+             * so we are only concerned with virtual SErrors.
+             * The pseudocode in the ARM for this case is
+             *   if PSTATE.EL IN {EL0, EL1} && EL2Enabled() then
+             *      AArch64.vESBOperation();
+             * Most of the condition can be evaluated at translation time.
+             * Test for EL2 present, and defer test for SEL2 to runtime.
+             */
+            if (s->current_el <= 1 && arm_dc_feature(s, ARM_FEATURE_EL2)) {
+                gen_helper_vesb(cpu_env);
+            }
+        }
+        break;
     case 0b11000: /* PACIAZ */
         if (s->pauth_active) {
             gen_helper_pacia(cpu_X[30], cpu_env, cpu_X[30],
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4e19191ed5c..87a899d6380 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6239,6 +6239,29 @@ static bool trans_WFI(DisasContext *s, arg_WFI *a)
     return true;
 }
 
+static bool trans_ESB(DisasContext *s, arg_ESB *a)
+{
+    /*
+     * For M-profile, minimal-RAS ESB can be a NOP.
+     * Without RAS, we must implement this as NOP.
+     */
+    if (!arm_dc_feature(s, ARM_FEATURE_M) && dc_isar_feature(aa32_ras, s)) {
+        /*
+         * QEMU does not have a source of physical SErrors,
+         * so we are only concerned with virtual SErrors.
+         * The pseudocode in the ARM for this case is
+         *   if PSTATE.EL IN {EL0, EL1} && EL2Enabled() then
+         *      AArch32.vESBOperation();
+         * Most of the condition can be evaluated at translation time.
+         * Test for EL2 present, and defer test for SEL2 to runtime.
+         */
+        if (s->current_el <= 1 && arm_dc_feature(s, ARM_FEATURE_EL2)) {
+            gen_helper_vesb(cpu_env);
+        }
+    }
+    return true;
+}
+
 static bool trans_NOP(DisasContext *s, arg_NOP *a)
 {
     return true;
-- 
2.25.1


