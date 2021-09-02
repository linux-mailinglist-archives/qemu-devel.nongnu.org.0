Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FFA3FEDFC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:47:39 +0200 (CEST)
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLm82-00063J-Ks
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mLm2O-0005np-BE
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:41:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36050 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mLm2E-00061x-AT
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:41:47 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxYctjxjBha2YCAA--.7003S9;
 Thu, 02 Sep 2021 20:41:20 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/21] target/loongarch: Add fixed point load/store
 instruction translation
Date: Thu,  2 Sep 2021 20:40:53 +0800
Message-Id: <1630586467-22463-8-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxYctjxjBha2YCAA--.7003S9
X-Coremail-Antispam: 1UD129KBjvAXoW3Zw17Jr43urW5JFWUJFykuFg_yoW8XryUJo
 WUCa15Jr48Gr15try3Kw18Xr4Yyryj93yDArZ8ua1DGa17Jr17Jr17Crn5Za1fJ3yqgFyf
 GF1SgF15t3yaqrnrn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, groug@kaod.org, maobibo@loongson.cn,
 mrolnik@gmail.com, shorne@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, palmer@dabbelt.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement fixed point load/store instruction translation.

This includes:
- LD.{B[U]/H[U]/W[U]/D}, ST.{B/H/W/D}
- LDX.{B[U]/H[U]/W[U]/D}, STX.{B/H/W/D}
- LDPTR.{W/D}, STPTR.{W/D}
- PRELD
- LD{GT/LE}.{B/H/W/D}, ST{GT/LE}.{B/H/W/D}
- DBAR, IBAR

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/helper.h                  |   3 +
 target/loongarch/insn_trans/trans_memory.c | 263 +++++++++++++++++++++++++++++
 target/loongarch/insns.decode              |  58 +++++++
 target/loongarch/op_helper.c               |  15 ++
 target/loongarch/translate.c               |  30 ++++
 5 files changed, 369 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_memory.c

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index e39574e..09b5a3d 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -11,3 +11,6 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_FLAGS_1(bitrev_w, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(bitrev_d, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
+
+DEF_HELPER_3(asrtle_d, void, env, tl, tl)
+DEF_HELPER_3(asrtgt_d, void, env, tl, tl)
diff --git a/target/loongarch/insn_trans/trans_memory.c b/target/loongarch/insn_trans/trans_memory.c
new file mode 100644
index 0000000..afc5d67
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_memory.c
@@ -0,0 +1,263 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+static bool gen_load(DisasContext *ctx, arg_fmt_rdrjsi12 *a,
+                     DisasExtend dst_ext, MemOp mop)
+{
+    ctx->dst_ext = dst_ext;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->si12) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->si12);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+
+    if (ctx->dst_ext) {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+static bool gen_store(DisasContext *ctx, arg_fmt_rdrjsi12 *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->si12) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->si12);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+static bool gen_loadx(DisasContext *ctx, arg_fmt_rdrjrk *a,
+                      DisasExtend dst_ext, MemOp mop)
+{
+    ctx->dst_ext = dst_ext;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+
+    if (ctx->dst_ext) {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_storex(DisasContext *ctx, arg_fmt_rdrjrk *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_load_gt(DisasContext *ctx, arg_fmt_rdrjrk *a,
+                        DisasExtend dst_ext, MemOp mop)
+{
+    ctx->dst_ext = dst_ext;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+
+    if (ctx->dst_ext) {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_load_le(DisasContext *ctx, arg_fmt_rdrjrk *a,
+                        DisasExtend dst_ext, MemOp mop)
+{
+    ctx->dst_ext = dst_ext;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+
+    if (ctx->dst_ext) {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_store_gt(DisasContext *ctx, arg_fmt_rdrjrk *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_store_le(DisasContext *ctx, arg_fmt_rdrjrk *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool trans_preld(DisasContext *ctx, arg_preld *a)
+{
+    return true;
+}
+
+static bool trans_dbar(DisasContext *ctx, arg_dbar * a)
+{
+    gen_loongarch_sync(a->whint);
+    return true;
+}
+
+static bool trans_ibar(DisasContext *ctx, arg_ibar *a)
+{
+    ctx->base.is_jmp = DISAS_STOP;
+    return true;
+}
+
+static bool gen_ldptr(DisasContext *ctx, arg_fmt_rdrjsi14 *a,
+                      DisasExtend dst_ext, MemOp mop)
+{
+    ctx->dst_ext = dst_ext;
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->si14) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->si14 << 2);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+
+    if (ctx->dst_ext) {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+static bool gen_stptr(DisasContext *ctx, arg_fmt_rdrjsi14 *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->si14) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->si14 << 2);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+TRANS(ld_b, gen_load, EXT_SIGN, MO_SB)
+TRANS(ld_h, gen_load, EXT_SIGN, MO_TESW)
+TRANS(ld_w, gen_load, EXT_SIGN, MO_TESL)
+TRANS(ld_d, gen_load, EXT_NONE, MO_TEQ)
+TRANS(st_b, gen_store, MO_SB)
+TRANS(st_h, gen_store, MO_TESW)
+TRANS(st_w, gen_store, MO_TESL)
+TRANS(st_d, gen_store, MO_TEQ)
+TRANS(ld_bu, gen_load, EXT_ZERO, MO_UB)
+TRANS(ld_hu, gen_load, EXT_ZERO, MO_TEUW)
+TRANS(ld_wu, gen_load, EXT_ZERO, MO_TEUL)
+TRANS(ldx_b, gen_loadx, EXT_SIGN, MO_SB)
+TRANS(ldx_h, gen_loadx, EXT_SIGN, MO_TESW)
+TRANS(ldx_w, gen_loadx, EXT_SIGN, MO_TESL)
+TRANS(ldx_d, gen_loadx, EXT_NONE, MO_TEQ)
+TRANS(stx_b, gen_storex, MO_SB)
+TRANS(stx_h, gen_storex, MO_TESW)
+TRANS(stx_w, gen_storex, MO_TESL)
+TRANS(stx_d, gen_storex, MO_TEQ)
+TRANS(ldx_bu, gen_loadx, EXT_ZERO, MO_UB)
+TRANS(ldx_hu, gen_loadx, EXT_ZERO, MO_TEUW)
+TRANS(ldx_wu, gen_loadx, EXT_ZERO, MO_TEUL)
+TRANS(ldptr_w, gen_ldptr, EXT_SIGN, MO_TESL)
+TRANS(stptr_w, gen_stptr, MO_TESL)
+TRANS(ldptr_d, gen_ldptr, EXT_NONE, MO_TEQ)
+TRANS(stptr_d, gen_stptr, MO_TEQ)
+TRANS(ldgt_b, gen_load_gt, EXT_SIGN, MO_SB)
+TRANS(ldgt_h, gen_load_gt, EXT_SIGN, MO_TESW)
+TRANS(ldgt_w, gen_load_gt, EXT_SIGN, MO_TESL)
+TRANS(ldgt_d, gen_load_gt, EXT_NONE, MO_TEQ)
+TRANS(ldle_b, gen_load_le, EXT_SIGN, MO_SB)
+TRANS(ldle_h, gen_load_le, EXT_SIGN, MO_TESW)
+TRANS(ldle_w, gen_load_le, EXT_SIGN, MO_TESL)
+TRANS(ldle_d, gen_load_le, EXT_NONE, MO_TEQ)
+TRANS(stgt_b, gen_store_gt, MO_SB)
+TRANS(stgt_h, gen_store_gt, MO_TESW)
+TRANS(stgt_w, gen_store_gt, MO_TESL)
+TRANS(stgt_d, gen_store_gt, MO_TEQ)
+TRANS(stle_b, gen_store_le, MO_SB)
+TRANS(stle_h, gen_store_le, MO_TESW)
+TRANS(stle_w, gen_store_le, MO_TESL)
+TRANS(stle_d, gen_store_le, MO_TEQ)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index ec599a9..08fd232 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -24,6 +24,9 @@
 %lsbw    10:5
 %msbd    16:6
 %lsbd    10:6
+%si14    10:s14
+%hint    0:5
+%whint   0:15
 
 #
 # Argument sets
@@ -40,6 +43,9 @@
 &fmt_rdrjrksa3      rd rj rk sa3
 &fmt_rdrjmsbwlsbw   rd rj msbw lsbw
 &fmt_rdrjmsbdlsbd   rd rj msbd lsbd
+&fmt_rdrjsi14       rd rj si14
+&fmt_hintrjsi12     hint rj si12
+&fmt_whint          whint
 
 #
 # Formats
@@ -56,6 +62,9 @@
 @fmt_rdrjmsbwlsbw    .... ....... ..... . ..... ..... .....   &fmt_rdrjmsbwlsbw   %rd %rj %msbw %lsbw
 @fmt_rdrjmsbdlsbd    .... ...... ...... ...... ..... .....    &fmt_rdrjmsbdlsbd   %rd %rj %msbd %lsbd
 @fmt_rdrjrksa3       .... ........ .. ... ..... ..... .....   &fmt_rdrjrksa3      %rd %rj %rk %sa3
+@fmt_hintrjsi12      .... ...... ............ ..... .....     &fmt_hintrjsi12     %hint %rj %si12
+@fmt_whint           .... ........ ..... ...............      &fmt_whint          %whint
+@fmt_rdrjsi14        .... .... .............. ..... .....     &fmt_rdrjsi14       %rd %rj %si14
 
 #
 # Fixed point arithmetic operation instruction
@@ -158,3 +167,52 @@ bstrins_w        0000 0000011 ..... 0 ..... ..... .....   @fmt_rdrjmsbwlsbw
 bstrpick_w       0000 0000011 ..... 1 ..... ..... .....   @fmt_rdrjmsbwlsbw
 bstrins_d        0000 000010 ...... ...... ..... .....    @fmt_rdrjmsbdlsbd
 bstrpick_d       0000 000011 ...... ...... ..... .....    @fmt_rdrjmsbdlsbd
+
+#
+# Fixed point load/store instruction
+#
+ld_b             0010 100000 ............ ..... .....     @fmt_rdrjsi12
+ld_h             0010 100001 ............ ..... .....     @fmt_rdrjsi12
+ld_w             0010 100010 ............ ..... .....     @fmt_rdrjsi12
+ld_d             0010 100011 ............ ..... .....     @fmt_rdrjsi12
+st_b             0010 100100 ............ ..... .....     @fmt_rdrjsi12
+st_h             0010 100101 ............ ..... .....     @fmt_rdrjsi12
+st_w             0010 100110 ............ ..... .....     @fmt_rdrjsi12
+st_d             0010 100111 ............ ..... .....     @fmt_rdrjsi12
+ld_bu            0010 101000 ............ ..... .....     @fmt_rdrjsi12
+ld_hu            0010 101001 ............ ..... .....     @fmt_rdrjsi12
+ld_wu            0010 101010 ............ ..... .....     @fmt_rdrjsi12
+ldx_b            0011 10000000 00000 ..... ..... .....    @fmt_rdrjrk
+ldx_h            0011 10000000 01000 ..... ..... .....    @fmt_rdrjrk
+ldx_w            0011 10000000 10000 ..... ..... .....    @fmt_rdrjrk
+ldx_d            0011 10000000 11000 ..... ..... .....    @fmt_rdrjrk
+stx_b            0011 10000001 00000 ..... ..... .....    @fmt_rdrjrk
+stx_h            0011 10000001 01000 ..... ..... .....    @fmt_rdrjrk
+stx_w            0011 10000001 10000 ..... ..... .....    @fmt_rdrjrk
+stx_d            0011 10000001 11000 ..... ..... .....    @fmt_rdrjrk
+ldx_bu           0011 10000010 00000 ..... ..... .....    @fmt_rdrjrk
+ldx_hu           0011 10000010 01000 ..... ..... .....    @fmt_rdrjrk
+ldx_wu           0011 10000010 10000 ..... ..... .....    @fmt_rdrjrk
+preld            0010 101011 ............ ..... .....     @fmt_hintrjsi12
+dbar             0011 10000111 00100 ...............      @fmt_whint
+ibar             0011 10000111 00101 ...............      @fmt_whint
+ldptr_w          0010 0100 .............. ..... .....     @fmt_rdrjsi14
+stptr_w          0010 0101 .............. ..... .....     @fmt_rdrjsi14
+ldptr_d          0010 0110 .............. ..... .....     @fmt_rdrjsi14
+stptr_d          0010 0111 .............. ..... .....     @fmt_rdrjsi14
+ldgt_b           0011 10000111 10000 ..... ..... .....    @fmt_rdrjrk
+ldgt_h           0011 10000111 10001 ..... ..... .....    @fmt_rdrjrk
+ldgt_w           0011 10000111 10010 ..... ..... .....    @fmt_rdrjrk
+ldgt_d           0011 10000111 10011 ..... ..... .....    @fmt_rdrjrk
+ldle_b           0011 10000111 10100 ..... ..... .....    @fmt_rdrjrk
+ldle_h           0011 10000111 10101 ..... ..... .....    @fmt_rdrjrk
+ldle_w           0011 10000111 10110 ..... ..... .....    @fmt_rdrjrk
+ldle_d           0011 10000111 10111 ..... ..... .....    @fmt_rdrjrk
+stgt_b           0011 10000111 11000 ..... ..... .....    @fmt_rdrjrk
+stgt_h           0011 10000111 11001 ..... ..... .....    @fmt_rdrjrk
+stgt_w           0011 10000111 11010 ..... ..... .....    @fmt_rdrjrk
+stgt_d           0011 10000111 11011 ..... ..... .....    @fmt_rdrjrk
+stle_b           0011 10000111 11100 ..... ..... .....    @fmt_rdrjrk
+stle_h           0011 10000111 11101 ..... ..... .....    @fmt_rdrjrk
+stle_w           0011 10000111 11110 ..... ..... .....    @fmt_rdrjrk
+stle_d           0011 10000111 11111 ..... ..... .....    @fmt_rdrjrk
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index ec04369..a4ffaf9 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -42,3 +42,18 @@ target_ulong helper_bitswap(target_ulong v)
         ((v & (target_ulong)0x0F0F0F0F0F0F0F0FULL) << 4);
     return v;
 }
+
+/* loongarch assert op */
+void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
+{
+    if (rj > rk) {
+        do_raise_exception(env, EXCP_ADE, GETPC());
+    }
+}
+
+void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
+{
+    if (rj <= rk) {
+        do_raise_exception(env, EXCP_ADE, GETPC());
+    }
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 4ed3d3b..b653a4d 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -66,6 +66,35 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     ctx->zero = tcg_constant_tl(0);
 }
 
+/* loongarch sync */
+static void gen_loongarch_sync(int stype)
+{
+    TCGBar tcg_mo = TCG_BAR_SC;
+
+    switch (stype) {
+    case 0x4: /* SYNC_WMB */
+        tcg_mo |= TCG_MO_ST_ST;
+        break;
+    case 0x10: /* SYNC_MB */
+        tcg_mo |= TCG_MO_ALL;
+        break;
+    case 0x11: /* SYNC_ACQUIRE */
+        tcg_mo |= TCG_MO_LD_LD | TCG_MO_LD_ST;
+        break;
+    case 0x12: /* SYNC_RELEASE */
+        tcg_mo |= TCG_MO_ST_ST | TCG_MO_LD_ST;
+        break;
+    case 0x13: /* SYNC_RMB */
+        tcg_mo |= TCG_MO_LD_LD;
+        break;
+    default:
+        tcg_mo |= TCG_MO_ALL;
+        break;
+    }
+
+    tcg_gen_mb(tcg_mo);
+}
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
@@ -164,6 +193,7 @@ static bool gen_r3(DisasContext *ctx, arg_fmt_rdrjrk *a,
 #include "insn_trans/trans_arith.c"
 #include "insn_trans/trans_shift.c"
 #include "insn_trans/trans_bit.c"
+#include "insn_trans/trans_memory.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


