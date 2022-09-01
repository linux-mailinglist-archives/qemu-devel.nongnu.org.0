Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3215A9D91
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:55:23 +0200 (CEST)
Received: from localhost ([::1]:56242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnTP-0001HU-1a
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2T-0002QR-OA
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:34 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2N-0001TY-Fh
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:31 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bj12so35786353ejb.13
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=fg262DyFFhJoLbDKo7DrKpLbeDb7ag02YxRokkeeINU=;
 b=pb6t6SN5RKm51YHrrpIof+qN6ICzu1/Cz5hbswIO0if7yYZzqFgZyR3WD4mKIHiYiQ
 zxBI+Rq/pguH5D+n5USncRgkhIxQ5JNtc1yyJdUCEXikHttZzz3JckRHnzBwYBWgrg3t
 sJMMHsWxNyH9SDcKVwnrZf9AW3v7uuDJ+nXvIfEe1w3CPsUmtBWXUk+OiK9VsmMyIBa6
 PubL4YlJBg1xH2JQIKH/WG/mXZW1FGjmbIKuOX4aJwmqtHU4ydabSkwtKpDuPt8PLQGJ
 dnzfDPDVlZipURWkQtLhQ71lRD/Xc7mbNz0oZxuX7Mdcazq/G1+pXajAE6vuj3j9wJ5b
 5zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=fg262DyFFhJoLbDKo7DrKpLbeDb7ag02YxRokkeeINU=;
 b=rv2E2axoBYLc/3sUyGtoql6gQ+AiGicWLG+ARSWnydtn95mI6dM0TRWvT8Ab/AMqEm
 3DqmhB5U4kRVY9l53tOCTHkhkvCk8WXhDNCsxtGP/c1YEQPmzd+n9EovTVBk5c5fT5C4
 GXFOTIUI4Hyv5tJa4ura7xoSCzSaD/ilTqvJvFodYQY8IX3+TzP4lf9e4pDgyNRITbvS
 0FddDQlv5wEUqqh7SMl9OoDKGnAJ7vg4BHF9dC3fte4eZnJvQlul/kHm0qaudQX2fPmy
 1JU/TqwO5dra8LcCHpyNtdNg8nJYC4tpnaD6lM2BcIBD1ddclVadm/HpKI8CQ4HuAK8o
 VcnQ==
X-Gm-Message-State: ACgBeo0MX/S6Qqaxtcm6tkOcOK8Y14IPBLyRQBznM/PN/1EWElyJ54Zh
 Wq/5r66K8nRtWRBIXHHamWNfZrDQ55Q=
X-Google-Smtp-Source: AA6agR7jweUBLnUdTeSXq1HHPK50WiBX9IKC18mlWx/hapfB5n6F3qEUpEeMDBk9r3IKuyHQbxQBxw==
X-Received: by 2002:a17:907:948f:b0:731:3f2e:8916 with SMTP id
 dm15-20020a170907948f00b007313f2e8916mr25110088ejc.442.1662049635398; 
 Thu, 01 Sep 2022 09:27:15 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:14 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 29/42] hw/isa/piix4: Use ISA PIC device
Date: Thu,  1 Sep 2022 18:26:00 +0200
Message-Id: <20220901162613.6939-30-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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

Aligns the code with PIIX3 such that PIIXState can be used in PIIX4,
too. Furthermore, using the isa-pic device in PIIX4 could allow the
Malta board to gain KVM accelleration capabilities.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c  | 28 ++++++++++------------------
 hw/mips/malta.c | 11 +++++++++--
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 3e9a84de8b..128284bd0a 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -43,9 +43,8 @@
 
 struct PIIX4State {
     PCIDevice dev;
-    qemu_irq cpu_intr;
-    qemu_irq *isa;
 
+    ISAPICState pic;
     RTCState rtc;
     PCIIDEState ide;
     UHCIState uhci;
@@ -83,7 +82,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
-        qemu_set_irq(s->isa[pic_irq], pic_level);
+        qemu_set_irq(s->pic.in_irqs[pic_irq], pic_level);
     }
 }
 
@@ -175,12 +174,6 @@ static const VMStateDescription vmstate_piix4 = {
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
@@ -216,7 +209,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
-    qemu_irq *i8259_out_irq;
 
     isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
                           pci_address_space_io(dev), errp);
@@ -224,20 +216,18 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
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
@@ -250,7 +240,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
+    s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
     /* IDE */
     qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
@@ -277,7 +267,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
             return;
         }
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
+        qdev_connect_gpio_out(DEVICE(&s->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&s->pic), 9));
     }
 
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
@@ -287,6 +278,7 @@ static void piix4_init(Object *obj)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
+    object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
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
2.37.3


