Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846C436BA2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 21:56:58 +0200 (CEST)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeBM-0006MD-Ti
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 15:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde3e-0005am-2B; Thu, 21 Oct 2021 15:48:58 -0400
Received: from [201.28.113.2] (port=47716 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde3b-0001rY-3j; Thu, 21 Oct 2021 15:48:57 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:46:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6D9F0800145;
 Thu, 21 Oct 2021 16:46:59 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 14/33] target/ppc: Implement vsldbi/vsrdbi instructions
Date: Thu, 21 Oct 2021 16:45:28 -0300
Message-Id: <20211021194547.672988-15-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:46:59.0925 (UTC)
 FILETIME=[69A06050:01D7C6B4]
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  8 +++
 target/ppc/translate/vmx-impl.c.inc | 78 +++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

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
index b240fd5fc6..e19793f295 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1257,6 +1257,84 @@ static void gen_vsldoi(DisasContext *ctx)
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
+        /* vrt.h = (vra.h << sh) | (vra.l >> (64 - sh)) */
+        tcg_gen_shli_i64(t0, t0, a->sh);
+        tcg_gen_shri_i64(t2, t1, 64 - a->sh);
+        tcg_gen_or_i64(t0, t0, t2);
+
+        /* vrt.l = (vra.l << sh) | (vrb.h >> (64 - sh)) */
+        get_avr64(t2, a->vrb, true);
+        tcg_gen_shli_i64(t1, t1, a->sh);
+        tcg_gen_shri_i64(t2, t2, 64 - a->sh);
+        tcg_gen_or_i64(t1, t1, t2);
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
+        /* vrt.l = (vrb.l >> sh) | (vrb.h << (64 - sh)) */
+        tcg_gen_shri_i64(t0, t0, a->sh);
+        tcg_gen_shli_i64(t2, t1, 64 - a->sh);
+        tcg_gen_or_i64(t0, t0, t2);
+
+        /* vrt.h = (vrb.h >> sh) | (vra.l << (64 - sh)) */
+        get_avr64(t2, a->vra, false);
+        tcg_gen_shri_i64(t1, t1, a->sh);
+        tcg_gen_shli_i64(t2, t2, 64 - a->sh);
+        tcg_gen_or_i64(t1, t1, t2);
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


