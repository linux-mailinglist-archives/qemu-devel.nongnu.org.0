Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5041147FE1B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 16:08:49 +0100 (CET)
Received: from localhost ([::1]:37690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1rcG-0007KN-Fe
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 10:08:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1rVH-0005jI-4c
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:01:35 -0500
Received: from [2607:f8b0:4864:20::1029] (port=40937
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1rVE-0000lT-Uc
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:01:34 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so18719324pjo.5
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 07:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U5Qy7DuZ4P6rEuRxuMemtVkwjVOxpB9cqu/zokKTErw=;
 b=VTHbL0yUQfCdFOMJQBhrTJ4w4r3N38XRtfCKDtrC1y1CkDEb2/LjLTWnHCM+DfPFzA
 XXyvW7Xsic7HWvnxHN+nd5qxVUtBp2HLZkVskYWf3ZY3wwN2xlVwidGZiE6FQDNTVrBI
 31S4zTOtGfqxVIz0JM+XIidA3ErUocDkHNhFwU7xKQY6iECpGQpQZLImk5gd4EMIPKDA
 ZUDrDrW/Z0645stdUXl9jZv0+zoE4vuun5C42GtE3ziGuBAurji5GEQsd4Ab0TBwetxJ
 eI5AzTbRLzOQIOj0YmF8LVtWfj7QckSvLFwXKvvahA55lR75Xk0xyk4x1mYncPzQvIXW
 louA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U5Qy7DuZ4P6rEuRxuMemtVkwjVOxpB9cqu/zokKTErw=;
 b=waBHc9pIKDO1QmmM5Kqy5aquJTTYts2RrZJ8vz1tnlvPmPLRR5xFahBC+tCWHevIFI
 ezUb3dCurNnZUR2PafNt2LNfW1jF+qLcbBtX+AMYBA2NHyCHG8WqeR8pDgOBSqBwiVeB
 GwZ5cJkuS1l7cSbGFeTYqFO0yNTNSSEv+T909g6yjEIRBzlcDiqCdZdpdyEJEldptCbY
 HuvvaTxsQCoHynBG5RvmZkgBMPgpDE0MCZ1tssOeriiDcyVkp0eTH1h/5T2qXfQSdPDQ
 CUvWqb7xP0c/rdQ141STQRhB735y39gzEuf/HJUlIxe3cLc6U/XTSNXvddF6EIexWFsK
 9X1A==
X-Gm-Message-State: AOAM533G1sOS50A1N2cNPGNLz/V+wGLPsgU1Vpb128mGkBmjSIX4AOKD
 wW6S8B6tuYYkCnPW/qu3iKBthgTzCacNVg==
X-Google-Smtp-Source: ABdhPJwCNfs1qgf39/soU7iaa22QmfGb8OrR8htPY78MG84yWDEurJFqB2qeLFHKP869MSzSa6L+iQ==
X-Received: by 2002:a17:90b:4a01:: with SMTP id
 kk1mr21724457pjb.142.1640617291668; 
 Mon, 27 Dec 2021 07:01:31 -0800 (PST)
Received: from localhost.localdomain (76-14-210-194.or.wavecable.com.
 [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id m13sm14756743pgt.22.2021.12.27.07.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 07:01:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] target/hppa: Implement prctl_unalign_sigbus
Date: Mon, 27 Dec 2021 07:01:26 -0800
Message-Id: <20211227150127.2659293-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227150127.2659293-1-richard.henderson@linaro.org>
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
index 952027a28e..a2392a1b64 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -274,8 +274,18 @@ typedef struct DisasContext {
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
@@ -1475,7 +1485,7 @@ static void do_load_32(DisasContext *ctx, TCGv_i32 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1493,7 +1503,7 @@ static void do_load_64(DisasContext *ctx, TCGv_i64 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1511,7 +1521,7 @@ static void do_store_32(DisasContext *ctx, TCGv_i32 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1529,7 +1539,7 @@ static void do_store_64(DisasContext *ctx, TCGv_i64 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -4107,6 +4117,7 @@ static void hppa_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mmu_idx = MMU_USER_IDX;
     ctx->iaoq_f = ctx->base.pc_first | MMU_USER_IDX;
     ctx->iaoq_b = ctx->base.tb->cs_base | MMU_USER_IDX;
+    ctx->unalign = (ctx->tb_flags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN);
 #else
     ctx->privilege = (ctx->tb_flags >> TB_FLAG_PRIV_SHIFT) & 3;
     ctx->mmu_idx = (ctx->tb_flags & PSW_D ? ctx->privilege : MMU_PHYS_IDX);
-- 
2.25.1


