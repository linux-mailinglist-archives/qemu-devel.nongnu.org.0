Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5C42E821
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:54:02 +0200 (CEST)
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFEH-0005Gj-T7
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcN-000750-6s
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:51 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcJ-00032k-Ui
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:49 -0400
Received: by mail-pl1-x630.google.com with SMTP id 21so5580430plo.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDh0xRrxNKle4pRoEftfiIirEtPOD6rcCJZUiwu3wG8=;
 b=AbWK5js1cEcf25Lqs2nMz92zO3RIGU3Gg0TwHJUzOIzRCegLZ6fkXMAtZQJTH256Nw
 /9ruQnyxU5anw/Acq5ZE93JbnlDad+3yTr6FVIbHxTjuQWaAKhI9JFNlZW5P8nC4kv7n
 xCYMIbdFLeO74jmeC/1ghTkaj11IeBES5Wfxom2SZ/20aP2+0Di1m/T1aeb3jeR3xNx0
 E3+9HNSu/VIRjYChbOjIB/Fef0Q4sFUCsBC4hlSi2+j5EBl+zoG5Ls+NBc83tNLjOysz
 0qFd5qDSPumpbhYeXc/w20afl9Jj9ZhBtn3QdzZS7xWGJIwP1kYxo7shGV+hKI/gg1ar
 yViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDh0xRrxNKle4pRoEftfiIirEtPOD6rcCJZUiwu3wG8=;
 b=cogD6Sii3L8SjukgQ6qMoRsxYesfhgFs8kFyF8eKvTbCBC2yriLRYA9O96isJGNd1D
 puPjK3xTGMLGkNLcBDT0UoNAPtrLvmo/CYU9Shm/s3dsG5ZZxzjvcM29pwjSzJO6rpQ1
 tWpXffgovJTTrsgBdaGPBWYSYRQ8h8LLRgsvviUtGUUxg6Q4tB2HQ7f/HpNHvN/4ZE46
 MOKtuTGJAndQ4XtSNNw6RIqaOWg8DLaxw7I8zJ2HJnQfHO9MVYf3UQx1OogLsL2MA5UD
 bZObfeuHBJ7mUcuwSxbrUFxlNUo+FbaOTMvfQzM7kYV6mhnL/YslQ122bvyjYG1bsAlc
 9MPg==
X-Gm-Message-State: AOAM532pQctddcq/aOV9Cqf+GHz7nbe51NTb317xRL3JuvUZCLLj46lL
 SXj2pMWER+s8C1zvxiJ26sgP+NpaMaXraQ==
X-Google-Smtp-Source: ABdhPJzhdmGZ+mCIDdTuM9qZiKXFVBns2DC0TdWvB3AmkNjnRgoBoCYWE+NSpgrRxVa5tX6x7u1lJQ==
X-Received: by 2002:a17:90a:3b49:: with SMTP id
 t9mr24796794pjf.218.1634271286311; 
 Thu, 14 Oct 2021 21:14:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 66/67] target/hppa: Implement prctl_unalign_sigbus
Date: Thu, 14 Oct 2021 21:10:52 -0700
Message-Id: <20211015041053.2769193-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
 linux-user/hppa/target_prctl.h |  2 +-
 target/hppa/cpu.h              |  5 ++++-
 target/hppa/translate.c        | 19 +++++++++++++++----
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/linux-user/hppa/target_prctl.h b/linux-user/hppa/target_prctl.h
index eb53b31ad5..5629ddbf39 100644
--- a/linux-user/hppa/target_prctl.h
+++ b/linux-user/hppa/target_prctl.h
@@ -1 +1 @@
-/* No special prctl support required. */
+#include "../generic/target_prctl_unalign.h"
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 294fd7297f..45fd338b02 100644
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
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index c3698cf067..fdaa2b12b8 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -272,8 +272,18 @@ typedef struct DisasContext {
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
@@ -1477,7 +1487,7 @@ static void do_load_32(DisasContext *ctx, TCGv_i32 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1495,7 +1505,7 @@ static void do_load_64(DisasContext *ctx, TCGv_i64 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1513,7 +1523,7 @@ static void do_store_32(DisasContext *ctx, TCGv_i32 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1531,7 +1541,7 @@ static void do_store_64(DisasContext *ctx, TCGv_i64 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -4110,6 +4120,7 @@ static void hppa_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mmu_idx = MMU_USER_IDX;
     ctx->iaoq_f = ctx->base.pc_first | MMU_USER_IDX;
     ctx->iaoq_b = ctx->base.tb->cs_base | MMU_USER_IDX;
+    ctx->unalign = (ctx->tb_flags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN);
 #else
     ctx->privilege = (ctx->tb_flags >> TB_FLAG_PRIV_SHIFT) & 3;
     ctx->mmu_idx = (ctx->tb_flags & PSW_D ? ctx->privilege : MMU_PHYS_IDX);
-- 
2.25.1


