Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1796FEE31
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:01:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px28E-0004wO-Hy; Thu, 11 May 2023 04:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28C-0004qj-PO
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28A-0003nx-B3
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZcHx4pHLCkJas0hSCf31JgVq7T5yCBGcHpekyuNKDrg=; b=CLREdyT9VzH7SYkI3hZq1Jlv44
 LmRqSxPpT+i18yVxPT4yPhaBNhO800a0xUr4718yOisu8C1iXb425qRTK1MmHPcN8OWoJJ7fMxTfU
 7EudNrajJwLOGHRbX0J21hBlaWfx7/T/k933etloGr6I/1WjLYDRd4VGW5C+EIkq41lzMIdB4RwTm
 M6AC/dPRhlL5Q+1o6rJtcJCi8l1iiS/x2zaZ6f6q+Y+ljhaI0m/1EAYi2T1TzLXH2cPciIATMgJRV
 28Q6hPKlI+5uXWK0xm/3mC2bagY9vUOtS26oLh9IqR0QDL+E/IQ8S5qUQZX6amUyj0FFyEumEKec9
 SiGKL2N/lJrl3K6dqJeOa9rgvYO8cCLXjj3SnAdjhRzuPNLZ6pg1QlIGgbvKJIbBigtcwHTwvcNRs
 40KH0C9j9bgarAOYc/Okjd5PegsVSndcocsieNpjXoCbe8wxu9ubHUB4xcyG+YKNZ/nXU4/0vErHe
 uP9grUYcith6YokcKevo4zBK5kLEgNO/O6O9/wUSdZx/LwnjV85jpU6ee91ca/epwc4zYeG05e5ur
 RUir3h4WTZM9A3YLgjXdhlTz4RieDSAF2HNAU4DOU/Gk8O86a9C/+lbDjxCB8uzG8l5dH78GRx7+m
 Wh72nHaC30rj67Mqba4QfVuW8fUAUPCTRXDxtjsqE=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px278-0008g9-QT; Thu, 11 May 2023 09:57:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:24 +0100
Message-Id: <20230511085731.171565-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 11/18] hw/net/pcnet-pci.c: switch PCIPCNetState to use PCI
 device input gpio
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

This replaces the call to pci_allocate_irq() and also allows the corresponding
qemu_free_irq() to be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/pcnet-pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index 96a302c141..cd2e080b4f 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -182,7 +182,6 @@ static void pci_pcnet_uninit(PCIDevice *dev)
 {
     PCIPCNetState *d = PCI_PCNET(dev);
 
-    qemu_free_irq(d->state.irq);
     timer_free(d->state.poll_timer);
     qemu_del_nic(d->state.nic);
 }
@@ -227,7 +226,7 @@ static void pci_pcnet_realize(PCIDevice *pci_dev, Error **errp)
 
     pci_register_bar(pci_dev, 1, 0, &s->mmio);
 
-    s->irq = pci_allocate_irq(pci_dev);
+    s->irq = qdev_get_gpio_in_named(DEVICE(pci_dev), "pci-input-irq", 0);
     s->phys_mem_read = pci_physical_memory_read;
     s->phys_mem_write = pci_physical_memory_write;
     s->dma_opaque = DEVICE(pci_dev);
-- 
2.30.2


