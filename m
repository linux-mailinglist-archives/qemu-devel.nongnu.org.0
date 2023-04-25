Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837FB6EE894
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:49:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prORx-0005fY-EO; Tue, 25 Apr 2023 15:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORB-0004L3-RI
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:54 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR7-0004oo-7F
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:53 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8b766322bso59742321fa.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451288; x=1685043288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=szr01PFwF0Du6v147zPw0I7dg80IAC207oSuL39I73s=;
 b=VrveoN/r5Dd+JVtZDqk6fcDBrrHz2MEgYqjQeBrvr0TMPgHJQ3xbxUn9nK325NtnEL
 sMi5fIEmxHPFxU8Y6vnUSfBSbp6T00jw40hm7PkkpYrMjI/Z2/SdrmjTYhUpBHiRpyGq
 iyPSazOiwVayn74u11iA/oT5Mi53XXYlKPlm7br5MTaTU/Jmg3yifpw1xclaCU2S9hOy
 8Ac70MqaRQhTzrsqmg8JjE5K0d2dARJvJSACJw8TdUo2Kd9MaFVLimhuOjirQrAMGQfZ
 K5jl8037TdBF4+ehhy6m5rx34qgLTrPxi1lgMdMOw1G6s+13nvcOEp/sQdvdnr6cwLgm
 fEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451288; x=1685043288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szr01PFwF0Du6v147zPw0I7dg80IAC207oSuL39I73s=;
 b=iofj50FpiHrmGQragFXgpapaMDh0Q9HhUyA8LhfJEFbnegXPlSpjihZsy8l1HM+tLe
 qsy8vUoY2CSWpL8H2a1fIxBtn39Fkl+ZGiXGXu40UlIwfc3UjqGqVNOhaHk8TwsVv22r
 6EGFlefewCGdnjykXoDXM+IybGANxokC7XpYnwW6WpHIjOlIwHOc1PVLszvfcX9GncXh
 a0g58nHl9GTpMwytI6JmdSkxP1qcw8AlXCeCxVwwS65SK555BtXsxsjsKwXV4jqcFBNn
 dUSTCnO3W2Ba5rYpnnup8Uaw8maXiNxmxonyeE8Al8RQ04Nj+i5rSrejabIAaQcN2kE8
 NV6A==
X-Gm-Message-State: AAQBX9fKSuz7I5DJJx1lXIdrAmAPGRCanFaTuBp36CIgW6zrH0X1S9Rp
 ZQgnLSW2kIP7asst7f4CeLkoswK44i8eksEl7Lk2FQ==
X-Google-Smtp-Source: AKy350YoAXIYRS5wBegBjiwdh5nUwaF5nXwdGihVuEdD6JEog256oa/A9Izbb2E0TfgOG0oaOx3PFg==
X-Received: by 2002:a2e:90d5:0:b0:2a8:b168:981f with SMTP id
 o21-20020a2e90d5000000b002a8b168981fmr3545705ljg.46.1682451288322; 
 Tue, 25 Apr 2023 12:34:48 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 31/57] tcg/sparc64: Rename tcg_out_movi_imm13 to
 tcg_out_movi_s13
Date: Tue, 25 Apr 2023 20:31:20 +0100
Message-Id: <20230425193146.2106111-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x229.google.com
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


