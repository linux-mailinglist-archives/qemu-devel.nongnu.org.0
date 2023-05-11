Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C956FEE1B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:59:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px27l-00047K-Tx; Thu, 11 May 2023 04:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27h-000477-F7
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27e-0003gV-W6
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fajwXgdO+2h/QETYDefjM+uV1sToydfzaBMv1C+hkT8=; b=OOX/mQcXP4NYdSRLPOHyxAX09L
 pdirPKtb/aWv8/5WOSFlJj2ymt7L/toO7kcaazV8a3xMyot/bmwaEvdquXF7d7ZB0GKrAJQ9LSYRG
 NxWwSuy4AO/jL7uTJ6d5L6XrYB/N4y7ZPG3Weouy/Kq0PdMbqLYtf7bRidvpRL7lNj6bT194xVq9k
 3BFnskzLcI3kJrP8vwpe5ZuST8jhB0zIsdlEaQsnUBDWqCQQChX/wYYOSXI5xAHmXKMyGMjK2fZ8/
 2veG7OzE7SUlVWodNPrnoPYP/rx+XcTYC79qvSQsoWXNlvLbPvKp2mRD6NNw6v9hq9twFsRUxfdvl
 aN137B+XJetLvZlGdvrQowHHvaWQxckmGVcyTIaF0lSeDsjxeIYF7jZpzFpXOkqlCLUntXcnw0HNp
 BvLXKVJYSuUiiFOGMkoCTDfYlxCixxCPVhS0CbBjOPFrAPoy7jx353bXL0IIi6akQ20vBGItlqKV5
 VobfFMebvcRNQ0ER9nHiHBw3pbRuQZ38SNvdkTrPgPrL1LuGUMX1jQPtZCt7CIetq7r+jotoCCmgp
 aZ7Q1XrOT9twb2vFqf5hnsrdWsUQrON2Ue4wfg4YRuCeaOD2AdWQb3VfIdojfEop85Zts/tl77lkS
 6WsO2wnHqq/2BAQm6Sj1hyi7MTPCQYHH+PhBRbJ/g=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px26d-0008g9-Id; Thu, 11 May 2023 09:57:03 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:14 +0100
Message-Id: <20230511085731.171565-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 01/18] hw/pci: add device IRQ to PCIDevice
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

Introduce pci_device_init() and use it to initialise an output IRQ.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/pci/pci.c                | 8 ++++++++
 include/hw/pci/pci_device.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8a87ccc8b0..f29ac20895 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2161,6 +2161,13 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     pci_dev->msi_trigger = pci_msi_trigger;
 }
 
+static void pci_device_init(Object *obj)
+{
+    PCIDevice *pci_dev = PCI_DEVICE(obj);
+
+    qdev_init_gpio_out(DEVICE(obj), &pci_dev->irq, 1);
+}
+
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
                                  const char *name)
 {
@@ -2812,6 +2819,7 @@ void pci_set_power(PCIDevice *d, bool state)
 static const TypeInfo pci_device_type_info = {
     .name = TYPE_PCI_DEVICE,
     .parent = TYPE_DEVICE,
+    .instance_init = pci_device_init,
     .instance_size = sizeof(PCIDevice),
     .abstract = true,
     .class_size = sizeof(PCIDeviceClass),
diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
index d3dd0f64b2..2c6dca5d15 100644
--- a/include/hw/pci/pci_device.h
+++ b/include/hw/pci/pci_device.h
@@ -149,6 +149,9 @@ struct PCIDevice {
     MemoryRegion rom;
     uint32_t rom_bar;
 
+    /* PCI IRQ */
+    qemu_irq irq;
+
     /* INTx routing notifier */
     PCIINTxRoutingNotifier intx_routing_notifier;
 
-- 
2.30.2


