Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F444045E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:51:05 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYq8-0002Hv-Ga
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYS2-0002TQ-5y; Fri, 29 Oct 2021 16:26:10 -0400
Received: from [201.28.113.2] (port=65208 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYS0-0001sK-JR; Fri, 29 Oct 2021 16:26:09 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:25:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id C46B2800B36;
 Fri, 29 Oct 2021 17:25:57 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 13/34] target/ppc: Implement vpdepd/vpextd instruction
Date: Fri, 29 Oct 2021 17:24:03 -0300
Message-Id: <20211029202424.175401-14-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:25:58.0317 (UTC)
 FILETIME=[2EB8ADD0:01D7CD03]
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

pdepd and pextd helpers are moved out of #ifdef (TARGET_PPC64) to allow
them to be reused as GVecGen3.fni8.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             |  2 --
 target/ppc/translate/vmx-impl.c.inc | 32 +++++++++++++++++++++++++++++
 4 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 401575b935..0e99f8095c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -47,9 +47,9 @@ DEF_HELPER_FLAGS_1(popcntb, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(cmpb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_3(sraw, tl, env, tl, tl)
 DEF_HELPER_FLAGS_2(CFUGED, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-#if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(PDEPD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PEXTD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+#if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
 DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(bpermd, TCG_CALL_NO_RWG_SE, i64, i64, i64)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6ce06b231d..4666c06f55 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -336,3 +336,5 @@ DSCRIQ          111111 ..... ..... ...... 001100010 .   @Z22_tap_sh_rc
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
 VCLZDM          000100 ..... ..... ..... 11110000100    @VX
 VCTZDM          000100 ..... ..... ..... 11111000100    @VX
+VPDEPD          000100 ..... ..... ..... 10111001101    @VX
+VPEXTD          000100 ..... ..... ..... 10110001101    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index f03c864e48..42541736f1 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -386,7 +386,6 @@ uint64_t helper_CFUGED(uint64_t src, uint64_t mask)
     return left | (right >> n);
 }
 
-#if defined(TARGET_PPC64)
 uint64_t helper_PDEPD(uint64_t src, uint64_t mask)
 {
     int i, o;
@@ -422,7 +421,6 @@ uint64_t helper_PEXTD(uint64_t src, uint64_t mask)
 
     return result;
 }
-#endif
 
 /*****************************************************************************/
 /* PowerPC 601 specific instructions (POWER bridge) */
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 6da8a9123f..cddb3848ab 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1607,6 +1607,38 @@ static bool trans_VCTZDM(DisasContext *ctx, arg_VX *a)
     return true;
 }
 
+static bool trans_VPDEPD(DisasContext *ctx, arg_VX *a)
+{
+    static const GVecGen3 g = {
+        .fni8 = gen_helper_PDEPD,
+        .vece = MO_64,
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &g);
+
+    return true;
+}
+
+static bool trans_VPEXTD(DisasContext *ctx, arg_VX *a)
+{
+    static const GVecGen3 g = {
+        .fni8 = gen_helper_PEXTD,
+        .vece = MO_64,
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &g);
+
+    return true;
+}
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
-- 
2.25.1


