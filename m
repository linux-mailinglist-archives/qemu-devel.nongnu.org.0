Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B2B43F9FE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:35:58 +0200 (CEST)
Received: from localhost ([::1]:44226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOIn-0004K1-JQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkm-0005ew-1B
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:48 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkg-0005o9-MT
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:47 -0400
Received: by mail-pj1-x1032.google.com with SMTP id gn3so6784282pjb.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h7X73d3mXV4NiBkNQSBQTknzEgHjhBjFiLZpuoeqIgY=;
 b=Pgg9cZnTib6J0bmfa46Exs7M1qBQXvjUV0Cqp//FDT9Iss1vxre0GM5BXoSXt1Bvxa
 eYOO4NGpo4CVucT2Z8QbkUd+77frNcKInPzfhA+M2rLxDIZWD24Liox9MponfkEb1oUw
 CDhKujJIgzYIXeF5DLl8zo/NqHZPqRze8sOuWUNgO/7DRaXFZdNIFHiWK08fo/OQVxc4
 F9E/UE81ycZ4nRijo1VjjerVsHRXAUHs1eq+pgmSMa4veE/cXTksG/OojI5tEQWMKP88
 G9hUcDce1Y9giGcdPwxrzOwQpW1k5JBfvoM/sAZoy9Xt62H3czmBJpyhGPZjEjASCjKB
 9lWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h7X73d3mXV4NiBkNQSBQTknzEgHjhBjFiLZpuoeqIgY=;
 b=EtAM+muzzzAzEuadI2XjvotEBMIUKf63FsvtFfngLj6pycXkozguePv59OSZZsOTcx
 +ECibZZqrMyAJegJDaEtE7ZyaHNITFkbEo30wvVSNIK9LcSHYkUFCVTNvUThc2LqT1GN
 tjibLxZrj1CZTI2gLk5iyEKFUiHxSqywdAQKTFsOJmf8rJLQKytayjSuM8Ubr7qLGTPX
 p0nSLYG3QyAOavT4OLyhYSxPcyyIoWkfHOsB+JYqPqn/74apKk/s/yA690ZK4sNWa1Qx
 SR9m0uteq5+3ygzT6aMgmJwrQCMqlC4I/SnRitcIh/1YI8boOyadSEp0TB9PBdmVYzRl
 bpRA==
X-Gm-Message-State: AOAM5311IGm4qE7cPgakfUOD/kCBCU7Nb9p6hGc10qXaDOCek435ih3K
 eZ/RfpKBfQMCpkJeV5vPDQ8uZseGoK1ooIkI
X-Google-Smtp-Source: ABdhPJxeE5dbWmUifKc1YiCk/VhRsnJjurggD0NljB0Q014E19MpZl8UHHkbzMezkpZhwAptcnS8tg==
X-Received: by 2002:a17:90a:9906:: with SMTP id
 b6mr18247831pjp.180.1635498041179; 
 Fri, 29 Oct 2021 02:00:41 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:00:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 19/76] target/riscv: rvv-1.0: configure instructions
Date: Fri, 29 Oct 2021 16:58:24 +0800
Message-Id: <20211029085922.255197-20-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 62 +++++++++++--------------
 target/riscv/vector_helper.c            | 14 +++++-
 2 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index afec1873333..049688d83a8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -120,59 +120,51 @@ static bool require_noover(const int8_t dst, const int8_t dst_lmul,
     return !is_overlapped(dst, dst_size, src, src_size);
 }
 
-static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
+static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
 {
-    TCGv s1, s2, dst;
+    TCGv s1, dst;
 
-    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
+    if (!require_rvv(s) || !has_ext(s, RVV)) {
         return false;
     }
 
-    s2 = get_gpr(ctx, a->rs2, EXT_ZERO);
-    dst = dest_gpr(ctx, a->rd);
+    dst = dest_gpr(s, rd);
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
+    if (rd == 0 && rs1 == 0) {
+        s1 = tcg_temp_new();
+        tcg_gen_mov_tl(s1, cpu_vl);
+    } else if (rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_constant_tl(RV_VLEN_MAX);
     } else {
-        s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
+        s1 = get_gpr(s, rs1, EXT_ZERO);
     }
+
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(ctx, a->rd, dst);
-    mark_vs_dirty(ctx);
+    gen_set_gpr(s, rd, dst);
+    mark_vs_dirty(s);
 
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
     tcg_gen_lookup_and_goto_ptr();
-    ctx->base.is_jmp = DISAS_NORETURN;
-    return true;
-}
+    s->base.is_jmp = DISAS_NORETURN;
 
-static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
-{
-    TCGv s1, s2, dst;
-
-    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
-        return false;
+    if (rd == 0 && rs1 == 0) {
+        tcg_temp_free(s1);
     }
 
-    s2 = tcg_constant_tl(a->zimm);
-    dst = dest_gpr(ctx, a->rd);
+    return true;
+}
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
-        /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
-        s1 = tcg_constant_tl(RV_VLEN_MAX);
-    } else {
-        s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
-    }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(ctx, a->rd, dst);
-    mark_vs_dirty(ctx);
+static bool trans_vsetvl(DisasContext *s, arg_vsetvl *a)
+{
+    TCGv s2 = get_gpr(s, a->rs2, EXT_ZERO);
+    return do_vsetvl(s, a->rd, a->rs1, s2);
+}
 
-    gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    return true;
+static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
+{
+    TCGv s2 = tcg_constant_tl(a->zimm);
+    return do_vsetvl(s, a->rd, a->rs1, s2);
 }
 
 /* vector register offset from env */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index bf976d364f1..78fae782840 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -31,12 +31,24 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
 {
     int vlmax, vl;
     RISCVCPU *cpu = env_archcpu(env);
+    uint64_t lmul = FIELD_EX64(s2, VTYPE, VLMUL);
     uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
     uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
     bool vill = FIELD_EX64(s2, VTYPE, VILL);
     target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
 
-    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
+    if (lmul & 4) {
+        /* Fractional LMUL. */
+        if (lmul == 4 ||
+            cpu->cfg.elen >> (8 - lmul) < sew) {
+            vill = true;
+        }
+    }
+
+    if ((sew > cpu->cfg.elen)
+        || vill
+        || (ediv != 0)
+        || (reserved != 0)) {
         /* only set vill bit. */
         env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
         env->vl = 0;
-- 
2.25.1


