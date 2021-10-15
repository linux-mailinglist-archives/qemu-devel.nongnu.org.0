Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE8142E810
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:49:32 +0200 (CEST)
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF9v-0005O6-HW
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcN-000755-87
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:51 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcK-00033X-Dp
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:50 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s136so4203278pgs.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXtWYu3k26efdjnMd2Pt42jkFdW4b3H42VfJHmp983k=;
 b=SVI14zqg8H1ZYoKK9vlctQyy74N5XzIlUWRI7+DKjp0nRA2cQUhgzSOmwmpOcS3Eng
 mNbXt5SaK3pyxOcg6KxwCA+90CozRDTihTtY7Qz6+a0C4XWWUpYXGAA5kHEAF37F24OP
 PBhBf8tt/irlO1Kx9TmJZToUx8wSd6lfHyx60dVRG/D2tBZXpur5pNGYEp8Ic77JnfWv
 PV8LBWe8UWBvrrDLtlfr3lwzxRPEE+dyzd+BOPX1IIO6gLVen/tn4Bhk/hbzMmIgDraM
 FmmvsVIwfm/+KWZnXLGw4RfZAOrJTMZWttfPGRu8dqrMxitYNZk+XMq/bgWzCDPuuCcn
 0COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXtWYu3k26efdjnMd2Pt42jkFdW4b3H42VfJHmp983k=;
 b=QJghRzqOiDMTX6KajvydeDQbggaa+HUlZoYvuVkV+fKG5G0SsJIP3ZK/BNe3WYyYYS
 xtTSChoAD9MV3ozGtlPj92NhTEVnc8be0owppJwt5qrYBISJEUuVgK/TBSOVpH8Y7kjw
 6HYQv2/fxXv5l5EuMmojKXydK2iCfjyxib5us+hUUWwAJ2pn8VvSvYeAXPldBEgrw6ez
 ELK+bXsOJEXTN9NcKMuvQ88txFaUTjsWdz2z1oIlAkB2Dpg54PJQHR+QBslSdWXrXNYa
 KftygeZ8v2NcAtEFTZu3LqvGYWr/4iANDBXCKZIz6HCX+qVJT8R5lfNr0JMdO+pKfihW
 JWVw==
X-Gm-Message-State: AOAM533rQgBzK1d8cHazQCi5DMGR66TSwFqR0s3XMcbgFtTJXUu/eKpZ
 1xXCEaG1VXhk7z8/txEirawQFvhOeztLYg==
X-Google-Smtp-Source: ABdhPJzQDazkJiPx4jbuFPZscv/J2Vq16L++1RLVRIbftBA2RlBntOuoGFFXCis3Of1B+rduyDzQkQ==
X-Received: by 2002:a63:db41:: with SMTP id x1mr7400774pgi.474.1634271286926; 
 Thu, 14 Oct 2021 21:14:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 67/67] target/sh4: Implement prctl_unalign_sigbus
Date: Thu, 14 Oct 2021 21:10:53 -0700
Message-Id: <20211015041053.2769193-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
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


