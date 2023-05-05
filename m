Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A86F7A99
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujuQ-0006xD-94; Thu, 04 May 2023 21:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuM-0006tF-KH
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuJ-0007gH-OQ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:50 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aaf7067647so8241935ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248806; x=1685840806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhmk5Jx0OAmTzZeJbqXjEcRvnQOSauhU+b8PthDHgjA=;
 b=ZZW0S70Wl7rVk7eQH+/HLNWYSfKADjFGIE20xvz/wodgy/suckgNidXrjxRTmG9+07
 1qKlRuYIOxPirmFWwHeFmcOSNUZLZKbNR7LXKxIGncgl9MlARw30EOmZGsTfXtPLrQ44
 Tfc6fhXuorqBiZEoZME1tbIu2/nu3dLKldCs11ysYjryp9d+C2mGlVW74+P5BS07drEb
 s/bsLsT/34sJckp3DRrDwU3gZjXbHuK/y7nuEKY5QLaszvcBaZs7AUui7VTFlyJtn7IO
 dKHimmhBoTUBholpku2Vt49CJ98oVtWcIdWtgECzMkrUuueW6ECpShsbP3WXtjQ5Zdip
 wghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248806; x=1685840806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uhmk5Jx0OAmTzZeJbqXjEcRvnQOSauhU+b8PthDHgjA=;
 b=J+u+hFwCosHvt8oaWxzaVn6v721hBfRcSE/vMOnYRNrrhgvyoGfDenL5oBohBGhLu+
 dPagtzQL+g71XgymA5dti/yNGDtUZlyH5YN9wBkqydtlzWqqeJqciSguSxuBbsR88HCV
 XzJ4huL5t681sjaqzVMEeFOVSGGzHEbdHvaVms1ptuoJed+9qBhXIDLSp/jtna1yF8kH
 z+9Xo9QExb64lZrP8D0IQ7X1tPghSaYvam04biXiI6tREZidyGdoQasLFkFTwCVAfBwK
 1+qVPiIfp6ahKvRggXBUOGyOK+20TCOMdjR75bIF0CCxwVcnGTTu4AdyUyjMV3//LHTn
 bopw==
X-Gm-Message-State: AC+VfDxx6JVE6UIgNyXXk7nHRLTS0GtQLmJ6oCfu2dhW7YbCwvXsNX8K
 4sZ9dqhFIiXgZxR4CEvu1yFDE5PYhkrsuQ==
X-Google-Smtp-Source: ACHHUZ6kNyGXBZO88G2XdWuaso+JBcLYP08ZvQ6oSDwAFKMCx5xNvbdyhxspThDS37ek11dBhx+5aQ==
X-Received: by 2002:a17:903:120a:b0:1a6:a988:b858 with SMTP id
 l10-20020a170903120a00b001a6a988b858mr6327474plh.58.1683248806515; 
 Thu, 04 May 2023 18:06:46 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:46 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 61/89] target/riscv: Remove mstatus_hs_{fs, vs} from tb_flags
Date: Fri,  5 May 2023 11:02:13 +1000
Message-Id: <20230505010241.21812-62-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Merge with mstatus_{fs,vs}.  We might perform a redundant
assignment to one or the other field, but it's a trivial
and saves 4 bits from TB_FLAGS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-5-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-5-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 16 +++++++---------
 target/riscv/cpu_helper.c | 33 ++++++++++++++++-----------------
 target/riscv/translate.c  | 32 ++++++++++----------------------
 3 files changed, 33 insertions(+), 48 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 51d39687fe..ab64d5f92d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -644,19 +644,17 @@ FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
 FIELD(TB_FLAGS, VILL, 14, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 15, 1)
-FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
-FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
-FIELD(TB_FLAGS, XL, 20, 2)
+FIELD(TB_FLAGS, XL, 16, 2)
 /* If PointerMasking should be applied */
-FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
-FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
-FIELD(TB_FLAGS, VTA, 24, 1)
-FIELD(TB_FLAGS, VMA, 25, 1)
+FIELD(TB_FLAGS, PM_MASK_ENABLED, 18, 1)
+FIELD(TB_FLAGS, PM_BASE_ENABLED, 19, 1)
+FIELD(TB_FLAGS, VTA, 20, 1)
+FIELD(TB_FLAGS, VMA, 21, 1)
 /* Native debug itrigger */
-FIELD(TB_FLAGS, ITRIGGER, 26, 1)
+FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
-FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
+FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8412ef26ee..e3e620137b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -45,7 +45,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 {
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
-
+    RISCVExtStatus fs, vs;
     uint32_t flags = 0;
 
     *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
@@ -79,18 +79,12 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 
 #ifdef CONFIG_USER_ONLY
-    flags = FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
-    flags = FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
+    fs = EXT_STATUS_DIRTY;
+    vs = EXT_STATUS_DIRTY;
 #else
     flags |= cpu_mmu_index(env, 0);
-    if (riscv_cpu_fp_enabled(env)) {
-        flags = FIELD_DP32(flags, TB_FLAGS, FS,
-                           get_field(env->mstatus, MSTATUS_FS));
-    }
-    if (riscv_cpu_vector_enabled(env)) {
-        flags = FIELD_DP32(flags, TB_FLAGS, VS,
-                           get_field(env->mstatus, MSTATUS_VS));
-    }
+    fs = get_field(env->mstatus, MSTATUS_FS);
+    vs = get_field(env->mstatus, MSTATUS_VS);
 
     if (riscv_has_ext(env, RVH)) {
         if (env->priv == PRV_M ||
@@ -100,18 +94,23 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
 
-        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
-                           get_field(env->mstatus_hs, MSTATUS_FS));
-
-        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
-                           get_field(env->mstatus_hs, MSTATUS_VS));
-        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, env->virt_enabled);
+        if (env->virt_enabled) {
+            flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
+            /*
+             * Merge DISABLED and !DIRTY states using MIN.
+             * We will set both fields when dirtying.
+             */
+            fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
+            vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
+        }
     }
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
 #endif
 
+    flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
+    flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
     flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
     if (env->cur_pmmask < (env->xl == MXL_RV32 ? UINT32_MAX : UINT64_MAX)) {
         flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 411e771e6f..3092c942ab 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -66,8 +66,6 @@ typedef struct DisasContext {
     uint32_t opcode;
     RISCVExtStatus mstatus_fs;
     RISCVExtStatus mstatus_vs;
-    RISCVExtStatus mstatus_hs_fs;
-    RISCVExtStatus mstatus_hs_vs;
     uint32_t mem_idx;
     /*
      * Remember the rounding mode encoded in the previous fp instruction,
@@ -620,16 +618,12 @@ static void mark_fs_dirty(DisasContext *ctx)
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
         tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    }
-
-    if (ctx->virt_enabled && ctx->mstatus_hs_fs != EXT_STATUS_DIRTY) {
-        /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_fs = EXT_STATUS_DIRTY;
 
-        tmp = tcg_temp_new();
-        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
-        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        if (ctx->virt_enabled) {
+            tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+            tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
+            tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        }
     }
 }
 #else
@@ -653,16 +647,12 @@ static void mark_vs_dirty(DisasContext *ctx)
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
         tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    }
-
-    if (ctx->virt_enabled && ctx->mstatus_hs_vs != EXT_STATUS_DIRTY) {
-        /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_vs = EXT_STATUS_DIRTY;
 
-        tmp = tcg_temp_new();
-        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
-        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        if (ctx->virt_enabled) {
+            tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+            tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
+            tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        }
     }
 }
 #else
@@ -1171,8 +1161,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->cfg_ptr = &(cpu->cfg);
-    ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
-    ctx->mstatus_hs_vs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-- 
2.40.0


