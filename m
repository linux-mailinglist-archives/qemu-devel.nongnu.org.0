Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292C4649CF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 09:37:56 +0100 (CET)
Received: from localhost ([::1]:33664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msL7j-0003wq-7N
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 03:37:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1msKnf-0006Po-Td
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 03:17:11 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59316 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1msKnb-00085K-Jp
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 03:17:11 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxaslZL6dhBv8BAA--.4388S17; 
 Wed, 01 Dec 2021 16:16:49 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 15/26] target/loongarch: Add branch instruction translation
Date: Wed,  1 Dec 2021 16:16:14 +0800
Message-Id: <1638346585-3436-16-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638346585-3436-1-git-send-email-gaosong@loongson.cn>
References: <1638346585-3436-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxaslZL6dhBv8BAA--.4388S17
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4DJF1xtF1furWxCryrtFb_yoW7try3pr
 1UCr1UKrW8Jry3Ar9Yqw45JF15Zrs3G3y7Gws3twn5Xr42qF1DJr48t34UKrWUXrWkXr40
 vF4rA34UWFy0qwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
- BEQ, BNE, BLT[U], BGE[U]
- BEQZ, BNEZ
- B
- BL
- JIRL
- BCEQZ, BCNEZ

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insn_trans/trans_branch.c.inc | 83 ++++++++++++++++++++++++++
 target/loongarch/insns.decode                  | 28 +++++++++
 target/loongarch/translate.c                   |  1 +
 3 files changed, 112 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_branch.c.inc

diff --git a/target/loongarch/insn_trans/trans_branch.c.inc b/target/loongarch/insn_trans/trans_branch.c.inc
new file mode 100644
index 0000000..65dbdff
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_branch.c.inc
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool trans_b(DisasContext *ctx, arg_b *a)
+{
+    gen_goto_tb(ctx, 0, ctx->base.pc_next + a->offs);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
+static bool trans_bl(DisasContext *ctx, arg_bl *a)
+{
+    tcg_gen_movi_tl(cpu_gpr[1], ctx->base.pc_next + 4);
+    gen_goto_tb(ctx, 0, ctx->base.pc_next + a->offs);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
+static bool trans_jirl(DisasContext *ctx, arg_jirl *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    tcg_gen_addi_tl(cpu_pc, src1, a->offs);
+    tcg_gen_movi_tl(dest, ctx->base.pc_next + 4);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+    tcg_gen_lookup_and_goto_ptr();
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
+static void gen_bc(DisasContext *ctx, TCGv src1, TCGv src2,
+                   target_long offs, TCGCond cond)
+{
+    TCGLabel *l = gen_new_label();
+    tcg_gen_brcond_tl(cond, src1, src2, l);
+    gen_goto_tb(ctx, 1, ctx->base.pc_next + 4);
+    gen_set_label(l);
+    gen_goto_tb(ctx, 0, ctx->base.pc_next + offs);
+    ctx->base.is_jmp = DISAS_NORETURN;
+}
+
+static bool gen_rr_bc(DisasContext *ctx, arg_rr_offs *a, TCGCond cond)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rd, EXT_NONE);
+
+    gen_bc(ctx, src1, src2, a->offs, cond);
+    return true;
+}
+
+static bool gen_rz_bc(DisasContext *ctx, arg_r_offs *a, TCGCond cond)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = tcg_constant_tl(0);
+
+    gen_bc(ctx, src1, src2, a->offs, cond);
+    return true;
+}
+
+static bool gen_cz_bc(DisasContext *ctx, arg_c_offs *a, TCGCond cond)
+{
+    TCGv src1 = tcg_temp_new();
+    TCGv src2 = tcg_constant_tl(0);
+
+    tcg_gen_ld8u_tl(src1, cpu_env,
+                    offsetof(CPULoongArchState, cf[a->cj]));
+    gen_bc(ctx, src1, src2, a->offs, cond);
+    return true;
+}
+
+TRANS(beq, gen_rr_bc, TCG_COND_EQ)
+TRANS(bne, gen_rr_bc, TCG_COND_NE)
+TRANS(blt, gen_rr_bc, TCG_COND_LT)
+TRANS(bge, gen_rr_bc, TCG_COND_GE)
+TRANS(bltu, gen_rr_bc, TCG_COND_LTU)
+TRANS(bgeu, gen_rr_bc, TCG_COND_GEU)
+TRANS(beqz, gen_rz_bc, TCG_COND_EQ)
+TRANS(bnez, gen_rz_bc, TCG_COND_NE)
+TRANS(bceqz, gen_cz_bc, TCG_COND_EQ)
+TRANS(bcnez, gen_cz_bc, TCG_COND_NE)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index c9daa55..3379d22 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -10,6 +10,9 @@
 #
 %i14s2     10:s14       !function=shl_2
 %sa2p1     15:2         !function=plus_1
+%offs21    0:s5 10:16   !function=shl_2
+%offs16    10:s16       !function=shl_2
+%offs26    0:s10 10:16  !function=shl_2
 
 #
 # Argument sets
@@ -38,6 +41,10 @@
 &rc           rd cj
 &frr          fd rj rk
 &fr_i         fd rj imm
+&r_offs       rj offs
+&c_offs       cj offs
+&offs         offs
+&rr_offs      rj rd offs
 
 #
 # Formats
@@ -74,6 +81,10 @@
 @rc            .... ........ ..... ..... .. cj:3 rd:5    &rc
 @frr               .... ........ ..... rk:5 rj:5 fd:5    &frr
 @fr_i12                 .... ...... imm:s12 rj:5 fd:5    &fr_i
+@r_offs21         .... .. ................ rj:5 .....    &r_offs      offs=%offs21
+@c_offs21      .... .. ................ .. cj:3 .....    &c_offs      offs=%offs21
+@offs26            .... .. ..........................    &offs        offs=%offs26
+@rr_offs16         .... .. ................ rj:5 rd:5    &rr_offs     offs=%offs16
 
 #
 # Fixed point arithmetic operation instruction
@@ -412,3 +423,20 @@ fstgt_s         0011 10000111 01100 ..... ..... .....    @frr
 fstgt_d         0011 10000111 01101 ..... ..... .....    @frr
 fstle_s         0011 10000111 01110 ..... ..... .....    @frr
 fstle_d         0011 10000111 01111 ..... ..... .....    @frr
+
+#
+# Branch instructions
+#
+beqz            0100 00 ................ ..... .....     @r_offs21
+bnez            0100 01 ................ ..... .....     @r_offs21
+bceqz           0100 10 ................ 00 ... .....    @c_offs21
+bcnez           0100 10 ................ 01 ... .....    @c_offs21
+jirl            0100 11 ................ ..... .....     @rr_offs16
+b               0101 00 ..........................       @offs26
+bl              0101 01 ..........................       @offs26
+beq             0101 10 ................ ..... .....     @rr_offs16
+bne             0101 11 ................ ..... .....     @rr_offs16
+blt             0110 00 ................ ..... .....     @rr_offs16
+bge             0110 01 ................ ..... .....     @rr_offs16
+bltu            0110 10 ................ ..... .....     @rr_offs16
+bgeu            0110 11 ................ ..... .....     @rr_offs16
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 7b5d1a9..2710764 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -171,6 +171,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fcnv.c.inc"
 #include "insn_trans/trans_fmov.c.inc"
 #include "insn_trans/trans_fmemory.c.inc"
+#include "insn_trans/trans_branch.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


