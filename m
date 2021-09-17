Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3B40F6EE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:55:46 +0200 (CEST)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRCT2-0005d1-UE
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mRCN3-0000Zq-Vn; Fri, 17 Sep 2021 07:49:33 -0400
Received: from [201.28.113.2] (port=58746 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mRCN2-00070N-Jc; Fri, 17 Sep 2021 07:49:33 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 17 Sep 2021 08:48:27 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id EF5A280130D;
 Fri, 17 Sep 2021 08:48:26 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 2/2] target/ppc: Check privilege level based on PSR and
 LPCR[HR] in tlbie[l]
Date: Fri, 17 Sep 2021 08:47:51 -0300
Message-Id: <20210917114751.206845-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917114751.206845-1-matheus.ferst@eldorado.org.br>
References: <20210917114751.206845-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Sep 2021 11:48:27.0565 (UTC)
 FILETIME=[EDAE6DD0:01D7ABB9]
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
Cc: leandro.lupori@eldorado.org.br, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

PowerISA v3.0B made tlbie[l] hypervisor privileged when PSR=0 and HR=1.
To allow the check at translation time, we'll use the HR bit of LPCR to
check the MMU mode instead of the PATE.HR.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 909a092fde..25ee9f75b2 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5517,7 +5517,15 @@ static void gen_tlbiel(DisasContext *ctx)
 #if defined(CONFIG_USER_ONLY)
     GEN_PRIV;
 #else
-    CHK_SV;
+    bool psr = (ctx->opcode >> 17) & 0x1;
+
+    if (ctx->pr || (!ctx->hv && !psr && ctx->hr)) {
+        /*
+         * tlbiel is privileged except when PSR=0 and HR=1, making it
+         * hypervisor privileged.
+         */
+        GEN_PRIV;
+    }
 
     gen_helper_tlbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
@@ -5529,12 +5537,20 @@ static void gen_tlbie(DisasContext *ctx)
 #if defined(CONFIG_USER_ONLY)
     GEN_PRIV;
 #else
+    bool psr = (ctx->opcode >> 17) & 0x1;
     TCGv_i32 t1;
 
-    if (ctx->gtse) {
-        CHK_SV; /* If gtse is set then tlbie is supervisor privileged */
-    } else {
-        CHK_HV; /* Else hypervisor privileged */
+    if (ctx->pr) {
+        /* tlbie is privileged... */
+        GEN_PRIV;
+    } else if (!ctx->hv) {
+        if (!ctx->gtse || (!psr && ctx->hr)) {
+            /*
+             * ... except when GTSE=0 or when PSR=0 and HR=1, making it
+             * hypervisor privileged.
+             */
+            GEN_PRIV;
+        }
     }
 
     if (NARROW_MODE(ctx)) {
-- 
2.25.1


