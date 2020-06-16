Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91151FB2FE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 15:57:01 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlC5E-0000Gp-Nk
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 09:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jlC1n-00021G-5F; Tue, 16 Jun 2020 09:53:27 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:36217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jlC1l-0002Pz-DZ; Tue, 16 Jun 2020 09:53:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5CA94748DC8;
 Tue, 16 Jun 2020 15:53:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C8CED748DCF; Tue, 16 Jun 2020 15:53:17 +0200 (CEST)
Message-Id: <a0b567bf6e5b266a19de4eb6f6551270ffe2ce7b.1592315226.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592315226.git.balaton@eik.bme.hu>
References: <cover.1592315226.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 07/11] mac_oldworld: Map macio to expected address at reset
Date: Tue, 16 Jun 2020 15:47:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 09:53:23
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
 hw/ppc/mac_oldworld.c | 15 ++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index a0d9e47031..79ccf8775d 100644
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
+    PCIDevice *macio;
+} HeathrowMachineState;
+
 /* New World IRQs */
 #define NEWWORLD_CUDA_IRQ      0x19
 #define NEWWORLD_PMU_IRQ       0x19
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index f97f241e0c..13562e26e6 100644
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
+    pci_default_write_config(m->macio, PCI_COMMAND, PCI_COMMAND_MEMORY, 2);
+    pci_default_write_config(m->macio, PCI_BASE_ADDRESS_0, 0xf3000000, 4);
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
     const char *boot_device = machine->boot_order;
     PowerPCCPU *cpu = NULL;
@@ -287,6 +297,7 @@ static void ppc_heathrow_init(MachineState *machine)
 
     /* MacIO */
     macio = pci_new(-1, TYPE_OLDWORLD_MACIO);
+    hm->macio = macio;
     dev = DEVICE(macio);
     qdev_prop_set_uint64(dev, "frequency", tbfreq);
     object_property_set_link(OBJECT(macio), OBJECT(pic_dev), "pic",
@@ -439,6 +450,7 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Heathrow based PowerMAC";
     mc->init = ppc_heathrow_init;
+    mc->reset = ppc_heathrow_reset;
     mc->block_default_type = IF_IDE;
     mc->max_cpus = MAX_CPUS;
 #ifndef TARGET_PPC64
@@ -455,9 +467,10 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
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


