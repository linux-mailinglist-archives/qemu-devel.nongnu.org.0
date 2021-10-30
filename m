Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D787D440AEF
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:16:29 +0200 (CEST)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsu5-0003FZ-0c
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs25-0001mJ-Ff
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs22-0002K8-Ly
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id iq11so2455608pjb.3
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ythuo4u3wTG6v82m8MPeTsA+ifWASlVSxLmACYwOII=;
 b=loDH8jC8J8rJu3SC39EETsZZaJqgdRv+Bz4DYWO1PFJcW53Po2NZvPaBhNlKI7pAFV
 dA3dfEx4ZVV7whbW3vCqc61kDip7j4gEmEZJ01csN77jL4hIMHTZM539391kagfxtneG
 f+Ok7A3CHGlCgG/W0/68SQvwpa04LqYm12rMdXZfoKEzuYMVS+UsQ90yhit7VJBuAf2v
 6g+ziyFv6C7VuIa/ZJApWQbmpNymPRySD/nI+SkPENJhbDAUiTy6zVABZKOch41X8FrW
 xHCkT+zmXaNttw+e8lQT91GkUbKSZZ5lFCC5fUQObNjVKr+G/OwYerUcQOlGakHz1Dsd
 vttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ythuo4u3wTG6v82m8MPeTsA+ifWASlVSxLmACYwOII=;
 b=vp7oI7i1O1XxadusGS6NB+BRPWBsaJaUIgZ8zirWIRXECre/Bq5VmPcQ1spmK5Knkz
 J+j4LUqqFY073MjlV2t/EBOj8ndIozCjCPPgiKpiHA/jzn4ekxWfGudX025d+hMH5cJn
 4tGIKxypVT2cXx/X/FFTLwTr7zIgn+J4YiOFTAVRF1N3mPXRncqPT4Pird/jy1vpuHbj
 qmAW95edL0zTKD2orCqCFkfgJZxn5yjlsu1VdOC9UoKrGhUHRPS/5jaz+fPaD0yBSpvT
 R41Ath4vW3JgU9WNAoX3C7NxpyXADTiSe64wpDEwfpq6WboO+ulRn9YU/MjRIWOM4f7N
 cC9A==
X-Gm-Message-State: AOAM532sO4zURtaHQUbRBmXglN7Injv6djGXS7+pfHTK5IktZdrgd183
 Adgdw6InGGui+lSIkvqVo3XYS947994nSA==
X-Google-Smtp-Source: ABdhPJz++27hZKkskFLhxiNy48WA8A5njo9uCO7ru5YvyZe4hAj84GCESFSaTTN8vonS/ZAV8PGfsA==
X-Received: by 2002:a17:90a:9bc1:: with SMTP id
 b1mr15242270pjw.49.1635614437319; 
 Sat, 30 Oct 2021 10:20:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 66/66] target/sh4: Implement prctl_unalign_sigbus
Date: Sat, 30 Oct 2021 10:16:35 -0700
Message-Id: <20211030171635.1689530-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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
index ce5d674a52..c959ce1508 100644
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
@@ -495,7 +497,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B11_8), B3_0 * 4);
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -503,7 +506,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 4);
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -558,19 +562,23 @@ static void _decode_opc(DisasContext * ctx)
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
@@ -586,7 +594,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_subi_i32(addr, REG(B11_8), 2);
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUW);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUW | UNALIGN(ctx));
 	    tcg_gen_mov_i32(REG(B11_8), addr);
 	    tcg_temp_free(addr);
 	}
@@ -595,7 +604,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUL | UNALIGN(ctx));
 	    tcg_gen_mov_i32(REG(B11_8), addr);
         tcg_temp_free(addr);
 	}
@@ -606,12 +616,14 @@ static void _decode_opc(DisasContext * ctx)
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
@@ -627,7 +639,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUW);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -635,7 +648,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -651,7 +665,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESW);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -659,7 +674,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -1253,7 +1269,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
-            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUW);
+            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx,
+                                MO_TEUW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -1269,7 +1286,8 @@ static void _decode_opc(DisasContext * ctx)
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


