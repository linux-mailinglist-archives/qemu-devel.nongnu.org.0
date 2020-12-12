Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1412D8360
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:25:44 +0100 (CET)
Received: from localhost ([::1]:53616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knsjH-0000Vb-9m
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsa1-0002mh-6L
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:16:09 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZl-0005fN-3q
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:16:08 -0500
Received: by mail-wm1-x344.google.com with SMTP id 3so10099954wmg.4
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sy8GTMLrANGCKa2I6q8N2rwI9l+Phoy4vAofP+Z/xdw=;
 b=kY8PiCaBCZ7SYQrD+bbDXotTqXm44ANQzTX29FZO7CoTBEFNczH8xxb9W/OYP4FH/b
 z4vV7rTMBW/eLsr/fOGMCuLBFZzCaijjGGntP0WX0HuTq5a3cmEtTmTBnGR8MU18sl3h
 S8K1749g39pnd7pHqH5KpK1bhzhkMacKlrV4bFawkPdVi+xunFNkIYkyl2iapmOBKaaY
 JRKOYy9pnCxdg/+LwzRot6nK9E5cLcZqlzOcWlw6qmm0Q4G/2fxzV//ANTXokY5UL7w4
 ngS8K4+kw3L66bWNZgjdQSZL0HbaXb64603EL3p4L03O58ARltMyOC3BMUY9u/3OJNDB
 eNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sy8GTMLrANGCKa2I6q8N2rwI9l+Phoy4vAofP+Z/xdw=;
 b=mtM+bJ6DReJqQ7QaH3xJDvtcHhXVoIQfXOsbJpEZyG/3e9ufCLj6EGhmJolYxZZyC9
 a6H86afyf3Ulj2iZPb0kWUCaC1cDSnEJOK0KlPKj0frKocvBIObZVn+3Lnbx0Ah0Yw3M
 WJC9yAl+THNLTrYkcOEXvQuGMCUGP0K/+5jjAgcbz1y+MjSVK/yBiJ3z4ENnVP5d8HdC
 +CsS3Z4wwH9k68Cbfrr0/Wfuko2WpCUQnkcBqnvX6lcWWzQ2kLbJKAazoZbTwLaw4xgQ
 jN47DpfInt1D9kzGCtMtVZZhIemrIA+1MqU8/O0sWYCb4xn5t7nZxi3wdO+xSpav4n3d
 eGIQ==
X-Gm-Message-State: AOAM531/lz6ifurKH0wtzT45MiiWXoX5IWozXwrs4dkXgkoNQKrW5AQy
 /5R3UpbOfwIUezm8lUizqcJ+mXTSqUyFCA==
X-Google-Smtp-Source: ABdhPJw+x/So/m6h/Hju5oW3s0dYhkssu3EW2X0rWXivgldeb5r1pQBI7cnkZMqwo8TivntByQFSyg==
X-Received: by 2002:a1c:55ca:: with SMTP id j193mr16201950wmb.87.1607732146315; 
 Fri, 11 Dec 2020 16:15:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm16306001wmb.11.2020.12.11.16.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 16:15:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] hw/ppc/sam460ex: Drop use of ppcuic_init()
Date: Sat, 12 Dec 2020 00:15:34 +0000
Message-Id: <20201212001537.24520-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201212001537.24520-1-peter.maydell@linaro.org>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch the sam460ex board to directly creating and configuring the
UIC, rather than doing it via the old ppcuic_init() helper function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ppc/sam460ex.c | 70 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 14e6583eb0d..9cf7aad3833 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -39,6 +39,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "hw/ppc/fdt.h"
 #include "hw/qdev-properties.h"
+#include "hw/intc/ppc-uic.h"
 
 #include <libfdt.h>
 
@@ -281,7 +282,6 @@ static void sam460ex_init(MachineState *machine)
     hwaddr ram_bases[SDRAM_NR_BANKS] = {0};
     hwaddr ram_sizes[SDRAM_NR_BANKS] = {0};
     MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
-    qemu_irq *irqs, *uic[4];
     PCIBus *pci_bus;
     PowerPCCPU *cpu;
     CPUPPCState *env;
@@ -293,6 +293,9 @@ static void sam460ex_init(MachineState *machine)
     struct boot_info *boot_info;
     uint8_t *spd_data;
     int success;
+    qemu_irq mal_irqs[4];
+    DeviceState *uic[4];
+    int i;
 
     cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
     env = &cpu->env;
@@ -312,13 +315,35 @@ static void sam460ex_init(MachineState *machine)
     ppc4xx_plb_init(env);
 
     /* interrupt controllers */
-    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
-    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
-    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
-    uic[0] = ppcuic_init(env, irqs, 0xc0, 0, 1);
-    uic[1] = ppcuic_init(env, &uic[0][30], 0xd0, 0, 1);
-    uic[2] = ppcuic_init(env, &uic[0][10], 0xe0, 0, 1);
-    uic[3] = ppcuic_init(env, &uic[0][16], 0xf0, 0, 1);
+    for (i = 0; i < ARRAY_SIZE(uic); i++) {
+        SysBusDevice *sbd;
+        /*
+         * Number of the first of the two consecutive IRQ inputs on UIC 0
+         * to connect the INT and CINT outputs of UIC n to. The entry
+         * for UIC 0 is ignored, because it connects to the CPU.
+         */
+        const int input_ints[] = { -1, 30, 10, 16 };
+
+        uic[i] = qdev_new(TYPE_PPC_UIC);
+        sbd = SYS_BUS_DEVICE(uic[i]);
+
+        qdev_prop_set_uint32(uic[i], "dcr-base", 0xc0 + i * 0x10);
+        object_property_set_link(OBJECT(uic[i]), "cpu", OBJECT(cpu),
+                                 &error_fatal);
+        sysbus_realize_and_unref(sbd, &error_fatal);
+
+        if (i == 0) {
+            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
+                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
+                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+        } else {
+            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
+                               qdev_get_gpio_in(uic[0], input_ints[i]));
+            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
+                               qdev_get_gpio_in(uic[0], input_ints[i] + 1));
+        }
+    }
 
     /* SDRAM controller */
     /* put all RAM on first bank because board has one slot
@@ -331,7 +356,8 @@ static void sam460ex_init(MachineState *machine)
                       ram_bases, ram_sizes, 1);
 
     /* IIC controllers and devices */
-    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700, uic[0][2]);
+    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
+                               qdev_get_gpio_in(uic[0], 2));
     i2c = PPC4xx_I2C(dev)->bus;
     /* SPD EEPROM on RAM module */
     spd_data = spd_data_generate(ram_sizes[0] < 128 * MiB ? DDR : DDR2,
@@ -341,7 +367,8 @@ static void sam460ex_init(MachineState *machine)
     /* RTC */
     i2c_slave_create_simple(i2c, "m41t80", 0x68);
 
-    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600800, uic[0][3]);
+    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600800,
+                               qdev_get_gpio_in(uic[0], 3));
 
     /* External bus controller */
     ppc405_ebc_init(env);
@@ -356,7 +383,14 @@ static void sam460ex_init(MachineState *machine)
     ppc4xx_sdr_init(env);
 
     /* MAL */
-    ppc4xx_mal_init(env, 4, 16, &uic[2][3]);
+    /*
+     * TODO if the MAL were a proper QOM device we would not need to
+     * copy its qemu_irqs into an array for ppc4xx_mal_init()'s benefit.
+     */
+    for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
+        mal_irqs[0] = qdev_get_gpio_in(uic[2], 3 + i);
+    }
+    ppc4xx_mal_init(env, 4, 16, mal_irqs);
 
     /* DMA */
     ppc4xx_dma_init(env, 0x200);
@@ -369,21 +403,23 @@ static void sam460ex_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x400000000LL, l2cache_ram);
 
     /* USB */
-    sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400, uic[2][29]);
+    sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400,
+                         qdev_get_gpio_in(uic[2], 29));
     dev = qdev_new("sysbus-ohci");
     qdev_prop_set_string(dev, "masterbus", "usb-bus.0");
     qdev_prop_set_uint32(dev, "num-ports", 6);
     sbdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sbdev, &error_fatal);
     sysbus_mmio_map(sbdev, 0, 0x4bffd0000);
-    sysbus_connect_irq(sbdev, 0, uic[2][30]);
+    sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(uic[2], 30));
     usb_create_simple(usb_bus_find(-1), "usb-kbd");
     usb_create_simple(usb_bus_find(-1), "usb-mouse");
 
     /* PCI bus */
     ppc460ex_pcie_init(env);
     /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
-    dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000, uic[1][0]);
+    dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000,
+                               qdev_get_gpio_in(uic[1], 0));
     pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (!pci_bus) {
         error_report("couldn't create PCI controller!");
@@ -405,12 +441,14 @@ static void sam460ex_init(MachineState *machine)
     /* SoC has 4 UARTs
      * but board has only one wired and two are present in fdt */
     if (serial_hd(0) != NULL) {
-        serial_mm_init(address_space_mem, 0x4ef600300, 0, uic[1][1],
+        serial_mm_init(address_space_mem, 0x4ef600300, 0,
+                       qdev_get_gpio_in(uic[1], 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hd(1) != NULL) {
-        serial_mm_init(address_space_mem, 0x4ef600400, 0, uic[0][1],
+        serial_mm_init(address_space_mem, 0x4ef600400, 0,
+                       qdev_get_gpio_in(uic[0], 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
                        DEVICE_BIG_ENDIAN);
     }
-- 
2.20.1


