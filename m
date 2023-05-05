Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D76F7A87
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:16:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujuQ-0006y3-FH; Thu, 04 May 2023 21:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuK-0006s6-W1
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:50 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuG-0007sl-Rh
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:48 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-51fcf5d1e44so1000421a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248802; x=1685840802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aFpeSydLToeDkFGGhok1argALURBxwBUe50hDHY5hQY=;
 b=ZfhlxbRSukWRjjhDU0n+Y1CUiASy1rIfoMW/W6zcz5eBjPgDtB5sGulPx5X8b58cK0
 TVgo9JLHHk1aq+M0n3XfXingM43RmpbJNtajLNSTbePrQGZJuOZD+xLvJJ54i9ZlXtkL
 tb7RUZZJY6PoOXQP3ZxK4XM59vyNE9QT0uHVSxC7AR/t0nxkC5UBPyDrP5IESe6yov3Z
 QZXQm15vWE/bOCCEnx41E9OYZ9xWkBUUIIVUvtaYzpwHWd6IgjhkSpdQTVipezf/hEyg
 SGgrVt7ywaGxiC1cwB+w8sywL2t1qbLMBE92S+mouAHF2h/SqCS3RalaYBdUiyzzcK2b
 +PuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248802; x=1685840802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFpeSydLToeDkFGGhok1argALURBxwBUe50hDHY5hQY=;
 b=XOfLm24cvJcBfn1GMsstWok1GUzws29gBKTC/Op7TWVMWy0mcoX5r7SfRyHeLadE6E
 Ae9wVL9uTic86ICOnNvij4GIeAOY806S3LL4NioTSsLIfz8pPUz0uyJOElsSqW6kfHCb
 emcsLnHFTMWzZYgtHLJzZVl1Br5pL0huTOG4qnXJprjYhIja4OyUmQq2lI+SOG1Dp5jT
 /hvkmUjxnDUwdKlVIgb9R3s5fvv00jVfnWcu8AVs0YKr9kfV8LI+h+5m/ixOM2v2R8wG
 sbJYCBO55cH3St1/rZ64k4aAi1c8gITrfoO7DRZCFJ3aWEkKKj0xvP6F0K2R9S06AX4u
 XFWQ==
X-Gm-Message-State: AC+VfDyV2fW1g/6fO2qYScNgsxpkW3MPvPmM5JxqmU/8vXjBZhKjQ5ob
 dSLPaoIb8ecIVwwIRh4br2dgQkD0phf7pw==
X-Google-Smtp-Source: ACHHUZ467P5cRxilfPTmVDzaSweCng+v3hYPAJQ+78ogkquIhDdht5+BnB33CK88PLRsfYlnRqr10A==
X-Received: by 2002:a17:902:ec8c:b0:1aa:f3c4:7582 with SMTP id
 x12-20020a170902ec8c00b001aaf3c47582mr7720516plg.31.1683248802624; 
 Thu, 04 May 2023 18:06:42 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:42 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 60/89] target/riscv: Encode the FS and VS on a normal way for
 tb flags
Date: Fri,  5 May 2023 11:02:12 +1000
Message-Id: <20230505010241.21812-61-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reuse the MSTATUS_FS and MSTATUS_VS for the tb flags positions is not a
normal way.

It will make it hard to change the tb flags layout. And even worse, if we
want to keep tb flags for a same extension togather without a hole.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20230324143031.1093-4-zhiwei_liu@linux.alibaba.com>
[rth: Adjust trans_rvf.c.inc as well; use the typedef]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-4-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-4-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      | 15 ++++++------
 target/riscv/cpu_helper.c               | 11 +++++----
 target/riscv/translate.c                | 32 +++++++++++--------------
 target/riscv/insn_trans/trans_rvf.c.inc |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  8 +++----
 5 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ba11279716..51d39687fe 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -631,18 +631,17 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
 #define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
-#define TB_FLAGS_MSTATUS_FS MSTATUS_FS
-#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
-FIELD(TB_FLAGS, LMUL, 3, 3)
-FIELD(TB_FLAGS, SEW, 6, 3)
-/* Skip MSTATUS_VS (0x600) bits */
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 11, 1)
-FIELD(TB_FLAGS, VILL, 12, 1)
-/* Skip MSTATUS_FS (0x6000) bits */
+FIELD(TB_FLAGS, FS, 3, 2)
+/* Vector flags */
+FIELD(TB_FLAGS, VS, 5, 2)
+FIELD(TB_FLAGS, LMUL, 7, 3)
+FIELD(TB_FLAGS, SEW, 10, 3)
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
+FIELD(TB_FLAGS, VILL, 14, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 15, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1d90977d46..8412ef26ee 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -79,16 +79,17 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 
 #ifdef CONFIG_USER_ONLY
-    flags |= TB_FLAGS_MSTATUS_FS;
-    flags |= TB_FLAGS_MSTATUS_VS;
+    flags = FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
+    flags = FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
 #else
     flags |= cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
-        flags |= env->mstatus & MSTATUS_FS;
+        flags = FIELD_DP32(flags, TB_FLAGS, FS,
+                           get_field(env->mstatus, MSTATUS_FS));
     }
-
     if (riscv_cpu_vector_enabled(env)) {
-        flags |= env->mstatus & MSTATUS_VS;
+        flags = FIELD_DP32(flags, TB_FLAGS, VS,
+                           get_field(env->mstatus, MSTATUS_VS));
     }
 
     if (riscv_has_ext(env, RVH)) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ebd00529ff..411e771e6f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -64,10 +64,10 @@ typedef struct DisasContext {
     RISCVMXL xl;
     uint32_t misa_ext;
     uint32_t opcode;
-    uint32_t mstatus_fs;
-    uint32_t mstatus_vs;
-    uint32_t mstatus_hs_fs;
-    uint32_t mstatus_hs_vs;
+    RISCVExtStatus mstatus_fs;
+    RISCVExtStatus mstatus_vs;
+    RISCVExtStatus mstatus_hs_fs;
+    RISCVExtStatus mstatus_hs_vs;
     uint32_t mem_idx;
     /*
      * Remember the rounding mode encoded in the previous fp instruction,
@@ -601,8 +601,6 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
 
 #ifndef CONFIG_USER_ONLY
 /*
- * The states of mstatus_fs are:
- * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
  * We will have already diagnosed disabled state,
  * and need to turn initial/clean into dirty.
  */
@@ -614,9 +612,9 @@ static void mark_fs_dirty(DisasContext *ctx)
         return;
     }
 
-    if (ctx->mstatus_fs != MSTATUS_FS) {
+    if (ctx->mstatus_fs != EXT_STATUS_DIRTY) {
         /* Remember the state change for the rest of the TB. */
-        ctx->mstatus_fs = MSTATUS_FS;
+        ctx->mstatus_fs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
@@ -624,9 +622,9 @@ static void mark_fs_dirty(DisasContext *ctx)
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
+    if (ctx->virt_enabled && ctx->mstatus_hs_fs != EXT_STATUS_DIRTY) {
         /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_fs = MSTATUS_FS;
+        ctx->mstatus_hs_fs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
@@ -640,8 +638,6 @@ static inline void mark_fs_dirty(DisasContext *ctx) { }
 
 #ifndef CONFIG_USER_ONLY
 /*
- * The states of mstatus_vs are:
- * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
  * We will have already diagnosed disabled state,
  * and need to turn initial/clean into dirty.
  */
@@ -649,9 +645,9 @@ static void mark_vs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
 
-    if (ctx->mstatus_vs != MSTATUS_VS) {
+    if (ctx->mstatus_vs != EXT_STATUS_DIRTY) {
         /* Remember the state change for the rest of the TB.  */
-        ctx->mstatus_vs = MSTATUS_VS;
+        ctx->mstatus_vs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
@@ -659,9 +655,9 @@ static void mark_vs_dirty(DisasContext *ctx)
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_vs != MSTATUS_VS) {
+    if (ctx->virt_enabled && ctx->mstatus_hs_vs != EXT_STATUS_DIRTY) {
         /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_vs = MSTATUS_VS;
+        ctx->mstatus_hs_vs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
@@ -1168,8 +1164,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
-    ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
-    ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
+    ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
+    ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
     ctx->priv_ver = env->priv_ver;
     ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
     ctx->misa_ext = env->misa_ext;
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 9e9fa2087a..b2de4fcf3f 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -19,7 +19,7 @@
  */
 
 #define REQUIRE_FPU do {\
-    if (ctx->mstatus_fs == 0) \
+    if (ctx->mstatus_fs == EXT_STATUS_DISABLED) \
         if (!ctx->cfg_ptr->ext_zfinx) \
             return false; \
 } while (0)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ca3c4c1a3d..ecbdf1b3d7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -29,12 +29,12 @@ static inline bool is_overlapped(const int8_t astart, int8_t asize,
 
 static bool require_rvv(DisasContext *s)
 {
-    return s->mstatus_vs != 0;
+    return s->mstatus_vs != EXT_STATUS_DISABLED;
 }
 
 static bool require_rvf(DisasContext *s)
 {
-    if (s->mstatus_fs == 0) {
+    if (s->mstatus_fs == EXT_STATUS_DISABLED) {
         return false;
     }
 
@@ -52,7 +52,7 @@ static bool require_rvf(DisasContext *s)
 
 static bool require_scale_rvf(DisasContext *s)
 {
-    if (s->mstatus_fs == 0) {
+    if (s->mstatus_fs == EXT_STATUS_DISABLED) {
         return false;
     }
 
@@ -70,7 +70,7 @@ static bool require_scale_rvf(DisasContext *s)
 
 static bool require_scale_rvfmin(DisasContext *s)
 {
-    if (s->mstatus_fs == 0) {
+    if (s->mstatus_fs == EXT_STATUS_DISABLED) {
         return false;
     }
 
-- 
2.40.0


