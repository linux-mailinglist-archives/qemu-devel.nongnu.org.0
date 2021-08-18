Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6DD3F0C10
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:48:23 +0200 (CEST)
Received: from localhost ([::1]:39132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRXy-0001fk-6h
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9w-0007aj-29
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:32 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9u-0002nb-5e
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:31 -0400
Received: by mail-pf1-x431.google.com with SMTP id y11so3186855pfl.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/JPMIUFwv6h1D3td4UoRXmmsJ7EdKacS0CaAIsGRkeY=;
 b=AGzae5d1dQmt7uPzHg7LksKvvOMlLP1v3dgKEt7Z8FhXg8thCTd3MTR4Q8k3OCs76C
 AN5fDYng2O4N096V6vcjXwpuhdpMod7Ic+6VAQp/KIyg1Kd9CrLb6p1nYes6oKrXXicf
 ug0UOM0goOg70zcZ9916rY7C9wqa0OAUgiptkDbO5EiJtubr6Xz3nZm7Ggy2TkKYGtar
 d8saO1QrJgLLwwo4pk7GPf7ss/2NGoYJ14z4iDfMTKoK1w9Cia8NhPktlwzR0hBzj0Y0
 aEf/Ic5PQQBNDVtq7DaxgzzoNGB2YIvuBR66V5y/nZXSRGYOhbT2a7sDTw05lL9IJAlB
 nWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/JPMIUFwv6h1D3td4UoRXmmsJ7EdKacS0CaAIsGRkeY=;
 b=QcmezoG39n6UvMdzk7s6MDlltGMgkD1DtONoGhPBeO5jwgoAWZEqBIPq8CNjmpDWiI
 Y+ZVQnIMpjDhZ3RdI/K6l+/Q+RCydOyneqpdk5zgC9mIZbnpEUgUqhW6yDvKFgQhj2bl
 yGHLxSK9UMq5LA6TSrgtN9zo/kyiXd9pnA+hEBVxZ5/0CGrSIsp8BWSVLkBC1IInxlEI
 TshId9/ITnU/wJm7F0xHTchZjIdcWXdDlpv4uAXA7qYh4W4Mpdsvbzg4EpclKxnGRvi8
 coylvHES0P+ji7JS0IyhxGDanvR1V5XqxbLZMAvYXs1Hr/KugU01GQnZ8ACDFfqT5EAe
 cRKg==
X-Gm-Message-State: AOAM530um9UdkDFK9yVXfN9dH5IEBKwfG5HNTE3poFIj4HNH37frGGrq
 Lwt9kUtS68wHE+h/dULlnTYPCKrsnsiLaQ==
X-Google-Smtp-Source: ABdhPJxbKvsNBFZPJEJvplMhFdmWbF2B65ENwY0FNSqC3x144wqsSNig5zmpeXGDX8DAbAm2oV7SKA==
X-Received: by 2002:a63:5d25:: with SMTP id r37mr1217742pgb.152.1629314608941; 
 Wed, 18 Aug 2021 12:23:28 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 54/66] target/alpha: Implement prctl_unalign_sigbus
Date: Wed, 18 Aug 2021 09:19:08 -1000
Message-Id: <20210818191920.390759-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.h       |  5 +++++
 hw/core/cpu-user.c       |  2 +-
 linux-user/syscall.c     |  2 +-
 target/alpha/translate.c | 31 ++++++++++++++++++++++---------
 4 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 6eb3fcc63e..d9099ea188 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -387,6 +387,8 @@ enum {
 #define ENV_FLAG_TB_MASK \
     (ENV_FLAG_PAL_MODE | ENV_FLAG_PS_USER | ENV_FLAG_FEN)
 
+#define TB_FLAG_UNALIGN       (1u << 1)
+
 static inline int cpu_mmu_index(CPUAlphaState *env, bool ifetch)
 {
     int ret = env->flags & ENV_FLAG_PS_USER ? MMU_USER_IDX : MMU_KERNEL_IDX;
@@ -469,6 +471,9 @@ static inline void cpu_get_tb_cpu_state(CPUAlphaState *env, target_ulong *pc,
     *pc = env->pc;
     *cs_base = 0;
     *pflags = env->flags & ENV_FLAG_TB_MASK;
+#ifdef CONFIG_USER_ONLY
+    *pflags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
+#endif
 }
 
 #ifdef CONFIG_USER_ONLY
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index 23786865cb..daf8ff59b5 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -24,7 +24,7 @@ static Property cpu_useronly_props[] = {
      * up its memory. The default if no link is set up is to use the
      * system address space.
      */
-#if 0
+#if defined(TARGET_ALPHA)
     DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
                      prctl_unalign_sigbus, false),
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b2e3c28b41..15080d0539 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6644,7 +6644,7 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
      * We only implement PR_UNALIGN_SIGBUS, and only for those targets
      * who have had their translator updated to insert MO_ALIGN.
      */
-#if 0
+#if defined(TARGET_ALPHA)
     case PR_GET_UNALIGN:
         {
             CPUState *cs = env_cpu(env);
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index c14c1156a0..f6ba6a1a59 100644
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


