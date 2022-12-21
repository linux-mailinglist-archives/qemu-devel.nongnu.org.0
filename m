Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4656534B1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:12:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82U4-0003iC-0O; Wed, 21 Dec 2022 12:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82St-0002sq-NP; Wed, 21 Dec 2022 12:01:13 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sr-0008FH-3L; Wed, 21 Dec 2022 12:01:11 -0500
Received: by mail-ed1-x532.google.com with SMTP id r26so22844951edc.10;
 Wed, 21 Dec 2022 09:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+sLbWYZETM2qU26eDCFJ1x7ljkfTCQzfKSZNA8Fwues=;
 b=mV/maqo5TKPz9UhIE6djf7zZ0Dy80Dqm4631t/w1x8mHgY4/IJeF+vlL+juTb1NoC8
 Xm6Wl/n72FizxJvx/3f1vTvAIsm2RdNSZ+D2VClgCgaUrxWbhIWRraNB5IkZzrmg651K
 I+N4xN3i1jOX2ut2HIVU5YEYSQTojRg8lIf0KQVxKPi2TWCS7QJ4tGGkb4hkPHaQTHTm
 5hQLYYi7JiNkTlfy7IkVSiFX8FLsF35AX4hfutPucvvlny4j9g0kHirqgEV4nWv71JnT
 XgKKIfJr8r8Qt8D/7ehlqmC42tecFGSq+ak0IpMye08Rop9xXuCCpm3ToCOkmbWLs0Sl
 6Wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+sLbWYZETM2qU26eDCFJ1x7ljkfTCQzfKSZNA8Fwues=;
 b=l05SKHB/KP4FdJoKKvzp+i46ah0mdLTLJ2zIhS691Z4C4Cu+DwLzo0Hdx2Ox9lbQom
 QGnjHwyhQOkghmI+bWRPQRAl3DazlNgxE368zBEP2BfJJ/2ScAsOUp/YWR4UAzcnCt4s
 1HPjON/RNMr/hQcLHTRabDoVrkDjReU79c5d11R1HRm6Tpbl29RBaPDcTEyCcH4259+2
 bfyJirdyMx7UdXx4TxI4t8Cfxm2JJEwfBFkArLwiFZql+Xfg+0z57RXR5fXCNkPLi3Pd
 eJorZxnOEUfjmFDEKj6LJ8l8RBCN88HcCq02kUp73rlo1mMMhcJukGw5k4l1ULDyQrpV
 UTIQ==
X-Gm-Message-State: AFqh2krUdasfXAXHcNfWZcv1mFAJFPb/V2MmnUFm8ha9jW1wdwg4Xn6I
 kNc4IqwbQ84Oi+2hDUDaZaQ5GCri/y8=
X-Google-Smtp-Source: AMrXdXt+otblzMZdhaUxWFAYmIqEPMzaHwBqGv2O7l4VdN6u0OGbeH3hQN0Rn4pJRBxrNiGE52jDHw==
X-Received: by 2002:aa7:c69a:0:b0:461:fc07:b9a7 with SMTP id
 n26-20020aa7c69a000000b00461fc07b9a7mr2695119edq.2.1671642062960; 
 Wed, 21 Dec 2022 09:01:02 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:01:02 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 14/30] hw/isa/piix3: Create IDE controller in host device
Date: Wed, 21 Dec 2022 17:59:47 +0100
Message-Id: <20221221170003.2929-15-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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

Now that PIIX3 contains the new isa-pic, it is possible to instantiate
PIIX3 IDE in the PIIX3 southbridge. PIIX3 IDE wires up its interrupts to
the ISA bus in its realize method which requires the interrupt
controller to provide fully populated qemu_irqs. This is the case for
isa-pic even though the virtualization technology not known yet.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-17-shentey@gmail.com>
---
 hw/i386/Kconfig               |  1 -
 hw/i386/pc_piix.c             | 15 ++++++---------
 hw/isa/Kconfig                |  1 +
 hw/isa/piix3.c                |  8 ++++++++
 include/hw/southbridge/piix.h |  2 ++
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 79f5925dbe..39a35467ca 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -75,7 +75,6 @@ config I440FX
     select I8259
     select PCI_I440FX
     select PIIX3
-    select IDE_PIIX
     select DIMM
     select SMBIOS
     select FW_CFG_DMA
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e33406a2e3..8c3d3698eb 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -41,7 +41,6 @@
 #include "hw/usb.h"
 #include "net/net.h"
 #include "hw/ide/pci.h"
-#include "hw/ide/piix.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
@@ -98,7 +97,6 @@ static void pc_init1(MachineState *machine,
     PCIBus *pci_bus;
     ISABus *isa_bus;
     Object *piix4_pm;
-    int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
     BusState *idebus[MAX_IDE_BUS];
@@ -252,11 +250,14 @@ static void pc_init1(MachineState *machine,
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
@@ -270,6 +271,8 @@ static void pc_init1(MachineState *machine,
 
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
+        idebus[0] = NULL;
+        idebus[1] = NULL;
     }
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
@@ -298,12 +301,6 @@ static void pc_init1(MachineState *machine,
     pc_nic_init(pcmc, isa_bus, pci_bus);
 
     if (pcmc->pci_enabled) {
-        PCIDevice *dev;
-
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
-        pci_ide_create_devs(dev);
-        idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
-        idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
         pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
     }
 #ifdef CONFIG_IDE_ISA
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index b4ad1fb66e..8bf6462798 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -35,6 +35,7 @@ config PIIX3
     bool
     select ACPI_PIIX4
     select I8257
+    select IDE_PIIX
     select ISA_BUS
     select MC146818RTC
     select PROXY_PIC
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 9e9155cbda..d6d36db01e 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -29,6 +29,7 @@
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/ide/piix.h"
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
 #include "sysemu/runstate.h"
@@ -317,6 +318,12 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
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
@@ -369,6 +376,7 @@ static void pci_piix3_init(Object *obj)
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_PROXY_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
+    object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
 static Property pci_piix3_props[] = {
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 7b1b4625a3..c4e6e9f827 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -16,6 +16,7 @@
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
 #include "hw/core/proxy-pic.h"
+#include "hw/ide/pci.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
 
@@ -56,6 +57,7 @@ struct PIIXState {
 
     ProxyPICState pic;
     RTCState rtc;
+    PCIIDEState ide;
     UHCIState uhci;
     PIIX4PMState pm;
 
-- 
2.39.0


