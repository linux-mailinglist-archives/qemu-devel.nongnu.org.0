Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4984B6FEE2D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:01:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px28I-00054K-11; Thu, 11 May 2023 04:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28F-0004yz-Pc
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28E-0003oc-Dt
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m3sl5AM+pITfcaQ0KhyxSoI9xUqrckMAhNxoBfYz/rY=; b=QZ4D1yRvL2r90jsfetKXr/0Bmu
 3GgFRgdrY6McpsF1x2ELVtSK2pKif+gPxaYoDEJVMKXpi1dfp9oSbIxXLntORbIl0OMWL1o8Cuz4r
 GbFT//36xqe4+q+s8CDuLLHrLxyLWAdS8jcbkCbbrjnq4Q/5sIuuiBYaTEW2aG0b4peCL3PLUWok+
 DTWM/tLRPi56ScV3b+KCfWFzfIn82u99BzzyOXOhHvO2voj7OVdYLUJGY7FSHVyc88gH53xlvzhxX
 ULGRwh4Z3Rx55hvKQZ54e436ZDzGNjrxCrNwTDu/wy/ms5jErfVYAVa/UoUiMe0XIewdCmgkpzrE+
 TlNxTfpfg8Zy86NvX49BDQvw50ejznn/tTeA580Q4OaRCOmOC0BfLbO3lkMVc0KvMZ46Z6YcSAOw0
 VZ3rOTY4v2ovj0ZuY4EuhmAzLGIJSaiP85uPtx65wMLvzitoyADTK5oP8MFspF3ySXOiTLKDwOHXJ
 Ye7aZXDFDJPFh8g42Vv2RsJEBv2oPj19X55bwKQ2cgt7iUxsINg7bWDD2gXOdAbum8bqbyEdBl7xI
 5um0Jvbce++tdKTthRjbPJRQNsZG72rqZlKGDeHZG5eNSue3XcnsZz/Bh0gT9PSt2ZWZOHk5sJ2EV
 CfFFkjKpC0oE924N6nUMw9R4KxNz9O30Dws6MvQVc=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27D-0008g9-3J; Thu, 11 May 2023 09:57:39 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:25 +0100
Message-Id: <20230511085731.171565-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 12/18] hw/net/tulip.c: switch TULIPState to use PCI device
 input gpio
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
 hw/net/tulip.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 915e5fb595..0b4bd8af51 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -979,7 +979,7 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
     pci_register_bar(&s->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io);
     pci_register_bar(&s->dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->memory);
 
-    s->irq = pci_allocate_irq(&s->dev);
+    s->irq = qdev_get_gpio_in_named(DEVICE(pci_dev), "pci-input-irq", 0);
 
     s->nic = qemu_new_nic(&net_tulip_info, &s->c,
                           object_get_typename(OBJECT(pci_dev)),
@@ -992,7 +992,6 @@ static void pci_tulip_exit(PCIDevice *pci_dev)
     TULIPState *s = DO_UPCAST(TULIPState, dev, pci_dev);
 
     qemu_del_nic(s->nic);
-    qemu_free_irq(s->irq);
     eeprom93xx_free(&pci_dev->qdev, s->eeprom);
 }
 
-- 
2.30.2


