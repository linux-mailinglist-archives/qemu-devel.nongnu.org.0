Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B1F6F5216
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:44:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bW-0002Y7-CR; Wed, 03 May 2023 03:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ah-00084r-WD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:56 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aA-0005oM-I5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso47410075e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097641; x=1685689641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=szr01PFwF0Du6v147zPw0I7dg80IAC207oSuL39I73s=;
 b=mrSB/5y1gBwi0UIp8PrPLvghQTx6w5zJLLgOePo8wTbZ1WRYFubxlOtpEDTVtVhmul
 iX3WCp25m22sQQr8tF1qa82JcQYFD9WxxQoNU/nCJVh+XlCxlcUrAwZqdUq6YpIT/juX
 lFTckq3uijIvl4/vgJfz0uWYkijm6UYISuPp2AbaAh+MFV5zBAtijHDjKTnXSIHMaPg6
 Fv6Vc+meBXhbq1uuPQoREZVzTW/GSAsbVoLrkdmoK7tamgNFwGUlET5+rxeuOVvj9dyy
 B4WWXv0I0UiNMUHoaphJInT579ZQ8FT5BP4uO180pyXWfWuJVPLp1Ys/JOQpp878bNyz
 KXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097641; x=1685689641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szr01PFwF0Du6v147zPw0I7dg80IAC207oSuL39I73s=;
 b=Aj6/AZt9lsXuDq6EAvbWubacyzSQpKF3jo+KJ76DgFjp7NmEh01Fc/lC1HZpY69eOh
 +9hoQ9Gr+W72tseuoHYtKpjngcm49T8mvOAGCE3t2+oBx5cEoyxqOEHiCsKD6xJAt072
 3hy6XdNh6jbu9k/wxh07Gupmk1C/YKUk0IqfX5xutadZlF0ZDPDFTxBvPzuVvtbKGN51
 lTpCQB4fCgHZ1G8MrbLorjbxHfqRF+cQmHGp8oAmWa+nu08gzfzWksbdd/V0j4AJ9k7Q
 iDpuIebHzar8ZrO0rl0SZxWqSbGKUyjP+6z5ptsi2tZJ2IMSQtChAhDHqORE2inPj5c2
 GpHw==
X-Gm-Message-State: AC+VfDyLqKhPeYGV/EclJmT6UaetVi2FeClUBkcciFkeP1GxZhTuRfhn
 urlM/B/UPPCXVOWozsgq6NG44rkO1DQyQ4FFOJrnCw==
X-Google-Smtp-Source: ACHHUZ72eCmSUfYfWK0ZSm4hmzm8bMslvyyJsT44jSxh5SQBDEKCb3hAmd+FSz0xHdD1u/I6JnDR9Q==
X-Received: by 2002:a05:600c:21c8:b0:3f1:745d:821 with SMTP id
 x8-20020a05600c21c800b003f1745d0821mr13747059wmj.23.1683097640815; 
 Wed, 03 May 2023 00:07:20 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 31/57] tcg/sparc64: Rename tcg_out_movi_imm13 to
 tcg_out_movi_s13
Date: Wed,  3 May 2023 08:06:30 +0100
Message-Id: <20230503070656.1746170-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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

Emphasize that the constant is signed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 64464ab363..2e6127d506 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -399,7 +399,7 @@ static void tcg_out_sethi(TCGContext *s, TCGReg ret, uint32_t arg)
     tcg_out32(s, SETHI | INSN_RD(ret) | ((arg & 0xfffffc00) >> 10));
 }
 
-static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
+static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
 {
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
@@ -408,7 +408,7 @@ static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
 {
     if (check_fit_i32(arg, 13)) {
         /* A 13-bit constant sign-extended to 64-bits.  */
-        tcg_out_movi_imm13(s, ret, arg);
+        tcg_out_movi_s13(s, ret, arg);
     } else {
         /* A 32-bit constant zero-extended to 64 bits.  */
         tcg_out_sethi(s, ret, arg);
@@ -425,15 +425,15 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
 
-    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
-    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
-        tcg_out_movi_imm32(s, ret, arg);
+    /* A 13-bit constant sign-extended to 64-bits.  */
+    if (check_fit_tl(arg, 13)) {
+        tcg_out_movi_s13(s, ret, arg);
         return;
     }
 
-    /* A 13-bit constant sign-extended to 64-bits.  */
-    if (check_fit_tl(arg, 13)) {
-        tcg_out_movi_imm13(s, ret, arg);
+    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
+    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
+        tcg_out_movi_imm32(s, ret, arg);
         return;
     }
 
@@ -767,7 +767,7 @@ static void tcg_out_setcond_i32(TCGContext *s, TCGCond cond, TCGReg ret,
 
     default:
         tcg_out_cmp(s, c1, c2, c2const);
-        tcg_out_movi_imm13(s, ret, 0);
+        tcg_out_movi_s13(s, ret, 0);
         tcg_out_movcc(s, cond, MOVCC_ICC, ret, 1, 1);
         return;
     }
@@ -803,11 +803,11 @@ static void tcg_out_setcond_i64(TCGContext *s, TCGCond cond, TCGReg ret,
     /* For 64-bit signed comparisons vs zero, we can avoid the compare
        if the input does not overlap the output.  */
     if (c2 == 0 && !is_unsigned_cond(cond) && c1 != ret) {
-        tcg_out_movi_imm13(s, ret, 0);
+        tcg_out_movi_s13(s, ret, 0);
         tcg_out_movr(s, cond, ret, c1, 1, 1);
     } else {
         tcg_out_cmp(s, c1, c2, c2const);
-        tcg_out_movi_imm13(s, ret, 0);
+        tcg_out_movi_s13(s, ret, 0);
         tcg_out_movcc(s, cond, MOVCC_XCC, ret, 1, 1);
     }
 }
@@ -844,7 +844,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
     if (use_vis3_instructions && !is_sub) {
         /* Note that ADDXC doesn't accept immediates.  */
         if (bhconst && bh != 0) {
-           tcg_out_movi_imm13(s, TCG_REG_T2, bh);
+           tcg_out_movi_s13(s, TCG_REG_T2, bh);
            bh = TCG_REG_T2;
         }
         tcg_out_arith(s, rh, ah, bh, ARITH_ADDXC);
@@ -866,7 +866,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
          * so the adjustment fits 12 bits.
          */
         if (bhconst) {
-            tcg_out_movi_imm13(s, TCG_REG_T2, bh + (is_sub ? -1 : 1));
+            tcg_out_movi_s13(s, TCG_REG_T2, bh + (is_sub ? -1 : 1));
         } else {
             tcg_out_arithi(s, TCG_REG_T2, bh, 1,
                            is_sub ? ARITH_SUB : ARITH_ADD);
@@ -1036,7 +1036,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
     /* delay slot */
-    tcg_out_movi_imm13(s, TCG_REG_O0, 0);
+    tcg_out_movi_s13(s, TCG_REG_O0, 0);
 
     build_trampolines(s);
 }
@@ -1430,7 +1430,7 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 {
     if (check_fit_ptr(a0, 13)) {
         tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
-        tcg_out_movi_imm13(s, TCG_REG_O0, a0);
+        tcg_out_movi_s13(s, TCG_REG_O0, a0);
         return;
     } else {
         intptr_t tb_diff = tcg_tbrel_diff(s, (void *)a0);
-- 
2.34.1


