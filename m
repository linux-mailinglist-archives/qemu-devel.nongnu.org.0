Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6CE433210
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:21:47 +0200 (CEST)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclJY-00035r-Q8
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mclGQ-0001Gq-07
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:18:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mclGL-0004pb-Ra
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4BQuD116ZwadeM8o+VsrqJ09TFb1YtrV7sB3T/H3X9I=;
 b=Nfr2C7kTxbFAlIHTSv/LB2Uj0OGFNNm9+V0Ic/ChCqqN4eTY8fKxF12lPx0/3yGciouPgc
 gjYvAb2udLPneM0yHFR6hEyxnlz72EkvTrKkKjvUTM5CtxdJ2OYzzJA3wCFZDb4JmiANz+
 voD2OEh+bvuoPZcCQYx38IBbpJw67NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483--zEqUtuhPyasiPvgaDRv0g-1; Tue, 19 Oct 2021 05:18:23 -0400
X-MC-Unique: -zEqUtuhPyasiPvgaDRv0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C0DC806668;
 Tue, 19 Oct 2021 09:18:21 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA6FA5F4E0;
 Tue, 19 Oct 2021 09:18:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/ppc/ppc4xx_pci: Fix ppc4xx_pci_map_irq() for recent Linux
 kernels
Date: Tue, 19 Oct 2021 11:18:17 +0200
Message-Id: <20211019091817.469003-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 qemu-ppc@nongnu.org, clg@kaod.org, edgar.iglesias@gmail.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.27.0


