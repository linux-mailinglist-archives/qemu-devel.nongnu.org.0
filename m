Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF93D0BA6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:59:53 +0200 (CEST)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6916-0007wW-Hg
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68uz-0002IT-Hh
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49564 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68uw-00027k-Fa
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:33 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S11; 
 Wed, 21 Jul 2021 17:53:26 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/22] target/loongarch: Add fixed point bit instruction
 translation
Date: Wed, 21 Jul 2021 17:53:05 +0800
Message-Id: <1626861198-6133-10-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S11
X-Coremail-Antispam: 1UD129KBjvAXoW3Kw15tF43Xw4rtFy7Aw1rtFb_yoW8CryrJo
 WUGa45Ar4rGw13Zrn0qa4DXr42qr1UtayfJ39093Z5W3W8Jrnrtr1jga1kXa18GF1j9rWr
 X3ZaqF1fJa13Ar97n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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

This patch implement fixed point bit instruction translation.

This includes:
- EXT.W.{B/H}
- CL{O/Z}.{W/D}, CT{O/Z}.{W/D}
- BYTEPICK.{W/D}
- REVB.{2H/4H/2W/D}
- REVH.{2W/D}
- BITREV.{4B/8B}, BITREV.{W/D}
- BSTRINS.{W/D}, BSTRPICK.{W/D}
- MASKEQZ, MASKNEZ

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/helper.h     |  10 +
 target/loongarch/insns.decode |  45 +++
 target/loongarch/op_helper.c  | 119 ++++++++
 target/loongarch/trans.inc.c  | 665 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 839 insertions(+)

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 6c7e19b..bbbcc26 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -8,3 +8,13 @@
 
 DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
+
+DEF_HELPER_2(cto_w, tl, env, tl)
+DEF_HELPER_2(ctz_w, tl, env, tl)
+DEF_HELPER_2(cto_d, tl, env, tl)
+DEF_HELPER_2(ctz_d, tl, env, tl)
+DEF_HELPER_2(bitrev_w, tl, env, tl)
+DEF_HELPER_2(bitrev_d, tl, env, tl)
+
+DEF_HELPER_FLAGS_1(loongarch_bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(loongarch_dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 9302576..ec599a9 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -13,12 +13,17 @@
 %rj      5:5
 %rk      10:5
 %sa2     15:2
+%sa3     15:3
 %si12    10:s12
 %ui12    10:12
 %si16    10:s16
 %si20    5:s20
 %ui5     10:5
 %ui6     10:6
+%msbw    16:5
+%lsbw    10:5
+%msbd    16:6
+%lsbd    10:6
 
 #
 # Argument sets
@@ -31,6 +36,10 @@
 &fmt_rdsi20         rd si20
 &fmt_rdrjui5        rd rj ui5
 &fmt_rdrjui6        rd rj ui6
+&fmt_rdrj           rd rj
+&fmt_rdrjrksa3      rd rj rk sa3
+&fmt_rdrjmsbwlsbw   rd rj msbw lsbw
+&fmt_rdrjmsbdlsbd   rd rj msbd lsbd
 
 #
 # Formats
@@ -43,6 +52,10 @@
 @fmt_rdsi20          .... ... .................... .....      &fmt_rdsi20         %rd %si20
 @fmt_rdrjui5         .... ........ ..... ..... ..... .....    &fmt_rdrjui5        %rd %rj %ui5
 @fmt_rdrjui6         .... ........ .... ...... ..... .....    &fmt_rdrjui6        %rd %rj %ui6
+@fmt_rdrj            .... ........ ..... ..... ..... .....    &fmt_rdrj           %rd %rj
+@fmt_rdrjmsbwlsbw    .... ....... ..... . ..... ..... .....   &fmt_rdrjmsbwlsbw   %rd %rj %msbw %lsbw
+@fmt_rdrjmsbdlsbd    .... ...... ...... ...... ..... .....    &fmt_rdrjmsbdlsbd   %rd %rj %msbd %lsbd
+@fmt_rdrjrksa3       .... ........ .. ... ..... ..... .....   &fmt_rdrjrksa3      %rd %rj %rk %sa3
 
 #
 # Fixed point arithmetic operation instruction
@@ -113,3 +126,35 @@ srai_w           0000 00000100 10001 ..... ..... .....    @fmt_rdrjui5
 srai_d           0000 00000100 1001 ...... ..... .....    @fmt_rdrjui6
 rotri_w          0000 00000100 11001 ..... ..... .....    @fmt_rdrjui5
 rotri_d          0000 00000100 1101 ...... ..... .....    @fmt_rdrjui6
+
+#
+# Fixed point bit operation instruction
+#
+ext_w_h          0000 00000000 00000 10110 ..... .....    @fmt_rdrj
+ext_w_b          0000 00000000 00000 10111 ..... .....    @fmt_rdrj
+clo_w            0000 00000000 00000 00100 ..... .....    @fmt_rdrj
+clz_w            0000 00000000 00000 00101 ..... .....    @fmt_rdrj
+cto_w            0000 00000000 00000 00110 ..... .....    @fmt_rdrj
+ctz_w            0000 00000000 00000 00111 ..... .....    @fmt_rdrj
+clo_d            0000 00000000 00000 01000 ..... .....    @fmt_rdrj
+clz_d            0000 00000000 00000 01001 ..... .....    @fmt_rdrj
+cto_d            0000 00000000 00000 01010 ..... .....    @fmt_rdrj
+ctz_d            0000 00000000 00000 01011 ..... .....    @fmt_rdrj
+revb_2h          0000 00000000 00000 01100 ..... .....    @fmt_rdrj
+revb_4h          0000 00000000 00000 01101 ..... .....    @fmt_rdrj
+revb_2w          0000 00000000 00000 01110 ..... .....    @fmt_rdrj
+revb_d           0000 00000000 00000 01111 ..... .....    @fmt_rdrj
+revh_2w          0000 00000000 00000 10000 ..... .....    @fmt_rdrj
+revh_d           0000 00000000 00000 10001 ..... .....    @fmt_rdrj
+bitrev_4b        0000 00000000 00000 10010 ..... .....    @fmt_rdrj
+bitrev_8b        0000 00000000 00000 10011 ..... .....    @fmt_rdrj
+bitrev_w         0000 00000000 00000 10100 ..... .....    @fmt_rdrj
+bitrev_d         0000 00000000 00000 10101 ..... .....    @fmt_rdrj
+bytepick_w       0000 00000000 100 .. ..... ..... .....   @fmt_rdrjrksa2
+bytepick_d       0000 00000000 11 ... ..... ..... .....   @fmt_rdrjrksa3
+maskeqz          0000 00000001 00110 ..... ..... .....    @fmt_rdrjrk
+masknez          0000 00000001 00111 ..... ..... .....    @fmt_rdrjrk
+bstrins_w        0000 0000011 ..... 0 ..... ..... .....   @fmt_rdrjmsbwlsbw
+bstrpick_w       0000 0000011 ..... 1 ..... ..... .....   @fmt_rdrjmsbwlsbw
+bstrins_d        0000 000010 ...... ...... ..... .....    @fmt_rdrjmsbdlsbd
+bstrpick_d       0000 000011 ...... ...... ..... .....    @fmt_rdrjmsbdlsbd
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index b2cbdd7..07c3d52 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -25,3 +25,122 @@ void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
 {
     do_raise_exception(env, exception, GETPC());
 }
+
+target_ulong helper_cto_w(CPULoongArchState *env, target_ulong rj)
+{
+    uint32_t v = (uint32_t)rj;
+    int temp = 0;
+
+    while ((v & 0x1) == 1) {
+        temp++;
+        v = v >> 1;
+    }
+
+    return (target_ulong)temp;
+}
+
+target_ulong helper_ctz_w(CPULoongArchState *env, target_ulong rj)
+{
+    uint32_t v = (uint32_t)rj;
+
+    if (v == 0) {
+        return 32;
+    }
+
+    int temp = 0;
+    while ((v & 0x1) == 0) {
+        temp++;
+        v = v >> 1;
+    }
+
+    return (target_ulong)temp;
+}
+
+target_ulong helper_cto_d(CPULoongArchState *env, target_ulong rj)
+{
+    uint64_t v = rj;
+    int temp = 0;
+
+    while ((v & 0x1) == 1) {
+        temp++;
+        v = v >> 1;
+    }
+
+    return (target_ulong)temp;
+}
+
+target_ulong helper_ctz_d(CPULoongArchState *env, target_ulong rj)
+{
+    uint64_t v = rj;
+
+    if (v == 0) {
+        return 64;
+    }
+
+    int temp = 0;
+    while ((v & 0x1) == 0) {
+        temp++;
+        v = v >> 1;
+    }
+
+    return (target_ulong)temp;
+}
+
+target_ulong helper_bitrev_w(CPULoongArchState *env, target_ulong rj)
+{
+    int32_t v = (int32_t)rj;
+    const int SIZE = 32;
+    uint8_t bytes[SIZE];
+
+    int i;
+    for (i = 0; i < SIZE; i++) {
+        bytes[i] = v & 0x1;
+        v = v >> 1;
+    }
+    /* v == 0 */
+    for (i = 0; i < SIZE; i++) {
+        v = v | ((uint32_t)bytes[i] << (SIZE - 1 - i));
+    }
+
+    return (target_ulong)(int32_t)v;
+}
+
+target_ulong helper_bitrev_d(CPULoongArchState *env, target_ulong rj)
+{
+    uint64_t v = rj;
+    const int SIZE = 64;
+    uint8_t bytes[SIZE];
+
+    int i;
+    for (i = 0; i < SIZE; i++) {
+        bytes[i] = v & 0x1;
+        v = v >> 1;
+    }
+    /* v == 0 */
+    for (i = 0; i < SIZE; i++) {
+        v = v | ((uint64_t)bytes[i] << (SIZE - 1 - i));
+    }
+
+    return (target_ulong)v;
+}
+
+static inline target_ulong bitswap(target_ulong v)
+{
+    v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
+        ((v & (target_ulong)0x5555555555555555ULL) << 1);
+    v = ((v >> 2) & (target_ulong)0x3333333333333333ULL) |
+        ((v & (target_ulong)0x3333333333333333ULL) << 2);
+    v = ((v >> 4) & (target_ulong)0x0F0F0F0F0F0F0F0FULL) |
+        ((v & (target_ulong)0x0F0F0F0F0F0F0F0FULL) << 4);
+    return v;
+}
+
+target_ulong helper_loongarch_dbitswap(target_ulong rj)
+{
+    return bitswap(rj);
+}
+
+target_ulong helper_loongarch_bitswap(target_ulong rt)
+{
+    return (int32_t)bitswap(rt);
+}
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index 62e9396..8c5ba63 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -1451,3 +1451,668 @@ static bool trans_rotri_d(DisasContext *ctx, arg_rotri_d *a)
 
     return true;
 }
+
+/* Fixed point bit operation instruction translation */
+static bool trans_ext_w_h(DisasContext *ctx, arg_ext_w_h *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+
+    tcg_gen_ext16s_tl(Rd, t0);
+
+    return true;
+}
+
+static bool trans_ext_w_b(DisasContext *ctx, arg_ext_w_b *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rj);
+
+    tcg_gen_ext8s_tl(Rd, t0);
+
+    return true;
+}
+
+static bool trans_clo_w(DisasContext *ctx, arg_clo_w *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    gen_load_gpr(Rd, a->rj);
+
+    tcg_gen_not_tl(Rd, Rd);
+    tcg_gen_ext32u_tl(Rd, Rd);
+    tcg_gen_clzi_tl(Rd, Rd, TARGET_LONG_BITS);
+    tcg_gen_subi_tl(Rd, Rd, TARGET_LONG_BITS - 32);
+
+    return true;
+}
+
+static bool trans_clz_w(DisasContext *ctx, arg_clz_w *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    gen_load_gpr(Rd, a->rj);
+
+    tcg_gen_ext32u_tl(Rd, Rd);
+    tcg_gen_clzi_tl(Rd, Rd, TARGET_LONG_BITS);
+    tcg_gen_subi_tl(Rd, Rd, TARGET_LONG_BITS - 32);
+
+    return true;
+}
+
+static bool trans_cto_w(DisasContext *ctx, arg_cto_w *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+
+    gen_helper_cto_w(Rd, cpu_env, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_ctz_w(DisasContext *ctx, arg_ctz_w *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+
+    gen_helper_ctz_w(Rd, cpu_env, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+static bool trans_clo_d(DisasContext *ctx, arg_clo_d *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    check_loongarch_64(ctx);
+    gen_load_gpr(Rd, a->rj);
+    tcg_gen_not_tl(Rd, Rd);
+    tcg_gen_clzi_i64(Rd, Rd, 64);
+
+    return true;
+}
+
+static bool trans_clz_d(DisasContext *ctx, arg_clz_d *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    check_loongarch_64(ctx);
+    gen_load_gpr(Rd, a->rj);
+    tcg_gen_clzi_i64(Rd, Rd, 64);
+
+    return true;
+}
+
+static bool trans_cto_d(DisasContext *ctx, arg_cto_d *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+
+    gen_helper_cto_d(Rd, cpu_env, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_ctz_d(DisasContext *ctx, arg_ctz_d *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+
+    gen_helper_ctz_d(Rd, cpu_env, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_revb_2h(DisasContext *ctx, arg_revb_2h *a)
+{
+    TCGv t0, t1, mask;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    mask = tcg_const_tl(0x00FF00FF);
+
+    gen_load_gpr(t0, a->rj);
+
+    tcg_gen_shri_tl(t1, t0, 8);
+    tcg_gen_and_tl(t1, t1, mask);
+    tcg_gen_and_tl(t0, t0, mask);
+    tcg_gen_shli_tl(t0, t0, 8);
+    tcg_gen_or_tl(t0, t0, t1);
+    tcg_gen_ext32s_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(mask);
+
+    return true;
+}
+
+static bool trans_revb_4h(DisasContext *ctx, arg_revb_4h *a)
+{
+    TCGv t0, t1, mask;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    mask = tcg_const_tl(0x00FF00FF00FF00FFULL);
+
+    gen_load_gpr(t0, a->rj);
+
+    check_loongarch_64(ctx);
+    tcg_gen_shri_tl(t1, t0, 8);
+    tcg_gen_and_tl(t1, t1, mask);
+    tcg_gen_and_tl(t0, t0, mask);
+    tcg_gen_shli_tl(t0, t0, 8);
+    tcg_gen_or_tl(Rd, t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(mask);
+
+    return true;
+}
+
+static bool trans_revb_2w(DisasContext *ctx, arg_revb_2w *a)
+{
+    TCGv_i64 t0, t1, t2;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = get_gpr(a->rj);
+
+    gen_load_gpr(t0, a->rd);
+
+    tcg_gen_ext32u_i64(t1, t2);
+    tcg_gen_bswap32_i64(t0, t1);
+    tcg_gen_shri_i64(t1, t2, 32);
+    tcg_gen_bswap32_i64(t1, t1);
+    tcg_gen_concat32_i64(Rd, t0, t1);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
+static bool trans_revb_d(DisasContext *ctx, arg_revb_d *a)
+{
+    TCGv Rd = cpu_gpr[a->rd];
+    TCGv Rj = cpu_gpr[a->rj];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    check_loongarch_64(ctx);
+    tcg_gen_bswap64_i64(Rd, Rj);
+
+    return true;
+}
+
+static bool trans_revh_2w(DisasContext *ctx, arg_revh_2w *a)
+{
+    TCGv_i64 t0, t1, t2, mask;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = get_gpr(a->rj);
+    mask = tcg_const_i64(0x0000ffff0000ffffull);
+
+    gen_load_gpr(t1, a->rd);
+
+    tcg_gen_shri_i64(t0, t2, 16);
+    tcg_gen_and_i64(t1, t2, mask);
+    tcg_gen_and_i64(t0, t0, mask);
+    tcg_gen_shli_i64(t1, t1, 16);
+    tcg_gen_or_i64(Rd, t1, t0);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(mask);
+
+    return true;
+}
+
+static bool trans_revh_d(DisasContext *ctx, arg_revh_d *a)
+{
+    TCGv t0, t1, mask;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    mask = tcg_const_tl(0x0000FFFF0000FFFFULL);
+
+    gen_load_gpr(t0, a->rj);
+
+    check_loongarch_64(ctx);
+    tcg_gen_shri_tl(t1, t0, 16);
+    tcg_gen_and_tl(t1, t1, mask);
+    tcg_gen_and_tl(t0, t0, mask);
+    tcg_gen_shli_tl(t0, t0, 16);
+    tcg_gen_or_tl(t0, t0, t1);
+    tcg_gen_shri_tl(t1, t0, 32);
+    tcg_gen_shli_tl(t0, t0, 32);
+    tcg_gen_or_tl(Rd, t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(mask);
+
+    return true;
+}
+
+static bool trans_bitrev_4b(DisasContext *ctx, arg_bitrev_4b *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+
+    gen_helper_loongarch_bitswap(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_bitrev_8b(DisasContext *ctx, arg_bitrev_8b *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+
+    check_loongarch_64(ctx);
+    gen_helper_loongarch_dbitswap(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_bitrev_w(DisasContext *ctx, arg_bitrev_w *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+
+    gen_helper_bitrev_w(Rd, cpu_env, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_bitrev_d(DisasContext *ctx, arg_bitrev_d *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+
+    check_loongarch_64(ctx);
+    gen_helper_bitrev_d(Rd, cpu_env, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_bytepick_w(DisasContext *ctx, arg_bytepick_w *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (a->sa2 == 0 || ((a->sa2) * 8) == 32) {
+        if (a->sa2 == 0) {
+            t0 = get_gpr(a->rk);
+        } else {
+            t0 = get_gpr(a->rj);
+        }
+            tcg_gen_ext32s_tl(Rd, t0);
+    } else {
+        t0 = get_gpr(a->rk);
+
+        TCGv t1 = get_gpr(a->rj);
+        TCGv_i64 t2 = tcg_temp_new_i64();
+
+        tcg_gen_concat_tl_i64(t2, t1, t0);
+        tcg_gen_shri_i64(t2, t2, 32 - ((a->sa2) * 8));
+        tcg_gen_ext32s_i64(Rd, t2);
+
+        tcg_temp_free_i64(t2);
+    }
+
+    return true;
+}
+
+static bool trans_bytepick_d(DisasContext *ctx, arg_bytepick_d *a)
+{
+    TCGv t0;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    check_loongarch_64(ctx);
+    if (a->sa3 == 0 || ((a->sa3) * 8) == 64) {
+        if (a->sa3 == 0) {
+            gen_load_gpr(t0, a->rk);
+        } else {
+            gen_load_gpr(t0, a->rj);
+        }
+            tcg_gen_mov_tl(Rd, t0);
+    } else {
+        TCGv t1 = tcg_temp_new();
+
+        gen_load_gpr(t0, a->rk);
+        gen_load_gpr(t1, a->rj);
+
+        tcg_gen_shli_tl(t0, t0, ((a->sa3) * 8));
+        tcg_gen_shri_tl(t1, t1, 64 - ((a->sa3) * 8));
+        tcg_gen_or_tl(Rd, t1, t0);
+
+        tcg_temp_free(t1);
+    }
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_maskeqz(DisasContext *ctx, arg_maskeqz *a)
+{
+    TCGv t0, t1, t2;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rk);
+    t1 = get_gpr(a->rj);
+    t2 = tcg_const_tl(0);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, Rd, t0, t2, t1, t2);
+
+    tcg_temp_free(t2);
+
+    return true;
+}
+
+static bool trans_masknez(DisasContext *ctx, arg_masknez *a)
+{
+    TCGv t0, t1, t2;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = get_gpr(a->rk);
+    t1 = get_gpr(a->rj);
+    t2 = tcg_const_tl(0);
+
+    tcg_gen_movcond_tl(TCG_COND_EQ, Rd, t0, t2, t1, t2);
+
+    tcg_temp_free(t2);
+
+    return true;
+}
+
+static bool trans_bstrins_d(DisasContext *ctx, arg_bstrins_d *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    int lsb = a->lsbd;
+    int msb = a->msbd;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (lsb > msb) {
+        return false;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = get_gpr(a->rj);
+
+    gen_load_gpr(t0, a->rd);
+
+    tcg_gen_deposit_tl(t0, t0, t1, lsb, msb - lsb + 1);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_bstrpick_d(DisasContext *ctx, arg_bstrpick_d *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    int lsb = a->lsbd;
+    int msb = a->msbd;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (lsb > msb) {
+        return false;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = get_gpr(a->rj);
+
+    gen_load_gpr(t0, a->rd);
+
+    tcg_gen_extract_tl(t0, t1, lsb, msb - lsb + 1);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_bstrins_w(DisasContext *ctx, arg_bstrins_w *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    int lsb = a->lsbw;
+    int msb = a->msbw;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if (lsb > msb) {
+        return false;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = get_gpr(a->rj);
+
+    gen_load_gpr(t0, a->rd);
+
+    tcg_gen_deposit_tl(t0, t0, t1, lsb, msb - lsb + 1);
+    tcg_gen_ext32s_tl(t0, t0);
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_bstrpick_w(DisasContext *ctx, arg_bstrpick_w *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+    int lsb = a->lsbw;
+    int msb = a->msbw;
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    if ((a->lsbw > a->msbw) || (lsb + msb > 31)) {
+        return false;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = get_gpr(a->rj);
+
+    if (msb != 31) {
+        tcg_gen_extract_tl(t0, t1, lsb, msb + 1);
+    } else {
+        tcg_gen_ext32s_tl(t0, t1);
+    }
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+
+    return true;
+}
-- 
1.8.3.1


