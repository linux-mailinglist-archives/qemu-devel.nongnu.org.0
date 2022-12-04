Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791B1641F2B
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:13:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uL5-0001wy-EA; Sun, 04 Dec 2022 14:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uL3-0001vu-A0; Sun, 04 Dec 2022 14:07:45 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uL1-0001c1-GZ; Sun, 04 Dec 2022 14:07:45 -0500
Received: by mail-ej1-x62e.google.com with SMTP id fc4so16120399ejc.12;
 Sun, 04 Dec 2022 11:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7GB+odbQ95eIC6uph3zslGGTIRRkoNM8DhwqfiI1Vb0=;
 b=hPtWwgVhiL3Pls+gKB9DMmsFI23/HdC6LtUbDJdSr7YlRQFdXLjN88c6hTIpk8kz3R
 SShM9XWzibvU9Hc9EK5J48JCC1P+bX+uoc2Y0/FPzfGi6kQyr8F3dCoopL88GmV/cFl6
 S0bVAks/LHwbk+189W5C15Lm4FPcOLkIv9CUc4klOIKlK4xKEjgI1gNwytxYEdd0XuU4
 5AuaOZRiJkbridEnVcGff/3jYu6qv7ZYsdb2zMBouUbD+Lqf/u3Pg4nAUqTd/2uRvqxw
 UFM91bafAmxc1UNIAgH6QCDXBcKpygfSnav6RWA3L6Xd8P3pUJdSS2E8PJUGw62vRvo6
 JxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GB+odbQ95eIC6uph3zslGGTIRRkoNM8DhwqfiI1Vb0=;
 b=Qh39avYNGRAF+Pj3Wzk6Y+uyLQk0yK7CtZOBXOM0267afVHBPdNOsq5CzztvkAXH95
 g+XQWNfJAmLvdVsgoM5lSfe8S/fVENa/gMPwrCjFvlPJcAtifb7I6T/8pFETgoBJo3GD
 RNZE0vMG+K7mMx2YcAA9hBcyrUr2FiDdItHvo/n5NJ8UewUbhLf5dFJ/OVjD7WE7Zgqh
 CIVVv/Q2Fpve/v944YKJdTeZYjId5mNFUZsMXit2MUfaiYXCpKKknptJgEdOHkJ1BnDT
 LeYpdCz0vq0ntRguQLd43z3f//201Luz5o9lFn+tYNe6mX+DOJBZ5wjlBnJFIbsv41D0
 mn7w==
X-Gm-Message-State: ANoB5pk6NqUfB0gLTSLNAxmGbOKC7YI3ZFBp0/lyn+UPARlEl1F1dRtF
 TRmranLKH+uSefvowziiY/fPGQ7MujQ=
X-Google-Smtp-Source: AA0mqf4ps5aRc4gqxCLGRJOckswKwBZSmCHKaFcNHt1XE53nL4W3nDzrTtQX52mRaOiQEhlvg8HMSw==
X-Received: by 2002:a17:906:9615:b0:7c0:f459:a0e4 with SMTP id
 s21-20020a170906961500b007c0f459a0e4mr1481634ejx.155.1670180862380; 
 Sun, 04 Dec 2022 11:07:42 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:42 -0800 (PST)
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
Subject: [PATCH 13/32] hw/isa/piix3: Create IDE controller in host device
Date: Sun,  4 Dec 2022 20:05:34 +0100
Message-Id: <20221204190553.3274-14-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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
index f81e91220f..19fe07a13b 100644
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
@@ -86,7 +85,6 @@ static void pc_init1(MachineState *machine,
     PCIBus *pci_bus;
     ISABus *isa_bus;
     Object *piix4_pm;
-    int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
     BusState *idebus[MAX_IDE_BUS];
@@ -236,11 +234,14 @@ static void pc_init1(MachineState *machine,
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
@@ -254,6 +255,8 @@ static void pc_init1(MachineState *machine,
 
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
+        idebus[0] = NULL;
+        idebus[1] = NULL;
     }
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
@@ -282,12 +285,6 @@ static void pc_init1(MachineState *machine,
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
index 199cbf1e14..3504ad16ca 100644
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
@@ -328,6 +329,12 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
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
@@ -380,6 +387,7 @@ static void pci_piix3_init(Object *obj)
 
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
2.38.1


