Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02713D0BAB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:03:19 +0200 (CEST)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m694P-0005OI-Uw
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68v3-0002Vw-QT
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49608 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68uz-0002A3-5Z
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:37 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S12; 
 Wed, 21 Jul 2021 17:53:27 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/22] target/loongarch: Add fixed point load/store
 instruction translation
Date: Wed, 21 Jul 2021 17:53:06 +0800
Message-Id: <1626861198-6133-11-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S12
X-Coremail-Antispam: 1UD129KBjvAXoWfZFy7Zw1UXw4xCrWUGry7trb_yoW8uFyDto
 WUJa15Jr4fGw17Zrn0kw1DXF4Iqr17uF43Cws0q3Z2g3W8Jr9Fqr1qgrs5Xay8GrW29ryr
 X3WSqF13t3y3Arnrn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
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
---
 target/loongarch/helper.h     |   3 +
 target/loongarch/insns.decode |  58 ++++
 target/loongarch/op_helper.c  |  15 +
 target/loongarch/trans.inc.c  | 758 ++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/translate.c  |  29 ++
 5 files changed, 863 insertions(+)

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index bbbcc26..5cd38c8 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -18,3 +18,6 @@ DEF_HELPER_2(bitrev_d, tl, env, tl)
 
 DEF_HELPER_FLAGS_1(loongarch_bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(loongarch_dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
+
+DEF_HELPER_3(asrtle_d, void, env, tl, tl)
+DEF_HELPER_3(asrtgt_d, void, env, tl, tl)
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
index 07c3d52..738e067 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -144,3 +144,18 @@ target_ulong helper_loongarch_bitswap(target_ulong rt)
 {
     return (int32_t)bitswap(rt);
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
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index 8c5ba63..e38001b 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -2116,3 +2116,761 @@ static bool trans_bstrpick_w(DisasContext *ctx, arg_bstrpick_w *a)
 
     return true;
 }
+
+/* Fixed point load/store instruction translation */
+static bool trans_ld_b(DisasContext *ctx, arg_ld_b *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_SB);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_ld_h(DisasContext *ctx, arg_ld_h *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TESW |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_ld_w(DisasContext *ctx, arg_ld_w *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TESL |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_ld_d(DisasContext *ctx, arg_ld_d *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEQ |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_st_b(DisasContext *ctx, arg_st_b *a)
+{
+    TCGv t0, t1;
+    int mem_idx = ctx->mem_idx;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    gen_load_gpr(t1, a->rd);
+    tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_8);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_st_h(DisasContext *ctx, arg_st_h *a)
+{
+    TCGv t0, t1;
+    int mem_idx = ctx->mem_idx;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    gen_load_gpr(t1, a->rd);
+    tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_TEUW |
+                       ctx->default_tcg_memop_mask);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_st_w(DisasContext *ctx, arg_st_w *a)
+{
+    TCGv t0, t1;
+    int mem_idx = ctx->mem_idx;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    gen_load_gpr(t1, a->rd);
+    tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_TEUL |
+                       ctx->default_tcg_memop_mask);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_st_d(DisasContext *ctx, arg_st_d *a)
+{
+    TCGv t0, t1;
+    int mem_idx = ctx->mem_idx;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    gen_load_gpr(t1, a->rd);
+    tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_TEQ |
+                       ctx->default_tcg_memop_mask);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+static bool trans_ld_bu(DisasContext *ctx, arg_ld_bu *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_UB);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_ld_hu(DisasContext *ctx, arg_ld_hu *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUW |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_ld_wu(DisasContext *ctx, arg_ld_wu *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si12);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUL |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_ldx_b(DisasContext *ctx, arg_ldx_b *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_SB);
+    tcg_gen_mov_tl(Rd, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_ldx_h(DisasContext *ctx, arg_ldx_h *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_TESW |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_ldx_w(DisasContext *ctx, arg_ldx_w *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_TESL |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_ldx_d(DisasContext *ctx, arg_ldx_d *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_TEQ |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_stx_b(DisasContext *ctx, arg_stx_b *a)
+{
+    TCGv t0, t1;
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    gen_load_gpr(t1, a->rd);
+    tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_8);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_stx_h(DisasContext *ctx, arg_stx_h *a)
+{
+    TCGv t0, t1;
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    gen_load_gpr(t1, a->rd);
+    tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_TEUW |
+                       ctx->default_tcg_memop_mask);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_stx_w(DisasContext *ctx, arg_stx_w *a)
+{
+    TCGv t0, t1;
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    gen_load_gpr(t1, a->rd);
+    tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_TEUL |
+                       ctx->default_tcg_memop_mask);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_stx_d(DisasContext *ctx, arg_stx_d *a)
+{
+    TCGv t0, t1;
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    gen_load_gpr(t1, a->rd);
+    tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_TEQ |
+                       ctx->default_tcg_memop_mask);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_ldx_bu(DisasContext *ctx, arg_ldx_bu *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
+    tcg_gen_mov_tl(Rd, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_ldx_hu(DisasContext *ctx, arg_ldx_hu *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_TEUW |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_ldx_wu(DisasContext *ctx, arg_ldx_wu *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+    TCGv Rk = cpu_gpr[a->rk];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_op_addr_add(t0, Rj, Rk);
+    tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_TEUL |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_preld(DisasContext *ctx, arg_preld *a)
+{
+    /* Treat as NOP. */
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
+    /*
+     * IBAR is a no-op in QEMU,
+     * however we need to end the translation block
+     */
+    ctx->base.is_jmp = DISAS_STOP;
+    return true;
+}
+
+static bool trans_ldptr_w(DisasContext *ctx, arg_ldptr_w *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si14 << 2);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TESL |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_stptr_w(DisasContext *ctx, arg_stptr_w *a)
+{
+    TCGv t0, t1;
+    int mem_idx = ctx->mem_idx;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si14 << 2);
+    gen_load_gpr(t1, a->rd);
+    tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_TEUL |
+                       ctx->default_tcg_memop_mask);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_ldptr_d(DisasContext *ctx, arg_ldptr_d *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+    int mem_idx = ctx->mem_idx;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si14 << 2);
+    tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEQ |
+                       ctx->default_tcg_memop_mask);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_stptr_d(DisasContext *ctx, arg_stptr_d *a)
+{
+    TCGv t0, t1;
+    int mem_idx = ctx->mem_idx;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si14 << 2);
+    gen_load_gpr(t1, a->rd);
+    tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_TEQ |
+                       ctx->default_tcg_memop_mask);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+#define ASRTGT                                \
+    do {                                      \
+        TCGv t1 = get_gpr(a->rj);             \
+        TCGv t2 = get_gpr(a->rk);             \
+        gen_helper_asrtgt_d(cpu_env, t1, t2); \
+    } while (0)
+
+#define ASRTLE                                \
+    do {                                      \
+        TCGv t1 = get_gpr(a->rj);             \
+        TCGv t2 = get_gpr(a->rk);             \
+        gen_helper_asrtle_d(cpu_env, t1, t2); \
+    } while (0)
+
+#define DECL_ARG(name)   \
+    arg_ ## name arg = { \
+        .rd = a->rd,     \
+        .rj = a->rj,     \
+        .rk = a->rk,     \
+    };
+
+static bool trans_ldgt_b(DisasContext *ctx, arg_ldgt_b *a)
+{
+    ASRTGT;
+    DECL_ARG(ldx_b)
+    trans_ldx_b(ctx, &arg);
+    return true;
+}
+
+static bool trans_ldgt_h(DisasContext *ctx, arg_ldgt_h *a)
+{
+    ASRTGT;
+    DECL_ARG(ldx_h)
+    trans_ldx_h(ctx, &arg);
+    return true;
+}
+
+static bool trans_ldgt_w(DisasContext *ctx, arg_ldgt_w *a)
+{
+    ASRTGT;
+    DECL_ARG(ldx_w)
+    trans_ldx_w(ctx, &arg);
+    return true;
+}
+
+static bool trans_ldgt_d(DisasContext *ctx, arg_ldgt_d *a)
+{
+    ASRTGT;
+    DECL_ARG(ldx_d)
+    trans_ldx_d(ctx, &arg);
+    return true;
+}
+
+static bool trans_ldle_b(DisasContext *ctx, arg_ldle_b *a)
+{
+    ASRTLE;
+    DECL_ARG(ldx_b)
+    trans_ldx_b(ctx, &arg);
+    return true;
+}
+
+static bool trans_ldle_h(DisasContext *ctx, arg_ldle_h *a)
+{
+    ASRTLE;
+    DECL_ARG(ldx_h)
+    trans_ldx_h(ctx, &arg);
+    return true;
+}
+
+static bool trans_ldle_w(DisasContext *ctx, arg_ldle_w *a)
+{
+    ASRTLE;
+    DECL_ARG(ldx_w)
+    trans_ldx_w(ctx, &arg);
+    return true;
+}
+
+static bool trans_ldle_d(DisasContext *ctx, arg_ldle_d *a)
+{
+    ASRTLE;
+    DECL_ARG(ldx_d)
+    trans_ldx_d(ctx, &arg);
+    return true;
+}
+
+static bool trans_stgt_b(DisasContext *ctx, arg_stgt_b *a)
+{
+    ASRTGT;
+    DECL_ARG(stx_b)
+    trans_stx_b(ctx, &arg);
+    return true;
+}
+
+static bool trans_stgt_h(DisasContext *ctx, arg_stgt_h *a)
+{
+    ASRTGT;
+    DECL_ARG(stx_h)
+    trans_stx_h(ctx, &arg);
+    return true;
+}
+
+static bool trans_stgt_w(DisasContext *ctx, arg_stgt_w *a)
+{
+    ASRTGT;
+    DECL_ARG(stx_w)
+    trans_stx_w(ctx, &arg);
+    return true;
+}
+
+static bool trans_stgt_d(DisasContext *ctx, arg_stgt_d *a)
+{
+    ASRTGT;
+    DECL_ARG(stx_d)
+    trans_stx_d(ctx, &arg);
+    return true;
+}
+
+static bool trans_stle_b(DisasContext *ctx, arg_stle_b *a)
+{
+    ASRTLE;
+    DECL_ARG(stx_b)
+    trans_stx_b(ctx, &arg);
+    return true;
+}
+
+static bool trans_stle_h(DisasContext *ctx, arg_stle_h *a)
+{
+    ASRTLE;
+    DECL_ARG(stx_h)
+    trans_stx_h(ctx, &arg);
+    return true;
+}
+
+static bool trans_stle_w(DisasContext *ctx, arg_stle_w *a)
+{
+    ASRTLE;
+    DECL_ARG(stx_w)
+    trans_stx_w(ctx, &arg);
+    return true;
+}
+
+static bool trans_stle_d(DisasContext *ctx, arg_stle_d *a)
+{
+    ASRTLE;
+    DECL_ARG(stx_d)
+    trans_stx_d(ctx, &arg);
+    return true;
+}
+
+#undef DECL_ARG
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index b60bdc2..6ce2d6a 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -277,6 +277,35 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     ctx->default_tcg_memop_mask = MO_UNALN;
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
-- 
1.8.3.1


