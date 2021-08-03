Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C43DE5B0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:47:51 +0200 (CEST)
Received: from localhost ([::1]:38458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmLG-0000io-4X
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAltG-0006Np-Py
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:54 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAltE-0005PM-Oc
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:54 -0400
Received: by mail-pl1-x634.google.com with SMTP id z3so20833860plg.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dGXkyMo+TYvl7Ch8a8BU1OTrI2Jo+/Lq5KQr+xygy8M=;
 b=ngsS90QyLSpCyP0Lu0aRJh8Te/8oXUJ0tAL5PctOzQA2jSDv5meu45pBf30U8QO7FA
 0ExOrRgY4WnVCWlpDRPAMjt2dOhGYMk3PvjgBK7qzQdjpXO+eFIYGrtJVh0wHDlleUHF
 RMVICfgq4GURAvk8tgRQOVXdH2quHqvYxf2dtQL0IAFqHG0RtRNp8bupI56PZCiF2VdJ
 QmiK/SMXwZk/A+PEJbURaaSnL+bhQ20sCip21X7KZq2ZygaAsDRTJ6ab+w8m6gSivZwv
 qfjGCsi5KrseeIn3+3uyZVI8olWmjZs5oIhRYunWqOr0FOAbQlQbBNj17GSFeNT0UpBZ
 nUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dGXkyMo+TYvl7Ch8a8BU1OTrI2Jo+/Lq5KQr+xygy8M=;
 b=L/KVWtiVgn1ZpgFsFLu/iuKQZu1dwusRyM/Dyn6nCJ4db2hpNeXcf5I+D/+t2VshPv
 3DGT9hRUyf5i9/rV85+6y7JY2mnU2pE0w95+5B1KXJ3lakQmvOhlZyUbfCpjlegWvVwq
 yHSwNIZ08xkrSeK61MF0Z5T8T7PPk8rdvnSiCrQclGdn+YXkF6VZ73Mu1aPaQbzSuvab
 h0lvqkL8uw3hOmno3X9nBdSs1i/DzROHKfpEyDUJLW+ymoI0nAaeNDMGfYK3Wi0lqfNj
 bhFLh+0tAcgGqzjBj42uBZFcjSUKiy+VHhNuXQkUWWHUsD6/90ab1Q+k5QrXFIaE09/6
 t/+w==
X-Gm-Message-State: AOAM531RhWBLGKQJyDrPW5UDzs/GvR88o5fiiGUdw3RvgnPgbJAcxCWK
 +Ia3l5aMYFGA07z9wiYcWsdeLEBnVOkGiQ==
X-Google-Smtp-Source: ABdhPJzBQQK6bF0ixnET9LsYiq4KJ3s9WAm0VsNjq+TCP+KmZjy9yoY6U9eMUvFxkU2gYv6CxWSbJw==
X-Received: by 2002:a17:90a:550a:: with SMTP id
 b10mr2369141pji.103.1627964331544; 
 Mon, 02 Aug 2021 21:18:51 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 55/55] target/sh4: Implement prctl_unalign_sigbus
Date: Mon,  2 Aug 2021 18:14:43 -1000
Message-Id: <20210803041443.55452-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
 target/sh4/cpu.h       |  4 ++++
 hw/core/cpu-user.c     |  2 +-
 linux-user/syscall.c   |  2 +-
 target/sh4/translate.c | 50 ++++++++++++++++++++++++++++--------------
 4 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index a9191951f8..5f2dc551e3 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -83,6 +83,7 @@
 #define DELAY_SLOT_RTE         (1 << 2)
 
 #define TB_FLAG_PENDING_MOVCA  (1 << 3)
+#define TB_FLAG_UNALIGN        (1 << 4)
 
 #define GUSA_SHIFT             4
 #ifdef CONFIG_USER_ONLY
@@ -376,6 +377,9 @@ static inline void cpu_get_tb_cpu_state(CPUSH4State *env, target_ulong *pc,
             | (env->sr & ((1u << SR_MD) | (1u << SR_RB)))      /* Bits 29-30 */
             | (env->sr & (1u << SR_FD))                        /* Bit 15 */
             | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 3 */
+#ifdef CONFIG_USER_ONLY
+    *flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
+#endif
 }
 
 #endif /* SH4_CPU_H */
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index 6a5edcfb77..0ad009f186 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -24,7 +24,7 @@ static Property cpu_useronly_props[] = {
      * up its memory. The default if no link is set up is to use the
      * system address space.
      */
-#if defined(TARGET_ALPHA) || defined(TARGET_HPPA)
+#if defined(TARGET_ALPHA) || defined(TARGET_HPPA) || defined(TARGET_SH4)
     DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
                      prctl_unalign_sigbus, false),
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 836a7eaee2..784ced821d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6644,7 +6644,7 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
      * We only implement PR_UNALIGN_SIGBUS, and only for those targets
      * who have had their translator updated to insert MO_ALIGN.
      */
-#if defined(TARGET_ALPHA) || defined(TARGET_HPPA)
+#if defined(TARGET_ALPHA) || defined(TARGET_HPPA) || defined(TARGET_SH4)
     case PR_GET_UNALIGN:
         {
             CPUState *cs = env_cpu(env);
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 8704fea1ca..58ec6e8ac9 100644
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


