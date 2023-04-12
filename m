Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E26DF44D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:53:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYte-0005lH-QZ; Wed, 12 Apr 2023 07:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt8-0004kh-4u
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt4-0002OM-1w
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:44 -0400
Received: by mail-wr1-x430.google.com with SMTP id s12so2104068wrb.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299820; x=1683891820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AmmNXj22HP7KMuzDURhipUP2NYBo1bwlMxGUrM5ujg4=;
 b=JYxktg14OyscHvAJSlWTTTMGJoWJab/Pv42K4KJzZYMTdfQHZkBqhiam+/nHG9/1Kb
 zqQmsGBvCIDo26AQY/2H7ehJIC286cEdZEzxp6ULD5UQsAwBMN5DcU7hICY0BTs4F7vX
 4HRgFBAVE5/RMEeb9fr5S7Sk969lHxW/zoJHhO5FujSBBSq9XpZzwHz/zK/iDZAaV42p
 EGkVpJEyjHxKLarB7wVe94Ys6/l8zO4E5tQCfMgR7pqmRXSdsdwpBaEYOG6OTbIG+ru2
 aWDHROFHbbv7cah2aXMDF8qcW1JJNb+YFyZGrUR055NUxnih7sygK7e4qdis75wDFlHg
 kNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299820; x=1683891820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AmmNXj22HP7KMuzDURhipUP2NYBo1bwlMxGUrM5ujg4=;
 b=2iCu3WXVzg9ikqGVWiuEvL8j8T1qs20PV9HLH4GHBi7zz1Ml24bvaXwaUKwYbSsrsw
 F35HkdRr6zM2xSoffAyKIcAhyS4GFVm1ZNoeKyN90erSpCPbyz6tpncsuKeivcU9rXp2
 K85W0FFwA5+GaMFgg6UBqFyfATuhe+/hLU9ACgUJL9H46a1doQmtWEU/s4jcO8AWXgKS
 CSxnlqFtoUptCC2THS4PSRUiELru7btrgB5V8LMusSN41lmlxMy9DalHdvb7wAW+Vj/r
 W3t8TiJ3dOS9pUsm1q2WnCc/UEAGlOrqVdRUAa/CMrzsVof4rae06HaIYVONASoMJmt7
 TDXg==
X-Gm-Message-State: AAQBX9d0bUNumfy31lK5UJIKsLmSz/fmgT9CkaHvaD/hSlJ7I4h7M0SE
 fG5V6jkTggpAZcNNyTOtN4KOjREZ/fRQxdF2qXYQzvm5
X-Google-Smtp-Source: AKy350bS17pNkKhRKU9MhNTKrRPWregoNroRduIxpAB8VWimeMKiS5hGyoyCKfKBv16Sq6DfMx5oUg==
X-Received: by 2002:adf:db47:0:b0:2f2:4db4:1f5b with SMTP id
 f7-20020adfdb47000000b002f24db41f5bmr4751710wrj.29.1681299820519; 
 Wed, 12 Apr 2023 04:43:40 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org, Fei Wu <fei2.wu@intel.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 06/25] target/riscv: Separate priv from mmu_idx
Date: Wed, 12 Apr 2023 13:43:14 +0200
Message-Id: <20230412114333.118895-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-7-richard.henderson@linaro.org>
---
 target/riscv/cpu.h                             |  2 +-
 target/riscv/cpu_helper.c                      |  4 +++-
 target/riscv/translate.c                       |  2 ++
 target/riscv/insn_trans/trans_privileged.c.inc |  2 +-
 target/riscv/insn_trans/trans_xthead.c.inc     | 14 +-------------
 5 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 786ad047ee..9b971ee1b0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -629,7 +629,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 
 #include "exec/cpu-all.h"
@@ -656,6 +655,7 @@ FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
 FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
+FIELD(TB_FLAGS, PRIV, 25, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7579e83c3d..36d6e422d7 100644
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
@@ -751,7 +753,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
+    int mode = env->priv;
     bool use_background = false;
     hwaddr ppn;
     int napot_bits = 0;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3ab8a9999e..6d59348f0c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,6 +67,7 @@ typedef struct DisasContext {
     RISCVExtStatus mstatus_fs;
     RISCVExtStatus mstatus_vs;
     uint32_t mem_idx;
+    uint32_t priv;
     /*
      * Remember the rounding mode encoded in the previous fp instruction,
      * which we have already installed into env->fp_status.  Or -1 for
@@ -1153,6 +1154,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t tb_flags = ctx->base.tb->flags;
 
     ctx->pc_succ_insn = ctx->base.pc_first;
+    ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
     ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index e3bee971c6..7c2837194c 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
      * that no exception will be raised when fetching them.
      */
 
-    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
+    if (semihosting_enabled(ctx->priv == PRV_U) &&
         (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
         pre    = opcode_at(&ctx->base, pre_addr);
         ebreak = opcode_at(&ctx->base, ebreak_addr);
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index df504c3f2c..3e13b1d74d 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -263,25 +263,13 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
 
 /* XTheadCmo */
 
-static inline int priv_level(DisasContext *ctx)
-{
-#ifdef CONFIG_USER_ONLY
-    return PRV_U;
-#else
-     /* Priv level is part of mem_idx. */
-    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
-#endif
-}
-
 /* Test if priv level is M, S, or U (cannot fail). */
 #define REQUIRE_PRIV_MSU(ctx)
 
 /* Test if priv level is M or S. */
 #define REQUIRE_PRIV_MS(ctx)                                    \
 do {                                                            \
-    int priv = priv_level(ctx);                                 \
-    if (!(priv == PRV_M ||                                      \
-          priv == PRV_S)) {                                     \
+    if (ctx->priv == PRV_U) {                                   \
         return false;                                           \
     }                                                           \
 } while (0)
-- 
2.34.1


