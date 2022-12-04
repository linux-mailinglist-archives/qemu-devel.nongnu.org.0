Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EADB641F1E
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:10:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLP-00029x-Kt; Sun, 04 Dec 2022 14:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLN-00029T-Gs; Sun, 04 Dec 2022 14:08:05 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLG-0001di-JU; Sun, 04 Dec 2022 14:08:03 -0500
Received: by mail-ed1-x52f.google.com with SMTP id a16so13030717edb.9;
 Sun, 04 Dec 2022 11:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJe/x/f5psHysCR+cTfpOkxzfZdgwmNuxZEnGlBuf0E=;
 b=GU2wuIGIAUDJFHGnpIWAGudyspaTIOZWLFZLHgtvq8TtNtSZ4Dm5MB/sJqfCh/yjJF
 jvuCC6uQ/kuTJU8WqiBfOOTtQUdxGwQr4MoAMeVOHDS19IrZvM+mq1nAA5CLaHGwJF1B
 J44hFT5IHBSXJdDHSIkjl5FSfWZzjJihXK2gzHHfNbcykY+ZBzHWtfnnmNBW3GX4VPVT
 cRRuSYdoVlj9TodIk2gUz5tUw0kyLbAGVGcxSrReJUj/p/2iw6+8m/hV7ZusQxW/8Cp4
 Zvl+kRZVADTOZVaxj77Lg9ECyPxPezFKTi8rM0Vt/EWYOuSVXEAS8kk1dzkI3gHw+DJX
 nv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJe/x/f5psHysCR+cTfpOkxzfZdgwmNuxZEnGlBuf0E=;
 b=yqEGUAAdei1sKSLA7gxeT/vU0zseWdqx97QZ1its/qaAlzZCNydnHAa9Ho6OjPWwib
 dG1fO9dG335oJPrks0xzGklLpvN6gj0nN4bIEh4NzCbBFRvV/z4NTSO7iFznVtNyeQQc
 1H8hnrtX8H90OWUg7sN2gx9YfE+zir/hG1L2Vs+CCtqDo4JWlab4Kmtigj+L2yEqLX6W
 AILa3ulYHd5oEtOVP1HKixX0+RkLOmTkS4V3VgPXPyeM4aJVE3vuSC3LwMKI35pddIW0
 zRHAJWMsJn/WOU7zYXJuoGkfH5bM3pI0Bz4i/RtgQRoVz8zNzjcGvjCVn7N/gMVxeSlq
 FjXw==
X-Gm-Message-State: ANoB5pmOSDIKAdBnINTMBmLjAcjMXBtBh8zPPgwIH3iDY7eM9f/hXJD3
 kUlkPIdzkgy8CyCkFJO+04x2oGpHxLE=
X-Google-Smtp-Source: AA0mqf7atwCDKaBzkYcvVpTh/NZfmrmR/9KgKJqmwGli/lTMJguMvXWOde3DhepROu3cPX2u5QJbTQ==
X-Received: by 2002:aa7:de05:0:b0:46b:7706:9a38 with SMTP id
 h5-20020aa7de05000000b0046b77069a38mr22907910edv.321.1670180877418; 
 Sun, 04 Dec 2022 11:07:57 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 22/32] hw/isa/piix4: Use Proxy PIC device
Date: Sun,  4 Dec 2022 20:05:43 +0100
Message-Id: <20221204190553.3274-23-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Aligns the code with PIIX3 such that PIIXState can be used in PIIX4,
too.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-33-shentey@gmail.com>
---
 hw/isa/Kconfig  |  2 +-
 hw/isa/piix4.c  | 30 +++++++++++-------------------
 hw/mips/Kconfig |  1 +
 hw/mips/malta.c | 11 +++++++++--
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 8bf6462798..4dfa3310d9 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -48,10 +48,10 @@ config PIIX4
     select ACPI_PIIX4
     select I8254
     select I8257
-    select I8259
     select IDE_PIIX
     select ISA_BUS
     select MC146818RTC
+    select PROXY_PIC
     select USB_UHCI
 
 config VT82C686
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index dbefcb3ff4..0c34e3717c 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -30,7 +30,7 @@
 #include "hw/pci/pci.h"
 #include "hw/ide/piix.h"
 #include "hw/isa/isa.h"
-#include "hw/intc/i8259.h"
+#include "hw/core/proxy-pic.h"
 #include "hw/dma/i8257.h"
 #include "hw/timer/i8254.h"
 #include "hw/rtc/mc146818rtc.h"
@@ -44,9 +44,8 @@
 
 struct PIIX4State {
     PCIDevice dev;
-    qemu_irq cpu_intr;
-    qemu_irq *isa;
 
+    ProxyPICState pic;
     RTCState rtc;
     PCIIDEState ide;
     UHCIState uhci;
@@ -82,7 +81,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
-        qemu_set_irq(s->isa[pic_irq], pic_level);
+        qemu_set_irq(s->pic.in_irqs[pic_irq], pic_level);
     }
 }
 
@@ -174,12 +173,6 @@ static const VMStateDescription vmstate_piix4 = {
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
@@ -215,7 +208,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
-    qemu_irq *i8259_out_irq;
 
     isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
                           pci_address_space_io(dev), errp);
@@ -223,20 +215,18 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
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
+    if (!qdev_realize(DEVICE(&s->pic), NULL, errp)) {
+        return;
+    }
 
     /* initialize ISA irqs */
-    isa_bus_irqs(isa_bus, s->isa);
+    isa_bus_irqs(isa_bus, s->pic.in_irqs);
 
     /* initialize pit */
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
@@ -249,7 +239,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
+    s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
     /* IDE */
     qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
@@ -276,7 +266,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
             return;
         }
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
+        qdev_connect_gpio_out(DEVICE(&s->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&s->pic), 9));
     }
 
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
@@ -286,6 +277,7 @@ static void piix4_init(Object *obj)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
+    object_initialize_child(obj, "pic", &s->pic, TYPE_PROXY_PIC);
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 4e7042f03d..d156de812c 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -1,5 +1,6 @@
 config MALTA
     bool
+    select I8259
     select ISA_SUPERIO
     select PIIX4
 
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 4d0251ee12..36bdc184f6 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -29,6 +29,7 @@
 #include "qemu/guest-random.h"
 #include "hw/clock.h"
 #include "hw/southbridge/piix.h"
+#include "hw/intc/i8259.h"
 #include "hw/isa/superio.h"
 #include "hw/char/serial.h"
 #include "net/net.h"
@@ -1254,10 +1255,11 @@ void mips_malta_init(MachineState *machine)
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
@@ -1432,7 +1434,12 @@ void mips_malta_init(MachineState *machine)
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


