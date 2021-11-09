Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429FA44A701
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:48:46 +0100 (CET)
Received: from localhost ([::1]:34936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKw1-0001Ir-9i
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:48:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4K-00055f-9J; Tue, 09 Nov 2021 00:53:16 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4G-0006q2-HH; Tue, 09 Nov 2021 00:53:15 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp3dDWz4xdy; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=kLOl1NZYGidgC4OWa7ynUJqjAC+VsMCt+5+imgHL4J0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ek9zV1BL3/UWi6Dj0J4OPw8Hw/WGu6W2bthmVLC6fEIE8ex8xx3e567POYDgqyvTZ
 zgJPtztRUk6Pd4UtBxXVBDcFxhDX62V5R5Zj0MMeeUjU62VtqzZZJkjHANmblfGSH1
 e2pcTsgs8VClHEq3pLmRYZTVaww6r6OKtaKfWJNc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 31/54] target/ppc: Implement vsldbi/vsrdbi instructions
Date: Tue,  9 Nov 2021 16:51:41 +1100
Message-Id: <20211109055204.230765-32-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-5-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.33.1


