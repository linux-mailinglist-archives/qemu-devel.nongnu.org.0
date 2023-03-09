Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0666B2E4E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaI-0004m2-HN; Thu, 09 Mar 2023 15:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaF-0004PT-J0
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:51 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaD-0001ac-Bq
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:51 -0500
Received: by mail-pl1-x632.google.com with SMTP id i3so3214216plg.6
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFKs4nVIkTzrPMrPmukeYU3ILmMHUaUbF/RXiEFYiOU=;
 b=ATKx4gYyjDXal6GAxUahHXcbSim/heAJTBxrrdJTo3putoW7Vu1lKbO1CUWIBgxk70
 lXsdQZvBFs+1RcgMbMDObDIdkl8JeATLq01uDQ7B8+Be2dn5VF02LjOzbGEG0+scuhMg
 SjkqLJmJaZcAHEcHTyHBeBwvZoTB5cSjITOs9T/g7bn4tD67hNOKA3JMADVBeKyqlQ+3
 cuXzyQx2+1gb9NwnXhghiLoVb47tf9A7ycgqjmH8z1Xt8DCU5fCHQny5BD7GxpEzx9y5
 8kxlGXHZKxhgw8kBe8Qjx36oKnG5pB3bQFaQpyU1dy/Ub8DuAGhr7HVpWbesstbChRLA
 K8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NFKs4nVIkTzrPMrPmukeYU3ILmMHUaUbF/RXiEFYiOU=;
 b=D7cTBsciZQr3hS7UMWFIiIkW37vy7C1fSfIwJAJWEh36gEtxruHj9H2pwqpPYfPiQg
 QUet2yCfo9DhjvRplkJlbWaP7yGVcnrLx2K2naPkPA6o3nv3dijff2uVjmesfoHg7TFc
 VkvAlATrQ9a8duLh7UAWyySuDhBaGjI33naDHfexwd+op2hyqlAlS1+8UCc5E0S/5Q3c
 0ZZETAzlZjIEY35vps+DdfHlKO0RQa65lKwIVNPJea1T7GMCZf8QcSukYr3tbC5XXtXY
 uQp68Z6TZntuC+c4Dw3K1kcz1K4WgFgsB4foCyQ5Bka6hDKiLIjE4sMXuDN9Lk/uPkUv
 ujSQ==
X-Gm-Message-State: AO0yUKX78Smnd+BRfcol/M2hAMj+OYN0V7QMS75TuBN4RMS7NeINBrli
 9L/XbUAPLv2dl0ful+fIedxYR6dir8imr1dzbIs=
X-Google-Smtp-Source: AK7set+W7CdOBEnhxeHJ3dAaJsPS8zOiDlt8PMVm0oFeafm1KL52+vOLN3xUOkZW0EOUirDSqhxXFA==
X-Received: by 2002:a17:902:d544:b0:19d:387:6602 with SMTP id
 z4-20020a170902d54400b0019d03876602mr23518518plf.58.1678392588100; 
 Thu, 09 Mar 2023 12:09:48 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 63/91] target/tricore: Rename t_off10 and use
 tcg_constant_i32
Date: Thu,  9 Mar 2023 12:05:22 -0800
Message-Id: <20230309200550.3878088-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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


