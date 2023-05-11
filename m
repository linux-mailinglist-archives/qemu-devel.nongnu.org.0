Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BC16FEE1E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:59:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px28b-0006LR-DA; Thu, 11 May 2023 04:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28Y-0006Kc-JV
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28X-0003pz-54
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HbG7N9o1tlV0eRHskmlPJzkBODQHUSbx9l35NNXblRQ=; b=KuqhvlKy7mizvlKj3EWALcBuW7
 MFOGx6JZKaClWYB+Q8mMNHItY24SK7dh83xQxTdFBo5UmNb5wN5BRGRcjaI29yx4TP5p9/PZLYlx4
 XC8U80upS+fqG3q270c3DC1BnwfAyJnHD9cNJHMC/piu6unXcS8SNYK8PX4xWg+2UcnJ92R58yp9p
 6hSwG3+21K94waSEjroehYpL0IVB4zidqr0IRXMmtsPpBdPEmUVd5+aaygS4n6aZlu/dhW42G+UN6
 j8fFrDtqOmc1OuQSxAR/5Mvtc5+4lcokOCCqVA+xOhG392Dn/gUtZV0izPTorglZVp6Ph2kSHtw1P
 UoY1SGkKrXtTa9UnnKOahmx4GcHJqUJdYRvEjaFCYtHrKbmjAKQUYeYRp0BlALXUqFKFxyM/9bluW
 VUJLcU2W0v2a2H3YDBrvHbOUvPPbJ8yEqmfQ/FG92YP+XMtaKsiZmmtt8ZW5UhQ1n3sO703nKXVx5
 MfLV3t60c7hxRIKL4cADN5FuzZ0JHpHtoMe8dYtrT/EHH785TCwIWkgzQLpRmpleISxrIHe8Vs4mF
 kKt6YkzJtIKvUb6dAx+yBE4KJtPpY+VpSHAS2RpfVRT4ZWJZstJwuwh8Hku6QjkE8xGQii11lkXhs
 chrAIzWUOuhXHhJOLaAZJG4orRKB5xBCv7PRgNXVE=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27L-0008g9-MH; Thu, 11 May 2023 09:57:47 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:27 +0100
Message-Id: <20230511085731.171565-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 14/18] hw/sd/sdhci-pci.c: switch SDHCIState to use PCI
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

This replaces the call to pci_allocate_irq().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sd/sdhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
index c737c8b930..d2bb23c3f2 100644
--- a/hw/sd/sdhci-pci.c
+++ b/hw/sd/sdhci-pci.c
@@ -40,7 +40,7 @@ static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
 
     dev->config[PCI_CLASS_PROG] = 0x01; /* Standard Host supported DMA */
     dev->config[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin A */
-    s->irq = pci_allocate_irq(dev);
+    s->irq = qdev_get_gpio_in_named(DEVICE(dev), "pci-input-irq", 0);
     s->dma_as = pci_get_address_space(dev);
     pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
 }
-- 
2.30.2


