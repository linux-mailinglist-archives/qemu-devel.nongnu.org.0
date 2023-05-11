Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA786FEDA3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:14:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Lg-0007Lv-SZ; Thu, 11 May 2023 04:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Lc-0007JH-Vg
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:26 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1La-0001xK-Eo
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:24 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-965ab8ed1fcso1498792466b.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792501; x=1686384501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+wqFaYX77FecfowzNUovNB3QQCjaKPzOWuhGxAc2Dtw=;
 b=ijm8h0FbbLfH6Ky8d9LKUGTxsgprnYKGZah64BDfJl2ng56KZhd/PV1EFOOovp9Y2F
 7fGl++DXf5Y9UmWnAYg7Jx8lx7WnnHBphXgFhRsBjxIIvJteIm8N0j8PfBe3q+mdKEek
 kNLE34piGQa4ChkI93opraLV1p0OaWih+KXVzdGYbOS0EGhAZIgf2ZRAXF2+kaMjPsHw
 P0UoSL+7cf+AeMlH84hC57Bnxc9KZwM6abshaZhyY0QUJtJo7xjPmmScFC6t7KzlYFzU
 1gA28HuBDYGMb4kJ1E97+j8emDb/uz5NVYi9I/f+M97TpasMVkrLjGe09vI3DAMyc2bx
 OqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792501; x=1686384501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+wqFaYX77FecfowzNUovNB3QQCjaKPzOWuhGxAc2Dtw=;
 b=PnkcBwqMVmO5ICJceaVGQlGW/y7anSpPMIgi3QyF0Q3S1ZHi6FXCJ+DnCZNW29z7jt
 La2ePyuW7pDSfJRzydLp9XMCHxW+zZbK0qbXjzuK2G0xOoyzhero8AzfcCO0Zhz68tl2
 kQsksyznWfHShDiEylcmCxy/eRm4TW3omqQpBnVvBL01hqT73Ck5u5ieclpEj6HwLNoO
 NrZXx7QbQxY+gOAyrQqILiEbnmJs0/BLPc7AIPmmayFKhtNTwyzSUscEACFOvclyTn18
 9PecOvKAxVC1x7I7vBpRR29ubl74K1Q9K/qGeJKwDQTZsmuem5eoQTXjVSbDhjWfUZF7
 H57g==
X-Gm-Message-State: AC+VfDzXQjQ7FD0jBQA/P2bKC0R4rc83UHreP5iU+bWlyJD2Jurgc6Xz
 +idO2k4sC04/IAVSxget2ZnnYTt8p5+3inI2jcF8Yw==
X-Google-Smtp-Source: ACHHUZ6361kJbaPiCa+65kePoB0JUp3ann2tHJFXO7ekZIK/PIaNeOulkv6qyZCPAUvSlYXdAt/TSQ==
X-Received: by 2002:a17:907:a08:b0:965:95ba:eacd with SMTP id
 bb8-20020a1709070a0800b0096595baeacdmr18489048ejc.17.1683792500784; 
 Thu, 11 May 2023 01:08:20 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 46/53] target/sh4: Use MO_ALIGN where required
Date: Thu, 11 May 2023 09:04:43 +0100
Message-Id: <20230511080450.860923-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x629.google.com
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

Mark all memory operations that are not already marked with UNALIGN.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 102 ++++++++++++++++++++++++++---------------
 1 file changed, 66 insertions(+), 36 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 6e40d5dd6a..0dedbb8210 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -527,13 +527,15 @@ static void _decode_opc(DisasContext * ctx)
     case 0x9000:		/* mov.w @(disp,PC),Rn */
 	{
             TCGv addr = tcg_constant_i32(ctx->base.pc_next + 4 + B7_0 * 2);
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESW);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESW | MO_ALIGN);
 	}
 	return;
     case 0xd000:		/* mov.l @(disp,PC),Rn */
 	{
             TCGv addr = tcg_constant_i32((ctx->base.pc_next + 4 + B7_0 * 4) & ~3);
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESL | MO_ALIGN);
 	}
 	return;
     case 0x7000:		/* add #imm,Rn */
@@ -801,9 +803,11 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv arg0, arg1;
 	    arg0 = tcg_temp_new();
-            tcg_gen_qemu_ld_i32(arg0, REG(B7_4), ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(arg0, REG(B7_4), ctx->memidx,
+                                MO_TESL | MO_ALIGN);
 	    arg1 = tcg_temp_new();
-            tcg_gen_qemu_ld_i32(arg1, REG(B11_8), ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(arg1, REG(B11_8), ctx->memidx,
+                                MO_TESL | MO_ALIGN);
             gen_helper_macl(cpu_env, arg0, arg1);
 	    tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
 	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
@@ -813,9 +817,11 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv arg0, arg1;
 	    arg0 = tcg_temp_new();
-            tcg_gen_qemu_ld_i32(arg0, REG(B7_4), ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(arg0, REG(B7_4), ctx->memidx,
+                                MO_TESL | MO_ALIGN);
 	    arg1 = tcg_temp_new();
-            tcg_gen_qemu_ld_i32(arg1, REG(B11_8), ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(arg1, REG(B11_8), ctx->memidx,
+                                MO_TESL | MO_ALIGN);
             gen_helper_macw(cpu_env, arg0, arg1);
 	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 2);
 	    tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 2);
@@ -961,30 +967,36 @@ static void _decode_opc(DisasContext * ctx)
         if (ctx->tbflags & FPSCR_SZ) {
             TCGv_i64 fp = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp, XHACK(B7_4));
-            tcg_gen_qemu_st_i64(fp, REG(B11_8), ctx->memidx, MO_TEUQ);
+            tcg_gen_qemu_st_i64(fp, REG(B11_8), ctx->memidx,
+                                MO_TEUQ | MO_ALIGN);
 	} else {
-            tcg_gen_qemu_st_i32(FREG(B7_4), REG(B11_8), ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(FREG(B7_4), REG(B11_8), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
 	}
 	return;
     case 0xf008: /* fmov @Rm,{F,D,X}Rn - FPSCR: Nothing */
 	CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_SZ) {
             TCGv_i64 fp = tcg_temp_new_i64();
-            tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx, MO_TEUQ);
+            tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx,
+                                MO_TEUQ | MO_ALIGN);
             gen_store_fpr64(ctx, fp, XHACK(B11_8));
 	} else {
-            tcg_gen_qemu_ld_i32(FREG(B11_8), REG(B7_4), ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_ld_i32(FREG(B11_8), REG(B7_4), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
 	}
 	return;
     case 0xf009: /* fmov @Rm+,{F,D,X}Rn - FPSCR: Nothing */
 	CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_SZ) {
             TCGv_i64 fp = tcg_temp_new_i64();
-            tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx, MO_TEUQ);
+            tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx,
+                                MO_TEUQ | MO_ALIGN);
             gen_store_fpr64(ctx, fp, XHACK(B11_8));
             tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 8);
 	} else {
-            tcg_gen_qemu_ld_i32(FREG(B11_8), REG(B7_4), ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_ld_i32(FREG(B11_8), REG(B7_4), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
 	    tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
 	}
 	return;
@@ -996,10 +1008,12 @@ static void _decode_opc(DisasContext * ctx)
                 TCGv_i64 fp = tcg_temp_new_i64();
                 gen_load_fpr64(ctx, fp, XHACK(B7_4));
                 tcg_gen_subi_i32(addr, REG(B11_8), 8);
-                tcg_gen_qemu_st_i64(fp, addr, ctx->memidx, MO_TEUQ);
+                tcg_gen_qemu_st_i64(fp, addr, ctx->memidx,
+                                    MO_TEUQ | MO_ALIGN);
             } else {
                 tcg_gen_subi_i32(addr, REG(B11_8), 4);
-                tcg_gen_qemu_st_i32(FREG(B7_4), addr, ctx->memidx, MO_TEUL);
+                tcg_gen_qemu_st_i32(FREG(B7_4), addr, ctx->memidx,
+                                    MO_TEUL | MO_ALIGN);
             }
             tcg_gen_mov_i32(REG(B11_8), addr);
         }
@@ -1011,10 +1025,12 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
             if (ctx->tbflags & FPSCR_SZ) {
                 TCGv_i64 fp = tcg_temp_new_i64();
-                tcg_gen_qemu_ld_i64(fp, addr, ctx->memidx, MO_TEUQ);
+                tcg_gen_qemu_ld_i64(fp, addr, ctx->memidx,
+                                    MO_TEUQ | MO_ALIGN);
                 gen_store_fpr64(ctx, fp, XHACK(B11_8));
 	    } else {
-                tcg_gen_qemu_ld_i32(FREG(B11_8), addr, ctx->memidx, MO_TEUL);
+                tcg_gen_qemu_ld_i32(FREG(B11_8), addr, ctx->memidx,
+                                    MO_TEUL | MO_ALIGN);
 	    }
 	}
 	return;
@@ -1026,9 +1042,11 @@ static void _decode_opc(DisasContext * ctx)
             if (ctx->tbflags & FPSCR_SZ) {
                 TCGv_i64 fp = tcg_temp_new_i64();
                 gen_load_fpr64(ctx, fp, XHACK(B7_4));
-                tcg_gen_qemu_st_i64(fp, addr, ctx->memidx, MO_TEUQ);
+                tcg_gen_qemu_st_i64(fp, addr, ctx->memidx,
+                                    MO_TEUQ | MO_ALIGN);
 	    } else {
-                tcg_gen_qemu_st_i32(FREG(B7_4), addr, ctx->memidx, MO_TEUL);
+                tcg_gen_qemu_st_i32(FREG(B7_4), addr, ctx->memidx,
+                                    MO_TEUL | MO_ALIGN);
 	    }
 	}
 	return;
@@ -1158,14 +1176,14 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 2);
-            tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESW);
+            tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESW | MO_ALIGN);
 	}
 	return;
     case 0xc600:		/* mov.l @(disp,GBR),R0 */
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 4);
-            tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESL | MO_ALIGN);
 	}
 	return;
     case 0xc000:		/* mov.b R0,@(disp,GBR) */
@@ -1179,14 +1197,14 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 2);
-            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUW);
+            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUW | MO_ALIGN);
 	}
 	return;
     case 0xc200:		/* mov.l R0,@(disp,GBR) */
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 4);
-            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUL | MO_ALIGN);
 	}
 	return;
     case 0x8000:		/* mov.b R0,@(disp,Rn) */
@@ -1286,7 +1304,8 @@ static void _decode_opc(DisasContext * ctx)
 	return;
     case 0x4087:		/* ldc.l @Rm+,Rn_BANK */
 	CHECK_PRIVILEGED
-        tcg_gen_qemu_ld_i32(ALTREG(B6_4), REG(B11_8), ctx->memidx, MO_TESL);
+        tcg_gen_qemu_ld_i32(ALTREG(B6_4), REG(B11_8), ctx->memidx,
+                            MO_TESL | MO_ALIGN);
 	tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
 	return;
     case 0x0082:		/* stc Rm_BANK,Rn */
@@ -1298,7 +1317,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
-            tcg_gen_qemu_st_i32(ALTREG(B6_4), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(ALTREG(B6_4), addr, ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
 	    tcg_gen_mov_i32(REG(B11_8), addr);
 	}
 	return;
@@ -1354,7 +1374,8 @@ static void _decode_opc(DisasContext * ctx)
 	CHECK_PRIVILEGED
 	{
 	    TCGv val = tcg_temp_new();
-            tcg_gen_qemu_ld_i32(val, REG(B11_8), ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(val, REG(B11_8), ctx->memidx,
+                                MO_TESL | MO_ALIGN);
             tcg_gen_andi_i32(val, val, 0x700083f3);
             gen_write_sr(val);
 	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
@@ -1372,7 +1393,7 @@ static void _decode_opc(DisasContext * ctx)
             TCGv val = tcg_temp_new();
 	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
             gen_read_sr(val);
-            tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_TEUL | MO_ALIGN);
 	    tcg_gen_mov_i32(REG(B11_8), addr);
 	}
 	return;
@@ -1383,7 +1404,8 @@ static void _decode_opc(DisasContext * ctx)
     return;							\
   case ldpnum:							\
     prechk    							\
-    tcg_gen_qemu_ld_i32(cpu_##reg, REG(B11_8), ctx->memidx, MO_TESL); \
+    tcg_gen_qemu_ld_i32(cpu_##reg, REG(B11_8), ctx->memidx,     \
+                        MO_TESL | MO_ALIGN);                    \
     tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);		\
     return;
 #define ST(reg,stnum,stpnum,prechk)		\
@@ -1396,7 +1418,8 @@ static void _decode_opc(DisasContext * ctx)
     {								\
 	TCGv addr = tcg_temp_new();				\
 	tcg_gen_subi_i32(addr, REG(B11_8), 4);			\
-        tcg_gen_qemu_st_i32(cpu_##reg, addr, ctx->memidx, MO_TEUL); \
+        tcg_gen_qemu_st_i32(cpu_##reg, addr, ctx->memidx,       \
+                            MO_TEUL | MO_ALIGN);                \
 	tcg_gen_mov_i32(REG(B11_8), addr);			\
     }								\
     return;
@@ -1423,7 +1446,8 @@ static void _decode_opc(DisasContext * ctx)
 	CHECK_FPU_ENABLED
 	{
 	    TCGv addr = tcg_temp_new();
-            tcg_gen_qemu_ld_i32(addr, REG(B11_8), ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(addr, REG(B11_8), ctx->memidx,
+                                MO_TESL | MO_ALIGN);
 	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
             gen_helper_ld_fpscr(cpu_env, addr);
             ctx->base.is_jmp = DISAS_STOP;
@@ -1441,16 +1465,18 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_andi_i32(val, cpu_fpscr, 0x003fffff);
 	    addr = tcg_temp_new();
 	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
-            tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_TEUL | MO_ALIGN);
 	    tcg_gen_mov_i32(REG(B11_8), addr);
 	}
 	return;
     case 0x00c3:		/* movca.l R0,@Rm */
         {
             TCGv val = tcg_temp_new();
-            tcg_gen_qemu_ld_i32(val, REG(B11_8), ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_ld_i32(val, REG(B11_8), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
             gen_helper_movcal(cpu_env, REG(B11_8), val);
-            tcg_gen_qemu_st_i32(REG(0), REG(B11_8), ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(0), REG(B11_8), ctx->memidx,
+                                MO_TEUL | MO_ALIGN);
         }
         ctx->has_movcal = 1;
 	return;
@@ -1492,11 +1518,13 @@ static void _decode_opc(DisasContext * ctx)
                                    cpu_lock_addr, fail);
                 tmp = tcg_temp_new();
                 tcg_gen_atomic_cmpxchg_i32(tmp, REG(B11_8), cpu_lock_value,
-                                           REG(0), ctx->memidx, MO_TEUL);
+                                           REG(0), ctx->memidx,
+                                           MO_TEUL | MO_ALIGN);
                 tcg_gen_setcond_i32(TCG_COND_EQ, cpu_sr_t, tmp, cpu_lock_value);
             } else {
                 tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_lock_addr, -1, fail);
-                tcg_gen_qemu_st_i32(REG(0), REG(B11_8), ctx->memidx, MO_TEUL);
+                tcg_gen_qemu_st_i32(REG(0), REG(B11_8), ctx->memidx,
+                                    MO_TEUL | MO_ALIGN);
                 tcg_gen_movi_i32(cpu_sr_t, 1);
             }
             tcg_gen_br(done);
@@ -1521,11 +1549,13 @@ static void _decode_opc(DisasContext * ctx)
         if ((tb_cflags(ctx->base.tb) & CF_PARALLEL)) {
             TCGv tmp = tcg_temp_new();
             tcg_gen_mov_i32(tmp, REG(B11_8));
-            tcg_gen_qemu_ld_i32(REG(0), REG(B11_8), ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(REG(0), REG(B11_8), ctx->memidx,
+                                MO_TESL | MO_ALIGN);
             tcg_gen_mov_i32(cpu_lock_value, REG(0));
             tcg_gen_mov_i32(cpu_lock_addr, tmp);
         } else {
-            tcg_gen_qemu_ld_i32(REG(0), REG(B11_8), ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(REG(0), REG(B11_8), ctx->memidx,
+                                MO_TESL | MO_ALIGN);
             tcg_gen_movi_i32(cpu_lock_addr, 0);
         }
         return;
-- 
2.34.1


