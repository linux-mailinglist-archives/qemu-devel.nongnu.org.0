Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCABA6FEE25
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:59:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px29D-0007fd-6q; Thu, 11 May 2023 04:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28l-0007RQ-Hg
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:59:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px28j-0003sV-Vw
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EsK7PVmpJ1jnWrUlJt2YH62mh+w6etdZNOiTuBLkiio=; b=k3hwOiXzLFnGbFZSyfBZ5Qy+Rc
 o0Z4U5GYZLku3Hna66lgYrb70i65J0tKxTvNluu2S4dB18Ct5C5tlCHdMfsvq4TeKGt+ANOa1Aiu7
 Zl/7gPXLOl0Sslcvfj3yeXNkbuqNEsoQsxXc96uSPqodBWKlk15N1td61xkZ0e7axCZr3mZW36jgK
 ogFv4+vjr3E2Q2ERxg6VwXJAVb8BMzC/FDf5+vYb7eO7RSMUhhsNtyUfF6LAZ+Zs4AESsLcDm1Iux
 DJr0YlQyhdnyVOqBfsu1iT/UxqICYdrnooWOa1bWtpGW+5KY5FLzOpZWVJF6jpVd3X9COGaUz6wir
 cFSeDwPfeR9+tX1Ogyr8Sh+jHaO40xrBlttH1K8zWBw8YbWCxrf8aBqKNIn5r0xGULthIEpnJiaC1
 tfZVxpiwQr1syrxRYaxb1vlRkpgDKRRHFgFws5PmKgnDSnK9B0QEpL3ZAyGYDedtyletyHReNWXyP
 3zz9RRTd0uw4k9NV3qbenMk3YNdJ25lrTBVu43pDj1aIH9SVaGH6lzeCVOy6nxOWVzZg9m6jsVQot
 j1hdhnaNWss0fJ7ey08bk0oV1zR6sEVKnHHp2IbYUGe7tHlu6D2s4PgJr1YEGZpfM3auFJ3n2L1im
 hJXJUrCVphDdiDFajCFP3X2dIf3jBddJ510ZphX2s=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27Y-0008g9-LY; Thu, 11 May 2023 09:58:00 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:30 +0100
Message-Id: <20230511085731.171565-18-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 17/18] hw/usb/hcd-uhci.c: switch UHCIState to use PCI
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
 hw/usb/hcd-uhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 77baaa7a6b..0b08dadd1b 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1168,7 +1168,7 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
     /* TODO: reset value should be 0. */
     pci_conf[USB_SBRN] = USB_RELEASE_1; /* release number */
     pci_config_set_interrupt_pin(pci_conf, u->info.irq_pin + 1);
-    s->irq = pci_allocate_irq(dev);
+    s->irq = qdev_get_gpio_in_named(DEVICE(dev), "pci-input-irq", 0);
 
     if (s->masterbus) {
         USBPort *ports[NB_PORTS];
-- 
2.30.2


