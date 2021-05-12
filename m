Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5AA37D3EB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:44:03 +0200 (CEST)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgum1-0006BM-Vc
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu43-0000TQ-LB; Wed, 12 May 2021 14:58:35 -0400
Received: from [201.28.113.2] (port=47887 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu41-0000ms-TK; Wed, 12 May 2021 14:58:35 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:06 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id C037880139F;
 Wed, 12 May 2021 15:56:05 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 21/31] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
Date: Wed, 12 May 2021 15:54:31 -0300
Message-Id: <20210512185441.3619828-22-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:06.0110 (UTC)
 FILETIME=[767DAFE0:01D74760]
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v4:
- addi and paddi unfolded, so that addi can use @D and @PLS_D is declared only
  in insn64.decode;
- Reuse trans_ADDI in trans_ADDIS.
---
 target/ppc/insn32.decode                   |  8 ++++
 target/ppc/insn64.decode                   | 12 ++++++
 target/ppc/translate.c                     | 29 --------------
 target/ppc/translate/fixedpoint-impl.c.inc | 44 ++++++++++++++++++++++
 4 files changed, 64 insertions(+), 29 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index b175441209..d93ae905a4 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -16,3 +16,11 @@
 # You should have received a copy of the GNU Lesser General Public
 # License along with this library; if not, see <http://www.gnu.org/licenses/>.
 #
+
+&D              rt ra si:int64_t
+@D              ...... rt:5 ra:5 si:s16                 &D
+
+### Fixed-Point Arithmetic Instructions
+
+ADDI            001110 ..... ..... ................     @D
+ADDIS           001111 ..... ..... ................     @D
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 9fc45d0614..5e6c96a326 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -16,3 +16,15 @@
 # You should have received a copy of the GNU Lesser General Public
 # License along with this library; if not, see <http://www.gnu.org/licenses/>.
 #
+
+# Format MLS:D and 8LS:D
+&PLS_D          rt ra si:int64_t r:bool
+%pls_si         32:s18 0:16
+@PLS_D          ...... .. ... r:1 .. .................. \
+                ...... rt:5 ra:5 ................       \
+                &PLS_D si=%pls_si
+
+### Fixed-Point Arithmetic Instructions
+
+PADDI           000001 10 0--.-- ..................     \
+                001110 ..... ..... ................     @PLS_D
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 64a99ff2c0..7f2ebcb442 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1849,19 +1849,6 @@ GEN_INT_ARITH_ADD(addex, 0x05, cpu_ov, 1, 1, 0);
 /* addze  addze.  addzeo  addzeo.*/
 GEN_INT_ARITH_ADD_CONST(addze, 0x06, 0, cpu_ca, 1, 1, 0)
 GEN_INT_ARITH_ADD_CONST(addzeo, 0x16, 0, cpu_ca, 1, 1, 1)
-/* addi */
-static void gen_addi(DisasContext *ctx)
-{
-    target_long simm = SIMM(ctx->opcode);
-
-    if (rA(ctx->opcode) == 0) {
-        /* li case */
-        tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], simm);
-    } else {
-        tcg_gen_addi_tl(cpu_gpr[rD(ctx->opcode)],
-                        cpu_gpr[rA(ctx->opcode)], simm);
-    }
-}
 /* addic  addic.*/
 static inline void gen_op_addic(DisasContext *ctx, bool compute_rc0)
 {
@@ -1881,20 +1868,6 @@ static void gen_addic_(DisasContext *ctx)
     gen_op_addic(ctx, 1);
 }
 
-/* addis */
-static void gen_addis(DisasContext *ctx)
-{
-    target_long simm = SIMM(ctx->opcode);
-
-    if (rA(ctx->opcode) == 0) {
-        /* lis case */
-        tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], simm << 16);
-    } else {
-        tcg_gen_addi_tl(cpu_gpr[rD(ctx->opcode)],
-                        cpu_gpr[rA(ctx->opcode)], simm << 16);
-    }
-}
-
 /* addpcis */
 static void gen_addpcis(DisasContext *ctx)
 {
@@ -7906,10 +7879,8 @@ GEN_HANDLER_E(cmpeqb, 0x1F, 0x00, 0x07, 0x00600000, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(cmpb, 0x1F, 0x1C, 0x0F, 0x00000001, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(cmprb, 0x1F, 0x00, 0x06, 0x00400001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(isel, 0x1F, 0x0F, 0xFF, 0x00000001, PPC_ISEL),
-GEN_HANDLER(addi, 0x0E, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER(addic, 0x0C, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER2(addic_, "addic.", 0x0D, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
-GEN_HANDLER(addis, 0x0F, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER_E(addpcis, 0x13, 0x2, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(mulhw, 0x1F, 0x0B, 0x02, 0x00000400, PPC_INTEGER),
 GEN_HANDLER(mulhwu, 0x1F, 0x0B, 0x00, 0x00000400, PPC_INTEGER),
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index b740083605..b7ee0ff034 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -16,3 +16,47 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
+
+/*
+ * Incorporate CIA into the constant when R=1.
+ * Validate that when R=1, RA=0.
+ */
+static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
+{
+    d->rt = a->rt;
+    d->ra = a->ra;
+    d->si = a->si;
+    if (a->r) {
+        if (unlikely(a->ra != 0)) {
+            gen_invalid(ctx);
+            return false;
+        }
+        d->si += ctx->cia;
+    }
+    return true;
+}
+
+static bool trans_ADDI(DisasContext *ctx, arg_D *a)
+{
+    if (a->ra) {
+        tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_gpr[a->ra], a->si);
+    } else {
+        tcg_gen_movi_tl(cpu_gpr[a->rt], a->si);
+    }
+    return true;
+}
+
+static bool trans_PADDI(DisasContext *ctx, arg_PLS_D *a)
+{
+    arg_D d;
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+    return trans_ADDI(ctx, &d);
+}
+
+static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
+{
+    a->si <<= 16;
+    return trans_ADDI(ctx, a);
+}
-- 
2.25.1


