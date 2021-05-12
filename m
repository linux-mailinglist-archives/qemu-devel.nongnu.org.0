Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FA737D3F0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:48:31 +0200 (CEST)
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguqM-0002j2-Rl
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu46-0000Xu-Uc; Wed, 12 May 2021 14:58:38 -0400
Received: from [201.28.113.2] (port=47887 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu45-0000ms-Aw; Wed, 12 May 2021 14:58:38 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:06 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 17F0C8000C2;
 Wed, 12 May 2021 15:56:06 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 22/31] target/ppc: Implement PNOP
Date: Wed, 12 May 2021 15:54:32 -0300
Message-Id: <20210512185441.3619828-23-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:06.0469 (UTC)
 FILETIME=[76B47750:01D74760]
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
v4:
- Detect illegal suffixes and call gen_invalid.
---
 target/ppc/insn64.decode                   | 66 ++++++++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc |  8 +++
 2 files changed, 74 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 5e6c96a326..56857b5e93 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -28,3 +28,69 @@
 
 PADDI           000001 10 0--.-- ..................     \
                 001110 ..... ..... ................     @PLS_D
+
+### Prefixed No-operation Instruction
+
+&PNOP           invalid_suffix:bool
+@PNOP           000001 11 0000-- 000000000000000000     \
+                ................................        &PNOP
+
+{
+  ## Invalid suffixes: Branch instruction
+  # bc[l][a]
+  PNOP            ................................      \
+                  010000--------------------------      @PNOP invalid_suffix=1
+  # b[l][a]
+  PNOP            ................................      \
+                  010010--------------------------      @PNOP invalid_suffix=1
+  # bclr[l]
+  PNOP            ................................      \
+                  010011---------------0000010000-      @PNOP invalid_suffix=1
+  # bcctr[l]
+  PNOP            ................................      \
+                  010011---------------1000010000-      @PNOP invalid_suffix=1
+  # bctar[l]
+  PNOP            ................................      \
+                  010011---------------1000110000-      @PNOP invalid_suffix=1
+
+  ## Invalid suffixes: rfebb
+  PNOP            ................................      \
+                  010011---------------0010010010-      @PNOP invalid_suffix=1
+
+  ## Invalid suffixes: context synchronizing other than isync
+  # sc
+  PNOP            ................................      \
+                  010001------------------------1-      @PNOP invalid_suffix=1
+  # scv
+  PNOP            ................................      \
+                  010001------------------------01      @PNOP invalid_suffix=1
+  # rfscv
+  PNOP            ................................      \
+                  010011---------------0001010010-      @PNOP invalid_suffix=1
+  # rfid
+  PNOP            ................................      \
+                  010011---------------0000010010-      @PNOP invalid_suffix=1
+  # hrfid
+  PNOP            ................................      \
+                  010011---------------0100010010-      @PNOP invalid_suffix=1
+  # urfid
+  PNOP            ................................      \
+                  010011---------------0100110010-      @PNOP invalid_suffix=1
+  # stop
+  PNOP            ................................      \
+                  010011---------------0101110010-      @PNOP invalid_suffix=1
+  # mtmsr w/ L=0
+  PNOP            ................................      \
+                  011111---------0-----0010010010-      @PNOP invalid_suffix=1
+  # mtmsrd w/ L=0
+  PNOP            ................................      \
+                  011111---------0-----0010110010-      @PNOP invalid_suffix=1
+
+  ## Invalid suffixes: Service Processor Attention
+  PNOP            ................................      \
+                  000000----------------100000000-      @PNOP invalid_suffix=1
+
+  ## Valid suffixes
+  PNOP            ................................      \
+                  --------------------------------      @PNOP invalid_suffix=0
+}
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index b7ee0ff034..9a8da29c64 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -60,3 +60,11 @@ static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
     a->si <<= 16;
     return trans_ADDI(ctx, a);
 }
+
+static bool trans_PNOP(DisasContext *ctx, arg_PNOP *a)
+{
+    if (a->invalid_suffix) {
+        gen_invalid(ctx);
+    }
+    return true;
+}
-- 
2.25.1


