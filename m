Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EBF69376F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:48:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBid-0005kR-Df; Sun, 12 Feb 2023 07:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdR-0007ns-4d; Sun, 12 Feb 2023 07:39:14 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdP-0001Rn-3F; Sun, 12 Feb 2023 07:39:12 -0500
Received: by mail-ej1-x62c.google.com with SMTP id dr8so25791509ejc.12;
 Sun, 12 Feb 2023 04:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKHxfsSOC/ud+L3jJYiuojfRL0tZNOirfkLuZ64oom8=;
 b=GoBdj8XZNeYbbRsSC1Yq/LZKNxrUdK1IdA8NwDnmlmuAROxi/0C3ev4gSQ1Seh1xjd
 +v60W6ZJQp81ST8SYnXWFpwsiRAXlk2CukihsInktAdT+jcyVzrtuOBhz2kPySeKnuMY
 4fG0xvRCY1CKWrTSamfH+jqwXw8Qk05AIvXJIksAzkiHq9YvsjzsI19BmhTOIumaXVbT
 w9sSfgmMtL9bBVZ60TmLL0r5f+BKWwHL19QAUaMCwBS2a8F/WirLPky/2HTHBiMQ/C89
 uW2w+v06vASblh/ScyERRe8GrMTiSx1rKbBTvGFTLx2Qkxsp6XdN00mF1ZFkRoIP2pzp
 4rJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gKHxfsSOC/ud+L3jJYiuojfRL0tZNOirfkLuZ64oom8=;
 b=xjHOe+xDiXKdDDLflf8XU2H2ffYK6w0fvUyBUzlwUmWTgDNq9wbL0suEnk/j8qVYWJ
 +h7DfyaJSecMlfCcqNJw4SfqKCeIz+tU6uImUQx4WAYEw1NPkFTmKsdP3aEjnyAe51Kw
 d8kkOSHBR8TqyVib/y3G7pyIn1nv+p1h5uRmu2OYTcSwHWkLWfHQ/WDcvMgF8qQbknuA
 RVgJ77Ebf81NIKcXO1AFBH40O4dDSmiADeuAuAgpPZjv1y5PW8SOOnWWahNU/JkyZWYX
 WEtSHLNHeqZbfP0vA6b/XBcnDE6O4ZX//iR+xWBGZRtBpqepiZOclCW6BfgAjyRu+UdM
 dtwQ==
X-Gm-Message-State: AO0yUKX5QSOeKN66FEzvEE8CmInRfNK6QILk6JnlJkQ/bRo9gFmx0mhJ
 jiiC0wuKO/Go31wdvVr3hOeBpJkGj2U=
X-Google-Smtp-Source: AK7set/uinEp9v57kmznMemXWVkadNjwIa9/zMiuPMwSp1+GNpmhi32obaXFIMyXJ0BuYAZtwwZSHQ==
X-Received: by 2002:a17:906:1c93:b0:8ae:f487:623d with SMTP id
 g19-20020a1709061c9300b008aef487623dmr13488222ejh.69.1676205548438; 
 Sun, 12 Feb 2023 04:39:08 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:39:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 20/23] hw/isa/piix: Reuse PIIX3 base class' realize method
 in PIIX4
Date: Sun, 12 Feb 2023 13:38:02 +0100
Message-Id: <20230212123805.30799-21-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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
 hw/isa/piix.c | 78 ++++++++++++++++-----------------------------------
 1 file changed, 24 insertions(+), 54 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 4b48fe6023..0177be6d6f 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -332,17 +332,11 @@ static const MemoryRegionOps rcr_ops = {
     },
 };
 
-static void pci_piix3_realize(PCIDevice *dev, Error **errp)
+static void pci_piix_realize(PCIDevice *dev, const char *uhci_type,
+                             ISABus *isa_bus, Error **errp)
 {
     PIIXState *d = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
-    ISABus *isa_bus;
-
-    isa_bus = isa_bus_new(DEVICE(d), pci_address_space(dev),
-                          pci_address_space_io(dev), errp);
-    if (!isa_bus) {
-        return;
-    }
 
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
                           "piix-reset-control", 1);
@@ -367,8 +361,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 
     /* USB */
     if (d->has_usb) {
-        object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
-                                TYPE_PIIX3_USB_UHCI);
+        object_initialize_child(OBJECT(dev), "uhci", &d->uhci, uhci_type);
         qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
         if (!qdev_realize(DEVICE(&d->uhci), BUS(pci_bus), errp)) {
             return;
@@ -467,8 +460,15 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     ERRP_GUARD();
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
+    ISABus *isa_bus;
+
+    isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
+                          pci_address_space_io(dev), errp);
+    if (!isa_bus) {
+        return;
+    }
 
-    pci_piix3_realize(dev, errp);
+    pci_piix_realize(dev, TYPE_PIIX3_USB_UHCI, isa_bus, errp);
     if (*errp) {
         return;
     }
@@ -496,8 +496,15 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
     ERRP_GUARD();
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
+    ISABus *isa_bus;
 
-    pci_piix3_realize(dev, errp);
+    isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
+                          pci_address_space_io(dev), errp);
+    if (!isa_bus) {
+        return;
+    }
+
+    pci_piix_realize(dev, TYPE_PIIX3_USB_UHCI, isa_bus, errp);
     if (*errp) {
         return;
     }
@@ -533,6 +540,7 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
 
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
+    ERRP_GUARD();
     PIIXState *s = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
@@ -544,59 +552,21 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "piix-reset-control", 1);
-    memory_region_add_subregion_overlap(pci_address_space_io(dev),
-                                        PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-
     /* initialize i8259 pic */
     i8259_out_irq = qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
     s->pic = i8259_init(isa_bus, *i8259_out_irq);
 
-    /* initialize ISA irqs */
-    isa_bus_irqs(isa_bus, s->pic);
+    pci_piix_realize(dev, TYPE_PIIX4_USB_UHCI, isa_bus, errp);
+    if (*errp) {
+        return;
+    }
 
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
     s->rtc.irq = s->pic[s->rtc.isairq];
 
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
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->pic[9]);
-    }
-
     pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
 }
 
-- 
2.39.1


