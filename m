Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E359844045D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:51:03 +0200 (CEST)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYq6-000286-Vf
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYTK-0004kj-TP; Fri, 29 Oct 2021 16:27:32 -0400
Received: from [201.28.113.2] (port=43261 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYTJ-0002IC-2Z; Fri, 29 Oct 2021 16:27:30 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:26:07 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 108EC800B36;
 Fri, 29 Oct 2021 17:26:07 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 16/34] target/ppc: Implement Vector Insert Word from GPR
 using Immediate insns
Date: Fri, 29 Oct 2021 17:24:06 -0300
Message-Id: <20211029202424.175401-17-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:26:07.0570 (UTC)
 FILETIME=[343C9320:01D7CD03]
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
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
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
v2:
- #ifdef TARGET_PPC64 removed from translation code
- Comments about real hardware behavior
---
 target/ppc/insn32.decode            |  6 +++++
 target/ppc/translate/vmx-impl.c.inc | 37 +++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

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
index 21af60c616..9642cfa037 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1278,6 +1278,40 @@ static bool do_vinsx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
     return ok;
 }
 
+static bool do_vins_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
+                        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
+{
+    bool ok;
+    TCGv_i64 val;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    if (a->uim > (16 - size)) {
+        /*
+         * PowerISA v3.1 says that the resulting value is undefined in this
+         * case, so just log a guest error and leave VRT unchanged. The
+         * real hardware would do a partial insert, e.g. if VRT is zeroed and
+         * RB is 0x12345678, executing "vinsw VRT,RB,14" results in
+         * VRT = 0x0000...00001234, but we don't bother to reproduce this
+         * behavior as software shouldn't rely on it.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINS* at"
+            " 0x" TARGET_FMT_lx ", UIM = %d > %d\n", ctx->cia, a->uim,
+            16 - size);
+        return true;
+    }
+
+    val = tcg_temp_new_i64();
+    tcg_gen_extu_tl_i64(val, cpu_gpr[a->vrb]);
+
+    ok = do_vinsx(ctx, a->vrt, size, false, tcg_constant_tl(a->uim), val,
+                  gen_helper);
+
+    tcg_temp_free_i64(val);
+    return ok;
+}
+
 TRANS(VINSBLX, do_vinsx_VX, 1, false, gen_helper_VINSBLX)
 TRANS(VINSHLX, do_vinsx_VX, 2, false, gen_helper_VINSHLX)
 TRANS(VINSWLX, do_vinsx_VX, 4, false, gen_helper_VINSWLX)
@@ -1288,6 +1322,9 @@ TRANS(VINSHRX, do_vinsx_VX, 2, true, gen_helper_VINSHLX)
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


