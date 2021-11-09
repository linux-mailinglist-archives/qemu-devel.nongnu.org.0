Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A244A70B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:50:44 +0100 (CET)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKxv-0003v5-B5
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:50:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK55-00068j-3L; Tue, 09 Nov 2021 00:54:03 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:34099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK52-0006wn-WD; Tue, 09 Nov 2021 00:54:02 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp6Fctz4xfN; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=Gtzqkeaya8bGBFNQ2+lDube2YCwSoJUkirpHftHQa8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NsIE6RWvUyQiP9N/Lbn5N+ZA07uTYy6XNiJFgEbYdh8+sT5HGAYRtGsndyPrjMpBT
 CNSrf2isVgBSgljR39dek1vO8al84siKXAXxKPBZF4WGIX9J1LaDFCwicd9uRugKMx
 LJkU/0gyEeHAm4t2sGu0Cmn/pDUrqnJ3ouBd0Tsw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 47/54] target/ppc: implemented XXSPLTI32DX
Date: Tue,  9 Nov 2021 16:51:57 +1100
Message-Id: <20211109055204.230765-48-david@gibson.dropbear.id.au>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Implemented XXSPLTI32DX emulation using decodetree

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-21-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn64.decode            | 11 +++++++++++
 target/ppc/translate/vsx-impl.c.inc | 17 +++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 880ac3edc7..134bc60c57 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -32,6 +32,14 @@
                 ...... ..... ra:5 ................       \
                 &PLS_D si=%pls_si rt=%rt_tsxp
 
+# Format 8RR:D
+%8rr_si         32:s16 0:16
+%8rr_xt         16:1 21:5
+&8RR_D_IX       xt ix si
+@8RR_D_IX       ...... .. .... .. .. ................ \
+                ...... ..... ... ix:1 . ................ \
+                &8RR_D_IX si=%8rr_si xt=%8rr_xt
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -156,3 +164,6 @@ PLXVP           000001 00 0--.-- .................. \
                 111010 ..... ..... ................     @8LS_D_TSXP
 PSTXVP          000001 00 0--.-- .................. \
                 111110 ..... ..... ................     @8LS_D_TSXP
+
+XXSPLTI32DX     000001 01 0000 -- -- ................ \
+                100000 ..... 000 .. ................    @8RR_D_IX
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index ad25a0daf0..360593a9ab 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1466,6 +1466,23 @@ static bool trans_XXSPLTIB(DisasContext *ctx, arg_X_imm8 *a)
     return true;
 }
 
+static bool trans_XXSPLTI32DX(DisasContext *ctx, arg_8RR_D_IX *a)
+{
+    TCGv_i32 imm;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    imm = tcg_constant_i32(a->si);
+
+    tcg_gen_st_i32(imm, cpu_env,
+        offsetof(CPUPPCState, vsr[a->xt].VsrW(0 + a->ix)));
+    tcg_gen_st_i32(imm, cpu_env,
+        offsetof(CPUPPCState, vsr[a->xt].VsrW(2 + a->ix)));
+
+    return true;
+}
+
 static void gen_xxsldwi(DisasContext *ctx)
 {
     TCGv_i64 xth, xtl;
-- 
2.33.1


