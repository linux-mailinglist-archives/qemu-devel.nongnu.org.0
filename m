Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F3536C09
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:43:08 +0200 (CEST)
Received: from localhost ([::1]:49348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nusyR-0007T5-Rn
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscX-00063Z-BC
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscU-00040B-Ek
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QVxcsu4wbyacSkDWYBZhMl5mHcSEwBD78RWBoSEqoa0=; b=OovF+FrGo0c9/wZGrZtInz9DgV
 l1pwxmFcw1u2yThnz6r+TdARgwHBJuDrViXihEv4bNtHxmSTP+23EddN+7Lqv348T/7UKpeYWUH0A
 /equfXfofIKfymvklGJ9FRt2EINIF369yyODlWkz/CFVM7Ssjf9CP/JL3wmFsM3PbSTh1Wb3MmI6f
 uE4m3Q0trx+41Xvbm8ohZC0wVEUohrWW0mi/zyY6yceusMwLGdTTq6sJHwFgzDMbrEBLoSx6cWrvb
 hMeHi09QGRYBD42NKL9pEAp/4a3zC/6MlfrXlqkO80m2D617gq1dwMAUL1OfvKa7yoqWxN4/X876A
 qdp4XMTCiG05V8IWaYRQPGnvuE0QrJ8KkI45PD6GvaETUzG8Mvmuao7YzYYDwrZdXfhCfJofwcXCC
 QtCO5lTj5pfX8IY7bwN9tIRV8il/aRBkwlfvZUoHGWh1OeA0mJ6GZIv1/z9sydR/2xvMHevbasIzp
 1Bu53ktLr7kYKH0TSsM77gqi+8TFtrmWHC7FfoRyG52uYOeWWkiiWA+iTl/uUkG5K1TyAIBhix4i6
 DvcoLD6g5fIwA2OGUj4NzcpY07GWO6JHLbEQNRlxA2pAF10R3Y0IBZNBeuoDlOU+JI3p7aKHEK1EK
 FIDXp2SnbqnfFUkVh82Q/9sBO4+Y9bE1/NpdRCUWI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusbJ-0003JL-Ed; Sat, 28 May 2022 10:19:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:33 +0100
Message-Id: <20220528091934.15520-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 11/12] hw/isa/piix4.c: create PIIX4_PM device directly instead
 of using piix4_pm_initfn()
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all external logic has been removed from piix4_pm_initfn() the PIIX4_PM
device can be instantiated directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/isa/piix4.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 775e15eb20..9a6d981037 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -34,6 +34,7 @@
 #include "hw/timer/i8254.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/ide/pci.h"
+#include "hw/acpi/piix4.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -293,7 +294,6 @@ static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
     PIIX4State *s;
-    PIIX4PMState *pms;
     PCIDevice *pci;
     DeviceState *dev;
     int devfn = PCI_DEVFN(10, 0);
@@ -311,10 +311,13 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100, 0);
-        qdev_connect_gpio_out(DEVICE(pms), 0,
+        pci = pci_new(devfn + 3, TYPE_PIIX4_PM);
+        qdev_prop_set_uint32(DEVICE(pci), "smb_io_base", 0x1100);
+        qdev_prop_set_bit(DEVICE(pci), "smm-enabled", 0);
+        pci_realize_and_unref(pci, pci_bus, &error_fatal);
+        qdev_connect_gpio_out(DEVICE(pci), 0,
                               qdev_get_gpio_in_named(dev, "isa", 9));
-        *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
+        *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pci), "i2c"));
     }
 
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
-- 
2.20.1


