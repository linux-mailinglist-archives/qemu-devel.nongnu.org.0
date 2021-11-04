Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A08445355
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 13:52:25 +0100 (CET)
Received: from localhost ([::1]:54608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micEC-00032O-L3
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 08:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic1m-0000WC-Oc; Thu, 04 Nov 2021 08:39:38 -0400
Received: from [201.28.113.2] (port=33857 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic1k-0005sq-Uc; Thu, 04 Nov 2021 08:39:34 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 09:39:17 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 0973C800E6F;
 Thu,  4 Nov 2021 09:39:17 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 04/25] target/ppc: Implement vsldbi/vsrdbi instructions
Date: Thu,  4 Nov 2021 09:36:58 -0300
Message-Id: <20211104123719.323713-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 12:39:17.0419 (UTC)
 FILETIME=[FB5D37B0:01D7D178]
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  8 ++++
 target/ppc/translate/vmx-impl.c.inc | 66 +++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 4666c06f55..257b11113d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -38,6 +38,9 @@
 %dx_d           6:s10 16:5 0:1
 @DX             ...... rt:5  ..... .......... ..... .   &DX d=%dx_d
 
+&VN             vrt vra vrb sh
+@VN             ...... vrt:5 vra:5 vrb:5 .. sh:3 ......         &VN
+
 &VX             vrt vra vrb
 @VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
 
@@ -338,3 +341,8 @@ VCLZDM          000100 ..... ..... ..... 11110000100    @VX
 VCTZDM          000100 ..... ..... ..... 11111000100    @VX
 VPDEPD          000100 ..... ..... ..... 10111001101    @VX
 VPEXTD          000100 ..... ..... ..... 10110001101    @VX
+
+## Vector Permute and Formatting Instruction
+
+VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
+VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index cddb3848ab..6edffd5637 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1257,6 +1257,72 @@ static void gen_vsldoi(DisasContext *ctx)
     tcg_temp_free_i32(sh);
 }
 
+static bool trans_VSLDBI(DisasContext *ctx, arg_VN *a)
+{
+    TCGv_i64 t0, t1, t2;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    get_avr64(t0, a->vra, true);
+    get_avr64(t1, a->vra, false);
+
+    if (a->sh != 0) {
+        t2 = tcg_temp_new_i64();
+
+        get_avr64(t2, a->vrb, true);
+
+        tcg_gen_extract2_i64(t0, t1, t0, 64 - a->sh);
+        tcg_gen_extract2_i64(t1, t2, t1, 64 - a->sh);
+
+        tcg_temp_free_i64(t2);
+    }
+
+    set_avr64(a->vrt, t0, true);
+    set_avr64(a->vrt, t1, false);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
+static bool trans_VSRDBI(DisasContext *ctx, arg_VN *a)
+{
+    TCGv_i64 t2, t1, t0;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    get_avr64(t0, a->vrb, false);
+    get_avr64(t1, a->vrb, true);
+
+    if (a->sh != 0) {
+        t2 = tcg_temp_new_i64();
+
+        get_avr64(t2, a->vra, false);
+
+        tcg_gen_extract2_i64(t0, t0, t1, a->sh);
+        tcg_gen_extract2_i64(t1, t1, t2, a->sh);
+
+        tcg_temp_free_i64(t2);
+    }
+
+    set_avr64(a->vrt, t0, false);
+    set_avr64(a->vrt, t1, true);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
     {                                                                   \
-- 
2.25.1


