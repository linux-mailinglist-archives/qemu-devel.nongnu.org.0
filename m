Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B673B6FEE19
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:58:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px27y-0004Ff-Ag; Thu, 11 May 2023 04:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27t-0004Eu-TO
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px27o-0003he-0t
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/JSnfxCc80zfcgdeLDZ2HGsYKX8LoQDWvUZrrO7CcXE=; b=Jp6KxHmE91fryplBW4c4LNKYm5
 HabiRfqN8CVOXMKMBJZzGd+Ta6AtAn2WXnXEuhNSQ3zvzDafCfL2kJtMIcgxfr6NkATk/h+J+oOdz
 NJiFoDG4HN7OdzGKGDp5M6VGkQ98HY/hWR0qTaJyrGIglnsgfnQP7bFBjDu4PgHYlcQOORv7KULLl
 H1ApPzO+lRzNy7mcAsRSnbx6+zmglakXjWc2UotWbeHkRMPJk4HNSO+lp2CPZ/pLqoORggfAa0GB+
 SRlWztgJ/iUp5fZJLzmyM7PMaG4GeJhZgzCnk0JNMSqmyKXfKb4eLzj0a4y1WDd1nohCXbvwadR6r
 0gSjsxzNGuW7T1c7DMuUjOAOH2SQIMRKNjnm+hYHiQjeoDtUMSRdr/3qEoowlWBANLCzQ4v2Gc0lD
 Ph8spAAux2lqHZVORPd2tpk7m0UE1BJhAXSI8SZqMcregdOjMnNkGMy1GxvOSx/iLt/2mKxHObeHs
 etEuagPyWsBoxhrouKvvnHz+SFSlRPsxdD0TTf3GRvx9D4xaXMdYM6yV66hz8+0Y8OHFOAXzDwvg6
 GpKKTeudCQ+ye4DSv6T2Y82p05FHxznyeXWI9IuAr07bqE+10U4lEPwIhBdjGU4cT/ujBeIKTQfbS
 XC6KDsJbAw7UKMcwDJHY1oLswxe0RXA2XsWE0KhSU=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px26q-0008g9-Fe; Thu, 11 May 2023 09:57:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 11 May 2023 09:57:17 +0100
Message-Id: <20230511085731.171565-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [RFC PATCH 04/18] hw/pci: introduce PCI device input gpio
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

This is to allow other devices to drive the PCI device IRQ if required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/pci/pci.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 3da1481eb5..0dd3b24b62 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1683,6 +1683,13 @@ void pci_set_irq(PCIDevice *pci_dev, int level)
     qemu_set_irq(pci_dev->irq, level);
 }
 
+static void pci_device_input_irq_handler(void *opaque, int n, int level)
+{
+    PCIDevice *pci_dev = PCI_DEVICE(opaque);
+
+    pci_set_irq(pci_dev, level);
+}
+
 /* Special hooks used by device assignment */
 void pci_bus_set_route_irq_fn(PCIBus *bus, pci_route_irq_fn route_intx_to_irq)
 {
@@ -2203,6 +2210,8 @@ static void pci_device_init(Object *obj)
     PCIDevice *pci_dev = PCI_DEVICE(obj);
 
     qdev_init_gpio_out(DEVICE(obj), &pci_dev->irq, 1);
+    qdev_init_gpio_in_named(DEVICE(obj), pci_device_input_irq_handler,
+                            "pci-input-irq", 1);
 }
 
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
@@ -2856,6 +2865,8 @@ void pci_set_power(PCIDevice *d, bool state)
 /*
  * QEMU interface:
  * + Unnamed GPIO output: set to 1 if the PCI Device has asserted its irq
+ * + Named GPIO input "pci-input-irq": set to 1 if a downstream device
+ *   wishes to assert the PCI Device irq directly itself (optional)
  */
 
 static const TypeInfo pci_device_type_info = {
-- 
2.30.2


