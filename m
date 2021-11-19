Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62271456A26
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 07:19:16 +0100 (CET)
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnxEx-0006lH-BV
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 01:19:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mnx9i-0003rb-0x
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:13:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:46616 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mnx9Z-0004XD-NA
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:13:46 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj8+KQJdhSG0AAA--.1952S9;
 Fri, 19 Nov 2021 14:13:39 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 07/26] target/loongarch: Add fixed point load/store
 instruction translation
Date: Fri, 19 Nov 2021 14:13:11 +0800
Message-Id: <1637302410-24632-8-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dxj8+KQJdhSG0AAA--.1952S9
X-Coremail-Antispam: 1UD129KBjvAXoW3Zw15Wr18Aw4rAryfGr4DJwb_yoW8Gr4UWo
 WUA3WUJr48Gr15AFyqkwnYqrW2yryj9an3J398uw1UGa4xAry7JryUGrn5ZayfJryjgryr
 Ga4fJF15Jw4fXrnrn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
- LD.{B[U]/H[U]/W[U]/D}, ST.{B/H/W/D}
- LDX.{B[U]/H[U]/W[U]/D}, STX.{B/H/W/D}
- LDPTR.{W/D}, STPTR.{W/D}
- PRELD
- LD{GT/LE}.{B/H/W/D}, ST{GT/LE}.{B/H/W/D}
- DBAR, IBAR

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h                      |   3 +
 target/loongarch/insn_trans/trans_memory.c.inc | 232 +++++++++++++++++++++++++
 target/loongarch/insns.decode                  |  54 ++++++
 target/loongarch/op_helper.c                   |  15 ++
 target/loongarch/translate.c                   |  30 ++++
 5 files changed, 334 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_memory.c.inc

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 04e0245..2fe4e63 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -8,3 +8,6 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_FLAGS_1(bitrev_w, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(bitrev_d, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
+
+DEF_HELPER_3(asrtle_d, void, env, tl, tl)
+DEF_HELPER_3(asrtgt_d, void, env, tl, tl)
diff --git a/target/loongarch/insn_trans/trans_memory.c.inc b/target/loongarch/insn_trans/trans_memory.c.inc
new file mode 100644
index 0000000..1dd7deb
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_memory.c.inc
@@ -0,0 +1,232 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool gen_load(DisasContext *ctx, arg_rr_i *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+static bool gen_store(DisasContext *ctx, arg_rr_i *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
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
+static bool gen_loadx(DisasContext *ctx, arg_rrr *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_storex(DisasContext *ctx, arg_rrr *a, MemOp mop)
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
+static bool gen_load_gt(DisasContext *ctx, arg_rrr *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_load_le(DisasContext *ctx, arg_rrr *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool gen_store_gt(DisasContext *ctx, arg_rrr *a, MemOp mop)
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
+static bool gen_store_le(DisasContext *ctx, arg_rrr *a, MemOp mop)
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
+    gen_loongarch_sync(a->imm);
+    return true;
+}
+
+static bool trans_ibar(DisasContext *ctx, arg_ibar *a)
+{
+    ctx->base.is_jmp = DISAS_STOP;
+    return true;
+}
+
+static bool gen_ldptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm << 2);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+static bool gen_stptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
+{
+    TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm << 2);
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
+TRANS(ld_b, gen_load, MO_SB)
+TRANS(ld_h, gen_load, MO_TESW)
+TRANS(ld_w, gen_load, MO_TESL)
+TRANS(ld_d, gen_load, MO_TEQ)
+TRANS(st_b, gen_store, MO_SB)
+TRANS(st_h, gen_store, MO_TESW)
+TRANS(st_w, gen_store, MO_TESL)
+TRANS(st_d, gen_store, MO_TEQ)
+TRANS(ld_bu, gen_load, MO_UB)
+TRANS(ld_hu, gen_load, MO_TEUW)
+TRANS(ld_wu, gen_load, MO_TEUL)
+TRANS(ldx_b, gen_loadx, MO_SB)
+TRANS(ldx_h, gen_loadx, MO_TESW)
+TRANS(ldx_w, gen_loadx, MO_TESL)
+TRANS(ldx_d, gen_loadx, MO_TEQ)
+TRANS(stx_b, gen_storex, MO_SB)
+TRANS(stx_h, gen_storex, MO_TESW)
+TRANS(stx_w, gen_storex, MO_TESL)
+TRANS(stx_d, gen_storex, MO_TEQ)
+TRANS(ldx_bu, gen_loadx, MO_UB)
+TRANS(ldx_hu, gen_loadx, MO_TEUW)
+TRANS(ldx_wu, gen_loadx, MO_TEUL)
+TRANS(ldptr_w, gen_ldptr, MO_TESL)
+TRANS(stptr_w, gen_stptr, MO_TESL)
+TRANS(ldptr_d, gen_ldptr, MO_TEQ)
+TRANS(stptr_d, gen_stptr, MO_TEQ)
+TRANS(ldgt_b, gen_load_gt, MO_SB)
+TRANS(ldgt_h, gen_load_gt, MO_TESW)
+TRANS(ldgt_w, gen_load_gt, MO_TESL)
+TRANS(ldgt_d, gen_load_gt, MO_TEQ)
+TRANS(ldle_b, gen_load_le, MO_SB)
+TRANS(ldle_h, gen_load_le, MO_TESW)
+TRANS(ldle_w, gen_load_le, MO_TESL)
+TRANS(ldle_d, gen_load_le, MO_TEQ)
+TRANS(stgt_b, gen_store_gt, MO_SB)
+TRANS(stgt_h, gen_store_gt, MO_TESW)
+TRANS(stgt_w, gen_store_gt, MO_TESL)
+TRANS(stgt_d, gen_store_gt, MO_TEQ)
+TRANS(stle_b, gen_store_le, MO_SB)
+TRANS(stle_h, gen_store_le, MO_TESW)
+TRANS(stle_w, gen_store_le, MO_TESL)
+TRANS(stle_d, gen_store_le, MO_TEQ)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 4533706..3f4ac76 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -13,10 +13,12 @@
 #
 # Argument sets
 #
+&i            imm
 &r_i          rd imm
 &rr           rd rj
 &rrr          rd rj rk
 &rr_i         rd rj imm
+&hint_r_i     hint rj imm
 &rrr_sa       rd rj rk sa
 &rr_2bw       rd rj msbw lsbw
 &rr_2bd       rd rj msbd lsbd
@@ -24,6 +26,7 @@
 #
 # Formats
 #
+@i15                       .... ........ ..... imm:15    &i
 @rr               .... ........ ..... ..... rj:5 rd:5    &rr
 @rrr               .... ........ ..... rk:5 rj:5 rd:5    &rrr
 @r_i20                          .... ... imm:s20 rd:5    &r_i
@@ -31,7 +34,9 @@
 @rr_ui6            .... ........ .... imm:6 rj:5 rd:5    &rr_i
 @rr_i12                 .... ...... imm:s12 rj:5 rd:5    &rr_i
 @rr_ui12                 .... ...... imm:12 rj:5 rd:5    &rr_i
+@rr_i14                   .... .... imm:s14 rj:5 rd:5    &rr_i
 @rr_i16                     .... .. imm:s16 rj:5 rd:5    &rr_i
+@hint_r_i12           .... ...... imm:s12 rj:5 hint:5    &hint_r_i
 @rrr_sa2p1        .... ........ ... .. rk:5 rj:5 rd:5    &rrr_sa  sa=%sa2p1
 @rrr_sa2        .... ........ ... sa:2 rk:5 rj:5 rd:5    &rrr_sa
 @rrr_sa3         .... ........ .. sa:3 rk:5 rj:5 rd:5    &rrr_sa
@@ -139,3 +144,52 @@ bstrins_w       0000 0000011 ..... 0 ..... ..... .....   @rr_2bw
 bstrpick_w      0000 0000011 ..... 1 ..... ..... .....   @rr_2bw
 bstrins_d       0000 000010 ...... ...... ..... .....    @rr_2bd
 bstrpick_d      0000 000011 ...... ...... ..... .....    @rr_2bd
+
+#
+# Fixed point load/store instruction
+#
+ld_b            0010 100000 ............ ..... .....     @rr_i12
+ld_h            0010 100001 ............ ..... .....     @rr_i12
+ld_w            0010 100010 ............ ..... .....     @rr_i12
+ld_d            0010 100011 ............ ..... .....     @rr_i12
+st_b            0010 100100 ............ ..... .....     @rr_i12
+st_h            0010 100101 ............ ..... .....     @rr_i12
+st_w            0010 100110 ............ ..... .....     @rr_i12
+st_d            0010 100111 ............ ..... .....     @rr_i12
+ld_bu           0010 101000 ............ ..... .....     @rr_i12
+ld_hu           0010 101001 ............ ..... .....     @rr_i12
+ld_wu           0010 101010 ............ ..... .....     @rr_i12
+ldx_b           0011 10000000 00000 ..... ..... .....    @rrr
+ldx_h           0011 10000000 01000 ..... ..... .....    @rrr
+ldx_w           0011 10000000 10000 ..... ..... .....    @rrr
+ldx_d           0011 10000000 11000 ..... ..... .....    @rrr
+stx_b           0011 10000001 00000 ..... ..... .....    @rrr
+stx_h           0011 10000001 01000 ..... ..... .....    @rrr
+stx_w           0011 10000001 10000 ..... ..... .....    @rrr
+stx_d           0011 10000001 11000 ..... ..... .....    @rrr
+ldx_bu          0011 10000010 00000 ..... ..... .....    @rrr
+ldx_hu          0011 10000010 01000 ..... ..... .....    @rrr
+ldx_wu          0011 10000010 10000 ..... ..... .....    @rrr
+preld           0010 101011 ............ ..... .....     @hint_r_i12
+dbar            0011 10000111 00100 ...............      @i15
+ibar            0011 10000111 00101 ...............      @i15
+ldptr_w         0010 0100 .............. ..... .....     @rr_i14
+stptr_w         0010 0101 .............. ..... .....     @rr_i14
+ldptr_d         0010 0110 .............. ..... .....     @rr_i14
+stptr_d         0010 0111 .............. ..... .....     @rr_i14
+ldgt_b          0011 10000111 10000 ..... ..... .....    @rrr
+ldgt_h          0011 10000111 10001 ..... ..... .....    @rrr
+ldgt_w          0011 10000111 10010 ..... ..... .....    @rrr
+ldgt_d          0011 10000111 10011 ..... ..... .....    @rrr
+ldle_b          0011 10000111 10100 ..... ..... .....    @rrr
+ldle_h          0011 10000111 10101 ..... ..... .....    @rrr
+ldle_w          0011 10000111 10110 ..... ..... .....    @rrr
+ldle_d          0011 10000111 10111 ..... ..... .....    @rrr
+stgt_b          0011 10000111 11000 ..... ..... .....    @rrr
+stgt_h          0011 10000111 11001 ..... ..... .....    @rrr
+stgt_w          0011 10000111 11010 ..... ..... .....    @rrr
+stgt_d          0011 10000111 11011 ..... ..... .....    @rrr
+stle_b          0011 10000111 11100 ..... ..... .....    @rrr
+stle_h          0011 10000111 11101 ..... ..... .....    @rrr
+stle_w          0011 10000111 11110 ..... ..... .....    @rrr
+stle_d          0011 10000111 11111 ..... ..... .....    @rrr
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 1fc9d81..53ee9ff 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -41,3 +41,18 @@ target_ulong helper_bitswap(target_ulong v)
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
index c0875db..9ff83cf 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -69,6 +69,35 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
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
@@ -148,6 +177,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_arith.c.inc"
 #include "insn_trans/trans_shift.c.inc"
 #include "insn_trans/trans_bit.c.inc"
+#include "insn_trans/trans_memory.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


