Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365003D9E04
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:05:38 +0200 (CEST)
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m906r-0006rf-4q
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m903A-00044B-Bc; Thu, 29 Jul 2021 03:01:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33917 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m9037-0002iN-JB; Thu, 29 Jul 2021 03:01:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gb1fX6Srfz9sXb; Thu, 29 Jul 2021 17:01:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627542100;
 bh=Sz7YMZvtiZkZDqvVz9jug2QqtQv/PoOjO9wcsFUmoTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=amlOM1ewWfx0kgMZLxF+eFXuIVAGowx0zR/hGgM7kmc8xf8tfD6XkZh/sw19zbgzU
 bE9aG3pExFl188Yipii2RtPIFE7jcModLnOO8WATwa2t2sJNOpkQH8CA/eSZlAp/fG
 hd4FDI3L36HaVaAC4xOXrwNu6E68l294iZ2v3cS4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 3/5] target/ppc: Ease L=0 requirement on cmp/cmpi/cmpl/cmpli
 for ppc32
Date: Thu, 29 Jul 2021 17:01:33 +1000
Message-Id: <20210729070135.422262-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729070135.422262-1-david@gibson.dropbear.id.au>
References: <20210729070135.422262-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 groug@kaod.org, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
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
Message-Id: <20210720135507.2444635-1-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/fixedpoint-impl.c.inc | 58 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 8864ac4516..2e2518ee15 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -171,8 +171,35 @@ TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
 
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
@@ -182,8 +209,35 @@ static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
 
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
2.31.1


