Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFB341D305
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:04:44 +0200 (CEST)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpBT-00069O-O8
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosc-0001kh-EK; Thu, 30 Sep 2021 01:45:14 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:42303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosa-0003d2-KU; Thu, 30 Sep 2021 01:45:14 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR2ZVsz4xbs; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=RKkrBAvWpriOvj6OUZtroTkffBYfcp6kdl9+kKE4RZU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j9HnS5afKJwWWjsoEhXvmyBUrFn0m6Y+rOmVTR5ESe8LZ5cBtIiAwEL2HAMQeXqzo
 hGGo6Rd7ftcK/QoZnQK55P7dlWLMSUASzmUJG4aMvkwRvJ1yI7Pe942/yH08WSyhks
 rF/qTKQ+oT4u+o7eHM7Yz4tY78nwcqVlWm7Diimk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 24/44] target/ppc: Check privilege level based on PSR and
 LPCR[HR] in tlbie[l]
Date: Thu, 30 Sep 2021 15:44:06 +1000
Message-Id: <20210930054426.357344-25-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, groug@kaod.org, hpoussin@reactos.org, clg@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

PowerISA v3.0B made tlbie[l] hypervisor privileged when PSR=0 and HR=1.
To allow the check at translation time, we'll use the HR bit of LPCR to
check the MMU mode instead of the PATE.HR.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210917114751.206845-3-matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9af1624ad2..b985e9e55b 100644
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
2.31.1


