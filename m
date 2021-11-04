Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F18A44535F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 13:54:38 +0100 (CET)
Received: from localhost ([::1]:58894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micGI-00060S-QJ
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 08:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic1f-0000Qj-RC; Thu, 04 Nov 2021 08:39:27 -0400
Received: from [201.28.113.2] (port=33857 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic1e-0005sq-BW; Thu, 04 Nov 2021 08:39:27 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 09:39:16 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 38ADE800BA7;
 Thu,  4 Nov 2021 09:39:16 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 02/25] target/ppc: Implement vclzdm/vctzdm instructions
Date: Thu,  4 Nov 2021 09:36:56 -0300
Message-Id: <20211104123719.323713-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 12:39:16.0620 (UTC)
 FILETIME=[FAE34CC0:01D7D178]
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

The signature of do_cntzdm is changed to allow reuse as GVecGen3i.fni8.
The method is also moved out of #ifdef TARGET_PPC64, as PowerISA doesn't
say vclzdm and vctzdm are 64-bit only.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode                   |  2 ++
 target/ppc/translate/fixedpoint-impl.c.inc |  4 +--
 target/ppc/translate/vmx-impl.c.inc        | 32 ++++++++++++++++++++++
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 65075f0d03..6ce06b231d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -334,3 +334,5 @@ DSCRIQ          111111 ..... ..... ...... 001100010 .   @Z22_tap_sh_rc
 ## Vector Bit Manipulation Instruction
 
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
+VCLZDM          000100 ..... ..... ..... 11110000100    @VX
+VCTZDM          000100 ..... ..... ..... 11111000100    @VX
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index fa519c2d3e..e093562e2a 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -414,8 +414,7 @@ static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
     return true;
 }
 
-#if defined(TARGET_PPC64)
-static void do_cntzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask, bool trail)
+static void do_cntzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask, int64_t trail)
 {
     TCGv_i64 tmp;
     TCGLabel *l1;
@@ -444,7 +443,6 @@ static void do_cntzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask, bool trail)
 
     tcg_gen_mov_i64(dst, tmp);
 }
-#endif
 
 static bool trans_CNTLZDM(DisasContext *ctx, arg_X *a)
 {
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index e36c66589c..6da8a9123f 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1575,6 +1575,38 @@ static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
     return true;
 }
 
+static bool trans_VCLZDM(DisasContext *ctx, arg_VX *a)
+{
+    static const GVecGen3i g = {
+        .fni8 = do_cntzdm,
+        .vece = MO_64,
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3i(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                    avr_full_offset(a->vrb), 16, 16, false, &g);
+
+    return true;
+}
+
+static bool trans_VCTZDM(DisasContext *ctx, arg_VX *a)
+{
+    static const GVecGen3i g = {
+        .fni8 = do_cntzdm,
+        .vece = MO_64,
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3i(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                    avr_full_offset(a->vrb), 16, 16, true, &g);
+
+    return true;
+}
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
-- 
2.25.1


