Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B244A75B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:11:11 +0100 (CET)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLHi-0007ju-6m
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4n-0005qI-Hh; Tue, 09 Nov 2021 00:53:45 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=56419
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4l-0006xF-Sf; Tue, 09 Nov 2021 00:53:45 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp6VlJz4xfT; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=hDPpXHBeFQYUBzusFfqMeEdDeE+IUBYGanNh8b8+Cs8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WPVFHxjO+uiW+AZB4dEK/8tFx/GURRBwBTAEEsiq80/i/XHAHlQUiyAU8sXPC3L0p
 vQ7hZMLOMYVPm0/qmiBdeNpAqe6hPi3stePr628ix65DuqB4z7onAeedTpDeKn2z3K
 OYzpAcVzgOGUrQLTJUsJdKFtJ/oXL2rDMptoEors=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 48/54] target/ppc: Implemented XXSPLTIW using decodetree
Date: Tue,  9 Nov 2021 16:51:58 +1100
Message-Id: <20211109055204.230765-49-david@gibson.dropbear.id.au>
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
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Implemented the XXSPLTIW instruction, using decodetree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-22-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn64.decode            |  6 ++++++
 target/ppc/translate/vsx-impl.c.inc | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 134bc60c57..bd71f616cc 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -39,6 +39,10 @@
 @8RR_D_IX       ...... .. .... .. .. ................ \
                 ...... ..... ... ix:1 . ................ \
                 &8RR_D_IX si=%8rr_si xt=%8rr_xt
+&8RR_D          xt si:int32_t
+@8RR_D          ...... .. .... .. .. ................ \
+                ...... ..... ....  . ................ \
+                &8RR_D si=%8rr_si xt=%8rr_xt
 
 ### Fixed-Point Load Instructions
 
@@ -165,5 +169,7 @@ PLXVP           000001 00 0--.-- .................. \
 PSTXVP          000001 00 0--.-- .................. \
                 111110 ..... ..... ................     @8LS_D_TSXP
 
+XXSPLTIW        000001 01 0000 -- -- ................ \
+                100000 ..... 0011 . ................    @8RR_D
 XXSPLTI32DX     000001 01 0000 -- -- ................ \
                 100000 ..... 000 .. ................    @8RR_D_IX
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 360593a9ab..7116141a6a 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1466,6 +1466,16 @@ static bool trans_XXSPLTIB(DisasContext *ctx, arg_X_imm8 *a)
     return true;
 }
 
+static bool trans_XXSPLTIW(DisasContext *ctx, arg_8RR_D *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_dup_imm(MO_32, vsr_full_offset(a->xt), 16, 16, a->si);
+
+    return true;
+}
+
 static bool trans_XXSPLTI32DX(DisasContext *ctx, arg_8RR_D_IX *a)
 {
     TCGv_i32 imm;
-- 
2.33.1


