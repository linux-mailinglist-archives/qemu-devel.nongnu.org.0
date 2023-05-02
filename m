Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B30C6F45AB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:59:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqVy-0001Ag-5u; Tue, 02 May 2023 09:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVr-00019F-Rp
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:51 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVo-0003Th-QC
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso23322955e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 06:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683035866; x=1685627866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ow0FT59TIvoopaMJjr8/iTqodJP1/Fz1qr4GkkgKLPM=;
 b=mZ5uFu8wcOzNaFpvE96SwPSPgkpj5z4eVtwiFBPM85P79zMUoXUpdAG5foHB6mnXej
 WrW+eSbmCyl2lDDE6kmshdLOVxi73Vf7V88pTdgrGJjEU+zBE5NG+JOttfeCkrXfQMBB
 BK0vOZ+YEQaVwNK7osB/Fc+e8hHp/IiYY8NRnEQhYTO7rHJTVEMqFQUjFVU+1XO1XYl/
 dv+CwhHm9/iZ6P1ddp7RhzhiAtTStzlNMQWS6HaAR7TMNhDrHEzp0mvLlqpti+EKaWdJ
 GzGYbCNz08Rux6t7s/DEVnZ7wvfeCUcYHRGyVGRDXH68aYStn2a09A1ILMaTlHzWdTiI
 Jwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683035866; x=1685627866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ow0FT59TIvoopaMJjr8/iTqodJP1/Fz1qr4GkkgKLPM=;
 b=Bw7BwOzaq+Q64togOKQgeZIrQwoSzyd+BgcB2o2W7E0cMKMu/XH0+TTxkcCKspAlOo
 OiCKLe+Zc0LIT3uSFPWX2UTZfFseQPKkADv0lzwcdtuQSOQOsuRwnZebIkeTw/nlDHQG
 +LGLPWgP5QVj1dty00+Ig5/fP3hjbnGinP2ykEHzcOP5LgUi49M3SJUIMfmfWNN1LVCu
 36AkHhYnGJpknpcBQd7E62XbG1ZzJjCzAa3m2wWosZW9wKaf4GPGoha/cgB9vYJBmmge
 W9TU2uQLh+jItv0yZ3D61q+qZoR1OPfuBEvHLiuj12/QTuIdV7ho0af1rsp2uTGMdFH7
 PIsA==
X-Gm-Message-State: AC+VfDx7Ubg0h4iUKrrw+cqEKBwnW6HAEIEPlXQEDQW8bu3nrCz9XGS6
 //YhsmxOTKNIyYrkEF93QG9YW4mx/4ToYlpdHIF2wQ==
X-Google-Smtp-Source: ACHHUZ5l5+SpB+KJrVj0HiliN7qwu29TiDAi449xmL5jz0l2muktfAN3hqaDu716piqDqYzQ9X+/dQ==
X-Received: by 2002:a1c:6a17:0:b0:3f1:7c38:719b with SMTP id
 f23-20020a1c6a17000000b003f17c38719bmr13452679wmc.3.1683035866636; 
 Tue, 02 May 2023 06:57:46 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm39461140wms.22.2023.05.02.06.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:57:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 jcmvbkbc@gmail.com
Subject: [PATCH 4/9] target/m68k: Finish conversion to tcg_gen_qemu_{ld,st}_*
Date: Tue,  2 May 2023 14:57:36 +0100
Message-Id: <20230502135741.1158035-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502135741.1158035-1-richard.henderson@linaro.org>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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


