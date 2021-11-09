Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112944A67D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 06:57:15 +0100 (CET)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkK8A-0007sw-AQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 00:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3T-0004Rj-9M; Tue, 09 Nov 2021 00:52:24 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=59301
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3O-0006cu-Eo; Tue, 09 Nov 2021 00:52:20 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDn6P2zz4xdc; Tue,  9 Nov 2021 16:52:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437129;
 bh=5fTM9KpoVe03LWL8q3LRsKwUiPf9eZOw/SUMS3JnZsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BAdpNJcJZYUvaQsb1H23Yw0GZdL4RsnZMx4q60pAFdlcrMRIyWDGj+dAUbIBoVIjn
 4Uzf1toi2oZUbjOgWVnW7fVE0B3s6AjKW5F8yMlNgSUAYew+aGafERosanBDranwht
 /4O5S3vgsTD+rkrgWolFW2VMJJzosIkrY6oC1WK8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 04/54] target/ppc: Implement PLFS, PLFD,
 PSTFS and PSTFD instructions
Date: Tue,  9 Nov 2021 16:51:14 +1100
Message-Id: <20211109055204.230765-5-david@gibson.dropbear.id.au>
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
Cc: Fernando Eckhardt Valle <phervalle@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fernando Eckhardt Valle <phervalle@gmail.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211029202424.175401-5-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn64.decode           | 11 +++++++++++
 target/ppc/translate/fp-impl.c.inc | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 72c5944a53..11e5ea81d6 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -56,6 +56,17 @@ PSTD            000001 00 0--.-- .................. \
 PADDI           000001 10 0--.-- ..................     \
                 001110 ..... ..... ................     @PLS_D
 
+### Float-Point Load and Store Instructions
+
+PLFS            000001 10 0--.-- .................. \
+                110000 ..... ..... ................     @PLS_D
+PLFD            000001 10 0--.-- .................. \
+                110010 ..... ..... ................     @PLS_D
+PSTFS           000001 10 0--.-- .................. \
+                110100 ..... ..... ................     @PLS_D
+PSTFD           000001 10 0--.-- .................. \
+                110110 ..... ..... ................     @PLS_D
+
 ### Prefixed No-operation Instruction
 
 @PNOP           000001 11 0000-- 000000000000000000     \
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 57a799db1c..d1dbb1b96b 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -1342,6 +1342,16 @@ static bool do_lsfp_D(DisasContext *ctx, arg_D *a, bool update, bool store,
                      single);
 }
 
+static bool do_lsfp_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool update,
+                          bool store, bool single)
+{
+    arg_D d;
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+    return do_lsfp_D(ctx, &d, update, store, single);
+}
+
 static bool do_lsfp_X(DisasContext *ctx, arg_X *a, bool update,
                       bool store, bool single)
 {
@@ -1352,21 +1362,25 @@ TRANS(LFS, do_lsfp_D, false, false, true)
 TRANS(LFSU, do_lsfp_D, true, false, true)
 TRANS(LFSX, do_lsfp_X, false, false, true)
 TRANS(LFSUX, do_lsfp_X, true, false, true)
+TRANS(PLFS, do_lsfp_PLS_D, false, false, true)
 
 TRANS(LFD, do_lsfp_D, false, false, false)
 TRANS(LFDU, do_lsfp_D, true, false, false)
 TRANS(LFDX, do_lsfp_X, false, false, false)
 TRANS(LFDUX, do_lsfp_X, true, false, false)
+TRANS(PLFD, do_lsfp_PLS_D, false, false, false)
 
 TRANS(STFS, do_lsfp_D, false, true, true)
 TRANS(STFSU, do_lsfp_D, true, true, true)
 TRANS(STFSX, do_lsfp_X, false, true, true)
 TRANS(STFSUX, do_lsfp_X, true, true, true)
+TRANS(PSTFS, do_lsfp_PLS_D, false, true, true)
 
 TRANS(STFD, do_lsfp_D, false, true, false)
 TRANS(STFDU, do_lsfp_D, true, true, false)
 TRANS(STFDX, do_lsfp_X, false, true, false)
 TRANS(STFDUX, do_lsfp_X, true, true, false)
+TRANS(PSTFD, do_lsfp_PLS_D, false, true, false)
 
 #undef _GEN_FLOAT_ACB
 #undef GEN_FLOAT_ACB
-- 
2.33.1


