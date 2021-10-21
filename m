Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C35435A3A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 07:11:02 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdQM1-0004dH-EF
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 01:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZx-0006WP-2b; Thu, 21 Oct 2021 00:21:21 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZu-0000cy-P3; Thu, 21 Oct 2021 00:21:20 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p6DkWz4xdb; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=oNZ5eavDse5fX/y4YcIjQSfLwnCfq3ShPlls/0L9aW8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IbDJ/7GUstBDpCxVKWe2yN6qwN+gNAJe8JiGI6xr9Wr/7ETsEt0nZCWmJktmgWha5
 VidICLMYzfEAx+5n4XqoKVKsx3t+3zxNSGAnhI5AuNFJde1IpoN+66JZNejL5U6JPu
 WM+b0fmi6WFURoTjs8XtUmcODNIFpOCAGHUQYzHs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 25/25] hw/ppc/ppc4xx_pci: Fix ppc4xx_pci_map_irq() for recent
 Linux kernels
Date: Thu, 21 Oct 2021 15:20:27 +1100
Message-Id: <20211021042027.345405-26-david@gibson.dropbear.id.au>
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
Cc: Thomas Huth <thuth@redhat.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Recent Linux kernels are accessing the PCI device in slot 0 that
represents the PCI host bridge. This causes ppc4xx_pci_map_irq()
to return -1 which causes an assert() later:

 hw/pci/pci.c:262: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.

Thus we should allocate an IRQ line for the device in slot 0, too.
To avoid changes to the outside of ppc4xx_pci.c, we map it to
the internal IRQ number 4 which will then happily be ignored since
ppc440_bamboo.c does not wire it up.

With these changes it is now possible again to use recent Linux
kernels for the bamboo board.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211019091817.469003-1-thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc4xx_pci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 8147ba6f94..304a29349c 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -48,12 +48,14 @@ OBJECT_DECLARE_SIMPLE_TYPE(PPC4xxPCIState, PPC4xx_PCI_HOST_BRIDGE)
 #define PPC4xx_PCI_NR_PMMS 3
 #define PPC4xx_PCI_NR_PTMS 2
 
+#define PPC4xx_PCI_NUM_DEVS 5
+
 struct PPC4xxPCIState {
     PCIHostState parent_obj;
 
     struct PCIMasterMap pmm[PPC4xx_PCI_NR_PMMS];
     struct PCITargetMap ptm[PPC4xx_PCI_NR_PTMS];
-    qemu_irq irq[PCI_NUM_PINS];
+    qemu_irq irq[PPC4xx_PCI_NUM_DEVS];
 
     MemoryRegion container;
     MemoryRegion iomem;
@@ -246,7 +248,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
 
     trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
 
-    return slot - 1;
+    return slot > 0 ? slot - 1 : PPC4xx_PCI_NUM_DEVS - 1;
 }
 
 static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
@@ -254,7 +256,7 @@ static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
     qemu_irq *pci_irqs = opaque;
 
     trace_ppc4xx_pci_set_irq(irq_num);
-    assert(irq_num >= 0);
+    assert(irq_num >= 0 && irq_num < PPC4xx_PCI_NUM_DEVS);
     qemu_set_irq(pci_irqs[irq_num], level);
 }
 
-- 
2.31.1


