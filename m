Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E2540F3F2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:18:36 +0200 (CEST)
Received: from localhost ([::1]:43864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR94t-0004mV-8x
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mR8zy-00052E-DV
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:13:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39078 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mR8zu-0006fJ-0r
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:13:30 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxleUMTkRhuvoIAA--.26151S8; 
 Fri, 17 Sep 2021 16:13:22 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/21] target/loongarch: Add fixed point bit instruction
 translation
Date: Fri, 17 Sep 2021 16:12:45 +0800
Message-Id: <1631866380-31017-7-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
References: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxleUMTkRhuvoIAA--.26151S8
X-Coremail-Antispam: 1UD129KBjvAXoW3Kw1rGFyfJr1UJryxtr17trb_yoW8Jw4kZo
 W7GF45Jr48Gr1Yvryaka48XrW8tr12ka1xJ3s5uF4jg3WxJrnrJr1UKFs5Zw48Jw1q9Fyr
 JF9aqFy3J3y3Xrn7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, yangxiaojuan@loongson.cn,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, gaosong@loongson.cn
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
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h               |   4 +
 target/loongarch/insn_trans/trans_bit.c | 255 ++++++++++++++++++++++++++++++++
 target/loongarch/insns.decode           |  45 ++++++
 target/loongarch/op_helper.c            |  22 +++
 target/loongarch/translate.c            |   1 +
 5 files changed, 327 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_bit.c

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 09bfcfd..e39574e 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -7,3 +7,7 @@
  */
 
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
+
+DEF_HELPER_FLAGS_1(bitrev_w, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(bitrev_d, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
diff --git a/target/loongarch/insn_trans/trans_bit.c b/target/loongarch/insn_trans/trans_bit.c
new file mode 100644
index 0000000..b0bee95
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_bit.c
@@ -0,0 +1,255 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+static bool gen_r2(DisasContext *ctx, arg_fmt_rdrj *a,
+                   DisasExtend src_ext, DisasExtend dst_ext,
+                   void (*func)(TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+
+    func(dest, src1);
+
+    if (dst_ext) {
+        gen_set_gpr(a->rd, dest, dst_ext);
+    }
+    return true;
+}
+
+static bool trans_bytepick_w(DisasContext *ctx, arg_bytepick_w *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    tcg_gen_concat_tl_i64(dest, src1, src2);
+    tcg_gen_sextract_i64(dest, dest, (32 - (a->sa2) * 8), 32);
+
+    return true;
+}
+
+static bool trans_bytepick_d(DisasContext *ctx, arg_bytepick_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    tcg_gen_extract2_i64(dest, src1, src2, (64 - (a->sa3) * 8));
+    return true;
+}
+
+static bool trans_bstrins_w(DisasContext *ctx, arg_bstrins_w *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (a->lsbw > a->msbw) {
+        return false;
+    }
+
+    tcg_gen_deposit_tl(dest, dest, src1, a->lsbw, a->msbw - a->lsbw + 1);
+    tcg_gen_ext32s_tl(dest, dest);
+
+    return true;
+}
+
+static bool trans_bstrins_d(DisasContext *ctx, arg_bstrins_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (a->lsbd > a->msbd) {
+        return false;
+    }
+
+    tcg_gen_deposit_tl(dest, dest, src1, a->lsbd, a->msbd - a->lsbd + 1);
+    return true;
+}
+
+static bool trans_bstrpick_w(DisasContext *ctx, arg_bstrpick_w *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (a->lsbw > a->msbw) {
+        return false;
+    }
+
+    tcg_gen_extract_tl(dest, src1, a->lsbw, a->msbw - a->lsbw + 1);
+    tcg_gen_ext32s_tl(dest, dest);
+    return true;
+}
+
+static bool trans_bstrpick_d(DisasContext *ctx, arg_bstrpick_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (a->lsbd > a->msbd) {
+        return false;
+    }
+
+    tcg_gen_extract_tl(dest, src1, a->lsbd, a->msbd - a->lsbd + 1);
+    return true;
+}
+
+static void gen_clz_w(TCGv dest, TCGv src1)
+{
+    tcg_gen_clzi_tl(dest, src1, TARGET_LONG_BITS);
+    tcg_gen_subi_tl(dest, dest, TARGET_LONG_BITS - 32);
+}
+
+static void gen_clo_w(TCGv dest, TCGv src1)
+{
+    tcg_gen_not_tl(dest, src1);
+    tcg_gen_ext32u_tl(dest, dest);
+    gen_clz_w(dest, dest);
+}
+
+static void gen_ctz_w(TCGv dest, TCGv src1)
+{
+    tcg_gen_ori_tl(dest, src1, (target_ulong)MAKE_64BIT_MASK(32, 32));
+    tcg_gen_ctzi_tl(dest, dest, 32);
+}
+
+static void gen_cto_w(TCGv dest, TCGv src1)
+{
+    tcg_gen_not_tl(dest, src1);
+    tcg_gen_ext32u_tl(dest, dest);
+    gen_ctz_w(dest, dest);
+}
+
+static void gen_clz_d(TCGv dest, TCGv src1)
+{
+    tcg_gen_clzi_i64(dest, src1, TARGET_LONG_BITS);
+}
+
+static void gen_clo_d(TCGv dest, TCGv src1)
+{
+    tcg_gen_not_tl(dest, src1);
+    gen_clz_d(dest, dest);
+}
+
+static void gen_ctz_d(TCGv dest, TCGv src1)
+{
+    tcg_gen_ctzi_tl(dest, src1, TARGET_LONG_BITS);
+}
+
+static void gen_cto_d(TCGv dest, TCGv src1)
+{
+    tcg_gen_not_tl(dest, src1);
+    gen_ctz_d(dest, dest);
+}
+
+static void gen_revb_2w(TCGv dest, TCGv src1)
+{
+    tcg_gen_bswap64_i64(dest, src1);
+    tcg_gen_rotri_i64(dest, dest, 32);
+}
+
+static void gen_revb_2h(TCGv dest, TCGv src1)
+{
+    TCGv mask = tcg_constant_tl(0x00FF00FF);
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    tcg_gen_shri_tl(t0, src1, 8);
+    tcg_gen_and_tl(t0, t0, mask);
+    tcg_gen_and_tl(t1, src1, mask);
+    tcg_gen_shli_tl(t1, t1, 8);
+    tcg_gen_or_tl(dest, t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void gen_revb_4h(TCGv dest, TCGv src1)
+{
+    TCGv mask = tcg_constant_tl(0x00FF00FF00FF00FFULL);
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    tcg_gen_shri_tl(t0, src1, 8);
+    tcg_gen_and_tl(t0, t0, mask);
+    tcg_gen_and_tl(t1, src1, mask);
+    tcg_gen_shli_tl(t1, t1, 8);
+    tcg_gen_or_tl(dest, t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void gen_revh_2w(TCGv dest, TCGv src1)
+{
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 mask = tcg_constant_i64(0x0000ffff0000ffffull);
+
+    tcg_gen_shri_i64(t0, src1, 16);
+    tcg_gen_and_i64(t1, src1, mask);
+    tcg_gen_and_i64(t0, t0, mask);
+    tcg_gen_shli_i64(t1, t1, 16);
+    tcg_gen_or_i64(dest, t1, t0);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+}
+
+static void gen_revh_d(TCGv dest, TCGv src1)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv mask = tcg_constant_tl(0x0000FFFF0000FFFFULL);
+
+    tcg_gen_shri_tl(t1, src1, 16);
+    tcg_gen_and_tl(t1, t1, mask);
+    tcg_gen_and_tl(t0, src1, mask);
+    tcg_gen_shli_tl(t0, t0, 16);
+    tcg_gen_or_tl(t0, t0, t1);
+    tcg_gen_rotri_tl(dest, t0, 32);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void gen_maskeqz(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv zero = tcg_constant_tl(0);
+
+    tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, zero, zero, src1);
+}
+
+static void gen_masknez(TCGv dest, TCGv src1, TCGv src2)
+{
+    TCGv zero = tcg_constant_tl(0);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, zero, zero, src1);
+}
+
+TRANS(ext_w_h, gen_r2, EXT_NONE, EXT_NONE, tcg_gen_ext16s_tl)
+TRANS(ext_w_b, gen_r2, EXT_NONE, EXT_NONE, tcg_gen_ext8s_tl)
+TRANS(clo_w, gen_r2, EXT_NONE, EXT_NONE, gen_clo_w)
+TRANS(clz_w, gen_r2, EXT_ZERO, EXT_NONE, gen_clz_w)
+TRANS(cto_w, gen_r2, EXT_NONE, EXT_NONE, gen_cto_w)
+TRANS(ctz_w, gen_r2, EXT_NONE, EXT_NONE, gen_ctz_w)
+TRANS(clo_d, gen_r2, EXT_NONE, EXT_NONE, gen_clo_d)
+TRANS(clz_d, gen_r2, EXT_NONE, EXT_NONE, gen_clz_d)
+TRANS(cto_d, gen_r2, EXT_NONE, EXT_NONE, gen_cto_d)
+TRANS(ctz_d, gen_r2, EXT_NONE, EXT_NONE, gen_ctz_d)
+TRANS(revb_2h, gen_r2, EXT_NONE, EXT_SIGN, gen_revb_2h)
+TRANS(revb_4h, gen_r2, EXT_NONE, EXT_NONE, gen_revb_4h)
+TRANS(revb_2w, gen_r2, EXT_NONE, EXT_NONE, gen_revb_2w)
+TRANS(revb_d, gen_r2, EXT_NONE, EXT_NONE, tcg_gen_bswap64_i64)
+TRANS(revh_2w, gen_r2, EXT_NONE, EXT_NONE, gen_revh_2w)
+TRANS(revh_d, gen_r2, EXT_NONE, EXT_NONE, gen_revh_d)
+TRANS(bitrev_4b, gen_r2, EXT_ZERO, EXT_SIGN, gen_helper_bitswap)
+TRANS(bitrev_8b, gen_r2, EXT_NONE, EXT_NONE, gen_helper_bitswap)
+TRANS(bitrev_w, gen_r2, EXT_NONE, EXT_SIGN, gen_helper_bitrev_w)
+TRANS(bitrev_d, gen_r2, EXT_NONE, EXT_NONE, gen_helper_bitrev_d)
+TRANS(maskeqz, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_maskeqz)
+TRANS(masknez, gen_r3, EXT_NONE, EXT_NONE, EXT_NONE, gen_masknez)
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
index 4d10b03..ec04369 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -20,3 +20,25 @@ void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
 {
     do_raise_exception(env, exception, GETPC());
 }
+
+
+target_ulong helper_bitrev_w(target_ulong rj)
+{
+    return (int32_t)revbit32(rj);
+}
+
+target_ulong helper_bitrev_d(target_ulong rj)
+{
+    return revbit64(rj);
+}
+
+target_ulong helper_bitswap(target_ulong v)
+{
+    v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
+        ((v & (target_ulong)0x5555555555555555ULL) << 1);
+    v = ((v >> 2) & (target_ulong)0x3333333333333333ULL) |
+        ((v & (target_ulong)0x3333333333333333ULL) << 2);
+    v = ((v >> 4) & (target_ulong)0x0F0F0F0F0F0F0F0FULL) |
+        ((v & (target_ulong)0x0F0F0F0F0F0F0F0FULL) << 4);
+    return v;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 5ef572f..38e6d17 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -143,6 +143,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "decode-insns.c.inc"
 #include "insn_trans/trans_arith.c"
 #include "insn_trans/trans_shift.c"
+#include "insn_trans/trans_bit.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


