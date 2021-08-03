Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714823DE5A2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:43:46 +0200 (CEST)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmHJ-0007RI-H8
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAltG-0006Kq-6o
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:54 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAltD-0005Nr-LP
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id j1so28048872pjv.3
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xyHeL3orXCLR7LFXkU6thFOwyKBqnlpLP28vkQM8QO8=;
 b=dBR0FxgE4KwYBLym7h+zIDoKjwl82y1+GI2w203zPZvehsPwXTm4IwpMHlxL/IufwO
 BWZTJYpV4L7FaYm/h3CVGHvoQbEASpQSn3FYQ2BTP5/8bOGLjGcCMn3DwI4pfaPNUIUP
 +51pagIVMyJyqJIxNt73q/PKwgxcBj1tOsxpVVvkEG8YXhFesmLJB7SmUPchVuSojkG/
 f3mBATGRZXBJTvSny8KVa1UlI+Pe+Ko/farGltYf4+2KyQ/TlheGeV05N7eBY1u2yDBY
 eWPCYZHoO7tw2oRwHH4AVwbpFkmOyNdEnhj3Xijbk2l9dbvt3y9RVSoCpiUO8YAmbNvj
 P4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xyHeL3orXCLR7LFXkU6thFOwyKBqnlpLP28vkQM8QO8=;
 b=BDNMKwJhHWDTnwo1rPHEn4k/Lt2mkUWZLQZipongqqfIjpNkkbcm38L+LsHKdOoa1p
 nw+/ldZSRkuNzHxGh7+Z/R4nw4S07G+V+lVG61esNdy1rJjclxQBQMF1c/pEvLm6QrOQ
 t6sGd2lhR2xlcm3Sea8MRHbYE94Hp0iqz9J0JwYxinp4gNg34vChoK86cluuvjA0quVQ
 qRXn1ZCyGwXfOWXEgJU30nqm6hInYP9e2zLhrXjouqmRtlaBpdlS5cGjwYbYdZN+WmhH
 or/3/scCz3d/pmTRqfDXh6k9fIcX7B+VsIjMqnBYQSxfk615KkQcJvk3iQVLV99aE8WD
 sHiw==
X-Gm-Message-State: AOAM530bAWWvWKRSStVhG7ss7KgFdIJENWDaRScEjSBeNUkdhaqQiHpv
 BlvLxf1V0ghA6eKPvuGxIngwGVb+OzEqXQ==
X-Google-Smtp-Source: ABdhPJz0P09SGOpOtjKbGw6F70UmY474WBV0MbZdf2tPoYUZscvhwMhIrJfXk9hfVOs7Am7N3ph/Jg==
X-Received: by 2002:a63:dd51:: with SMTP id g17mr34481pgj.47.1627964330333;
 Mon, 02 Aug 2021 21:18:50 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 54/55] target/hppa: Implement prctl_unalign_sigbus
Date: Mon,  2 Aug 2021 18:14:42 -1000
Message-Id: <20210803041443.55452-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


