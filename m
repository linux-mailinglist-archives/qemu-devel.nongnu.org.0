Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A642D405E18
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 22:39:02 +0200 (CEST)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOQp3-0001Yv-Nb
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 16:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mOQlq-0004i3-2F; Thu, 09 Sep 2021 16:35:42 -0400
Received: from [201.28.113.2] (port=9947 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mOQlo-0005xi-16; Thu, 09 Sep 2021 16:35:41 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 9 Sep 2021 17:35:17 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 850D080121D;
 Thu,  9 Sep 2021 17:35:17 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 2/2] target/ppc: Check privilege level based on PSR and
 LPCR[HR] in tlbie[l]
Date: Thu,  9 Sep 2021 17:34:39 -0300
Message-Id: <20210909203439.4114179-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909203439.4114179-1-matheus.ferst@eldorado.org.br>
References: <20210909203439.4114179-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 09 Sep 2021 20:35:17.0915 (UTC)
 FILETIME=[339D0EB0:01D7A5BA]
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
Cc: leandro.lupori@eldorado.org.br,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

PowerISA v3.0B made tlbie[l] hypervisor privileged when PSR=0 and HR=1.
To allow the check at translation time, we'll use the HR bit of LPCR to
check the MMU mode instead of the PATE.HR.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 909a092fde..154ab26872 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5517,7 +5517,15 @@ static void gen_tlbiel(DisasContext *ctx)
 #if defined(CONFIG_USER_ONLY)
     GEN_PRIV;
 #else
-    CHK_SV;
+    bool psr = (ctx->opcode >> 17) & 0x1;
+
+    if (ctx->pr) {
+        GEN_PRIV;
+    } else if (!ctx->hv) {
+        if (!psr && ctx->hr) {
+            GEN_PRIV;
+        }
+    }
 
     gen_helper_tlbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
@@ -5529,12 +5537,15 @@ static void gen_tlbie(DisasContext *ctx)
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
+        GEN_PRIV;
+    } else if (!ctx->hv) {
+        if (!ctx->gtse || (!psr && ctx->hr)) {
+            GEN_PRIV;
+        }
     }
 
     if (NARROW_MODE(ctx)) {
-- 
2.25.1


