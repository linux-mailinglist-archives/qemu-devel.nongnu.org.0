Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949C53F0D73
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:36:10 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTEH-0006KQ-IB
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7o-000630-2p
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:28 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7l-0005ms-7q
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:27 -0400
Received: by mail-pf1-x430.google.com with SMTP id y190so3506788pfg.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NF/gBnSaaHV6NiCUTT8/7w/1j/EXyA7+Vpcz9nr4IuM=;
 b=HV3C5D8wM+8+cZHZ1c/XPn9d6bceM+PVpUyqs9Muj/AJmmsLtMNqj70rUa+YA5wBaX
 MJYUgRxS0cVEwiAWKtwL9mb7eTSk4/aWca1y4ftJXUyfVvflcX832TmnilEVlQ/4DwKQ
 Zgz9n/8YNVNXjGM1ijL/zNvHRwgYKGzPwGUJBCHzdvygbvRF6z6fBHxe9xJOr9pT/w18
 Gzhm28nERW+5upR0CrbAuP/7Xf8cmYdts8A+BDnkBKGlmSo/RIh9V8xjChJUH3Icq+Ba
 q2TjeFtR+PsCQzoNqFMYQaKZupM0gYk6SfKZLS0NF9EtyoJ8AYZ8GGGA0YF9sqcSV02m
 YTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NF/gBnSaaHV6NiCUTT8/7w/1j/EXyA7+Vpcz9nr4IuM=;
 b=oZUsLAYvF/mpz3r1w5vNBK0JB7TQ05+8fM3AFOaVJh8kcq1XUGnXXsDeLxum4ATLPn
 zkpZZwLz/vQSbFCjoPcW2lMeA0FCKLwuibUpYdq8JBVF7U4qJ+5GHHdeIZh5s10IAA/4
 hMNFhKd99GL+UI6P4moue0Y7DnPCc173jD8ljmAxcSKVepgGcoW5j+QR2Zo2gNdZvZ5J
 49t9pj4kUWqaRJrBCNELuJHKyX2L8lhD8W78w2saJsfBRnZzDWn+WE17ui/ispjeSaPM
 LnLxyuo0/Rw+5tdn5Ot0jKjqj5etOtc5AzuGQJ34aMINCpWrc6RIZleY/mmLLErbfBLj
 arxA==
X-Gm-Message-State: AOAM531Xp7MeHfmyDEEFO0QzdkfS6oiP5GJT3HYpAFZOV8mX/zAnCnLC
 WCi0txhegywOgGCNdZdUbhzXG4VR4Dkqyw==
X-Google-Smtp-Source: ABdhPJzcXJMxTgBS4/0qoSeuRvwobdwx0vOcuW3AL7ra8izGJL6Kg+wNSB5CJr3iJtub2Ep9yFeorQ==
X-Received: by 2002:a63:1b60:: with SMTP id b32mr1244791pgm.422.1629322163813; 
 Wed, 18 Aug 2021 14:29:23 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/14] tcg/arm: Drop inline markers
Date: Wed, 18 Aug 2021 11:29:07 -1000
Message-Id: <20210818212912.396794-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Let the compiler decide about inlining.
Remove tcg_out_nop as unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 234 +++++++++++++++++++--------------------
 1 file changed, 114 insertions(+), 120 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 265370b2ee..327032f0df 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -410,7 +410,7 @@ static int encode_imm_nofail(uint32_t imm)
     return ret;
 }
 
-static inline int check_fit_imm(uint32_t imm)
+static bool check_fit_imm(uint32_t imm)
 {
     return encode_imm(imm) >= 0;
 }
@@ -540,42 +540,37 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     return 0;
 }
 
-static inline void tcg_out_b_imm(TCGContext *s, int cond, int32_t offset)
+static void tcg_out_b_imm(TCGContext *s, int cond, int32_t offset)
 {
     tcg_out32(s, (cond << 28) | 0x0a000000 |
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static inline void tcg_out_bl_imm(TCGContext *s, int cond, int32_t offset)
+static void tcg_out_bl_imm(TCGContext *s, int cond, int32_t offset)
 {
     tcg_out32(s, (cond << 28) | 0x0b000000 |
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static inline void tcg_out_blx_reg(TCGContext *s, int cond, int rn)
+static void tcg_out_blx_reg(TCGContext *s, int cond, int rn)
 {
     tcg_out32(s, (cond << 28) | 0x012fff30 | rn);
 }
 
-static inline void tcg_out_blx_imm(TCGContext *s, int32_t offset)
+static void tcg_out_blx_imm(TCGContext *s, int32_t offset)
 {
     tcg_out32(s, 0xfa000000 | ((offset & 2) << 23) |
                 (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static inline void tcg_out_dat_reg(TCGContext *s,
+static void tcg_out_dat_reg(TCGContext *s,
                 int cond, int opc, int rd, int rn, int rm, int shift)
 {
     tcg_out32(s, (cond << 28) | (0 << 25) | opc |
                     (rn << 16) | (rd << 12) | shift | rm);
 }
 
-static inline void tcg_out_nop(TCGContext *s)
-{
-    tcg_out32(s, INSN_NOP);
-}
-
-static inline void tcg_out_mov_reg(TCGContext *s, int cond, int rd, int rm)
+static void tcg_out_mov_reg(TCGContext *s, int cond, int rd, int rm)
 {
     /* Simple reg-reg move, optimising out the 'do nothing' case */
     if (rd != rm) {
@@ -601,8 +596,8 @@ static void tcg_out_b_reg(TCGContext *s, int cond, TCGReg rn)
     }
 }
 
-static inline void tcg_out_dat_imm(TCGContext *s,
-                int cond, int opc, int rd, int rn, int im)
+static void tcg_out_dat_imm(TCGContext *s, int cond, int opc,
+                            int rd, int rn, int im)
 {
     tcg_out32(s, (cond << 28) | (1 << 25) | opc |
                     (rn << 16) | (rd << 12) | im);
@@ -647,141 +642,141 @@ static void tcg_out_memop_12(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
               (rn << 16) | (rt << 12) | imm12);
 }
 
-static inline void tcg_out_ld32_12(TCGContext *s, int cond, TCGReg rt,
-                                   TCGReg rn, int imm12)
+static void tcg_out_ld32_12(TCGContext *s, int cond, TCGReg rt,
+                            TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_LDR_IMM, rt, rn, imm12, 1, 0);
 }
 
-static inline void tcg_out_st32_12(TCGContext *s, int cond, TCGReg rt,
-                                   TCGReg rn, int imm12)
+static void tcg_out_st32_12(TCGContext *s, int cond, TCGReg rt,
+                            TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_STR_IMM, rt, rn, imm12, 1, 0);
 }
 
-static inline void tcg_out_ld32_r(TCGContext *s, int cond, TCGReg rt,
-                                  TCGReg rn, TCGReg rm)
+static void tcg_out_ld32_r(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDR_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static inline void tcg_out_st32_r(TCGContext *s, int cond, TCGReg rt,
-                                  TCGReg rn, TCGReg rm)
+static void tcg_out_st32_r(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STR_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static inline void tcg_out_ldrd_8(TCGContext *s, int cond, TCGReg rt,
-                                   TCGReg rn, int imm8)
+static void tcg_out_ldrd_8(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRD_IMM, rt, rn, imm8, 1, 0);
 }
 
-static inline void tcg_out_ldrd_r(TCGContext *s, int cond, TCGReg rt,
-                                  TCGReg rn, TCGReg rm)
+static void tcg_out_ldrd_r(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRD_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static inline void tcg_out_ldrd_rwb(TCGContext *s, int cond, TCGReg rt,
-                                    TCGReg rn, TCGReg rm)
+static void __attribute__((unused))
+tcg_out_ldrd_rwb(TCGContext *s, int cond, TCGReg rt, TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRD_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static inline void tcg_out_strd_8(TCGContext *s, int cond, TCGReg rt,
-                                   TCGReg rn, int imm8)
+static void tcg_out_strd_8(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_STRD_IMM, rt, rn, imm8, 1, 0);
 }
 
-static inline void tcg_out_strd_r(TCGContext *s, int cond, TCGReg rt,
-                                  TCGReg rn, TCGReg rm)
+static void tcg_out_strd_r(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STRD_REG, rt, rn, rm, 1, 1, 0);
 }
 
 /* Register pre-increment with base writeback.  */
-static inline void tcg_out_ld32_rwb(TCGContext *s, int cond, TCGReg rt,
-                                    TCGReg rn, TCGReg rm)
+static void tcg_out_ld32_rwb(TCGContext *s, int cond, TCGReg rt,
+                             TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDR_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static inline void tcg_out_st32_rwb(TCGContext *s, int cond, TCGReg rt,
-                                    TCGReg rn, TCGReg rm)
+static void tcg_out_st32_rwb(TCGContext *s, int cond, TCGReg rt,
+                             TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STR_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static inline void tcg_out_ld16u_8(TCGContext *s, int cond, TCGReg rt,
-                                   TCGReg rn, int imm8)
+static void tcg_out_ld16u_8(TCGContext *s, int cond, TCGReg rt,
+                            TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRH_IMM, rt, rn, imm8, 1, 0);
 }
 
-static inline void tcg_out_st16_8(TCGContext *s, int cond, TCGReg rt,
-                                  TCGReg rn, int imm8)
+static void tcg_out_st16_8(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_STRH_IMM, rt, rn, imm8, 1, 0);
 }
 
-static inline void tcg_out_ld16u_r(TCGContext *s, int cond, TCGReg rt,
-                                   TCGReg rn, TCGReg rm)
+static void tcg_out_ld16u_r(TCGContext *s, int cond, TCGReg rt,
+                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRH_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static inline void tcg_out_st16_r(TCGContext *s, int cond, TCGReg rt,
-                                  TCGReg rn, TCGReg rm)
+static void tcg_out_st16_r(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STRH_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static inline void tcg_out_ld16s_8(TCGContext *s, int cond, TCGReg rt,
-                                   TCGReg rn, int imm8)
+static void tcg_out_ld16s_8(TCGContext *s, int cond, TCGReg rt,
+                            TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRSH_IMM, rt, rn, imm8, 1, 0);
 }
 
-static inline void tcg_out_ld16s_r(TCGContext *s, int cond, TCGReg rt,
-                                   TCGReg rn, TCGReg rm)
+static void tcg_out_ld16s_r(TCGContext *s, int cond, TCGReg rt,
+                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRSH_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static inline void tcg_out_ld8_12(TCGContext *s, int cond, TCGReg rt,
-                                  TCGReg rn, int imm12)
+static void tcg_out_ld8_12(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_LDRB_IMM, rt, rn, imm12, 1, 0);
 }
 
-static inline void tcg_out_st8_12(TCGContext *s, int cond, TCGReg rt,
-                                  TCGReg rn, int imm12)
+static void tcg_out_st8_12(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_STRB_IMM, rt, rn, imm12, 1, 0);
 }
 
-static inline void tcg_out_ld8_r(TCGContext *s, int cond, TCGReg rt,
-                                 TCGReg rn, TCGReg rm)
+static void tcg_out_ld8_r(TCGContext *s, int cond, TCGReg rt,
+                          TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRB_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static inline void tcg_out_st8_r(TCGContext *s, int cond, TCGReg rt,
-                                 TCGReg rn, TCGReg rm)
+static void tcg_out_st8_r(TCGContext *s, int cond, TCGReg rt,
+                          TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STRB_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static inline void tcg_out_ld8s_8(TCGContext *s, int cond, TCGReg rt,
-                                  TCGReg rn, int imm8)
+static void tcg_out_ld8s_8(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRSB_IMM, rt, rn, imm8, 1, 0);
 }
 
-static inline void tcg_out_ld8s_r(TCGContext *s, int cond, TCGReg rt,
-                                  TCGReg rn, TCGReg rm)
+static void tcg_out_ld8s_r(TCGContext *s, int cond, TCGReg rt,
+                           TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRSB_REG, rt, rn, rm, 1, 1, 0);
 }
@@ -871,8 +866,8 @@ static void tcg_out_movi32(TCGContext *s, int cond, int rd, uint32_t arg)
  * Emit either the reg,imm or reg,reg form of a data-processing insn.
  * rhs must satisfy the "rI" constraint.
  */
-static inline void tcg_out_dat_rI(TCGContext *s, int cond, int opc, TCGArg dst,
-                                  TCGArg lhs, TCGArg rhs, int rhs_is_const)
+static void tcg_out_dat_rI(TCGContext *s, int cond, int opc, TCGArg dst,
+                           TCGArg lhs, TCGArg rhs, int rhs_is_const)
 {
     if (rhs_is_const) {
         tcg_out_dat_imm(s, cond, opc, dst, lhs, encode_imm_nofail(rhs));
@@ -920,8 +915,8 @@ static void tcg_out_dat_rIN(TCGContext *s, int cond, int opc, int opneg,
     }
 }
 
-static inline void tcg_out_mul32(TCGContext *s, int cond, TCGReg rd,
-                                 TCGReg rn, TCGReg rm)
+static void tcg_out_mul32(TCGContext *s, int cond, TCGReg rd,
+                          TCGReg rn, TCGReg rm)
 {
     /* if ArchVersion() < 6 && d == n then UNPREDICTABLE;  */
     if (!use_armv6_instructions && rd == rn) {
@@ -938,8 +933,8 @@ static inline void tcg_out_mul32(TCGContext *s, int cond, TCGReg rd,
     tcg_out32(s, (cond << 28) | 0x90 | (rd << 16) | (rm << 8) | rn);
 }
 
-static inline void tcg_out_umull32(TCGContext *s, int cond, TCGReg rd0,
-                                   TCGReg rd1, TCGReg rn, TCGReg rm)
+static void tcg_out_umull32(TCGContext *s, int cond, TCGReg rd0,
+                            TCGReg rd1, TCGReg rn, TCGReg rm)
 {
     /* if ArchVersion() < 6 && (dHi == n || dLo == n) then UNPREDICTABLE;  */
     if (!use_armv6_instructions && (rd0 == rn || rd1 == rn)) {
@@ -957,8 +952,8 @@ static inline void tcg_out_umull32(TCGContext *s, int cond, TCGReg rd0,
               (rd1 << 16) | (rd0 << 12) | (rm << 8) | rn);
 }
 
-static inline void tcg_out_smull32(TCGContext *s, int cond, TCGReg rd0,
-                                   TCGReg rd1, TCGReg rn, TCGReg rm)
+static void tcg_out_smull32(TCGContext *s, int cond, TCGReg rd0,
+                            TCGReg rd1, TCGReg rn, TCGReg rm)
 {
     /* if ArchVersion() < 6 && (dHi == n || dLo == n) then UNPREDICTABLE;  */
     if (!use_armv6_instructions && (rd0 == rn || rd1 == rn)) {
@@ -976,18 +971,17 @@ static inline void tcg_out_smull32(TCGContext *s, int cond, TCGReg rd0,
               (rd1 << 16) | (rd0 << 12) | (rm << 8) | rn);
 }
 
-static inline void tcg_out_sdiv(TCGContext *s, int cond, int rd, int rn, int rm)
+static void tcg_out_sdiv(TCGContext *s, int cond, int rd, int rn, int rm)
 {
     tcg_out32(s, 0x0710f010 | (cond << 28) | (rd << 16) | rn | (rm << 8));
 }
 
-static inline void tcg_out_udiv(TCGContext *s, int cond, int rd, int rn, int rm)
+static void tcg_out_udiv(TCGContext *s, int cond, int rd, int rn, int rm)
 {
     tcg_out32(s, 0x0730f010 | (cond << 28) | (rd << 16) | rn | (rm << 8));
 }
 
-static inline void tcg_out_ext8s(TCGContext *s, int cond,
-                                 int rd, int rn)
+static void tcg_out_ext8s(TCGContext *s, int cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* sxtb */
@@ -1000,14 +994,13 @@ static inline void tcg_out_ext8s(TCGContext *s, int cond,
     }
 }
 
-static inline void tcg_out_ext8u(TCGContext *s, int cond,
-                                 int rd, int rn)
+static void __attribute__((unused))
+tcg_out_ext8u(TCGContext *s, int cond, int rd, int rn)
 {
     tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
 }
 
-static inline void tcg_out_ext16s(TCGContext *s, int cond,
-                                  int rd, int rn)
+static void tcg_out_ext16s(TCGContext *s, int cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* sxth */
@@ -1020,8 +1013,7 @@ static inline void tcg_out_ext16s(TCGContext *s, int cond,
     }
 }
 
-static inline void tcg_out_ext16u(TCGContext *s, int cond,
-                                  int rd, int rn)
+static void tcg_out_ext16u(TCGContext *s, int cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* uxth */
@@ -1101,7 +1093,7 @@ static void tcg_out_bswap16(TCGContext *s, int cond, int rd, int rn, int flags)
                      ? SHIFT_IMM_ASR(8) : SHIFT_IMM_LSR(8)));
 }
 
-static inline void tcg_out_bswap32(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_bswap32(TCGContext *s, int cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* rev */
@@ -1118,8 +1110,8 @@ static inline void tcg_out_bswap32(TCGContext *s, int cond, int rd, int rn)
     }
 }
 
-static inline void tcg_out_deposit(TCGContext *s, int cond, TCGReg rd,
-                                   TCGArg a1, int ofs, int len, bool const_a1)
+static void tcg_out_deposit(TCGContext *s, int cond, TCGReg rd,
+                            TCGArg a1, int ofs, int len, bool const_a1)
 {
     if (const_a1) {
         /* bfi becomes bfc with rn == 15.  */
@@ -1130,24 +1122,24 @@ static inline void tcg_out_deposit(TCGContext *s, int cond, TCGReg rd,
               | (ofs << 7) | ((ofs + len - 1) << 16));
 }
 
-static inline void tcg_out_extract(TCGContext *s, int cond, TCGReg rd,
-                                   TCGArg a1, int ofs, int len)
+static void tcg_out_extract(TCGContext *s, int cond, TCGReg rd,
+                            TCGArg a1, int ofs, int len)
 {
     /* ubfx */
     tcg_out32(s, 0x07e00050 | (cond << 28) | (rd << 12) | a1
               | (ofs << 7) | ((len - 1) << 16));
 }
 
-static inline void tcg_out_sextract(TCGContext *s, int cond, TCGReg rd,
-                                    TCGArg a1, int ofs, int len)
+static void tcg_out_sextract(TCGContext *s, int cond, TCGReg rd,
+                             TCGArg a1, int ofs, int len)
 {
     /* sbfx */
     tcg_out32(s, 0x07a00050 | (cond << 28) | (rd << 12) | a1
               | (ofs << 7) | ((len - 1) << 16));
 }
 
-static inline void tcg_out_ld32u(TCGContext *s, int cond,
-                int rd, int rn, int32_t offset)
+static void tcg_out_ld32u(TCGContext *s, int cond,
+                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1156,8 +1148,8 @@ static inline void tcg_out_ld32u(TCGContext *s, int cond,
         tcg_out_ld32_12(s, cond, rd, rn, offset);
 }
 
-static inline void tcg_out_st32(TCGContext *s, int cond,
-                int rd, int rn, int32_t offset)
+static void tcg_out_st32(TCGContext *s, int cond,
+                         int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1166,8 +1158,8 @@ static inline void tcg_out_st32(TCGContext *s, int cond,
         tcg_out_st32_12(s, cond, rd, rn, offset);
 }
 
-static inline void tcg_out_ld16u(TCGContext *s, int cond,
-                int rd, int rn, int32_t offset)
+static void tcg_out_ld16u(TCGContext *s, int cond,
+                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1176,8 +1168,8 @@ static inline void tcg_out_ld16u(TCGContext *s, int cond,
         tcg_out_ld16u_8(s, cond, rd, rn, offset);
 }
 
-static inline void tcg_out_ld16s(TCGContext *s, int cond,
-                int rd, int rn, int32_t offset)
+static void tcg_out_ld16s(TCGContext *s, int cond,
+                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1186,8 +1178,8 @@ static inline void tcg_out_ld16s(TCGContext *s, int cond,
         tcg_out_ld16s_8(s, cond, rd, rn, offset);
 }
 
-static inline void tcg_out_st16(TCGContext *s, int cond,
-                int rd, int rn, int32_t offset)
+static void tcg_out_st16(TCGContext *s, int cond,
+                         int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1196,8 +1188,8 @@ static inline void tcg_out_st16(TCGContext *s, int cond,
         tcg_out_st16_8(s, cond, rd, rn, offset);
 }
 
-static inline void tcg_out_ld8u(TCGContext *s, int cond,
-                int rd, int rn, int32_t offset)
+static void tcg_out_ld8u(TCGContext *s, int cond,
+                         int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1206,8 +1198,8 @@ static inline void tcg_out_ld8u(TCGContext *s, int cond,
         tcg_out_ld8_12(s, cond, rd, rn, offset);
 }
 
-static inline void tcg_out_ld8s(TCGContext *s, int cond,
-                int rd, int rn, int32_t offset)
+static void tcg_out_ld8s(TCGContext *s, int cond,
+                         int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1216,8 +1208,8 @@ static inline void tcg_out_ld8s(TCGContext *s, int cond,
         tcg_out_ld8s_8(s, cond, rd, rn, offset);
 }
 
-static inline void tcg_out_st8(TCGContext *s, int cond,
-                int rd, int rn, int32_t offset)
+static void tcg_out_st8(TCGContext *s, int cond,
+                        int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1288,7 +1280,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
     }
 }
 
-static inline void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
+static void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
 {
     if (l->has_value) {
         tcg_out_goto(s, cond, l->u.value_ptr);
@@ -1298,7 +1290,7 @@ static inline void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
     }
 }
 
-static inline void tcg_out_mb(TCGContext *s, TCGArg a0)
+static void tcg_out_mb(TCGContext *s, TCGArg a0)
 {
     if (use_armv7_instructions) {
         tcg_out32(s, INSN_DMB_ISH);
@@ -1764,9 +1756,9 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 }
 #endif /* SOFTMMU */
 
-static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
-                                         TCGReg datalo, TCGReg datahi,
-                                         TCGReg addrlo, TCGReg addend)
+static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
+                                  TCGReg datalo, TCGReg datahi,
+                                  TCGReg addrlo, TCGReg addend)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1808,9 +1800,9 @@ static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
     }
 }
 
-static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
-                                          TCGReg datalo, TCGReg datahi,
-                                          TCGReg addrlo)
+#ifndef CONFIG_SOFTMMU
+static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
+                                   TCGReg datahi, TCGReg addrlo)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1849,6 +1841,7 @@ static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
         g_assert_not_reached();
     }
 }
+#endif
 
 static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 {
@@ -1891,9 +1884,9 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 }
 
-static inline void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp opc,
-                                         TCGReg datalo, TCGReg datahi,
-                                         TCGReg addrlo, TCGReg addend)
+static void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp opc,
+                                  TCGReg datalo, TCGReg datahi,
+                                  TCGReg addrlo, TCGReg addend)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1924,9 +1917,9 @@ static inline void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp opc,
     }
 }
 
-static inline void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc,
-                                          TCGReg datalo, TCGReg datahi,
-                                          TCGReg addrlo)
+#ifndef CONFIG_SOFTMMU
+static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
+                                   TCGReg datahi, TCGReg addrlo)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1956,6 +1949,7 @@ static inline void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc,
         g_assert_not_reached();
     }
 }
+#endif
 
 static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 {
@@ -2000,9 +1994,9 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 
 static void tcg_out_epilogue(TCGContext *s);
 
-static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                const TCGArg args[TCG_MAX_OP_ARGS],
-                const int const_args[TCG_MAX_OP_ARGS])
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2, a3, a4, a5;
     int c;
@@ -2591,8 +2585,8 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
     }
 }
 
-static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
-                               TCGReg base, intptr_t ofs)
+static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
+                        TCGReg base, intptr_t ofs)
 {
     return false;
 }
-- 
2.25.1


