Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D153A860D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:06:36 +0200 (CEST)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBaF-0005Ho-8z
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFO-0006ey-5n
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:45:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEo-00011H-Mg
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:45:01 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so1131076wmf.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1sln18kQtoUp6vqSnuDDuj3jsPTEO4Z4a1YkId39aHg=;
 b=yZOV1uBSWF7PWoqv4JciVEjdPXDt/06j+wjD916ICOc/62hLPIocvVOvb72E357/5y
 7FjpaNqo6jWa6kDppFvLqGh1RGIxlA9cTtEGe/KbZVDvm+lYOlhV8VPIRKxAkR2R+q8t
 JZqyV1w9X960k+ltVcDbFnstE2e4FRGl6NuQXdtywm103WY8G3pkEsWrxuQM131G+q2C
 4U5McvGIAVlPB3OStglWrenOvyZ0VotaN+nEelMWqSlvbGw/fyAfwhO9IKcAuQX2IUBx
 MyPyUeYVyYaoFC29xMlbSWKb9Z2YZa0WC6spLvXuyQoOMVNUFkeyr5L3r+k01vyH7JxN
 1Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1sln18kQtoUp6vqSnuDDuj3jsPTEO4Z4a1YkId39aHg=;
 b=mIxCFoWi7F09Ar3GxyLgVd3/tOaFnF5ZsKWVwsGxYD+vNiTtSikpYn6mmo//xLY007
 oZ9rdeAznpgniVfuoVs05Ij1fyeP0yH4X1s9XlYcWKRyFl9VpDBR7I/LVig4bWoNMi4H
 Wr/u6GiYxRdkZ0F7fZs/asSrX+9V+QJfhnLsdlLPOc9uqpFZev7pa/wkSOpSJ68XddL6
 /Yr40auE+Qj1jmzfaccPIIw5R1i7HYGJjdYs2da5Jkbxpyboip4/wramY3bVwP6chuhK
 UNCWi4W6JslwHGloLujvJrvFG85LLXp5PJ2AyCN8Qq5zf3Nsfxr1FQI++cDmMr3fPpBH
 xlmg==
X-Gm-Message-State: AOAM532sDHbjycNU+fu+3BPo1WPslBtdoud4JanJftVD3Oj5PdXNi5fW
 yEemZe1M34lqiU6fwFwuel5gbzBzhSB+sg==
X-Google-Smtp-Source: ABdhPJy56oB722QwVzaU9lUbecde38m9A1xXap7ci+L7AgsLSLj2n6haZJPcoWZ2q40FF16FcY6J8Q==
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr5797215wmf.173.1623771865316; 
 Tue, 15 Jun 2021 08:44:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/28] target/arm: Implement MVE LETP insn
Date: Tue, 15 Jun 2021 16:44:01 +0100
Message-Id: <20210615154405.21399-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Implement the MVE LETP insn.  This is like the existing LE loop-end
insn, but it must perform an FPU-enabled check, and on loop-exit it
resets LTPSIZE to 4.

To accommodate the requirement to do something on loop-exit, we drop
the use of condlabel and instead manage both the TB exits manually,
in the same way we already do in trans_WLS().

The other MVE-specific change to the LE insn is that we must raise an
INVSTATE UsageFault insn if LTPSIZE is not 4.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210614151007.4545-10-peter.maydell@linaro.org
---
 target/arm/t32.decode  |   2 +-
 target/arm/translate.c | 104 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 97 insertions(+), 9 deletions(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 1b75db50658..0f9326c724b 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -674,7 +674,7 @@ BL               1111 0. .......... 11.1 ............         @branch24
     DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001 size=4
     WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm size=4
     {
-      LE         1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+      LE         1111 0 0000 0 f:1 tp:1 1111 1100 . .......... 1 imm=%lob_imm
       # This is WLSTP
       WLS        1111 0 0000 0 size:2 rn:4 1100 . .......... 1 imm=%lob_imm
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1ad0e61fac6..a51e882b867 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8223,25 +8223,113 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
      * any faster.
      */
     TCGv_i32 tmp;
+    TCGLabel *loopend;
+    bool fpu_active;
 
     if (!dc_isar_feature(aa32_lob, s)) {
         return false;
     }
+    if (a->f && a->tp) {
+        return false;
+    }
+    if (s->condexec_mask) {
+        /*
+         * LE in an IT block is CONSTRAINED UNPREDICTABLE;
+         * we choose to UNDEF, because otherwise our use of
+         * gen_goto_tb(1) would clash with the use of TB exit 1
+         * in the dc->condjmp condition-failed codepath in
+         * arm_tr_tb_stop() and we'd get an assertion.
+         */
+        return false;
+    }
+    if (a->tp) {
+        /* LETP */
+        if (!dc_isar_feature(aa32_mve, s)) {
+            return false;
+        }
+        if (!vfp_access_check(s)) {
+            s->eci_handled = true;
+            return true;
+        }
+    }
 
     /* LE/LETP is OK with ECI set and leaves it untouched */
     s->eci_handled = true;
 
-    if (!a->f) {
-        /* Not loop-forever. If LR <= 1 this is the last loop: do nothing. */
-        arm_gen_condlabel(s);
-        tcg_gen_brcondi_i32(TCG_COND_LEU, cpu_R[14], 1, s->condlabel);
-        /* Decrement LR */
-        tmp = load_reg(s, 14);
-        tcg_gen_addi_i32(tmp, tmp, -1);
-        store_reg(s, 14, tmp);
+    /*
+     * With MVE, LTPSIZE might not be 4, and we must emit an INVSTATE
+     * UsageFault exception for the LE insn in that case. Note that we
+     * are not directly checking FPSCR.LTPSIZE but instead check the
+     * pseudocode LTPSIZE() function, which returns 4 if the FPU is
+     * not currently active (ie ActiveFPState() returns false). We
+     * can identify not-active purely from our TB state flags, as the
+     * FPU is active only if:
+     *  the FPU is enabled
+     *  AND lazy state preservation is not active
+     *  AND we do not need a new fp context (this is the ASPEN/FPCA check)
+     *
+     * Usually we don't need to care about this distinction between
+     * LTPSIZE and FPSCR.LTPSIZE, because the code in vfp_access_check()
+     * will either take an exception or clear the conditions that make
+     * the FPU not active. But LE is an unusual case of a non-FP insn
+     * that looks at LTPSIZE.
+     */
+    fpu_active = !s->fp_excp_el && !s->v7m_lspact && !s->v7m_new_fp_ctxt_needed;
+
+    if (!a->tp && dc_isar_feature(aa32_mve, s) && fpu_active) {
+        /* Need to do a runtime check for LTPSIZE != 4 */
+        TCGLabel *skipexc = gen_new_label();
+        tmp = load_cpu_field(v7m.ltpsize);
+        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
+        tcg_temp_free_i32(tmp);
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                           default_exception_el(s));
+        gen_set_label(skipexc);
+    }
+
+    if (a->f) {
+        /* Loop-forever: just jump back to the loop start */
+        gen_jmp(s, read_pc(s) - a->imm);
+        return true;
+    }
+
+    /*
+     * Not loop-forever. If LR <= loop-decrement-value this is the last loop.
+     * For LE, we know at this point that LTPSIZE must be 4 and the
+     * loop decrement value is 1. For LETP we need to calculate the decrement
+     * value from LTPSIZE.
+     */
+    loopend = gen_new_label();
+    if (!a->tp) {
+        tcg_gen_brcondi_i32(TCG_COND_LEU, cpu_R[14], 1, loopend);
+        tcg_gen_addi_i32(cpu_R[14], cpu_R[14], -1);
+    } else {
+        /*
+         * Decrement by 1 << (4 - LTPSIZE). We need to use a TCG local
+         * so that decr stays live after the brcondi.
+         */
+        TCGv_i32 decr = tcg_temp_local_new_i32();
+        TCGv_i32 ltpsize = load_cpu_field(v7m.ltpsize);
+        tcg_gen_sub_i32(decr, tcg_constant_i32(4), ltpsize);
+        tcg_gen_shl_i32(decr, tcg_constant_i32(1), decr);
+        tcg_temp_free_i32(ltpsize);
+
+        tcg_gen_brcond_i32(TCG_COND_LEU, cpu_R[14], decr, loopend);
+
+        tcg_gen_sub_i32(cpu_R[14], cpu_R[14], decr);
+        tcg_temp_free_i32(decr);
     }
     /* Jump back to the loop start */
     gen_jmp(s, read_pc(s) - a->imm);
+
+    gen_set_label(loopend);
+    if (a->tp) {
+        /* Exits from tail-pred loops must reset LTPSIZE to 4 */
+        tmp = tcg_const_i32(4);
+        store_cpu_field(tmp, v7m.ltpsize);
+    }
+    /* End TB, continuing to following insn */
+    gen_jmp_tb(s, s->base.pc_next, 1);
     return true;
 }
 
-- 
2.20.1


