Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EBD4343C9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:19:45 +0200 (CEST)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md28m-00013k-FW
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26R-0006lK-Vk
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:19 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26O-00011C-P8
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:19 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v20so15117120plo.7
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qtBU67E2VBBOP7+0Zsl17oOFCJ6wQGkRCeveFWurByw=;
 b=t0+RLheNgJASdHntBzIPgiMHe8xuoErTJNIVTY/d/s5PKm0EPpkl0pbIXuAaQEfyMK
 lFcMqeHjohCyXOFAVBomuSOnpDpt1uo0KuOfBblmUy5zjA7Hq0gaHzIX73rHR4aAzNzY
 svHAuoVmI+LoCGcovh387+SrvfGm3DYli3DBe1P0pQLp3PGIMQ1QEqH15kGkfP5Eoi04
 Gpb3+EFi0bPDDKI5KxqnlKHJyOOLK59jQAJBf+kce3uUy32X96RlV4LmlwryYheGkMK1
 y4zXH6wEPOKxJlG5fE5n6U8ND/QkE/xTqi0BjHcRi0q6VKEhLUxCNxI8rFL0CiOh63O+
 Y+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtBU67E2VBBOP7+0Zsl17oOFCJ6wQGkRCeveFWurByw=;
 b=PMUDtNIWgoqT5j1p+B0HXNTfZdmLfhqUO66pStaUPufT8JLO462l7oGs9se/k8383O
 Qifvlx0f/TsW8lPJWw67ryXNiXHht0bWNS+WtEq8ujQC+pzcqt1xqzEA8/6xbO6Ib4R4
 rBxIeJ6Y4z2JkLIizzlhX/lEot0HL98OKskg2PymreF04ioRu6L7MWgeoMRNqwkJEXD6
 cw3SNrzAoWf+6DnSUwOZJHe6iSRuJZd8D6CarFH3KomcTjMn1Xd2ynknladTCjPDuHIT
 wvEypBOqQzho6HNe4N4E1uQPBlpe/+GUdtW964XPZ3cnyfCfJUGIryziXAGq9PcgjiHS
 Vl4w==
X-Gm-Message-State: AOAM532Gmj/2LKJI504gHjAN4iX4ZjLuCW71By3TYWo/vPRCs8IKT2DB
 9URSN1iqXcHd2E8IcSahg32rrY5nWXA=
X-Google-Smtp-Source: ABdhPJzZrb/ocCOiN3KxJk4r2cMvVhNcDYGBk6TNgyPvULpVfh3vSzQEcl8wGcx872U0bUKCO4XnFw==
X-Received: by 2002:a17:90a:b783:: with SMTP id
 m3mr4405103pjr.183.1634699834613; 
 Tue, 19 Oct 2021 20:17:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/15] target/riscv: Add MXL/SXL/UXL to TB_FLAGS
Date: Tue, 19 Oct 2021 20:16:59 -0700
Message-Id: <20211020031709.359469-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
index bce8fe7ebb..babe271e53 100644
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


