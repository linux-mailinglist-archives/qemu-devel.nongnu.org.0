Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811713A85F8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:02:33 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBWK-00057T-HR
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFJ-0006Wz-3Z
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:57 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEl-0000zM-Nz
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:56 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a20so18906913wrc.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=a+GQNN1UL8NRKk5tFdcVGCreZz6GM8M7oR4GW+pM1Jw=;
 b=B1l6rsS0aTKySmY/naIsis7oUgJyzX7n8VLNKqJXmAlmPKeg94aK0uX7itixVQH2D0
 Bu4EW3JSujwMBhYsyv1hcht+wBkQIFkMRCddnYBponjxph1oV9jvT/Fhj6IBOe24biLo
 a917ScW4k87C6L+GekwU7RuMWy9CeL7NlV8rq9VNqxnGRCqrze4nY507ajv2XN/8PvGJ
 ckbHm6fwl2GRz/GOQHugsOLhBXFQ6w3+5xVF24LYyAhCTLFerwYWnNx/4YMwAnjW/4G+
 zFk7X40BiInwFWDsL529I0+HQ83XrJ/T78I0K4d1E+rdgfD5yiiFyFBSkT0U5xBFlt8Y
 Fp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a+GQNN1UL8NRKk5tFdcVGCreZz6GM8M7oR4GW+pM1Jw=;
 b=adPXVbAzSj/K7fgyiTLd9XXIsezRfbsQhHikoeCuzfDugC9WF2cQSQZ9hOx0TT6lJG
 dzcqBtCqCH9CclmOJ2wTQF0nJH6KqWFqwwxEQsRTAs0kP2bPYy2lXFVvgXP0041vva1q
 Qh3R7y2KOX+n/f/vvXxzAtAa4fsw3zv7nDvu6krtdu3G3FrMvw2kkJTvKpB7DoZYjmiv
 nxmhLnrd3ZEbZKgCKMyZR/y+11RhTiv5MmA7efm2YzWry11WJ7s7zeZl5TOwo+de1WXP
 JNhzX7BATerd8IVrnQNHkf2l7EOPcuVKM5go+zXDe/3Z16Uax2vi11CtjbSu+egB5akl
 nWtA==
X-Gm-Message-State: AOAM530UXvK1y8ES4w8TVhHBzaNmlq8O/u+jlXFEfmXtAtMuQktnH7gR
 Gmt8l0/TPS/5YE6tr6tFGaL2IHPGQ+wxdA==
X-Google-Smtp-Source: ABdhPJy3q5IPsWT2RL/d8WU4ATwWS+++ZIsXwOLN6j74g3r0gzpgr1VThDQFF4T26ZOjbuahUmoz+A==
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr26700076wro.164.1623771861277; 
 Tue, 15 Jun 2021 08:44:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/28] target/arm: Handle VPR semantics in existing code
Date: Tue, 15 Jun 2021 16:43:55 +0100
Message-Id: <20210615154405.21399-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When MVE is supported, the VPR register has a place on the exception
stack frame in a previously reserved slot just above the FPSCR.
It must also be zeroed in various situations when we invalidate
FPU context.

Update the code which handles the stack frames (exception entry and
exit code, VLLDM, and VLSTM) to save/restore VPR.

Update code which invalidates FP registers (mostly also exception
entry and exit code, but also VSCCLRM and the code in
full_vfp_access_check() that corresponds to the ExecuteFPCheck()
pseudocode) to zero VPR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210614151007.4545-4-peter.maydell@linaro.org
---
 target/arm/m_helper.c         | 54 +++++++++++++++++++++++++++++------
 target/arm/translate-m-nocp.c |  5 +++-
 target/arm/translate-vfp.c    |  9 ++++--
 3 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 074c5434550..7a1e35ab5b6 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -378,7 +378,7 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
             uint32_t shi = extract64(dn, 32, 32);
 
             if (i >= 16) {
-                faddr += 8; /* skip the slot for the FPSCR */
+                faddr += 8; /* skip the slot for the FPSCR/VPR */
             }
             stacked_ok = stacked_ok &&
                 v7m_stack_write(cpu, faddr, slo, mmu_idx, STACK_LAZYFP) &&
@@ -388,6 +388,11 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
         stacked_ok = stacked_ok &&
             v7m_stack_write(cpu, fpcar + 0x40,
                             vfp_get_fpscr(env), mmu_idx, STACK_LAZYFP);
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            stacked_ok = stacked_ok &&
+                v7m_stack_write(cpu, fpcar + 0x44,
+                                env->v7m.vpr, mmu_idx, STACK_LAZYFP);
+        }
     }
 
     /*
@@ -410,16 +415,19 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
     env->v7m.fpccr[is_secure] &= ~R_V7M_FPCCR_LSPACT_MASK;
 
     if (ts) {
-        /* Clear s0 to s31 and the FPSCR */
+        /* Clear s0 to s31 and the FPSCR and VPR */
         int i;
 
         for (i = 0; i < 32; i += 2) {
             *aa32_vfp_dreg(env, i / 2) = 0;
         }
         vfp_set_fpscr(env, 0);
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            env->v7m.vpr = 0;
+        }
     }
     /*
-     * Otherwise s0 to s15 and FPSCR are UNKNOWN; we choose to leave them
+     * Otherwise s0 to s15, FPSCR and VPR are UNKNOWN; we choose to leave them
      * unchanged.
      */
 }
@@ -1044,6 +1052,7 @@ static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
 void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
 {
     /* fptr is the value of Rn, the frame pointer we store the FP regs to */
+    ARMCPU *cpu = env_archcpu(env);
     bool s = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
     bool lspact = env->v7m.fpccr[s] & R_V7M_FPCCR_LSPACT_MASK;
     uintptr_t ra = GETPC();
@@ -1092,9 +1101,12 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
             cpu_stl_data_ra(env, faddr + 4, shi, ra);
         }
         cpu_stl_data_ra(env, fptr + 0x40, vfp_get_fpscr(env), ra);
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            cpu_stl_data_ra(env, fptr + 0x44, env->v7m.vpr, ra);
+        }
 
         /*
-         * If TS is 0 then s0 to s15 and FPSCR are UNKNOWN; we choose to
+         * If TS is 0 then s0 to s15, FPSCR and VPR are UNKNOWN; we choose to
          * leave them unchanged, matching our choice in v7m_preserve_fp_state.
          */
         if (ts) {
@@ -1102,6 +1114,9 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
                 *aa32_vfp_dreg(env, i / 2) = 0;
             }
             vfp_set_fpscr(env, 0);
+            if (cpu_isar_feature(aa32_mve, cpu)) {
+                env->v7m.vpr = 0;
+            }
         }
     } else {
         v7m_update_fpccr(env, fptr, false);
@@ -1112,6 +1127,7 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
 
 void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uintptr_t ra = GETPC();
 
     /* fptr is the value of Rn, the frame pointer we load the FP regs from */
@@ -1144,7 +1160,7 @@ void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
             uint32_t faddr = fptr + 4 * i;
 
             if (i >= 16) {
-                faddr += 8; /* skip the slot for the FPSCR */
+                faddr += 8; /* skip the slot for the FPSCR and VPR */
             }
 
             slo = cpu_ldl_data_ra(env, faddr, ra);
@@ -1155,6 +1171,9 @@ void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
         }
         fpscr = cpu_ldl_data_ra(env, fptr + 0x40, ra);
         vfp_set_fpscr(env, fpscr);
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            env->v7m.vpr = cpu_ldl_data_ra(env, fptr + 0x44, ra);
+        }
     }
 
     env->v7m.control[M_REG_S] |= R_V7M_CONTROL_FPCA_MASK;
@@ -1298,7 +1317,7 @@ static bool v7m_push_stack(ARMCPU *cpu)
                     uint32_t shi = extract64(dn, 32, 32);
 
                     if (i >= 16) {
-                        faddr += 8; /* skip the slot for the FPSCR */
+                        faddr += 8; /* skip the slot for the FPSCR and VPR */
                     }
                     stacked_ok = stacked_ok &&
                         v7m_stack_write(cpu, faddr, slo,
@@ -1309,11 +1328,19 @@ static bool v7m_push_stack(ARMCPU *cpu)
                 stacked_ok = stacked_ok &&
                     v7m_stack_write(cpu, frameptr + 0x60,
                                     vfp_get_fpscr(env), mmu_idx, STACK_NORMAL);
+                if (cpu_isar_feature(aa32_mve, cpu)) {
+                    stacked_ok = stacked_ok &&
+                        v7m_stack_write(cpu, frameptr + 0x64,
+                                        env->v7m.vpr, mmu_idx, STACK_NORMAL);
+                }
                 if (cpacr_pass) {
                     for (i = 0; i < ((framesize == 0xa8) ? 32 : 16); i += 2) {
                         *aa32_vfp_dreg(env, i / 2) = 0;
                     }
                     vfp_set_fpscr(env, 0);
+                    if (cpu_isar_feature(aa32_mve, cpu)) {
+                        env->v7m.vpr = 0;
+                    }
                 }
             } else {
                 /* Lazy stacking enabled, save necessary info to stack later */
@@ -1536,13 +1563,16 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                     v7m_exception_taken(cpu, excret, true, false);
                 }
             }
-            /* Clear s0..s15 and FPSCR; TODO also VPR when MVE is implemented */
+            /* Clear s0..s15, FPSCR and VPR */
             int i;
 
             for (i = 0; i < 16; i += 2) {
                 *aa32_vfp_dreg(env, i / 2) = 0;
             }
             vfp_set_fpscr(env, 0);
+            if (cpu_isar_feature(aa32_mve, cpu)) {
+                env->v7m.vpr = 0;
+            }
         }
     }
 
@@ -1771,7 +1801,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                     uint32_t faddr = frameptr + 0x20 + 4 * i;
 
                     if (i >= 16) {
-                        faddr += 8; /* Skip the slot for the FPSCR */
+                        faddr += 8; /* Skip the slot for the FPSCR and VPR */
                     }
 
                     pop_ok = pop_ok &&
@@ -1790,6 +1820,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                 if (pop_ok) {
                     vfp_set_fpscr(env, fpscr);
                 }
+                if (cpu_isar_feature(aa32_mve, cpu)) {
+                    pop_ok = pop_ok &&
+                        v7m_stack_read(cpu, &env->v7m.vpr,
+                                       frameptr + 0x64, mmu_idx);
+                }
                 if (!pop_ok) {
                     /*
                      * These regs are 0 if security extension present;
@@ -1799,6 +1834,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                         *aa32_vfp_dreg(env, i / 2) = 0;
                     }
                     vfp_set_fpscr(env, 0);
+                    if (cpu_isar_feature(aa32_mve, cpu)) {
+                        env->v7m.vpr = 0;
+                    }
                 }
             }
         }
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index d47eb8e1535..365810e582d 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -173,7 +173,10 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
         btmreg++;
     }
     assert(btmreg == topreg + 1);
-    /* TODO: when MVE is implemented, zero VPR here */
+    if (dc_isar_feature(aa32_mve, s)) {
+        TCGv_i32 z32 = tcg_const_i32(0);
+        store_cpu_field(z32, v7m.vpr);
+    }
     return true;
 }
 
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 728856dfd45..49f44347ad9 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -180,8 +180,8 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 
         if (s->v7m_new_fp_ctxt_needed) {
             /*
-             * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA
-             * and the FPSCR.
+             * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA,
+             * the FPSCR, and VPR.
              */
             TCGv_i32 control, fpscr;
             uint32_t bits = R_V7M_CONTROL_FPCA_MASK;
@@ -189,6 +189,11 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
             fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
             gen_helper_vfp_set_fpscr(cpu_env, fpscr);
             tcg_temp_free_i32(fpscr);
+            if (dc_isar_feature(aa32_mve, s)) {
+                TCGv_i32 z32 = tcg_const_i32(0);
+                store_cpu_field(z32, v7m.vpr);
+            }
+
             /*
              * We don't need to arrange to end the TB, because the only
              * parts of FPSCR which we cache in the TB flags are the VECLEN
-- 
2.20.1


