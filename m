Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8751703005
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:36:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZJ7-0002OO-Eh; Mon, 15 May 2023 10:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHh-00079j-1S
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHZ-00050I-Lj
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:42 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1aad5245571so88102875ad.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161216; x=1686753216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/oWD1U747odSVFFBC9M3Sdo3AJc8ITxvfJIeQOUz74=;
 b=Eln7J/z7uhECyw02TtVZ7H6I39wO9KqkRVEtDU5gCVV/3jjVDt8rrjLSSBPRF/MH4k
 yDZvUvHVdrve854lhDDkvbgkwOQ/Nr5cc6K9dk+3rrmJbHsk41Eea00a2kUU3EAdgp2K
 BYXiOaecJOEyeaX6/qTPVl9MWzT6d7jFwBxpYGxnPMKoUPykASrr5Emqe0u0ySNXkog8
 EJOLSVE7hT5/9UJt4IKn+W1yQas2XbSq8V2rJ5hsEVYSlfoJILKN3Lx7LLZJVTUR+ZOy
 dyu+soMKykN/vncGPGkVfI+T9uxvsAbOOVZ71BVznP7922gztE615Yf5VZOfYgkn//x8
 O4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161216; x=1686753216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/oWD1U747odSVFFBC9M3Sdo3AJc8ITxvfJIeQOUz74=;
 b=PkSmTNnQ7T6jFwd7D9LYlck9djsYNws2sw/KNwPr/NdXtS6lV5GbRNJhzTZxTqccpw
 A6JpbMhP8ntD35QCfiLvnFDBkoo9YgNXQvZXBOfpBl/b1S3LL2TIWz2VhymB/uuBcwRU
 iIFbGQhbFgoEkZ6vbgmYuvxaFvs2s7k4xwbHLqjdv3ze9tYgPUtxHjdyP1EQysapKuTJ
 zM+0uUNZuicWbRvXbxQkDcXowZp0/FISHMCRZDQ4Hkv1A6J8Khb2qLnaI9GzKQAR1/ql
 5xrZ+sbbtYOB98upij4K5DOLx2Do6sr46RU5emfsSW7/tkhOSr6xqZbz4vjY0NesDbWB
 rSRQ==
X-Gm-Message-State: AC+VfDwSfDQyvH5pQu0iL9TcNGdQHt1CUPNp9attA8Pbh9+JKUW3HI/V
 /YdR8yWHGUOLEMOIfOX94AaxjvmEHf3DzSHINys=
X-Google-Smtp-Source: ACHHUZ61slTatG3uMiOQJSI+6AjB+KpUAk68IZ1uYGAduBZN7mBMol9cZD3ofXEr4DcWy1ReRMw5Mw==
X-Received: by 2002:a17:903:22cd:b0:1aa:ee36:4095 with SMTP id
 y13-20020a17090322cd00b001aaee364095mr43063462plg.43.1684161216423; 
 Mon, 15 May 2023 07:33:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 25/54] tcg/sparc64: Rename tcg_out_movi_imm13 to
 tcg_out_movi_s13
Date: Mon, 15 May 2023 07:32:44 -0700
Message-Id: <20230515143313.734053-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
 tcg/sparc64/tcg-target.c.inc | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 64464ab363..15d6a9fd73 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -399,7 +399,8 @@ static void tcg_out_sethi(TCGContext *s, TCGReg ret, uint32_t arg)
     tcg_out32(s, SETHI | INSN_RD(ret) | ((arg & 0xfffffc00) >> 10));
 }
 
-static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
+/* A 13-bit constant sign-extended to 64 bits.  */
+static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
 {
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
@@ -408,7 +409,7 @@ static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
 {
     if (check_fit_i32(arg, 13)) {
         /* A 13-bit constant sign-extended to 64-bits.  */
-        tcg_out_movi_imm13(s, ret, arg);
+        tcg_out_movi_s13(s, ret, arg);
     } else {
         /* A 32-bit constant zero-extended to 64 bits.  */
         tcg_out_sethi(s, ret, arg);
@@ -433,7 +434,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 13-bit constant sign-extended to 64-bits.  */
     if (check_fit_tl(arg, 13)) {
-        tcg_out_movi_imm13(s, ret, arg);
+        tcg_out_movi_s13(s, ret, arg);
         return;
     }
 
@@ -767,7 +768,7 @@ static void tcg_out_setcond_i32(TCGContext *s, TCGCond cond, TCGReg ret,
 
     default:
         tcg_out_cmp(s, c1, c2, c2const);
-        tcg_out_movi_imm13(s, ret, 0);
+        tcg_out_movi_s13(s, ret, 0);
         tcg_out_movcc(s, cond, MOVCC_ICC, ret, 1, 1);
         return;
     }
@@ -803,11 +804,11 @@ static void tcg_out_setcond_i64(TCGContext *s, TCGCond cond, TCGReg ret,
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
@@ -844,7 +845,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
     if (use_vis3_instructions && !is_sub) {
         /* Note that ADDXC doesn't accept immediates.  */
         if (bhconst && bh != 0) {
-           tcg_out_movi_imm13(s, TCG_REG_T2, bh);
+           tcg_out_movi_s13(s, TCG_REG_T2, bh);
            bh = TCG_REG_T2;
         }
         tcg_out_arith(s, rh, ah, bh, ARITH_ADDXC);
@@ -866,7 +867,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
          * so the adjustment fits 12 bits.
          */
         if (bhconst) {
-            tcg_out_movi_imm13(s, TCG_REG_T2, bh + (is_sub ? -1 : 1));
+            tcg_out_movi_s13(s, TCG_REG_T2, bh + (is_sub ? -1 : 1));
         } else {
             tcg_out_arithi(s, TCG_REG_T2, bh, 1,
                            is_sub ? ARITH_SUB : ARITH_ADD);
@@ -1036,7 +1037,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
     /* delay slot */
-    tcg_out_movi_imm13(s, TCG_REG_O0, 0);
+    tcg_out_movi_s13(s, TCG_REG_O0, 0);
 
     build_trampolines(s);
 }
@@ -1430,7 +1431,7 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
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


