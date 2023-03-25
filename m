Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B9B6C8E3D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 13:36:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg37O-0002lL-Nf; Sat, 25 Mar 2023 08:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg37M-0002l4-P5
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:35:32 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg37L-00075u-0o
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:35:32 -0400
Received: by mail-il1-x12f.google.com with SMTP id s7so2244142ilv.12
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679747726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HVFynw00QkMtBAf6kqKVA9mPN1V1OBo9eLBJ9wOnHR0=;
 b=UxiMoM3uQ4dQIZiPNs1LjnMi8qq+iQ6KmIqUg3/HhQBozCyHlGLfW8qY2RqUhkBOH8
 S4duVUZuIgTAveBp8pMi4rNyDPrTZiP2FvMy3RyLwxUzIKfzsjiEmJIOmRIgYAVtCDr8
 oZB2EFNinn2AqXXky3LLNLm26gE9lFLxMyIMXRF9Hj7No0eooMgqSBT2GxZdf3NFTUOU
 oMjVUB8pgJs0IHmHCwweNyids2n+l5HlJUWMpnbN3MZibVoXdD+xHLcJXaQKbXe006AE
 cZik80ML943wqnxJw1jtZHG9aS5Q3ZuWRbqmQDXe9YrkEZaEgM4J9uhAAC/fsJQT2vBx
 PtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679747726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HVFynw00QkMtBAf6kqKVA9mPN1V1OBo9eLBJ9wOnHR0=;
 b=Vw+7e1NzucJctoXgFlAadYnxP1hFuDv1rLihWd+wIoKzKmLYloCds75PdHsZ0Sk3Wr
 JgYZehG2kwyKZ68fJfyV68TzYNAbnAm7y6iMRf3I3C/KYwC0tuKALFvFqmKByAGVbx+P
 GY75wa1oNJWviOaH6RkMB3QOb51f4AR874rBV5W8efGOh6JsRgexYlYVCJsgzbAF0fG0
 plvj3xf61VVOr8Xy3hvA04tBAvtAK3qnBQ5j3bQFa03cDpIVJqAiFNNfIMxpJipctrkA
 9C+a/FTFcwBMLqbdfSNb+JqZ/J0sY8mdRiPVj7k/v5no3mkrAgT0aiXQ4sq5K5Hb0EpP
 YAfw==
X-Gm-Message-State: AAQBX9f0XwVZ3Aq8z4oZlidiDt8kyRWKpVqJruXtfbFRuiWDS6wuMzzo
 wQzb51YkzXZYU6rxZr4a4jd+3iMHmH1i+wTfLqg=
X-Google-Smtp-Source: AKy350b40HntvbFgffIzJXnYxG5O+kWnlyL1iT5TK6dUzpgR9/kW97a0Ca/28VAVv+Ur2u/DZIWP1w==
X-Received: by 2002:a17:90b:33ce:b0:23d:4b01:b27 with SMTP id
 lk14-20020a17090b33ce00b0023d4b010b27mr6560678pjb.10.1679741674509; 
 Sat, 25 Mar 2023 03:54:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 04/25] target/riscv: Remove mstatus_hs_{fs,
 vs} from tb_flags
Date: Sat, 25 Mar 2023 03:54:08 -0700
Message-Id: <20230325105429.1142530-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12f.google.com
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

Merge with mstatus_{fs,vs}.  We might perform a redundant
assignment to one or the other field, but it's a trivial
and saves 4 bits from TB_FLAGS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        | 16 +++++++---------
 target/riscv/cpu_helper.c | 34 ++++++++++++++++------------------
 target/riscv/translate.c  | 32 ++++++++++----------------------
 3 files changed, 33 insertions(+), 49 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f787145a21..d9e0eaaf9b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -646,19 +646,17 @@ FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
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
index 1e7ee9aa30..4fdd6fe021 100644
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
-        flags =  FIELD_DP32(flags, TB_FLAGS, FS,
-                            get_field(env->mstatus,  MSTATUS_FS));
-    }
-    if (riscv_cpu_vector_enabled(env)) {
-        flags =  FIELD_DP32(flags, TB_FLAGS, VS,
-                            get_field(env->mstatus, MSTATUS_VS));
-    }
+    fs = get_field(env->mstatus, MSTATUS_FS);
+    vs = get_field(env->mstatus, MSTATUS_VS);
 
     if (riscv_has_ext(env, RVH)) {
         if (env->priv == PRV_M ||
@@ -100,19 +94,23 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
 
-        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
-                           get_field(env->mstatus_hs, MSTATUS_FS));
-
-        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
-                           get_field(env->mstatus_hs, MSTATUS_VS));
-        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED,
-                           get_field(env->virt, VIRT_ONOFF));
+        if (riscv_cpu_virt_enabled(env)) {
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
index b897bf6006..74d0b9889d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -66,8 +66,6 @@ typedef struct DisasContext {
     uint32_t opcode;
     RISCVExtStatus mstatus_fs;
     RISCVExtStatus mstatus_vs;
-    RISCVExtStatus mstatus_hs_fs;
-    RISCVExtStatus mstatus_hs_vs;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -618,16 +616,12 @@ static void mark_fs_dirty(DisasContext *ctx)
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
         tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_fs != EXT_STATUS_DIRTY) {
-        /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_fs = EXT_STATUS_DIRTY;
-
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
@@ -651,16 +645,12 @@ static void mark_vs_dirty(DisasContext *ctx)
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
         tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_vs != EXT_STATUS_DIRTY) {
-        /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_vs = EXT_STATUS_DIRTY;
-
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
@@ -1158,8 +1148,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->cfg_ptr = &(cpu->cfg);
-    ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
-    ctx->mstatus_hs_vs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-- 
2.34.1


