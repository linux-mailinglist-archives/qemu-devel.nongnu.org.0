Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E077644C85C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 20:03:02 +0100 (CET)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkss9-0004Kx-SP
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 14:03:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mksoi-0000EL-T4; Wed, 10 Nov 2021 13:59:28 -0500
Received: from [201.28.113.2] (port=44873 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mksoh-0001jj-0V; Wed, 10 Nov 2021 13:59:28 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 10 Nov 2021 15:58:06 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6B02B800E9B;
 Wed, 10 Nov 2021 15:58:06 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 3/3] target/ppc: Implement Vector Mask Move insns
Date: Wed, 10 Nov 2021 15:56:13 -0300
Message-Id: <20211110185613.550946-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110185613.550946-1-matheus.ferst@eldorado.org.br>
References: <20211110185613.550946-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Nov 2021 18:58:06.0881 (UTC)
 FILETIME=[E5A86110:01D7D664]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
mtvsrbm: Move to VSR Byte Mask
mtvsrhm: Move to VSR Halfword Mask
mtvsrwm: Move to VSR Word Mask
mtvsrdm: Move to VSR Doubleword Mask
mtvsrqm: Move to VSR Quadword Mask
mtvsrbmi: Move to VSR Byte Mask Immediate

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  11 +++
 target/ppc/translate/vmx-impl.c.inc | 114 ++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 639ac22bf0..f68931f4f3 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -40,6 +40,10 @@
 %ds_rtp         22:4   !function=times_2
 @DS_rtp         ...... ....0 ra:5 .............. ..             &D rt=%ds_rtp si=%ds_si
 
+&DX_b           vrt b
+%dx_b           6:10 16:5 0:1
+@DX_b           ...... vrt:5  ..... .......... ..... .          &DX_b b=%dx_b
+
 &DX             rt d
 %dx_d           6:s10 16:5 0:1
 @DX             ...... rt:5  ..... .......... ..... .   &DX d=%dx_d
@@ -413,6 +417,13 @@ VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
 
 ## Vector Mask Manipulation Instructions
 
+MTVSRBM         000100 ..... 10000 ..... 11001000010    @VX_tb
+MTVSRHM         000100 ..... 10001 ..... 11001000010    @VX_tb
+MTVSRWM         000100 ..... 10010 ..... 11001000010    @VX_tb
+MTVSRDM         000100 ..... 10011 ..... 11001000010    @VX_tb
+MTVSRQM         000100 ..... 10100 ..... 11001000010    @VX_tb
+MTVSRBMI        000100 ..... ..... .......... 01010 .   @DX_b
+
 VEXPANDBM       000100 ..... 00000 ..... 11001000010    @VX_tb
 VEXPANDHM       000100 ..... 00001 ..... 11001000010    @VX_tb
 VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index c6a30614fb..9f86133d1d 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1624,6 +1624,120 @@ static bool trans_VEXTRACTQM(DisasContext *ctx, arg_VX_tb *a)
     return true;
 }
 
+static bool do_mtvsrm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    const uint64_t elem_length = 8 << vece, highest_bit = 15 >> vece;
+    int i;
+    TCGv_i64 t0, t1, zero, ones;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    t0 = tcg_const_i64(0);
+    t1 = tcg_temp_new_i64();
+    zero = tcg_constant_i64(0);
+    ones = tcg_constant_i64(MAKE_64BIT_MASK(0, elem_length));
+
+    for (i = 1 << highest_bit; i > 1 << (highest_bit / 2); i >>= 1) {
+        tcg_gen_shli_i64(t0, t0, elem_length);
+        tcg_gen_ext_tl_i64(t1, cpu_gpr[a->vrb]);
+        tcg_gen_andi_i64(t1, t1, i);
+        tcg_gen_movcond_i64(TCG_COND_NE, t1, t1, zero, ones, zero);
+        tcg_gen_or_i64(t0, t0, t1);
+    }
+
+    set_avr64(a->vrt, t0, true);
+
+    for (; i > 0; i >>= 1) {
+        tcg_gen_shli_i64(t0, t0, elem_length);
+        tcg_gen_ext_tl_i64(t1, cpu_gpr[a->vrb]);
+        tcg_gen_andi_i64(t1, t1, i);
+        tcg_gen_movcond_i64(TCG_COND_NE, t1, t1, zero, ones, zero);
+        tcg_gen_or_i64(t0, t0, t1);
+    }
+
+    set_avr64(a->vrt, t0, false);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
+TRANS(MTVSRBM, do_mtvsrm, MO_8)
+TRANS(MTVSRHM, do_mtvsrm, MO_16)
+TRANS(MTVSRWM, do_mtvsrm, MO_32)
+
+static bool trans_MTVSRDM(DisasContext *ctx, arg_VX_tb *a)
+{
+    TCGv_i64 t0, t1;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    tcg_gen_ext_tl_i64(t0, cpu_gpr[a->vrb]);
+    tcg_gen_sextract_i64(t1, t0, 1, 1);
+    set_avr64(a->vrt, t1, true);
+    tcg_gen_sextract_i64(t0, t0, 0, 1);
+    set_avr64(a->vrt, t0, false);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
+static bool trans_MTVSRQM(DisasContext *ctx, arg_VX_tb *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp = tcg_temp_new_i64();
+
+    tcg_gen_ext_tl_i64(tmp, cpu_gpr[a->vrb]);
+    tcg_gen_sextract_i64(tmp, tmp, 0, 1);
+    set_avr64(a->vrt, tmp, false);
+    set_avr64(a->vrt, tmp, true);
+
+    tcg_temp_free_i64(tmp);
+
+    return true;
+}
+
+static bool trans_MTVSRBMI(DisasContext *ctx, arg_DX_b *a)
+{
+    int i;
+    uint64_t hi = 0, lo = 0;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    for (i = 1 << 15; i >= 1 << 8; i >>= 1) {
+        hi <<= 8;
+        if (a->b & i) {
+            hi |= 0xFF;
+        }
+    }
+
+    set_avr64(a->vrt, tcg_constant_i64(hi), true);
+
+    for (; i > 0; i >>= 1) {
+        lo <<= 8;
+        if (a->b & i) {
+            lo |= 0xFF;
+        }
+    }
+
+    set_avr64(a->vrt, tcg_constant_i64(lo), false);
+
+    return true;
+}
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
     {                                                                   \
-- 
2.25.1


