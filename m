Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C241B260A1B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 07:33:44 +0200 (CEST)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFWGF-0007Ch-P2
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 01:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3W-0006MB-JN; Tue, 08 Sep 2020 01:20:36 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50473 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3U-00063e-4G; Tue, 08 Sep 2020 01:20:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Bltkv1hXWz9sVy; Tue,  8 Sep 2020 15:20:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599542407;
 bh=cdhL0/jPVxK+ALKqIw6+psSZs6LOfD1nDBLYAnFnOOQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OUaTilZNDaurjgBZrjktu5/AIct4K/MDAezaJGOMageJZH/xegWHQ5EgiUjAWzeOo
 W1yIw8EU7nd/Vrb8DCFGz3ZjQOoGSjMbmmzjV0P3zH4EzJ1wYjWLlxY6iryD9eRWHo
 +NTaf9A8NHvCUXqJ3wrepDm144Td4AzBbFrEeZyI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 24/33] hw/ppc/ppc4xx_pci: Replace pointless warning by assert()
Date: Tue,  8 Sep 2020 15:19:44 +1000
Message-Id: <20200908051953.1616885-25-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
References: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:19:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: danielhb413@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We call pci_register_root_bus() to register 4 IRQs with the
ppc4xx_pci_set_irq() handler. As it can only be called with
values in the [0-4[ range, replace the pointless warning by
an assert().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200901104043.91383-5-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc4xx_pci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index cd3f192a13..503ef46b39 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -256,10 +256,7 @@ static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
     qemu_irq *pci_irqs = opaque;
 
     trace_ppc4xx_pci_set_irq(irq_num);
-    if (irq_num < 0) {
-        fprintf(stderr, "%s: PCI irq %d\n", __func__, irq_num);
-        return;
-    }
+    assert(irq_num >= 0);
     qemu_set_irq(pci_irqs[irq_num], level);
 }
 
-- 
2.26.2


