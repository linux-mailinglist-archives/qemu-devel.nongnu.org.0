Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E141D373
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:33:44 +0200 (CEST)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpdX-0001sd-Ew
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVot1-00025u-Jh; Thu, 30 Sep 2021 01:45:39 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosy-0003z1-PQ; Thu, 30 Sep 2021 01:45:38 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR3fcsz4xc4; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=UMkMeBz0iXJHFhgjDKXhYopMYO6XHGmIApyz3w+uefE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oBZgduBXUrY0dl/Vx+qAu/D2ujTHKsRwOt0dsQaV1ZG4PenEXDvbRS4O0SY2aONyg
 MC5lQxuD60Tb53AYtnPeip/2nkULiONF9Qja39Q2n/fzHzqc03aibKzlA46vBbgSJU
 gMLXAmTJLluf8XIzKouaT+8K3TabgYRpLERQzvaw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 33/44] target/ppc: Fix 64-bit decrementer
Date: Thu, 30 Sep 2021 15:44:15 +1000
Message-Id: <20210930054426.357344-34-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>, hpoussin@reactos.org,
 clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

The current way the mask is built can overflow with a 64-bit decrementer.
Use sextract64() to extract the signed values and remove the logic to
handle negative values which has become useless.

Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Fixes: a8dafa525181 ("target/ppc: Implement large decrementer support for TCG")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210920061203.989563-5-clg@kaod.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index b813ef732e..f5d012f860 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -821,14 +821,12 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
     CPUPPCState *env = &cpu->env;
     ppc_tb_t *tb_env = env->tb_env;
     uint64_t now, next;
-    bool negative;
+    int64_t signed_value;
+    int64_t signed_decr;
 
     /* Truncate value to decr_width and sign extend for simplicity */
-    value &= ((1ULL << nr_bits) - 1);
-    negative = !!(value & (1ULL << (nr_bits - 1)));
-    if (negative) {
-        value |= (0xFFFFFFFFULL << nr_bits);
-    }
+    signed_value = sextract64(value, 0, nr_bits);
+    signed_decr = sextract64(decr, 0, nr_bits);
 
     trace_ppc_decr_store(nr_bits, decr, value);
 
@@ -850,16 +848,16 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
      * On MSB edge based DEC implementations the MSB going from 0 -> 1 triggers
      * an edge interrupt, so raise it here too.
      */
-    if ((value < 3) ||
-        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && negative) ||
-        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && negative
-          && !(decr & (1ULL << (nr_bits - 1))))) {
+    if ((signed_value < 3) ||
+        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0) ||
+        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value < 0
+          && signed_decr >= 0)) {
         (*raise_excp)(cpu);
         return;
     }
 
     /* On MSB level based systems a 0 for the MSB stops interrupt delivery */
-    if (!negative && (tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL)) {
+    if (signed_value >= 0 && (tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL)) {
         (*lower_excp)(cpu);
     }
 
-- 
2.31.1


