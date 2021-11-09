Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20B44A719
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:58:59 +0100 (CET)
Received: from localhost ([::1]:33684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkL5u-0002tA-GM
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:58:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4r-0005xA-Fp; Tue, 09 Nov 2021 00:53:49 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=43341
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4p-0006xh-NL; Tue, 09 Nov 2021 00:53:49 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp6cJ2z4xfS; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=QHM1F2L6x3jDFv6Y7nkwDtGUZvvzqksaT/ZPWpJHlQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bNoXFm0HcFORRCclXZqcMRCTpIlKjgGL3hK975fUjz+rBhrzHU7r+tOr6T/N8J1r5
 Tws+YHf40IheUCG/K3aqNVv8VqsMwBAbruCOKKIHCflVi9DD7ixr4lNBBN/c0IM82m
 xs/HXUr4024t1hpVL/+7arVy/wXk5Ykn1evikvKk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 49/54] target/ppc: implemented XXSPLTIDP instruction
Date: Tue,  9 Nov 2021 16:51:59 +1100
Message-Id: <20211109055204.230765-50-david@gibson.dropbear.id.au>
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

Implemented the instruction XXSPLTIDP using decodetree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-23-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn64.decode            |  2 ++
 target/ppc/translate/vsx-impl.c.inc | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index bd71f616cc..20aa2b4615 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -169,6 +169,8 @@ PLXVP           000001 00 0--.-- .................. \
 PSTXVP          000001 00 0--.-- .................. \
                 111110 ..... ..... ................     @8LS_D_TSXP
 
+XXSPLTIDP       000001 01 0000 -- -- ................ \
+                100000 ..... 0010 . ................    @8RR_D
 XXSPLTIW        000001 01 0000 -- -- ................ \
                 100000 ..... 0011 . ................    @8RR_D
 XXSPLTI32DX     000001 01 0000 -- -- ................ \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 7116141a6a..180d329f1a 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1476,6 +1476,16 @@ static bool trans_XXSPLTIW(DisasContext *ctx, arg_8RR_D *a)
     return true;
 }
 
+static bool trans_XXSPLTIDP(DisasContext *ctx, arg_8RR_D *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_dup_imm(MO_64, vsr_full_offset(a->xt), 16, 16,
+                         helper_todouble(a->si));
+    return true;
+}
+
 static bool trans_XXSPLTI32DX(DisasContext *ctx, arg_8RR_D_IX *a)
 {
     TCGv_i32 imm;
-- 
2.33.1


