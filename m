Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502DC431A53
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:03:38 +0200 (CEST)
Received: from localhost ([::1]:36842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcSIj-0007IY-BN
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mcS3h-0005Qy-Kh
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:48:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50230 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mcS3e-0003nt-86
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:48:05 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT2rfbG1hyhAcAA--.29044S17; 
 Mon, 18 Oct 2021 20:47:46 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 15/21] target/loongarch: Add branch instruction translation
Date: Mon, 18 Oct 2021 20:47:21 +0800
Message-Id: <1634561247-25499-16-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxT2rfbG1hyhAcAA--.29044S17
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4Dur13tr4kGrW3JryUAwb_yoWxGFy8pr
 1UCryUGrW8Jry3Jrn5tw45Xr13Jrs8Gw17G3y3twn3JF42q3WUAF18AryUKr4jv34kZry8
 tF45AryUKFy8XwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, yangxiaojuan@loongson.cn,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement branch instruction translation.

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
 target/loongarch/insn_trans/trans_branch.c | 85 ++++++++++++++++++++++++++++++
 target/loongarch/insns.decode              | 30 +++++++++++
 target/loongarch/translate.c               |  1 +
 3 files changed, 116 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_branch.c

diff --git a/target/loongarch/insn_trans/trans_branch.c b/target/loongarch/insn_trans/trans_branch.c
new file mode 100644
index 0000000..77a6ae6
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_branch.c
@@ -0,0 +1,85 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
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
index ea776c2..077063e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -38,6 +38,9 @@
 %ca      15:3
 %fcsrd   0:5
 %fcsrs   5:5
+%offs21  0:s5 10:16
+%offs16  10:s16
+%offs    0:s10 10:16
 
 #
 # Argument sets
@@ -74,6 +77,11 @@
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
@@ -110,6 +118,11 @@
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
@@ -448,3 +461,20 @@ fstgt_s          0011 10000111 01100 ..... ..... .....    @fmt_fdrjrk
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
index df3176e..bea290d 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -191,6 +191,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fcnv.c"
 #include "insn_trans/trans_fmov.c"
 #include "insn_trans/trans_fmemory.c"
+#include "insn_trans/trans_branch.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


