Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447E0436BF5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:21:48 +0200 (CEST)
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeZM-00037i-5f
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde3l-0005rr-5L; Thu, 21 Oct 2021 15:49:05 -0400
Received: from [201.28.113.2] (port=47716 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde3i-0001rY-QT; Thu, 21 Oct 2021 15:49:04 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:47:00 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 3CCA1800145;
 Thu, 21 Oct 2021 16:47:00 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 16/33] target/ppc: Implement Vector Insert Word from GPR using
 Immediate insns
Date: Thu, 21 Oct 2021 16:45:30 -0300
Message-Id: <20211021194547.672988-17-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:47:00.0925 (UTC)
 FILETIME=[6A38F6D0:01D7C6B4]
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

Implements the following PowerISA v3.1 instructions:
vinsw: Vector Insert Word from GPR using immediate-specified index
vinsd: Vector Insert Doubleword from GPR using immediate-specified
       index

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  6 +++++
 target/ppc/translate/vmx-impl.c.inc | 34 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index b794424496..e1f76aac34 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -44,6 +44,9 @@
 &VX             vrt vra vrb
 @VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
 
+&VX_uim4        vrt uim vrb
+@VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
+
 &X              rt ra rb
 @X              ...... rt:5 ra:5 rb:5 .......... .      &X
 
@@ -353,5 +356,8 @@ VINSWRX         000100 ..... ..... ..... 01110001111    @VX
 VINSDLX         000100 ..... ..... ..... 01011001111    @VX
 VINSDRX         000100 ..... ..... ..... 01111001111    @VX
 
+VINSW           000100 ..... - .... ..... 00011001111   @VX_uim4
+VINSD           000100 ..... - .... ..... 00111001111   @VX_uim4
+
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 0c5f0dcf32..3b526977e4 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1283,6 +1283,37 @@ static bool do_vinsx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
 #endif
 }
 
+static bool do_vins_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
+                        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    if (a->uim > (16 - size)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINS* at"
+            " 0x" TARGET_FMT_lx ", UIM = %d > %d\n", ctx->cia, a->uim,
+            16 - size);
+        return true;
+    }
+
+#if defined(TARGET_PPC64)
+    return do_vinsx(ctx, a->vrt, size, false, tcg_constant_tl(a->uim),
+                    cpu_gpr[a->vrb], gen_helper);
+#else
+    bool ok;
+    TCGv_i64 val;
+
+    val = tcg_temp_new_i64();
+    tcg_gen_extu_tl_i64(val, cpu_gpr[a->vrb]);
+
+    ok = do_vinsx(ctx, a->vrt, size, false, tcg_constant_tl(a->uim), val,
+                  gen_helper);
+
+    tcg_temp_free_i64(val);
+    return ok;
+#endif
+}
+
 TRANS(VINSBLX, do_vinsx_VX, 1, false, gen_helper_VINSBLX)
 TRANS(VINSHLX, do_vinsx_VX, 2, false, gen_helper_VINSHLX)
 TRANS(VINSWLX, do_vinsx_VX, 4, false, gen_helper_VINSWLX)
@@ -1293,6 +1324,9 @@ TRANS(VINSHRX, do_vinsx_VX, 2, true, gen_helper_VINSHLX)
 TRANS(VINSWRX, do_vinsx_VX, 4, true, gen_helper_VINSWLX)
 TRANS(VINSDRX, do_vinsx_VX, 8, true, gen_helper_VINSDLX)
 
+TRANS(VINSW, do_vins_VX_uim4, 4, gen_helper_VINSWLX)
+TRANS(VINSD, do_vins_VX_uim4, 8, gen_helper_VINSDLX)
+
 static void gen_vsldoi(DisasContext *ctx)
 {
     TCGv_ptr ra, rb, rd;
-- 
2.25.1


