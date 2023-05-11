Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B56FEE34
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:01:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px28f-0006yW-Un; Thu, 11 May 2023 04:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28d-0006kp-9L
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:59:03 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28b-0003qS-Fm
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4YZVQdXqDEVsRNtE8Rfyw4+n+zxNQRswA9eNgSgArg4=; b=C4DKOCQDC/h/hueTM4B24gipiK
 a3fCZynwEtiFIS15P4guYQ4hsNOOnd9nZNtjIChMuGtWz+IBRyffc8V7NkIHVMKgGBK8cTYuxV5kb
 W7t3OTe9hwoH4QCE+f/5ld4dn13aI2lg3JB0VJaWimaJQSOCh0XhiG4J/9eNGhXd3APpIpwsjZk0p
 YczxRkCIUGvrpxGlJDuFXw/uIo3vzukCS/UCDR+JVpNW4QWTN3r1bNfKErjJitKU/wvBZYd3dDKwJ
 cR6hTKooWTN0U+mJiIAGjdTI1Or3r/Ua5nXFW7rx9DBSlVy+yJsWYoV7mGiInDV/2BkmHWjXXsmVK
 k/NwEDiCVqNhSlxg27Zunj9kljJ0vOZ+UIA4UKRMGy5/uwGZuUhFg6N+pB0h2wCMAiWCTGAz+YMzl
 GSAkdSP9G2Es9Tx5A6EIVTG9oLv9XQraQ0Q4uZTAzRLG946fDQlb6I/R0/rGAYwVd5z/0TGkNOu6Z
 wEHtbQ7FREnMaPyB9/S2FO/KEWtBdhvAnhooTOn3fXIa4lIEuEsmjLUxCDyrD6XcP267asqoBSbsu
 5xz10RwK9f6jIi76vdvyXTmE1ONZxf5eOazBojr/y+QFm0ZIDA281Xm+FMvMCnOG6E3veyMz8wXPZ
 qinf1kSInC/lqlv5DoFIzLeoUF8givX1aeil6uO3c=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27P-0008g9-WB; Thu, 11 May 2023 09:57:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:28 +0100
Message-Id: <20230511085731.171565-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 15/18] hw/usb/hcd-ehci-pci.c: switch EHCIState to use PCI
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
 hw/usb/hcd-ehci-pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/usb/hcd-ehci-pci.c b/hw/usb/hcd-ehci-pci.c
index 4c37c8e227..eed98799b7 100644
--- a/hw/usb/hcd-ehci-pci.c
+++ b/hw/usb/hcd-ehci-pci.c
@@ -65,7 +65,7 @@ static void usb_ehci_pci_realize(PCIDevice *dev, Error **errp)
     pci_conf[0x6e] = 0x00;
     pci_conf[0x6f] = 0xc0;  /* USBLEFCTLSTS */
 
-    s->irq = pci_allocate_irq(dev);
+    s->irq = qdev_get_gpio_in_named(DEVICE(dev), "pci-input-irq", 0);
     s->as = pci_get_address_space(dev);
 
     usb_ehci_realize(s, DEVICE(dev), NULL);
@@ -107,7 +107,6 @@ static void usb_ehci_pci_exit(PCIDevice *dev)
 
     usb_ehci_unrealize(s, DEVICE(dev));
 
-    g_free(s->irq);
     s->irq = NULL;
 }
 
-- 
2.30.2


