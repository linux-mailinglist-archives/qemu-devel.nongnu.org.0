Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E365EEEE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:39:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJT-00036L-D3; Thu, 05 Jan 2023 09:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJN-0002y4-KK; Thu, 05 Jan 2023 09:33:41 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJL-0006xI-HU; Thu, 05 Jan 2023 09:33:41 -0500
Received: by mail-wr1-x432.google.com with SMTP id az7so11916972wrb.5;
 Thu, 05 Jan 2023 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKI3pQf10L0CafJmgzqflOFdUTw3VE2jrgkDejTMPzM=;
 b=qYZglaoFBTEGeTXWzO3UWijT1wgZm8+ecWnl3Vz9o4HAIqmTTsus1Km/cnzgZ5G5WL
 BlYZAJhz4mQDN17JHQI9qZmkKVgV9g+IyORhRCOzAK4VLl29bdwRCmtOggT4H+jQeYLd
 d+j0ELH0f6p5GZM32cyNuU6Yl0Q53eq9c49kQ4xZ6QsCJNvtjPelwchcV8ljNacV2Y1I
 IdZRVT65152ioMiUU9LHK43y3X7S4+QckjcnANMdgPDUCzzQIbWovmoRoNxEDxLSrFWe
 zVrjduJBxEVDdED+RE/b9zCCKZIDMYt09TV7hELxuAczwky6ijh64QUQAGIlf9kB4lsA
 GoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OKI3pQf10L0CafJmgzqflOFdUTw3VE2jrgkDejTMPzM=;
 b=OQD2Vn9JOHTxcVCHe0ggypEt1opvt6FhlcoGOSGMBO9XmbkAMp4cmj8nrFnRtdbkAw
 4pr1MFce1zBpJqtLys0bXwXIISVJW/w/f5+K84/O98Nw6ZEC9Jmw5aE4i5hHwU3GSTi3
 Y8G2vFhkaFVqFmeCeCz1PzMgzdMWCVxJqwtHIqytuUR5wQszx4e/eR62USDYdHuaiJ6n
 Eh74ymSIcD5TqyYgXX4m7eX81qtkFkRmOzU03sU+zOtQ9E0HVxi13OrA5jJHiNFgUMMW
 LCTOB2DK1T4y8pjfXAAWLvebBmKSJ60a0d9EwRH/EqNBWEq4qIrg57YixntWnlRzhCsq
 49VA==
X-Gm-Message-State: AFqh2kpF12u3goK3vuZ7LFs0F0HivrkicT6S+EP9VUhU3/YCLdrtKhRy
 tV1JCtMHVIZmqJxFUdY/wFVpN3O/z84AHA==
X-Google-Smtp-Source: AMrXdXt79fSEj6PcRyg5CT8XgGHuCLPioHmO1m7r0Y/JgVmELLv/yX7HeGE7L/RlgWKzdqA4dGrZAw==
X-Received: by 2002:adf:e383:0:b0:242:69f4:cb6f with SMTP id
 e3-20020adfe383000000b0024269f4cb6fmr32241422wrm.32.1672929218280; 
 Thu, 05 Jan 2023 06:33:38 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:37 -0800 (PST)
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
Subject: [PATCH v5 28/31] hw/isa/piix: Reuse PIIX3 base class' realize method
 in PIIX4
Date: Thu,  5 Jan 2023 15:32:25 +0100
Message-Id: <20230105143228.244965-29-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x432.google.com
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

Resolves duplicate code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-39-shentey@gmail.com>
---
 hw/isa/piix.c | 65 +++++++--------------------------------------------
 1 file changed, 9 insertions(+), 56 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index d8cd80e859..0132f6e70a 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -331,7 +331,8 @@ static const MemoryRegionOps rcr_ops = {
     },
 };
 
-static void pci_piix3_realize(PCIDevice *dev, Error **errp)
+static void pci_piix_realize(PCIDevice *dev, const char *uhci_type,
+                             Error **errp)
 {
     PIIXState *d = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
@@ -371,8 +372,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 
     /* USB */
     if (d->has_usb) {
-        object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
-                                TYPE_PIIX3_USB_UHCI);
+        object_initialize_child(OBJECT(dev), "uhci", &d->uhci, uhci_type);
         qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
         if (!qdev_realize(DEVICE(&d->uhci), BUS(pci_bus), errp)) {
             return;
@@ -477,7 +477,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix3_realize(dev, errp);
+    pci_piix_realize(dev, TYPE_PIIX3_USB_UHCI, errp);
     if (*errp) {
         return;
     }
@@ -506,7 +506,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix3_realize(dev, errp);
+    pci_piix_realize(dev, TYPE_PIIX3_USB_UHCI, errp);
     if (*errp) {
         return;
     }
@@ -536,71 +536,24 @@ static const TypeInfo piix3_xen_info = {
 
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
+    ERRP_GUARD();
     PIIXState *s = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
-    isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
-                          pci_address_space_io(dev), errp);
-    if (!isa_bus) {
-        return;
-    }
-
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "piix-reset-control", 1);
-    memory_region_add_subregion_overlap(pci_address_space_io(dev),
-                                        PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-
-    /* initialize i8259 pic */
-    if (!qdev_realize(DEVICE(&s->pic), NULL, errp)) {
+    pci_piix_realize(dev, TYPE_PIIX4_USB_UHCI, errp);
+    if (*errp) {
         return;
     }
 
-    /* initialize ISA irqs */
-    isa_bus_irqs(isa_bus, s->pic.in_irqs);
+    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
 
     /* initialize pit */
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
 
-    /* DMA */
-    i8257_dma_init(isa_bus, 0);
-
     /* RTC */
-    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
-    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
-        return;
-    }
     s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
-    /* IDE */
-    qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
-    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
-        return;
-    }
-
-    /* USB */
-    if (s->has_usb) {
-        object_initialize_child(OBJECT(dev), "uhci", &s->uhci,
-                                TYPE_PIIX4_USB_UHCI);
-        qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
-        if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
-            return;
-        }
-    }
-
-    /* ACPI controller */
-    if (s->has_acpi) {
-        object_initialize_child(OBJECT(s), "pm", &s->pm, TYPE_PIIX4_PM);
-        qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
-        qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", s->smb_io_base);
-        qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", s->smm_enabled);
-        if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
-            return;
-        }
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0,
-                              qdev_get_gpio_in(DEVICE(&s->pic), 9));
-    }
-
     pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
 }
 
-- 
2.39.0


