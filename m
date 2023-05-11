Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0F6FED88
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:07:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Iv-00075S-Vk; Thu, 11 May 2023 04:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ij-0006Yp-O4
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:26 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IS-0000wG-MF
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:24 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so14640989a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792307; x=1686384307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUj3/kyGKwpEpcvTwoB3ZHHrWxCfgrZwSxh+YB+l6ZQ=;
 b=KHJ4T9M4xmhthrcy/ayLTlCpHcvYDMkIMO0CqvWz3so6441r+nRYhSDF87u66j5q4l
 40SdaE1tws+7bEP1A46MI2vZT1wwk6SslwXULnBUV3TLtAgaAq/jGkLL9/1QVTI2amHh
 tU1ljwVhDK5R69aYeP6xxNLeRgR128zEx4r5LMGJp25NGdRpHRlTprOjn8YGhjYJm8T4
 U1qNKPM3/JAREaEQZUM6n+0++blpC7yJQqyEZbS7Wpekk0kyQg3jxGbVOMA71F8gOTBN
 dLAMwmejQhDEX99Ld6iZBxv2uVom4zL7mFG7HakhSW5Mk2Ejb82H+L8Moq4hfHpRpf4S
 NWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792307; x=1686384307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUj3/kyGKwpEpcvTwoB3ZHHrWxCfgrZwSxh+YB+l6ZQ=;
 b=QmWw6eupQ/FO3FPl27ZevFqRKqu0Q8txtazfoPqDMzPJePxxXiZvEUn9crNpmsxeqa
 ns5fA0fUaHX/WK2oddBdpHfutzoDtfuiKjS/ZtaPS87IV/IeoHj/0COBLrg7he1sylkY
 MRQCMoKv6tQgrGWFY4cWJZG8XyYD8Cer2XeIH/ymV/DmR9iU33mYevGHw6Gv5tJvO/Dl
 xZitrQHd3+9K/AyZQ47Z1IU2nyIS9X3DN+R7zsoBs59yIztFkpoaGhps++u4flv+yull
 66AkeiTbYHk7dzl/vGNfM40faGYYfrK3wzmvymwjZwC/BBVFJo21QAFys8JUQBnM3ilu
 v8vA==
X-Gm-Message-State: AC+VfDzBASOI2aQBWe3aAT8Ee8h97/ENbpWrktf4n1TSwMvJKCEUyeDJ
 3cP7yfVU1Rv5Aup+BD0MnY1LSkrfmTH13MPkIZUEkg==
X-Google-Smtp-Source: ACHHUZ4gR/sfRj69WsAkhlJme0R7UFtccBcqHXCioeNXQPAxxJ1Xq3gWgtI6KaqlHy9WL76f6zBZGw==
X-Received: by 2002:aa7:d88f:0:b0:50b:c1e3:6f02 with SMTP id
 u15-20020aa7d88f000000b0050bc1e36f02mr16982018edq.21.1683792307732; 
 Thu, 11 May 2023 01:05:07 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 24/53] tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Thu, 11 May 2023 09:04:21 +0100
Message-Id: <20230511080450.860923-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x532.google.com
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

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.  This allows our local
tcg_out_arg_* infrastructure to be removed.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 140 +++++----------------------------------
 1 file changed, 18 insertions(+), 122 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index c744512778..df514e56fc 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -690,8 +690,8 @@ tcg_out_ldrd_rwb(TCGContext *s, ARMCond cond, TCGReg rt, TCGReg rn, TCGReg rm)
     tcg_out_memop_r(s, cond, INSN_LDRD_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static void tcg_out_strd_8(TCGContext *s, ARMCond cond, TCGReg rt,
-                           TCGReg rn, int imm8)
+static void __attribute__((unused))
+tcg_out_strd_8(TCGContext *s, ARMCond cond, TCGReg rt, TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_STRD_IMM, rt, rn, imm8, 1, 0);
 }
@@ -969,28 +969,16 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_dat_imm(s, COND_AL, ARITH_AND, rd, rn, 0xff);
 }
 
-static void __attribute__((unused))
-tcg_out_ext8u_cond(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
-{
-    tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
-}
-
 static void tcg_out_ext16s(TCGContext *s, TCGType t, TCGReg rd, TCGReg rn)
 {
     /* sxth */
     tcg_out32(s, 0x06bf0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
-static void tcg_out_ext16u_cond(TCGContext *s, ARMCond cond,
-                                TCGReg rd, TCGReg rn)
-{
-    /* uxth */
-    tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rn);
-}
-
 static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
 {
-    tcg_out_ext16u_cond(s, COND_AL, rd, rn);
+    /* uxth */
+    tcg_out32(s, 0x06ff0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
 static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
@@ -1382,92 +1370,29 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
-/* Helper routines for marshalling helper function arguments into
- * the correct registers and stack.
- * argreg is where we want to put this argument, arg is the argument itself.
- * Return value is the updated argreg ready for the next call.
- * Note that argreg 0..3 is real registers, 4+ on stack.
- *
- * We provide routines for arguments which are: immediate, 32 bit
- * value in register, 16 and 8 bit values in register (which must be zero
- * extended before use) and 64 bit value in a lo:hi register pair.
- */
-#define DEFINE_TCG_OUT_ARG(NAME, ARGTYPE, MOV_ARG, EXT_ARG)                \
-static TCGReg NAME(TCGContext *s, TCGReg argreg, ARGTYPE arg)              \
-{                                                                          \
-    if (argreg < 4) {                                                      \
-        MOV_ARG(s, COND_AL, argreg, arg);                                  \
-    } else {                                                               \
-        int ofs = (argreg - 4) * 4;                                        \
-        EXT_ARG;                                                           \
-        tcg_debug_assert(ofs + 4 <= TCG_STATIC_CALL_ARGS_SIZE);            \
-        tcg_out_st32_12(s, COND_AL, arg, TCG_REG_CALL_STACK, ofs);         \
-    }                                                                      \
-    return argreg + 1;                                                     \
-}
-
-DEFINE_TCG_OUT_ARG(tcg_out_arg_imm32, uint32_t, tcg_out_movi32,
-    (tcg_out_movi32(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg8, TCGReg, tcg_out_ext8u_cond,
-    (tcg_out_ext8u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg16, TCGReg, tcg_out_ext16u_cond,
-    (tcg_out_ext16u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg32, TCGReg, tcg_out_mov_reg, )
-
-static TCGReg tcg_out_arg_reg64(TCGContext *s, TCGReg argreg,
-                                TCGReg arglo, TCGReg arghi)
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
-    /* 64 bit arguments must go in even/odd register pairs
-     * and in 8-aligned stack slots.
-     */
-    if (argreg & 1) {
-        argreg++;
-    }
-    if (argreg >= 4 && (arglo & 1) == 0 && arghi == arglo + 1) {
-        tcg_out_strd_8(s, COND_AL, arglo,
-                       TCG_REG_CALL_STACK, (argreg - 4) * 4);
-        return argreg + 2;
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, arglo);
-        argreg = tcg_out_arg_reg32(s, argreg, arghi);
-        return argreg;
-    }
+    /* We arrive at the slow path via "BLNE", so R14 contains l->raddr. */
+    return TCG_REG_R14;
 }
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ra_gen = ldst_ra_gen,
+    .ntmp = 1,
+    .tmp = { TCG_REG_TMP },
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    argreg = tcg_out_arg_reg32(s, TCG_REG_R0, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        argreg = tcg_out_arg_reg64(s, argreg, lb->addrlo_reg, lb->addrhi_reg);
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, lb->addrlo_reg);
-    }
-    argreg = tcg_out_arg_imm32(s, argreg, oi);
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
-
-    /* Use the canonical unsigned helpers and minimize icache usage. */
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
-
-    if ((opc & MO_SIZE) == MO_64) {
-        TCGMovExtend ext[2] = {
-            { .dst = lb->datalo_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_R0, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-            { .dst = lb->datahi_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_R1, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-        };
-        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
-    } else {
-        tcg_out_movext(s, TCG_TYPE_I32, lb->datalo_reg,
-                       TCG_TYPE_I32, opc & MO_SSIZE, TCG_REG_R0);
-    }
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tcg_out_goto(s, COND_AL, lb->raddr);
     return true;
@@ -1475,42 +1400,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg, datalo, datahi;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    argreg = TCG_REG_R0;
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        argreg = tcg_out_arg_reg64(s, argreg, lb->addrlo_reg, lb->addrhi_reg);
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, lb->addrlo_reg);
-    }
-
-    datalo = lb->datalo_reg;
-    datahi = lb->datahi_reg;
-    switch (opc & MO_SIZE) {
-    case MO_8:
-        argreg = tcg_out_arg_reg8(s, argreg, datalo);
-        break;
-    case MO_16:
-        argreg = tcg_out_arg_reg16(s, argreg, datalo);
-        break;
-    case MO_32:
-    default:
-        argreg = tcg_out_arg_reg32(s, argreg, datalo);
-        break;
-    case MO_64:
-        argreg = tcg_out_arg_reg64(s, argreg, datalo, datahi);
-        break;
-    }
-
-    argreg = tcg_out_arg_imm32(s, argreg, oi);
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
 
     /* Tail-call to the helper, which will return to the fast path.  */
     tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
-- 
2.34.1


