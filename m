Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7C320B26
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:55:40 +0100 (CET)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq95-0006HB-7f
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprn-0000ng-Rg
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprl-0003ZA-Ps
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id l13so2519643wmg.5
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2T+hpNRPaClY3K4hATCoC3PY+rExU+CseU3tyEMImpE=;
 b=j1uJHVkTSe8Tc+cQRNwemTeiBzyCt2LrhAk1s1+mSRGdWUxhPzxBMixOaJ8A6JTUzI
 +z0GQWmqs+nMC8lDJbd9usU8L789UMb7OmKNAxRZ4JwKMLsyr15j3hGHgviZ6DZBNE3P
 JlLMVBmE+4DWXdSCcV4N4GY00UlB/1sHtjPabCuH9cL3PiJMBKZMctpODvlkNl0D6AQk
 6rZ4+F7xOfyc3ajSFXq4kdulKY5JMUt9fKfzmAqaJN3h5rLYPGlONO87MQ7dBab7Fj74
 9bqL2VzfFFHCmBENaifz9QEw62Cv/th7VkHlOVqWlsdzzfl3VqhCNz+gA2jwM5jxYMwi
 iEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2T+hpNRPaClY3K4hATCoC3PY+rExU+CseU3tyEMImpE=;
 b=Obczd6dVFShCbXssCs+braud5aCaPMNTixfwfHbg7mvmjGb/vxvFRagUzaFqItiRgn
 0+8lZv7Fb/ASO6+cq0z7nckMf+KvjXtCR11ER6dosJrXe8wVb91a5YsLZ9jQssk0P0w9
 1bZxJVGb9hGfq/pSbWI/SUasmc6lmD93xEGDFMxovqnvvq1Li3+iQWC7X2bJjUDrtuvm
 N8LGs3q/wG8kd4iHv40mngN3mEwVRHd2DLaJzTZ0hPEBeqA4WW9HFSiTSYh1PtFXKUBC
 Vva7fWJTARbWbxXTWrFj6ckD3ZqMGxI9C7MEQqwFnxbJ14+hIITn7uFqvai1OT6Szsxo
 oMpw==
X-Gm-Message-State: AOAM5311xnWmxP4UgCr592qd52NqVyjo31VRD5JD5sMewY0WgaSSxut1
 QfQ7DrzskC22Xyn/8+97DFOGqkkXOJk=
X-Google-Smtp-Source: ABdhPJxTk07QfGnDVXIHuy1MPreAarCrDoQQJQ7hxQO+eqp64EwGoBhFQt/G+YZgA0kvmrExPBmShg==
X-Received: by 2002:a1c:a791:: with SMTP id q139mr16144950wme.20.1613918264173; 
 Sun, 21 Feb 2021 06:37:44 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h20sm6417404wmb.1.2021.02.21.06.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/43] vt82c686: Move creation of ISA devices to the ISA bridge
Date: Sun, 21 Feb 2021 15:34:27 +0100
Message-Id: <20210221143432.2468220-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Currently the ISA devices that are part of the VIA south bridge,
superio chip are wired up by board code. Move creation of these ISA
devices to the VIA ISA bridge model so that board code does not need
to access ISA bus. This also allows vt82c686b-superio to be made
internal to vt82c686 which allows implementing its configuration via
registers in subseqent commits.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c   | 20 ++++++++++++++++++++
 hw/mips/fuloong2e.c | 29 +++++------------------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 7e5fa060f5f..a37f1931ce0 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -16,6 +16,11 @@
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
 #include "hw/isa/superio.h"
+#include "hw/intc/i8259.h"
+#include "hw/irq.h"
+#include "hw/dma/i8257.h"
+#include "hw/timer/i8254.h"
+#include "hw/rtc/mc146818rtc.h"
 #include "migration/vmstate.h"
 #include "hw/isa/apm.h"
 #include "hw/acpi/acpi.h"
@@ -307,9 +312,16 @@ OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 
 struct VT82C686BISAState {
     PCIDevice dev;
+    qemu_irq cpu_intr;
     SuperIOConfig superio_cfg;
 };
 
+static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
+{
+    VT82C686BISAState *s = opaque;
+    qemu_set_irq(s->cpu_intr, level);
+}
+
 static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
                                    uint32_t val, int len)
 {
@@ -365,10 +377,18 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     VT82C686BISAState *s = VT82C686B_ISA(d);
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
+    qemu_irq *isa_irq;
     int i;
 
+    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
+    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    i8257_dma_init(isa_bus, 0);
+    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 94f4718147f..4f61f2c873b 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -25,9 +25,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/clock.h"
-#include "hw/intc/i8259.h"
-#include "hw/dma/i8257.h"
-#include "hw/isa/superio.h"
 #include "net/net.h"
 #include "hw/boards.h"
 #include "hw/i2c/smbus_eeprom.h"
@@ -39,13 +36,13 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "hw/ide/pci.h"
+#include "hw/qdev-properties.h"
 #include "elf.h"
 #include "hw/isa/vt82c686.h"
-#include "hw/rtc/mc146818rtc.h"
-#include "hw/timer/i8254.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
+#include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 
 #define ENVP_PADDR              0x2000
@@ -203,26 +200,13 @@ static void main_cpu_reset(void *opaque)
 }
 
 static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
-                                       I2CBus **i2c_bus, ISABus **p_isa_bus)
+                                       I2CBus **i2c_bus)
 {
-    qemu_irq *i8259;
-    ISABus *isa_bus;
     PCIDevice *dev;
 
     dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
-    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
-    assert(isa_bus);
-    *p_isa_bus = isa_bus;
-    /* Interrupt controller */
-    /* The 8259 -> IP5  */
-    i8259 = i8259_init(isa_bus, intc);
-    isa_bus_irqs(isa_bus, i8259);
-    /* init other devices */
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(isa_bus, 0);
-    /* Super I/O */
-    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
+    qdev_connect_gpio_out(DEVICE(dev), 0, intc);
 
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
     pci_ide_create_devs(dev);
@@ -269,7 +253,6 @@ static void mips_fuloong2e_init(MachineState *machine)
     uint64_t kernel_entry;
     PCIDevice *pci_dev;
     PCIBus *pci_bus;
-    ISABus *isa_bus;
     I2CBus *smbus;
     Clock *cpuclk;
     MIPSCPU *cpu;
@@ -336,7 +319,7 @@ static void mips_fuloong2e_init(MachineState *machine)
 
     /* South bridge -> IP5 */
     vt82c686b_southbridge_init(pci_bus, FULOONG2E_VIA_SLOT, env->irq[5],
-                               &smbus, &isa_bus);
+                               &smbus);
 
     /* GPU */
     if (vga_interface_type != VGA_NONE) {
@@ -351,8 +334,6 @@ static void mips_fuloong2e_init(MachineState *machine)
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(smbus, 0x50, spd_data);
 
-    mc146818_rtc_init(isa_bus, 2000, NULL);
-
     /* Network card: RTL8139D */
     network_init(pci_bus);
 }
-- 
2.26.2


