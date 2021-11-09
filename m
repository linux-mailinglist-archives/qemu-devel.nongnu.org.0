Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF244A6C6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:22:55 +0100 (CET)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKX0-0000ua-Ia
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:22:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4I-00054g-Pk; Tue, 09 Nov 2021 00:53:14 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=51119
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4F-0006pW-Lu; Tue, 09 Nov 2021 00:53:14 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp3Mn5z4xf6; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=vNrDCRx9wWqDqEyOwu/oIKpywmw3H8buZfjIg5QPkes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R+GBavHIg5lMVsALRQR+XCiOyPEP96UJf0oslWFGXHJ08dIdpCj6Os+TdN8UmJM4m
 v9q6cwfPCmALEvwye0jTzYH2H7Heo6im50jabsG8bLjbU0iL5/KBIzfzNxajYGbS0M
 3rmjk6SJ1NoFR2rNyMm6LHG7WfmUmuhVLPck1nVY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 29/54] target/ppc: Implement vclzdm/vctzdm instructions
Date: Tue,  9 Nov 2021 16:51:39 +1100
Message-Id: <20211109055204.230765-30-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The signature of do_cntzdm is changed to allow reuse as GVecGen3i.fni8.
The method is also moved out of #ifdef TARGET_PPC64, as PowerISA doesn't
say vclzdm and vctzdm are 64-bit only.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-3-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.33.1


