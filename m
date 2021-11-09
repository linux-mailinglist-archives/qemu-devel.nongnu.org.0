Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E0844A6AA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:11:43 +0100 (CET)
Received: from localhost ([::1]:34204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKM9-00047O-Ty
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:11:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3f-0004Sr-IW; Tue, 09 Nov 2021 00:52:37 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=42663
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3X-0006es-Kf; Tue, 09 Nov 2021 00:52:31 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDn6lTgz4xdg; Tue,  9 Nov 2021 16:52:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437129;
 bh=Z46H05beTCACEW2kShroQHAS/jQgfdZyD0t235PtTsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XptuEVs2vrrsM9kwVZnnkBy0S5lpMp3BNYho+O/JHZvUFrgqHE5+a5a6yiNFZsDxP
 yqRT89YBCLbONyoo51j3vBpe9EvzKD0yYnTERSY4i4gP83olvqomJu9NOKvd2Ia8QY
 j+sgs36i6nR7MvBvm96zFpboyU5xlUuyq6fNJas4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 07/54] target/ppc: Implement cntlzdm
Date: Tue,  9 Nov 2021 16:51:17 +1100
Message-Id: <20211109055204.230765-8-david@gibson.dropbear.id.au>
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

From: Luis Pires <luis.pires@eldorado.org.br>

Implement the following PowerISA v3.1 instruction:
cntlzdm: Count Leading Zeros Doubleword Under Bit Mask

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211029202424.175401-8-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn32.decode                   |  1 +
 target/ppc/translate/fixedpoint-impl.c.inc | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 7ff8c25ac5..eb3383c99c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -124,6 +124,7 @@ ADDPCIS         010011 ..... ..... .......... 00010 .   @DX
 ## Fixed-Point Logical Instructions
 
 CFUGED          011111 ..... ..... ..... 0011011100 -   @X
+CNTLZDM         011111 ..... ..... ..... 0000111011 -   @X
 
 ### Float-Point Load Instructions
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 0d9c6e0996..c9e9ae35df 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -413,3 +413,39 @@ static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
 #endif
     return true;
 }
+
+#if defined(TARGET_PPC64)
+static void do_cntlzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask)
+{
+    TCGv_i64 tmp;
+    TCGLabel *l1;
+
+    tmp = tcg_temp_local_new_i64();
+    l1 = gen_new_label();
+
+    tcg_gen_and_i64(tmp, src, mask);
+    tcg_gen_clzi_i64(tmp, tmp, 64);
+
+    tcg_gen_brcondi_i64(TCG_COND_EQ, tmp, 0, l1);
+
+    tcg_gen_subfi_i64(tmp, 64, tmp);
+    tcg_gen_shr_i64(tmp, mask, tmp);
+    tcg_gen_ctpop_i64(tmp, tmp);
+
+    gen_set_label(l1);
+
+    tcg_gen_mov_i64(dst, tmp);
+}
+#endif
+
+static bool trans_CNTLZDM(DisasContext *ctx, arg_X *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+#if defined(TARGET_PPC64)
+    do_cntlzdm(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
-- 
2.33.1


