Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24016641F12
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLG-00024e-4f; Sun, 04 Dec 2022 14:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLC-000233-Dx; Sun, 04 Dec 2022 14:07:54 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKz-0001bf-Af; Sun, 04 Dec 2022 14:07:54 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ml11so23089060ejb.6;
 Sun, 04 Dec 2022 11:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3T47yIEIUMDvXF7x3Vl6rwvnsSBRqCjaJ2oEC6lUes=;
 b=AZH4Rax+tSQ2cPSzsoxliAQrTytzAg3YZrPpoHKOfBDt+pqpC5JWPJ4P6mc1G0mpOn
 P6OUP040bLaLsoAe+mMoR/rwccd8KMxctETVg5TdZcSVzTp02eAVW9C0cB4trFtDzbQc
 BpQ/glsx+WamVcEEd7ih3nLJEWQCe0bneX9a7MRXf1yXtsFhkEMZKiKwJMflfz4rGKyQ
 xoL/WK78Gxw/q7kxkLcE/G0paF7H56AEf2nt++z1gWo3yifjAk0a+L5+PZU2TVhO0BNc
 ClqUuMaUrDZixlaPAkuKtn8Lluqg/jpwSJLBuHcNBf87B1PBer9NeaxkmwOcZI7H+OuD
 lY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3T47yIEIUMDvXF7x3Vl6rwvnsSBRqCjaJ2oEC6lUes=;
 b=Reoc0MzcIPduxCuSm3pUSj3Ht6TH5cC11QYbPebOIsOAxHr2197rOlUf/ezLssJJoz
 tzWePB3It5q9UdNEQndCqwAkpZivD/JZvEHcUN54777BKM5xiWNJAEvUW+w3YTEWVkIm
 rFXiSAw/jA90r4VNrmSGqGD6ltW/CU47gAfWv753LZEWSLqqjwb0NLYCtk/NN1e9dKjK
 ucUv0wZdVaZurLC/XjUbpseUdNUC+WHHGBIe6HEGw75+r8O5NuGFoB9gXbMHFkMgZzd5
 xoGZfp/LVJD1905AFYGjj83AWrO0iU87GY6bAmTmL5bhenfQpyYhbcEhYzBBrVsgsrVq
 DIzA==
X-Gm-Message-State: ANoB5pl6XLrbVRton5UoYIY5JB7gyrk4IFnW0JdilHZZamckx+m0vCsy
 Ja6a2W7t33Wy4DXHhN30/0lwxZr/vpU=
X-Google-Smtp-Source: AA0mqf4Qn0j8GFcoQBb5a2dSGsnl9vzjPKexvX9eJN3kzrpwNXITr4vx4krIr/voQp/dDkkhWMSydQ==
X-Received: by 2002:a17:907:a50a:b0:7c0:7902:885f with SMTP id
 vr10-20020a170907a50a00b007c07902885fmr8248190ejc.233.1670180859804; 
 Sun, 04 Dec 2022 11:07:39 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:39 -0800 (PST)
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
Subject: [PATCH 12/32] hw/isa/piix3: Create Proxy PIC in host device
Date: Sun,  4 Dec 2022 20:05:33 +0100
Message-Id: <20221204190553.3274-13-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

Use the newly introduced TYPE_PROXY_PIC which allows for wiring
up devices in the southbridge where the virtualization technology used
(KVM, TCG, Xen) is not yet known.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-16-shentey@gmail.com>
---
 hw/i386/Kconfig               |  1 +
 hw/i386/pc_piix.c             | 15 +++++++++------
 hw/isa/Kconfig                |  1 +
 hw/isa/piix3.c                | 10 +++++++++-
 include/hw/southbridge/piix.h |  4 ++--
 5 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d22ac4a4b9..79f5925dbe 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -72,6 +72,7 @@ config I440FX
     select PC_PCI
     select PC_ACPI
     select ACPI_SMBUS
+    select I8259
     select PCI_I440FX
     select PIIX3
     select IDE_PIIX
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c96d989636..f81e91220f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -207,10 +207,11 @@ static void pc_init1(MachineState *machine,
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
 
     if (pcmc->pci_enabled) {
-        PIIX3State *piix3;
+        DeviceState *dev;
         PCIDevice *pci_dev;
         const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
                                          : TYPE_PIIX3_DEVICE;
+        int i;
 
         pci_bus = i440fx_init(pci_type,
                               i440fx_host,
@@ -231,10 +232,12 @@ static void pc_init1(MachineState *machine,
                                  x86_machine_is_smm_enabled(x86ms),
                                  &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
-        piix3->pic = x86ms->gsi;
-        piix3_devfn = piix3->dev.devfn;
-        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
+        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
+        for (i = 0; i < ISA_NUM_IRQS; i++) {
+            qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
+        }
+        piix3_devfn = pci_dev->devfn;
+        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
                                                              "rtc"));
         piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
@@ -243,6 +246,7 @@ static void pc_init1(MachineState *machine,
         piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+        isa_bus_irqs(isa_bus, x86ms->gsi);
 
         rtc_state = isa_new(TYPE_MC146818_RTC);
         qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
@@ -251,7 +255,6 @@ static void pc_init1(MachineState *machine,
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
-    isa_bus_irqs(isa_bus, x86ms->gsi);
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 6c154d88c7..b4ad1fb66e 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -37,6 +37,7 @@ config PIIX3
     select I8257
     select ISA_BUS
     select MC146818RTC
+    select PROXY_PIC
     select USB_UHCI
 
 config PIIX4
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index cb2d9285ae..199cbf1e14 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -39,7 +39,7 @@
 
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
-    qemu_set_irq(piix3->pic[pic_irq],
+    qemu_set_irq(piix3->pic.in_irqs[pic_irq],
                  !!(piix3->pic_levels &
                     (((1ULL << PIIX_NUM_PIRQS) - 1) <<
                      (pic_irq * PIIX_NUM_PIRQS))));
@@ -308,6 +308,13 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
+    /* PIC */
+    if (!qdev_realize(DEVICE(&d->pic), NULL, errp)) {
+        return;
+    }
+
+    isa_bus_irqs(isa_bus, d->pic.in_irqs);
+
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
                           "piix3-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
@@ -371,6 +378,7 @@ static void pci_piix3_init(Object *obj)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(obj);
 
+    object_initialize_child(obj, "pic", &d->pic, TYPE_PROXY_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
 }
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 1c291cc954..7b1b4625a3 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
+#include "hw/core/proxy-pic.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
 
@@ -50,11 +51,10 @@ struct PIIXState {
 #endif
     uint64_t pic_levels;
 
-    qemu_irq *pic;
-
     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
+    ProxyPICState pic;
     RTCState rtc;
     UHCIState uhci;
     PIIX4PMState pm;
-- 
2.38.1


