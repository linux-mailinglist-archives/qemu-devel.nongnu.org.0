Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E96098EF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:37:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omha6-0000qD-B9
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5j-0007N7-Nc; Sat, 22 Oct 2022 11:07:15 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5i-0002Cw-3S; Sat, 22 Oct 2022 11:07:15 -0400
Received: by mail-ed1-x52e.google.com with SMTP id a5so3032202edb.11;
 Sat, 22 Oct 2022 08:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=isW16/8LHToB3dy7xbWfr+auf6dFNG472EkefD72SSM=;
 b=c+OXyRY/Q5lu3nwPNVAZWoOv89LRjN5KpVyoAExmL2mp0KJGJSq+VUUkzjjDGrsF9J
 4dGma/mBBuC3N5YHN+78YXIDjWgFF3RjjSu8j7A+OIdGDj7jkBCQZGgSwtirbFo6YhMv
 Z8aii0ExBei+fshFvdPBI0BKx6Bz+pAXUIoQzBwBeSooPbQwHBRp9Rai/lTAVgM2uaCt
 TsPQbb+B9AIpkB3h3LaYjEMH0nES08L7wmu3EIw4lfTelO2ndXMpAjFvgehyK/V+xAQf
 3Q+thrNlZavyCvcKjcI/hUaBzys9wQiW26ml0G4xyaXVXacVbUEYWIn8MTlV++1ImJ30
 rqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=isW16/8LHToB3dy7xbWfr+auf6dFNG472EkefD72SSM=;
 b=RRPsvTbHysW0m9u5//tx/hPRJZMJyqLmp26cvSIQsFWEIXva1W7kVskG2WJ8Z2x9/K
 zLr87+l1oyHEhOUap/gJxLCN42wvw31VmPajsEOSyjTYqGDVS4N0iAgGJ4eYHdohC2k/
 97guW2MGgPwqpb9LcMd+UYNCD3zZaIsZ56TLobM/o1MrJQTkcwE8hePixnAQ4tO+uBnA
 4z0wCf19z4BsWHtJxY6xVUQynr+vLZ6Uq0QlEVjw/LNY+9yQWOKbJbTo+I0dpbSMbTca
 NhVDQUnRWZ1B9X99N1+rps7Qw5oXdMH+lF4Qt4hG9uzdvKcPLmxTYbep6dE6H8auB4nr
 7nZw==
X-Gm-Message-State: ACrzQf1s768IYJf1+BThAl2WiqHj+vjJVNe1yA/KN7Ni+VFqvlvE0E7x
 0w7ixSxp/blzx8K4QmqBgeuLFBxotZQkqA==
X-Google-Smtp-Source: AMsMyM47W9C8uIoNFaVHwdgw6iemOfE03le0dSrzLCfhR+25qGPfDQJ0aB5/TCuK7zhF3hV6FiiH/g==
X-Received: by 2002:a05:6402:3223:b0:461:8635:e5c with SMTP id
 g35-20020a056402322300b0046186350e5cmr2023320eda.303.1666451232843; 
 Sat, 22 Oct 2022 08:07:12 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:11 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 32/43] hw/isa/piix4: Use ISA PIC device
Date: Sat, 22 Oct 2022 17:04:57 +0200
Message-Id: <20221022150508.26830-33-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Aligns the code with PIIX3 such that PIIXState can be used in PIIX4,
too.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c  | 28 ++++++++++------------------
 hw/mips/malta.c | 11 +++++++++--
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index d65f486008..8ddff23116 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -44,9 +44,8 @@
 
 struct PIIX4State {
     PCIDevice dev;
-    qemu_irq cpu_intr;
-    qemu_irq *isa;
 
+    ISAPICState pic;
     RTCState rtc;
     PCIIDEState ide;
     UHCIState uhci;
@@ -84,7 +83,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
-        qemu_set_irq(s->isa[pic_irq], pic_level);
+        qemu_set_irq(s->pic.in_irqs[pic_irq], pic_level);
     }
 }
 
@@ -176,12 +175,6 @@ static const VMStateDescription vmstate_piix4 = {
     }
 };
 
-static void piix4_request_i8259_irq(void *opaque, int irq, int level)
-{
-    PIIX4State *s = opaque;
-    qemu_set_irq(s->cpu_intr, level);
-}
-
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
@@ -217,7 +210,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
-    qemu_irq *i8259_out_irq;
 
     isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
                           pci_address_space_io(dev), errp);
@@ -225,20 +217,18 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
-                             "intr", 1);
-
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
 
     /* initialize i8259 pic */
-    i8259_out_irq = qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
-    s->isa = i8259_init(isa_bus, *i8259_out_irq);
+    if (!qdev_realize(DEVICE(&s->pic), BUS(isa_bus), errp)) {
+        return;
+    }
 
     /* initialize ISA irqs */
-    isa_bus_irqs(isa_bus, s->isa);
+    isa_bus_irqs(isa_bus, s->pic.in_irqs);
 
     /* initialize pit */
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
@@ -251,7 +241,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
+    s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
     /* IDE */
     qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
@@ -278,7 +268,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
             return;
         }
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
+        qdev_connect_gpio_out(DEVICE(&s->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&s->pic), 9));
     }
 
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
@@ -288,6 +279,7 @@ static void piix4_init(Object *obj)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
+    object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 44b6b14f3d..68e800b00f 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -28,6 +28,7 @@
 #include "qemu/datadir.h"
 #include "hw/clock.h"
 #include "hw/southbridge/piix.h"
+#include "hw/intc/i8259.h"
 #include "hw/isa/superio.h"
 #include "hw/char/serial.h"
 #include "net/net.h"
@@ -1232,10 +1233,11 @@ void mips_malta_init(MachineState *machine)
     PCIBus *pci_bus;
     ISABus *isa_bus;
     qemu_irq cbus_irq, i8259_irq;
+    qemu_irq *i8259;
     I2CBus *smbus;
     DriveInfo *dinfo;
     int fl_idx = 0;
-    int be;
+    int be, i;
     MaltaState *s;
     PCIDevice *piix4;
     DeviceState *dev;
@@ -1414,7 +1416,12 @@ void mips_malta_init(MachineState *machine)
     pci_ide_create_devs(PCI_DEVICE(dev));
 
     /* Interrupt controller */
-    qdev_connect_gpio_out_named(DEVICE(piix4), "intr", 0, i8259_irq);
+    dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pic"));
+    i8259 = i8259_init(isa_bus, i8259_irq);
+    for (i = 0; i < ISA_NUM_IRQS; i++) {
+        qdev_connect_gpio_out(dev, i, i8259[i]);
+    }
+    g_free(i8259);
 
     /* generate SPD EEPROM data */
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pm"));
-- 
2.38.1


