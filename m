Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901536C8DBA
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 13:01:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2Zx-0007Yp-0R; Sat, 25 Mar 2023 08:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Zt-0007Y7-Hl
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:00:58 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Zr-0003R0-JW
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:00:57 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-54184571389so82548327b3.4
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 05:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+L+VPmlMypL/+VuN9w5f51PT81kjffDZmhYGx2cT3Q=;
 b=qv59pBQ29L80CnLTgyysaLM84v8HVD8sdywHBbpTKQKEmih2rJvTFULB2TS9+PXvCk
 QGZ8XhHnon13fSq1/hzM8KeH/OJeQTE2EeUGSPjkiYHA5TsWx5H/lfFQ2ocjJsrxKSK+
 ByLA2NXnKu8oDY9wZOmn9ChlnLaqaTWlU0gBpa8L6DnYEv5rWDqkwPMPQ0saHJZBvHMu
 vQp5wOPQtEazkk3WrvD7EOJZzBYIzVP3EgBsqskYOw8Y+YaNqL5LeHLlePdeT7xP8Nhd
 ce4OsjK2cATX+CT2CFKTordxDaxuFKw2+v09pwa1THdNUzcQtwayrAnx6ouOT+r42ofD
 WCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+L+VPmlMypL/+VuN9w5f51PT81kjffDZmhYGx2cT3Q=;
 b=gniSK8nsErX+H05K+j3gAsFpx6OZkvUu/I4TdnVSjM/X3CA+nx3UZdlCfi9WbMm3Wt
 wk7YUKpwho2A5oegAmLozf0dAwqx5AjQMEV+aXEBlZsQEGLNPyxTe901qPqAKd0gRYdj
 yINxkjvxVXPRTQ0Judo1uJOa+uQMf+4M2kQw5DlZCl7DI8ccYROd/mckDCLZRGo+Zt8T
 seQepnSev2K6APH586iwXhWnkWntvxwR+ao1yqxOuGhbm6t3bILV3u1WxqNXu8HIzgcO
 DP0YbukzxodJDa0++nYkiVVuD1GzccjB0UgksktYKm21m4qC9x1LgYCL25o1ED4IcQES
 hwdA==
X-Gm-Message-State: AAQBX9egGxddDD++Iw6BvFNuEoYhsyxUFcrNqb4yHkKNqoOhsVT59nvp
 a2ID0/L9O3alI5JZl/cKgKCTwP7wB2ysRTafBwE=
X-Google-Smtp-Source: AKy350Z89DGQK2nnqumHyCpevI+OpjwggHCF+TGUsB8hzyzi7vC4PBgWRw9eO0EQqKbkbyNUldX+Rw==
X-Received: by 2002:a17:90a:7893:b0:240:40ac:bed9 with SMTP id
 x19-20020a17090a789300b0024040acbed9mr5610255pjk.20.1679741676138; 
 Sat, 25 Mar 2023 03:54:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 06/25] target/riscv: Separate priv from mmu_idx
Date: Sat, 25 Mar 2023 03:54:10 -0700
Message-Id: <20230325105429.1142530-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fei Wu <fei2.wu@intel.com>

Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
this assumption won't last as we are about to add more mmu_idx. Here an
individual priv field is added into TB_FLAGS.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fei Wu <fei2.wu@intel.com>
Message-Id: <20230324054154.414846-2-fei2.wu@intel.com>
---
 target/riscv/cpu.h                             | 2 +-
 target/riscv/cpu_helper.c                      | 4 +++-
 target/riscv/translate.c                       | 2 ++
 target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
 target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
 5 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 86a82e25dc..3e59dbb3fd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -631,7 +631,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 
 #include "exec/cpu-all.h"
@@ -658,6 +657,7 @@ FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
 FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
+FIELD(TB_FLAGS, PRIV, 25, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4f0999d50b..5753126c7a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -83,6 +83,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     fs = EXT_STATUS_DIRTY;
     vs = EXT_STATUS_DIRTY;
 #else
+    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
+
     flags |= cpu_mmu_index(env, 0);
     fs = get_field(env->mstatus, MSTATUS_FS);
     vs = get_field(env->mstatus, MSTATUS_VS);
@@ -764,7 +766,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * (riscv_cpu_do_interrupt) is correct */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
+    int mode = env->priv;
     bool use_background = false;
     hwaddr ppn;
     RISCVCPU *cpu = env_archcpu(env);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f8c077525c..abfc152553 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,6 +67,7 @@ typedef struct DisasContext {
     RISCVExtStatus mstatus_fs;
     RISCVExtStatus mstatus_vs;
     uint32_t mem_idx;
+    uint32_t priv;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
        no previous fp instruction.  Note that we exit the TB when writing
@@ -1140,6 +1141,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t tb_flags = ctx->base.tb->flags;
 
     ctx->pc_succ_insn = ctx->base.pc_first;
+    ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
     ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 59501b2780..9305b18299 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
      * that no exception will be raised when fetching them.
      */
 
-    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
+    if (semihosting_enabled(ctx->priv < PRV_S) &&
         (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
         pre    = opcode_at(&ctx->base, pre_addr);
         ebreak = opcode_at(&ctx->base, ebreak_addr);
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index df504c3f2c..adfb53cb4c 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -265,12 +265,7 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
 
 static inline int priv_level(DisasContext *ctx)
 {
-#ifdef CONFIG_USER_ONLY
-    return PRV_U;
-#else
-     /* Priv level is part of mem_idx. */
-    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
-#endif
+    return ctx->priv;
 }
 
 /* Test if priv level is M, S, or U (cannot fail). */
-- 
2.34.1


