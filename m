Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405C4547430
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:20:38 +0200 (CEST)
Received: from localhost ([::1]:44742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzAT-0007z2-B3
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySl-0004xt-As
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySj-0006Zr-P8
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id o16so1492663wra.4
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cYa9Wyy8+NW3p95A4BL25JrfyHdT0y0O/3yT5378jVU=;
 b=PZesKQPTM94tgnQfCcUt5RXPxlrtOJ5HRMzZQSBURJffLtkPYOJ4af7RobIPMMuMHp
 91oeBZpUB3f0HUym/MxrxMB5YxCYVMQ6c+iIbIHlPRzlap53DTluOMxc9A7Pts5M3YIy
 7CC+cDtIge7sYJVM1pmY1zczYPonI24clpW1oQD5ZCGeTB2+3Ko/Fx3KVzejdg0lXjLW
 g2zoMWyDmyH5jukgSR7oe/G/dQL/gbs5qxODnYp4sjDwnNBFCZid10U8/vSMrnfp2IYM
 ux8A6EqX7w52rtb3ax+Jm7WsJPgEmbanC1FiT0AraqpFBA4VQr+qlxtHRm2bcEYyL9Ud
 nZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cYa9Wyy8+NW3p95A4BL25JrfyHdT0y0O/3yT5378jVU=;
 b=NOAOl1Tw6ZWJ8v0MswdbxZ+eGmQOyBEDsm81TtxqyOttFjPuDFHAZEkS6pUnDPndDb
 bb0p1YiJKHofXU7Wu7soqbWYi9yaQjwREnVBFeuXGfq9Evzbv5Moy83XrLsdRInIqUry
 EqXCVEgOCD/T/FSorPPSPup98aK998XRsZMnuAxpInu6scsKS2NaLK6Y9VwxTInPMXk8
 t6dHxK/D4ipiUiATe9qp39BjTj56O14v3TC4eE2Fuw+rECdch1kzRMjVv9V+schB4KXZ
 xQkQKDGMCYlUpO5liSTgDYMKQ8LqSmkk5FZ5NiFrAeN2I9IfDQV25zoW32tDwAaZwtb5
 Q8JQ==
X-Gm-Message-State: AOAM530qlQMRX9rAVFsuh+RysyraIEspFM3d8RhclH0BvdX1e+GS3dLs
 gHsZzgyirEIcNyIp8hBCOsBE1ZE7fQQ=
X-Google-Smtp-Source: ABdhPJwermiMH2fYDNjlMcjeS4cEq6bMxDuGMokvaUsZWWbBM+kFtrp4zsrLPnwZDedZ2ZzyMkVZhQ==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr48773188wrz.690.1654943723566; 
 Sat, 11 Jun 2022 03:35:23 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 n189-20020a1ca4c6000000b0039c747a1e8fsm6069614wme.7.2022.06.11.03.35.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 25/49] hw/isa/piix4.c: create PIIX4_PM device directly instead
 of using piix4_pm_initfn()
Date: Sat, 11 Jun 2022 12:32:48 +0200
Message-Id: <20220611103312.67773-26-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Now that all external logic has been removed from piix4_pm_initfn() the PIIX4_PM
device can be instantiated directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-12-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.36.1


