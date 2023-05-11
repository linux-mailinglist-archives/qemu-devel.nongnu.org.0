Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9720D6FEE1D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:59:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px282-0004aw-F0; Thu, 11 May 2023 04:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27w-0004G0-41
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27j-0003gy-Ff
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=efo8aqdQd5QiTEo966f0QgTBbUevcQb0wEYOlvuPvdk=; b=dBKeNS/u2vAVRNq3JiL47othfM
 0QCHz7F6L6QEQlUyJEs254jLPsDySG2vFsGbLDpMiyl5t9BzHsdNKuznp5ncdCWAbP1l4KK01ZbNx
 F1/AKLoOly0WGiSB8C+c17pEBZWxnUqRiUAiuQ20cVhP2IUAmaBRfe6jSeyOdo6Wk6oX/Sv4MpKDd
 MvPw908IGK8PXMWlL41AZ2yIs8e0jpUHGp7r0lYvR3Z8YMRHDm5rJqfCWeuF+SchfNY+lJaHEm7ot
 7/unTn6DvT1M6N/iAUgHHHfpW8m08ZjTPsvISqzlPXEK29LpiR+7lrEkX8MvnWdEojUgf61e9bVjn
 76W5TQy4fEBw+MnEobAvRu5g1vRkPanxYrDFIDP3q7e02LawChdBXyQ+YOIkBKrGqxfvMEuY6Ootu
 YRw94VF1mIl1/NP/pENH36ylO7sLsD5PvmK3Mxd7RvCUPHMdqOQRxEjnWRbncxZ2SDFJmG7agddsl
 ruPEGD8z/kGOxpTHrVI/NGX5KVvd/ij+TIeXNqH961tsL9dpVEKg2aJrdyvz4jIrKKkCHnNLqWLWk
 ay78hKZlFLNOBVXVTRF9inSGyPQQjPkL5IfGgECchM5H+8pwW3rvQ0dy0LF66UeDqByvhaFv7pgBX
 R2YM+scbUiQrSo3pus8E+z3ZcnGCytrO+NLMHF6C4=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px26h-0008g9-RU; Thu, 11 May 2023 09:57:07 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:15 +0100
Message-Id: <20230511085731.171565-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 02/18] hw/pci: introduce PCI bus input IRQs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce a new pci_bus_irq_handler input IRQ handler that can be triggered by
each unique PCI devfn on the bus. Add a new pci_bus_init() instance init
function to initialise the IRQ array and a corresponding pci_bus_finalize()
instance finalize function to free it.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/pci/pci.c             | 34 ++++++++++++++++++++++++++++++++++
 include/hw/pci/pci_bus.h |  3 +++
 2 files changed, 37 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index f29ac20895..9471f996a7 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -179,6 +179,24 @@ static void pci_bus_unrealize(BusState *qbus)
     vmstate_unregister(NULL, &vmstate_pcibus, bus);
 }
 
+static void pci_bus_irq_handler(void *opaque, int devfn, int level);
+
+static void pci_bus_init(Object *obj)
+{
+    PCIBus *bus = PCI_BUS(obj);
+
+    /* IRQs */
+    bus->irq_in = qemu_allocate_irqs(pci_bus_irq_handler, bus,
+                                     PCI_SLOT_MAX * PCI_FUNC_MAX);
+}
+
+static void pci_bus_finalize(Object *obj)
+{
+    PCIBus *bus = PCI_BUS(obj);
+
+    qemu_free_irqs(bus->irq_in, PCI_SLOT_MAX * PCI_FUNC_MAX);
+}
+
 static int pcibus_num(PCIBus *bus)
 {
     if (pci_bus_is_root(bus)) {
@@ -211,7 +229,9 @@ static void pci_bus_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pci_bus_info = {
     .name = TYPE_PCI_BUS,
     .parent = TYPE_BUS,
+    .instance_init = pci_bus_init,
     .instance_size = sizeof(PCIBus),
+    .instance_finalize = pci_bus_finalize,
     .class_size = sizeof(PCIBusClass),
     .class_init = pci_bus_class_init,
 };
@@ -1636,6 +1656,20 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
     pci_change_irq_level(pci_dev, irq_num, change);
 }
 
+/* Bus IRQ handler */
+static void pci_bus_irq_handler(void *opaque, int devfn, int level)
+{
+    PCIBus *bus = PCI_BUS(opaque);
+    PCIDevice *pci_dev;
+    int intx;
+
+    assert(0 <= devfn && devfn < PCI_SLOT_MAX * PCI_FUNC_MAX);
+    pci_dev = bus->devices[devfn];
+    intx = pci_intx(pci_dev);
+
+    pci_irq_handler(pci_dev, intx, level);
+}
+
 qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
 {
     int intx = pci_intx(pci_dev);
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 5653175957..8486df283e 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -54,6 +54,9 @@ struct PCIBus {
     int nirq;
     int *irq_count;
 
+    /* Bus IRQ handler */
+    qemu_irq *irq_in;
+
     Notifier machine_done;
 };
 
-- 
2.30.2


