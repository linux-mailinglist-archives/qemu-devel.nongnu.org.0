Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4B6534CE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:15:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82U0-0003e8-Mk; Wed, 21 Dec 2022 12:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sy-0002vR-4v; Wed, 21 Dec 2022 12:01:17 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sw-0008Cn-A3; Wed, 21 Dec 2022 12:01:15 -0500
Received: by mail-ed1-x52a.google.com with SMTP id s5so22802538edc.12;
 Wed, 21 Dec 2022 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZFCGJSvE95cqJLyT5kVe37JSo8g+LdE+FxOhVy+jDI=;
 b=bgE98q7OGNXvuYgAJNjTx6Oc6s34zmzC2BzSwtDALEXKlyEouLjgAkVKelIstvFWXh
 hCJD4lUnkA61fjSaAEnWs84ewX7NWfG3HOrfUDJKroo1FXlE71JHW+/cpkdu0C0s16VH
 qAfHHIbwtO4ppaQ8SY8hyD8nR7se5bqkav7NmTOqpuCMRD5zS8BqjTgLTuSvtHCsYyor
 7RmTyjFANJSQCnBKq4WgBHD2yyw4gHfhGUdhdPxWTB/bPlRF3ilvYs3DDsKKisAtDFIX
 rdoVgaBfLuFu5eMs4DvVp7mLApy+Hn00c8iXeNq8wz8Y2GLycyEnZOItVeMu1yrpuY2G
 tJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZFCGJSvE95cqJLyT5kVe37JSo8g+LdE+FxOhVy+jDI=;
 b=OGuOsrLU5XxV6oj7yfqEOwASsmD87yq1nwh/n1hnM5s9hubRALN+ms5TPhXf5IPVQT
 uJkLOBXAu8lCv59YYRjXkgYHg1hHUvv7t8Fov0NEjC0AU6vnAsH4eDtJAN+9Ryt7hZ+E
 vDwB2Vsg6tBW9zdJZJN7+kc09TAC4n2u5pzWq4+CAL5kRcGZDcpOOeokAyPQ2kiyIM7K
 cRPQfkYYKgotLG54Jdzold0jgertq9FGRJc7MJ0vbTf2+C2bGEd+ikVwbMTAVoMowpdN
 9U5fMFSwelE8R+E+dfrfJS93qTd24KQgtJ8ik+uYFaseJ8oQm+644JtSSS9uQDi3tgUO
 LC8A==
X-Gm-Message-State: AFqh2kr4bLmHS0CqaeH77HwUdr/bCD+Ruasb1fssy0EbTvgXRsBsLnnh
 40BT9vF+Ixvz0XM14cBNHqOI6cCzRIY=
X-Google-Smtp-Source: AMrXdXuUey66Z495JO8Z+bnX1s0LDHCnyOblIPKJialfCphDP8r/BSPgOFPeVr2ZltnQQwyoZ/90Mw==
X-Received: by 2002:a05:6402:2b89:b0:461:ca30:653 with SMTP id
 fj9-20020a0564022b8900b00461ca300653mr2735326edb.31.1671642072897; 
 Wed, 21 Dec 2022 09:01:12 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:01:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 22/30] hw/isa/piix4: Use Proxy PIC device
Date: Wed, 21 Dec 2022 17:59:55 +0100
Message-Id: <20221221170003.2929-23-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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
index 9edaa5de3e..a68e45cd53 100644
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
 
@@ -149,12 +148,6 @@ static const VMStateDescription vmstate_piix4 = {
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
@@ -190,7 +183,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
-    qemu_irq *i8259_out_irq;
 
     isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
                           pci_address_space_io(dev), errp);
@@ -198,20 +190,18 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
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
@@ -224,7 +214,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
+    s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
     /* IDE */
     qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
@@ -251,7 +241,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
             return;
         }
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
+        qdev_connect_gpio_out(DEVICE(&s->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&s->pic), 9));
     }
 
     pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
@@ -261,6 +252,7 @@ static void piix4_init(Object *obj)
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
index a930a91f00..1bb493353b 100644
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
@@ -1280,10 +1281,11 @@ void mips_malta_init(MachineState *machine)
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
@@ -1458,7 +1460,12 @@ void mips_malta_init(MachineState *machine)
     pci_ide_create_devs(PCI_DEVICE(dev));
 
     /* Interrupt controller */
-    qdev_connect_gpio_out_named(DEVICE(piix4), "intr", 0, i8259_irq);
+    dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pic"));
+    i8259 = i8259_init(isa_bus, i8259_irq);
+    for (i = 0; i < ISA_NUM_IRQS; i++) {
+        qdev_connect_gpio_out(dev, i, i8259[i]);
+    }
+    g_free(i8259);
 
     pci_bus_map_irqs(pci_bus, pci_slot_get_pirq);
 
-- 
2.39.0


