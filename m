Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F124A44A6EB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:37:02 +0100 (CET)
Received: from localhost ([::1]:53384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKkg-0002wH-4O
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:37:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4H-00053M-OZ; Tue, 09 Nov 2021 00:53:13 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=57551
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4F-0006pX-M7; Tue, 09 Nov 2021 00:53:13 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp3WmLz4xf7; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=ETCKf67cumHgCLcvRCJYG3LoSDi/3Zmif2dVWKaG0to=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=daZdVwjjQg8tYFDy5wXnQ8/KLQUCYMFkGqyNfpuq6FTOa6xzZnYPsvRHi7BiveTdk
 eCUi6kVfAQI76XV/2agC+GZoshJGmblj9eTnTEh4gncpOwQNg8yiQqZ1RPBtGXArnq
 CIIJt5qX0az4mByrOphbjUGKBwIjBKHKZgPjNEy0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 30/54] target/ppc: Implement vpdepd/vpextd instruction
Date: Tue,  9 Nov 2021 16:51:40 +1100
Message-Id: <20211109055204.230765-31-david@gibson.dropbear.id.au>
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

pdepd and pextd helpers are moved out of #ifdef (TARGET_PPC64) to allow
them to be reused as GVecGen3.fni8.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-4-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.33.1


