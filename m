Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB06FEE41
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:02:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px287-0004oB-D0; Thu, 11 May 2023 04:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px284-0004jI-3B
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px282-0003mq-D1
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+ZBzmdU37Pg4lw9mXaCP1QfvTBDdzMb0Y7ZxRGWf6Ss=; b=iVYvMoEmBh22EFIo3R37gSTDyf
 aUmmFI1kAPJcM/imB4vjUeD6ICmun1/ngTl/NN4qI4m5DF5NxgvDASnS6kYEOXp9BMuntQr/6oxlz
 HAoKhY6eHJSh/DqKK7I3DCQjIuDoqClRsM+DtqVW5uMmh8XHBP7o0xmnlHoltniHvQESrovQwtWji
 WAGrBMp7MavRV7b8MXfvJk4795g4+VZ6cpOTaL/oIrXkzPdmvlaINibZC1CWJm+HrNQh7T9az/A9L
 7eRFJHOsv1G3V5oOqboKqRgzY6FZxERgtajqfHT8pVTZfRkmzd2HEnFSisN+NJmWma34DBaCg1PWh
 7gkPbSIGwBYkeviiF6XjCOeCI6AXt7g4r4OIFJv+JWcWLE/bp2zhmnxu4rovwOGDKHqRcGkutSu63
 ovCW+uT4y+vO1IId70Re3wPikQG7eCW2w0Zslqj6AugtR/hLV4dq6mBuV13qTXCtkyT4b3ALzgO5+
 2MWaz6jAyGysGSJGGNqxqWxWSGB5QTD47rpOiIOJoeqHFuQoMOYp9a+tf7FvP8EnzkAfqA5Lt1+J9
 AiwMTB/QuvnIttX9ahXcdOwVTcBgdbc9IozJpfZD8dayoe8bwIHTIM3qisDdAcHORs5tIuBHbeb/x
 HUyvxlz/nZjCnp9p6Z4EHo93uO75Q3g7tBlKfFv0E=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px274-0008g9-4W; Thu, 11 May 2023 09:57:26 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:22 +0100
Message-Id: <20230511085731.171565-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 09/18] hw/net/can/ctucan_pci.c: switch CtuCanPCIState to
 use PCI device input gpio
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
 hw/net/can/ctucan_pci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/net/can/ctucan_pci.c b/hw/net/can/ctucan_pci.c
index ea079e2af5..94f8f58518 100644
--- a/hw/net/can/ctucan_pci.c
+++ b/hw/net/can/ctucan_pci.c
@@ -173,7 +173,7 @@ static void ctucan_pci_realize(PCIDevice *pci_dev, Error **errp)
     pci_conf = pci_dev->config;
     pci_conf[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin A */
 
-    d->irq = pci_allocate_irq(&d->dev);
+    d->irq = qdev_get_gpio_in_named(DEVICE(pci_dev), "pci-input-irq", 0);
 
     for (i = 0 ; i < CTUCAN_PCI_CORE_COUNT; i++) {
         ctucan_init(&d->ctucan_state[i], d->irq);
@@ -207,8 +207,6 @@ static void ctucan_pci_exit(PCIDevice *pci_dev)
     for (i = 0 ; i < CTUCAN_PCI_CORE_COUNT; i++) {
         ctucan_disconnect(&d->ctucan_state[i]);
     }
-
-    qemu_free_irq(d->irq);
 }
 
 static const VMStateDescription vmstate_ctucan_pci = {
-- 
2.30.2


