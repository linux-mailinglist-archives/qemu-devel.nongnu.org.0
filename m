Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D205520D585
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 21:28:54 +0200 (CEST)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpzSX-0001Bc-BZ
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 15:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jpzRE-00080u-TA; Mon, 29 Jun 2020 15:27:32 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jpzRC-0002Ga-Cs; Mon, 29 Jun 2020 15:27:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 866A2748DCD;
 Mon, 29 Jun 2020 21:27:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1004E7482CD; Mon, 29 Jun 2020 21:27:18 +0200 (CEST)
Message-Id: <8ece4381702aa5d5f004616e1818dd9b33dab620.1593456926.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1593456926.git.balaton@eik.bme.hu>
References: <cover.1593456926.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 3/8] mac_oldworld: Drop a variable, use get_system_memory()
 directly
Date: Mon, 29 Jun 2020 20:55:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 15:27:18
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Half of the occurances already use get_system_memory() directly
instead of sysmem variable, convert the two other uses to
get_system_memory() too which seems to be more common and drop the
variable.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_oldworld.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index baf3da6f90..d1c4244b1e 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -87,7 +87,6 @@ static void ppc_heathrow_init(MachineState *machine)
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
     const char *boot_device = machine->boot_order;
-    MemoryRegion *sysmem = get_system_memory();
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
     char *filename;
@@ -128,12 +127,12 @@ static void ppc_heathrow_init(MachineState *machine)
         exit(1);
     }
 
-    memory_region_add_subregion(sysmem, 0, machine->ram);
+    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
 
     /* allocate and load firmware ROM */
     memory_region_init_rom(bios, NULL, "ppc_heathrow.bios", PROM_SIZE,
                            &error_fatal);
-    memory_region_add_subregion(sysmem, PROM_BASE, bios);
+    memory_region_add_subregion(get_system_memory(), PROM_BASE, bios);
 
     if (!bios_name) {
         bios_name = PROM_FILENAME;
-- 
2.21.3


