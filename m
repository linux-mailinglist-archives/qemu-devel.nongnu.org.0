Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3466A325C2A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:52:24 +0100 (CET)
Received: from localhost ([::1]:45632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUAx-0008S2-3E
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTgX-0007Kb-PX
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:20:57 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTgV-00016g-BO
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:20:57 -0500
Received: by mail-pj1-x1031.google.com with SMTP id jx13so1703650pjb.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FXmPuTpIx4Rx3RvlfE5z6e+P3M3dd2DT4/FudfXUHCw=;
 b=SothW0RhihTCZvpgbJ9PVqXeZj9Y8F4nQYpjfwt+lttDLzLBV40Fv8l2XToAPZy55U
 grnqa6ZdXtxSjM+zPbAChRB4nxJLPG2l62bvqq4QxFLi0/N/mNfWE8tBHQLvL8VWANUZ
 oNXxiYodrB3rC8lc2OZXeBwjqG9n8Oc6pK/9Lal1jUucjTj20kb2U+G29HipafhbM3xF
 AUH0CLeSU/LskGWZEd+HpAf9y0RA5cXpiwmNhhusObUyII83LWG80jHeTwsIzjutuzGO
 hur28rN4OxDhKPzTG4dgTHngIVwNeqJiMNEOuDdOzLWpc8e+UAiS0HBIBqoiDOYrofPy
 FrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FXmPuTpIx4Rx3RvlfE5z6e+P3M3dd2DT4/FudfXUHCw=;
 b=ju8q+NI55UV2OE4nFmmZx+nolP98pPddRFBOiIvpym4C8KeZ9ppiwXNDbLAmcZPJSi
 zq681X1be3rql9jGGERtDmju9auB3vlE35Zin2ErO/sVoUmitVibfnSLql+j81Hki/4y
 se/eVEdoSCJH91Pnwrdj5ytTGrYh1yq+i5SXMnTfNd8v7qeXnVSMwD90tm6LO8oMvJ2B
 jtuwLwSENB3tSb8XujQgvs71dJZLWpP64AY2EycsAdmXGPdLwCGl9aU/p3hy1m9T6pkj
 smmmODp2z7xG2Q0eBq2w6LnRxsqAufXMKTdw8ryZTkhvmbBfr8hVsIO2wBgaFM8H2IWc
 2uog==
X-Gm-Message-State: AOAM531F4eutlVaaY1LFuFzrMSkugaVkFhJRlNO6KyD5XEcgNbQuq4wr
 H5eXPzMtfGl4a8SG2gU1vC7HufQOzp+8VQ==
X-Google-Smtp-Source: ABdhPJwkxu6DlInApJQQmaitAoOQXNX9PJfEZMde+eAJdCfLCS4jpPz5xOFk5nqrR6Kf3lhe8kddwQ==
X-Received: by 2002:a17:902:7847:b029:df:d889:252c with SMTP id
 e7-20020a1709027847b02900dfd889252cmr1212342pln.76.1614309653768; 
 Thu, 25 Feb 2021 19:20:53 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:20:53 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 17/75] target/riscv: rvv-1.0: configure instructions
Date: Fri, 26 Feb 2021 11:18:01 +0800
Message-Id: <20210226031902.23656-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 53 +++++++++----------------
 target/riscv/vector_helper.c            | 14 ++++++-
 2 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ccfa93cf2f8..a3732e76e09 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -132,28 +132,29 @@ static bool require_noover_seg(const int8_t dst, const int8_t nf,
     return !is_overlapped(dst, nf, src, 1);
 }
 
-static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
+static bool do_vsetvl(DisasContext *ctx, int rd, int rs1, TCGv s2)
 {
-    TCGv s1, s2, dst;
+    TCGv s1, dst;
 
     if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
         return false;
     }
 
-    s2 = tcg_temp_new();
     dst = tcg_temp_new();
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
+    if (rd == 0 && rs1 == 0) {
+        s1 = tcg_temp_new();
+        tcg_gen_mov_tl(s1, cpu_vl);
+    } else if (rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_const_tl(RV_VLEN_MAX);
     } else {
         s1 = tcg_temp_new();
-        gen_get_gpr(s1, a->rs1);
+        gen_get_gpr(s1, rs1);
     }
-    gen_get_gpr(s2, a->rs2);
+
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(a->rd, dst);
+    gen_set_gpr(rd, dst);
     mark_vs_dirty(ctx);
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
     lookup_and_goto_ptr(ctx);
@@ -165,35 +166,17 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     return true;
 }
 
-static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
+static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
 {
-    TCGv s1, s2, dst;
-
-    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
-        return false;
-    }
-
-    s2 = tcg_const_tl(a->zimm);
-    dst = tcg_temp_new();
-
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
-        /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
-        s1 = tcg_const_tl(RV_VLEN_MAX);
-    } else {
-        s1 = tcg_temp_new();
-        gen_get_gpr(s1, a->rs1);
-    }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(a->rd, dst);
-    mark_vs_dirty(ctx);
-    gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
-    ctx->base.is_jmp = DISAS_NORETURN;
+    TCGv s2 = tcg_temp_new();
+    gen_get_gpr(s2, a->rs2);
+    return do_vsetvl(ctx, a->rd, a->rs1, s2);
+}
 
-    tcg_temp_free(s1);
-    tcg_temp_free(s2);
-    tcg_temp_free(dst);
-    return true;
+static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
+{
+    TCGv s2 = tcg_const_tl(a->zimm);
+    return do_vsetvl(ctx, a->rd, a->rs1, s2);
 }
 
 /* vector register offset from env */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 89aa7cbf73f..61917d34ffe 100644
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
2.17.1


