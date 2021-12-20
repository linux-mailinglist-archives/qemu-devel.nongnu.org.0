Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280A747B559
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:47:13 +0100 (CET)
Received: from localhost ([::1]:38018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQUy-0008QS-8a
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQPi-0000GF-EB
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:41:46 -0500
Received: from [2607:f8b0:4864:20::102e] (port=34481
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQPg-0002zM-Na
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:41:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so615888pjc.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7GFp0BnjNqf+HN7On2kB2ojF6HuQfaO5DIVgtLsXYvY=;
 b=ahRYff8HoW0tAFbECnTk98PmuLVr+uxgm7EPs/Ji5uIz1yTzQ0CAswuG98gClon3ai
 B6qnu80wZf8HUiYYDnKuLsWZZbSovFaq+RMaO5+9gvLMyWN6umkI6ZCvVtVI9yWu4suw
 pRlQPlEYoTFmCqFZclSaWGXWUXcZcr3nBBhHREcHuGKaY2Z9lJ01A3x73Ub2fualpxb1
 0NJ0jEqgAmGTDXfaCzhvdMLZKPiZOga50AFkDWO7x2XwL4vfuT/GlEk/COuBaj98lAUx
 1hj4H7A03sA3+UfVU23grlncvacgFyqnivHDPt9iZuF5R5lDOg0/aYzFsdACGQaAywt4
 YtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7GFp0BnjNqf+HN7On2kB2ojF6HuQfaO5DIVgtLsXYvY=;
 b=sDa0CyT1G9SrWGVgIe8wMrM1dDyNW7C+CKvj/eJGYRHIj2tox8xu3d6JxFPNgEwfIx
 87w7p+5IGSjvk+kmWge32lGCwab1sMFEiJ0lp4tR9YQzGHHJearXDkw2gK9YX0ccGlGI
 kUpfdAg0Sv0qqvBjQ/Njffk12Y3quT4LOovL6INAIajuqG+O4a9WCbxLF7y3GQoFDia6
 41E4uscbjWcRgK54wugksrMqNCLI7bX79f8SszlQToNgZC6RE/LSKJDL7Sdk9iAM8/zN
 WwSbUJmbftXqYAexo5SRysDPdF2p9SH6T7UD+OBpP9qymBoGh+nNLfBV9dnKpDwGXuLB
 pFqQ==
X-Gm-Message-State: AOAM530R7NPPXOGKUo0J1yfsKpsua6GnL83ILRjmxyeknok/LXpYVqJj
 ERW5aqX74TJTWaDTIVB6gScPRveD6AWlqg==
X-Google-Smtp-Source: ABdhPJy0H77L5SQecXKF4TNB/xvEifpaUPGV48EvaJCZ6vVrv/oRD5vkFr8LxaguyMN9K0a1OpiEqw==
X-Received: by 2002:a17:903:408c:b0:148:f08f:d407 with SMTP id
 z12-20020a170903408c00b00148f08fd407mr13864979plc.79.1640036503516; 
 Mon, 20 Dec 2021 13:41:43 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id u10sm12508748pfm.58.2021.12.20.13.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:41:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/hppa: Implement prctl_unalign_sigbus
Date: Mon, 20 Dec 2021 13:41:34 -0800
Message-Id: <20211220214135.189157-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220214135.189157-1-richard.henderson@linaro.org>
References: <20211220214135.189157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
index 3b9744deb4..f555503024 100644
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
@@ -1473,7 +1483,7 @@ static void do_load_32(DisasContext *ctx, TCGv_i32 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1491,7 +1501,7 @@ static void do_load_64(DisasContext *ctx, TCGv_i64 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1509,7 +1519,7 @@ static void do_store_32(DisasContext *ctx, TCGv_i32 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1527,7 +1537,7 @@ static void do_store_64(DisasContext *ctx, TCGv_i64 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -4102,6 +4112,7 @@ static void hppa_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mmu_idx = MMU_USER_IDX;
     ctx->iaoq_f = ctx->base.pc_first | MMU_USER_IDX;
     ctx->iaoq_b = ctx->base.tb->cs_base | MMU_USER_IDX;
+    ctx->unalign = (ctx->tb_flags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN);
 #else
     ctx->privilege = (ctx->tb_flags >> TB_FLAG_PRIV_SHIFT) & 3;
     ctx->mmu_idx = (ctx->tb_flags & PSW_D ? ctx->privilege : MMU_PHYS_IDX);
-- 
2.25.1


