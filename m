Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5A74DD3EE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 05:29:09 +0100 (CET)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV4Ee-0001sX-3L
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 00:29:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nV464-0004fk-W7; Fri, 18 Mar 2022 00:20:17 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:56942 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nV45t-0001mS-CW; Fri, 18 Mar 2022 00:20:12 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowABHKfJmCDRijsoBBA--.29102S4;
 Fri, 18 Mar 2022 12:19:53 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v9 02/14] target/riscv: rvk: add support for zbkb extension
Date: Fri, 18 Mar 2022 12:19:32 +0800
Message-Id: <20220318041944.19859-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
References: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowABHKfJmCDRijsoBBA--.29102S4
X-Coremail-Antispam: 1UD129KBjvAXoW3tFW3WFWfWFy8uF45Xr15XFb_yoW8Jrykto
 W7Gw45Jrs3Gry3ua4fK3WUXry7Zr4j9as3Jw1Y93Wqga97XrWfKryDJws5Zw4rXry3KrWr
 Ja97tFnxJwn5Wwnxn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUOU7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r15M28IrcIa0x
 kI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
 jcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbdOz7UU
 UUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, Weiwei Li <liweiwei@iscas.ac.cn>,
 lazyparser@gmail.com, luruibo2000@163.com, lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 - reuse partial instructions of zbb extension, update extension check for them
 - add brev8, pack, packh, packw, unzip, zip instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/bitmanip_helper.c          | 53 ++++++++++++++
 target/riscv/helper.h                   |  3 +
 target/riscv/insn32.decode              | 45 +++++++-----
 target/riscv/insn_trans/trans_rvb.c.inc | 94 +++++++++++++++++++++----
 target/riscv/translate.c                |  7 ++
 5 files changed, 174 insertions(+), 28 deletions(-)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index f1b5e5549f..e003e8b25b 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -49,3 +49,56 @@ target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
 
     return result;
 }
+
+static inline target_ulong do_swap(target_ulong x, uint64_t mask, int shift)
+{
+    return ((x & mask) << shift) | ((x & ~mask) >> shift);
+}
+
+target_ulong HELPER(brev8)(target_ulong rs1)
+{
+    target_ulong x = rs1;
+
+    x = do_swap(x, 0x5555555555555555ull, 1);
+    x = do_swap(x, 0x3333333333333333ull, 2);
+    x = do_swap(x, 0x0f0f0f0f0f0f0f0full, 4);
+    return x;
+}
+
+static const uint64_t shuf_masks[] = {
+    dup_const(MO_8, 0x44),
+    dup_const(MO_8, 0x30),
+    dup_const(MO_16, 0x0f00),
+    dup_const(MO_32, 0xff0000)
+};
+
+static inline target_ulong do_shuf_stage(target_ulong src, uint64_t maskL,
+                                         uint64_t maskR, int shift)
+{
+    target_ulong x = src & ~(maskL | maskR);
+
+    x |= ((src << shift) & maskL) | ((src >> shift) & maskR);
+    return x;
+}
+
+target_ulong HELPER(unzip)(target_ulong rs1)
+{
+    target_ulong x = rs1;
+
+    x = do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
+    x = do_shuf_stage(x, shuf_masks[1], shuf_masks[1] >> 2, 2);
+    x = do_shuf_stage(x, shuf_masks[2], shuf_masks[2] >> 4, 4);
+    x = do_shuf_stage(x, shuf_masks[3], shuf_masks[3] >> 8, 8);
+    return x;
+}
+
+target_ulong HELPER(zip)(target_ulong rs1)
+{
+    target_ulong x = rs1;
+
+    x = do_shuf_stage(x, shuf_masks[3], shuf_masks[3] >> 8, 8);
+    x = do_shuf_stage(x, shuf_masks[2], shuf_masks[2] >> 4, 4);
+    x = do_shuf_stage(x, shuf_masks[1], shuf_masks[1] >> 2, 2);
+    x = do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
+    return x;
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 26bbab2fab..7331d32dbf 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -66,6 +66,9 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_1(brev8, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
 
 /* Floating Point - Half Precision */
 DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1d3ff1efe1..fdceaf621a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -717,8 +717,22 @@ sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 slli_uw    00001 ............ 001 ..... 0011011 @sh
 
-# *** RV32 Zbb Standard Extension ***
+# *** RV32 Zbb/Zbkb Standard Extension ***
 andn       0100000 .......... 111 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rori       01100 ............ 101 ..... 0010011 @sh
+# The encoding for rev8 differs between RV32 and RV64.
+# rev8_32 denotes the RV32 variant.
+rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
+# The encoding for zext.h differs between RV32 and RV64.
+# zext_h_32 denotes the RV32 variant.
+{
+  zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
+  pack       0000100 ..... ..... 100 ..... 0110011 @r
+}
+xnor       0100000 .......... 100 ..... 0110011 @r
+# *** RV32 extra Zbb Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
@@ -728,23 +742,15 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 orc_b      001010 000111 ..... 101 ..... 0010011 @r2
 orn        0100000 .......... 110 ..... 0110011 @r
-# The encoding for rev8 differs between RV32 and RV64.
-# rev8_32 denotes the RV32 variant.
-rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
-rol        0110000 .......... 001 ..... 0110011 @r
-ror        0110000 .......... 101 ..... 0110011 @r
-rori       01100 ............ 101 ..... 0010011 @sh
 sext_b     011000 000100 ..... 001 ..... 0010011 @r2
 sext_h     011000 000101 ..... 001 ..... 0010011 @r2
-xnor       0100000 .......... 100 ..... 0110011 @r
-# The encoding for zext.h differs between RV32 and RV64.
-# zext_h_32 denotes the RV32 variant.
-zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
+# *** RV32 extra Zbkb Standard Extension ***
+brev8      0110100 00111 ..... 101 ..... 0010011 @r2  #grevi
+packh      0000100  .......... 111 ..... 0110011 @r
+unzip      0000100 01111 ..... 101 ..... 0010011 @r2  #unshfl
+zip        0000100 01111 ..... 001 ..... 0010011 @r2  #shfl
 
-# *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
-clzw       0110000 00000 ..... 001 ..... 0011011 @r2
-ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
-cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+# *** RV64 Zbb/Zbkb Standard Extension (in addition to RV32 Zbb/Zbkb) ***
 # The encoding for rev8 differs between RV32 and RV64.
 # When executing on RV64, the encoding used in RV32 is an illegal
 # instruction, so we use different handler functions to differentiate.
@@ -755,7 +761,14 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 # The encoding for zext.h differs between RV32 and RV64.
 # When executing on RV64, the encoding used in RV32 is an illegal
 # instruction, so we use different handler functions to differentiate.
-zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
+{
+  zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
+  packw      0000100 ..... ..... 100 ..... 0111011 @r
+}
+# *** RV64 extra Zbb Standard Extension (in addition to RV32 Zbb) ***
+clzw       0110000 00000 ..... 001 ..... 0011011 @r2
+ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
 
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index e8519a6d69..f36577579d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zb[abcs] Standard Extension.
+ * RISC-V translation routines for the Zb[abcs] and Zbk[bcx] Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
@@ -42,6 +42,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_ZBKB(ctx) do {                   \
+    if (!ctx->cfg_ptr->ext_zbkb) {               \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static void gen_clz(TCGv ret, TCGv arg1)
 {
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
@@ -85,19 +91,19 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_logic(ctx, a, tcg_gen_andc_tl);
 }
 
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_logic(ctx, a, tcg_gen_orc_tl);
 }
 
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_logic(ctx, a, tcg_gen_eqv_tl);
 }
 
@@ -247,7 +253,7 @@ static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw, NULL);
 }
 
@@ -264,7 +270,7 @@ static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
 
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
                                    tcg_gen_rotri_tl, gen_roriw, NULL);
 }
@@ -289,7 +295,7 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
 
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw, NULL);
 }
 
@@ -301,14 +307,14 @@ static void gen_rev8_32(TCGv ret, TCGv src1)
 static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
     REQUIRE_32BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
 }
 
 static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
 }
 
@@ -403,7 +409,7 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     ctx->ol = MXL_RV32;
     return gen_shift(ctx, a, EXT_NONE, gen_rorw, NULL);
 }
@@ -411,7 +417,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     ctx->ol = MXL_RV32;
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
 }
@@ -419,7 +425,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     ctx->ol = MXL_RV32;
     return gen_shift(ctx, a, EXT_NONE, gen_rolw, NULL);
 }
@@ -504,3 +510,67 @@ static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
     REQUIRE_ZBC(ctx);
     return gen_arith(ctx, a, EXT_NONE, gen_helper_clmulr, NULL);
 }
+
+static void gen_pack(TCGv ret, TCGv src1, TCGv src2)
+{
+    tcg_gen_deposit_tl(ret, src1, src2,
+                       TARGET_LONG_BITS / 2,
+                       TARGET_LONG_BITS / 2);
+}
+
+static void gen_packh(TCGv ret, TCGv src1, TCGv src2)
+{
+    TCGv t = tcg_temp_new();
+
+    tcg_gen_ext8u_tl(t, src2);
+    tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
+    tcg_temp_free(t);
+}
+
+static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
+{
+    TCGv t = tcg_temp_new();
+
+    tcg_gen_ext16s_tl(t, src2);
+    tcg_gen_deposit_tl(ret, src1, t, 16, TARGET_LONG_BITS - 16);
+    tcg_temp_free(t);
+}
+
+static bool trans_brev8(DisasContext *ctx, arg_brev8 *a)
+{
+    REQUIRE_ZBKB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, gen_helper_brev8);
+}
+
+static bool trans_pack(DisasContext *ctx, arg_pack *a)
+{
+    REQUIRE_ZBKB(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_pack, NULL);
+}
+
+static bool trans_packh(DisasContext *ctx, arg_packh *a)
+{
+    REQUIRE_ZBKB(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_packh, NULL);
+}
+
+static bool trans_packw(DisasContext *ctx, arg_packw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZBKB(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_packw, NULL);
+}
+
+static bool trans_unzip(DisasContext *ctx, arg_unzip *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBKB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, gen_helper_unzip);
+}
+
+static bool trans_zip(DisasContext *ctx, arg_zip *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBKB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, gen_helper_zip);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fac998a6b5..9afb8a01e7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -688,6 +688,13 @@ EX_SH(12)
     }                                  \
 } while (0)
 
+#define REQUIRE_EITHER_EXT(ctx, A, B) do {       \
+    if (!ctx->cfg_ptr->ext_##A &&      \
+        !ctx->cfg_ptr->ext_##B) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static int ex_rvc_register(DisasContext *ctx, int reg)
 {
     return 8 + reg;
-- 
2.17.1


