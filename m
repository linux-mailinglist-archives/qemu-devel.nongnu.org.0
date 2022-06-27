Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2626655BA84
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:33:10 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pnY-0002vj-KR
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pj1-0008OF-US; Mon, 27 Jun 2022 10:28:29 -0400
Received: from [200.168.210.66] (port=27402 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5piz-0002K1-Q7; Mon, 27 Jun 2022 10:28:27 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 11:11:11 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 78169800310;
 Mon, 27 Jun 2022 11:11:11 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com, laurent@vivier.eu,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 1/6] target/ppc: Fix gen_priv_exception error value in
 mfspr/mtspr
Date: Mon, 27 Jun 2022 11:10:59 -0300
Message-Id: <20220627141104.669152-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 14:11:11.0910 (UTC)
 FILETIME=[C1550460:01D88A2F]
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

The code in linux-user/ppc/cpu_loop.c expects POWERPC_EXCP_PRIV
exception with error POWERPC_EXCP_PRIV_OPC or POWERPC_EXCP_PRIV_REG,
while POWERPC_EXCP_INVAL_SPR is expected in POWERPC_EXCP_INVAL
exceptions. This mismatch caused an EXCP_DUMP with the message "Unknown
privilege violation (03)", as seen in [1].

[1] https://gitlab.com/qemu-project/qemu/-/issues/588

Fixes: 9b2fadda3e01 ("ppc: Rework generation of priv and inval interrupts")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/588
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
This patch was split from
https://lists.gnu.org/archive/html/qemu-ppc/2022-01/msg00400.html
---
 target/ppc/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 1d6daa4608..55f34eb490 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4789,11 +4789,11 @@ static inline void gen_op_mfspr(DisasContext *ctx)
          */
         if (sprn & 0x10) {
             if (ctx->pr) {
-                gen_priv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+                gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
             }
         } else {
             if (ctx->pr || sprn == 0 || sprn == 4 || sprn == 5 || sprn == 6) {
-                gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+                gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
             }
         }
     }
@@ -4976,11 +4976,11 @@ static void gen_mtspr(DisasContext *ctx)
          */
         if (sprn & 0x10) {
             if (ctx->pr) {
-                gen_priv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+                gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
             }
         } else {
             if (ctx->pr || sprn == 0) {
-                gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+                gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
             }
         }
     }
-- 
2.25.1


