Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3165148DCD5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:21:01 +0100 (CET)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83mS-0001ne-00
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:20:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n83XW-0004ti-HK; Thu, 13 Jan 2022 12:05:31 -0500
Received: from [201.28.113.2] (port=33800 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n83XO-0006PO-G5; Thu, 13 Jan 2022 12:05:23 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 13 Jan 2022 14:05:06 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0E7F88006BD;
 Thu, 13 Jan 2022 14:05:06 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v3 3/3] target/ppc: Fix gen_priv_exception error value in
 mfspr/mtspr
Date: Thu, 13 Jan 2022 14:04:56 -0300
Message-Id: <20220113170456.1796911-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113170456.1796911-1-matheus.ferst@eldorado.org.br>
References: <20220113170456.1796911-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Jan 2022 17:05:06.0398 (UTC)
 FILETIME=[B69CC7E0:01D8089F]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, laurent@vivier.eu,
 groug@kaod.org, clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The code in linux-user/ppc/cpu_loop.c expects POWERPC_EXCP_PRIV
exception with error POWERPC_EXCP_PRIV_OPC or POWERPC_EXCP_PRIV_REG,
while POWERPC_EXCP_INVAL_SPR is expected in POWERPC_EXCP_INVAL
exceptions. This mismatch caused an EXCP_DUMP with the message "Unknown
privilege violation (03)", as seen in [1].

Fixes: 9b2fadda3e01 ("ppc: Rework generation of priv and inval interrupts")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/588

[1] https://gitlab.com/qemu-project/qemu/-/issues/588

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
Is there any case where throwing a PRIV/INVAL exception with a
INVAL/PRIV error makes sense? It seems wrong, but maybe I'm missing
something... especially with the HV_EMU to program check conversion.

Also, if this patch is correct, it seems that all invalid SPR access
would be nop or privilege exceptions. In this case, is
POWERPC_EXCP_INVAL_SPR still needed?
---
 target/ppc/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 40232201bb..abbc3a5bb9 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4827,11 +4827,11 @@ static inline void gen_op_mfspr(DisasContext *ctx)
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
@@ -5014,11 +5014,11 @@ static void gen_mtspr(DisasContext *ctx)
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


