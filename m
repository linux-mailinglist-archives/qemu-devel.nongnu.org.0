Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F1358DB59
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 17:50:41 +0200 (CEST)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLRVA-0003OH-J2
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 11:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKL-0003vv-8S; Tue, 09 Aug 2022 11:39:31 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:55545
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKI-0004M6-8e; Tue, 09 Aug 2022 11:39:28 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M2HLJ27LKz4xTw;
 Wed, 10 Aug 2022 01:39:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M2HLG1vpJz4xTv;
 Wed, 10 Aug 2022 01:39:18 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 03/24] ppc/ppc405: Move devices under the ref405ep machine
Date: Tue,  9 Aug 2022 17:38:43 +0200
Message-Id: <20220809153904.485018-4-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809153904.485018-1-clg@kaod.org>
References: <20220809153904.485018-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=uImW=YN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_boards.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 96700be74d08..f4794ba40ce6 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -230,13 +230,11 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
     env->load_info = &boot_info;
 }
 
-static void ref405ep_init(MachineState *machine)
+static void ppc405_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *kernel_filename = machine->kernel_filename;
     PowerPCCPU *cpu;
-    DeviceState *dev;
-    SysBusDevice *s;
     MemoryRegion *sram = g_new(MemoryRegion, 1);
     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
     hwaddr ram_bases[2], ram_sizes[2];
@@ -294,15 +292,6 @@ static void ref405ep_init(MachineState *machine)
         memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), bios);
     }
 
-    /* Register FPGA */
-    ref405ep_fpga_init(sysmem, PPC405EP_FPGA_BASE);
-    /* Register NVRAM */
-    dev = qdev_new("sysbus-m48t08");
-    qdev_prop_set_int32(dev, "base-year", 1968);
-    s = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
-
     /* Load kernel and initrd using U-Boot images */
     if (kernel_filename && machine->firmware) {
         target_ulong kernel_base, initrd_base;
@@ -335,6 +324,23 @@ static void ref405ep_init(MachineState *machine)
     }
 }
 
+static void ref405ep_init(MachineState *machine)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+
+    ppc405_init(machine);
+
+    /* Register FPGA */
+    ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
+    /* Register NVRAM */
+    dev = qdev_new("sysbus-m48t08");
+    qdev_prop_set_int32(dev, "base-year", 1968);
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
+}
+
 static void ref405ep_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -354,6 +360,7 @@ static void ppc405_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "PPC405 generic machine";
+    mc->init = ppc405_init;
     mc->default_ram_size = 128 * MiB;
     mc->default_ram_id = "ppc405.ram";
 }
-- 
2.37.1


