Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE66242B34C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:19:14 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUnR-0000t1-W8
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI7-000578-NM
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:51 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI5-0005GD-HZ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:51 -0400
Received: by mail-pf1-x42b.google.com with SMTP id t184so298558pfd.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QXtWYu3k26efdjnMd2Pt42jkFdW4b3H42VfJHmp983k=;
 b=wl9QVGBweAtHsJWe6CaaLNSyPhANbjnrNKE+c7DoFgZF8z5AWWiMQd6Z5pm4GNycG3
 CjJ8G7TH5LU4P77tc1wgfxxYcV8FRrz6Sol3LP5yYhZs2dBjyb7s49N3NlM4Kpdw3KEd
 w6yKLrNSv1sBi1BoiHgJgg95DtZAfyDWTwP4PjuB50nZbQb5CZD4RgP4hFz0DyqQHbsS
 k7EtY8atb3LbPOcGUXrLB2orf6KLlH2ETijFjP258e1rGen9ndQVP+7hZxM8y7RLUgGy
 p6e17uqizTHxJGn1aBVAH6Xf3mtAjeJ08CJQZa9wT9SZWHYDFneNwWAj8QxAPixlCqLj
 2mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXtWYu3k26efdjnMd2Pt42jkFdW4b3H42VfJHmp983k=;
 b=0aAr2r9ut8s6XYiZBSGmmiceyRvTxu9iu9rpeZr8zCgV/nM1KC05zLJ/SiJdmNcqM7
 8xIo1Cx4aHUTMenydbkZSc8Y9ExUaOJCwoD9lXm0CjTMg/biYFYhG63GBzEWI4aaK3Bt
 O83yJ0jGI2Yal5PlVWX3e8YxNtZYWB6Q7xE15XsV0flRzpoQC5L6fkXGxWTQqYTnXJSj
 z7V3lG+9V+Z+n9BP5DmpdrHsd6V67pVZTDQJF0340OTEyvGFji8YNkDrzRUK+/VvLxJk
 o3FrFrpsiVPnwwXQeVko9Mu+wNR/9XRK8dTlmb3FyFEdOnsWZ1v8EUfjWZiZpdBKqYXA
 LXeg==
X-Gm-Message-State: AOAM532cprb77toHsyZIs5zhKmPdV0XBsd1nPH+8J2CKgmrosnYbm0Bk
 trnfzAqQnyhuSVRlKsq3vKf9CxO0SR1kkA==
X-Google-Smtp-Source: ABdhPJyJOxwkZDwtM49k/Ibfqg12QiDZGxtqHEySqfpYdjHKU7YNoqdEJ0oQFthE5wIGfCqaerocyg==
X-Received: by 2002:a63:2acb:: with SMTP id q194mr25851046pgq.59.1634093208105; 
 Tue, 12 Oct 2021 19:46:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 39/48] target/sh4: Implement prctl_unalign_sigbus
Date: Tue, 12 Oct 2021 19:45:58 -0700
Message-Id: <20211013024607.731881-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leave TARGET_ALIGNED_ONLY set, but use the new CPUState
flag to set MO_UNALN for the instructions that the kernel
handles in the unaligned trap.

The Linux kernel does not handle all memory operations: no
floating-point and no MAC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sh4/target_prctl.h |  2 +-
 target/sh4/cpu.h              |  4 +++
 target/sh4/translate.c        | 50 ++++++++++++++++++++++++-----------
 3 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/linux-user/sh4/target_prctl.h b/linux-user/sh4/target_prctl.h
index eb53b31ad5..5629ddbf39 100644
--- a/linux-user/sh4/target_prctl.h
+++ b/linux-user/sh4/target_prctl.h
@@ -1 +1 @@
-/* No special prctl support required. */
+#include "../generic/target_prctl_unalign.h"
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 4cfb109f56..fb9dd9db2f 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -83,6 +83,7 @@
 #define DELAY_SLOT_RTE         (1 << 2)
 
 #define TB_FLAG_PENDING_MOVCA  (1 << 3)
+#define TB_FLAG_UNALIGN        (1 << 4)
 
 #define GUSA_SHIFT             4
 #ifdef CONFIG_USER_ONLY
@@ -373,6 +374,9 @@ static inline void cpu_get_tb_cpu_state(CPUSH4State *env, target_ulong *pc,
             | (env->sr & ((1u << SR_MD) | (1u << SR_RB)))      /* Bits 29-30 */
             | (env->sr & (1u << SR_FD))                        /* Bit 15 */
             | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 3 */
+#ifdef CONFIG_USER_ONLY
+    *flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
+#endif
 }
 
 #endif /* SH4_CPU_H */
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index d363050272..7965db586f 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -50,8 +50,10 @@ typedef struct DisasContext {
 
 #if defined(CONFIG_USER_ONLY)
 #define IS_USER(ctx) 1
+#define UNALIGN(C)   (ctx->tbflags & TB_FLAG_UNALIGN ? MO_UNALN : 0)
 #else
 #define IS_USER(ctx) (!(ctx->tbflags & (1u << SR_MD)))
+#define UNALIGN(C)   0
 #endif
 
 /* Target-specific values for ctx->base.is_jmp.  */
@@ -499,7 +501,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B11_8), B3_0 * 4);
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -507,7 +510,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 4);
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -562,19 +566,23 @@ static void _decode_opc(DisasContext * ctx)
         tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_UB);
 	return;
     case 0x2001:		/* mov.w Rm,@Rn */
-        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_TEUW);
+        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx,
+                            MO_TEUW | UNALIGN(ctx));
 	return;
     case 0x2002:		/* mov.l Rm,@Rn */
-        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_TEUL);
+        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx,
+                            MO_TEUL | UNALIGN(ctx));
 	return;
     case 0x6000:		/* mov.b @Rm,Rn */
         tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_SB);
 	return;
     case 0x6001:		/* mov.w @Rm,Rn */
-        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESW);
+        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
+                            MO_TESW | UNALIGN(ctx));
 	return;
     case 0x6002:		/* mov.l @Rm,Rn */
-        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESL);
+        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
+                            MO_TESL | UNALIGN(ctx));
 	return;
     case 0x2004:		/* mov.b Rm,@-Rn */
 	{
@@ -590,7 +598,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_subi_i32(addr, REG(B11_8), 2);
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUW);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUW | UNALIGN(ctx));
 	    tcg_gen_mov_i32(REG(B11_8), addr);
 	    tcg_temp_free(addr);
 	}
@@ -599,7 +608,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUL | UNALIGN(ctx));
 	    tcg_gen_mov_i32(REG(B11_8), addr);
         tcg_temp_free(addr);
 	}
@@ -610,12 +620,14 @@ static void _decode_opc(DisasContext * ctx)
 		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 1);
 	return;
     case 0x6005:		/* mov.w @Rm+,Rn */
-        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESW);
+        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
+                            MO_TESW | UNALIGN(ctx));
 	if ( B11_8 != B7_4 )
 		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 2);
 	return;
     case 0x6006:		/* mov.l @Rm+,Rn */
-        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESL);
+        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
+                            MO_TESL | UNALIGN(ctx));
 	if ( B11_8 != B7_4 )
 		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
 	return;
@@ -631,7 +643,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUW);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -639,7 +652,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -655,7 +669,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESW);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -663,7 +678,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -1257,7 +1273,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
-            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUW);
+            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx,
+                                MO_TEUW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -1273,7 +1290,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
-            tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESW);
+            tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx,
+                                MO_TESW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
-- 
2.25.1


