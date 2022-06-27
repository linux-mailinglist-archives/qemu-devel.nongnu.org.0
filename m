Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A7155BA85
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:33:19 +0200 (CEST)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pni-0003bV-Bp
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pjF-0000P4-9s; Mon, 27 Jun 2022 10:28:41 -0400
Received: from [200.168.210.66] (port=27402 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pjD-0002K1-PJ; Mon, 27 Jun 2022 10:28:41 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 11:11:12 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 6C985800310;
 Mon, 27 Jun 2022 11:11:12 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com, laurent@vivier.eu,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 5/6] target/ppc: fix PMU Group A register read/write exceptions
Date: Mon, 27 Jun 2022 11:11:03 -0300
Message-Id: <20220627141104.669152-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 14:11:12.0708 (UTC)
 FILETIME=[C1CEC840:01D88A2F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A call to "gen_(hv)priv_exception" should use POWERPC_EXCP_PRIV_* as the
'error' argument instead of POWERPC_EXCP_INVAL_*, and POWERPC_EXCP_FU is
an exception type, not an exception error code. To correctly set
FSCR[IC], we should raise Facility Unavailable with this exception type
and IC value as the error code.

Fixes: 565cb1096733 ("target/ppc: add user read/write functions for MMCR0")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/power8-pmu-regs.c.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index 2bab6cece7..c3cc919ee4 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -22,7 +22,7 @@
 static bool spr_groupA_read_allowed(DisasContext *ctx)
 {
     if (!ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
         return false;
     }
 
@@ -46,10 +46,10 @@ static bool spr_groupA_write_allowed(DisasContext *ctx)
 
     if (ctx->mmcr0_pmcc1) {
         /* PMCC = 0b01 */
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
     } else {
         /* PMCC = 0b00 */
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
     }
 
     return false;
@@ -214,7 +214,7 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
      * Interrupt.
      */
     if (ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
         return;
     }
 
@@ -249,7 +249,7 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
      * Interrupt.
      */
     if (ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
         return;
     }
 
-- 
2.25.1


