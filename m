Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5881440A235
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:54:20 +0200 (CEST)
Received: from localhost ([::1]:42410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwiJ-0005fy-BW
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw9j-0006rD-TP
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:18:35 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw9d-0001R0-BT
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:18:35 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t1so11024737pgv.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=22MmO4lZfRL9OrZ7ipA0h9A36AED+H4aZs0Lxfx4ZfQ=;
 b=lSqpR8rnyrN8lzOhPqkj4fOjTFwtLjLDgNhoc/JjRAhtGNNeaVhlQRnXtFmsLVTG50
 v2PayXkRcjY491MLhRcaZpvn6mUMtDngpx0D9K+jlQs92aFn7sPdmUN0aoIsgn7ZRncn
 3lHWGS+faOKEGRDhjTZv/zQokT6OHIJGmrfgFWF8sqt+LoaXCGioGvUbWiI//xW3UlFG
 8A9xa2DJUbkRmjQNZHqKlLwU5DQFXQITtoalqGz0K7BW6DMmWpBu+rJ2nYvMrm37eFGC
 jXkvnal2h5qoPB+VI6qPdOIFBa4q8RkLa1n91M1oXqpgO3HP2ShHxZfQx10Bi7bpE3Df
 0R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=22MmO4lZfRL9OrZ7ipA0h9A36AED+H4aZs0Lxfx4ZfQ=;
 b=5SaohM6mdBhicYXCadtebGQHs8IG3ruxZF9VVb4pORps8fCetLV8Jxy6xYSLdk1PaV
 ydOSaJ26OfrjnfHjecXN6NcbFHsMjIFxXZcolDxghdIArYGRYan0bUk5/y3wq5ru3Xlf
 Ww7j6vNJAOK814gh6Pt0yKW76pB83NUoeIGqnP/BZdoJ3e5paUmzT4Avnc10xp/59vUP
 CdINgFP3g0mTWriffAnPKL31XJYUD1l9R/h+d2f9qIUnhstQZ3o6DCXl91xsM9u1k0Kr
 eqEm2Ngs6zXn8REpS1UOBw6qYFGOno1hbFUV0+kj9Evdjvc1K9Wcc2aXb5mqp1oRLKs4
 yEoA==
X-Gm-Message-State: AOAM5300T/75r0ICHeDUC/QqRkRWJIqnn2ZXbFIQU6Ava4ZFhscZHQAP
 CQG312SNb+GUcg+5NzYpoSGOdn1OxA+tLQ==
X-Google-Smtp-Source: ABdhPJwIpVeK4PfuFZREmoX+tGuaCqO1sHMNb72dSW5Mph/VPTo8p4DRYFwuBZysZufbMl9LmExM2g==
X-Received: by 2002:a05:6a00:1a03:b0:40d:55de:a70a with SMTP id
 g3-20020a056a001a0300b0040d55dea70amr1925695pfv.23.1631578707884; 
 Mon, 13 Sep 2021 17:18:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id hi12sm2638909pjb.48.2021.09.13.17.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:18:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/44] tcg/arm: Give enum arm_cond_code_e a typedef and use it
Date: Mon, 13 Sep 2021 17:14:54 -0700
Message-Id: <20210914001456.793490-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 136 +++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 529728fbbe..c068e707e8 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -92,7 +92,7 @@ static const int tcg_target_call_oarg_regs[2] = {
 #define TCG_REG_TMP  TCG_REG_R12
 #define TCG_VEC_TMP  TCG_REG_Q15
 
-enum arm_cond_code_e {
+typedef enum {
     COND_EQ = 0x0,
     COND_NE = 0x1,
     COND_CS = 0x2,	/* Unsigned greater or equal */
@@ -108,7 +108,7 @@ enum arm_cond_code_e {
     COND_GT = 0xc,
     COND_LE = 0xd,
     COND_AL = 0xe,
-};
+} ARMCond;
 
 #define TO_CPSR (1 << 20)
 
@@ -547,19 +547,19 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     return 0;
 }
 
-static void tcg_out_b_imm(TCGContext *s, int cond, int32_t offset)
+static void tcg_out_b_imm(TCGContext *s, ARMCond cond, int32_t offset)
 {
     tcg_out32(s, (cond << 28) | 0x0a000000 |
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_bl_imm(TCGContext *s, int cond, int32_t offset)
+static void tcg_out_bl_imm(TCGContext *s, ARMCond cond, int32_t offset)
 {
     tcg_out32(s, (cond << 28) | 0x0b000000 |
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_blx_reg(TCGContext *s, int cond, int rn)
+static void tcg_out_blx_reg(TCGContext *s, ARMCond cond, int rn)
 {
     tcg_out32(s, (cond << 28) | 0x012fff30 | rn);
 }
@@ -570,14 +570,14 @@ static void tcg_out_blx_imm(TCGContext *s, int32_t offset)
                 (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_dat_reg(TCGContext *s,
-                int cond, int opc, int rd, int rn, int rm, int shift)
+static void tcg_out_dat_reg(TCGContext *s, ARMCond cond, int opc, int rd,
+                            int rn, int rm, int shift)
 {
     tcg_out32(s, (cond << 28) | (0 << 25) | opc |
                     (rn << 16) | (rd << 12) | shift | rm);
 }
 
-static void tcg_out_mov_reg(TCGContext *s, int cond, int rd, int rm)
+static void tcg_out_mov_reg(TCGContext *s, ARMCond cond, int rd, int rm)
 {
     /* Simple reg-reg move, optimising out the 'do nothing' case */
     if (rd != rm) {
@@ -585,12 +585,12 @@ static void tcg_out_mov_reg(TCGContext *s, int cond, int rd, int rm)
     }
 }
 
-static void tcg_out_bx_reg(TCGContext *s, int cond, TCGReg rn)
+static void tcg_out_bx_reg(TCGContext *s, ARMCond cond, TCGReg rn)
 {
     tcg_out32(s, (cond << 28) | 0x012fff10 | rn);
 }
 
-static void tcg_out_b_reg(TCGContext *s, int cond, TCGReg rn)
+static void tcg_out_b_reg(TCGContext *s, ARMCond cond, TCGReg rn)
 {
     /*
      * Unless the C portion of QEMU is compiled as thumb, we don't need
@@ -603,14 +603,14 @@ static void tcg_out_b_reg(TCGContext *s, int cond, TCGReg rn)
     }
 }
 
-static void tcg_out_dat_imm(TCGContext *s, int cond, int opc,
+static void tcg_out_dat_imm(TCGContext *s, ARMCond cond, int opc,
                             int rd, int rn, int im)
 {
     tcg_out32(s, (cond << 28) | (1 << 25) | opc |
                     (rn << 16) | (rd << 12) | im);
 }
 
-static void tcg_out_ldstm(TCGContext *s, int cond, int opc,
+static void tcg_out_ldstm(TCGContext *s, ARMCond cond, int opc,
                           TCGReg rn, uint16_t mask)
 {
     tcg_out32(s, (cond << 28) | opc | (rn << 16) | mask);
@@ -618,14 +618,14 @@ static void tcg_out_ldstm(TCGContext *s, int cond, int opc,
 
 /* Note that this routine is used for both LDR and LDRH formats, so we do
    not wish to include an immediate shift at this point.  */
-static void tcg_out_memop_r(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
+static void tcg_out_memop_r(TCGContext *s, ARMCond cond, ARMInsn opc, TCGReg rt,
                             TCGReg rn, TCGReg rm, bool u, bool p, bool w)
 {
     tcg_out32(s, (cond << 28) | opc | (u << 23) | (p << 24)
               | (w << 21) | (rn << 16) | (rt << 12) | rm);
 }
 
-static void tcg_out_memop_8(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
+static void tcg_out_memop_8(TCGContext *s, ARMCond cond, ARMInsn opc, TCGReg rt,
                             TCGReg rn, int imm8, bool p, bool w)
 {
     bool u = 1;
@@ -637,7 +637,7 @@ static void tcg_out_memop_8(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
               (rn << 16) | (rt << 12) | ((imm8 & 0xf0) << 4) | (imm8 & 0xf));
 }
 
-static void tcg_out_memop_12(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
+static void tcg_out_memop_12(TCGContext *s, ARMCond cond, ARMInsn opc, TCGReg rt,
                              TCGReg rn, int imm12, bool p, bool w)
 {
     bool u = 1;
@@ -649,152 +649,152 @@ static void tcg_out_memop_12(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
               (rn << 16) | (rt << 12) | imm12);
 }
 
-static void tcg_out_ld32_12(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld32_12(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_LDR_IMM, rt, rn, imm12, 1, 0);
 }
 
-static void tcg_out_st32_12(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st32_12(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_STR_IMM, rt, rn, imm12, 1, 0);
 }
 
-static void tcg_out_ld32_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld32_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDR_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_st32_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st32_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STR_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_ldrd_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ldrd_8(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRD_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_ldrd_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ldrd_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRD_REG, rt, rn, rm, 1, 1, 0);
 }
 
 static void __attribute__((unused))
-tcg_out_ldrd_rwb(TCGContext *s, int cond, TCGReg rt, TCGReg rn, TCGReg rm)
+tcg_out_ldrd_rwb(TCGContext *s, ARMCond cond, TCGReg rt, TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRD_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static void tcg_out_strd_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_strd_8(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_STRD_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_strd_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_strd_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STRD_REG, rt, rn, rm, 1, 1, 0);
 }
 
 /* Register pre-increment with base writeback.  */
-static void tcg_out_ld32_rwb(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld32_rwb(TCGContext *s, ARMCond cond, TCGReg rt,
                              TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDR_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static void tcg_out_st32_rwb(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st32_rwb(TCGContext *s, ARMCond cond, TCGReg rt,
                              TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STR_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static void tcg_out_ld16u_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld16u_8(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRH_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_st16_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st16_8(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_STRH_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_ld16u_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld16u_r(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRH_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_st16_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st16_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STRH_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_ld16s_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld16s_8(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRSH_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_ld16s_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld16s_r(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRSH_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_ld8_12(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld8_12(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_LDRB_IMM, rt, rn, imm12, 1, 0);
 }
 
-static void tcg_out_st8_12(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st8_12(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_STRB_IMM, rt, rn, imm12, 1, 0);
 }
 
-static void tcg_out_ld8_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld8_r(TCGContext *s, ARMCond cond, TCGReg rt,
                           TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRB_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_st8_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st8_r(TCGContext *s, ARMCond cond, TCGReg rt,
                           TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STRB_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_ld8s_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld8s_8(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRSB_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_ld8s_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld8s_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRSB_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_movi_pool(TCGContext *s, int cond, int rd, uint32_t arg)
+static void tcg_out_movi_pool(TCGContext *s, ARMCond cond, int rd, uint32_t arg)
 {
     new_pool_label(s, arg, R_ARM_PC13, s->code_ptr, 0);
     tcg_out_ld32_12(s, cond, rd, TCG_REG_PC, 0);
 }
 
-static void tcg_out_movi32(TCGContext *s, int cond, int rd, uint32_t arg)
+static void tcg_out_movi32(TCGContext *s, ARMCond cond, int rd, uint32_t arg)
 {
     int imm12, diff, opc, sh1, sh2;
     uint32_t tt0, tt1, tt2;
@@ -873,7 +873,7 @@ static void tcg_out_movi32(TCGContext *s, int cond, int rd, uint32_t arg)
  * Emit either the reg,imm or reg,reg form of a data-processing insn.
  * rhs must satisfy the "rI" constraint.
  */
-static void tcg_out_dat_rI(TCGContext *s, int cond, int opc, TCGArg dst,
+static void tcg_out_dat_rI(TCGContext *s, ARMCond cond, int opc, TCGArg dst,
                            TCGArg lhs, TCGArg rhs, int rhs_is_const)
 {
     if (rhs_is_const) {
@@ -887,7 +887,7 @@ static void tcg_out_dat_rI(TCGContext *s, int cond, int opc, TCGArg dst,
  * Emit either the reg,imm or reg,reg form of a data-processing insn.
  * rhs must satisfy the "rIK" constraint.
  */
-static void tcg_out_dat_rIK(TCGContext *s, int cond, int opc, int opinv,
+static void tcg_out_dat_rIK(TCGContext *s, ARMCond cond, int opc, int opinv,
                             TCGReg dst, TCGReg lhs, TCGArg rhs,
                             bool rhs_is_const)
 {
@@ -903,7 +903,7 @@ static void tcg_out_dat_rIK(TCGContext *s, int cond, int opc, int opinv,
     }
 }
 
-static void tcg_out_dat_rIN(TCGContext *s, int cond, int opc, int opneg,
+static void tcg_out_dat_rIN(TCGContext *s, ARMCond cond, int opc, int opneg,
                             TCGArg dst, TCGArg lhs, TCGArg rhs,
                             bool rhs_is_const)
 {
@@ -922,7 +922,7 @@ static void tcg_out_dat_rIN(TCGContext *s, int cond, int opc, int opneg,
     }
 }
 
-static void tcg_out_mul32(TCGContext *s, int cond, TCGReg rd,
+static void tcg_out_mul32(TCGContext *s, ARMCond cond, TCGReg rd,
                           TCGReg rn, TCGReg rm)
 {
     /* if ArchVersion() < 6 && d == n then UNPREDICTABLE;  */
@@ -940,7 +940,7 @@ static void tcg_out_mul32(TCGContext *s, int cond, TCGReg rd,
     tcg_out32(s, (cond << 28) | 0x90 | (rd << 16) | (rm << 8) | rn);
 }
 
-static void tcg_out_umull32(TCGContext *s, int cond, TCGReg rd0,
+static void tcg_out_umull32(TCGContext *s, ARMCond cond, TCGReg rd0,
                             TCGReg rd1, TCGReg rn, TCGReg rm)
 {
     /* if ArchVersion() < 6 && (dHi == n || dLo == n) then UNPREDICTABLE;  */
@@ -959,7 +959,7 @@ static void tcg_out_umull32(TCGContext *s, int cond, TCGReg rd0,
               (rd1 << 16) | (rd0 << 12) | (rm << 8) | rn);
 }
 
-static void tcg_out_smull32(TCGContext *s, int cond, TCGReg rd0,
+static void tcg_out_smull32(TCGContext *s, ARMCond cond, TCGReg rd0,
                             TCGReg rd1, TCGReg rn, TCGReg rm)
 {
     /* if ArchVersion() < 6 && (dHi == n || dLo == n) then UNPREDICTABLE;  */
@@ -978,17 +978,17 @@ static void tcg_out_smull32(TCGContext *s, int cond, TCGReg rd0,
               (rd1 << 16) | (rd0 << 12) | (rm << 8) | rn);
 }
 
-static void tcg_out_sdiv(TCGContext *s, int cond, int rd, int rn, int rm)
+static void tcg_out_sdiv(TCGContext *s, ARMCond cond, int rd, int rn, int rm)
 {
     tcg_out32(s, 0x0710f010 | (cond << 28) | (rd << 16) | rn | (rm << 8));
 }
 
-static void tcg_out_udiv(TCGContext *s, int cond, int rd, int rn, int rm)
+static void tcg_out_udiv(TCGContext *s, ARMCond cond, int rd, int rn, int rm)
 {
     tcg_out32(s, 0x0730f010 | (cond << 28) | (rd << 16) | rn | (rm << 8));
 }
 
-static void tcg_out_ext8s(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_ext8s(TCGContext *s, ARMCond cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* sxtb */
@@ -1002,12 +1002,12 @@ static void tcg_out_ext8s(TCGContext *s, int cond, int rd, int rn)
 }
 
 static void __attribute__((unused))
-tcg_out_ext8u(TCGContext *s, int cond, int rd, int rn)
+tcg_out_ext8u(TCGContext *s, ARMCond cond, int rd, int rn)
 {
     tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
 }
 
-static void tcg_out_ext16s(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_ext16s(TCGContext *s, ARMCond cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* sxth */
@@ -1020,7 +1020,7 @@ static void tcg_out_ext16s(TCGContext *s, int cond, int rd, int rn)
     }
 }
 
-static void tcg_out_ext16u(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_ext16u(TCGContext *s, ARMCond cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* uxth */
@@ -1033,7 +1033,7 @@ static void tcg_out_ext16u(TCGContext *s, int cond, int rd, int rn)
     }
 }
 
-static void tcg_out_bswap16(TCGContext *s, int cond, int rd, int rn, int flags)
+static void tcg_out_bswap16(TCGContext *s, ARMCond cond, int rd, int rn, int flags)
 {
     if (use_armv6_instructions) {
         if (flags & TCG_BSWAP_OS) {
@@ -1100,7 +1100,7 @@ static void tcg_out_bswap16(TCGContext *s, int cond, int rd, int rn, int flags)
                      ? SHIFT_IMM_ASR(8) : SHIFT_IMM_LSR(8)));
 }
 
-static void tcg_out_bswap32(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_bswap32(TCGContext *s, ARMCond cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* rev */
@@ -1117,7 +1117,7 @@ static void tcg_out_bswap32(TCGContext *s, int cond, int rd, int rn)
     }
 }
 
-static void tcg_out_deposit(TCGContext *s, int cond, TCGReg rd,
+static void tcg_out_deposit(TCGContext *s, ARMCond cond, TCGReg rd,
                             TCGArg a1, int ofs, int len, bool const_a1)
 {
     if (const_a1) {
@@ -1129,7 +1129,7 @@ static void tcg_out_deposit(TCGContext *s, int cond, TCGReg rd,
               | (ofs << 7) | ((ofs + len - 1) << 16));
 }
 
-static void tcg_out_extract(TCGContext *s, int cond, TCGReg rd,
+static void tcg_out_extract(TCGContext *s, ARMCond cond, TCGReg rd,
                             TCGArg a1, int ofs, int len)
 {
     /* ubfx */
@@ -1137,7 +1137,7 @@ static void tcg_out_extract(TCGContext *s, int cond, TCGReg rd,
               | (ofs << 7) | ((len - 1) << 16));
 }
 
-static void tcg_out_sextract(TCGContext *s, int cond, TCGReg rd,
+static void tcg_out_sextract(TCGContext *s, ARMCond cond, TCGReg rd,
                              TCGArg a1, int ofs, int len)
 {
     /* sbfx */
@@ -1145,7 +1145,7 @@ static void tcg_out_sextract(TCGContext *s, int cond, TCGReg rd,
               | (ofs << 7) | ((len - 1) << 16));
 }
 
-static void tcg_out_ld32u(TCGContext *s, int cond,
+static void tcg_out_ld32u(TCGContext *s, ARMCond cond,
                           int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
@@ -1155,7 +1155,7 @@ static void tcg_out_ld32u(TCGContext *s, int cond,
         tcg_out_ld32_12(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_st32(TCGContext *s, int cond,
+static void tcg_out_st32(TCGContext *s, ARMCond cond,
                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
@@ -1165,7 +1165,7 @@ static void tcg_out_st32(TCGContext *s, int cond,
         tcg_out_st32_12(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_ld16u(TCGContext *s, int cond,
+static void tcg_out_ld16u(TCGContext *s, ARMCond cond,
                           int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
@@ -1175,7 +1175,7 @@ static void tcg_out_ld16u(TCGContext *s, int cond,
         tcg_out_ld16u_8(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_ld16s(TCGContext *s, int cond,
+static void tcg_out_ld16s(TCGContext *s, ARMCond cond,
                           int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
@@ -1185,7 +1185,7 @@ static void tcg_out_ld16s(TCGContext *s, int cond,
         tcg_out_ld16s_8(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_st16(TCGContext *s, int cond,
+static void tcg_out_st16(TCGContext *s, ARMCond cond,
                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
@@ -1195,7 +1195,7 @@ static void tcg_out_st16(TCGContext *s, int cond,
         tcg_out_st16_8(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_ld8u(TCGContext *s, int cond,
+static void tcg_out_ld8u(TCGContext *s, ARMCond cond,
                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
@@ -1205,7 +1205,7 @@ static void tcg_out_ld8u(TCGContext *s, int cond,
         tcg_out_ld8_12(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_ld8s(TCGContext *s, int cond,
+static void tcg_out_ld8s(TCGContext *s, ARMCond cond,
                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
@@ -1215,7 +1215,7 @@ static void tcg_out_ld8s(TCGContext *s, int cond,
         tcg_out_ld8s_8(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_st8(TCGContext *s, int cond,
+static void tcg_out_st8(TCGContext *s, ARMCond cond,
                         int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
@@ -1230,7 +1230,7 @@ static void tcg_out_st8(TCGContext *s, int cond,
  * with the code buffer limited to 16MB we wouldn't need the long case.
  * But we also use it for the tail-call to the qemu_ld/st helpers, which does.
  */
-static void tcg_out_goto(TCGContext *s, int cond, const tcg_insn_unit *addr)
+static void tcg_out_goto(TCGContext *s, ARMCond cond, const tcg_insn_unit *addr)
 {
     intptr_t addri = (intptr_t)addr;
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
@@ -1287,7 +1287,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
     }
 }
 
-static void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
+static void tcg_out_goto_label(TCGContext *s, ARMCond cond, TCGLabel *l)
 {
     if (l->has_value) {
         tcg_out_goto(s, cond, l->u.value_ptr);
@@ -1879,7 +1879,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 }
 
-static void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp opc,
+static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
                                   TCGReg datalo, TCGReg datahi,
                                   TCGReg addrlo, TCGReg addend)
 {
-- 
2.25.1


