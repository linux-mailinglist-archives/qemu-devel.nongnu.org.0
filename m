Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BD6B2E80
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:21:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaD-000490-VB; Thu, 09 Mar 2023 15:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaC-00046m-9E
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:48 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaA-0001a8-Kv
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:48 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so7439110pjh.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJzdHK1Fs1NaHPQI0ScuWXrQe88rSwHY7MmaoPNCyJA=;
 b=AE2Bs2XwP/2eHRCxFSlVwsNYYKwP3lkD22sJJ9olRcsjfuJU28VnfN/TEWsxD9nIyD
 38bp/CGofYY9/JEFRffEbKrLXhRHYzJqq2caDjHKX4+c35skw7E5v2nPIXSpUaIfxqPv
 GJ8wCkQ+nygK/tZps68nC+YazF5UTTRk1VtHCUbTtVwZNAQ3vaM/wn1+jUYPYluPSIOR
 pPrELg+x7XCDxk0u2BbslaWZCub/MLxoeK5k3zsXvgN/4fYu0hZvpe7kM8wcnfpGSfH8
 2haVUT0/zYikp0eipvZjhP4wnnJLwlzcSuju45DK2NYqa+aE/pZ0dxYSZT9uy9L+nsoI
 xyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJzdHK1Fs1NaHPQI0ScuWXrQe88rSwHY7MmaoPNCyJA=;
 b=CkZbapEhXEkvLRO02kDR4Sqo02YoofOOE2nl4SizcfLCvBNY7DB8z4EGnMkh7bdrZC
 DvTekg591iekBBYJYgP3wz9kbKw0d8SmMGlNBfrm1NMyBSif0LStfT3p7bNqZTQlnlLL
 4XZeVSH5O3ksrkxFG2c2pA1cWq+NCgfrmnMow3HM1q6YIQzG2b0OUjTqJ65R4Qal8DEK
 atUkbjKWXDc/RdxSCTSxbvAJkBN5+zfRv/PrRvbx3y3c64hwGVPykHvT2AidvJJ1gn50
 OUgEPnTFb0NqmWHVwrPTDk3yJ3JR2uF3c9H6GWaCniJlhumRXEBLfX8DfBCZcMQcfm07
 DiOQ==
X-Gm-Message-State: AO0yUKVopHuI4/WkE5Fo+7QDSjMD3/RSNwpmgvJp5TtZOHS/C4tEd1VF
 504TjY0WCR+gOITBOiTsl9txpO+NvRSQQ/eGrsY=
X-Google-Smtp-Source: AK7set97MZNVkRkuCI2qqVfUDR89OFBubtg/9bJJ1YVPdNLLbW1obQCcYO8V1sRIzBTUWbi3v3z56g==
X-Received: by 2002:a17:903:120b:b0:19e:82aa:dc8a with SMTP id
 l11-20020a170903120b00b0019e82aadc8amr27020921plh.22.1678392585440; 
 Thu, 09 Mar 2023 12:09:45 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 60/91] target/sh4: Avoid tcg_const_i32
Date: Thu,  9 Mar 2023 12:05:19 -0800
Message-Id: <20230309200550.3878088-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
 target/sh4/translate.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 70a45c26e8..97da8bce48 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -526,13 +526,13 @@ static void _decode_opc(DisasContext * ctx)
 	return;
     case 0x9000:		/* mov.w @(disp,PC),Rn */
 	{
-            TCGv addr = tcg_const_i32(ctx->base.pc_next + 4 + B7_0 * 2);
+            TCGv addr = tcg_constant_i32(ctx->base.pc_next + 4 + B7_0 * 2);
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESW);
 	}
 	return;
     case 0xd000:		/* mov.l @(disp,PC),Rn */
 	{
-            TCGv addr = tcg_const_i32((ctx->base.pc_next + 4 + B7_0 * 4) & ~3);
+            TCGv addr = tcg_constant_i32((ctx->base.pc_next + 4 + B7_0 * 4) & ~3);
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
 	}
 	return;
@@ -694,7 +694,7 @@ static void _decode_opc(DisasContext * ctx)
     case 0x300e:		/* addc Rm,Rn */
         {
             TCGv t0, t1;
-            t0 = tcg_const_tl(0);
+            t0 = tcg_constant_tl(0);
             t1 = tcg_temp_new();
             tcg_gen_add2_i32(t1, cpu_sr_t, cpu_sr_t, t0, REG(B7_4), t0);
             tcg_gen_add2_i32(REG(B11_8), cpu_sr_t,
@@ -754,7 +754,7 @@ static void _decode_opc(DisasContext * ctx)
             TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
-            TCGv zero = tcg_const_i32(0);
+            TCGv zero = tcg_constant_i32(0);
 
             /* shift left arg1, saving the bit being pushed out and inserting
                T on the right */
@@ -849,7 +849,7 @@ static void _decode_opc(DisasContext * ctx)
 	return;
     case 0x600a:		/* negc Rm,Rn */
         {
-            TCGv t0 = tcg_const_i32(0);
+            TCGv t0 = tcg_constant_i32(0);
             tcg_gen_add2_i32(REG(B11_8), cpu_sr_t,
                              REG(B7_4), t0, cpu_sr_t, t0);
             tcg_gen_sub2_i32(REG(B11_8), cpu_sr_t,
@@ -913,7 +913,7 @@ static void _decode_opc(DisasContext * ctx)
     case 0x300a:		/* subc Rm,Rn */
         {
             TCGv t0, t1;
-            t0 = tcg_const_tl(0);
+            t0 = tcg_constant_tl(0);
             t1 = tcg_temp_new();
             tcg_gen_add2_i32(t1, cpu_sr_t, cpu_sr_t, t0, REG(B7_4), t0);
             tcg_gen_sub2_i32(REG(B11_8), cpu_sr_t,
@@ -1242,7 +1242,7 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv imm;
 	    CHECK_NOT_DELAY_SLOT
             gen_save_cpu_state(ctx, true);
-	    imm = tcg_const_i32(B7_0);
+	    imm = tcg_constant_i32(B7_0);
             gen_helper_trapa(cpu_env, imm);
             ctx->base.is_jmp = DISAS_NORETURN;
 	}
@@ -1709,8 +1709,8 @@ static void _decode_opc(DisasContext * ctx)
         CHECK_FPU_ENABLED
         CHECK_FPSCR_PR_1
         {
-            TCGv m = tcg_const_i32((ctx->opcode >> 8) & 3);
-            TCGv n = tcg_const_i32((ctx->opcode >> 10) & 3);
+            TCGv m = tcg_constant_i32((ctx->opcode >> 8) & 3);
+            TCGv n = tcg_constant_i32((ctx->opcode >> 10) & 3);
             gen_helper_fipr(cpu_env, m, n);
             return;
         }
@@ -1722,7 +1722,7 @@ static void _decode_opc(DisasContext * ctx)
             if ((ctx->opcode & 0x0300) != 0x0100) {
                 goto do_illegal;
             }
-            TCGv n = tcg_const_i32((ctx->opcode >> 10) & 3);
+            TCGv n = tcg_constant_i32((ctx->opcode >> 10) & 3);
             gen_helper_ftrv(cpu_env, n);
             return;
         }
@@ -1926,7 +1926,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
         }
         op_dst = B11_8;
         op_opc = INDEX_op_xor_i32;
-        op_arg = tcg_const_i32(-1);
+        op_arg = tcg_constant_i32(-1);
         break;
 
     case 0x7000 ... 0x700f: /* add #imm,Rn */
@@ -1934,7 +1934,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
             goto fail;
         }
         op_opc = INDEX_op_add_i32;
-        op_arg = tcg_const_i32(B7_0s);
+        op_arg = tcg_constant_i32(B7_0s);
         break;
 
     case 0x3000: /* cmp/eq Rm,Rn */
@@ -1980,7 +1980,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
             goto fail;
         }
         op_opc = INDEX_op_setcond_i32;
-        op_arg = tcg_const_i32(0);
+        op_arg = tcg_constant_i32(0);
 
         NEXT_INSN;
         if ((ctx->opcode & 0xff00) != 0x8900 /* bt label */
-- 
2.34.1


