Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709B544E23A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 08:06:27 +0100 (CET)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlQdm-0002Dv-Jg
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 02:06:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mlQSp-0006pE-0L
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 01:55:07 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49648 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mlQSm-0007jP-Ht
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 01:55:06 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxydCRD45hHoQCAA--.6006S17; 
 Fri, 12 Nov 2021 14:54:48 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 15/26] target/loongarch: Add branch instruction translation
Date: Fri, 12 Nov 2021 14:53:58 +0800
Message-Id: <1636700049-24381-16-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9CxydCRD45hHoQCAA--.6006S17
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4DJF1xtF18Zry5Ww45Wrg_yoWxGry5pr
 1UCryUKrWkJry5Jrn5tw45XFy5Xrn8G347GrW3twn3JF42q3WUAF18AryUKr4jvw1kZry8
 tF4rAryjgFy8XwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 target/loongarch/insn_trans/trans_branch.c.inc | 82 ++++++++++++++++++++++++++
 target/loongarch/insns.decode                  | 30 ++++++++++
 target/loongarch/translate.c                   |  1 +
 3 files changed, 113 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_branch.c.inc

diff --git a/target/loongarch/insn_trans/trans_branch.c.inc b/target/loongarch/insn_trans/trans_branch.c.inc
new file mode 100644
index 0000000..ecb6bd1
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_branch.c.inc
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool trans_b(DisasContext *ctx, arg_b *a)
+{
+    gen_goto_tb(ctx, 0, ctx->base.pc_next + (a->offs << 2));
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
+static bool trans_bl(DisasContext *ctx, arg_bl *a)
+{
+    tcg_gen_movi_tl(cpu_gpr[1], ctx->base.pc_next + 4);
+    gen_goto_tb(ctx, 0, ctx->base.pc_next + (a->offs << 2));
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
+static bool trans_jirl(DisasContext *ctx, arg_jirl *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    tcg_gen_addi_tl(cpu_pc, src1, (a->offs16) << 2);
+    tcg_gen_movi_tl(dest, ctx->base.pc_next + 4);
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
+static bool gen_r2_bc(DisasContext *ctx, arg_fmt_rjrdoffs16 *a, TCGCond cond)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rd, EXT_NONE);
+
+    gen_bc(ctx, src1, src2, (a->offs16 << 2), cond);
+    return true;
+}
+
+static bool gen_rz_bc(DisasContext *ctx, arg_fmt_rjoffs21 *a, TCGCond cond)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = tcg_constant_tl(0);
+
+    gen_bc(ctx, src1, src2, (a->offs21 << 2), cond);
+    return true;
+}
+
+static bool gen_cz_bc(DisasContext *ctx, arg_fmt_cjoffs21 *a, TCGCond cond)
+{
+    TCGv src1 = tcg_temp_new();
+    TCGv src2 = tcg_constant_tl(0);
+
+    tcg_gen_ld8u_tl(src1, cpu_env,
+                    offsetof(CPULoongArchState, cf[a->cj & 0x7]));
+    gen_bc(ctx, src1, src2, (a->offs21 << 2), cond);
+    return true;
+}
+
+TRANS(beq, gen_r2_bc, TCG_COND_EQ)
+TRANS(bne, gen_r2_bc, TCG_COND_NE)
+TRANS(blt, gen_r2_bc, TCG_COND_LT)
+TRANS(bge, gen_r2_bc, TCG_COND_GE)
+TRANS(bltu, gen_r2_bc, TCG_COND_LTU)
+TRANS(bgeu, gen_r2_bc, TCG_COND_GEU)
+TRANS(beqz, gen_rz_bc, TCG_COND_EQ)
+TRANS(bnez, gen_rz_bc, TCG_COND_NE)
+TRANS(bceqz, gen_cz_bc, TCG_COND_EQ)
+TRANS(bcnez, gen_cz_bc, TCG_COND_NE)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index ee1d544..e28b843 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -37,6 +37,9 @@
 %ca      15:3
 %fcsrd   0:5
 %fcsrs   5:5
+%offs21  0:s5 10:16
+%offs16  10:s16
+%offs    0:s10 10:16
 
 #
 # Argument sets
@@ -73,6 +76,11 @@
 &fmt_rdcj           rd cj
 &fmt_fdrjrk         fd rj rk
 &fmt_fdrjsi12       fd rj si12
+&fmt_rjoffs21       rj offs21
+&fmt_cjoffs21       cj offs21
+&fmt_rdrjoffs16     rd rj offs16
+&fmt_offs           offs
+&fmt_rjrdoffs16     rj rd offs16
 
 #
 # Formats
@@ -109,6 +117,11 @@
 @fmt_rdcj            .... ........ ..... ..... .. ... .....   &fmt_rdcj           %rd %cj
 @fmt_fdrjrk          .... ........ ..... ..... ..... .....    &fmt_fdrjrk         %fd %rj %rk
 @fmt_fdrjsi12        .... ...... ............ ..... .....     &fmt_fdrjsi12       %fd %rj %si12
+@fmt_rjoffs21        .... .. ................ ..... .....     &fmt_rjoffs21       %rj %offs21
+@fmt_cjoffs21        .... .. ................ .. ... .....    &fmt_cjoffs21       %cj %offs21
+@fmt_rdrjoffs16      .... .. ................ ..... .....     &fmt_rdrjoffs16     %rd %rj %offs16
+@fmt_offs            .... .. ..........................       &fmt_offs           %offs
+@fmt_rjrdoffs16      .... .. ................ ..... .....     &fmt_rjrdoffs16     %rj %rd %offs16
 
 #
 # Fixed point arithmetic operation instruction
@@ -447,3 +460,20 @@ fstgt_s          0011 10000111 01100 ..... ..... .....    @fmt_fdrjrk
 fstgt_d          0011 10000111 01101 ..... ..... .....    @fmt_fdrjrk
 fstle_s          0011 10000111 01110 ..... ..... .....    @fmt_fdrjrk
 fstle_d          0011 10000111 01111 ..... ..... .....    @fmt_fdrjrk
+
+#
+# Branch instructions
+#
+beqz             0100 00 ................ ..... .....     @fmt_rjoffs21
+bnez             0100 01 ................ ..... .....     @fmt_rjoffs21
+bceqz            0100 10 ................ 00 ... .....    @fmt_cjoffs21
+bcnez            0100 10 ................ 01 ... .....    @fmt_cjoffs21
+jirl             0100 11 ................ ..... .....     @fmt_rdrjoffs16
+b                0101 00 ..........................       @fmt_offs
+bl               0101 01 ..........................       @fmt_offs
+beq              0101 10 ................ ..... .....     @fmt_rjrdoffs16
+bne              0101 11 ................ ..... .....     @fmt_rjrdoffs16
+blt              0110 00 ................ ..... .....     @fmt_rjrdoffs16
+bge              0110 01 ................ ..... .....     @fmt_rjrdoffs16
+bltu             0110 10 ................ ..... .....     @fmt_rjrdoffs16
+bgeu             0110 11 ................ ..... .....     @fmt_rjrdoffs16
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index bf329fd..437f33d 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -190,6 +190,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fcnv.c.inc"
 #include "insn_trans/trans_fmov.c.inc"
 #include "insn_trans/trans_fmemory.c.inc"
+#include "insn_trans/trans_branch.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


