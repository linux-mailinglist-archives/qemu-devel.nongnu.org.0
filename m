Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AF83CFB61
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:57:52 +0200 (CEST)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qFr-0007A8-Jf
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1m5qDv-0004Yk-GL; Tue, 20 Jul 2021 09:55:51 -0400
Received: from [201.28.113.2] (port=37350 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1m5qDt-0000XS-HA; Tue, 20 Jul 2021 09:55:51 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 20 Jul 2021 10:55:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 822F080141F;
 Tue, 20 Jul 2021 10:55:44 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2] target/ppc: Ease L=0 requirement on cmp/cmpi/cmpl/cmpli
 for ppc32
Date: Tue, 20 Jul 2021 10:55:07 -0300
Message-Id: <20210720135507.2444635-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Jul 2021 13:55:44.0857 (UTC)
 FILETIME=[EF7D7490:01D77D6E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>, richard.henderson@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

In commit 8f0a4b6a9b, we started to require L=0 for ppc32 to match what
The Programming Environments Manual say:

"For 32-bit implementations, the L field must be cleared, otherwise
the instruction form is invalid."

The stricter behavior, however, broke AROS boot on sam460ex, which is a
regression from 6.0. This patch partially reverts the change, raising
the exception only for CPUs known to require L=0 (e500 and e500mc) and
logging a guest error for other cases.

Both behaviors are acceptable by the PowerISA, which allows "the system
illegal instruction error handler to be invoked or yield boundedly
undefined results."

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Fixes: 8f0a4b6a9b ("target/ppc: Move cmp/cmpi/cmpl/cmpli to decodetree")
Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate/fixedpoint-impl.c.inc | 58 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index f4fcfadbfc..1c35b60eb4 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -145,8 +145,35 @@ TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
 
 static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
 {
+    if ((ctx->insns_flags & PPC_64B) == 0) {
+        /*
+         * For 32-bit implementations, The Programming Environments Manual says
+         * that "the L field must be cleared, otherwise the instruction form is
+         * invalid." It seems, however, that most 32-bit CPUs ignore invalid
+         * forms (e.g., section "Instruction Formats" of the 405 and 440
+         * manuals, "Integer Compare Instructions" of the 601 manual), with the
+         * notable exception of the e500 and e500mc, where L=1 was reported to
+         * cause an exception.
+         */
+        if (a->l) {
+            if ((ctx->insns_flags2 & PPC2_BOOKE206)) {
+                /*
+                 * For 32-bit Book E v2.06 implementations (i.e. e500/e500mc),
+                 * generate an illegal instruction exception.
+                 */
+                return false;
+            } else {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "Invalid form of CMP%s at 0x" TARGET_FMT_lx ", L = 1\n",
+                        s ? "" : "L", ctx->cia);
+            }
+        }
+        gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
+        return true;
+    }
+
+    /* For 64-bit implementations, deal with bit L accordingly. */
     if (a->l) {
-        REQUIRE_64BIT(ctx);
         gen_op_cmp(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
     } else {
         gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
@@ -156,8 +183,35 @@ static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
 
 static bool do_cmp_D(DisasContext *ctx, arg_D_bf *a, bool s)
 {
+    if ((ctx->insns_flags & PPC_64B) == 0) {
+        /*
+         * For 32-bit implementations, The Programming Environments Manual says
+         * that "the L field must be cleared, otherwise the instruction form is
+         * invalid." It seems, however, that most 32-bit CPUs ignore invalid
+         * forms (e.g., section "Instruction Formats" of the 405 and 440
+         * manuals, "Integer Compare Instructions" of the 601 manual), with the
+         * notable exception of the e500 and e500mc, where L=1 was reported to
+         * cause an exception.
+         */
+        if (a->l) {
+            if ((ctx->insns_flags2 & PPC2_BOOKE206)) {
+                /*
+                 * For 32-bit Book E v2.06 implementations (i.e. e500/e500mc),
+                 * generate an illegal instruction exception.
+                 */
+                return false;
+            } else {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "Invalid form of CMP%s at 0x" TARGET_FMT_lx ", L = 1\n",
+                        s ? "I" : "LI", ctx->cia);
+            }
+        }
+        gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
+        return true;
+    }
+
+    /* For 64-bit implementations, deal with bit L accordingly. */
     if (a->l) {
-        REQUIRE_64BIT(ctx);
         gen_op_cmp(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
     } else {
         gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
-- 
2.25.1


