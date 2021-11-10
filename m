Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A6444C85A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 20:02:33 +0100 (CET)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mksrg-000304-HF
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 14:02:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mksob-0008U0-Qp; Wed, 10 Nov 2021 13:59:21 -0500
Received: from [201.28.113.2] (port=44873 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mksoa-0001jj-Gq; Wed, 10 Nov 2021 13:59:21 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 10 Nov 2021 15:58:05 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id DC76A800AC7;
 Wed, 10 Nov 2021 15:58:04 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 1/3] target/ppc: Implement Vector Expand Mask
Date: Wed, 10 Nov 2021 15:56:11 -0300
Message-Id: <20211110185613.550946-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110185613.550946-1-matheus.ferst@eldorado.org.br>
References: <20211110185613.550946-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Nov 2021 18:58:05.0284 (UTC)
 FILETIME=[E4B4B240:01D7D664]
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
vexpandbm: Vector Expand Byte Mask
vexpandhm: Vector Expand Halfword Mask
vexpandwm: Vector Expand Word Mask
vexpanddm: Vector Expand Doubleword Mask
vexpandqm: Vector Expand Quadword Mask

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            | 11 ++++++++++
 target/ppc/translate/vmx-impl.c.inc | 34 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e135b8aba4..9a28f1d266 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -56,6 +56,9 @@
 &VX_uim4        vrt uim vrb
 @VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
 
+&VX_tb          vrt vrb
+@VX_tb          ...... vrt:5 ..... vrb:5 ...........    &VX_tb
+
 &X              rt ra rb
 @X              ...... rt:5 ra:5 rb:5 .......... .      &X
 
@@ -408,6 +411,14 @@ VINSWVRX        000100 ..... ..... ..... 00110001111    @VX
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
 
+## Vector Mask Manipulation Instructions
+
+VEXPANDBM       000100 ..... 00000 ..... 11001000010    @VX_tb
+VEXPANDHM       000100 ..... 00001 ..... 11001000010    @VX_tb
+VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
+VEXPANDDM       000100 ..... 00011 ..... 11001000010    @VX_tb
+VEXPANDQM       000100 ..... 00100 ..... 11001000010    @VX_tb
+
 # VSX Load/Store Instructions
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index b361f73a67..58aca58f0f 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1505,6 +1505,40 @@ static bool trans_VSRDBI(DisasContext *ctx, arg_VN *a)
     return true;
 }
 
+static bool do_vexpand(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_sari(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrb),
+                      (8 << vece) - 1, 16, 16);
+
+    return true;
+}
+
+TRANS(VEXPANDBM, do_vexpand, MO_8)
+TRANS(VEXPANDHM, do_vexpand, MO_16)
+TRANS(VEXPANDWM, do_vexpand, MO_32)
+TRANS(VEXPANDDM, do_vexpand, MO_64)
+
+static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp = tcg_temp_new_i64();
+
+    get_avr64(tmp, a->vrb, true);
+    tcg_gen_sari_i64(tmp, tmp, 63);
+    set_avr64(a->vrt, tmp, false);
+    set_avr64(a->vrt, tmp, true);
+
+    tcg_temp_free_i64(tmp);
+    return true;
+}
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
     {                                                                   \
-- 
2.25.1


