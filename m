Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3352E85E1
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:14:16 +0100 (CET)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTcd-0006cC-6S
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTaz-0004HG-18; Fri, 01 Jan 2021 18:12:33 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTaw-0001tn-7R; Fri, 01 Jan 2021 18:12:31 -0500
Received: by mail-wm1-x32c.google.com with SMTP id e25so10492549wme.0;
 Fri, 01 Jan 2021 15:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPknC029CfavJowHtwOqnsemwysUTgbwL3GrNj5GZCc=;
 b=U6F8DnS5IBogNbJNUYE37Kq3jPFEFoQO8TVo75+2KJZnImnxETNU/i9I4+afpspRiY
 KckjcLJtsAdgTob969t1uaQVIo9Dj+Kc2b0fjX+kduPbKGLHqTUK3CPR4R0HvD7AoraA
 iko38/NM8LFE2KcMvDForW60eM+L7cog0XF4gMoTTk21xAqi9DMHEUtmjYh+4mEO38rK
 eW2IN/G7gByB4FXFsga8KM3E8KKQTakP8icFAsJ5VrvfUz3NLnx+uOUcXcvL+VMlq5kg
 JEqyIC91rkxN6NsVDJrdJE/Dm9KJNfKlfaM9G2xiyqkBMcfGNUWNK/phHUssPkLN4NCH
 h/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pPknC029CfavJowHtwOqnsemwysUTgbwL3GrNj5GZCc=;
 b=X2/qGLNDYuQib3HT632aQ5ibtZeUjeWIh4fs7N1bFpN3+iwAPGeMgdGS4+dmuLREMy
 37+RVxgvZKN8Yj3F8hsojL7cRa8ZjfG7UYeP93MPvLMTdNaboKd1RaUvKT/2uRMtP1yP
 PTaX9DZgVxbs1ajtYjuEkAZVSBctGmqWm/nP0dbnxlxUQ9d4NG3XIrW8P5gt0r4fVL13
 vOWJGUKgzfsrTwHfhT+gLQxevyyNHS+Diz3TD4DFVGRb9WYaYsMnEYETF8QFwuJ0zJGc
 dNyz05HKHPwHGTxq+8AQ6mrNOnC2ukY+8Z5xlY8YFvYAyQNTiJZ+dxgFzi6JackQ4o7L
 7lhQ==
X-Gm-Message-State: AOAM533JqMTyjdOUkA4KU3Hm9gOHFJfnQTEqWdWoziUHuyiJ9bzx8qmJ
 45RkzBrejV0AbLY+1ZWXQDhaGfwVSL4=
X-Google-Smtp-Source: ABdhPJxp5l1KvDxEAAUhLV3oVUkL3YoMIrfWmnxy6fVtdE09xyZ4RX4gal0NtFUCma98vOCQQBUrIA==
X-Received: by 2002:a7b:c24d:: with SMTP id b13mr17101502wmj.151.1609542748418; 
 Fri, 01 Jan 2021 15:12:28 -0800 (PST)
Received: from x1w.redhat.com (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id g78sm18705835wme.33.2021.01.01.15.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 15:12:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/5] via-ide: Fix fuloong2e support
Date: Sat,  2 Jan 2021 00:12:12 +0100
Message-Id: <20210101231215.1870611-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210101231215.1870611-1-f4bug@amsat.org>
References: <20210101231215.1870611-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guenter Roeck <linux@roeck-us.net>

The IDE legacy mode emulation has been removed in commit 4ea98d317eb
("ide/via: Implement and use native PCI IDE mode") but some Linux
kernels (probably including def_config) require legacy mode on the
Fuloong2e so only emulating native mode did not turn out feasible.
Add property to via-ide model to make the mode configurable, and set
legacy mode for Fuloong2e.

[balaton: Use bit in flags for property, add comment for missing BAR4]

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <17a50e58e6baa26440c7dac83f07fdbba1595439.1609191252.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/via.c        | 19 +++++++++++++++++--
 hw/mips/fuloong2e.c |  4 +++-
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index be09912b334..2d935b910f8 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -26,6 +26,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
@@ -185,12 +186,19 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
                           &d->bus[1], "via-ide1-cmd", 4);
     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
 
-    bmdma_setup_bar(d);
-    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+    if (!(d->flags & BIT(PCI_IDE_LEGACY_MODE))) {
+        /* Missing BAR4 will make Linux driver fall back to legacy PIO mode */
+        bmdma_setup_bar(d);
+        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+    }
 
     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
+        if (d->flags & BIT(PCI_IDE_LEGACY_MODE)) {
+            ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0,
+                            i ? 0x376 : 0x3f6);
+        }
         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
@@ -210,6 +218,12 @@ static void via_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static Property via_ide_properties[] = {
+    DEFINE_PROP_BIT("legacy-mode", PCIIDEState, flags, PCI_IDE_LEGACY_MODE,
+                    false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void via_ide_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -223,6 +237,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_VIA_IDE;
     k->revision = 0x06;
     k->class_id = PCI_CLASS_STORAGE_IDE;
+    device_class_set_props(dc, via_ide_properties);
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 45c596f4fe5..d334fde389f 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -253,7 +253,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     /* Super I/O */
     isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
+    dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
+    qdev_prop_set_bit(&dev->qdev, "legacy-mode", true);
+    pci_realize_and_unref(dev, pci_bus, &error_fatal);
     pci_ide_create_devs(dev);
 
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
-- 
2.26.2


