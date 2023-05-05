Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830D6F8B01
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:29:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vC-0000cX-CK; Fri, 05 May 2023 17:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v9-0000bV-4I
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:55 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v7-0004Nx-AB
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f315712406so113476895e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321892; x=1685913892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QbWtBg5qzToLARYA6QIUcOajHeUi5qAypv5e+z+/edQ=;
 b=Iy5LVwcklcSsIuu1Cf+FVeUtx+/3bbpCVZuygLWWcD52ykgL34sfhakiOPsrKpcjmh
 Ji1v9JSvXvlo9UwHDxSz6jf6mNzjqnn6dBH+CqXZaxW11tlXmBm0ghjfdlDlsChJflTF
 vAEwtkyeG93/jKq6NqVddLXWSgoe1Cq8gSwW2IMcxJEOiAmsi/HQo+NLAEuFmncVZvkH
 dbSOjzl9S7Zew6+5Dj9E1X+efZO+RyY3xstjJnetkwY7qmlk3g/MMvnSiSB1XSHf5ebj
 2xd/uz3YZ/v90RQ1O9sGbzbz3doZ60gRCyAWAbnEY4H55V2cCs8xG/i9bbqFNw192Yrm
 QSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321892; x=1685913892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QbWtBg5qzToLARYA6QIUcOajHeUi5qAypv5e+z+/edQ=;
 b=Gc/8MxL/8YJ++X40qOYcyiZjfaUNuDY/llHYwvZ+mBfRX+PGPWu333MOeRJO85jhq9
 y3OBDtYp1t0tG03xEmi9LRYW4TsBPd6D9UX3cyk3J54ph9EWxplzULLBd5Fal+tEAtO2
 WqzoholEQcyilkXpWmU7xzjYg3kiM7jcCPVtoSROv1BfVEyK+Qal9pudxRVIFuGbs6TR
 E0jmAO+HeQN08tFfDxv+mS5282xC3QZF46EAbJttHb/MCRyee/0fAWTian1+vJcdwczG
 6TxFPm/XQYYnLJ91Lg3SB/5XVb/+Iw9TZqzCNOPaji/N5Ww4fuo93LyiuEC0orJvpRDO
 DGag==
X-Gm-Message-State: AC+VfDzbAamnlV90aWlBcuVZOQsLt5iMKijg2tSz6BB56qTUQjVby5ie
 HA8cGZps8SW+VqQLZDoeIfhv/imLZm435wk1d+7kRw==
X-Google-Smtp-Source: ACHHUZ6Jqjdck3QZLNl6ckB6X2H5q17c4Waw2hP0KC3qncAiOyamPE6/b38AI0GZrDrSQ0Ck5z3Lwg==
X-Received: by 2002:a05:600c:b41:b0:3f1:94e2:e5bc with SMTP id
 k1-20020a05600c0b4100b003f194e2e5bcmr2038017wmr.11.1683321891705; 
 Fri, 05 May 2023 14:24:51 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>
Subject: [PULL 05/42] target/m68k: Finish conversion to tcg_gen_qemu_{ld, st}_*
Date: Fri,  5 May 2023 22:24:10 +0100
Message-Id: <20230505212447.374546-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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

Convert away from the old interface with the implicit
MemOp argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20230502135741.1158035-5-richard.henderson@linaro.org>
---
 target/m68k/translate.c | 76 ++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 51 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 422f4652f1..744eb3748b 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -304,23 +304,14 @@ static inline void gen_addr_fault(DisasContext *s)
 static inline TCGv gen_load(DisasContext *s, int opsize, TCGv addr,
                             int sign, int index)
 {
-    TCGv tmp;
-    tmp = tcg_temp_new_i32();
-    switch(opsize) {
+    TCGv tmp = tcg_temp_new_i32();
+
+    switch (opsize) {
     case OS_BYTE:
-        if (sign)
-            tcg_gen_qemu_ld8s(tmp, addr, index);
-        else
-            tcg_gen_qemu_ld8u(tmp, addr, index);
-        break;
     case OS_WORD:
-        if (sign)
-            tcg_gen_qemu_ld16s(tmp, addr, index);
-        else
-            tcg_gen_qemu_ld16u(tmp, addr, index);
-        break;
     case OS_LONG:
-        tcg_gen_qemu_ld32u(tmp, addr, index);
+        tcg_gen_qemu_ld_tl(tmp, addr, index,
+                           opsize | (sign ? MO_SIGN : 0) | MO_TE);
         break;
     default:
         g_assert_not_reached();
@@ -332,15 +323,11 @@ static inline TCGv gen_load(DisasContext *s, int opsize, TCGv addr,
 static inline void gen_store(DisasContext *s, int opsize, TCGv addr, TCGv val,
                              int index)
 {
-    switch(opsize) {
+    switch (opsize) {
     case OS_BYTE:
-        tcg_gen_qemu_st8(val, addr, index);
-        break;
     case OS_WORD:
-        tcg_gen_qemu_st16(val, addr, index);
-        break;
     case OS_LONG:
-        tcg_gen_qemu_st32(val, addr, index);
+        tcg_gen_qemu_st_tl(val, addr, index, opsize | MO_TE);
         break;
     default:
         g_assert_not_reached();
@@ -971,23 +958,16 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
     tmp = tcg_temp_new();
     switch (opsize) {
     case OS_BYTE:
-        tcg_gen_qemu_ld8s(tmp, addr, index);
-        gen_helper_exts32(cpu_env, fp, tmp);
-        break;
     case OS_WORD:
-        tcg_gen_qemu_ld16s(tmp, addr, index);
-        gen_helper_exts32(cpu_env, fp, tmp);
-        break;
-    case OS_LONG:
-        tcg_gen_qemu_ld32u(tmp, addr, index);
+        tcg_gen_qemu_ld_tl(tmp, addr, index, opsize | MO_SIGN | MO_TE);
         gen_helper_exts32(cpu_env, fp, tmp);
         break;
     case OS_SINGLE:
-        tcg_gen_qemu_ld32u(tmp, addr, index);
+        tcg_gen_qemu_ld_tl(tmp, addr, index, MO_TEUL);
         gen_helper_extf32(cpu_env, fp, tmp);
         break;
     case OS_DOUBLE:
-        tcg_gen_qemu_ld64(t64, addr, index);
+        tcg_gen_qemu_ld_i64(t64, addr, index, MO_TEUQ);
         gen_helper_extf64(cpu_env, fp, t64);
         break;
     case OS_EXTENDED:
@@ -995,11 +975,11 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
             gen_exception(s, s->base.pc_next, EXCP_FP_UNIMP);
             break;
         }
-        tcg_gen_qemu_ld32u(tmp, addr, index);
+        tcg_gen_qemu_ld_i32(tmp, addr, index, MO_TEUL);
         tcg_gen_shri_i32(tmp, tmp, 16);
         tcg_gen_st16_i32(tmp, fp, offsetof(FPReg, l.upper));
         tcg_gen_addi_i32(tmp, addr, 4);
-        tcg_gen_qemu_ld64(t64, tmp, index);
+        tcg_gen_qemu_ld_i64(t64, tmp, index, MO_TEUQ);
         tcg_gen_st_i64(t64, fp, offsetof(FPReg, l.lower));
         break;
     case OS_PACKED:
@@ -1024,24 +1004,18 @@ static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
     tmp = tcg_temp_new();
     switch (opsize) {
     case OS_BYTE:
-        gen_helper_reds32(tmp, cpu_env, fp);
-        tcg_gen_qemu_st8(tmp, addr, index);
-        break;
     case OS_WORD:
-        gen_helper_reds32(tmp, cpu_env, fp);
-        tcg_gen_qemu_st16(tmp, addr, index);
-        break;
     case OS_LONG:
         gen_helper_reds32(tmp, cpu_env, fp);
-        tcg_gen_qemu_st32(tmp, addr, index);
+        tcg_gen_qemu_st_tl(tmp, addr, index, opsize | MO_TE);
         break;
     case OS_SINGLE:
         gen_helper_redf32(tmp, cpu_env, fp);
-        tcg_gen_qemu_st32(tmp, addr, index);
+        tcg_gen_qemu_st_tl(tmp, addr, index, MO_TEUL);
         break;
     case OS_DOUBLE:
         gen_helper_redf64(t64, cpu_env, fp);
-        tcg_gen_qemu_st64(t64, addr, index);
+        tcg_gen_qemu_st_i64(t64, addr, index, MO_TEUQ);
         break;
     case OS_EXTENDED:
         if (m68k_feature(s->env, M68K_FEATURE_CF_FPU)) {
@@ -1050,10 +1024,10 @@ static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
         }
         tcg_gen_ld16u_i32(tmp, fp, offsetof(FPReg, l.upper));
         tcg_gen_shli_i32(tmp, tmp, 16);
-        tcg_gen_qemu_st32(tmp, addr, index);
+        tcg_gen_qemu_st_i32(tmp, addr, index, MO_TEUL);
         tcg_gen_addi_i32(tmp, addr, 4);
         tcg_gen_ld_i64(t64, fp, offsetof(FPReg, l.lower));
-        tcg_gen_qemu_st64(t64, tmp, index);
+        tcg_gen_qemu_st_i64(t64, tmp, index, MO_TEUQ);
         break;
     case OS_PACKED:
         /*
@@ -2079,14 +2053,14 @@ DISAS_INSN(movep)
     if (insn & 0x80) {
         for ( ; i > 0 ; i--) {
             tcg_gen_shri_i32(dbuf, reg, (i - 1) * 8);
-            tcg_gen_qemu_st8(dbuf, abuf, IS_USER(s));
+            tcg_gen_qemu_st_i32(dbuf, abuf, IS_USER(s), MO_UB);
             if (i > 1) {
                 tcg_gen_addi_i32(abuf, abuf, 2);
             }
         }
     } else {
         for ( ; i > 0 ; i--) {
-            tcg_gen_qemu_ld8u(dbuf, abuf, IS_USER(s));
+            tcg_gen_qemu_ld_tl(dbuf, abuf, IS_USER(s), MO_UB);
             tcg_gen_deposit_i32(reg, reg, dbuf, (i - 1) * 8, 8);
             if (i > 1) {
                 tcg_gen_addi_i32(abuf, abuf, 2);
@@ -4337,14 +4311,14 @@ static void m68k_copy_line(TCGv dst, TCGv src, int index)
     t1 = tcg_temp_new_i64();
 
     tcg_gen_andi_i32(addr, src, ~15);
-    tcg_gen_qemu_ld64(t0, addr, index);
+    tcg_gen_qemu_ld_i64(t0, addr, index, MO_TEUQ);
     tcg_gen_addi_i32(addr, addr, 8);
-    tcg_gen_qemu_ld64(t1, addr, index);
+    tcg_gen_qemu_ld_i64(t1, addr, index, MO_TEUQ);
 
     tcg_gen_andi_i32(addr, dst, ~15);
-    tcg_gen_qemu_st64(t0, addr, index);
+    tcg_gen_qemu_st_i64(t0, addr, index, MO_TEUQ);
     tcg_gen_addi_i32(addr, addr, 8);
-    tcg_gen_qemu_st64(t1, addr, index);
+    tcg_gen_qemu_st_i64(t1, addr, index, MO_TEUQ);
 }
 
 DISAS_INSN(move16_reg)
@@ -4767,7 +4741,7 @@ static void gen_qemu_store_fcr(DisasContext *s, TCGv addr, int reg)
 
     tmp = tcg_temp_new();
     gen_load_fcr(s, tmp, reg);
-    tcg_gen_qemu_st32(tmp, addr, index);
+    tcg_gen_qemu_st_tl(tmp, addr, index, MO_TEUL);
 }
 
 static void gen_qemu_load_fcr(DisasContext *s, TCGv addr, int reg)
@@ -4776,7 +4750,7 @@ static void gen_qemu_load_fcr(DisasContext *s, TCGv addr, int reg)
     TCGv tmp;
 
     tmp = tcg_temp_new();
-    tcg_gen_qemu_ld32u(tmp, addr, index);
+    tcg_gen_qemu_ld_tl(tmp, addr, index, MO_TEUL);
     gen_store_fcr(s, tmp, reg);
 }
 
-- 
2.34.1


