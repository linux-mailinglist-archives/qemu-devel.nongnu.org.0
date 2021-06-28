Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1823B5DB7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:11:28 +0200 (CEST)
Received: from localhost ([::1]:41366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxq6p-0002hR-TJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0f-0002Hj-RK
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45482 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0Y-0001A9-6D
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:05 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S11; 
 Mon, 28 Jun 2021 20:04:52 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/20] target/loongarch: Add fixed point bit instruction
 translation
Date: Mon, 28 Jun 2021 20:04:34 +0800
Message-Id: <1624881885-31692-10-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S11
X-Coremail-Antispam: 1UD129KBjvAXoWftr4rtF4fGw48ur45Ar1fJFb_yoW8uFyxZo
 W7GF15ArW8Gw1avrnIva1DXr4jqry8Cay7J39I9w1kW3W8Cry7tFyjgFn5ZayxJws2grW5
 Xa4aqFnxJ3y3Ar97n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
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
 target/loongarch/helper.h     |  10 ++
 target/loongarch/insns.decode |  45 +++++++
 target/loongarch/instmap.h    |  19 ++-
 target/loongarch/op_helper.c  | 119 +++++++++++++++++
 target/loongarch/trans.inc.c  | 233 +++++++++++++++++++++++++++++++++
 target/loongarch/translate.c  | 298 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 722 insertions(+), 2 deletions(-)

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
diff --git a/target/loongarch/instmap.h b/target/loongarch/instmap.h
index 5aaffb4..57b5a1c 100644
--- a/target/loongarch/instmap.h
+++ b/target/loongarch/instmap.h
@@ -11,12 +11,26 @@
 
 /* fixed point opcodes */
 enum {
+    LA_OPC_CLO_W     = (0x000004 << 10),
+    LA_OPC_CLZ_W     = (0x000005 << 10),
+    LA_OPC_CLO_D     = (0x000008 << 10),
+    LA_OPC_CLZ_D     = (0x000009 << 10),
+    LA_OPC_REVB_2H   = (0x00000C << 10),
+    LA_OPC_REVB_4H   = (0x00000D << 10),
+    LA_OPC_REVH_D    = (0x000011 << 10),
+    LA_OPC_BREV_4B   = (0x000012 << 10),
+    LA_OPC_BREV_8B   = (0x000013 << 10),
+    LA_OPC_EXT_WH    = (0x000016 << 10),
+    LA_OPC_EXT_WB    = (0x000017 << 10),
+
     LA_OPC_ADD_W     = (0x00020 << 15),
     LA_OPC_ADD_D     = (0x00021 << 15),
     LA_OPC_SUB_W     = (0x00022 << 15),
     LA_OPC_SUB_D     = (0x00023 << 15),
     LA_OPC_SLT       = (0x00024 << 15),
     LA_OPC_SLTU      = (0x00025 << 15),
+    LA_OPC_MASKEQZ   = (0x00026 << 15),
+    LA_OPC_MASKNEZ   = (0x00027 << 15),
     LA_OPC_NOR       = (0x00028 << 15),
     LA_OPC_AND       = (0x00029 << 15),
     LA_OPC_OR        = (0x0002A << 15),
@@ -48,8 +62,9 @@ enum {
     LA_OPC_ROTRI_W   = (0x00099 << 15),
 
     LA_OPC_ALSL_W    = (0x0002 << 17),
-    LA_OPC_ALSL_D    = (0x0016 << 17)
-
+    LA_OPC_ALSL_D    = (0x0016 << 17),
+    LA_OPC_TRINS_W   = (0x003 << 21) | (0x0 << 15),
+    LA_OPC_TRPICK_W  = (0x003 << 21) | (0x1 << 15)
 };
 
 /* 12 bit immediate opcodes */
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 97113e4..1725f9b 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -26,3 +26,122 @@ void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
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
index 7d3b45f..5473361 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -499,3 +499,236 @@ static bool trans_rotri_d(DisasContext *ctx, arg_rotri_d *a)
     tcg_temp_free(t0);
     return true;
 }
+
+/* Fixed point bit operation instruction translation */
+static bool trans_ext_w_h(DisasContext *ctx, arg_ext_w_h *a)
+{
+    gen_loongarch_bshfl(ctx, LA_OPC_EXT_WH, a->rj, a->rd);
+    return true;
+}
+
+static bool trans_ext_w_b(DisasContext *ctx, arg_ext_w_b *a)
+{
+    gen_loongarch_bshfl(ctx, LA_OPC_EXT_WB, a->rj, a->rd);
+    return true;
+}
+
+static bool trans_clo_w(DisasContext *ctx, arg_clo_w *a)
+{
+    gen_loongarch_cl(ctx, LA_OPC_CLO_W, a->rd, a->rj);
+    return true;
+}
+
+static bool trans_clz_w(DisasContext *ctx, arg_clz_w *a)
+{
+    gen_loongarch_cl(ctx, LA_OPC_CLZ_W, a->rd, a->rj);
+    return true;
+}
+
+static bool trans_cto_w(DisasContext *ctx, arg_cto_w *a)
+{
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    gen_helper_cto_w(cpu_gpr[a->rd], cpu_env, t0);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_ctz_w(DisasContext *ctx, arg_ctz_w *a)
+{
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    gen_helper_ctz_w(cpu_gpr[a->rd], cpu_env, t0);
+
+    tcg_temp_free(t0);
+    return true;
+}
+static bool trans_clo_d(DisasContext *ctx, arg_clo_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_cl(ctx, LA_OPC_CLO_D, a->rd, a->rj);
+    return true;
+}
+
+static bool trans_clz_d(DisasContext *ctx, arg_clz_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_cl(ctx, LA_OPC_CLZ_D, a->rd, a->rj);
+    return true;
+}
+
+static bool trans_cto_d(DisasContext *ctx, arg_cto_d *a)
+{
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    gen_helper_cto_d(cpu_gpr[a->rd], cpu_env, t0);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_ctz_d(DisasContext *ctx, arg_ctz_d *a)
+{
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rj);
+    gen_helper_ctz_d(cpu_gpr[a->rd], cpu_env, t0);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_revb_2h(DisasContext *ctx, arg_revb_2h *a)
+{
+    gen_loongarch_bshfl(ctx, LA_OPC_REVB_2H, a->rj, a->rd);
+    return true;
+}
+
+static bool trans_revb_4h(DisasContext *ctx, arg_revb_4h *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_bshfl(ctx, LA_OPC_REVB_4H, a->rj, a->rd);
+    return true;
+}
+
+static bool trans_revb_2w(DisasContext *ctx, arg_revb_2w *a)
+{
+    handle_rev32(ctx, a->rj, a->rd);
+    return true;
+}
+
+static bool trans_revb_d(DisasContext *ctx, arg_revb_d *a)
+{
+    handle_rev64(ctx, a->rj, a->rd);
+    return true;
+}
+static bool trans_revh_2w(DisasContext *ctx, arg_revh_2w *a)
+{
+    handle_rev16(ctx, a->rj, a->rd);
+    return true;
+}
+
+static bool trans_revh_d(DisasContext *ctx, arg_revh_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_bshfl(ctx, LA_OPC_REVH_D, a->rj, a->rd);
+    return true;
+}
+
+static bool trans_bitrev_4b(DisasContext *ctx, arg_bitrev_4b *a)
+{
+    gen_loongarch_bitswap(ctx, LA_OPC_BREV_4B, a->rd, a->rj);
+    return true;
+}
+
+static bool trans_bitrev_8b(DisasContext *ctx, arg_bitrev_8b *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_bitswap(ctx, LA_OPC_BREV_8B, a->rd, a->rj);
+    return true;
+}
+
+static bool trans_bitrev_w(DisasContext *ctx, arg_bitrev_w *a)
+{
+    TCGv t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+    gen_helper_bitrev_w(cpu_gpr[a->rd], cpu_env, t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_bitrev_d(DisasContext *ctx, arg_bitrev_d *a)
+{
+    TCGv t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+    gen_helper_bitrev_d(cpu_gpr[a->rd], cpu_env, t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_bytepick_w(DisasContext *ctx, arg_bytepick_w *a)
+{
+    gen_loongarch_align(ctx, 32, a->rd, a->rj, a->rk, a->sa2);
+    return true;
+}
+
+static bool trans_bytepick_d(DisasContext *ctx, arg_bytepick_d *a)
+{
+    check_loongarch_64(ctx);
+    gen_loongarch_align(ctx, 64, a->rd, a->rj, a->rk, a->sa3);
+    return true;
+}
+
+static bool trans_maskeqz(DisasContext *ctx, arg_maskeqz *a)
+{
+    gen_loongarch_cond_zero(ctx, LA_OPC_MASKEQZ, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_masknez(DisasContext *ctx, arg_masknez *a)
+{
+    gen_loongarch_cond_zero(ctx, LA_OPC_MASKNEZ, a->rd, a->rj, a->rk);
+    return true;
+}
+
+static bool trans_bstrins_d(DisasContext *ctx, arg_bstrins_d *a)
+{
+    int lsb = a->lsbd;
+    int msb = a->msbd;
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    if (lsb > msb) {
+        return false;
+    }
+
+    gen_load_gpr(t1, a->rj);
+    gen_load_gpr(t0, a->rd);
+    tcg_gen_deposit_tl(t0, t0, t1, lsb, msb - lsb + 1);
+    gen_store_gpr(t0, a->rd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return true;
+}
+
+static bool trans_bstrpick_d(DisasContext *ctx, arg_bstrpick_d *a)
+{
+    int lsb = a->lsbd;
+    int msb = a->msbd;
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    if (lsb > msb) {
+        return false;
+    }
+
+    gen_load_gpr(t1, a->rj);
+    gen_load_gpr(t0, a->rd);
+    tcg_gen_extract_tl(t0, t1, lsb, msb - lsb + 1);
+    gen_store_gpr(t0, a->rd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return true;
+}
+
+static bool trans_bstrins_w(DisasContext *ctx, arg_bstrins_w *a)
+{
+    gen_loongarch_bitops(ctx, LA_OPC_TRINS_W, a->rd, a->rj, a->lsbw, a->msbw);
+    return true;
+}
+
+static bool trans_bstrpick_w(DisasContext *ctx, arg_bstrpick_w *a)
+{
+    if (a->lsbw > a->msbw) {
+        return false;
+    }
+    gen_loongarch_bitops(ctx, LA_OPC_TRPICK_W,
+                         a->rd, a->rj, a->lsbw, a->msbw - a->lsbw);
+    return true;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 60f884f..8c735df 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -854,6 +854,304 @@ static void gen_loongarch_shift_imm(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t0);
 }
 
+/* loongarch bit shift */
+static void gen_loongarch_bshfl(DisasContext *ctx, uint32_t opc,
+                                int rj, int rd)
+{
+    TCGv t0;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, rj);
+    switch (opc) {
+    case LA_OPC_REVB_2H:
+        {
+            TCGv t1 = tcg_temp_new();
+            TCGv t2 = tcg_const_tl(0x00FF00FF);
+            tcg_gen_shri_tl(t1, t0, 8);
+            tcg_gen_and_tl(t1, t1, t2);
+            tcg_gen_and_tl(t0, t0, t2);
+            tcg_gen_shli_tl(t0, t0, 8);
+            tcg_gen_or_tl(t0, t0, t1);
+            tcg_temp_free(t2);
+            tcg_temp_free(t1);
+            tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
+        }
+        break;
+    case LA_OPC_EXT_WB:
+        tcg_gen_ext8s_tl(cpu_gpr[rd], t0);
+        break;
+    case LA_OPC_EXT_WH:
+        tcg_gen_ext16s_tl(cpu_gpr[rd], t0);
+        break;
+    case LA_OPC_REVB_4H:
+        {
+            TCGv t1 = tcg_temp_new();
+            TCGv t2 = tcg_const_tl(0x00FF00FF00FF00FFULL);
+            tcg_gen_shri_tl(t1, t0, 8);
+            tcg_gen_and_tl(t1, t1, t2);
+            tcg_gen_and_tl(t0, t0, t2);
+            tcg_gen_shli_tl(t0, t0, 8);
+            tcg_gen_or_tl(cpu_gpr[rd], t0, t1);
+            tcg_temp_free(t2);
+            tcg_temp_free(t1);
+        }
+        break;
+    case LA_OPC_REVH_D:
+        {
+            TCGv t1 = tcg_temp_new();
+            TCGv t2 = tcg_const_tl(0x0000FFFF0000FFFFULL);
+            tcg_gen_shri_tl(t1, t0, 16);
+            tcg_gen_and_tl(t1, t1, t2);
+            tcg_gen_and_tl(t0, t0, t2);
+            tcg_gen_shli_tl(t0, t0, 16);
+            tcg_gen_or_tl(t0, t0, t1);
+            tcg_gen_shri_tl(t1, t0, 32);
+            tcg_gen_shli_tl(t0, t0, 32);
+            tcg_gen_or_tl(cpu_gpr[rd], t0, t1);
+            tcg_temp_free(t2);
+            tcg_temp_free(t1);
+        }
+        break;
+    default:
+        gen_reserved_instruction(ctx);
+        tcg_temp_free(t0);
+        return;
+    }
+    tcg_temp_free(t0);
+}
+
+/* loongarch clo/clz */
+static void gen_loongarch_cl(DisasContext *ctx, uint32_t opc,
+                             int rd, int rj)
+{
+    TCGv t0;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+    t0 = cpu_gpr[rd];
+    gen_load_gpr(t0, rj);
+
+    switch (opc) {
+    case LA_OPC_CLO_W:
+    case LA_OPC_CLO_D:
+        tcg_gen_not_tl(t0, t0);
+        break;
+    }
+
+    switch (opc) {
+    case LA_OPC_CLO_W:
+    case LA_OPC_CLZ_W:
+        tcg_gen_ext32u_tl(t0, t0);
+        tcg_gen_clzi_tl(t0, t0, TARGET_LONG_BITS);
+        tcg_gen_subi_tl(t0, t0, TARGET_LONG_BITS - 32);
+        break;
+    case LA_OPC_CLO_D:
+    case LA_OPC_CLZ_D:
+        tcg_gen_clzi_i64(t0, t0, 64);
+        break;
+    }
+}
+
+static void handle_rev64(DisasContext *ctx,
+                         unsigned int rj, unsigned int rd)
+{
+    tcg_gen_bswap64_i64(cpu_gpr[rd], cpu_gpr[rj]);
+}
+
+static void handle_rev32(DisasContext *ctx,
+                         unsigned int rj, unsigned int rd)
+{
+    TCGv_i64 tcg_rd = tcg_temp_new_i64();
+    gen_load_gpr(tcg_rd, rd);
+
+    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
+    TCGv_i64 tcg_rj  = tcg_temp_new_i64();
+    gen_load_gpr(tcg_rj, rj);
+
+    tcg_gen_ext32u_i64(tcg_tmp, tcg_rj);
+    tcg_gen_bswap32_i64(tcg_rd, tcg_tmp);
+    tcg_gen_shri_i64(tcg_tmp, tcg_rj, 32);
+    tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp);
+    tcg_gen_concat32_i64(cpu_gpr[rd], tcg_rd, tcg_tmp);
+
+    tcg_temp_free_i64(tcg_tmp);
+    tcg_temp_free_i64(tcg_rd);
+    tcg_temp_free_i64(tcg_rj);
+}
+
+static void handle_rev16(DisasContext *ctx, unsigned int rj, unsigned int rd)
+{
+    TCGv_i64 tcg_rd = tcg_temp_new_i64();
+    TCGv_i64 tcg_rj = tcg_temp_new_i64();
+    gen_load_gpr(tcg_rd, rd);
+    gen_load_gpr(tcg_rj, rj);
+    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
+    TCGv_i64 mask = tcg_const_i64(0x0000ffff0000ffffull);
+
+    tcg_gen_shri_i64(tcg_tmp, tcg_rj, 16);
+    tcg_gen_and_i64(tcg_rd, tcg_rj, mask);
+    tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
+    tcg_gen_shli_i64(tcg_rd, tcg_rd, 16);
+    tcg_gen_or_i64(cpu_gpr[rd], tcg_rd, tcg_tmp);
+
+    tcg_temp_free_i64(mask);
+    tcg_temp_free_i64(tcg_tmp);
+    tcg_temp_free_i64(tcg_rd);
+    tcg_temp_free_i64(tcg_rj);
+}
+
+/* loongarch bit swap */
+static void gen_loongarch_bitswap(DisasContext *ctx, int opc, int rd, int rj)
+{
+    TCGv t0;
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, rj);
+    switch (opc) {
+    case LA_OPC_BREV_4B:
+        gen_helper_loongarch_bitswap(cpu_gpr[rd], t0);
+        break;
+    case LA_OPC_BREV_8B:
+        gen_helper_loongarch_dbitswap(cpu_gpr[rd], t0);
+        break;
+    }
+    tcg_temp_free(t0);
+}
+
+/* loongarch align bits */
+static void gen_loongarch_align_bits(DisasContext *ctx, int wordsz, int rd,
+                                     int rj, int rk, int bits)
+{
+    TCGv t0;
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+    t0 = tcg_temp_new();
+    if (bits == 0 || bits == wordsz) {
+        if (bits == 0) {
+            gen_load_gpr(t0, rk);
+        } else {
+            gen_load_gpr(t0, rj);
+        }
+        switch (wordsz) {
+        case 32:
+            tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
+            break;
+        case 64:
+            tcg_gen_mov_tl(cpu_gpr[rd], t0);
+            break;
+        }
+    } else {
+        TCGv t1 = tcg_temp_new();
+        gen_load_gpr(t0, rk);
+        gen_load_gpr(t1, rj);
+        switch (wordsz) {
+        case 32:
+            {
+                TCGv_i64 t2 = tcg_temp_new_i64();
+                tcg_gen_concat_tl_i64(t2, t1, t0);
+                tcg_gen_shri_i64(t2, t2, 32 - bits);
+                gen_move_low32(cpu_gpr[rd], t2);
+                tcg_temp_free_i64(t2);
+            }
+            break;
+        case 64:
+            tcg_gen_shli_tl(t0, t0, bits);
+            tcg_gen_shri_tl(t1, t1, 64 - bits);
+            tcg_gen_or_tl(cpu_gpr[rd], t1, t0);
+            break;
+        }
+        tcg_temp_free(t1);
+    }
+    tcg_temp_free(t0);
+}
+
+/* loongarch align */
+static void gen_loongarch_align(DisasContext *ctx, int wordsz, int rd,
+                                int rj, int rk, int bp)
+{
+    gen_loongarch_align_bits(ctx, wordsz, rd, rj, rk, bp * 8);
+}
+
+/* loongarch cond set zero */
+static void gen_loongarch_cond_zero(DisasContext *ctx, uint32_t opc,
+                                    int rd, int rj, int rk)
+{
+    TCGv t0, t1, t2;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, rk);
+    t1 = tcg_const_tl(0);
+    t2 = tcg_temp_new();
+    gen_load_gpr(t2, rj);
+    switch (opc) {
+    case LA_OPC_MASKEQZ:
+        tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr[rd], t0, t1, t2, t1);
+        break;
+    case LA_OPC_MASKNEZ:
+        tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr[rd], t0, t1, t2, t1);
+        break;
+    }
+    tcg_temp_free(t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t0);
+}
+
+/* loongarch bit ops */
+static void gen_loongarch_bitops(DisasContext *ctx, uint32_t opc, int rd,
+                                 int rj, int lsb, int msb)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    gen_load_gpr(t1, rj);
+    switch (opc) {
+    case LA_OPC_TRPICK_W:
+        if (lsb + msb > 31) {
+            goto fail;
+        }
+        if (msb != 31) {
+            tcg_gen_extract_tl(t0, t1, lsb, msb + 1);
+        } else {
+            tcg_gen_ext32s_tl(t0, t1);
+        }
+        break;
+    case LA_OPC_TRINS_W:
+        if (lsb > msb) {
+            goto fail;
+        }
+        gen_load_gpr(t0, rd);
+        tcg_gen_deposit_tl(t0, t0, t1, lsb, msb - lsb + 1);
+        tcg_gen_ext32s_tl(t0, t0);
+        break;
+    default:
+fail:
+        gen_reserved_instruction(ctx);
+        tcg_temp_free(t0);
+        tcg_temp_free(t1);
+        return;
+    }
+    gen_store_gpr(t0, rd);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
-- 
1.8.3.1


