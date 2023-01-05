Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF92165EEDC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:37:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJN-0002xF-Ke; Thu, 05 Jan 2023 09:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJH-0002rP-EP; Thu, 05 Jan 2023 09:33:35 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJF-0006wx-KE; Thu, 05 Jan 2023 09:33:35 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so27446654wro.9;
 Thu, 05 Jan 2023 06:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yuUPAL39BWQGniG6VAc4FaCcHuPduEkKF2hR1Xdinn4=;
 b=X5ZrIhOF9LXM6nJQasmeXduF35wv9NS/jw6uLanOfTOIFutsLOa2AMTsz3QyWSeZ7H
 PtKs+CmoHL+Wc9qa5c2kCoY/zZVmgk9zpY6XAn2za+26N/oasSSEK7BSVUXDc9A7FL4G
 sNMmfxcqbs/ZoffhqbDvyYfhsPqzsTJAY4ZuMNPdkL7daEh2nBB4ouzLviCdfhICVQC+
 nXEkOEjX6MdDlrYXiueGTeZJaQWA9L+C7ufjwtxG53qA1wb3AywlwwoSrQoGbx5Fb/gX
 RT/b6Sgv+wQylFVTs40Wrz/HPMYDIjJTpkWxpf9y8N5sQX1kUKQJJiExs2TobfSKPKxB
 ZRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yuUPAL39BWQGniG6VAc4FaCcHuPduEkKF2hR1Xdinn4=;
 b=vczqWPDtTeY2Nuvgz2KRh+9tYGyVgs1NmH6x3nhooETxepFBQGCtaT5x0yJVWueqfE
 GVBupVSbTmAagEvCXhBlH4pARwDTPJ61Vy4Y3qFGbdeuNhfa4DM2CDZ4oo9yARJX0XrB
 i0SlthynLnLP+Zie9ALM5hl98BIoJ9L+n9zoouo/2JT3adbwBlUZ8J3Jb4EhvAid705k
 LPfq9KaDrmZnVr04XaWumfuDlQHhR/UwmZ99Wcws+TMkUpZpPzfOHiZ+B+8Xd7G+h8Do
 Y4lu6RIkVmP72YzwDxta8ysZXRfR7fJe/CuN9i4Nrrg++V3kKVXwrUpYn14sNpYhEFmA
 kykw==
X-Gm-Message-State: AFqh2koY1HnGDbrRV4JRs5vraxGfOXrgGuspYfohee5DluNjhrZZBZ+d
 qHZOA+whe/HyJEAVjwxqWDAzTc/no+dHLQ==
X-Google-Smtp-Source: AMrXdXuWSAIkzl32hgjoItI1U9dyc1NTvrr8xbglThVKFtGFuV3gM9FqY1itZ0oMMatd1SgKdezIMw==
X-Received: by 2002:a5d:6049:0:b0:2a6:4dfb:80c8 with SMTP id
 j9-20020a5d6049000000b002a64dfb80c8mr3532841wrt.19.1672929212216; 
 Thu, 05 Jan 2023 06:33:32 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:31 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 23/31] hw/isa/piix4: Use ISA PIC device
Date: Thu,  5 Jan 2023 15:32:20 +0100
Message-Id: <20230105143228.244965-24-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x433.google.com
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
 hw/isa/piix4.c  | 28 ++++++++++------------------
 hw/mips/malta.c | 11 +++++++++--
 hw/mips/Kconfig |  1 +
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9edaa5de3e..eae4db0182 100644
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
 
+    object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
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
 
-- 
2.39.0


