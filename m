Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69006FEE27
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:00:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px281-0004Zt-Tu; Thu, 11 May 2023 04:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27x-0004HA-Qr
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27w-0003m3-F9
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1lAZ9h+I0qwLq2701dP0yI0vhzcu5+T1NQfojAKOTH8=; b=jI63Mdq6mNmnGFKt4xcxdcZECQ
 yRr/I+SSsg8JltPDsEaJ7d8sjscIf9cnXSpnTjTJKZpjeWLTKuE66ZKy0Zd4pjlISeG8nuMCieHS9
 gwjKfVoDDuuaCNyR47+HXlrCdZE9wH4NTbVIZ0INKPm98KysZe6TAW0VnqEYnmVf6xKhbsorvTHfG
 xZ08NpWDDSHI+rL8M75CBHv7360r5x1okgF6ea3tOKA23P2PdQoyKdK/+LLfSseibk2ossjXfCyWm
 LZqluO6u3+bHzVGRPyqVhIfO0B8V/OmpbBexhi3RjuzkZnOuqUfLZQ7yrQXoTm8YUcZ0IvU4qC2Qm
 QftVM4wfIhRctI2oRjdANQp8CiBaMD9n5UP1Irw2gmSoWhlIf7dC1ZHci26M9/k95mhFeP6pfYDIh
 azPc8e5cc3l5CT3CSTb+h3s+5CpQjBQVLAOt6yr22P+EyJsa0C9/tRm0CzHjrVBCLL8IXGtgmvDyT
 mAFEzqTOsd+KK+enECqrpTonP1xkjTCChL2JwDXPPe/D0KKOXzWCVgqeED6M3vOltHfmn3stRvgIG
 AWJzImi4eqGvECJOC6Q7ozjqUJTf9cFwr/qSu8GTBMf/WvaNdow4iVBBkBk1fYyUktruafYNCgHya
 GX8mq3ssojaX43L9cOwxyrsz4WbqaiDUMt3ApA0k4=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px26v-0008g9-5c; Thu, 11 May 2023 09:57:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:19 +0100
Message-Id: <20230511085731.171565-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 06/18] hw/ide/ich.c: switch AHCIState to use PCI device
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
 hw/ide/ich.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index d61faab532..646de05663 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -123,7 +123,7 @@ static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
     /* XXX Software should program this register */
     dev->config[0x90]   = 1 << 6; /* Address Map Register - AHCI mode */
 
-    d->ahci.irq = pci_allocate_irq(dev);
+    d->ahci.irq = qdev_get_gpio_in_named(DEVICE(dev), "pci-input-irq", 0);
 
     pci_register_bar(dev, ICH9_IDP_BAR, PCI_BASE_ADDRESS_SPACE_IO,
                      &d->ahci.idp);
@@ -159,7 +159,6 @@ static void pci_ich9_uninit(PCIDevice *dev)
 
     msi_uninit(dev);
     ahci_uninit(&d->ahci);
-    qemu_free_irq(d->ahci.irq);
 }
 
 static void ich_ahci_class_init(ObjectClass *klass, void *data)
-- 
2.30.2


