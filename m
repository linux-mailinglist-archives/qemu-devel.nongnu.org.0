Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D261F8A17
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 20:30:40 +0200 (CEST)
Received: from localhost ([::1]:55384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkXOx-0000mC-23
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 14:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkXLM-000439-0h; Sun, 14 Jun 2020 14:26:56 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:52047)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkXLI-0007dC-SF; Sun, 14 Jun 2020 14:26:55 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1F66A745702;
 Sun, 14 Jun 2020 20:26:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B3EDF748DD8; Sun, 14 Jun 2020 20:26:43 +0200 (CEST)
Message-Id: <3d8c105ee2234d003dc65e25a07f568510829d0c.1592158400.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592158400.git.balaton@eik.bme.hu>
References: <cover.1592158400.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 5/9] mac_oldworld: Map macio to expected address at reset
Date: Sun, 14 Jun 2020 20:13:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/14 14:26:44
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

Add a reset function that maps macio to the address expected by the
firmware of the board at startup.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac.h          | 12 ++++++++++++
 hw/ppc/mac_oldworld.c | 17 +++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index a0d9e47031..e04288ddfd 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -55,6 +55,18 @@
 #define OLDWORLD_IDE1_IRQ      0xe
 #define OLDWORLD_IDE1_DMA_IRQ  0x3
 
+/* g3beige machine */
+#define TYPE_HEATHROW_MACHINE MACHINE_TYPE_NAME("g3beige")
+#define HEATHROW_MACHINE(obj) OBJECT_CHECK(HeathrowMachineState, (obj), \
+                                           TYPE_HEATHROW_MACHINE)
+
+typedef struct HeathrowMachineState {
+    /*< private >*/
+    MachineState parent;
+
+    PCIDevice *macio_pci;
+} HeathrowMachineState;
+
 /* New World IRQs */
 #define NEWWORLD_CUDA_IRQ      0x19
 #define NEWWORLD_PMU_IRQ       0x19
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 2afdef55aa..cb4a0f3211 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -73,6 +73,15 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
     return (addr & 0x0fffffff) + KERNEL_LOAD_ADDR;
 }
 
+static void ppc_heathrow_reset(MachineState *machine)
+{
+    HeathrowMachineState *m = HEATHROW_MACHINE(machine);
+
+    qemu_devices_reset();
+    pci_default_write_config(m->macio_pci, PCI_COMMAND, PCI_COMMAND_MEMORY, 2);
+    pci_default_write_config(m->macio_pci, PCI_BASE_ADDRESS_0, 0xf3000000, 4);
+}
+
 static void ppc_heathrow_cpu_reset(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
@@ -82,6 +91,7 @@ static void ppc_heathrow_cpu_reset(void *opaque)
 
 static void ppc_heathrow_init(MachineState *machine)
 {
+    HeathrowMachineState *hm = HEATHROW_MACHINE(machine);
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
@@ -289,7 +299,8 @@ static void ppc_heathrow_init(MachineState *machine)
     ide_drive_get(hd, ARRAY_SIZE(hd));
 
     /* MacIO */
-    macio = OLDWORLD_MACIO(pci_create(pci_bus, -1, TYPE_OLDWORLD_MACIO));
+    hm->macio_pci = pci_create(pci_bus, -1, TYPE_OLDWORLD_MACIO);
+    macio = OLDWORLD_MACIO(hm->macio_pci);
     dev = DEVICE(macio);
     qdev_prop_set_uint64(dev, "frequency", tbfreq);
     object_property_set_link(OBJECT(macio), OBJECT(pic_dev), "pic",
@@ -441,6 +452,7 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Heathrow based PowerMAC";
     mc->init = ppc_heathrow_init;
+    mc->reset = ppc_heathrow_reset;
     mc->block_default_type = IF_IDE;
     mc->max_cpus = MAX_CPUS;
 #ifndef TARGET_PPC64
@@ -457,9 +469,10 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
 }
 
 static const TypeInfo ppc_heathrow_machine_info = {
-    .name          = MACHINE_TYPE_NAME("g3beige"),
+    .name          = TYPE_HEATHROW_MACHINE,
     .parent        = TYPE_MACHINE,
     .class_init    = heathrow_class_init,
+    .instance_size = sizeof(HeathrowMachineState),
     .interfaces = (InterfaceInfo[]) {
         { TYPE_FW_PATH_PROVIDER },
         { }
-- 
2.21.3


