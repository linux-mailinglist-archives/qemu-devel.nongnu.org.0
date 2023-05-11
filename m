Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B56FEE1C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:59:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px27z-0004Gk-7e; Thu, 11 May 2023 04:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27t-0004Ev-Tm
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27p-0003hF-Jm
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3u/nBDxJoh2ZGhXp1zW5w+IiSILY9g5pFaCFN6IV4/o=; b=gS5FuMvIf3dcpQCmuYN3oQ5bvP
 dPZYnl11ExC6ZT0IiIHhG1mBkDm3EYeQduz1MWDEhVHvOWyUUga73G5+DWOS9re4gXH01/x5v/1DM
 OPIqihLyO5HhdgcueASfjWnGrw2XtWm5Ao9RD95sHAk1kwUgHGvQATu6mrEDX0OY0xVuw/PdOJUQL
 tiwi81XlQ550fv+XAOecn2Av5/bar99gfwjpnYGS1nwv/3/Hxy+5gGVztXLqc+K2CNzTpMjHH/mLg
 MQyYW/UQLHvbI6av9THdbON+ro1hLDbKiYcsvgUFdkEqmEXikEOaNbwzYNByWL53vlTiUzCwH2LQO
 DLbzoZmOmcCULQJ+JJuyJsxKx1cQA+8oXfN3kNapaFw0ZSYPe+TOIFKwbKYXILzQGWuTPnrImB8u+
 2lMoyYwf/7ciPe3qWvHx0XUlWFst8LNqC+/D6q3gaKPRz7gfDN0KgLVweHuqeIrSlPTx2aZZHqltf
 z+C++S0L6PDo9gbzYS7dRG7W7rBCZtsZbBDdyvBLgDAqtEcx56VCA0iYlLXL9631/JpSN/Wc2RaQ0
 4V3Nss/5zZT70jOaSayfgEN+FLnD0VJZMPPzjcIbal/SoVr/u7WkmbkjWqUMp+0lvPPB+WLlrTCKs
 HlS0K+678jh3IABFzAK/yiUXBnfJLXPUndBHJrz4c=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px26m-0008g9-6G; Thu, 11 May 2023 09:57:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:16 +0100
Message-Id: <20230511085731.171565-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 03/18] hw/pci: use PCIDevice gpio for device IRQ
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

Change pci_set_irq() to call qemu_set_irq() on the PCI device IRQ rather than
calling PCI bus IRQ handler function directly. In order to preserve the
existing behaviour update pci_qdev_realize() so that it automatically connects
the PCI device IRQ to the PCI bus IRQ handler.

Finally add a "QEMU interface" description documenting the new PCI device IRQ
gpio next to the declaration of TYPE_PCI_DEVICE.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/pci/pci.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 9471f996a7..3da1481eb5 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1680,8 +1680,7 @@ qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
 
 void pci_set_irq(PCIDevice *pci_dev, int level)
 {
-    int intx = pci_intx(pci_dev);
-    pci_irq_handler(pci_dev, intx, level);
+    qemu_set_irq(pci_dev->irq, level);
 }
 
 /* Special hooks used by device assignment */
@@ -2193,6 +2192,10 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     pci_set_power(pci_dev, true);
 
     pci_dev->msi_trigger = pci_msi_trigger;
+
+    /* Connect device IRQ to bus */
+    qdev_connect_gpio_out(DEVICE(pci_dev), 0,
+                          pci_get_bus(pci_dev)->irq_in[pci_dev->devfn]);
 }
 
 static void pci_device_init(Object *obj)
@@ -2850,6 +2853,11 @@ void pci_set_power(PCIDevice *d, bool state)
     }
 }
 
+/*
+ * QEMU interface:
+ * + Unnamed GPIO output: set to 1 if the PCI Device has asserted its irq
+ */
+
 static const TypeInfo pci_device_type_info = {
     .name = TYPE_PCI_DEVICE,
     .parent = TYPE_DEVICE,
-- 
2.30.2


