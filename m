Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC33A69DA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:15:28 +0200 (CEST)
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoJD-0001GH-5I
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoES-0000dd-Lb
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEG-0000CF-Vk
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso13315579wmh.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3TYVCm5DPZN1d9sIoPlgzcdO1m/4YeOP/85btD9tmXo=;
 b=LN5FhFYP8VfXc9cLmrl6fh+cKdtjwdiDcELOQuQF8Is1ZiLYcCNnpB53XHKjX3GyJm
 2G2yLuejIP44UWztNI8BItjw8BxHCeCqLDwRaCWFe3xIUxWnTThgaK4fanQFKlxvmrTJ
 68sPQYO1/Xbx7jKPRnwHNkKJXx/cN58BW10fFToY0Ir/4dp1a8OZ9erDLeE47Ejw4ejR
 Dz37j99CprPOC/FZLltA1B8ofV9ehOJ+mpEOwvJr0aFHzXYqwpPB+Hcpk3Q6XBXi38gX
 ty31WlvieyOIQa2iCHubF9Kc6IaJzKZsKGBwGwiYiLiCOCjXUf3Bg0ErXjncmX/JLYGo
 P8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3TYVCm5DPZN1d9sIoPlgzcdO1m/4YeOP/85btD9tmXo=;
 b=pGdsOUkYsTmwrM+mudt7p8OKQCzEL7ANj+nHmYU0rVvQtx4o8ltg1rIkTTocWQQMQQ
 It0AItJRMli0ydh8sZg1nwqIJHY60BIf6JU8s9G/51kK/YqvlXUtPcIckSsiJJuHIfa3
 F5T+aueinVMCS14Nw75IvP8kcuJ62NxhJd3faeiar2kXZ9rpDMQMmwUQ8eoEO5eNEhmn
 +LmqIXlaDfYB2nGyc3NFqaqp9AgMV2mZhocDoQPE76obaALU9s33uTDFaplsbXXdQ+Y0
 mZ/fjmtcR6TtOg9oA8/+jzgCNA/HKKSkgihh8spLvLbfEu8RspPFUfSxNLpeT2W+fs4h
 /zag==
X-Gm-Message-State: AOAM5333O6j0wWPsNCTRe4mLbwpyEInSeD63rkoukaw5pJrSakPsyB/U
 k5DTjCaxuFfoTR4lvSLuq1ZtLg==
X-Google-Smtp-Source: ABdhPJxGjH5Ai9X1Anfz7wVp+B45zE88QRlgy1F52EDUkZpDdlopxK+19VcpmD9KGrexM7tvVV8Dtg==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr33564271wmq.50.1623683418867; 
 Mon, 14 Jun 2021 08:10:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/57] target/arm: Implement MVE LETP insn
Date: Mon, 14 Jun 2021 16:09:19 +0100
Message-Id: <20210614151007.4545-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
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


