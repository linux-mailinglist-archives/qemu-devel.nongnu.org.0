Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EEB412B06
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:04:01 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSV8Z-0003gD-Ls
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mSV7P-0002vK-Ao
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:02:47 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mSV7M-0007dQ-DM
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:02:47 -0400
Received: by mail-pl1-x633.google.com with SMTP id w11so2785045plz.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 19:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dVMXzPwOyaeaAttXl7zgflq14txZYmFH/rS+ZOzgO9Y=;
 b=FOlB+SXwv86iX4tBKivElntaDSLhTy9ozudZu5BfmrLPDgHkbBnDvFYSxjhCopVjFG
 Y1Tiu8jF2U67qckXVmUPavzAVlbL0ssn1zzyEXRvVl98N8/lvp3LIacXzelnC+nSc6im
 toc2wCNG93Vud87BWRnfWJDDdQZHy9DccdAoQPk2+AVPElKR308xJ9KHfP52XWiZ1e/D
 bYMtAAaCyfUpWWPg8/PQL9nT4Hkfo0D79L2abCfU0/pIeCD6ecJ+IAKs77kFa+TqpIYs
 bLFiIqVl9fD5bqCwGX9h5KPaboj2DtwV/v8GzJGmN7TSjLUHDtpb9VFU1Vhl7kipEtwN
 9jQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dVMXzPwOyaeaAttXl7zgflq14txZYmFH/rS+ZOzgO9Y=;
 b=tqddt0q0GpIIbLKzl+V8TjZ8a68YqRkRMIcKa0X6fZ5Dx20j4h2Ib8FA0u0eScFpTG
 mbF3phK2kZfMr2HA5rI1nfusfPVMqJnZ0TWf2oJA16N3LxBzX/xVMuDoGOuU/iO9ts/a
 psUZjryBMX9JNjpTtIh4nEkb9/outOmiI/tCqkty02Z2+z3QPVnQc6QArpgEd3n27oC9
 67AzWLPh6ez2p8eVwNioHfiLW6LZwglCfDT1fwUeNXx6jWuXLBQkze5fpFf6yeYLfKgc
 YtxFBGcyDQJ2F1OoJaVmIi7pfOJU1sOKALOu61/IHu0BVh4m/1PjGtjTRuchRc9dIQ8t
 aKyQ==
X-Gm-Message-State: AOAM5319VzRA4LV6Ep92akXp8spFUY+CZ72lzrZ7LUhBGiA1xG9eSzKr
 qaeAhIsJHL1x9l7QE2iCRi9sh7DS081zfA==
X-Google-Smtp-Source: ABdhPJwB2sxFQCX/Ig63IozjYlLfkSc5rfPc9f+b1o1ExGh8rWKWZdk/htQIUI9Ni2pc/YhuJqHEdA==
X-Received: by 2002:a17:90a:7e90:: with SMTP id
 j16mr2327075pjl.139.1632189761279; 
 Mon, 20 Sep 2021 19:02:41 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id t14sm16264645pga.62.2021.09.20.19.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 19:02:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3] target/riscv: Set mstatus_hs.[SD|FS] bits if Clean and V=1
 in mark_fs_dirty()
Date: Tue, 21 Sep 2021 10:02:33 +0800
Message-Id: <20210921020234.123448-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

When V=1, both vsstauts.FS and HS-level sstatus.FS are in effect.
Modifying the floating-point state when V=1 causes both fields to
be set to 3 (Dirty).

However, it's possible that HS-level sstatus.FS is Clean and VS-level
vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=1.
We can't early return for this case because we still need to set
sstatus.FS to Dirty according to spec.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
Tested-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h       |  4 ++++
 target/riscv/translate.c | 30 +++++++++++++++++-------------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e735e53e26c..bef7c551646 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -394,6 +394,7 @@ FIELD(TB_FLAGS, SEW, 5, 3)
 FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
+FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
@@ -450,6 +451,9 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                 get_field(env->hstatus, HSTATUS_HU))) {
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
+
+        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
+                           get_field(env->mstatus_hs, MSTATUS_FS));
     }
 #endif
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 74b33fa3c90..6be22347426 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -58,6 +58,7 @@ typedef struct DisasContext {
     target_ulong misa;
     uint32_t opcode;
     uint32_t mstatus_fs;
+    uint32_t mstatus_hs_fs;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -280,27 +281,29 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd;
+    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
 
-    if (ctx->mstatus_fs == MSTATUS_FS) {
-        return;
-    }
-    /* Remember the state change for the rest of the TB.  */
-    ctx->mstatus_fs = MSTATUS_FS;
+    if (ctx->mstatus_fs != MSTATUS_FS) {
+        /* Remember the state change for the rest of the TB. */
+        ctx->mstatus_fs = MSTATUS_FS;
 
-    tmp = tcg_temp_new();
-    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+        tmp = tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
+        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+        tcg_temp_free(tmp);
+    }
 
-    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
-    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
+        /* Remember the stage change for the rest of the TB. */
+        ctx->mstatus_hs_fs = MSTATUS_FS;
 
-    if (ctx->virt_enabled) {
+        tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
         tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        tcg_temp_free(tmp);
     }
-    tcg_temp_free(tmp);
 }
 #else
 static inline void mark_fs_dirty(DisasContext *ctx) { }
@@ -533,6 +536,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->vlen = cpu->cfg.vlen;
+    ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-- 
2.25.1


