Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0C3399CAA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:36:41 +0200 (CEST)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiqG-0005n0-Fn
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidU-0007Vw-50; Thu, 03 Jun 2021 04:23:28 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36091 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidS-0000US-6z; Thu, 03 Jun 2021 04:23:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5q2PBRz9t2G; Thu,  3 Jun 2021 18:22:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708559;
 bh=yxUEq1fZdn59Z6G/VuakesYI2ZUQrETGVDIjPGj2gRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G7etiVRzeTlNwLB9TldR5Tx8hYXF3VDEJ5ynMGSoX/a/9YpIIGQCMH8+Bqu3LBsRK
 W9pgaazCgJBu667HQFrCqifKs982UhdXyzl0O8KadibaS5AxkukhMjgv5zdmxFNsDv
 FFpi8IZQn2GmDN4CECXMrImlMXpFbQCg05tbhEqE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 32/42] target/ppc: Implement PNOP
Date: Thu,  3 Jun 2021 18:22:21 +1000
Message-Id: <20210603082231.601214-33-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The illegal suffix behavior matches what was observed in a
POWER10 DD2.0 machine.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210601193528.2533031-6-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn64.decode                   | 67 ++++++++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 11 ++++
 2 files changed, 78 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 1965088915..9aa5097a98 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -28,3 +28,70 @@
 
 PADDI           000001 10 0--.-- ..................     \
                 001110 ..... ..... ................     @PLS_D
+
+### Prefixed No-operation Instruction
+
+@PNOP           000001 11 0000-- 000000000000000000     \
+                ................................
+
+{
+  [
+    ## Invalid suffixes: Branch instruction
+    # bc[l][a]
+    INVALID     ................................        \
+                010000--------------------------        @PNOP
+    # b[l][a]
+    INVALID     ................................        \
+                010010--------------------------        @PNOP
+    # bclr[l]
+    INVALID     ................................        \
+                010011---------------0000010000-        @PNOP
+    # bcctr[l]
+    INVALID     ................................        \
+                010011---------------1000010000-        @PNOP
+    # bctar[l]
+    INVALID     ................................        \
+                010011---------------1000110000-        @PNOP
+
+    ## Invalid suffixes: rfebb
+    INVALID     ................................        \
+                010011---------------0010010010-        @PNOP
+
+    ## Invalid suffixes: context synchronizing other than isync
+    # sc
+    INVALID     ................................        \
+                010001------------------------1-        @PNOP
+    # scv
+    INVALID     ................................        \
+                010001------------------------01        @PNOP
+    # rfscv
+    INVALID     ................................        \
+                010011---------------0001010010-        @PNOP
+    # rfid
+    INVALID     ................................        \
+                010011---------------0000010010-        @PNOP
+    # hrfid
+    INVALID     ................................        \
+                010011---------------0100010010-        @PNOP
+    # urfid
+    INVALID     ................................        \
+                010011---------------0100110010-        @PNOP
+    # stop
+    INVALID     ................................        \
+                010011---------------0101110010-        @PNOP
+    # mtmsr w/ L=0
+    INVALID     ................................        \
+                011111---------0-----0010010010-        @PNOP
+    # mtmsrd w/ L=0
+    INVALID     ................................        \
+                011111---------0-----0010110010-        @PNOP
+
+    ## Invalid suffixes: Service Processor Attention
+    INVALID     ................................        \
+                000000----------------100000000-        @PNOP
+  ]
+
+  ## Valid suffixes
+  PNOP          ................................        \
+                --------------------------------        @PNOP
+}
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 344a3ed54b..ce034a14a7 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -60,3 +60,14 @@ static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
     a->si <<= 16;
     return trans_ADDI(ctx, a);
 }
+
+static bool trans_INVALID(DisasContext *ctx, arg_INVALID *a)
+{
+    gen_invalid(ctx);
+    return true;
+}
+
+static bool trans_PNOP(DisasContext *ctx, arg_PNOP *a)
+{
+    return true;
+}
-- 
2.31.1


