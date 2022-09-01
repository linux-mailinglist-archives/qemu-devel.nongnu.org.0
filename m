Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7445A9647
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:05:16 +0200 (CEST)
Received: from localhost ([::1]:60490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTiwc-0007S3-O9
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaQ-0005gw-KU; Thu, 01 Sep 2022 07:42:28 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaD-0000EM-En; Thu, 01 Sep 2022 07:42:18 -0400
Received: by mail-ej1-x635.google.com with SMTP id h5so22510315ejb.3;
 Thu, 01 Sep 2022 04:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=J26BIQbiLwzmWEXSRIvf/ti9jfwi26ORKPwb0BotX8Q=;
 b=B4raOLB0a/2msM/9rbKl+SCYZgdniB5U6uC5CowK/8KF0DkkVmRN+gTmGyVQO2xDZ9
 MSZkvH+ipFUXUzIuhcW2F89WLvXZUKryfl8H3E73kX8xoGL/ZD5VuOx7QFGL5VAJfZQR
 uFutzgZWCZha9OB5wRkScbqV4G9JMcR3cvZz7oMNv4ErsC3JWUp6+O0izqJWZnW3aGSB
 tkPb8REf47KugKs2onB8zSfHo9NdYf86ZmAeA8R0ZH1wF0fVVfE1m+KimVFJAKPlS846
 slgNOdQ2TuRKOq9jsjOirXRufg2bzB5XW6KxF4ZgaCVTJQegUtqH8hCKdLKcuKj6BjV1
 JHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=J26BIQbiLwzmWEXSRIvf/ti9jfwi26ORKPwb0BotX8Q=;
 b=Xz//FvXexablPYL+gAwTa2bK69gGl6IIPOK5lFEOe/zsPCxBrB8hf3by/tHitq1ru2
 QSTpPzmThPA2te7wpiOSB+KOG3BzKQEY81VVeJCfNK+4nWJaa6vnujaqVAFLNHYKg8iz
 bjnLFcatMHQtFsljSz4zncsW2xlitTS8jPOng2fn39DbGTgucYgmtwizH1BG8jtqpsxE
 ypL/PA7PVqIgzVHJ9fz9876gJZf9kFrjhOdPOBIjJ4j8f1Ni3L0l0AxO4KzgihneOnnq
 tBat4jtgdf05LlOoPP2aJoEb8PEYfdRfqNPGAPxPx9fkzIt3V63qd/dMkmUPO4Y4pwuc
 nBRw==
X-Gm-Message-State: ACgBeo1XRQi17e9HEfQ5tSC+4GKllOB5d6YuEuailI2C9iUk0Yq0VwIV
 6m9E1ec2GMVFntFjguiNslkU+9n5v6o=
X-Google-Smtp-Source: AA6agR7ZlqXcn6IxadR/fC2FBZ4f5QjsxIoBpePGsM96FN8QJRSuallOaLbJpOnW0TQjnZdB01C1Fg==
X-Received: by 2002:a17:907:2ccc:b0:741:990f:fe48 with SMTP id
 hg12-20020a1709072ccc00b00741990ffe48mr12292877ejc.390.1662032522852; 
 Thu, 01 Sep 2022 04:42:02 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:42:02 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 06/13] hw/isa/vt82c686: Instantiate IDE function in host
 device
Date: Thu,  1 Sep 2022 13:41:20 +0200
Message-Id: <20220901114127.53914-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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

The IDE function is closely tied to the ISA function (e.g. the IDE
interrupt routing happens there), so it makes sense that the IDE
function is instantiated within the south bridge itself.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 configs/devices/mips64el-softmmu/default.mak |  1 -
 hw/isa/Kconfig                               |  1 +
 hw/isa/vt82c686.c                            | 17 +++++++++++++++++
 hw/mips/fuloong2e.c                          |  8 ++++----
 hw/ppc/Kconfig                               |  1 -
 hw/ppc/pegasos2.c                            |  9 ++++-----
 6 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
index c610749ac1..d5188f7ea5 100644
--- a/configs/devices/mips64el-softmmu/default.mak
+++ b/configs/devices/mips64el-softmmu/default.mak
@@ -1,7 +1,6 @@
 # Default configuration for mips64el-softmmu
 
 include ../mips-softmmu/common.mak
-CONFIG_IDE_VIA=y
 CONFIG_FULOONG=y
 CONFIG_LOONGSON3V=y
 CONFIG_ATI_VGA=y
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index d42143a991..20de7e9294 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -53,6 +53,7 @@ config VT82C686
     select I8254
     select I8257
     select I8259
+    select IDE_VIA
     select MC146818RTC
     select PARALLEL
 
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 37e37b3855..63c1e3b8ce 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -17,6 +17,7 @@
 #include "hw/isa/vt82c686.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
+#include "hw/ide/pci.h"
 #include "hw/isa/isa.h"
 #include "hw/isa/superio.h"
 #include "hw/intc/i8259.h"
@@ -544,6 +545,7 @@ struct ViaISAState {
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
     ViaSuperIOState via_sio;
+    PCIIDEState ide;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via = {
     }
 };
 
+static void via_isa_init(Object *obj)
+{
+    ViaISAState *s = VIA_ISA(obj);
+
+    object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
+}
+
 static const TypeInfo via_isa_info = {
     .name          = TYPE_VIA_ISA,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(ViaISAState),
+    .instance_init = via_isa_init,
     .abstract      = true,
     .interfaces    = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -583,6 +593,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
+    PCIBus *pci_bus = pci_get_bus(d);
     qemu_irq *isa_irq;
     ISABus *isa_bus;
     int i;
@@ -612,6 +623,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
         return;
     }
+
+    /* Function 1: IDE */
+    qdev_prop_set_int32(DEVICE(&s->ide), "addr", d->devfn + 1);
+    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 44225fbe33..32605901e7 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -199,13 +199,13 @@ static void main_cpu_reset(void *opaque)
 static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
                                        I2CBus **i2c_bus)
 {
-    PCIDevice *dev;
+    PCIDevice *dev, *via;
 
-    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
+    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
-    qdev_connect_gpio_out(DEVICE(dev), 0, intc);
+    qdev_connect_gpio_out(DEVICE(via), 0, intc);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), TYPE_VIA_IDE);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 400511c6b7..18565e966b 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -74,7 +74,6 @@ config PEGASOS2
     bool
     select MV64361
     select VT82C686
-    select IDE_VIA
     select SMBUS_EEPROM
     select VOF
 # This should come with VT82C686
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 8039775f80..8bc528a560 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -102,7 +102,7 @@ static void pegasos2_init(MachineState *machine)
     CPUPPCState *env;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
     PCIBus *pci_bus;
-    PCIDevice *dev;
+    PCIDevice *dev, *via;
     I2CBus *i2c_bus;
     const char *fwname = machine->firmware ?: PROM_FILENAME;
     char *filename;
@@ -160,13 +160,12 @@ static void pegasos2_init(MachineState *machine)
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
     /* VT8231 function 0: PCI-to-ISA Bridge */
-    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
+    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
-    qdev_connect_gpio_out(DEVICE(dev), 0,
+    qdev_connect_gpio_out(DEVICE(via), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
-    /* VT8231 function 1: IDE Controller */
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), TYPE_VIA_IDE);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
     /* VT8231 function 2-3: USB Ports */
-- 
2.37.3


