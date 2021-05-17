Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067B7386BDC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 23:02:27 +0200 (CEST)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likNe-00014w-0R
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 17:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likF7-0005hu-To; Mon, 17 May 2021 16:53:37 -0400
Received: from [201.28.113.2] (port=46491 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likF6-0001mN-Ct; Mon, 17 May 2021 16:53:37 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 17 May 2021 17:50:33 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 346408000C2;
 Mon, 17 May 2021 17:50:33 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 13/23] target/ppc: Implement PNOP
Date: Mon, 17 May 2021 17:50:15 -0300
Message-Id: <20210517205025.3777947-14-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2021 20:50:33.0660 (UTC)
 FILETIME=[47EF67C0:01D74B5E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The illegal suffix behavior matches what was observed in a
POWER10 DD2.0 machine.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v5:
- Remove argument set from PNOP;
- Use no_overlap_group for invalid suffixes.
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
2.25.1


