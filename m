Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D54359FC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:25:33 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPe0-0001Zk-5A
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZO-0005Td-PJ; Thu, 21 Oct 2021 00:20:46 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZL-0006tN-0v; Thu, 21 Oct 2021 00:20:46 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p3LHFz4xd9; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=AD3fL9B9SzF4408E9V5any/f5eAeNiBV05cPV3pJyGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Iz57YkRnhHNoZNa+79nCNdJDiLV1WAzHcsBtLD3fJWsOaBR7KH6/v38S0t5HZaNBz
 71/o65v53230EWC2XeUst/P4rsDYsxTEX+ifxYIYHXEdwMw5k6KlUw/pzsOv+MXjfH
 qW7M6WveHioiKmCZT4IpewUoEj1D1xLBUPzIiFMU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 04/25] target/ppc: Fix the test raising the decrementer
 exception
Date: Thu, 21 Oct 2021 15:20:06 +1100
Message-Id: <20211021042027.345405-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Commit 4d9b8ef9b5ab ("target/ppc: Fix 64-bit decrementer") introduced
new int64t variables and broke the test triggering the decrementer
exception. Revert partially the change to evaluate both clause of the
if statement.

Reported-by: Coverity CID 1464061
Fixes: 4d9b8ef9b5ab ("target/ppc: Fix 64-bit decrementer")
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20211005053324.441132-1-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index f5d012f860..a724b0bb5e 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -848,7 +848,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
      * On MSB edge based DEC implementations the MSB going from 0 -> 1 triggers
      * an edge interrupt, so raise it here too.
      */
-    if ((signed_value < 3) ||
+    if ((value < 3) ||
         ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0) ||
         ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value < 0
           && signed_decr >= 0)) {
-- 
2.31.1


