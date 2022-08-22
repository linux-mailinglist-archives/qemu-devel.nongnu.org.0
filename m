Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F859CBC6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:53:34 +0200 (CEST)
Received: from localhost ([::1]:53506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGIX-0007kl-7Y
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA9-0003u0-CW; Mon, 22 Aug 2022 18:44:53 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA7-0007w8-Bt; Mon, 22 Aug 2022 18:44:52 -0400
Received: by mail-ed1-x535.google.com with SMTP id t5so15781686edc.11;
 Mon, 22 Aug 2022 15:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HZGV+UnNspEYU91zMSEmgVnT3X3ciL4QmZdJwaYuKS0=;
 b=NtzwsLsf0n4iCfEXpT1jw3gCeWgpzLv+u0Dulzl7Loh59xbmF4SKppaxxljMLOeVXE
 f9jtsMQn0oPViNcg96F9aIT7vCNfLQKw9B8gNNJ3OYL8n6Xw5BLlHnhUlvmhDgi9zdZj
 AzP2DLO4gpCZvrI2hMQgnmmdnv/nkCA2KRUlokK4HzqVYrJXCC76P4fJd8iEgO31bxSD
 EjHO/dSHQBpu/p+sulSvB5tec8FsdZzLUlqA4k1xo40Hpzla/Pp7VdC5Co0kuqMUsgV+
 oShVgdMXf6tbSHGIZJ2neMaAB64qbgAaXHsvU2NCH7nuMJAD8TD2sF2JxHiFU4yDFBKi
 AJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HZGV+UnNspEYU91zMSEmgVnT3X3ciL4QmZdJwaYuKS0=;
 b=FNF0Mg3WeMmF55LAK9bJG8kvvqwdUUjGDlAX92hj2YQb21zaiGVm1UJA6GYXFyAMUG
 oq2miFBfY759h/vVfPw0U/rfI2/MjeZ6j3UPgRp2IYR2T0I1KEY609ktxc32OTwFV4G7
 xjxWJLec9nxbiFPUz9jtWHKxaNd7fyXbjuEvFV9nnJ0InwzszTEydrX9+1ZfQ/c7+GWK
 bx4uXraa4/ozVCjbVuk0Voi8g1oM6j1YbPMfRZBz+3mjS2y4NatFIM/1yPmYw6vnZ6uV
 3CNhPzHQuH4FAKVbU+XKxdDYDbHr9HLaC4Rr7N6ouSwP+BWCG0I0aFWqfNKRqtRIDYFW
 rZIg==
X-Gm-Message-State: ACgBeo3pM2nOLI6S1iF+65UtaqpDkf80J+p+WpuNy3FWyIhfrJ5g7SNJ
 fIMC3rzKodUI1Og9ACin01fwN8YrR14=
X-Google-Smtp-Source: AA6agR4mZQFBtHfA2XDl+n/Jgk5uF6kWBqWKNhuX7VrYV+agldPl/DrNeEgLF7lUwzD31ZfAKgNZQg==
X-Received: by 2002:a05:6402:14e:b0:443:f58:17e9 with SMTP id
 s14-20020a056402014e00b004430f5817e9mr1085097edu.106.1661208289938; 
 Mon, 22 Aug 2022 15:44:49 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-070-107.77.183.pool.telefonica.de. [77.183.70.107])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170906768400b0073d7b876621sm2455758ejm.205.2022.08.22.15.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:44:49 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 5/9] hw/isa/vt82c686: QOM'ify vt82c686b-usb-uhci creation
Date: Tue, 23 Aug 2022 00:43:51 +0200
Message-Id: <20220822224355.11753-6-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822224355.11753-1-shentey@gmail.com>
References: <20220822224355.11753-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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

Resolves duplicate code in the boards.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c   | 12 ++++++++++++
 hw/mips/fuloong2e.c |  3 ---
 hw/ppc/pegasos2.c   |  4 ----
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 37d9ed635d..c2f2e0039a 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -23,6 +23,7 @@
 #include "hw/intc/i8259.h"
 #include "hw/irq.h"
 #include "hw/dma/i8257.h"
+#include "hw/usb/hcd-uhci.h"
 #include "hw/timer/i8254.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "migration/vmstate.h"
@@ -546,6 +547,7 @@ struct ViaISAState {
     qemu_irq *isa_irqs;
     ViaSuperIOState via_sio;
     PCIIDEState ide;
+    UHCIState uhci[2];
 };
 
 static const VMStateDescription vmstate_via = {
@@ -563,6 +565,8 @@ static void via_isa_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "ide", &s->ide, "via-ide");
+    object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
+    object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
 }
 
 static const TypeInfo via_isa_info = {
@@ -625,6 +629,14 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
         return;
     }
     pci_ide_create_devs(PCI_DEVICE(&s->ide));
+
+    /* Functions 2-3: USB Ports */
+    for (i = 0; i < ARRAY_SIZE(s->uhci); ++i) {
+        qdev_prop_set_int32(DEVICE(&s->uhci[i]), "addr", d->devfn + 2 + i);
+        if (!qdev_realize(DEVICE(&s->uhci[i]), BUS(pci_bus), errp)) {
+            return;
+        }
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index dae263c1e3..c375107c53 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -205,9 +205,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
                                           TYPE_VT82C686B_ISA);
     qdev_connect_gpio_out(DEVICE(dev), 0, intc);
 
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
-
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
 
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 2f59d08ad1..a1b851638a 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -165,10 +165,6 @@ static void pegasos2_init(MachineState *machine)
     qdev_connect_gpio_out(DEVICE(dev), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
-    /* VT8231 function 2-3: USB Ports */
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci");
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci");
-
     /* VT8231 function 4: Power Management Controller */
     dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
-- 
2.37.2


