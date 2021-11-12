Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC8444E88F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 15:22:15 +0100 (CET)
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlXRV-0003lG-V8
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 09:22:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mlXKe-000676-Vb; Fri, 12 Nov 2021 09:15:09 -0500
Received: from [201.28.113.2] (port=37434 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mlXKd-0007oL-51; Fri, 12 Nov 2021 09:15:08 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 12 Nov 2021 11:14:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id E44FB80009B;
 Fri, 12 Nov 2021 11:14:50 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 2/3] target/ppc: Implement Vector Extract Mask
Date: Fri, 12 Nov 2021 11:14:29 -0300
Message-Id: <20211112141430.631732-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112141430.631732-1-matheus.ferst@eldorado.org.br>
References: <20211112141430.631732-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 Nov 2021 14:14:51.0343 (UTC)
 FILETIME=[A85A95F0:01D7D7CF]
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

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v2:
- Applied rth suggestion to do_vextractm
---
 target/ppc/insn32.decode            |  6 +++
 target/ppc/translate/vmx-impl.c.inc | 60 +++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

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
index 58aca58f0f..dd7337c2f2 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1539,6 +1539,66 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
     return true;
 }
 
+static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    const uint64_t elem_width = 8 << vece, elem_count_half = 8 >> vece;
+    TCGv_i64 t, b, tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    t = tcg_const_i64(0);
+    b = tcg_temp_new_i64();
+    tmp = tcg_temp_new_i64();
+
+    for (int w = 0; w < 2; w++) {
+        get_avr64(b, a->vrb, w);
+
+        for (int i = 0; i < elem_count_half; i++) {
+            int in_bit = (i + 1) * elem_width - 1;
+            int out_bit = w * elem_count_half + i;
+
+            if (in_bit > out_bit) {
+                tcg_gen_shri_i64(tmp, b, in_bit - out_bit);
+            } else {
+                tcg_gen_shli_i64(tmp, b, out_bit - in_bit);
+            }
+            tcg_gen_andi_i64(tmp, tmp, 1 << out_bit);
+            tcg_gen_or_i64(t, t, tmp);
+        }
+    }
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], t);
+
+    tcg_temp_free_i64(t);
+    tcg_temp_free_i64(b);
+    tcg_temp_free_i64(tmp);
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


