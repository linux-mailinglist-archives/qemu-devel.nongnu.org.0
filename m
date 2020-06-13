Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4711F8388
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jun 2020 15:47:18 +0200 (CEST)
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jk6VB-0004Da-0l
	for lists+qemu-devel@lfdr.de; Sat, 13 Jun 2020 09:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jk6TG-0002UQ-0P; Sat, 13 Jun 2020 09:45:18 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:47677)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jk6TD-0002VI-9X; Sat, 13 Jun 2020 09:45:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D0D83748DDE;
 Sat, 13 Jun 2020 15:45:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2884B7475FA; Sat, 13 Jun 2020 15:45:00 +0200 (CEST)
Message-Id: <ec667da39b204cecd641456dbe486480e7ba2bd0.1592055375.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592055375.git.balaton@eik.bme.hu>
References: <cover.1592055375.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 2/5] mac_oldworld: Add machine ID register
Date: Sat, 13 Jun 2020 15:36:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 09:45:00
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

The G3 beige machine has a machine ID register that is accessed by the
firmware to deternine the board config. Add basic emulation of it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_oldworld.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 3812adc441..4dd872c1a3 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -80,6 +80,15 @@ static void ppc_heathrow_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
+static uint64_t machine_id_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return (addr == 0 && size == 2 ? 0x3d8c : 0);
+}
+
+const MemoryRegionOps machine_id_reg_ops = {
+    .read = machine_id_read,
+};
+
 static void ppc_heathrow_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
@@ -93,6 +102,7 @@ static void ppc_heathrow_init(MachineState *machine)
     char *filename;
     int linux_boot, i;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
+    MemoryRegion *machine_id = g_new(MemoryRegion, 1);
     uint32_t kernel_base, initrd_base, cmdline_base = 0;
     int32_t kernel_size, initrd_size;
     PCIBus *pci_bus;
@@ -227,6 +237,10 @@ static void ppc_heathrow_init(MachineState *machine)
         }
     }
 
+    memory_region_init_io(machine_id, OBJECT(machine), &machine_id_reg_ops,
+                          NULL, "machine_id", 2);
+    memory_region_add_subregion(get_system_memory(), 0xff000004, machine_id);
+
     /* XXX: we register only 1 output pin for heathrow PIC */
     pic_dev = qdev_create(NULL, TYPE_HEATHROW);
     qdev_init_nofail(pic_dev);
-- 
2.21.3


