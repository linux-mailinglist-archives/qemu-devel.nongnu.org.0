Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4717842CC6C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 22:58:49 +0200 (CEST)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malKq-0002Vs-B3
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 16:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDa-0007Wm-Ay
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:18 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDU-00086H-Gm
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:15 -0400
Received: by mail-pl1-x629.google.com with SMTP id g5so2665479plg.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 13:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MqhE78TFfZKSqdDQIPLXWw2Iyqlc7crjN8RZq6dg1n8=;
 b=vUOjnY/pxMofKtV3bxDUHUb6P30gY0K+HLEp9m/T5yQ2zMAuwY30I5weKDoSM1g1T6
 qrUyy0uU+AJQ5cNLxnyYVrLu7j9SZvHTxlOQzCy04RXJwAt4K3MVahsmev4jh6lejJXk
 nHCXahgz72ofVR+ffZw8bXqvgPXPMvGZdoKZfmKAn7OhaaWr+ebWu7xEO/1cnNZddQrE
 1JKDhlx2Tha7LOc9j7UYAA9LXNhBLKW0WDF/RAGM/msij5YCoKv/avIQS2yvWAbcIZqG
 tWl2EWnTtYBNrG6uzEvBQ3KZ5A+edQdnO9cAFdMDBDsbxkcJNBjR8HNuFiHo8QN3fh+A
 cDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MqhE78TFfZKSqdDQIPLXWw2Iyqlc7crjN8RZq6dg1n8=;
 b=niJ71PLEyp3mXzZ2dgPNLM7xoyG5wlpK25lTRr03gluw0iVGnOH8l+ga1wGONyCcy0
 J6KzOCCiwHVpxlIIx+gBtJQXiyJ/BVzPV5ktb08CvUgCjR4Hf6yJZCxWun17mABf19K+
 3hSOqQukz8mdO7k+HkZ7bCbDxLbPWG5WhXJnBH3NZQ5XWkP/I+SEkwDMNVURS4lD2bAp
 nh2Y6br7ps036xKVjkiFuUN9rdrsVcHLc/MTj17WyGjbXcz/cxvTdq8PG6IQB5gvKhD1
 r3+s2U+cLs/AhtTTy8SZ40eDewr1y6LbImTii0OrtGLkaea031BCIVQK8N3aWFp5gi1o
 q4VQ==
X-Gm-Message-State: AOAM531Raeh9k6y2ZTPBgtRG/s32vnMRn6DVldjwkFj7KlnqlAltUuaS
 PbTp4HaLSon4Znmm2Tpr72GsvZwnkOXgHg==
X-Google-Smtp-Source: ABdhPJwZNbIBLV3Eje5zerDIolE2xgVO/Q4+2NTXHBtn9IZALSVXDoUpELkNnaVK8JMOaOCQULAJsQ==
X-Received: by 2002:a17:90b:2509:: with SMTP id
 ns9mr16120158pjb.47.1634158271182; 
 Wed, 13 Oct 2021 13:51:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/13] target/riscv: Add MXL/SXL/UXL to TB_FLAGS
Date: Wed, 13 Oct 2021 13:50:56 -0700
Message-Id: <20211013205104.1031679-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Begin adding support for switching XLEN at runtime.  Extract the
effective XLEN from MISA and MSTATUS and store for use during translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Force SXL and UXL to valid values.
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu.c        |  8 ++++++++
 target/riscv/cpu_helper.c | 33 +++++++++++++++++++++++++++++++++
 target/riscv/csr.c        |  3 +++
 target/riscv/translate.c  |  2 +-
 5 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 87248b562a..445ba5b395 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -395,6 +395,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
+/* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
+FIELD(TB_FLAGS, XL, 12, 2)
 
 #ifdef CONFIG_RISCV32
 #define riscv_cpu_mxl(env)      MXL_RV32
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1857670a69..840edd66f8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -355,6 +355,14 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->misa_mxl = env->misa_mxl_max;
     env->priv = PRV_M;
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
+    if (env->misa_mxl > MXL_RV32) {
+        /*
+         * The reset status of SXL/UXL is officially undefined,
+         * but invalid settings would result in a tcg assert.
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
index 422f8ab8d0..7e7bb67d15 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -539,7 +539,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #else
     ctx->virt_enabled = false;
 #endif
-    ctx->xl = env->misa_mxl;
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
@@ -551,6 +550,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
     ctx->w = false;
     ctx->ntemp = 0;
-- 
2.25.1


