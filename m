Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04CC44A6B5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:16:58 +0100 (CET)
Received: from localhost ([::1]:42196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKRF-00018n-QE
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:16:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3f-0004Sp-II; Tue, 09 Nov 2021 00:52:40 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:55437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3X-0006eg-F8; Tue, 09 Nov 2021 00:52:29 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDn6czWz4xdK; Tue,  9 Nov 2021 16:52:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437129;
 bh=gfCuCJ64cT6RG6bU4FW4czjJ8UQMzjZRLwUCF0puBJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dYRxcqWNAPI74b0S7zvqnXfChrJdH/f79Ux0WJC67vYu7JmMb7jfMZuCruOPXEB1v
 MpFylASrtTB2NYoG6xQkPsBZTIRKKQHEv13t/MSPCQWIi0Bdt4hb4flrDbq++SEvH+
 5KvSZk/hFn5QqBMmDeTpAARTlo+waNgz5MGaLEK4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 06/54] target/ppc: Implement PLQ and PSTQ
Date: Tue,  9 Nov 2021 16:51:16 +1100
Message-Id: <20211109055204.230765-7-david@gibson.dropbear.id.au>
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
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211029202424.175401-7-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn64.decode                   |  4 ++++
 target/ppc/translate/fixedpoint-impl.c.inc | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 11e5ea81d6..48756cd4ca 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -38,6 +38,8 @@ PLWA            000001 00 0--.-- .................. \
                 101001 ..... ..... ................     @PLS_D
 PLD             000001 00 0--.-- .................. \
                 111001 ..... ..... ................     @PLS_D
+PLQ             000001 00 0--.-- .................. \
+                111000 ..... ..... ................     @PLS_D
 
 ### Fixed-Point Store Instructions
 
@@ -50,6 +52,8 @@ PSTH            000001 10 0--.-- .................. \
 
 PSTD            000001 00 0--.-- .................. \
                 111101 ..... ..... ................     @PLS_D
+PSTQ            000001 00 0--.-- .................. \
+                111100 ..... ..... ................     @PLS_D
 
 ### Fixed-Point Arithmetic Instructions
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index ff35a96459..0d9c6e0996 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -160,6 +160,16 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
     return true;
 }
 
+static bool do_ldst_quad_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool store)
+{
+    arg_D d;
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+
+    return do_ldst_quad(ctx, &d, store, true);
+}
+
 /* Load Byte and Zero */
 TRANS(LBZ, do_ldst_D, false, false, MO_UB)
 TRANS(LBZX, do_ldst_X, false, false, MO_UB)
@@ -203,6 +213,7 @@ TRANS64(PLD, do_ldst_PLS_D, false, false, MO_Q)
 
 /* Load Quadword */
 TRANS64(LQ, do_ldst_quad, false, false);
+TRANS64(PLQ, do_ldst_quad_PLS_D, false);
 
 /* Store Byte */
 TRANS(STB, do_ldst_D, false, true, MO_UB)
@@ -234,6 +245,7 @@ TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
 
 /* Store Quadword */
 TRANS64(STQ, do_ldst_quad, true, false);
+TRANS64(PSTQ, do_ldst_quad_PLS_D, true);
 
 /*
  * Fixed-Point Compare Instructions
-- 
2.33.1


