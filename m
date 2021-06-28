Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6631D3B5DC3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:14:35 +0200 (CEST)
Received: from localhost ([::1]:50632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxq9q-0000z2-EP
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0z-0002oi-Gw
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45662 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0v-0001Fv-8K
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:25 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S20; 
 Mon, 28 Jun 2021 20:05:06 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/20] target/loongarch: Add branch instruction translation
Date: Mon, 28 Jun 2021 20:04:43 +0800
Message-Id: <1624881885-31692-19-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S20
X-Coremail-Antispam: 1UD129KBjvJXoW3WF43GF1DtFy3Jry3GF4UArb_yoWfCF1Upr
 10yryUXrWUtFy3JF9xKw15Jr98Jrs7Cr17GwnIqw1fAw1SgFyDZr1Fy34agF4Yg3ykXryj
 vFy5Aa47KFyUWwUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
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
 target/loongarch/insns.decode |  30 ++++++++++++
 target/loongarch/instmap.h    |  13 +++++
 target/loongarch/trans.inc.c  | 110 ++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/translate.c  |  96 ++++++++++++++++++++++++++++++++++++
 4 files changed, 249 insertions(+)

diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index cff0955..37fd8e5 100644
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
@@ -75,6 +78,11 @@
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
@@ -112,6 +120,11 @@
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
@@ -451,3 +464,20 @@ fstgt_s          0011 10000111 01100 ..... ..... .....    @fmt_fdrjrk
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
diff --git a/target/loongarch/instmap.h b/target/loongarch/instmap.h
index eb8e354..0e703c9 100644
--- a/target/loongarch/instmap.h
+++ b/target/loongarch/instmap.h
@@ -184,4 +184,17 @@ enum {
     LA_OPC_STPTR_D   = (0x27 << 24)
 };
 
+/* Branch opcodes */
+enum {
+    LA_OPC_BEQZ      = (0x10 << 26),
+    LA_OPC_BNEZ      = (0x11 << 26),
+    LA_OPC_B         = (0x14 << 26),
+    LA_OPC_BEQ       = (0x16 << 26),
+    LA_OPC_BNE       = (0x17 << 26),
+    LA_OPC_BLT       = (0x18 << 26),
+    LA_OPC_BGE       = (0x19 << 26),
+    LA_OPC_BLTU      = (0x1A << 26),
+    LA_OPC_BGEU      = (0x1B << 26)
+};
+
 #endif
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index d95101b..782f26c 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -2314,3 +2314,113 @@ static bool trans_fstle_d(DisasContext *ctx, arg_fstle_d *a)
     gen_loongarch_fldst_extra(ctx, LA_OPC_FSTLE_D, 0, a->fd, a->rj, a->rk);
     return true;
 }
+
+/* Branch Instructions translation */
+static bool trans_beqz(DisasContext *ctx, arg_beqz *a)
+{
+    gen_loongarch_jump(ctx, LA_OPC_BEQZ, 4, a->rj, 0, a->offs21 << 2);
+    return true;
+}
+
+static bool trans_bnez(DisasContext *ctx, arg_bnez *a)
+{
+    gen_loongarch_jump(ctx, LA_OPC_BNEZ, 4, a->rj, 0, a->offs21 << 2);
+    return true;
+}
+
+static bool trans_bceqz(DisasContext *ctx, arg_bceqz *a)
+{
+    TCGv_i32 cj = tcg_const_i32(a->cj);
+    TCGv v0 = tcg_temp_new();
+    TCGv v1 = tcg_const_i64(0);
+
+    gen_helper_movcf2reg(v0, cpu_env, cj);
+    tcg_gen_setcond_tl(TCG_COND_EQ, bcond, v0, v1);
+    ctx->hflags |= LOONGARCH_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + (a->offs21 << 2);
+
+    tcg_temp_free_i32(cj);
+    tcg_temp_free(v0);
+    tcg_temp_free(v1);
+    return true;
+}
+
+static bool trans_bcnez(DisasContext *ctx, arg_bcnez *a)
+{
+    TCGv_i32 cj = tcg_const_i32(a->cj);
+    TCGv v0 = tcg_temp_new();
+    TCGv v1 = tcg_const_i64(0);
+
+    gen_helper_movcf2reg(v0, cpu_env, cj);
+    tcg_gen_setcond_tl(TCG_COND_NE, bcond, v0, v1);
+    ctx->hflags |= LOONGARCH_HFLAG_BC;
+    ctx->btarget = ctx->base.pc_next + (a->offs21 << 2);
+
+    tcg_temp_free_i32(cj);
+    tcg_temp_free(v0);
+    tcg_temp_free(v1);
+    return true;
+}
+
+static bool trans_b(DisasContext *ctx, arg_b *a)
+{
+    gen_loongarch_jump(ctx, LA_OPC_B, 4, 0, 0, a->offs << 2);
+    return true;
+}
+
+static bool trans_bl(DisasContext *ctx, arg_bl *a)
+{
+    ctx->btarget = ctx->base.pc_next + (a->offs << 2);
+    tcg_gen_movi_tl(cpu_gpr[1], ctx->base.pc_next + 4);
+    ctx->hflags |= LOONGARCH_HFLAG_B;
+    gen_branch(ctx, 4);
+    return true;
+}
+
+static bool trans_blt(DisasContext *ctx, arg_blt *a)
+{
+    gen_loongarch_jump(ctx, LA_OPC_BLT, 4, a->rj, a->rd, a->offs16 << 2);
+    return true;
+}
+
+static bool trans_bge(DisasContext *ctx, arg_bge *a)
+{
+    gen_loongarch_jump(ctx, LA_OPC_BGE, 4, a->rj, a->rd, a->offs16 << 2);
+    return true;
+}
+
+static bool trans_bltu(DisasContext *ctx, arg_bltu *a)
+{
+    gen_loongarch_jump(ctx, LA_OPC_BLTU, 4, a->rj, a->rd, a->offs16 << 2);
+    return true;
+}
+
+static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
+{
+    gen_loongarch_jump(ctx, LA_OPC_BGEU, 4, a->rj, a->rd, a->offs16 << 2);
+    return true;
+}
+
+static bool trans_beq(DisasContext *ctx, arg_beq *a)
+{
+    gen_loongarch_jump(ctx, LA_OPC_BEQ, 4, a->rj, a->rd, a->offs16 << 2);
+    return true;
+}
+
+static bool trans_bne(DisasContext *ctx, arg_bne *a)
+{
+    gen_loongarch_jump(ctx, LA_OPC_BNE, 4, a->rj, a->rd, a->offs16 << 2);
+    return true;
+}
+
+static bool trans_jirl(DisasContext *ctx, arg_jirl *a)
+{
+    gen_base_offset_addr(ctx, btarget, a->rj, a->offs16 << 2);
+    if (a->rd != 0) {
+        tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->base.pc_next + 4);
+    }
+    ctx->hflags |= LOONGARCH_HFLAG_BR;
+    gen_branch(ctx, 4);
+
+    return true;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index c1d89d8..9338f7f 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -2263,6 +2263,102 @@ static void gen_loongarch_fldst_extra(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t0);
 }
 
+static void gen_loongarch_jump(DisasContext *ctx, uint32_t opc,
+                               int insn_bytes,
+                               int rj, int rd, int32_t offset)
+{
+    target_ulong btgt = -1;
+    int bcond_flag = 0;
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    if (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
+        generate_exception_end(ctx, EXCP_INE);
+        goto out;
+    }
+
+    /* Load needed operands */
+    switch (opc) {
+    case LA_OPC_BLT:
+    case LA_OPC_BGE:
+    case LA_OPC_BLTU:
+    case LA_OPC_BGEU:
+        gen_load_gpr(t0, rj);
+        gen_load_gpr(t1, rd);
+        bcond_flag = 1;
+        btgt = ctx->base.pc_next + offset;
+        break;
+    case LA_OPC_BEQZ:
+    case LA_OPC_B:
+    case LA_OPC_BEQ:
+    case LA_OPC_BNEZ:
+    case LA_OPC_BNE:
+        /* Compare two registers */
+        if (rj != rd) {
+            gen_load_gpr(t0, rj);
+            gen_load_gpr(t1, rd);
+            bcond_flag = 1;
+        }
+        btgt = ctx->base.pc_next + offset;
+        break;
+    default:
+        generate_exception_end(ctx, EXCP_INE);
+        goto out;
+    }
+    if (bcond_flag == 0) {
+        /* No condition to be computed */
+        switch (opc) {
+        case LA_OPC_BEQZ:
+        case LA_OPC_B:
+        case LA_OPC_BEQ:
+            ctx->hflags |= LOONGARCH_HFLAG_B;
+            break;
+        case LA_OPC_BNEZ:
+        case LA_OPC_BNE:
+            /* Treat as NOP. */
+            goto out;
+        default:
+            generate_exception_end(ctx, EXCP_INE);
+            goto out;
+        }
+    } else {
+        switch (opc) {
+        case LA_OPC_BLT:
+            tcg_gen_setcond_tl(TCG_COND_LT, bcond, t0, t1);
+            goto not_likely;
+        case LA_OPC_BGE:
+            tcg_gen_setcond_tl(TCG_COND_GE, bcond, t0, t1);
+            goto not_likely;
+        case LA_OPC_BLTU:
+            tcg_gen_setcond_tl(TCG_COND_LTU, bcond, t0, t1);
+            goto not_likely;
+        case LA_OPC_BGEU:
+            tcg_gen_setcond_tl(TCG_COND_GEU, bcond, t0, t1);
+            goto not_likely;
+        case LA_OPC_BEQZ:
+        case LA_OPC_B:
+        case LA_OPC_BEQ:
+            tcg_gen_setcond_tl(TCG_COND_EQ, bcond, t0, t1);
+            goto not_likely;
+        case LA_OPC_BNEZ:
+        case LA_OPC_BNE:
+            tcg_gen_setcond_tl(TCG_COND_NE, bcond, t0, t1);
+            goto not_likely;
+        not_likely:
+            ctx->hflags |= LOONGARCH_HFLAG_BC;
+            break;
+        default:
+            generate_exception_end(ctx, EXCP_INE);
+            goto out;
+        }
+    }
+    ctx->btarget = btgt;
+
+ out:
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
-- 
1.8.3.1


