Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8606B55BA8C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:37:55 +0200 (CEST)
Received: from localhost ([::1]:56184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5psA-00022h-Jo
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pj9-00009C-2U; Mon, 27 Jun 2022 10:28:35 -0400
Received: from [200.168.210.66] (port=27402 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o5pj7-0002K1-Hg; Mon, 27 Jun 2022 10:28:34 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 11:11:12 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id EF64D800310;
 Mon, 27 Jun 2022 11:11:11 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com, laurent@vivier.eu,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 3/6] target/ppc: remove mfdcrux and mtdcrux
Date: Mon, 27 Jun 2022 11:11:01 -0300
Message-Id: <20220627141104.669152-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 14:11:12.0286 (UTC)
 FILETIME=[C18E63E0:01D88A2F]
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

The only PowerPC implementations with these insns were the 460 and 460F,
which had their definitions removed in [1].

[1] 7ff26aa6c657 ("target/ppc: Remove unused PPC 460 and 460F definitions")

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/cpu.h       |  6 ++----
 target/ppc/translate.c | 18 ------------------
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6d78078f37..80664446e6 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2203,8 +2203,6 @@ enum {
     PPC_DCR            = 0x1000000000000000ULL,
     /* DCR extended accesse                                                  */
     PPC_DCRX           = 0x2000000000000000ULL,
-    /* user-mode DCR access, implemented in PowerPC 460                      */
-    PPC_DCRUX          = 0x4000000000000000ULL,
     /* popcntw and popcntd instructions                                      */
     PPC_POPCNTWD       = 0x8000000000000000ULL,
 
@@ -2228,8 +2226,8 @@ enum {
                         | PPC_405_MAC | PPC_440_SPEC | PPC_BOOKE \
                         | PPC_MFAPIDI | PPC_TLBIVA | PPC_TLBIVAX \
                         | PPC_4xx_COMMON | PPC_40x_ICBT | PPC_RFMCI \
-                        | PPC_RFDI | PPC_DCR | PPC_DCRX | PPC_DCRUX \
-                        | PPC_POPCNTWD | PPC_CILDST)
+                        | PPC_RFDI | PPC_DCR | PPC_DCRX | PPC_POPCNTWD \
+                        | PPC_CILDST)
 
     /* extended type values */
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d7e5670c20..30dd524959 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5907,22 +5907,6 @@ static void gen_mtdcrx(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-/* mfdcrux (PPC 460) : user-mode access to DCR */
-static void gen_mfdcrux(DisasContext *ctx)
-{
-    gen_helper_load_dcr(cpu_gpr[rD(ctx->opcode)], cpu_env,
-                        cpu_gpr[rA(ctx->opcode)]);
-    /* Note: Rc update flag set leads to undefined state of Rc0 */
-}
-
-/* mtdcrux (PPC 460) : user-mode access to DCR */
-static void gen_mtdcrux(DisasContext *ctx)
-{
-    gen_helper_store_dcr(cpu_env, cpu_gpr[rA(ctx->opcode)],
-                         cpu_gpr[rS(ctx->opcode)]);
-    /* Note: Rc update flag set leads to undefined state of Rc0 */
-}
-
 /* dccci */
 static void gen_dccci(DisasContext *ctx)
 {
@@ -6958,8 +6942,6 @@ GEN_HANDLER(mfdcr, 0x1F, 0x03, 0x0A, 0x00000001, PPC_DCR),
 GEN_HANDLER(mtdcr, 0x1F, 0x03, 0x0E, 0x00000001, PPC_DCR),
 GEN_HANDLER(mfdcrx, 0x1F, 0x03, 0x08, 0x00000000, PPC_DCRX),
 GEN_HANDLER(mtdcrx, 0x1F, 0x03, 0x0C, 0x00000000, PPC_DCRX),
-GEN_HANDLER(mfdcrux, 0x1F, 0x03, 0x09, 0x00000000, PPC_DCRUX),
-GEN_HANDLER(mtdcrux, 0x1F, 0x03, 0x0D, 0x00000000, PPC_DCRUX),
 GEN_HANDLER(dccci, 0x1F, 0x06, 0x0E, 0x03E00001, PPC_4xx_COMMON),
 GEN_HANDLER(dcread, 0x1F, 0x06, 0x0F, 0x00000001, PPC_4xx_COMMON),
 GEN_HANDLER2(icbt_40x, "icbt", 0x1F, 0x06, 0x08, 0x03E00001, PPC_40x_ICBT),
-- 
2.25.1


