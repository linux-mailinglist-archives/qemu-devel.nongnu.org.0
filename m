Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40A240A256
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 03:08:46 +0200 (CEST)
Received: from localhost ([::1]:35378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwwG-0003Wo-1I
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 21:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw9j-0006oZ-9e
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:18:35 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw9e-0001Rq-Sh
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:18:35 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e7so11033934pgk.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LrRSnsLzb6+9xeAkjXaq3no/0Ryp2TTboE6zMVigLI8=;
 b=nY6iWRIS1lSIoRPe0s7DnsqHIZpQOK91lcO+i0vZyghXcsG8+XjFbpD6rUmdHyX9N4
 Qh9HIZ8MeNxYpd2l/pje8ebZeMe9jfzmcSq1uEfvyeGwTBzruxVT2EiWFm09tcKT2WDx
 P8M7sbJdEpP3PGOOEz7qFmmOEjt8mn0TN2Qgd7DBYfRO+WlOc52QqnPyEkWoAuWpSYdq
 3AK/PHGJoj0iwATFoTEFKpVK61TqmUI9Ut1+VstzK6vKbjgBLVRY25e+DzIoAOxaGmOL
 mWIrsQx/ifsXTdzWP6hVkjSoTV1/7H+fBuGzdIRuC0/Rg5udQo0ALdpVuSqptmyzfFAw
 AGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LrRSnsLzb6+9xeAkjXaq3no/0Ryp2TTboE6zMVigLI8=;
 b=MzvI4R1P4rH+YL314/6JFqSRIhZ7rkpx1sFdGR065V0BUvcNVR+/84ItHnmx/pRhKO
 fy7pUWIBSoZ6folH2DaJDs2FDV4lqD2bSKqOF5P1RmTn+1EpIifvvPdUWjEjpqs7PX1c
 Oi6osQzQK+wLnzV03fs7ACm7KM7Az5LnJlIcIZPExSjXmLi30Szf0NUUXTEv+l30sQa+
 oDRhCE6qTlnZkRfZPM7X8n53LMkOhNR6i/o96Lt9VcgM3purx5Ul7p/6Qu/EO4hE9kBv
 D8u2oW2LgOhYiF8xL2ZjRy07HfkDbOpGhc4z+0h73SKPWfnBT7Y+XwBnt2GWNNDositB
 dlTQ==
X-Gm-Message-State: AOAM532kuTFEbduR+WpuKICZVlUdRTH5f+fC3BCaQBZ6E07099yYSagW
 G27jGANBiSXRBXqLjxc16IwlrNuKQAm+CA==
X-Google-Smtp-Source: ABdhPJxZmrAsY2F2zaX4SZPZj+agu3NGAACaAZAuf0d6TRgkVSwAxbeVlW3q5WpeElDqNE40VeaPXA==
X-Received: by 2002:a62:2c51:0:b029:329:932b:9484 with SMTP id
 s78-20020a622c510000b0290329932b9484mr1933476pfs.13.1631578709498; 
 Mon, 13 Sep 2021 17:18:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id hi12sm2638909pjb.48.2021.09.13.17.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:18:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/44] tcg/arm: More use of the TCGReg enum
Date: Mon, 13 Sep 2021 17:14:56 -0700
Message-Id: <20210914001456.793490-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 tcg/arm/tcg-target.c.inc | 65 +++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index cf0627448b..d25e68b36b 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -559,7 +559,7 @@ static void tcg_out_bl_imm(TCGContext *s, ARMCond cond, int32_t offset)
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_blx_reg(TCGContext *s, ARMCond cond, int rn)
+static void tcg_out_blx_reg(TCGContext *s, ARMCond cond, TCGReg rn)
 {
     tcg_out32(s, (cond << 28) | 0x012fff30 | rn);
 }
@@ -570,14 +570,14 @@ static void tcg_out_blx_imm(TCGContext *s, int32_t offset)
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
@@ -604,7 +604,7 @@ static void tcg_out_b_reg(TCGContext *s, ARMCond cond, TCGReg rn)
 }
 
 static void tcg_out_dat_imm(TCGContext *s, ARMCond cond, ARMInsn opc,
-                            int rd, int rn, int im)
+                            TCGReg rd, TCGReg rn, int im)
 {
     tcg_out32(s, (cond << 28) | (1 << 25) | opc |
                     (rn << 16) | (rd << 12) | im);
@@ -788,13 +788,15 @@ static void tcg_out_ld8s_r(TCGContext *s, ARMCond cond, TCGReg rt,
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
@@ -873,8 +875,8 @@ static void tcg_out_movi32(TCGContext *s, ARMCond cond, int rd, uint32_t arg)
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
@@ -904,7 +906,7 @@ static void tcg_out_dat_rIK(TCGContext *s, ARMCond cond, ARMInsn opc,
 }
 
 static void tcg_out_dat_rIN(TCGContext *s, ARMCond cond, ARMInsn opc,
-                            ARMInsn opneg, TCGArg dst, TCGArg lhs, TCGArg rhs,
+                            ARMInsn opneg, TCGReg dst, TCGReg lhs, TCGArg rhs,
                             bool rhs_is_const)
 {
     /* Emit either the reg,imm or reg,reg form of a data-processing insn.
@@ -978,17 +980,19 @@ static void tcg_out_smull32(TCGContext *s, ARMCond cond, TCGReg rd0,
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
@@ -1002,12 +1006,12 @@ static void tcg_out_ext8s(TCGContext *s, ARMCond cond, int rd, int rn)
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
@@ -1020,7 +1024,7 @@ static void tcg_out_ext16s(TCGContext *s, ARMCond cond, int rd, int rn)
     }
 }
 
-static void tcg_out_ext16u(TCGContext *s, ARMCond cond, int rd, int rn)
+static void tcg_out_ext16u(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
     if (use_armv6_instructions) {
         /* uxth */
@@ -1033,7 +1037,8 @@ static void tcg_out_ext16u(TCGContext *s, ARMCond cond, int rd, int rn)
     }
 }
 
-static void tcg_out_bswap16(TCGContext *s, ARMCond cond, int rd, int rn, int flags)
+static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
+                            TCGReg rd, TCGReg rn, int flags)
 {
     if (use_armv6_instructions) {
         if (flags & TCG_BSWAP_OS) {
@@ -1100,7 +1105,7 @@ static void tcg_out_bswap16(TCGContext *s, ARMCond cond, int rd, int rn, int fla
                      ? SHIFT_IMM_ASR(8) : SHIFT_IMM_LSR(8)));
 }
 
-static void tcg_out_bswap32(TCGContext *s, ARMCond cond, int rd, int rn)
+static void tcg_out_bswap32(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
     if (use_armv6_instructions) {
         /* rev */
@@ -1130,23 +1135,23 @@ static void tcg_out_deposit(TCGContext *s, ARMCond cond, TCGReg rd,
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
@@ -1156,7 +1161,7 @@ static void tcg_out_ld32u(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_st32(TCGContext *s, ARMCond cond,
-                         int rd, int rn, int32_t offset)
+                         TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1166,7 +1171,7 @@ static void tcg_out_st32(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_ld16u(TCGContext *s, ARMCond cond,
-                          int rd, int rn, int32_t offset)
+                          TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1176,7 +1181,7 @@ static void tcg_out_ld16u(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_ld16s(TCGContext *s, ARMCond cond,
-                          int rd, int rn, int32_t offset)
+                          TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1186,7 +1191,7 @@ static void tcg_out_ld16s(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_st16(TCGContext *s, ARMCond cond,
-                         int rd, int rn, int32_t offset)
+                         TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1196,7 +1201,7 @@ static void tcg_out_st16(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_ld8u(TCGContext *s, ARMCond cond,
-                         int rd, int rn, int32_t offset)
+                         TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1206,7 +1211,7 @@ static void tcg_out_ld8u(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_ld8s(TCGContext *s, ARMCond cond,
-                         int rd, int rn, int32_t offset)
+                         TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
@@ -1216,7 +1221,7 @@ static void tcg_out_ld8s(TCGContext *s, ARMCond cond,
 }
 
 static void tcg_out_st8(TCGContext *s, ARMCond cond,
-                        int rd, int rn, int32_t offset)
+                        TCGReg rd, TCGReg rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
         tcg_out_movi32(s, cond, TCG_REG_TMP, offset);
-- 
2.25.1


