Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB4467E79
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 20:53:52 +0100 (CET)
Received: from localhost ([::1]:36086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtEcx-0003Nl-Dj
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 14:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mtETQ-0004AO-Sl; Fri, 03 Dec 2021 14:44:02 -0500
Received: from [201.28.113.2] (port=9582 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mtETP-0006h3-G4; Fri, 03 Dec 2021 14:44:00 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 3 Dec 2021 16:42:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id D5659800A5A;
 Fri,  3 Dec 2021 16:42:57 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 2/3] target/ppc: Implement Vector Extract Mask
Date: Fri,  3 Dec 2021 16:42:28 -0300
Message-Id: <20211203194229.746275-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203194229.746275-1-matheus.ferst@eldorado.org.br>
References: <20211203194229.746275-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Dec 2021 19:42:58.0126 (UTC)
 FILETIME=[F94406E0:01D7E87D]
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
vextractbm: Vector Extract Byte Mask
vextracthm: Vector Extract Halfword Mask
vextractwm: Vector Extract Word Mask
vextractdm: Vector Extract Doubleword Mask
vextractqm: Vector Extract Quadword Mask

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  6 +++
 target/ppc/translate/vmx-impl.c.inc | 82 +++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9a28f1d266..639ac22bf0 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -419,6 +419,12 @@ VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
 VEXPANDDM       000100 ..... 00011 ..... 11001000010    @VX_tb
 VEXPANDQM       000100 ..... 00100 ..... 11001000010    @VX_tb
 
+VEXTRACTBM      000100 ..... 01000 ..... 11001000010    @VX_tb
+VEXTRACTHM      000100 ..... 01001 ..... 11001000010    @VX_tb
+VEXTRACTWM      000100 ..... 01010 ..... 11001000010    @VX_tb
+VEXTRACTDM      000100 ..... 01011 ..... 11001000010    @VX_tb
+VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
+
 # VSX Load/Store Instructions
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ebb0484323..96c97bf6e7 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1525,6 +1525,88 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
     return true;
 }
 
+static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    const uint64_t elem_width = 8 << vece, elem_count_half = 8 >> vece,
+                   mask = dup_const(vece, 1 << (elem_width - 1));
+    uint64_t i, j;
+    TCGv_i64 lo, hi, t0, t1;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    hi = tcg_temp_new_i64();
+    lo = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    get_avr64(lo, a->vrb, false);
+    get_avr64(hi, a->vrb, true);
+
+    tcg_gen_andi_i64(lo, lo, mask);
+    tcg_gen_andi_i64(hi, hi, mask);
+
+    /*
+     * Gather the most significant bit of each element in the highest element
+     * element. E.g. for bytes:
+     * aXXXXXXXbXXXXXXXcXXXXXXXdXXXXXXXeXXXXXXXfXXXXXXXgXXXXXXXhXXXXXXX
+     *     & dup(1 << (elem_width - 1))
+     * a0000000b0000000c0000000d0000000e0000000f0000000g0000000h0000000
+     *     << 32 - 4
+     * 0000e0000000f0000000g0000000h00000000000000000000000000000000000
+     *     |
+     * a000e000b000f000c000g000d000h000e0000000f0000000g0000000h0000000
+     *     << 16 - 2
+     * 00c000g000d000h000e0000000f0000000g0000000h000000000000000000000
+     *     |
+     * a0c0e0g0b0d0f0h0c0e0g000d0f0h000e0g00000f0h00000g0000000h0000000
+     *     << 8 - 1
+     * 0b0d0f0h0c0e0g000d0f0h000e0g00000f0h00000g0000000h00000000000000
+     *     |
+     * abcdefghbcdefgh0cdefgh00defgh000efgh0000fgh00000gh000000h0000000
+     */
+    for (i = elem_count_half / 2, j = 32; i > 0; i >>= 1, j >>= 1) {
+        tcg_gen_shli_i64(t0, hi, j - i);
+        tcg_gen_shli_i64(t1, lo, j - i);
+        tcg_gen_or_i64(hi, hi, t0);
+        tcg_gen_or_i64(lo, lo, t1);
+    }
+
+    tcg_gen_shri_i64(hi, hi, 64 - elem_count_half);
+    tcg_gen_extract2_i64(lo, lo, hi, 64 - elem_count_half);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], lo);
+
+    tcg_temp_free_i64(hi);
+    tcg_temp_free_i64(lo);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
+TRANS(VEXTRACTBM, do_vextractm, MO_8)
+TRANS(VEXTRACTHM, do_vextractm, MO_16)
+TRANS(VEXTRACTWM, do_vextractm, MO_32)
+TRANS(VEXTRACTDM, do_vextractm, MO_64)
+
+static bool trans_VEXTRACTQM(DisasContext *ctx, arg_VX_tb *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp = tcg_temp_new_i64();
+
+    get_avr64(tmp, a->vrb, true);
+    tcg_gen_shri_i64(tmp, tmp, 63);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], tmp);
+
+    tcg_temp_free_i64(tmp);
+
+    return true;
+}
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
     {                                                                   \
-- 
2.25.1


