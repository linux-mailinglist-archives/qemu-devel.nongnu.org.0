Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E046FCCD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:36:35 +0100 (CET)
Received: from localhost ([::1]:51478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbOM-0006jw-3h
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:36:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanO-00051r-LQ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:24 -0500
Received: from [2607:f8b0:4864:20::635] (port=43697
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanK-0006ky-V5
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:21 -0500
Received: by mail-pl1-x635.google.com with SMTP id m24so5731536pls.10
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CyR2RIGgjqNCbyxtsog9tiUonYa85h58je0TPofWbS4=;
 b=fsALO4NNp5amltlCkvXlGxwEchk8Mjv0lJOPeGaU0G5RsZNmQ+dRfr+xOfDBN59wmQ
 Gn3946IREo8FZRV458gcRepiYzoS9bI9E5CA8K3qDcOQWJyk99tfYu2nzEkBIAjJD3m5
 ViwGy1TlWFp/OdGKInP/uy+Ux53T3aCWnTiPk0g9qLygjsCbaXU6ul/Ey0pCthNulijM
 DpScuBEqxvXG4o3iUYQeaT9uH9HyG7xlH8joj8cG+yH6JpJyZUKurl99bCZkoNCzBhk3
 VS8kzwb8K2WmkBz/7IlftVSlw88Xt6kvSTiM6yHDhzVbuFotNiZ9nFk/8RaClDkhIK8p
 JtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CyR2RIGgjqNCbyxtsog9tiUonYa85h58je0TPofWbS4=;
 b=0uRq9qt3owIOHPeu+2ADq9feuY8vQNZI35vUDOihLvapsvqbRWSmEMgqc0a/F52+4q
 d17xTK3m0kO/PFLy86HrWj7YTyNA3vM68TXCLrU1og0iFn0YQXP6VNyApmFo4fso5zQe
 X9ERP6jcVS7mAWup9TRT3KN383NWQdLusmQSkqLkxXA5+LFDAJSO4x1qSkN2PKN//AoL
 kWGY/ZkfBY+/O/WRcbiV43bXSoVDo4ZX9+5xs42QNJd6pQoDZzXu2wyueZt+YfL225UN
 b+KmrCjxvC44vq3p9WqpgK3cV/sCno90vov+vKPkJABxo0xyOS6kyV1aJTthsPj06IDD
 XNMw==
X-Gm-Message-State: AOAM5312toML7c5Peb8Uo6tdNz1t5nqElh/feZ9UlksP8W9N5DmSdm2i
 xKyhNrbtKwqK5NqWe06nYYUebRc+MQbfQyjE
X-Google-Smtp-Source: ABdhPJyEMpIH7ExaykraCpwDKNChSd+hf9zNCYc9r8On8fkeZVOsCxieuQd8snA+V3H7PYqUKGIuSg==
X-Received: by 2002:a17:90a:f0d1:: with SMTP id
 fa17mr21778016pjb.145.1639123097531; 
 Thu, 09 Dec 2021 23:58:17 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:17 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 19/77] target/riscv: rvv-1.0: configure instructions
Date: Fri, 10 Dec 2021 15:56:05 +0800
Message-Id: <20211210075704.23951-20-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index afec187333..049688d83a 100644
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
index bf976d364f..78fae78284 100644
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
2.31.1


