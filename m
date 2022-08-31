Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9615A8288
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:59:24 +0200 (CEST)
Received: from localhost ([::1]:41392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQ7f-0004q8-5S
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvI-0002jj-Cu; Wed, 31 Aug 2022 11:46:36 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvG-00037O-Cf; Wed, 31 Aug 2022 11:46:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id a36so15132536edf.5;
 Wed, 31 Aug 2022 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=J26BIQbiLwzmWEXSRIvf/ti9jfwi26ORKPwb0BotX8Q=;
 b=dUfvufSrXLjmz/hTv75PF/awZxnSW5vjeSqqbLMFb8ykPw9wMEeKByC/3BymOfiYxk
 nLFktiWbIe+6irRvcucvuwvO6J1+ZgZX8NI/6UGxgqvQyKdDYkawoS8a30b5zQlU9h8x
 j8qWPorJFYXx7d2i34g0yddUXlLZVAU4c+n5QHPijw5Sa2ulLxYk+VOJzw0mSrkgsxVa
 lEaYEpQhsPQARoSPzgbmkVBKY33Zl7WJyjMdsGSYAbAChwGWSdswjgRd8YCdF4dpsGsu
 WzazaGEvYLRcjdLFAqupDZhfYDz4Hxafbw+3A+DfnSwh5tumYIAekPkTwlX+xlvF7Suo
 YvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=J26BIQbiLwzmWEXSRIvf/ti9jfwi26ORKPwb0BotX8Q=;
 b=kV8C5CiiVJboHtDDDAfnhkf7U/57zzDlF/WVkQ7bnn1V4HmW/DKYY9atZrbENO7UVY
 uAUoNWOjsagtbLFTKX/4fJGR5HSOBkHZTsVJNrydqJLSRUYpF7ygdtGa/dF70hMqrWB4
 3VQBd/CAvLxWGGDnO6FKR28+4sxzzPFsU/+qtTJaq03AT+cmksMFqLc5tErVYXNRxRlO
 lN6gzBb6f/LN06UeQv3Iker0412K0JnSPwrjWNQp61BRmvo86R4FyJQ6y22k69S9+H/3
 +MQiOUXTS7bK5G1CeFXE43cY3EUoHITmF6pc6V1+aahPpxh4O6rhnRvTp8FUB90Y50O3
 OHHw==
X-Gm-Message-State: ACgBeo3Cvxc+u3M4HLBfEaAR3jqFNedbK1HkKgcP07SDskPt/U4C9XFy
 Y4wCX2vwq2snNDLF5ZiVk7UL0scGQgY=
X-Google-Smtp-Source: AA6agR4cGDaD+7aoWFstpRw948FJT6MNwTGereICjYQY3lz/U3dYif1Knp9ALn+OE0zcnCtiEoSM9w==
X-Received: by 2002:a05:6402:530d:b0:446:e22:cca2 with SMTP id
 eo13-20020a056402530d00b004460e22cca2mr25108522edb.237.1661960791407; 
 Wed, 31 Aug 2022 08:46:31 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:31 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 06/12] hw/isa/vt82c686: Instantiate IDE function in host
 device
Date: Wed, 31 Aug 2022 17:45:59 +0200
Message-Id: <20220831154605.12773-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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


