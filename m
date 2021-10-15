Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CAA42E829
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:57:51 +0200 (CEST)
Received: from localhost ([::1]:52042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFHy-0002TZ-3p
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcL-00071J-G8
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:49 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcJ-00031U-2M
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:49 -0400
Received: by mail-pf1-x429.google.com with SMTP id m26so7315250pff.3
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ibr1nNRFVeuBeAqywwGzrumnaR34sN1fg0KpH5ukJvY=;
 b=PBgmaZxspbnMhUR0+fkJ9nXkmDq+6mFffz7MMQxHfTXIgQAdHlC8JsgSXYaitvns7R
 Cxm1YfWq+Raly4pPFAQTcOcsEO7Tv5DNLYsVvSqD/OWabYYy9tj9PuqVjkNRrIH8ZstQ
 DLkPmMMbVXb7dCTOhJYXd6ePFfINp72U7cCVzUlcxYUOYzJ+t3YdGz8IZC/mHn3mJKY9
 XW4uDnkcf6U7cV/i3Oo2SbR5nQNTSa2eBPp7H0vNYmTk0UUPeMlg+AOtaVfHCqgd6LEP
 zFZe6JEuXjXVJT5/CM+4InZj0Nq/bSJBW4u0YPnOpwRhC+SPDYuFp+R5u+XR1KIPrYCn
 nkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ibr1nNRFVeuBeAqywwGzrumnaR34sN1fg0KpH5ukJvY=;
 b=3Ku7a/2ySxfzyeIS/pv7PkahoI+SVm7nZbBTvkmKJ9GZzwBSImPlqX+Fd9SMZ7BIzg
 cA+K2taH5skjNkpm8AVgGWE2MbY7eY1n7eXpIiTwR48hfJYd4FToGuGJwOHJsLCLoUwD
 xeTN2lRpo92rhbNP6n2Un3UVsmgOnuclfCX+kWhZYHxzWY/p3L0z8TFSqfkRMMdW+AjA
 luhe4v5sl8PqmfUQ/feUDIfKuqRXRqFouPyc6WVss1ex3mNZVDrzIN4g7DgzFXBaESaF
 eR0094LYvztaCj/ebub2hzruFvOoNwvKCs7FUOT5rjpojgkbC96BsorGw2jGMGOXU47X
 FDEA==
X-Gm-Message-State: AOAM530F9W2PErr6m2jT+OOVKwbLeK+D7w9yt3fAbsdXS8gxFBAvV2w8
 defH2NtIiSbDb3ULHz3bK3H4HN8MOt0mlg==
X-Google-Smtp-Source: ABdhPJzQUHlh5wSFTP781KTVbQfCdfTkg4izzCeMsRSJBeYnszClOZoKM66FvDQ3VudlaX7aGciAgQ==
X-Received: by 2002:a62:60c2:0:b0:448:7376:20c4 with SMTP id
 u185-20020a6260c2000000b00448737620c4mr9275709pfb.11.1634271285695; 
 Thu, 14 Oct 2021 21:14:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 65/67] target/alpha: Implement prctl_unalign_sigbus
Date: Thu, 14 Oct 2021 21:10:51 -0700
Message-Id: <20211015041053.2769193-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
index 0eee3a1bcc..2656037b8b 100644
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


