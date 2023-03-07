Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BFF6AED7B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbeC-00048b-SX; Tue, 07 Mar 2023 13:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe8-0003kZ-1Z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:44 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe5-00019I-O0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:43 -0500
Received: by mail-pj1-x102b.google.com with SMTP id x34so14087907pjj.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFKs4nVIkTzrPMrPmukeYU3ILmMHUaUbF/RXiEFYiOU=;
 b=KHozaHzu++gwssb3kOLmU5Dk5CdRnvWb9hADBgk3bBlTNO4udfllomg7DbMlY8J8AD
 eFKuMAca+DYUbYsV4Rv+zCNWy8bkCaIJiZeAv1pWsfmor3U9fdo+ss18HS6TtDRbRl2g
 4YfT+92dJV+fxlDn+PhOQhrIBPSjbkNbVZlS4zNpbqCY+cdZhLcrLmUT0aT+BKBnSrvf
 K1/3/1b683x1xnVBrI4j/lOIy+B611mOC0Q2pHFi7+PFKPJV4ik8pZO3yBjANdrN0+Oa
 xrFMWrPEVvVcnmjeIDpaSvrA/r2QvPdxAmZmT1c7LpgwltwsAIKyYvLWuUM7gCIv+bBI
 5rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NFKs4nVIkTzrPMrPmukeYU3ILmMHUaUbF/RXiEFYiOU=;
 b=njCwLimRPYPWLFC1eUN67ZN5YAkFk1Oz8m8NuyTDuFqsFLF4fnGJBiV4lALg2YcPvc
 l8+Vp1FtdMGmfDGvu2A62E3SqeeZyL5aAO97SEo2+OoLLufekIgWa8oMGwR/KWEjnrI+
 5SHECCZ6CYKbjej+GIzVyKZA50/wtit6MzE9fXrZn/PMtoW1FxHFeOZ84zmgJgbPMj0h
 yejV4B4Ec8iKM5W6dG/+3oJ3GSetwrD19f9n8nPxHarMp6Emfe7YV8YoTrp6befarNlk
 unEElEyLSJ7DXpYOlltr1Acw8w27RX0pFI9hjJPe2+/c0Bcaf0Dahx5eLXDEQO+Agy2V
 /8lA==
X-Gm-Message-State: AO0yUKXCYFcI26xUkoavuoQHdv2rJ/xwCkJT24xkI+wN3JhU8DSXkhpL
 bnOsQzLsrPKzLWK1qkvbsXB0sSgE0v4tYx3S37Y=
X-Google-Smtp-Source: AK7set+n4KO0qd9fsMYDWCv1SXG4nSFJ9usB0edfy7Vvjf8UZzhgTrqGabRB4ebpQ1/ZXfD6uwdh6A==
X-Received: by 2002:a05:6a20:4c88:b0:cc:786d:2128 with SMTP id
 fq8-20020a056a204c8800b000cc786d2128mr12844696pzb.53.1678212160313; 
 Tue, 07 Mar 2023 10:02:40 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 63/67] target/tricore: Rename t_off10 and use tcg_constant_i32
Date: Tue,  7 Mar 2023 09:58:44 -0800
Message-Id: <20230307175848.2508955-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

While temp3 could simply be initialized with tcg_constant_i32,
the renaming makes the purpose clearer.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 56 ++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 194bef27a6..19cf4b6cc7 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -4380,7 +4380,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
     uint32_t op2;
     uint32_t off10;
     int32_t r1, r2;
-    TCGv temp, temp2, temp3;
+    TCGv temp, temp2, t_off10;
 
     r1 = MASK_OP_BO_S1D(ctx->opcode);
     r2  = MASK_OP_BO_S2(ctx->opcode);
@@ -4389,7 +4389,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
 
     temp = tcg_temp_new();
     temp2 = tcg_temp_new();
-    temp3 = tcg_const_i32(off10);
+    t_off10 = tcg_constant_i32(off10);
     CHECK_REG_PAIR(r2);
     tcg_gen_ext16u_tl(temp, cpu_gpr_a[r2+1]);
     tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
@@ -4403,7 +4403,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
     case OPC2_32_BO_CACHEA_WI_CIRC:
     case OPC2_32_BO_CACHEA_W_CIRC:
     case OPC2_32_BO_CACHEA_I_CIRC:
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_A_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_a[r1], temp2, ctx->mem_idx, MO_LEUL);
@@ -4411,7 +4411,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_A_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_a[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_B_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
@@ -4419,7 +4419,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_B_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_D_BR:
         CHECK_REG_PAIR(r1);
@@ -4434,7 +4434,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_DA_BR:
         CHECK_REG_PAIR(r1);
@@ -4449,7 +4449,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_st_tl(cpu_gpr_a[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_H_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
@@ -4457,7 +4457,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_H_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_Q_BR:
         tcg_gen_shri_tl(temp, cpu_gpr_d[r1], 16);
@@ -4467,7 +4467,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
     case OPC2_32_BO_ST_Q_CIRC:
         tcg_gen_shri_tl(temp, cpu_gpr_d[r1], 16);
         tcg_gen_qemu_st_tl(temp, temp2, ctx->mem_idx, MO_LEUW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_W_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
@@ -4475,7 +4475,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_W_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -4619,8 +4619,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
     uint32_t op2;
     uint32_t off10;
     int r1, r2;
-
-    TCGv temp, temp2, temp3;
+    TCGv temp, temp2, t_off10;
 
     r1 = MASK_OP_BO_S1D(ctx->opcode);
     r2 = MASK_OP_BO_S2(ctx->opcode);
@@ -4629,7 +4628,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
 
     temp = tcg_temp_new();
     temp2 = tcg_temp_new();
-    temp3 = tcg_const_i32(off10);
+    t_off10 = tcg_constant_i32(off10);
     CHECK_REG_PAIR(r2);
     tcg_gen_ext16u_tl(temp, cpu_gpr_a[r2+1]);
     tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
@@ -4642,7 +4641,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_A_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_a[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_B_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_SB);
@@ -4650,7 +4649,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_B_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_SB);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_BU_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
@@ -4658,7 +4657,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_BU_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_D_BR:
         CHECK_REG_PAIR(r1);
@@ -4673,7 +4672,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_DA_BR:
         CHECK_REG_PAIR(r1);
@@ -4688,7 +4687,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_ld_tl(cpu_gpr_a[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_H_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LESW);
@@ -4696,7 +4695,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_H_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LESW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_HU_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
@@ -4704,7 +4703,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_HU_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_Q_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
@@ -4714,7 +4713,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
     case OPC2_32_BO_LD_Q_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
         tcg_gen_shli_tl(cpu_gpr_d[r1], cpu_gpr_d[r1], 16);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_W_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
@@ -4722,7 +4721,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_W_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -4823,8 +4822,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
     uint32_t op2;
     uint32_t off10;
     int r1, r2;
-
-    TCGv temp, temp2, temp3;
+    TCGv temp, temp2, t_off10;
 
     r1 = MASK_OP_BO_S1D(ctx->opcode);
     r2 = MASK_OP_BO_S2(ctx->opcode);
@@ -4833,7 +4831,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
 
     temp = tcg_temp_new();
     temp2 = tcg_temp_new();
-    temp3 = tcg_const_i32(off10);
+    t_off10 = tcg_constant_i32(off10);
     CHECK_REG_PAIR(r2);
     tcg_gen_ext16u_tl(temp, cpu_gpr_a[r2+1]);
     tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
@@ -4845,7 +4843,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LDMST_CIRC:
         gen_ldmst(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_SWAP_W_BR:
         gen_swap(ctx, r1, temp2);
@@ -4853,7 +4851,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_SWAP_W_CIRC:
         gen_swap(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_CMPSWAP_W_BR:
         gen_cmpswap(ctx, r1, temp2);
@@ -4861,7 +4859,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_CMPSWAP_W_CIRC:
         gen_cmpswap(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_SWAPMSK_W_BR:
         gen_swapmsk(ctx, r1, temp2);
@@ -4869,7 +4867,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_SWAPMSK_W_CIRC:
         gen_swapmsk(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
-- 
2.34.1


