Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03916F4810
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:10:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsZ1-0002sF-T4; Tue, 02 May 2023 12:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYp-0002n6-MZ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYi-0000iT-MA
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:03 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso24841355e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043735; x=1685635735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mPzCthQhAAzGRz8yw5OKm2S/UV6MMNarT36deOz1baU=;
 b=W5Nk1XN63Lb5QkQZ0EoRZAie2/D79dZ2QR+P9nLne8fL8ol9s5xUN+RUo1M7ztJQg6
 jBiYhml057UY9mivZhfiJTPE5QL66eOGOyWxcaijNe/mEDf7iVY/25bcJauEjg5FTtQ4
 V3SjGSjkK3qwTt1IpYtf5HyRzlHt/MpSX07ZsjtcnJD3te3ay+eEijeytcxE9CcMH3vZ
 0RYokXUuMWXGcnFxtkgB58EMDI/b2I2Gp59vS9jA/Fq26TUFba4/ldDRgItel1WdRgUu
 4CaJ8f5ourm+2pk4o+7RRYaeSQRKDmJiTTDhTxebZWCwX41GwgRMosXYZohZjN9GIAE0
 siDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043735; x=1685635735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mPzCthQhAAzGRz8yw5OKm2S/UV6MMNarT36deOz1baU=;
 b=GGsqq/0h9NntTmZC2iGRNYLSHheq+0ZGz1iIGh3kUVBV2mQjolVN3Lr8XEOvwSnl2H
 khmU5/0fu5fZsG3hzhq+kG9fdoOt/sMSMx1K2dthX+kHmSwp4ldgK+WrrTkMdlq0qqNq
 S41R6qpRLpG0DuE7imNfO7eDjugiAlsu5jm4Gysp1UVEWUpb/PozWHFKLd4aLkhdXpw8
 dPDWyIE8jpxmR8r/zL9uC7iMUgBFT0pZLcEVb5ye/PlImUb0K2vPIOYeQlO79rZLYRCm
 mywrc+av9OxaxcpeqSID5Af1z+ZQps2ohbBb2UR49zWGjTXTOnlf7V0xjWxBbYqFTLpV
 atSA==
X-Gm-Message-State: AC+VfDw8J6Q5JwCPkO98PVS10JydcEjwk2n4W445UHMXvjjoobIe4qra
 cwKihSUcYiPQ9a77awof4xUCf/nPi4D2ALckLEVbtQ==
X-Google-Smtp-Source: ACHHUZ7OOM4lkdOCPf/hlvPweN4zBckVZrC3XjcjpSbusUm+HHiLd3VpPtF/vO/kxdf6Pc8zAP1tuA==
X-Received: by 2002:a7b:c7d0:0:b0:3f1:cfea:fd49 with SMTP id
 z16-20020a7bc7d0000000b003f1cfeafd49mr12894517wmk.1.1683043735145; 
 Tue, 02 May 2023 09:08:55 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 11/16] target/sh4: Use MO_ALIGN where required
Date: Tue,  2 May 2023 17:08:41 +0100
Message-Id: <20230502160846.1289975-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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


