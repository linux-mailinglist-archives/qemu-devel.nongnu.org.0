Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594DD6FEE24
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:59:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px281-0004UF-PT; Thu, 11 May 2023 04:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27v-0004FL-4Y
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27t-0003kp-Jj
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yunaipr1ei5zCdNDkaJkhpf8o3wPnHYfKVAQjazTc0E=; b=sd5PIKek8PITgk5KpZ/9zvxmz+
 nw4YZLI1w/KrnwgrxcAj0OsoSYk0gnzvzQfC4QBrva1H25Pi2aPNvNQplCvnMSnYrV2lcj+XcZDH8
 95erLplAMfNEf/RbmxGfuyeCfH1vRj5MmffpF5N01s7gderqbeU24NCDzJZyu1dCUtsyJejZHXrtp
 Anx8Qny/A0IJLwD6GhvHKkh2C8iYkFJMCA7NNGNPFl3aDcFPR3tiPQhXugCioxQrI73DFPDjBOcXT
 th5L3pp8shsT66T9r3Rj6BgaO4AenLHwIwn+RhxFgKPMbEtJxm2xBzdtAIKCvAYsIHiqlzgfrHiG6
 NpQD2iX9nBqFCz0QMvvdvvSl2e3MLkPAVHxScchghSSkLtmobgQ3NOkj8otsFclGSmoWTX51mTkPa
 2eeiEJiaccTyhaqBf+orbDJD+8N1bOos4MH3tyWa7W+FN4pFi6N5T3QOqFWSmY6xAwNO/QW0KmabX
 YwroURJ4h89Ug/j+hsBqSquE7foeulDAuWuJzzxk0bSXW6DIHzb4V9ef1iGlEz9wc5PBd4gW1zFQe
 eDbnzCvvv9euP3c88gOCqXViC+wkSvLSGX0anI3JVdjpq2namQYgOcXdgMd/QdZYb5sxYxlgBNict
 /9mFgg1LII8M6fQTS1RgrahHCzrS8hM21SI7+zKwg=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px26q-0008g9-ST; Thu, 11 May 2023 09:57:16 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:18 +0100
Message-Id: <20230511085731.171565-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 05/18] hw/char/serial-pci.c: switch SerialState to use PCI
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
 hw/char/serial-pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 087da3059a..cd7e8b5b94 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -55,7 +55,7 @@ static void serial_pci_realize(PCIDevice *dev, Error **errp)
 
     pci->dev.config[PCI_CLASS_PROG] = pci->prog_if;
     pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
-    s->irq = pci_allocate_irq(&pci->dev);
+    s->irq = qdev_get_gpio_in_named(DEVICE(dev), "pci-input-irq", 0);
 
     memory_region_init_io(&s->io, OBJECT(pci), &serial_io_ops, s, "serial", 8);
     pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io);
@@ -67,7 +67,6 @@ static void serial_pci_exit(PCIDevice *dev)
     SerialState *s = &pci->state;
 
     qdev_unrealize(DEVICE(s));
-    qemu_free_irq(s->irq);
 }
 
 static const VMStateDescription vmstate_pci_serial = {
-- 
2.30.2


