Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723516B2E3F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:11:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaC-000464-EF; Thu, 09 Mar 2023 15:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa9-00042o-Bf
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:45 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa7-0001VQ-JH
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:45 -0500
Received: by mail-pl1-x636.google.com with SMTP id ky4so3237729plb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m4BPaDz1mlddHq4DxejyXXWZHyBspOMqZY/U8nGwNCI=;
 b=aPrVvfXDZd7m50nTYbPN46VujQHFER/3HapEnmmfbcaRk8ImkjtaSitZWCfm0umSqP
 MyaejrbRIIW7Hhkqc1hxa/tbckYc8qqplKRkPVaX5eVY9qK2qjxF6stDfbkgj1/ZeTmu
 EmVNgz9FCZCOk0rLAzGuSp+G4AKv6QUC7yNYEghU7s9s2Gm2wqazgpVAcgMTN/pwoZ4y
 psGyjx5HPkwaZmiBjhMbNrBwnRnwo/CEpCUNHcGQqL0paxQBHI7hyYalxu07VEMdYZi3
 Kki+9wkqm8upZd+B6akw88WCCRXDhBN4IcLS/W9/ciMl5hWZ5dSdpYDy5tPXoiTAwAOt
 8L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m4BPaDz1mlddHq4DxejyXXWZHyBspOMqZY/U8nGwNCI=;
 b=K7IBLnkOnQWGcsZuULXsUeG3o5gd/IHSn86FI5xk1Rbfhbuj6uolmp6duGY9Jk+H5S
 YTFyqu0Qs8i/VbtnS6f0ef4RJegpP9jI8jznFNFLdIaFiTeDY5JfuX4H0FGbZC/lv/BP
 Fy1ecdjBB74i/nY3HsK5I8+z3o2+GBKyElPgURy/HtXVrywdPA2EmZBR+8G6K6bzNulr
 BTUmAG+jFNqBK8gQPFpLkTP39mnBBTNt7PdJ/aH+rKj1prSaGzJs865zVKe+e3uRwz82
 BaedXwi/vg7WYVtUGPyhi5fYa9kH84ikZOhG6FdBrwrgNWni7bu6AAIUil6+XSnqAkZ1
 YckA==
X-Gm-Message-State: AO0yUKXRSXTTUzzMTJBPW4FpKuHlml4Uljk2NKmG72uHb1d26pEdRhfC
 OzeYuQrvLu45qcEaBPyYMdG9c+lv1Si8Omc7kCc=
X-Google-Smtp-Source: AK7set8bgQPc76o1jXjVI9h8uOBvnE+LCxCqQhVGcK9SQGtRVSd2jMPXGvlWNg/c63lt/1eHlG/yOw==
X-Received: by 2002:a17:902:e752:b0:19e:748c:d419 with SMTP id
 p18-20020a170902e75200b0019e748cd419mr27358504plf.46.1678392582823; 
 Thu, 09 Mar 2023 12:09:42 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 57/91] target/rx: Avoid tcg_const_i32
Date: Thu,  9 Mar 2023 12:05:16 -0800
Message-Id: <20230309200550.3878088-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All remaining uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 6b218d5d5e..70fad98e93 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -456,7 +456,7 @@ static bool trans_MOV_ir(DisasContext *ctx, arg_MOV_ir *a)
 static bool trans_MOV_im(DisasContext *ctx, arg_MOV_im *a)
 {
     TCGv imm, mem;
-    imm = tcg_const_i32(a->imm);
+    imm = tcg_constant_i32(a->imm);
     mem = tcg_temp_new();
     tcg_gen_addi_i32(mem, cpu_regs[a->rd], a->dsp << a->sz);
     rx_gen_st(a->sz, imm, mem);
@@ -729,8 +729,8 @@ static inline void stcond(TCGCond cond, int rd, int imm)
 {
     TCGv z;
     TCGv _imm;
-    z = tcg_const_i32(0);
-    _imm = tcg_const_i32(imm);
+    z = tcg_constant_i32(0);
+    _imm = tcg_constant_i32(imm);
     tcg_gen_movcond_i32(cond, cpu_regs[rd], cpu_psw_z, z,
                         _imm, cpu_regs[rd]);
 }
@@ -815,7 +815,7 @@ static inline void rx_gen_op_rrr(op3fn opr, int dst, int src, int src2)
 
 static inline void rx_gen_op_irr(op3fn opr, int dst, int src, uint32_t src2)
 {
-    TCGv imm = tcg_const_i32(src2);
+    TCGv imm = tcg_constant_i32(src2);
     opr(cpu_regs[dst], cpu_regs[src], imm);
 }
 
@@ -1188,7 +1188,7 @@ static bool trans_MUL_rrr(DisasContext *ctx, arg_MUL_rrr *a)
 /* emul #imm, rd */
 static bool trans_EMUL_ir(DisasContext *ctx, arg_EMUL_ir *a)
 {
-    TCGv imm = tcg_const_i32(a->imm);
+    TCGv imm = tcg_constant_i32(a->imm);
     if (a->rd > 14) {
         qemu_log_mask(LOG_GUEST_ERROR, "rd too large %d", a->rd);
     }
@@ -1215,7 +1215,7 @@ static bool trans_EMUL_mr(DisasContext *ctx, arg_EMUL_mr *a)
 /* emulu #imm, rd */
 static bool trans_EMULU_ir(DisasContext *ctx, arg_EMULU_ir *a)
 {
-    TCGv imm = tcg_const_i32(a->imm);
+    TCGv imm = tcg_constant_i32(a->imm);
     if (a->rd > 14) {
         qemu_log_mask(LOG_GUEST_ERROR, "rd too large %d", a->rd);
     }
@@ -1585,7 +1585,7 @@ static bool trans_BRA_l(DisasContext *ctx, arg_BRA_l *a)
 
 static inline void rx_save_pc(DisasContext *ctx)
 {
-    TCGv pc = tcg_const_i32(ctx->base.pc_next);
+    TCGv pc = tcg_constant_i32(ctx->base.pc_next);
     push(pc);
 }
 
@@ -1668,7 +1668,7 @@ static bool trans_SMOVB(DisasContext *ctx, arg_SMOVB *a)
 
 #define STRING(op)                              \
     do {                                        \
-        TCGv size = tcg_const_i32(a->sz);       \
+        TCGv size = tcg_constant_i32(a->sz);    \
         gen_helper_##op(cpu_env, size);         \
     } while (0)
 
@@ -1799,7 +1799,7 @@ static bool trans_MVTACLO(DisasContext *ctx, arg_MVTACLO *a)
 /* racw #imm */
 static bool trans_RACW(DisasContext *ctx, arg_RACW *a)
 {
-    TCGv imm = tcg_const_i32(a->imm + 1);
+    TCGv imm = tcg_constant_i32(a->imm + 1);
     gen_helper_racw(cpu_env, imm);
     return true;
 }
@@ -1809,7 +1809,7 @@ static bool trans_SAT(DisasContext *ctx, arg_SAT *a)
 {
     TCGv tmp, z;
     tmp = tcg_temp_new();
-    z = tcg_const_i32(0);
+    z = tcg_constant_i32(0);
     /* S == 1 -> 0xffffffff / S == 0 -> 0x00000000 */
     tcg_gen_sari_i32(tmp, cpu_psw_s, 31);
     /* S == 1 -> 0x7fffffff / S == 0 -> 0x80000000 */
@@ -1831,7 +1831,7 @@ static bool trans_SATR(DisasContext *ctx, arg_SATR *a)
     static bool cat3(trans_, name, _ir)(DisasContext *ctx,              \
                                         cat3(arg_, name, _ir) * a)      \
     {                                                                   \
-        TCGv imm = tcg_const_i32(li(ctx, 0));                           \
+        TCGv imm = tcg_constant_i32(li(ctx, 0));                        \
         gen_helper_##op(cpu_regs[a->rd], cpu_env,                       \
                         cpu_regs[a->rd], imm);                          \
         return true;                                                    \
@@ -1865,7 +1865,7 @@ FOP(FDIV, fdiv)
 /* fcmp #imm, rd */
 static bool trans_FCMP_ir(DisasContext *ctx, arg_FCMP_ir * a)
 {
-    TCGv imm = tcg_const_i32(li(ctx, 0));
+    TCGv imm = tcg_constant_i32(li(ctx, 0));
     gen_helper_fcmp(cpu_env, cpu_regs[a->rd], imm);
     return true;
 }
@@ -1962,7 +1962,7 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
     {                                                                   \
         TCGv mask, mem, addr;                                           \
         mem = tcg_temp_new();                                           \
-        mask = tcg_const_i32(1 << a->imm);                              \
+        mask = tcg_constant_i32(1 << a->imm);                           \
         addr = rx_index_addr(ctx, mem, a->ld, MO_8, a->rs);             \
         cat3(rx_, op, m)(addr, mask);                                   \
         return true;                                                    \
@@ -1971,7 +1971,7 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
                                         cat3(arg_, name, _ir) * a)      \
     {                                                                   \
         TCGv mask;                                                      \
-        mask = tcg_const_i32(1 << a->imm);                              \
+        mask = tcg_constant_i32(1 << a->imm);                           \
         cat3(rx_, op, r)(cpu_regs[a->rd], mask);                        \
         return true;                                                    \
     }                                                                   \
@@ -2116,7 +2116,7 @@ static bool trans_MVTC_i(DisasContext *ctx, arg_MVTC_i *a)
 {
     TCGv imm;
 
-    imm = tcg_const_i32(a->imm);
+    imm = tcg_constant_i32(a->imm);
     move_to_cr(ctx, imm, a->cr);
     return true;
 }
@@ -2178,7 +2178,7 @@ static bool trans_INT(DisasContext *ctx, arg_INT *a)
     TCGv vec;
 
     tcg_debug_assert(a->imm < 0x100);
-    vec = tcg_const_i32(a->imm);
+    vec = tcg_constant_i32(a->imm);
     tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
     gen_helper_rxint(cpu_env, vec);
     ctx->base.is_jmp = DISAS_NORETURN;
-- 
2.34.1


