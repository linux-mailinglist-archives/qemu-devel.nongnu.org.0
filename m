Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E235A9D43
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:40:32 +0200 (CEST)
Received: from localhost ([::1]:48898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnF1-00031w-1h
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1u-0001f6-Du
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:58 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1s-0001UW-J9
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:58 -0400
Received: by mail-ej1-x62b.google.com with SMTP id u9so35837892ejy.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2JQF2PriVkCcCHZKUuvvLMa6gjcPvEwC17Lqi8O9ljE=;
 b=hYplaFoInKnVZycPeCUOMuIVY5z7H7RtGwySsoJ4eWbXbwirHo+KuwU8Tf9Ou/rgzR
 qjTLw3LbewWPtp96sV+8oRkVKnyHpS+Gb0YSpC/9kPwYS8e6v13nx77oHRymRg8FSjxv
 5+RD3bvA0t0bZ/f2po7Ka8xoTo9FJ9aKU4SjI8NIAsylukD5wCu//BNXblCPfIMgn11h
 2VdZ+LKhpkirwwiv/9fENwTzNvhrMNwZO7q6F8s2V9u6FYqUYkr5K3AE9OFBMbjPG+nd
 a/7kGxzvI/WPATdv7JAfpWD64nzT1Hf+NMUtxPDJiiBkIM+vu6CNYQxNXTldODJPIK+b
 vEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2JQF2PriVkCcCHZKUuvvLMa6gjcPvEwC17Lqi8O9ljE=;
 b=criUn2dInGDvXp81ue7t7+NSpTIuo4iwOlNXPLsGCCDagmWhT1cy1LHSg37Lcy8TZ/
 bb4RySBOoD/CxcfMbmzZEonAikv3n7uKfQjlDd/sMCicRMz0rEDgX5Qr+hIXSz++gx1f
 ABoay0DFMu6if8voA8OutkNR6liVxQZRPuEelvEF2t+nRsPzFIDHkqtBZchAHXQg6X3A
 CqSChDBEr9dN8QuZtlOrHOUqGQ3rW0t4Zp9M1bs/mk2/HXiaVcVaBqhUzkIXepwq9Kpt
 ijHwrBzGbvXWIO5K9OvPOZVm6Kg/zzzMTXeQueqTDJeI4bfwZyXXnLoPcwrN/lE+fb8H
 8doA==
X-Gm-Message-State: ACgBeo2GAeTQiZYlGpwolb1suhwupAbT/iG8lGf7Jy8Pc/7D4QbH+jkS
 +KlISTW/56HINq1zQZTNjtZul03HuXQ=
X-Google-Smtp-Source: AA6agR4esty8JI7kWpLbFDWcUllyX5AmnD/4YNE4AtuQbPTpn81LR2GQTXz76vTFdlKStrm5G4yK1A==
X-Received: by 2002:a17:907:7dac:b0:739:8df9:3c16 with SMTP id
 oz44-20020a1709077dac00b007398df93c16mr23970005ejc.9.1662049615085; 
 Thu, 01 Sep 2022 09:26:55 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:54 -0700 (PDT)
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
Subject: [PATCH 08/42] hw/isa/piix3: Create ISA PIC in host device
Date: Thu,  1 Sep 2022 18:25:39 +0200
Message-Id: <20220901162613.6939-9-shentey@gmail.com>
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

Use the newly introduced i8259 proxy "isa-pic" which allows for wiring
up devices in the southbridge where the virtualization technology used
(KVM, TCG, Xen) is not yet known.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             | 15 +++++++++------
 hw/isa/Kconfig                |  1 +
 hw/isa/piix3.c                | 10 +++++++++-
 include/hw/southbridge/piix.h |  4 ++--
 4 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7efef4f364..b7fcafb77e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -206,10 +206,11 @@ static void pc_init1(MachineState *machine,
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
@@ -230,10 +231,12 @@ static void pc_init1(MachineState *machine,
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
@@ -242,6 +245,7 @@ static void pc_init1(MachineState *machine,
         piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+        isa_bus_irqs(isa_bus, x86ms->gsi);
 
         rtc_state = isa_new(TYPE_MC146818_RTC);
         qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
@@ -250,7 +254,6 @@ static void pc_init1(MachineState *machine,
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
-    isa_bus_irqs(isa_bus, x86ms->gsi);
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index f10daa26bc..24e79a9a41 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -35,6 +35,7 @@ config PIIX3
     bool
     select ACPI_PIIX4
     select I8257
+    select I8259
     select ISA_BUS
     select MC146818RTC
     select USB_UHCI
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 3bd25013ee..39d8cb787f 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -41,7 +41,7 @@
 
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
-    qemu_set_irq(piix3->pic[pic_irq],
+    qemu_set_irq(piix3->pic.in_irqs[pic_irq],
                  !!(piix3->pic_levels &
                     (((1ULL << PIIX_NUM_PIRQS) - 1) <<
                      (pic_irq * PIIX_NUM_PIRQS))));
@@ -306,6 +306,13 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
+    /* PIC */
+    if (!qdev_realize(DEVICE(&d->pic), BUS(isa_bus), errp)) {
+        return;
+    }
+
+    isa_bus_irqs(isa_bus, d->pic.in_irqs);
+
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
                           "piix3-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
@@ -360,6 +367,7 @@ static void pci_piix3_init(Object *obj)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(obj);
 
+    object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
 }
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 1c291cc954..7178147b75 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
+#include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
 
@@ -50,11 +51,10 @@ struct PIIXState {
 #endif
     uint64_t pic_levels;
 
-    qemu_irq *pic;
-
     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
+    ISAPICState pic;
     RTCState rtc;
     UHCIState uhci;
     PIIX4PMState pm;
-- 
2.37.3


