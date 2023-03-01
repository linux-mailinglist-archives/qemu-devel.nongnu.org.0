Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F36A71A7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:58:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXPlH-0000lT-Tg; Wed, 01 Mar 2023 11:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPlF-0000kY-Ei; Wed, 01 Mar 2023 11:57:01 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPlD-0007hd-6p; Wed, 01 Mar 2023 11:57:01 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PRgPk1D7Gz4xDl;
 Thu,  2 Mar 2023 03:56:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PRgPh15Hsz4x5Y;
 Thu,  2 Mar 2023 03:56:55 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 09/11] aspeed: Introduce a spi_boot region under the SoC
Date: Wed,  1 Mar 2023 17:56:17 +0100
Message-Id: <20230301165619.2171090-10-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301165619.2171090-1-clg@kaod.org>
References: <20230301165619.2171090-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=znpK=6Z=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The default boot address of the Aspeed SoCs is 0x0. For this reason,
the FMC flash device contents are remapped by HW on the first 256MB of
the address space. In QEMU, this is currently done in the machine init
with the setup of a region alias.

Move this code to the SoC and introduce an extra container to prepare
ground for the boot ROM region which will overlap the FMC flash
remapping.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  5 +++++
 hw/arm/aspeed.c             | 13 +------------
 hw/arm/aspeed_ast2600.c     | 13 +++++++++++++
 hw/arm/aspeed_soc.c         | 14 ++++++++++++++
 hw/arm/fby35.c              |  8 +-------
 5 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index bd1e03e78a..8adff70072 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -58,6 +58,8 @@ struct AspeedSoCState {
     MemoryRegion *dram_mr;
     MemoryRegion dram_container;
     MemoryRegion sram;
+    MemoryRegion spi_boot_container;
+    MemoryRegion spi_boot;
     AspeedVICState vic;
     AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
@@ -120,6 +122,7 @@ struct AspeedSoCClass {
 
 
 enum {
+    ASPEED_DEV_SPI_BOOT,
     ASPEED_DEV_IOMEM,
     ASPEED_DEV_UART1,
     ASPEED_DEV_UART2,
@@ -190,6 +193,8 @@ enum {
     ASPEED_DEV_JTAG1,
 };
 
+#define ASPEED_SOC_SPI_BOOT_ADDR 0x0
+
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
 bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp);
 void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr);
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cb59a37b07..4a2814b7ea 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -388,18 +388,7 @@ static void aspeed_machine_init(MachineState *machine)
         MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
         uint64_t size = memory_region_size(&fl->mmio);
 
-        /*
-         * create a ROM region using the default mapping window size of
-         * the flash module. The window size is 64MB for the AST2400
-         * SoC and 128MB for the AST2500 SoC, which is twice as big as
-         * needed by the flash modules of the Aspeed machines.
-         */
-        if (ASPEED_MACHINE(machine)->mmio_exec) {
-            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
-                                     &fl->mmio, 0, size);
-            memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
-                                        boot_rom);
-        } else {
+        if (!ASPEED_MACHINE(machine)->mmio_exec) {
             memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
                                    size, &error_abort);
             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bb2769df04..1bf1246148 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -21,6 +21,7 @@
 #define ASPEED_SOC_DPMCU_SIZE       0x00040000
 
 static const hwaddr aspeed_soc_ast2600_memmap[] = {
+    [ASPEED_DEV_SPI_BOOT]  = ASPEED_SOC_SPI_BOOT_ADDR,
     [ASPEED_DEV_SRAM]      = 0x10000000,
     [ASPEED_DEV_DPMCU]     = 0x18000000,
     /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
@@ -282,6 +283,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     qemu_irq irq;
     g_autofree char *sram_name = NULL;
 
+    /* Default boot region (SPI memory or ROMs) */
+    memory_region_init(&s->spi_boot_container, OBJECT(s),
+                       "aspeed.spi_boot_container", 0x10000000);
+    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SPI_BOOT],
+                                &s->spi_boot_container);
+
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
                                   sc->memmap[ASPEED_DEV_IOMEM],
@@ -431,6 +438,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
 
+    /* Set up an alias on the FMC CE0 region (boot default) */
+    MemoryRegion *fmc0_mmio = &s->fmc.flashes[0].mmio;
+    memory_region_init_alias(&s->spi_boot, OBJECT(s), "aspeed.spi_boot",
+                             fmc0_mmio, 0, memory_region_size(fmc0_mmio));
+    memory_region_add_subregion(&s->spi_boot_container, 0x0, &s->spi_boot);
+
     /* SPI */
     for (i = 0; i < sc->spis_num; i++) {
         object_property_set_link(OBJECT(&s->spi[i]), "dram",
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index e884d6badc..bf22258de9 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -25,6 +25,7 @@
 #define ASPEED_SOC_IOMEM_SIZE       0x00200000
 
 static const hwaddr aspeed_soc_ast2400_memmap[] = {
+    [ASPEED_DEV_SPI_BOOT]  =  ASPEED_SOC_SPI_BOOT_ADDR,
     [ASPEED_DEV_IOMEM]  = 0x1E600000,
     [ASPEED_DEV_FMC]    = 0x1E620000,
     [ASPEED_DEV_SPI1]   = 0x1E630000,
@@ -59,6 +60,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
 };
 
 static const hwaddr aspeed_soc_ast2500_memmap[] = {
+    [ASPEED_DEV_SPI_BOOT]  = ASPEED_SOC_SPI_BOOT_ADDR,
     [ASPEED_DEV_IOMEM]  = 0x1E600000,
     [ASPEED_DEV_FMC]    = 0x1E620000,
     [ASPEED_DEV_SPI1]   = 0x1E630000,
@@ -245,6 +247,12 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     g_autofree char *sram_name = NULL;
 
+    /* Default boot region (SPI memory or ROMs) */
+    memory_region_init(&s->spi_boot_container, OBJECT(s),
+                       "aspeed.spi_boot_container", 0x10000000);
+    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SPI_BOOT],
+                                &s->spi_boot_container);
+
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
                                   sc->memmap[ASPEED_DEV_IOMEM],
@@ -354,6 +362,12 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
 
+    /* Set up an alias on the FMC CE0 region (boot default) */
+    MemoryRegion *fmc0_mmio = &s->fmc.flashes[0].mmio;
+    memory_region_init_alias(&s->spi_boot, OBJECT(s), "aspeed.spi_boot",
+                             fmc0_mmio, 0, memory_region_size(fmc0_mmio));
+    memory_region_add_subregion(&s->spi_boot_container, 0x0, &s->spi_boot);
+
     /* SPI */
     for (i = 0; i < sc->spis_num; i++) {
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 90c04bbc33..f4600c290b 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -100,13 +100,7 @@ static void fby35_bmc_init(Fby35State *s)
         MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
         uint64_t size = memory_region_size(&fl->mmio);
 
-        if (s->mmio_exec) {
-            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
-                                     &fl->mmio, 0, size);
-            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
-                                        boot_rom);
-        } else {
-
+        if (!s->mmio_exec) {
             memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
                                    size, &error_abort);
             memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
-- 
2.39.2


