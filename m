Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E0C379E60
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:24:36 +0200 (CEST)
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJwh-00010n-Qe
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJre-0008BT-BW; Tue, 11 May 2021 00:19:22 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrc-0000ki-MD; Tue, 11 May 2021 00:19:22 -0400
Received: by mail-ej1-x636.google.com with SMTP id a4so27744152ejk.1;
 Mon, 10 May 2021 21:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9KXY+rSnFHdghr1cU4rScJTvInhkNqH47h5SdvllRlA=;
 b=EpDEOGYhd50hrCIRqa1lkP0tf923p+Hq+9kZcCApmCpeFjvapzhdztwVijzvEewlOa
 KrzEdN0yzRk/QXeHUc7XSn6ukZWpEgOV/2KMyI6BeZdlMuSazMwnf+icX8vGRLzEyESB
 o5fxHO8lKC9B/NCZCeDVqkvs320skSPu0Khk3yBilMlovLpp+BdsgWPPpJ6YDRZBDy4Z
 H4ZsrgmGXc0sLfSk7t5wZuIqn/6cj1zB+2VOB2J+1w30UKb91VFjsF389e90F6TncuJr
 uzyX4fCEFKjuu6BgT/Sq/odjvoROuO2kLmL2Lb30AQvrG+iVDul2mrch4qtu4HUcujzi
 SzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9KXY+rSnFHdghr1cU4rScJTvInhkNqH47h5SdvllRlA=;
 b=pdJ+KU6ASpMgct/Ru+XS5cql6J/82xjojBHHBMvo5cLPai8zmhPSo69d5FZV1r5i2M
 thJi3ct66Wl0G8cWLoksV43Ly/1M6qkHMji6Ssx7JXFwqyCHwpxC93ASuNrNGL7iSRUF
 ACD/lsNnfzW6Ktk1kmu0HQwGfGEH/QSIA7CaKUUfj2FDsyhNzy2crFk48/Ryz0P0skjM
 VwnqaeLTH6bddSgK5Ai0LvY+SrcaTy0O4OHzlzD2dzwiVRnuqKbJ/JvgXEOmJlO8TM/A
 VamYdadFKdApF8NXCnhoug4eR8dignK7gDk/KFIxiUMzgwSrIBeHnHgYQ62f3PF9mjZm
 B3sQ==
X-Gm-Message-State: AOAM531L12946u/iwHPjARPlQW50lPirL9IhRI61+kD21FVyNpH6dS8O
 gIDwcvH+26dywtSv09Kr4BwOO/GfmW/TWA==
X-Google-Smtp-Source: ABdhPJw8ho81RakrRar8zcDDGvV9u/KIYjxdBHg2f/a+zVj+nfdCg6pDLBcKrI5VKOHh0sFVzod/4A==
X-Received: by 2002:a17:907:10c6:: with SMTP id
 rv6mr28920397ejb.526.1620706758695; 
 Mon, 10 May 2021 21:19:18 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id kx3sm10552169ejc.44.2021.05.10.21.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:19:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] hw/ide/via: Connect IDE function output IRQs to the
 ISA function input
Date: Tue, 11 May 2021 06:18:47 +0200
Message-Id: <20210511041848.2743312-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511041848.2743312-1-f4bug@amsat.org>
References: <20210511041848.2743312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To avoid abusing isa_get_irq(NULL) using a hidden ISA bridge
under the hood, let the IDE function expose 2 output IRQs,
and connect them to the ISA function inputs when creating
the south bridge chipset model in vt82c686b_southbridge_init.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/via.c        | 19 +++++++++++++++++--
 hw/mips/fuloong2e.c |  9 ++++++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 6c667a92130..7887bf181e6 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -33,6 +33,17 @@
 #include "hw/ide/pci.h"
 #include "trace.h"
 
+#define TYPE_VIA_IDE "via-ide"
+OBJECT_DECLARE_SIMPLE_TYPE(VIAIDEState, VIA_IDE)
+
+struct VIAIDEState {
+    /* <private> */
+    PCIIDEState parent_obj;
+    /* <public> */
+
+    qemu_irq irq[2];
+};
+
 static uint64_t bmdma_read(void *opaque, hwaddr addr,
                            unsigned size)
 {
@@ -105,6 +116,7 @@ static void bmdma_setup_bar(PCIIDEState *d)
 static void via_ide_set_irq(void *opaque, int n, int level)
 {
     PCIDevice *d = PCI_DEVICE(opaque);
+    VIAIDEState *s = VIA_IDE(d);
 
     if (level) {
         d->config[0x70 + n * 8] |= 0x80;
@@ -112,7 +124,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
         d->config[0x70 + n * 8] &= ~0x80;
     }
 
-    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
+    qemu_set_irq(s->irq[n], level);
 }
 
 static void via_ide_reset(DeviceState *dev)
@@ -159,6 +171,7 @@ static void via_ide_reset(DeviceState *dev)
 
 static void via_ide_realize(PCIDevice *dev, Error **errp)
 {
+    VIAIDEState *s = VIA_IDE(dev);
     PCIIDEState *d = PCI_IDE(dev);
     DeviceState *ds = DEVICE(dev);
     uint8_t *pci_conf = dev->config;
@@ -188,6 +201,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     bmdma_setup_bar(d);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
 
+    qdev_init_gpio_out_named(ds, s->irq, "ide-irq", ARRAY_SIZE(s->irq));
     qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));
     for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, MAX_IDE_DEVS);
@@ -227,8 +241,9 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_ide_info = {
-    .name          = "via-ide",
+    .name          = TYPE_VIA_IDE,
     .parent        = TYPE_PCI_IDE,
+    .instance_size = sizeof(VIAIDEState),
     .class_init    = via_ide_class_init,
 };
 
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 3e7a7e4389d..17b5e41cc7d 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -201,12 +201,19 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
                                        I2CBus **i2c_bus)
 {
     PCIDevice *dev;
+    DeviceState *isa;
 
     dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
-    qdev_connect_gpio_out_named(DEVICE(dev), "intr", 0, intc);
+    isa = DEVICE(dev);
+    qdev_connect_gpio_out_named(isa, "intr", 0, intc);
 
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
+    for (unsigned i = 0; i < 2; i++) {
+        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", i,
+                                    qdev_get_gpio_in_named(isa,
+                                                           "isa-irq", 14 + i));
+    }
     pci_ide_create_devs(dev);
 
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
-- 
2.26.3


