Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D53F0C17
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:50:45 +0200 (CEST)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRaG-0007E4-VA
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9x-0007fq-8w
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:33 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9v-0002ot-B6
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:33 -0400
Received: by mail-pg1-x534.google.com with SMTP id r2so3321296pgl.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xyHeL3orXCLR7LFXkU6thFOwyKBqnlpLP28vkQM8QO8=;
 b=bAAyMm1k1xvU4FgxjJPiA5ct6outyghXTpPoHMUxVD6w32wja1jNzhVgs67oZB0iqc
 SSgurT3KbT79ZGuYssiN9H8xATfS5BGVpUIDQzo5gPe9aarq/QQiVkmnCDDVWmGZGGcC
 zWWmLGSHJsS7bw3Gi5oMf8Hpc9mq02eEh8Zu9Jn6o2IuSiRANrm5jlfBdCj7GUsilwlr
 cZLfjElEwzjTYGIrZhdeiM2jy2ECecbSbhL07vDYXT21ecfWFths17YTyXZ3CtjEyViW
 ChZCAQzyc8/oWLyoLsTokSO6ZDepgO33Hk8jEI0zmVkfVWf9rQ8eG0uQ1bhtZ3oPrg0A
 JNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xyHeL3orXCLR7LFXkU6thFOwyKBqnlpLP28vkQM8QO8=;
 b=q3D8jwnqQ0vQY3dMiq2MgxcjHy7uRoqzzUwxOKF5eTmkWh5aDj9aeWmTmSMP2NEcf5
 OZWf2LLRfTw1BwhRtnaxzs1cCWjV7P2LcRwfRAYuQffxqzXhg6AIQZ73Hp/CeyfzXmvU
 S6ysNcwAVLQiVu+IJZz7t0kg3aaMukFQfuyIuxcVe171/aFle2prHN3mfV4I3Iha1Xys
 LFbaUO3FTT5H9i0z6tnJGOeQBZt7fW3SDrJio4kMX3b18RsDf4c4XqyWBn3RzZlJzzkt
 MaWGr5+7YPVqg0XWJBu2ETtLkfTQkyGgvSOPtsnZ+rpKZUlxviXScuzg7Q5guAHjzsBc
 /U6A==
X-Gm-Message-State: AOAM531IJu95QDw67AgH54/8zjYTwnrzBtSUSz3BiNI8vIdmfxCXi+Ll
 eyesGe/kxH7ai4K2RxKHPlrgLuMMCxYBmg==
X-Google-Smtp-Source: ABdhPJyOLlNDgB7ttbb/zxWzGzVD5DCdUBMPlPTkFBpQf6nB5TIpMb6qZRrXs681iKowseaP3xRCsQ==
X-Received: by 2002:a63:a902:: with SMTP id u2mr10446976pge.123.1629314610066; 
 Wed, 18 Aug 2021 12:23:30 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 55/66] target/hppa: Implement prctl_unalign_sigbus
Date: Wed, 18 Aug 2021 09:19:09 -1000
Message-Id: <20210818191920.390759-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
 target/hppa/cpu.h       |  5 ++++-
 hw/core/cpu-user.c      |  2 +-
 linux-user/syscall.c    |  2 +-
 target/hppa/translate.c | 19 +++++++++++++++----
 4 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 748270bfa3..332ca5de62 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -259,12 +259,14 @@ static inline target_ulong hppa_form_gva(CPUHPPAState *env, uint64_t spc,
     return hppa_form_gva_psw(env->psw, spc, off);
 }
 
-/* Since PSW_{I,CB} will never need to be in tb->flags, reuse them.
+/*
+ * Since PSW_{I,CB} will never need to be in tb->flags, reuse them.
  * TB_FLAG_SR_SAME indicates that SR4 through SR7 all contain the
  * same value.
  */
 #define TB_FLAG_SR_SAME     PSW_I
 #define TB_FLAG_PRIV_SHIFT  8
+#define TB_FLAG_UNALIGN     0x400
 
 static inline void cpu_get_tb_cpu_state(CPUHPPAState *env, target_ulong *pc,
                                         target_ulong *cs_base,
@@ -279,6 +281,7 @@ static inline void cpu_get_tb_cpu_state(CPUHPPAState *env, target_ulong *pc,
 #ifdef CONFIG_USER_ONLY
     *pc = env->iaoq_f & -4;
     *cs_base = env->iaoq_b & -4;
+    flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
 #else
     /* ??? E, T, H, L, B, P bits need to be here, when implemented.  */
     flags |= env->psw & (PSW_W | PSW_C | PSW_D);
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index daf8ff59b5..6a5edcfb77 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -24,7 +24,7 @@ static Property cpu_useronly_props[] = {
      * up its memory. The default if no link is set up is to use the
      * system address space.
      */
-#if defined(TARGET_ALPHA)
+#if defined(TARGET_ALPHA) || defined(TARGET_HPPA)
     DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
                      prctl_unalign_sigbus, false),
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 15080d0539..836a7eaee2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6644,7 +6644,7 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
      * We only implement PR_UNALIGN_SIGBUS, and only for those targets
      * who have had their translator updated to insert MO_ALIGN.
      */
-#if defined(TARGET_ALPHA)
+#if defined(TARGET_ALPHA) || defined(TARGET_HPPA)
     case PR_GET_UNALIGN:
         {
             CPUState *cs = env_cpu(env);
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index b18150ef8d..1cfa801533 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -275,8 +275,18 @@ typedef struct DisasContext {
     int mmu_idx;
     int privilege;
     bool psw_n_nonzero;
+
+#ifdef CONFIG_USER_ONLY
+    MemOp unalign;
+#endif
 } DisasContext;
 
+#ifdef CONFIG_USER_ONLY
+#define UNALIGN(C)  (C)->unalign
+#else
+#define UNALIGN(C)  0
+#endif
+
 /* Note that ssm/rsm instructions number PSW_W and PSW_E differently.  */
 static int expand_sm_imm(DisasContext *ctx, int val)
 {
@@ -1480,7 +1490,7 @@ static void do_load_32(DisasContext *ctx, TCGv_i32 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1498,7 +1508,7 @@ static void do_load_64(DisasContext *ctx, TCGv_i64 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1516,7 +1526,7 @@ static void do_store_32(DisasContext *ctx, TCGv_i32 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1534,7 +1544,7 @@ static void do_store_64(DisasContext *ctx, TCGv_i64 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -4113,6 +4123,7 @@ static void hppa_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mmu_idx = MMU_USER_IDX;
     ctx->iaoq_f = ctx->base.pc_first | MMU_USER_IDX;
     ctx->iaoq_b = ctx->base.tb->cs_base | MMU_USER_IDX;
+    ctx->unalign = (ctx->tb_flags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN);
 #else
     ctx->privilege = (ctx->tb_flags >> TB_FLAG_PRIV_SHIFT) & 3;
     ctx->mmu_idx = (ctx->tb_flags & PSW_D ? ctx->privilege : MMU_PHYS_IDX);
-- 
2.25.1


