Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0763EF4E0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 23:24:00 +0200 (CEST)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG6Yy-0003hb-0Z
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 17:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TS-00013b-5w
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:18:18 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TP-00013Z-5o
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:18:17 -0400
Received: by mail-pf1-x435.google.com with SMTP id i133so5571pfe.12
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 14:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+N8n9CD5JlHUl3qu6GpgI8bJQHM+cEsLsONEBBGfJs=;
 b=xRnPZiA9c9T/70KwiWOKylEEdYs69AXFLq1Huv+Q0NLdF8vTFG+Jk9/KAIfZzHyVjW
 YFo+YMqWT1g1vpUbOFDbfmkXlnMH3k3qDb0Su/f5Yur0W6vX8y6n4jFdIrCQXAKyw4XS
 Ef6m5/EEnw057MgpVZXIiy3G9REbDB6O7L5+JkneDcILzFM2zPS8KPXoNQ9nDpmytKpk
 POeAXDDRUbRgVsslQ2QeX1Cub+oSwXy2YvRU6snQyUZbxFHEeL+yYH6Zp8u/qN1EjJRz
 EB+Aurr19LoafrFvX6bzWcj8cP+95t4Jp3fWPnEFF5v0WmDTqs2lYv3H6leVTlN8WtfK
 Ih3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+N8n9CD5JlHUl3qu6GpgI8bJQHM+cEsLsONEBBGfJs=;
 b=equ1Ep356sXkBR1TPlViNjMB1I/B11MUkklBSQZhiuf6K03YZ4AO/ChApZ3zdmy6L6
 CR6n/vFL+zqoig1auGgBkOYNal+lh1MjH2fMD0d1Z3aMv4CgQrNH/TBnD3V7w3UwYggH
 XLVEZNYuXqXTBs8dSvbsjcsfQS6mi6z9Q0LR5diCyNfFQTjXSMUi+SLQrYc7sqJCUmDa
 y/W64yFc5jDm3VpACaq7aW5W629bLDcNYGlHSKEclJ5D5icJXvBR4on5cYAWyY6s8hG8
 bJOuZXTxQpuMDXlJ1xI3qJtRzVyhv1lIkx6wWfg+bl0eytCxTsn3BrDMb/U8ohv7+vrr
 ukkA==
X-Gm-Message-State: AOAM532E3VpDHFJv3awH/fzpYJkfcJpwv4hDWzszU8bbPgD8LFW1VDSP
 hqJePEXRxK0uF8ImX691Aw4PoSOFFOc+gQ==
X-Google-Smtp-Source: ABdhPJw9jGa5ZpamB91fU04riZfz1WJ3JEnLZ4mTULtlboHMygm9lmYvZ73szLeAE1IQhRRLj7T/kQ==
X-Received: by 2002:a62:1650:0:b0:3e2:15fc:3347 with SMTP id
 77-20020a621650000000b003e215fc3347mr5408526pfw.77.1629235093735; 
 Tue, 17 Aug 2021 14:18:13 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/21] target/riscv: Introduce DisasExtend and new helpers
Date: Tue, 17 Aug 2021 11:17:46 -1000
Message-Id: <20210817211803.283639-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce get_gpr, dest_gpr, temp_new -- new helpers that do not force
tcg globals into temps, returning a constant 0 for $zero as source and
a new temp for $zero as destination.

Introduce ctx->w for simplifying word operations, such as addw.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 102 +++++++++++++++++++++++++++++++--------
 1 file changed, 82 insertions(+), 20 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d540c85a1a..d5cf5e5826 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -39,15 +39,25 @@ static TCGv load_val;
 
 #include "exec/gen-icount.h"
 
+/*
+ * If an operation is being performed on less than TARGET_LONG_BITS,
+ * it may require the inputs to be sign- or zero-extended; which will
+ * depend on the exact operation being performed.
+ */
+typedef enum {
+    EXT_NONE,
+    EXT_SIGN,
+    EXT_ZERO,
+} DisasExtend;
+
 typedef struct DisasContext {
     DisasContextBase base;
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
-    bool virt_enabled;
+    target_ulong misa;
     uint32_t opcode;
     uint32_t mstatus_fs;
-    target_ulong misa;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -55,6 +65,8 @@ typedef struct DisasContext {
        to any system register, which includes CSR_FRM, so we do not have
        to reset this known value.  */
     int frm;
+    bool w;
+    bool virt_enabled;
     bool ext_ifencei;
     bool hlsx;
     /* vector extension */
@@ -64,7 +76,10 @@ typedef struct DisasContext {
     uint16_t vlen;
     uint16_t mlen;
     bool vl_eq_vlmax;
+    uint8_t ntemp;
     CPUState *cs;
+    TCGv zero;
+    TCGv temp[4];
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -172,27 +187,64 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
     }
 }
 
-/* Wrapper for getting reg values - need to check of reg is zero since
- * cpu_gpr[0] is not actually allocated
+/*
+ * Wrappers for getting reg values.
+ *
+ * The $zero register does not have cpu_gpr[0] allocated -- we supply the
+ * constant zero as a source, and an uninitialized sink as destination.
+ *
+ * Further, we may provide an extension for word operations.
  */
-static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
+static TCGv temp_new(DisasContext *ctx)
 {
-    if (reg_num == 0) {
-        tcg_gen_movi_tl(t, 0);
-    } else {
-        tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
-    }
+    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
+    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
 }
 
-/* Wrapper for setting reg values - need to check of reg is zero since
- * cpu_gpr[0] is not actually allocated. this is more for safety purposes,
- * since we usually avoid calling the OP_TYPE_gen function if we see a write to
- * $zero
- */
-static void gen_set_gpr(DisasContext *ctx, int reg_num_dst, TCGv t)
+static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
 {
-    if (reg_num_dst != 0) {
-        tcg_gen_mov_tl(cpu_gpr[reg_num_dst], t);
+    TCGv t;
+
+    if (reg_num == 0) {
+        return ctx->zero;
+    }
+
+    switch (ctx->w ? ext : EXT_NONE) {
+    case EXT_NONE:
+        return cpu_gpr[reg_num];
+    case EXT_SIGN:
+        t = temp_new(ctx);
+        tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
+        return t;
+    case EXT_ZERO:
+        t = temp_new(ctx);
+        tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
+        return t;
+    }
+    g_assert_not_reached();
+}
+
+static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
+{
+    tcg_gen_mov_tl(t, get_gpr(ctx, reg_num, EXT_NONE));
+}
+
+static TCGv __attribute__((unused)) dest_gpr(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0 || ctx->w) {
+        return temp_new(ctx);
+    }
+    return cpu_gpr[reg_num];
+}
+
+static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
+{
+    if (reg_num != 0) {
+        if (ctx->w) {
+            tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
+        } else {
+            tcg_gen_mov_tl(cpu_gpr[reg_num], t);
+        }
     }
 }
 
@@ -927,8 +979,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
 }
 
-static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
+static void riscv_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
 {
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    ctx->zero = tcg_constant_tl(0);
 }
 
 static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
@@ -946,6 +1001,13 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next = ctx->pc_succ_insn;
+    ctx->w = false;
+
+    for (int i = ctx->ntemp - 1; i >= 0; --i) {
+        tcg_temp_free(ctx->temp[i]);
+        ctx->temp[i] = NULL;
+    }
+    ctx->ntemp = 0;
 
     if (ctx->base.is_jmp == DISAS_NEXT) {
         target_ulong page_start;
@@ -997,7 +1059,7 @@ static const TranslatorOps riscv_tr_ops = {
 
 void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 {
-    DisasContext ctx;
+    DisasContext ctx = { };
 
     translator_loop(&riscv_tr_ops, &ctx.base, cs, tb, max_insns);
 }
-- 
2.25.1


