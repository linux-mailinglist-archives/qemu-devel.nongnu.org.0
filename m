Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8EF5A9D8F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:55:13 +0200 (CEST)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnTE-0000ph-8e
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2T-0002QT-O8
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:34 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2P-0001Z8-DL
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:32 -0400
Received: by mail-ej1-x62f.google.com with SMTP id nc14so30900222ejc.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HzrQWtSAwlp+S9qVoXjmvjfRbi8mzDnTXp4Tg8p4Ky0=;
 b=EfcGc/bg+axUAZqy+5eqzeOO3QiJr1z/mW/aZeH03jR5yAODd3pEBroa/i1RmQ1byH
 +xqxxaquk78cmcPrwjlKyEwtdDLCECVOH5usDXPKBVoIC4VBA5AdboS0sng69uXiJvOQ
 TzmB8kF7E8sO3/WuHd+MIDYsKy2IcKt7V2CCbRoje7cBBSdMgVeDrZN/ONcUCr8G+LBS
 PGmzoIUG/XP9og1RMN00USPeHYNU/aud5vlLyW2GuRevF/jaDtXSGKvoMEGP0pkQ70km
 9NaqZH3kMDD1obMLXtc/+jJxLyVuRvBN924TOJKBIy9z4LZY1rwcN9dzfurQ11nuUSyU
 JgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HzrQWtSAwlp+S9qVoXjmvjfRbi8mzDnTXp4Tg8p4Ky0=;
 b=pBhoDeM+noC6RBPtxAv3DNqgB4aFCtUGTDRFb1p71xUZHFM1rHEcVS4i19zQOouu3U
 TSJbSZH7YHQ5Rlk8ag72E7LxjmNmc1mPsqZ8IhWMmnSC5mtJcNgo8VYbKyYIvFpg54Bi
 79Oy4vA5Z99uBbm0+9m6tILG/ddPjBEAIXD039s5X+qKRQqiVqtBv7Fx5frnPtDcwibS
 RH2/5KMuRsjToreWpk5+F3XqUuQHtWCJQQj2DEKGz4IHsuUOAwPeG0ufacg7+DqbkHuY
 jU+A9FSxJcP1diedXWqHnd979Nw2JbRYVvcGw5rNGoPOLTljo0mkSM0On7AcDKTvbIis
 28yQ==
X-Gm-Message-State: ACgBeo1ZODrkysLS74mex/lmzLXx+N5ttZp1USxwywHbGlMyVgaEfOGs
 hUIoR+pDDgefptNfPkNbaHpI8s8ZQO0=
X-Google-Smtp-Source: AA6agR7KAbAIZYgshVgKFOiAiteyZUThk8dGgTakYcleRFM2UPzaNRcbEfqoWxasksCtamhAriv8OQ==
X-Received: by 2002:a17:907:8a14:b0:731:2198:627b with SMTP id
 sc20-20020a1709078a1400b007312198627bmr24515600ejc.635.1662049647397; 
 Thu, 01 Sep 2022 09:27:27 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:27 -0700 (PDT)
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
Subject: [PATCH 36/42] hw/isa/piix: Reuse PIIX3 base class' realize method in
 PIIX4
Date: Thu,  1 Sep 2022 18:26:07 +0200
Message-Id: <20220901162613.6939-37-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

Resolves duplicate code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 65 +++++++--------------------------------------------
 1 file changed, 9 insertions(+), 56 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index ba7b5d953f..af6d920eff 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -367,7 +367,8 @@ static const MemoryRegionOps rcr_ops = {
     },
 };
 
-static void pci_piix3_realize(PCIDevice *dev, Error **errp)
+static void pci_piix_realize(PCIDevice *dev, const char *uhci_type,
+                             Error **errp)
 {
     PIIXState *d = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
@@ -407,8 +408,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 
     /* USB */
     if (d->has_usb) {
-        object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
-                                "piix3-usb-uhci");
+        object_initialize_child(OBJECT(dev), "uhci", &d->uhci, uhci_type);
         qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
         if (!qdev_realize(DEVICE(&d->uhci), BUS(pci_bus), errp)) {
             return;
@@ -506,7 +506,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix3_realize(dev, errp);
+    pci_piix_realize(dev, "piix3-usb-uhci", errp);
     if (*errp) {
         return;
     }
@@ -536,7 +536,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix3_realize(dev, errp);
+    pci_piix_realize(dev, "piix3-usb-uhci", errp);
     if (*errp) {
         return;
     }
@@ -567,71 +567,24 @@ static const TypeInfo piix3_xen_info = {
 
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
-    if (!qdev_realize(DEVICE(&s->pic), BUS(isa_bus), errp)) {
+    pci_piix_realize(dev, "piix4-usb-uhci", errp);
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
-                                "piix4-usb-uhci");
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
     pci_bus_irqs(pci_bus, piix4_set_irq, piix4_pci_slot_get_pirq, s,
                  PIIX_NUM_PIRQS);
 }
-- 
2.37.3


