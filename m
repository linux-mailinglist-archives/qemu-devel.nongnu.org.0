Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AA43D0B9D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:57:09 +0200 (CEST)
Received: from localhost ([::1]:60480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68yS-0008R1-4X
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68vM-0003WB-4y
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49812 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68vJ-0002Gc-6I
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:55 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S20; 
 Wed, 21 Jul 2021 17:53:39 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/22] target/loongarch: Add branch instruction translation
Date: Wed, 21 Jul 2021 17:53:14 +0800
Message-Id: <1626861198-6133-19-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S20
X-Coremail-Antispam: 1UD129KBjvJXoWxtFWkXw4UZFWrJF4kZw4kXrb_yoW3uF17pr
 10kryUJ34DJry5JF9xtw45Crn8Jrs5C3yUCr9ayw48tF1fXFykAr10y34Y9F48uFyvqryY
 yFZ8Aa4jkFyUW3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
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
---
 target/loongarch/insns.decode |  30 +++++
 target/loongarch/trans.inc.c  | 249 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 279 insertions(+)

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
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index 8adfdd3..0c67c54 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -5285,3 +5285,252 @@ static bool trans_fstle_d(DisasContext *ctx, arg_fstle_d *a)
 }
 
 #undef DECL_ARG2
+
+/* Branch Instructions translation */
+static bool trans_beqz(DisasContext *ctx, arg_beqz *a)
+{
+    TCGv t0, t1;
+    int bcond_flag = 0;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_const_i64(0);
+
+    if (a->rj != 0) {
+        gen_load_gpr(t0, a->rj);
+        bcond_flag = 1;
+    }
+
+    if (bcond_flag == 0) {
+        ctx->hflags |= LOONGARCH_HFLAG_B;
+    } else {
+        tcg_gen_setcond_tl(TCG_COND_EQ, bcond, t0, t1);
+        ctx->hflags |= LOONGARCH_HFLAG_BC;
+    }
+    ctx->btarget = ctx->base.pc_next + (a->offs21 << 2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_bnez(DisasContext *ctx, arg_bnez *a)
+{
+    TCGv t0, t1;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_const_i64(0);
+
+    if (a->rj != 0) {
+        gen_load_gpr(t0, a->rj);
+        tcg_gen_setcond_tl(TCG_COND_NE, bcond, t0, t1);
+        ctx->hflags |= LOONGARCH_HFLAG_BC;
+    }
+    ctx->btarget = ctx->base.pc_next + (a->offs21 << 2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_bceqz(DisasContext *ctx, arg_bceqz *a)
+{
+    TCGv t0, t1;
+    TCGv_i32 cj;
+
+    cj = tcg_const_i32(a->cj);
+    t0 = tcg_temp_new();
+    t1 = tcg_const_i64(0);
+
+    gen_helper_movcf2reg(t0, cpu_env, cj);
+    tcg_gen_setcond_tl(TCG_COND_EQ, bcond, t0, t1);
+    ctx->hflags |= LOONGARCH_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + (a->offs21 << 2);
+
+    tcg_temp_free_i32(cj);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_bcnez(DisasContext *ctx, arg_bcnez *a)
+{
+    TCGv t0, t1;
+    TCGv_i32 cj;
+
+    cj = tcg_const_i32(a->cj);
+    t0 = tcg_temp_new();
+    t1 = tcg_const_i64(0);
+
+    gen_helper_movcf2reg(t0, cpu_env, cj);
+    tcg_gen_setcond_tl(TCG_COND_NE, bcond, t0, t1);
+    ctx->hflags |= LOONGARCH_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + (a->offs21 << 2);
+
+    tcg_temp_free_i32(cj);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_b(DisasContext *ctx, arg_b *a)
+{
+    ctx->hflags |= LOONGARCH_HFLAG_B;
+    ctx->btarget = ctx->base.pc_next + (a->offs << 2);
+
+    return true;
+}
+
+static bool trans_bl(DisasContext *ctx, arg_bl *a)
+{
+    ctx->btarget = ctx->base.pc_next + (a->offs << 2);
+    tcg_gen_movi_tl(cpu_gpr[1], ctx->base.pc_next + 4);
+    ctx->hflags |= LOONGARCH_HFLAG_B;
+    gen_branch(ctx, 4);
+
+    return true;
+}
+
+static bool trans_blt(DisasContext *ctx, arg_blt *a)
+{
+    TCGv t0, t1;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rd);
+
+    tcg_gen_setcond_tl(TCG_COND_LT, bcond, t0, t1);
+    ctx->hflags |= LOONGARCH_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + (a->offs16 << 2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_bge(DisasContext *ctx, arg_bge *a)
+{
+    TCGv t0, t1;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rd);
+
+    tcg_gen_setcond_tl(TCG_COND_GE, bcond, t0, t1);
+    ctx->hflags |= LOONGARCH_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + (a->offs16 << 2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_bltu(DisasContext *ctx, arg_bltu *a)
+{
+    TCGv t0, t1;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rd);
+
+    tcg_gen_setcond_tl(TCG_COND_LTU, bcond, t0, t1);
+    ctx->hflags |= LOONGARCH_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + (a->offs16 << 2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
+{
+    TCGv t0, t1;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    gen_load_gpr(t1, a->rd);
+
+    tcg_gen_setcond_tl(TCG_COND_GEU, bcond, t0, t1);
+    ctx->hflags |= LOONGARCH_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + (a->offs16 << 2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_beq(DisasContext *ctx, arg_beq *a)
+{
+    TCGv t0, t1;
+    int bcond_flag = 0;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    if (a->rj != a->rd) {
+        gen_load_gpr(t0, a->rj);
+        gen_load_gpr(t1, a->rd);
+        bcond_flag = 1;
+    }
+
+    if (bcond_flag == 0) {
+        ctx->hflags |= LOONGARCH_HFLAG_B;
+    } else {
+        tcg_gen_setcond_tl(TCG_COND_EQ, bcond, t0, t1);
+        ctx->hflags |= LOONGARCH_HFLAG_BC;
+    }
+    ctx->btarget = ctx->base.pc_next + (a->offs16 << 2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_bne(DisasContext *ctx, arg_bne *a)
+{
+    TCGv t0, t1;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    if (a->rj != a->rd) {
+        gen_load_gpr(t0, a->rj);
+        gen_load_gpr(t1, a->rd);
+        tcg_gen_setcond_tl(TCG_COND_NE, bcond, t0, t1);
+        ctx->hflags |= LOONGARCH_HFLAG_BC;
+    }
+    ctx->btarget = ctx->base.pc_next + (a->offs16 << 2);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_jirl(DisasContext *ctx, arg_jirl *a)
+{
+    gen_base_offset_addr(btarget, a->rj, a->offs16 << 2);
+    if (a->rd != 0) {
+        tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->base.pc_next + 4);
+    }
+    ctx->hflags |= LOONGARCH_HFLAG_BR;
+    gen_branch(ctx, 4);
+
+    return true;
+}
-- 
1.8.3.1


