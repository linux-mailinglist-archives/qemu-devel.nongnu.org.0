Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22FB5A9D36
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:37:01 +0200 (CEST)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnBc-0005Jl-IT
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1v-0001ii-TU
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:59 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1t-0001Um-Ss
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:59 -0400
Received: by mail-ed1-x535.google.com with SMTP id m1so23309209edb.7
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=EoxlkUwz75TMtGKP4zRxpf2YwPH7PAH4alIR4dYwMwU=;
 b=NLKBrok271LuJfG05MN0z5/F1m0dUEidl5qm5YcltZq/7lLQVNBAvJ3dqtNqWL7Q7T
 5+fFj/2nj/POcrGrh0PFHfZyzvJw3cej74ZBq/DTBq/t3axBwMub9Qodnd+EeloAsT5l
 VOeMkpn+2v0x6GtGCeW5wJtYfv9VQnQX14v/4Qfg4uXBh6F9pJMRoxgwohY+1VetiEPA
 On7ibvOIFdCGVhM2yXJNCIZVnXKmlgXC75mVNIlGv3d6etA6mRh6uXygvD/viq+vA1sc
 Wom3leRbQOiyxGn/+le4Mq9aUKrF7vPmI/0FtgCT+6caOP6PkZvS2XFSiofGor5h5zZt
 Mliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EoxlkUwz75TMtGKP4zRxpf2YwPH7PAH4alIR4dYwMwU=;
 b=CVHv5CwX+92rSpwgqKQ3hbhLhOL3Z2nHGUVPx2ALjLrPJL5/mD1GKgxtYaAdY7TVdM
 iKjCUVUnXEDlihgExGztkG8Akp5DPsSGyIIYyB4XRw2WZ11nsuQ5NaKSR/Ql1Fy/cmeQ
 w7qfB+0yShxqghzDt/xIlYxx7vImNLxEK7T8rwTszG3k0ZnnIMCTG8+e8gwJr2treRiD
 pqB8JoKMZ3O9XFqegeOwno6IFATaXrmHAFsVshn7UW+sjY88BVlBkOXUMCEmBX5FlS61
 Whyr3ivjEQFqANUKTyWFpYK7TU0ISDQRqOITQ9lE1T46EoY2StQ8aNSTblIP6ryXJtKw
 FAhg==
X-Gm-Message-State: ACgBeo0MHEkZln7R8zXGM9b+CxiD4W5fcNY0c5gelEqP4bgb/T+Zpj4I
 NatqiUNgEL8KFjUclbP32vKLp0I6/30=
X-Google-Smtp-Source: AA6agR6Jja6DDS5WoRHVx/swNWQbVS28RSnScsPPxFZO/VHOtqhuqUu9miJzL5zmgEOqGSlP38XlMQ==
X-Received: by 2002:a05:6402:1c8f:b0:447:8124:abd with SMTP id
 cy15-20020a0564021c8f00b0044781240abdmr29348426edb.223.1662049616252; 
 Thu, 01 Sep 2022 09:26:56 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:55 -0700 (PDT)
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
Subject: [PATCH 09/42] hw/isa/piix3: Create IDE controller in host device
Date: Thu,  1 Sep 2022 18:25:40 +0200
Message-Id: <20220901162613.6939-10-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
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

Now that PIIX3 contains the new isa-pic, it is possible to instantiate
PIIX3 IDE in the PIIX3 southbridge. PIIX3 IDE wires up its interrupts to
the ISA bus in its realize method which requires the interrupt
controller to provide fully populated qemu_irqs. This is the case for
isa-pic even though the virtualization technology not known yet.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/Kconfig               |  1 -
 hw/i386/pc_piix.c             | 14 ++++++--------
 hw/isa/Kconfig                |  1 +
 hw/isa/piix3.c                |  7 +++++++
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
index b7fcafb77e..c76afbc7e3 100644
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
@@ -235,11 +234,14 @@ static void pc_init1(MachineState *machine,
         for (i = 0; i < ISA_NUM_IRQS; i++) {
             qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
         }
-        piix3_devfn = pci_dev->devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(pci_dev), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
                                                              "rtc"));
         piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
+        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
+        pci_ide_create_devs(PCI_DEVICE(dev));
+        idebus[0] = qdev_get_child_bus(dev, "ide.0");
+        idebus[1] = qdev_get_child_bus(dev, "ide.1");
     } else {
         pci_bus = NULL;
         piix4_pm = NULL;
@@ -253,6 +255,8 @@ static void pc_init1(MachineState *machine,
 
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
+        idebus[0] = NULL;
+        idebus[1] = NULL;
     }
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
@@ -281,12 +285,6 @@ static void pc_init1(MachineState *machine,
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
index 24e79a9a41..a021e1cbfc 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -36,6 +36,7 @@ config PIIX3
     select ACPI_PIIX4
     select I8257
     select I8259
+    select IDE_PIIX
     select ISA_BUS
     select MC146818RTC
     select USB_UHCI
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 39d8cb787f..0e86a9a3cb 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -328,6 +328,12 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
+    /* IDE */
+    qdev_prop_set_int32(DEVICE(&d->ide), "addr", dev->devfn + 1);
+    if (!qdev_realize(DEVICE(&d->ide), BUS(pci_bus), errp)) {
+        return;
+    }
+
     /* USB */
     if (d->has_usb) {
         object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
@@ -369,6 +375,7 @@ static void pci_piix3_init(Object *obj)
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
+    object_initialize_child(obj, "ide", &d->ide, "piix3-ide");
 }
 
 static Property pci_piix3_props[] = {
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 7178147b75..1f22eb1444 100644
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
2.37.3


