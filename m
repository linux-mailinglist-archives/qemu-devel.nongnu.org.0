Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180FF47FE1A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 16:08:44 +0100 (CET)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1rcB-0007Ad-7g
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 10:08:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1rVG-0005i5-Kj
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:01:34 -0500
Received: from [2607:f8b0:4864:20::42b] (port=46834
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1rVE-0000lI-Mn
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:01:34 -0500
Received: by mail-pf1-x42b.google.com with SMTP id t123so13807872pfc.13
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 07:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQTgDhCLBaZE1Cn7juEE6p/otG9i2OoS7z9LWg/JxZA=;
 b=tMaZUVeVpNKgsziVoRhrMHK8dRChAGD+fTOSjffaXxb1I1J9U4FD7p21xamXcZ92BC
 D1FTm75dP/2OraOD6X8rzoeoPQIxkj/ffeqiEhBqcZPfCu+rtJY4jmpmGlm1bSy9V7QP
 jj3ppkThzZ+cCUk4nA6K2MOc9crD/D5Jc3LUpIQVV3jUwluX1FNu/yV4wAFP1tSesNjt
 R9w9SQ5/0CDxSu2RivE0gZfFoL5WBqkGI3Nkigm7E3zECkgBqeQCTPZ95GnBHP1mB09f
 xMSURGM6xCbe1JhFItXsdbAhPNlu3N9jeqSSbirvRgfzDpC5XEMA1pMj09NGxt7MIg2k
 rDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQTgDhCLBaZE1Cn7juEE6p/otG9i2OoS7z9LWg/JxZA=;
 b=r2pwXsPQM3b+RFVWtPalHui3qEgUds7k7kxYWQJiI8xH/FuJXL31+XYoK16UeuvNpW
 wepCrqX80ZY0G55tCSHgcDQUxLMK/UHqBYbGfVjimP1UBoOF368UrDNKVkEm4+gkxFPf
 tUI4N2oWRYStEvM4LerhgK5pXlPDjlWq43CmEgdreZI//HA2e7CbqxKtLlKCjzDNwABh
 k0ojNEqLlHRzvcUSK8Ev/x855X0Ro2RjIAZp2NS1aa2hI49EB4jK5HeLbqQy7nJvlKKj
 UmLVNx5rGFEh1teAfB/zQmJXXS86iRtK2aSSHf1kpMiqB6ZoYbkgHT2JqMnsUq3gdrd1
 T75Q==
X-Gm-Message-State: AOAM530F5Qr3r02y93YDwnPRKeVdz7kIJqRXM+OUuyQSZ40Wwmfenjim
 cxZam0JE1jCfPluTe/4tfpNwG0cM79vO8w==
X-Google-Smtp-Source: ABdhPJz4FSlXCbdxLT13HrHwRpPxBCJ34bGQXeEDayVXWc+w6J2ZgNxdR/LJiylBeLkskGR7bc2d/g==
X-Received: by 2002:a63:2acc:: with SMTP id q195mr15834388pgq.50.1640617291015; 
 Mon, 27 Dec 2021 07:01:31 -0800 (PST)
Received: from localhost.localdomain (76-14-210-194.or.wavecable.com.
 [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id m13sm14756743pgt.22.2021.12.27.07.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 07:01:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] target/alpha: Implement prctl_unalign_sigbus
Date: Mon, 27 Dec 2021 07:01:25 -0800
Message-Id: <20211227150127.2659293-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227150127.2659293-1-richard.henderson@linaro.org>
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leave TARGET_ALIGNED_ONLY set, but use the new CPUState
flag to set MO_UNALN for the instructions that the kernel
handles in the unaligned trap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/target_prctl.h |  2 +-
 target/alpha/cpu.h              |  5 +++++
 target/alpha/translate.c        | 31 ++++++++++++++++++++++---------
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/linux-user/alpha/target_prctl.h b/linux-user/alpha/target_prctl.h
index eb53b31ad5..5629ddbf39 100644
--- a/linux-user/alpha/target_prctl.h
+++ b/linux-user/alpha/target_prctl.h
@@ -1 +1 @@
-/* No special prctl support required. */
+#include "../generic/target_prctl_unalign.h"
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index afd975c878..e819211503 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -383,6 +383,8 @@ enum {
 #define ENV_FLAG_TB_MASK \
     (ENV_FLAG_PAL_MODE | ENV_FLAG_PS_USER | ENV_FLAG_FEN)
 
+#define TB_FLAG_UNALIGN       (1u << 1)
+
 static inline int cpu_mmu_index(CPUAlphaState *env, bool ifetch)
 {
     int ret = env->flags & ENV_FLAG_PS_USER ? MMU_USER_IDX : MMU_KERNEL_IDX;
@@ -470,6 +472,9 @@ static inline void cpu_get_tb_cpu_state(CPUAlphaState *env, target_ulong *pc,
     *pc = env->pc;
     *cs_base = 0;
     *pflags = env->flags & ENV_FLAG_TB_MASK;
+#ifdef CONFIG_USER_ONLY
+    *pflags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
+#endif
 }
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index a4c3f43e72..208ae5fbd5 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -45,7 +45,9 @@ typedef struct DisasContext DisasContext;
 struct DisasContext {
     DisasContextBase base;
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    MemOp unalign;
+#else
     uint64_t palbr;
 #endif
     uint32_t tbflags;
@@ -68,6 +70,12 @@ struct DisasContext {
     TCGv sink;
 };
 
+#ifdef CONFIG_USER_ONLY
+#define UNALIGN(C)  (C)->unalign
+#else
+#define UNALIGN(C)  0
+#endif
+
 /* Target-specific return values from translate_one, indicating the
    state of the TB.  Note that DISAS_NEXT indicates that we are not
    exiting the TB.  */
@@ -270,7 +278,7 @@ static inline DisasJumpType gen_invalid(DisasContext *ctx)
 static void gen_ldf(DisasContext *ctx, TCGv dest, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
+    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
     gen_helper_memory_to_f(dest, tmp32);
     tcg_temp_free_i32(tmp32);
 }
@@ -278,7 +286,7 @@ static void gen_ldf(DisasContext *ctx, TCGv dest, TCGv addr)
 static void gen_ldg(DisasContext *ctx, TCGv dest, TCGv addr)
 {
     TCGv tmp = tcg_temp_new();
-    tcg_gen_qemu_ld_i64(tmp, addr, ctx->mem_idx, MO_LEQ);
+    tcg_gen_qemu_ld_i64(tmp, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
     gen_helper_memory_to_g(dest, tmp);
     tcg_temp_free(tmp);
 }
@@ -286,14 +294,14 @@ static void gen_ldg(DisasContext *ctx, TCGv dest, TCGv addr)
 static void gen_lds(DisasContext *ctx, TCGv dest, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
+    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
     gen_helper_memory_to_s(dest, tmp32);
     tcg_temp_free_i32(tmp32);
 }
 
 static void gen_ldt(DisasContext *ctx, TCGv dest, TCGv addr)
 {
-    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_LEQ);
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
 }
 
 static void gen_load_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
@@ -324,6 +332,8 @@ static void gen_load_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
     tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
     if (clear) {
         tcg_gen_andi_i64(addr, addr, ~0x7);
+    } else if (!locked) {
+        op |= UNALIGN(ctx);
     }
 
     dest = ctx->ir[ra];
@@ -340,7 +350,7 @@ static void gen_stf(DisasContext *ctx, TCGv src, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
     gen_helper_f_to_memory(tmp32, addr);
-    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
+    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
     tcg_temp_free_i32(tmp32);
 }
 
@@ -348,7 +358,7 @@ static void gen_stg(DisasContext *ctx, TCGv src, TCGv addr)
 {
     TCGv tmp = tcg_temp_new();
     gen_helper_g_to_memory(tmp, src);
-    tcg_gen_qemu_st_i64(tmp, addr, ctx->mem_idx, MO_LEQ);
+    tcg_gen_qemu_st_i64(tmp, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
     tcg_temp_free(tmp);
 }
 
@@ -356,13 +366,13 @@ static void gen_sts(DisasContext *ctx, TCGv src, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
     gen_helper_s_to_memory(tmp32, src);
-    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
+    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
     tcg_temp_free_i32(tmp32);
 }
 
 static void gen_stt(DisasContext *ctx, TCGv src, TCGv addr)
 {
-    tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, MO_LEQ);
+    tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
 }
 
 static void gen_store_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
@@ -383,6 +393,8 @@ static void gen_store_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
     tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
     if (clear) {
         tcg_gen_andi_i64(addr, addr, ~0x7);
+    } else {
+        op |= UNALIGN(ctx);
     }
 
     src = load_gpr(ctx, ra);
@@ -2942,6 +2954,7 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 
 #ifdef CONFIG_USER_ONLY
     ctx->ir = cpu_std_ir;
+    ctx->unalign = (ctx->tbflags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN);
 #else
     ctx->palbr = env->palbr;
     ctx->ir = (ctx->tbflags & ENV_FLAG_PAL_MODE ? cpu_pal_ir : cpu_std_ir);
-- 
2.25.1


