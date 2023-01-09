Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D8662D06
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:41:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuG-0003F1-US; Mon, 09 Jan 2023 12:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtd-0002gr-RF; Mon, 09 Jan 2023 12:25:17 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvta-0001FZ-82; Mon, 09 Jan 2023 12:25:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id qk9so21946672ejc.3;
 Mon, 09 Jan 2023 09:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAYHte6u+PWEsaH/CoETg8XsbcoCe7fBRnqNHgwAsPo=;
 b=Bljun7cn9zvzQWbJMLA9teC+cjmQGOJiztabCej/AQXTyCQgA6VMo7rcuYDCbzYOHX
 KxnFhd0lsu1LpyOFwofcQy/Xp4QkKWS6adv/dTu1bnNbcmRVs0o/s2iaC4X8r7T8mhr2
 rP4YIQOaUJqXdFJhN5QP8N4Wz4yR8lW8W7MyO7ILsQ8lKFTLJ/bqsKImH3zEwf+6dUZf
 3uDeE8fjnbl11BTWDxo+4VxQTdhyOM4XrkRWazpyZghAKrrZShaqITxnsMcf9Kb5Nxq1
 ZWnKgxP3T36mzyexZ2PDflIqSK+d7yXQd7hjfh4mwFEFNvtTW7cT6ZpEL6m3TikWQG6B
 9R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cAYHte6u+PWEsaH/CoETg8XsbcoCe7fBRnqNHgwAsPo=;
 b=NPRNMw877KroS6mWGv6t+ROtL7zhYOGSY/JOGBag7o9xJCFcq29Ev3YU1z9gJhv56B
 j4pTjcUGtALcSx7HsLpHM6vVQG7fPPm07s0HObnkLV8PVC9FEwu83RZto92GVgrf7nJQ
 2iXujMXqe4ekXhYnyJp6Q3tLATwp+3LVNiXI1wVRsShjeIbm1aqlefVC14MBGoLORfu6
 ogM2sb2cShfi+WYPvDJ+d19snvu8nASQ/ZXE5HlGU1m9RornHJoEvIfwwZ03zqq8EMWU
 6qqe7xW2K999czukS9ExuMAEnW4s3BQ2ScdgmVJK+R7Op7A8jOSH6TfeB2j+yGY/5QWJ
 8xpQ==
X-Gm-Message-State: AFqh2kobkiXDXsydp/wFaKhXN5thEY3v1GoPQu0nST2T6EnbOJ72JYSR
 iaBXRVhFJlBGW8YjXMfSj0qn0M7hWBr34g==
X-Google-Smtp-Source: AMrXdXsqPZ+iK4UweNV2E+jaNvd1QTscMOiuISJ54HPMNT2yGh1Iw2V/fjbWv2el/yWtoWlFrT4etQ==
X-Received: by 2002:a17:907:86aa:b0:7c0:aea2:e910 with SMTP id
 qa42-20020a17090786aa00b007c0aea2e910mr90238820ejc.3.1673285112018; 
 Mon, 09 Jan 2023 09:25:12 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:11 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 17/33] hw/isa/piix3: Create IDE controller in host device
Date: Mon,  9 Jan 2023 18:23:30 +0100
Message-Id: <20230109172347.1830-18-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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

Now that PIIX3 contains the new TYPE_ISA_PIC, it is possible to
instantiate PIIX3 IDE in the PIIX3 southbridge. PIIX3 IDE wires up its
interrupts to the ISA bus in its realize method which requires the
interrupt controller to provide fully populated qemu_irqs. This is the
case for TYPE_ISA_PIC even though the virtualization technology isn't
known yet.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-17-shentey@gmail.com>
---
 include/hw/southbridge/piix.h |  2 ++
 hw/i386/pc_piix.c             | 15 ++++++---------
 hw/isa/piix3.c                |  8 ++++++++
 hw/i386/Kconfig               |  1 -
 hw/isa/Kconfig                |  1 +
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 514ccdb7fd..e3c35ca16f 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci_device.h"
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
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df8e2e389b..4675981021 100644
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
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 88a6bf28ea..a549b1a8a5 100644
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
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
+    object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
 static Property pci_piix3_props[] = {
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 1291f59896..7e53dc8f82 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -74,7 +74,6 @@ config I440FX
     select I8259
     select PCI_I440FX
     select PIIX3
-    select IDE_PIIX
     select DIMM
     select SMBIOS
     select FW_CFG_DMA
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index fccf095d07..b911306909 100644
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
-- 
2.39.0


