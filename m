Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F3B4343EA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:38:00 +0200 (CEST)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md2QS-0000SN-3u
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26e-0007SB-5c
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:32 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26U-00018U-Mc
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:31 -0400
Received: by mail-pl1-x629.google.com with SMTP id v20so15117284plo.7
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mc33rRzzUwsbFNZd+/6Yg+kSllYkJDD+UOY7AOL7278=;
 b=EnT9hnu1xg//jt1clHG0lX7QBKd6fv1u4JqUjbXJUIkk0oSQKrUpA3VV7wle1dp5Mp
 uz8B+jQ22jkPof2WrHpPJGzWASMzzqaY3WXGtKaiVjt9+j/xUF4/VEKX0coBEWPRKc/X
 0i1bP3OSmQlhQvMcJzAMPwA2ZEepgXwxuxOzsj38W7INWe8G9lETMhHUjyLf6xY+tcmt
 SbfF+dOocXh4UigpGdu3fw1f7iMI9Xcj5c3FyeYE/i+K0bOPdWWv7GTsz1hRPQuSQd+9
 NlyVpOAyKcAI0S4YxOf1jWH8GlqeHU6kDH29+8tzvuHvp/+TllpPfLHFUMJCoCURApXQ
 XMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mc33rRzzUwsbFNZd+/6Yg+kSllYkJDD+UOY7AOL7278=;
 b=ohj1yQ41JuG0XYu898tuvq/XL84O8l7b36jK6m/jLt7tRR2BgwynkYQoi+5YKWgx8d
 /evFsJBL+2DNYhsO+7FsnmZA8/Gha+v5i8UdjrZ9nHFDS5T2eFHUW6Gil4kMBcGjSYqF
 s31YopzIXgFREOGqtEBcXwpdj4akc19m0pYOYicbu9rhRYx3kJEsCJYYnbE6iImogbFG
 iLFzPzGHqNxG9NcGOvhtTgJBAwGnGLrrmnl4Zspw67BN6UZdeIfE6XiESfE5OIsQWxpf
 xW3fI1gAVm1AY8RRLEnuCCr0ATlgpDSJ/gbW8l1YP/iHaGVryE3ZkWb99FzWo19NdLEY
 yzXw==
X-Gm-Message-State: AOAM530UaI1Izv2LH5IRRm3drQzx+r5nlrxBMR0rIeFYT3hVxaT5QxHF
 50ynlKchtUHlOnO6fLRpcQ5SypD4IzjumA==
X-Google-Smtp-Source: ABdhPJzlN4XVtm8n9p1eh9YB+u1AkDs/34GMaSwPe6GCfFoNbtFai21xGDSsp5NsKM8L1I/XfoWijw==
X-Received: by 2002:a17:90a:ac0a:: with SMTP id
 o10mr4271095pjq.125.1634699841164; 
 Tue, 19 Oct 2021 20:17:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 15/15] target/riscv: Compute mstatus.sd on demand
Date: Tue, 19 Oct 2021 20:17:09 -0700
Message-Id: <20211020031709.359469-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The position of this read-only field is dependent on the current xlen.
Rather than having to compute that difference in many places, compute
it only on read.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c |  3 +--
 target/riscv/csr.c        | 37 ++++++++++++++++++++++---------------
 target/riscv/translate.c  |  5 ++---
 3 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 429afd1f48..0d1132f39d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -185,10 +185,9 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
 
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
-    uint64_t sd = riscv_cpu_mxl(env) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
     uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
-                            MSTATUS64_UXL | sd;
+                            MSTATUS64_UXL;
     bool current_virt = riscv_cpu_virt_enabled(env);
 
     g_assert(riscv_has_ext(env, RVH));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c4a479ddd2..69e4d65fcd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -477,10 +477,28 @@ static RISCVException read_mhartid(CPURISCVState *env, int csrno,
 }
 
 /* Machine Trap Setup */
+
+/* We do not store SD explicitly, only compute it on demand. */
+static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
+{
+    if ((status & MSTATUS_FS) == MSTATUS_FS ||
+        (status & MSTATUS_XS) == MSTATUS_XS) {
+        switch (xl) {
+        case MXL_RV32:
+            return status | MSTATUS32_SD;
+        case MXL_RV64:
+            return status | MSTATUS64_SD;
+        default:
+            g_assert_not_reached();
+        }
+    }
+    return status;
+}
+
 static RISCVException read_mstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
-    *val = env->mstatus;
+    *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus);
     return RISCV_EXCP_NONE;
 }
 
@@ -498,7 +516,6 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 {
     uint64_t mstatus = env->mstatus;
     uint64_t mask = 0;
-    int dirty;
 
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
@@ -520,12 +537,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
-    dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
-            ((mstatus & MSTATUS_XS) == MSTATUS_XS);
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
-    } else {
-        mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
+    if (riscv_cpu_mxl(env) == MXL_RV64) {
         /* SXL and UXL fields are for now read only */
         mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
         mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
@@ -798,13 +810,8 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
 {
     target_ulong mask = (sstatus_v1_10_mask);
 
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        mask |= SSTATUS32_SD;
-    } else {
-        mask |= SSTATUS64_SD;
-    }
-
-    *val = env->mstatus & mask;
+    /* TODO: Use SXL not MXL. */
+    *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0b3da060fd..1d6bf01a48 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -305,7 +305,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd = get_xl(ctx) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
 
     if (ctx->mstatus_fs != MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
@@ -313,7 +312,7 @@ static void mark_fs_dirty(DisasContext *ctx)
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
         tcg_temp_free(tmp);
     }
@@ -324,7 +323,7 @@ static void mark_fs_dirty(DisasContext *ctx)
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
         tcg_temp_free(tmp);
     }
-- 
2.25.1


