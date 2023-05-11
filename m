Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39946FEE28
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:00:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px28j-0007E5-SP; Thu, 11 May 2023 04:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28h-00077N-8J
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:59:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28f-0003rX-L8
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bJ95nycvVFMDETOWiLWq8aEOvKQUQYL0eqDl8dg0lDc=; b=phqz/paXLNqXo8yVMfxSpvipxP
 8qjOYoEk1sPk7/8vYDtxdZ9FHXRpDgwdzYMvK6NlCqwjm555KfHyUWnVjaDO0wtxa5IG4e0JG8H1m
 QRBtWAn4Q1D7NO5FkcXAe9SIGNFkn83q3RpFf/d1qm/lDvGYKIGwtiqO8SHJa1igAA46R4V6L8NY+
 MExPeVRa6Lxa4+WOOEsF6azHd/1PUpG4xQzLUp32eseF6m6zeVgl/eqsVxbNFCRDQY3omWq9p/G0W
 1c5VBxvbl8RcaOua5Zy15DvJHKfyTgWIbCZxMFdJiTp7gec3YGBkNQL00BZzohs1LFz+UrdvHfJrQ
 Fl8ag/JwzcZEYbfj/i7ehirJa6cnXd2gQc27MFs2+w7QBssS6LTsX0kmSQcgdHw4Qyofm6cLJLcz4
 8ouT+uTXdbb7keRul25y4txaKCGhkJ89ixe5ReQCaYkSAfiDIPpfLbihMjxtGArm+9H6EpYMzFVy7
 mP+CfzZ+Mwh0/PgfuP0ROuDBNNaChcHq+nGTGwYGw5FEIuRWlz2bu2xfZ/2RaqCdFrVp2QEh31oDp
 DOet9KUvKyic9Pg1PzQuDE511wzN/ZAOnQIUqwWnLJCwJkS+dKoOoprwbhfgBBKhpDrFyfc+JD29k
 XHsCtSpcRoeOgla6E/xuwkeWpg2LLVvg03Zviyscc=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27U-0008g9-CH; Thu, 11 May 2023 09:57:56 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:29 +0100
Message-Id: <20230511085731.171565-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 16/18] hw/usb/hcd-ohci-pci.c: switch OHCIState to use PCI
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
 hw/usb/hcd-ohci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
index 6b630d35a7..35e4be2a62 100644
--- a/hw/usb/hcd-ohci-pci.c
+++ b/hw/usb/hcd-ohci-pci.c
@@ -75,7 +75,7 @@ static void usb_ohci_realize_pci(PCIDevice *dev, Error **errp)
         return;
     }
 
-    ohci->state.irq = pci_allocate_irq(dev);
+    ohci->state.irq = qdev_get_gpio_in_named(DEVICE(dev), "pci-input-irq", 0);
     pci_register_bar(dev, 0, 0, &ohci->state.mem);
 }
 
-- 
2.30.2


