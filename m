Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E03F51B9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:11:18 +0200 (CEST)
Received: from localhost ([::1]:40290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIGHt-00087y-JE
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG32-0006jF-T0
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:56 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2r-0003CI-Gw
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:56 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 7so16304350pfl.10
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPUqcH3cpI6t1i60pppvSJvGJu0DnZIEcmcBy7aISZQ=;
 b=t9ToEx9DR9F7DJkuZ/1IaHIg/uiD5lGJOactck6Cgn1prq7Hv2A8Lj12h+tw/4vNuc
 MMB548QwD4gseslrdF0EvLsRbFsGwcjabuhn+5EIoiTQUDuP96/QlhojHg3vpTx0R8+n
 bBxghASwpIa/dKPIFj4ngF9wbJ0h2QyWBZmsTbFtTYvRMFXTP4yhcLnahE2ewWc+J1ab
 mX8PK2wSgq3X+cZJoE5gU0icwuPlJwa+DlIp6X5UCVKEnYfc9DDnIOAhJmnOkyGxBSGO
 ttW3l/gyt0cE+U6tHdh/+FCOvpSfSBbjqeixPOz0A2wmVu2ubnfmrY0orLf7rQeb0a12
 qpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPUqcH3cpI6t1i60pppvSJvGJu0DnZIEcmcBy7aISZQ=;
 b=SZTpHxJIHv/j/Z2vkra1+OOTMvjNOoLoOK3ow6v+ca0gvi115EyueJob+gI11vvDHw
 xUWbS2b2dxOpK5EO5wc4HUa6wZatmwUXgDTl2YYKHMK98TSds/i0dnY1Aev3SEHF6VzE
 UazCzkMrreYMIlIqPj2/ATKX6CtxCC9cJXA+jNE++PFge3bUi9iqInoe7jKrJ98WwSgX
 7zHCZqS421uP1fIPHPwuYpRR3dyVEHcLy5rcVJpipy+A2A5iXx1BnC/ky7T3wKr3zohk
 OrfI9jKIAvsLL+CES0arEjT4Xnwveph47q9ynvG4aWfqd4QsfQPyRFN7NxOT0hDREgXc
 51iA==
X-Gm-Message-State: AOAM533NoYaXPyWHuOhFxQEVS5SkGHLpQLkI7iErBPrRE9ou+1f3jKwv
 4tZ2weyVXf8bI+VkOPf3NTZ1l7wkAs+M5A==
X-Google-Smtp-Source: ABdhPJxCTBiq90sWgWV/mS1viLFpYM7a7WEu1nIDFMFrG+a4Ke0YEkFIeWEgH+fLbNjnsRUmiiBA1Q==
X-Received: by 2002:a62:be04:0:b029:3e0:3fca:2a8f with SMTP id
 l4-20020a62be040000b02903e03fca2a8fmr35161385pff.12.1629748543765; 
 Mon, 23 Aug 2021 12:55:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/24] target/riscv: Reorg csr instructions
Date: Mon, 23 Aug 2021 12:55:23 -0700
Message-Id: <20210823195529.560295-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce csrr and csrw helpers, for read-only and write-only insns.

Note that we do not properly implement this in riscv_csrrw, in that
we cannot distinguish true read-only (rs1 == 0) from any other zero
write_mask another source register -- this should still raise an
exception for read-only registers.

Only issue gen_io_start for CF_USE_ICOUNT.
Use ctx->zero for csrrc.
Use get_gpr and dest_gpr.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |   6 +-
 target/riscv/op_helper.c                |  18 +--
 target/riscv/insn_trans/trans_rvi.c.inc | 172 +++++++++++++++++-------
 3 files changed, 131 insertions(+), 65 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 415e37bc37..460eee9988 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -65,9 +65,9 @@ DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Special functions */
-DEF_HELPER_3(csrrw, tl, env, tl, tl)
-DEF_HELPER_4(csrrs, tl, env, tl, tl, tl)
-DEF_HELPER_4(csrrc, tl, env, tl, tl, tl)
+DEF_HELPER_2(csrr, tl, env, int)
+DEF_HELPER_3(csrw, void, env, int, tl)
+DEF_HELPER_4(csrrw, tl, env, int, tl, tl)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(sret, tl, env, tl)
 DEF_HELPER_2(mret, tl, env, tl)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 3c48e739ac..ee7c24efe7 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -37,11 +37,10 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
     riscv_raise_exception(env, exception, 0);
 }
 
-target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
-        target_ulong csr)
+target_ulong helper_csrr(CPURISCVState *env, int csr)
 {
     target_ulong val = 0;
-    RISCVException ret = riscv_csrrw(env, csr, &val, src, -1);
+    RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
@@ -49,23 +48,20 @@ target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
     return val;
 }
 
-target_ulong helper_csrrs(CPURISCVState *env, target_ulong src,
-        target_ulong csr, target_ulong rs1_pass)
+void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
 {
-    target_ulong val = 0;
-    RISCVException ret = riscv_csrrw(env, csr, &val, -1, rs1_pass ? src : 0);
+    RISCVException ret = riscv_csrrw(env, csr, NULL, src, -1);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
     }
-    return val;
 }
 
-target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
-        target_ulong csr, target_ulong rs1_pass)
+target_ulong helper_csrrw(CPURISCVState *env, int csr,
+                          target_ulong src, target_ulong write_mask)
 {
     target_ulong val = 0;
-    RISCVException ret = riscv_csrrw(env, csr, &val, 0, rs1_pass ? src : 0);
+    RISCVException ret = riscv_csrrw(env, csr, &val, src, write_mask);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 76454fb7e2..920ae0edb3 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -426,80 +426,150 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
     return true;
 }
 
-#define RISCV_OP_CSR_PRE do {\
-    source1 = tcg_temp_new(); \
-    csr_store = tcg_temp_new(); \
-    dest = tcg_temp_new(); \
-    rs1_pass = tcg_temp_new(); \
-    gen_get_gpr(ctx, source1, a->rs1); \
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next); \
-    tcg_gen_movi_tl(rs1_pass, a->rs1); \
-    tcg_gen_movi_tl(csr_store, a->csr); \
-    gen_io_start();\
-} while (0)
+static bool do_csr_post(DisasContext *ctx)
+{
+    /* We may have changed important cpu state -- exit to main loop. */
+    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    exit_tb(ctx);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
 
-#define RISCV_OP_CSR_POST do {\
-    gen_set_gpr(ctx, a->rd, dest); \
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
-    exit_tb(ctx); \
-    ctx->base.is_jmp = DISAS_NORETURN; \
-    tcg_temp_free(source1); \
-    tcg_temp_free(csr_store); \
-    tcg_temp_free(dest); \
-    tcg_temp_free(rs1_pass); \
-} while (0)
+static bool do_csrr(DisasContext *ctx, int rd, int rc)
+{
+    TCGv dest = dest_gpr(ctx, rd);
+    TCGv_i32 csr = tcg_constant_i32(rc);
 
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrr(dest, cpu_env, csr);
+    gen_set_gpr(ctx, rd, dest);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrw(DisasContext *ctx, int rc, TCGv src)
+{
+    TCGv_i32 csr = tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrw(cpu_env, csr, src);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrrw(DisasContext *ctx, int rd, int rc, TCGv src, TCGv mask)
+{
+    TCGv dest = dest_gpr(ctx, rd);
+    TCGv_i32 csr = tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrrw(dest, cpu_env, csr, src, mask);
+    gen_set_gpr(ctx, rd, dest);
+    return do_csr_post(ctx);
+}
 
 static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrw(dest, cpu_env, source1, csr_store);
-    RISCV_OP_CSR_POST;
-    return true;
+    TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    /*
+     * If rd == 0, the insn shall not read the csr, nor cause any of the
+     * side effects that might occur on a csr read.
+     */
+    if (a->rd == 0) {
+        return do_csrw(ctx, a->csr, src);
+    }
+
+    TCGv mask = tcg_constant_tl(-1);
+    return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
 static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrs(dest, cpu_env, source1, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 == 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 == 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv ones = tcg_constant_tl(-1);
+    TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
+    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
 }
 
 static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrc(dest, cpu_env, source1, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 == 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 == 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
+    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
 }
 
 static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrw(dest, cpu_env, rs1_pass, csr_store);
-    RISCV_OP_CSR_POST;
-    return true;
+    TCGv src = tcg_constant_tl(a->rs1);
+
+    /*
+     * If rd == 0, the insn shall not read the csr, nor cause any of the
+     * side effects that might occur on a csr read.
+     */
+    if (a->rd == 0) {
+        return do_csrw(ctx, a->csr, src);
+    }
+
+    TCGv mask = tcg_constant_tl(-1);
+    return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
 static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrs(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 == 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 == 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv ones = tcg_constant_tl(-1);
+    TCGv mask = tcg_constant_tl(a->rs1);
+    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
 }
 
 static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrc(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 == 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 == 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv mask = tcg_constant_tl(a->rs1);
+    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
 }
-- 
2.25.1


