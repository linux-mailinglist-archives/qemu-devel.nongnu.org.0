Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943553F0DA1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:44:46 +0200 (CEST)
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTMb-0005Uh-Kc
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7r-0006Gs-LB
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:31 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7o-0005od-3i
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:31 -0400
Received: by mail-pg1-x534.google.com with SMTP id x4so3709116pgh.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lPzInzzVO/z+oKSuWjc2o6V9Y5FWRuoifTPh6+wBc3g=;
 b=uie7nLFF8q9mum9Q/8HR+29AiBZw3HuUBRKO2IfLHCgY4gEa+MD0ecfxOFiyX7wdy4
 3sZNoilEnzVRoS2WIW0N7QlTmFmEb3cur82EiHlDwR3vl6NffAFcPewpigD6sl/4ghYJ
 SXAlWRy9XhefFgdfUyNMhRMSfDmB/26fDCyan09cN6YPvUlsImTS3LaN6oyytRQK2IeN
 SjTatlRPalCC2Kx1nAWbaVDv10YjI6LxvS1RgyrPW3WDTw+rGuAmkHtEXFAQ+oGX8Ziq
 8X/7F8swMmIlA7M7tD9MQTC92+8D0IZjlswG7WzesDTP4fhlzjmSA2xt/3VTJEbtA5US
 dpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPzInzzVO/z+oKSuWjc2o6V9Y5FWRuoifTPh6+wBc3g=;
 b=Q8joX/5USLPh3EbeSgbNo04mtLKw3Wh9ffkGVXiuvmk0xwKreTjT+LJXIuiyZhDMOz
 uhvGox6RQQxG8Xk3lDNXzNXNEN0czmcVAclhXDzbXNqWbj+nO88yLcRCMqwKc8ung8zS
 FC3ARdSH2YUCcLSo95jbXL02IYCCh70n+ldSfU5pqcVbjZClKofltsCMA9bzrN3E7L/Q
 NrgQm9p/ejJNVq/KBhGI5ISVdTNnnTqe3iwUzhrFjAUqPB2SAOTyLK8tOrEVfra4eSgM
 h3UiCFjX3bu+6JpfOl+sfXrOuhJMLKNnZ2XZdSU8drlArqIuuXOuC5tdcksXx7DIVJ7v
 fD0g==
X-Gm-Message-State: AOAM531c8LHXo561BIERDnUqaFYg0wPbIpJUDyJALrRKvwsRNM7/h8W4
 G4HThIVDOUpajGzJIp+Um/1zy20mlGECEw==
X-Google-Smtp-Source: ABdhPJx1A6maJ4ErAfEwmyQu/EUrYxuUhs4Ny9BbjPa+UHdJW+0tTyFLkqtcvZk/CMVcVRpIUql3mw==
X-Received: by 2002:a63:1056:: with SMTP id 22mr10766490pgq.178.1629322166769; 
 Wed, 18 Aug 2021 14:29:26 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/14] tcg/arm: More use of the TCGReg enum
Date: Wed, 18 Aug 2021 11:29:10 -1000
Message-Id: <20210818212912.396794-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 65 +++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2f55b94ada..35bd4c68d6 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -552,7 +552,7 @@ static void tcg_out_bl_imm(TCGContext *s, ARMCond cond, int32_t offset)
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_blx_reg(TCGContext *s, ARMCond cond, int rn)
+static void tcg_out_blx_reg(TCGContext *s, ARMCond cond, TCGReg rn)
 {
     tcg_out32(s, (cond << 28) | 0x012fff30 | rn);
 }
@@ -563,14 +563,14 @@ static void tcg_out_blx_imm(TCGContext *s, int32_t offset)
                 (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_dat_reg(TCGContext *s, ARMCond cond, ARMInsn opc, int rd,
-                            int rn, int rm, int shift)
+static void tcg_out_dat_reg(TCGContext *s, ARMCond cond, ARMInsn opc,
+                            TCGReg rd, TCGReg rn, TCGReg rm, int shift)
 {
     tcg_out32(s, (cond << 28) | (0 << 25) | opc |
                     (rn << 16) | (rd << 12) | shift | rm);
 }
 
-static void tcg_out_mov_reg(TCGContext *s, ARMCond cond, int rd, int rm)
+static void tcg_out_mov_reg(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rm)
 {
     /* Simple reg-reg move, optimising out the 'do nothing' case */
     if (rd != rm) {
@@ -597,7 +597,7 @@ static void tcg_out_b_reg(TCGContext *s, ARMCond cond, TCGReg rn)
 }
 
 static void tcg_out_dat_imm(TCGContext *s, ARMCond cond, ARMInsn opc,
-                            int rd, int rn, int im)
+                            TCGReg rd, TCGReg rn, int im)
 {
     tcg_out32(s, (cond << 28) | (1 << 25) | opc |
                     (rn << 16) | (rd << 12) | im);
@@ -781,13 +781,15 @@ static void tcg_out_ld8s_r(TCGContext *s, ARMCond cond, TCGReg rt,
     tcg_out_memop_r(s, cond, INSN_LDRSB_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_movi_pool(TCGContext *s, ARMCond cond, int rd, uint32_t arg)
+static void tcg_out_movi_pool(TCGContext *s, ARMCond cond,
+                              TCGReg rd, uint32_t arg)
 {
     new_pool_label(s, arg, R_ARM_PC13, s->code_ptr, 0);
     tcg_out_ld32_12(s, cond, rd, TCG_REG_PC, 0);
 }
 
-static void tcg_out_movi32(TCGContext *s, ARMCond cond, int rd, uint32_t arg)
+static void tcg_out_movi32(TCGContext *s, ARMCond cond,
+                           TCGReg rd, uint32_t arg)
 {
     int imm12, diff, opc, sh1, sh2;
     uint32_t tt0, tt1, tt2;
@@ -866,8 +868,8 @@ static void tcg_out_movi32(TCGContext *s, ARMCond cond, int rd, uint32_t arg)
  * Emit either the reg,imm or reg,reg form of a data-processing insn.
  * rhs must satisfy the "rI" constraint.
  */
-static void tcg_out_dat_rI(TCGContext *s, ARMCond cond, ARMInsn opc, TCGArg dst,
-                           TCGArg lhs, TCGArg rhs, int rhs_is_const)
+static void tcg_out_dat_rI(TCGContext *s, ARMCond cond, ARMInsn opc,
+                           TCGReg dst, TCGReg lhs, TCGArg rhs, int rhs_is_const)
 {
     if (rhs_is_const) {
         tcg_out_dat_imm(s, cond, opc, dst, lhs, encode_imm_nofail(rhs));
@@ -897,7 +899,7 @@ static void tcg_out_dat_rIK(TCGContext *s, ARMCond cond, ARMInsn opc,
 }
 
 static void tcg_out_dat_rIN(TCGContext *s, ARMCond cond, ARMInsn opc,
-                            ARMInsn opneg, TCGArg dst, TCGArg lhs, TCGArg rhs,
+                            ARMInsn opneg, TCGReg dst, TCGReg lhs, TCGArg rhs,
                             bool rhs_is_const)
 {
     /* Emit either the reg,imm or reg,reg form of a data-processing insn.
@@ -971,17 +973,19 @@ static void tcg_out_smull32(TCGContext *s, ARMCond cond, TCGReg rd0,
               (rd1 << 16) | (rd0 << 12) | (rm << 8) | rn);
 }
 
-static void tcg_out_sdiv(TCGContext *s, ARMCond cond, int rd, int rn, int rm)
+static void tcg_out_sdiv(TCGContext *s, ARMCond cond,
+                         TCGReg rd, TCGReg rn, TCGReg rm)
 {
     tcg_out32(s, 0x0710f010 | (cond << 28) | (rd << 16) | rn | (rm << 8));
 }
 
-static void tcg_out_udiv(TCGContext *s, ARMCond cond, int rd, int rn, int rm)
+static void tcg_out_udiv(TCGContext *s, ARMCond cond,
+                         TCGReg rd, TCGReg rn, TCGReg rm)
 {
     tcg_out32(s, 0x0730f010 | (cond << 28) | (rd << 16) | rn | (rm << 8));
 }
 
-static void tcg_out_ext8s(TCGContext *s, ARMCond cond, int rd, int rn)
+static void tcg_out_ext8s(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
     if (use_armv6_instructions) {
         /* sxtb */
@@ -995,12 +999,12 @@ static void tcg_out_ext8s(TCGContext *s, ARMCond cond, int rd, int rn)
 }
 
 static void __attribute__((unused))
-tcg_out_ext8u(TCGContext *s, ARMCond cond, int rd, int rn)
+tcg_out_ext8u(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
     tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
 }
 
-static void tcg_out_ext16s(TCGContext *s, ARMCond cond, int rd, int rn)
+static void tcg_out_ext16s(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
     if (use_armv6_instructions) {
         /* sxth */
@@ -1013,7 +1017,7 @@ static void tcg_out_ext16s(TCGContext *s, ARMCond cond, int rd, int rn)
     }
 }
 
-static void tcg_out_ext16u(TCGContext *s, ARMCond cond, int rd, int rn)
+static void tcg_out_ext16u(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
     if (use_armv6_instructions) {
         /* uxth */
@@ -1026,7 +1030,8 @@ static void tcg_out_ext16u(TCGContext *s, ARMCond cond, int rd, int rn)
     }
 }
 
-static void tcg_out_bswap16(TCGContext *s, ARMCond cond, int rd, int rn, int flags)
+static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
+                            TCGReg rd, TCGReg rn, int flags)
 {
     if (use_armv6_instructions) {
         if (flags & TCG_BSWAP_OS) {
@@ -1093,7 +1098,7 @@ static void tcg_out_bswap16(TCGContext *s, ARMCond cond, int rd, int rn, int fla
                      ? SHIFT_IMM_ASR(8) : SHIFT_IMM_LSR(8)));
 }
 
-static void tcg_out_bswap32(TCGContext *s, ARMCond cond, int rd, int rn)
+static void tcg_out_bswap32(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
     if (use_armv6_instructions) {
         /* rev */
@@ -1123,23 +1128,23 @@ static void tcg_out_deposit(TCGContext *s, ARMCond cond, TCGReg rd,
 }
 
 static void tcg_out_extract(TCGContext *s, ARMCond cond, TCGReg rd,
-                            TCGArg a1, int ofs, int len)
+                            TCGReg rn, int ofs, int len)
 {
     /* ubfx */
-    tcg_out32(s, 0x07e00050 | (cond << 28) | (rd << 12) | a1
+    tcg_out32(s, 0x07e00050 | (cond << 28) | (rd << 12) | rn
               | (ofs << 7) | ((len - 1) << 16));
 }
 
 static void tcg_out_sextract(TCGContext *s, ARMCond cond, TCGReg rd,
-                             TCGArg a1, int ofs, int len)
+                             TCGReg rn, int ofs, int len)
 {
     /* sbfx */
-    tcg_out32(s, 0x07a00050 | (cond << 28) | (rd << 12) | a1
+    tcg_out32(s, 0x07a00050 | (cond << 28) | (rd << 12) | rn
               | (ofs << 7) | ((len - 1) << 16));
 }
 
 static void tcg_out_ld32u(TCGContext *s, ARMCond cond,
-                          int rd, int rn, int32_t offset)
+                          TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1149,7 +1154,7 @@ static void tcg_out_ld32u(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_st32(TCGContext *s, ARMCond cond,
-                         int rd, int rn, int32_t offset)
+                         TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1159,7 +1164,7 @@ static void tcg_out_st32(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_ld16u(TCGContext *s, ARMCond cond,
-                          int rd, int rn, int32_t offset)
+                          TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1169,7 +1174,7 @@ static void tcg_out_ld16u(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_ld16s(TCGContext *s, ARMCond cond,
-                          int rd, int rn, int32_t offset)
+                          TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1179,7 +1184,7 @@ static void tcg_out_ld16s(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_st16(TCGContext *s, ARMCond cond,
-                         int rd, int rn, int32_t offset)
+                         TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1189,7 +1194,7 @@ static void tcg_out_st16(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_ld8u(TCGContext *s, ARMCond cond,
-                         int rd, int rn, int32_t offset)
+                         TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1199,7 +1204,7 @@ static void tcg_out_ld8u(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_ld8s(TCGContext *s, ARMCond cond,
-                         int rd, int rn, int32_t offset)
+                         TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1209,7 +1214,7 @@ static void tcg_out_ld8s(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_st8(TCGContext *s, ARMCond cond,
-                        int rd, int rn, int32_t offset)
+                        TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
-- 
2.25.1


