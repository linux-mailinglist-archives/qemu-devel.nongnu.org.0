Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A94B44A756
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:04:45 +0100 (CET)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLBU-0006It-Bb
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:04:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4x-00066x-EG; Tue, 09 Nov 2021 00:53:55 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:58411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4v-0006w2-Rc; Tue, 09 Nov 2021 00:53:55 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp5prbz4xfP; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=4B6hioPLPxaMVXUD3e4tYCcG7R5ryMDo3i1lahYOlA4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CLaYaQMc8QZTNdKugd7IcaqNBC2ePmik9aW5cZyKWBItEFu/kBJNLbGBn8+UCy8wO
 plDW/d3KUSeBhjpR4OhYgC4tDbEyKw97q0zHek1uVPHKoVsVfEjnjgGjWf8MJiNpP7
 TcA81WBS2erAPEjiByOeKRrZINEpTM2u3sXHPx3k=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 44/54] target/ppc: added the instructions PLXVP and PSTXVP
Date: Tue,  9 Nov 2021 16:51:54 +1100
Message-Id: <20211109055204.230765-45-david@gibson.dropbear.id.au>
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Implemented the instructions plxvp and pstxvp using decodetree

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-18-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn64.decode            | 9 +++++++++
 target/ppc/translate/vsx-impl.c.inc | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 093439b370..880ac3edc7 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -27,6 +27,11 @@
                 ..... rt:6 ra:5 ................         \
                 &PLS_D si=%pls_si
 
+%rt_tsxp        21:1 22:4 !function=times_2
+@8LS_D_TSXP     ...... .. . .. r:1 .. .................. \
+                ...... ..... ra:5 ................       \
+                &PLS_D si=%pls_si rt=%rt_tsxp
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -147,3 +152,7 @@ PLXV            000001 00 0--.-- .................. \
                 11001 ...... ..... ................     @8LS_D_TSX
 PSTXV           000001 00 0--.-- .................. \
                 11011 ...... ..... ................     @8LS_D_TSX
+PLXVP           000001 00 0--.-- .................. \
+                111010 ..... ..... ................     @8LS_D_TSXP
+PSTXVP          000001 00 0--.-- .................. \
+                111110 ..... ..... ................     @8LS_D_TSXP
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 1972127a22..6c60e29cca 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2060,6 +2060,8 @@ TRANS(STXVPX, do_lstxv_X, true, true)
 TRANS(LXVPX, do_lstxv_X, false, true)
 TRANS64(PSTXV, do_lstxv_PLS_D, true, false)
 TRANS64(PLXV, do_lstxv_PLS_D, false, false)
+TRANS64(PSTXVP, do_lstxv_PLS_D, true, true)
+TRANS64(PLXVP, do_lstxv_PLS_D, false, true)
 
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
-- 
2.33.1


