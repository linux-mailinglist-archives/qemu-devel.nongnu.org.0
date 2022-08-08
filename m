Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B7258C697
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 12:39:18 +0200 (CEST)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0AG-0000BZ-Nf
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 06:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzK-0004wL-OQ; Mon, 08 Aug 2022 06:27:58 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:35129
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzJ-0001QK-2p; Mon, 08 Aug 2022 06:27:58 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M1XTP3Ny5z4xTx;
 Mon,  8 Aug 2022 20:27:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M1XTM31Smz4xTw;
 Mon,  8 Aug 2022 20:27:51 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 04/22] ppc/ppc405: Move SRAM under the ref405ep machine
Date: Mon,  8 Aug 2022 12:27:16 +0200
Message-Id: <20220808102734.133084-5-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808102734.133084-1-clg@kaod.org>
References: <20220808102734.133084-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=c6th=YM=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

It doesn't belong to the generic machine nor the SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_boards.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index f4794ba40ce6..c6fa559b03d9 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -235,7 +235,6 @@ static void ppc405_init(MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *kernel_filename = machine->kernel_filename;
     PowerPCCPU *cpu;
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
     hwaddr ram_bases[2], ram_sizes[2];
     MemoryRegion *sysmem = get_system_memory();
@@ -260,11 +259,6 @@ static void ppc405_init(MachineState *machine)
     cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
 
-    /* allocate SRAM */
-    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
-                           &error_fatal);
-    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
-
     /* allocate and load BIOS */
     if (machine->firmware) {
         MemoryRegion *bios = g_new(MemoryRegion, 1);
@@ -328,9 +322,16 @@ static void ref405ep_init(MachineState *machine)
 {
     DeviceState *dev;
     SysBusDevice *s;
+    MemoryRegion *sram = g_new(MemoryRegion, 1);
+    MemoryRegion *sysmem = get_system_memory();
 
     ppc405_init(machine);
 
+    /* allocate SRAM */
+    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
+                           &error_fatal);
+    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
+
     /* Register FPGA */
     ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
     /* Register NVRAM */
-- 
2.37.1


