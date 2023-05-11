Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4366FEE23
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:59:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px28L-0005Pl-MF; Thu, 11 May 2023 04:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28K-0005I7-3w
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:44 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28I-0003pd-KW
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M5ozvzvGY4D3l/zuoaXGIymwjEwB/QIigUuzLamsTe4=; b=eM7zBcPivNSXdlS4UQUTLs01wO
 omi2XMPidRqlXUwFffCRczhjLLuY42dLQ75rCi/wpXfbpUJCirfv8i+z251COx2qongWkqpJrqgYX
 jyr2+LwgJGZshZsb7jdYlSHiWIWjv5hytTkD3a4064ExDtXcZy1whnhx+c81Zqli9szNA3hA3woRd
 fWRQ/7NwDF1/igk8xpQUY4ELSH/za8GwmBkXinEFQ6Wggf0pxe8qj6b7vwi6AZuDBKtNzP+ZhDKtJ
 mNlTktOoT0eXoDod/LZCE8R2qQ+ON14Np47OX7xVD+656r1zSnW8+C1IOHj+Tv3IZNjr5LeSZ6gJy
 Nmhttu7FhhuAOnBonAPaSOWuHEtbMoKVaQ+iCkehgSc/QqoeiK/b7VfFdb5mFkM84RIatlvfBpB+b
 R8C5r6Vf6hY1Odqgzv8rnNvc4bz6TuYPLMr4aJeMJUrJgj2Imhe6ZXY5ctDwfACR3eh8rD5vDr1by
 Vwa7mNJ27b1GHzb1efemppZ9SCetsJc5JTPKFNnk0A4hr2ySEf19cSEFt+fwrvm5GJ0ul7wgfhNQg
 0ImvmUJYcRByUaX4c2O2pMaWukytqHlXHhCBH+yJryD+5f2n6KgSsLcwXnhgModfNEewbltEAUJjh
 3n2Yc9aIubC2+A1csFFHN/aODvO7zUgqHWKAvClFY=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27H-0008g9-DD; Thu, 11 May 2023 09:57:43 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:26 +0100
Message-Id: <20230511085731.171565-14-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 13/18] hw/scsi/esp-pci.c: switch ESPState to use PCI
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
qemu_free_irq() to be removed. Since esp_pci_scsi_exit() is now empty it can also
be removed at the same time.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp-pci.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 2f7f11e70b..9447e6c429 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -386,19 +386,11 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
                           "esp-io", 0x80);
 
     pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &pci->io);
-    s->irq = pci_allocate_irq(dev);
+    s->irq = qdev_get_gpio_in_named(DEVICE(dev), "pci-input-irq", 0);
 
     scsi_bus_init(&s->bus, sizeof(s->bus), d, &esp_pci_scsi_info);
 }
 
-static void esp_pci_scsi_exit(PCIDevice *d)
-{
-    PCIESPState *pci = PCI_ESP(d);
-    ESPState *s = ESP(&pci->esp);
-
-    qemu_free_irq(s->irq);
-}
-
 static void esp_pci_init(Object *obj)
 {
     PCIESPState *pci = PCI_ESP(obj);
@@ -412,7 +404,6 @@ static void esp_pci_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->realize = esp_pci_scsi_realize;
-    k->exit = esp_pci_scsi_exit;
     k->vendor_id = PCI_VENDOR_ID_AMD;
     k->device_id = PCI_DEVICE_ID_AMD_SCSI;
     k->revision = 0x10;
-- 
2.30.2


