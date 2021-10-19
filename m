Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54921433C7C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:38:03 +0200 (CEST)
Received: from localhost ([::1]:35686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcs7m-0002cS-EV
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyz-0004zr-0m
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:53 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyq-0007Vo-Pe
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:52 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 21so13879311plo.13
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JntjpE4dbZf2jEil4I0MzTIE4C49WVyfW1GrdUDx7w8=;
 b=OcCIzw7oGYWY9GrAUfdi794NtZbx7jvaAYPsc45Qs1QDBGaoD1fyQqlP9/gXf5HMSU
 iiTBfOQVvJpH4nHUWfTqJVWxntK3r9hp7F0HuKWY79tEqGFGQzMn5GapZkOvdeoPUEQ5
 Wjc54wRyOi8aVH827qbyXTJyII6Lrw2DX8vaKv45h0aHFfa86p788G7NfP/2QkATM1O5
 GDhnfffLlCew/vEP3rcxipMbGdGhUC/yKnU7aO5k5C22t7yl5fgZeLTgrMDAzO3eyvlL
 mn5VR3nWG7qVA9orCZuG+by+BZLectcpN2LZhtRo3TxnovmCGWB2yudQIlfSO8sJqcci
 1ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JntjpE4dbZf2jEil4I0MzTIE4C49WVyfW1GrdUDx7w8=;
 b=hv/257544Zjvzy4Y6UmEvf9H7cOwh6mXKjCFUkItc2ArJOsM2sHbRmAN1pnM2EW3LK
 gbrxraNqqwuLY88+l0r+0v4VPb+X+ICCrq84ftynswRs3MkJ2K6d0YZA3GsD7BzvuS0b
 QITTGUK9ugdE2qLEu4w3Zn1U2pQkQF86rN8cr1Ws0P9QfcyxoIr6lf8jZrVORpjx+Yps
 mSrYEGn0m2pbqo236RA+bUY2WdjCL+NN1awBpRVGDuHA0TZySbBExtLxP/5sYH9ujbwE
 jLMrxk6qvOLBMT5MyJPoUKzBB9suyM7ZfwciSCjQyK18ruZNqeaIwfhZWtb7neBBjGKZ
 fK0g==
X-Gm-Message-State: AOAM533fPHLxGerSCgw3QKcLbp3aN5StPpR/+8iFw9nfaqPPETpz6tlG
 5Xj3rPOLEO1qWu+mOYoijz7XDhjYsRgAkQ==
X-Google-Smtp-Source: ABdhPJx9ExjKpwV3bDF6R3US2DAr90vWXwEssZnLvJ9A4x7z0SI89vwE903OzG7yifpC6VVqTd/g9A==
X-Received: by 2002:a17:902:d488:b0:13f:165e:f491 with SMTP id
 c8-20020a170902d48800b0013f165ef491mr34260561plg.12.1634657083294; 
 Tue, 19 Oct 2021 08:24:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/16] target/riscv: Add MXL/SXL/UXL to TB_FLAGS
Date: Tue, 19 Oct 2021 08:24:27 -0700
Message-Id: <20211019152438.269077-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Begin adding support for switching XLEN at runtime.  Extract the
effective XLEN from MISA and MSTATUS and store for use during translation.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu.c        |  8 ++++++++
 target/riscv/cpu_helper.c | 33 +++++++++++++++++++++++++++++++++
 target/riscv/csr.c        |  3 +++
 target/riscv/translate.c  |  2 +-
 5 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0e82135a9..c24bc9a039 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -395,6 +395,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
+/* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
+FIELD(TB_FLAGS, XL, 12, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1857670a69..4e1920d5f0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -355,6 +355,14 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->misa_mxl = env->misa_mxl_max;
     env->priv = PRV_M;
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
+    if (env->misa_mxl > MXL_RV32) {
+        /*
+         * The reset status of SXL/UXL is undefined, but mstatus is WARL
+         * and we must ensure that the value after init is valid for read.
+         */
+        env->mstatus = set_field(env->mstatus, MSTATUS64_SXL, env->misa_mxl);
+        env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
+    }
     env->mcause = 0;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 403f54171d..429afd1f48 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,6 +35,37 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
+static RISCVMXL cpu_get_xl(CPURISCVState *env)
+{
+#if defined(TARGET_RISCV32)
+    return MXL_RV32;
+#elif defined(CONFIG_USER_ONLY)
+    return MXL_RV64;
+#else
+    RISCVMXL xl = riscv_cpu_mxl(env);
+
+    /*
+     * When emulating a 32-bit-only cpu, use RV32.
+     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
+     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
+     * back to RV64 for lower privs.
+     */
+    if (xl != MXL_RV32) {
+        switch (env->priv) {
+        case PRV_M:
+            break;
+        case PRV_U:
+            xl = get_field(env->mstatus, MSTATUS64_UXL);
+            break;
+        default: /* PRV_S | PRV_H */
+            xl = get_field(env->mstatus, MSTATUS64_SXL);
+            break;
+        }
+    }
+    return xl;
+#endif
+}
+
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -78,6 +109,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 #endif
 
+    flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
+
     *pflags = flags;
 }
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9c0753bc8b..c4a479ddd2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -526,6 +526,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
     } else {
         mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
+        /* SXL and UXL fields are for now read only */
+        mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
+        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
     }
     env->mstatus = mstatus;
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 66857732e8..f7634c175a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -514,7 +514,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #else
     ctx->virt_enabled = false;
 #endif
-    ctx->xl = env->misa_mxl;
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
@@ -526,6 +525,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
     ctx->w = false;
     ctx->ntemp = 0;
-- 
2.25.1


