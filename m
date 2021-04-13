Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD7B35E82E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:24:30 +0200 (CEST)
Received: from localhost ([::1]:43352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQWK-00065L-Jq
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQMC-0007ie-Oj; Tue, 13 Apr 2021 17:14:00 -0400
Received: from [201.28.113.2] (port=27024 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQMB-0007YY-1N; Tue, 13 Apr 2021 17:14:00 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 13 Apr 2021 18:13:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 4C451801212;
 Tue, 13 Apr 2021 18:13:42 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 5/5] target/ppc: Implement paddi and replace addi insns
Date: Tue, 13 Apr 2021 18:11:29 -0300
Message-Id: <20210413211129.457272-6-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413211129.457272-1-luis.pires@eldorado.org.br>
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Apr 2021 21:13:42.0609 (UTC)
 FILETIME=[E1C4B410:01D730A9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org,
 Luis Pires <luis.pires@eldorado.org.br>, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This implements the Power ISA 3.1 prefixed (64-bit) paddi
instruction, while also replacing the legacy addi implementation.
Both using the decode tree.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/ppc.decode                      |  8 +++++++
 target/ppc/translate.c                     | 15 +------------
 target/ppc/translate/fixedpoint-impl.c.inc | 26 ++++++++++++++++++++++
 3 files changed, 35 insertions(+), 14 deletions(-)
 create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc

diff --git a/target/ppc/ppc.decode b/target/ppc/ppc.decode
index 84bb73ac19..c87174dc20 100644
--- a/target/ppc/ppc.decode
+++ b/target/ppc/ppc.decode
@@ -16,3 +16,11 @@
 # You should have received a copy of the GNU Lesser General Public
 # License along with this library; if not, see <http://www.gnu.org/licenses/>.
 #
+
+%p_D8_SI        32:s18 0:16
+
+# Fixed-Point Facility Instructions
+&addi   r rt ra si
+
+paddi   000001 10 0 -- r:1 -- .................. 001110 rt:5 ra:5 ................ si=%p_D8_SI &addi
+addi    001110 rt:5 ra:5 si:s16 &addi r=0
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0f123f7b80..2ff192c9e5 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -945,19 +945,6 @@ GEN_INT_ARITH_ADD(addex, 0x05, cpu_ov, 1, 1, 0);
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
@@ -6967,6 +6954,7 @@ static target_ulong ppc_peek_next_insn_size(DisasContext *ctx)
 }
 
 #include "decode-ppc.c.inc"
+#include "translate/fixedpoint-impl.c.inc"
 
 #include "translate/fp-impl.c.inc"
 
@@ -7091,7 +7079,6 @@ GEN_HANDLER_E(cmpeqb, 0x1F, 0x00, 0x07, 0x00600000, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(cmpb, 0x1F, 0x1C, 0x0F, 0x00000001, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(cmprb, 0x1F, 0x00, 0x06, 0x00400001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(isel, 0x1F, 0x0F, 0xFF, 0x00000001, PPC_ISEL),
-GEN_HANDLER(addi, 0x0E, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER(addic, 0x0C, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER2(addic_, "addic.", 0x0D, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER(addis, 0x0F, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
new file mode 100644
index 0000000000..8620954b57
--- /dev/null
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -0,0 +1,26 @@
+static bool trans_paddi(DisasContext *ctx, arg_paddi *a)
+{
+    if (a->r == 0) {
+        if (a->ra == 0) {
+            /* li case */
+            tcg_gen_movi_tl(cpu_gpr[a->rt], a->si);
+        } else {
+            tcg_gen_addi_tl(cpu_gpr[a->rt],
+                            cpu_gpr[a->ra], a->si);
+        }
+    } else {
+        if (a->ra == 0) {
+            tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_nip, a->si);
+        } else {
+            /* invalid form */
+            gen_invalid(ctx);
+        }
+    }
+
+    return true;
+}
+
+static bool trans_addi(DisasContext *ctx, arg_addi *a)
+{
+    return trans_paddi(ctx, a);
+}
-- 
2.25.1


