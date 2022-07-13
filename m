Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672475731A5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:56:14 +0200 (CEST)
Received: from localhost ([::1]:49202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBYAE-0001Ck-0b
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZd-0005fD-Ro
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:24 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZc-0004pL-6W
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:21 -0400
Received: by mail-ed1-x52a.google.com with SMTP id x91so13122390ede.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFSy1//YLeom6uMH0IcyS+rawbRfVHlZe7IVtSU18LA=;
 b=czc0tvDnuFyY1Cw5XzXDERHt6uDCUzzZQxP22m9cpyFatHrztum/yfUaET8t13loyn
 TRUfA6N8rpnQ6KbVlPALmCZ3t2qOtAgS/D/Im4fA9/efuJgry84cyoHLPXQQqkUkJael
 zBWQ/XboGQM7CQrujUNxgB/pCFXiHjVX0tExjiwVAiJ/rFar+WtzmvZE61JgYIYTptum
 KRfysE3WX7YfWH8ydYt17zTSnS3vOMPSymNwwBLtJ3z+lsLPpzyO26zUdaBAKYCyXC6z
 exDUmxxlNQvyHWvZvOheKeiMp0gdIqoAS1ajGw4ruWkPJROlWpkUO4NZFQ++TX/3XR23
 xNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFSy1//YLeom6uMH0IcyS+rawbRfVHlZe7IVtSU18LA=;
 b=7AZMvI5uwq8gIBoPxOtGD21Y7Hy1XOI5z4pakF6Njp8K/6tayLUJBVMoKzMKJ2eiuD
 KYZmB9/7UnwXMs67B8LZJtwYN4cX8VpGPylGj/9h62b1ECyG6YgbEQwG48Ldx1r6TNMx
 UdWPIn7ITqgps9mQZtgnjE1DnZv0Y6bZ7KUomTXyi4eMazqXF9Hcyy8kZSrkfhyDrABO
 zAYf5SeHQX/zx9tRX8jIdQdh2Qfzl8YIN1dMZQc6crwqxV2Hp7TaL2rgchpFYtYmRXjD
 aX7yi7pdQZrReICeXj/ib42M6nSCDVc43Oc9vv2RODUDQr69AAKRwBuyaOT8SlGSTjel
 n4pA==
X-Gm-Message-State: AJIora8X2Y4ImD158BcB+Oa8MTEvOODRPvDi8IXEqiteyr1bNZoVrPIA
 MNF2wtwYPU2c44vTy0zhZQZqZVfKYOg=
X-Google-Smtp-Source: AGRyM1uGVyrrSxi8+Q9B78TECwq1EJ98E1yicNMhWQBys9Ypw2H+IDeA4SwEjdphaiMU2j2jcNVGaQ==
X-Received: by 2002:a05:6402:84f:b0:437:6293:d264 with SMTP id
 b15-20020a056402084f00b004376293d264mr3072976edz.317.1657700298722; 
 Wed, 13 Jul 2022 01:18:18 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:18 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 09/11] hw/isa/piix3: QOM'ify IDE controller creation
Date: Wed, 13 Jul 2022 10:17:33 +0200
Message-Id: <20220713081735.112016-10-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

Now that PIIX3 contains the new isa-pic, it is possible to instantiate
PIIX3 IDE in the PIIX3 southbridge. PIIX3 IDE wires up its interrupts to
the ISA bus in its realize method which requires the interrupt
controller to provide fully populated qemu_irqs. This is the case for
isa-pic even though the virtualization technology not known yet.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/Kconfig               |  1 -
 hw/i386/pc_piix.c             | 13 +++++--------
 hw/isa/Kconfig                |  1 +
 hw/isa/piix3.c                |  8 ++++++++
 include/hw/southbridge/piix.h |  2 ++
 5 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d22ac4a4b9..dd247f215c 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -74,7 +74,6 @@ config I440FX
     select ACPI_SMBUS
     select PCI_I440FX
     select PIIX3
-    select IDE_PIIX
     select DIMM
     select SMBIOS
     select FW_CFG_DMA
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4ce215a212..f843a73d90 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -85,7 +85,6 @@ static void pc_init1(MachineState *machine,
     PCIBus *pci_bus;
     ISABus *isa_bus;
     Object *piix4_pm;
-    int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
     BusState *idebus[MAX_IDE_BUS];
@@ -226,11 +225,13 @@ static void pc_init1(MachineState *machine,
         for (i = 0; i < ISA_NUM_IRQS; ++i) {
             qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
         }
-        piix3_devfn = pci_dev->devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
                                                              "rtc"));
         piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
+        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
+        idebus[0] = qdev_get_child_bus(dev, "ide.0");
+        idebus[1] = qdev_get_child_bus(dev, "ide.1");
     } else {
         pci_bus = NULL;
         piix4_pm = NULL;
@@ -244,6 +245,8 @@ static void pc_init1(MachineState *machine,
 
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
+        idebus[0] = NULL;
+        idebus[1] = NULL;
     }
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
@@ -272,12 +275,6 @@ static void pc_init1(MachineState *machine,
     pc_nic_init(pcmc, isa_bus, pci_bus);
 
     if (pcmc->pci_enabled) {
-        PCIDevice *dev;
-
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1, "piix3-ide");
-        pci_ide_create_devs(dev);
-        idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
-        idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
         pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
     }
 #ifdef CONFIG_IDE_ISA
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index d42143a991..808b9a30af 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -34,6 +34,7 @@ config PC87312
 config PIIX3
     bool
     select ISA_BUS
+    select IDE_PIIX
 
 config PIIX4
     bool
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 7bf3488f76..fd9c8f853a 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -328,6 +328,13 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
+    /* IDE */
+    qdev_prop_set_int32(DEVICE(&d->ide), "addr", dev->devfn + 1);
+    if (!qdev_realize(DEVICE(&d->ide), BUS(pci_bus), errp)) {
+        return;
+    }
+    pci_ide_create_devs(PCI_DEVICE(&d->ide));
+
     /* USB */
     if (d->has_usb) {
         qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
@@ -368,6 +375,7 @@ static void pci_piix3_init(Object *obj)
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
+    object_initialize_child(obj, "ide", &d->ide, "piix3-ide");
     object_initialize_child(obj, "uhci", &d->uhci, "piix3-usb-uhci");
 
     object_initialize_child(obj, "pm", &d->pm, TYPE_PIIX4_PM);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index cfe155ce07..41983dfa6d 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
+#include "hw/ide/pci.h"
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
@@ -56,6 +57,7 @@ struct PIIXState {
 
     ISAPICState pic;
     RTCState rtc;
+    PCIIDEState ide;
     UHCIState uhci;
     PIIX4PMState pm;
 
-- 
2.37.1


