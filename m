Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817246A6427
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 01:19:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXAA1-0008LQ-7v; Tue, 28 Feb 2023 19:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXA9n-0008HY-3g; Tue, 28 Feb 2023 19:17:19 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXA9k-0001i3-Fn; Tue, 28 Feb 2023 19:17:18 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8A81F7466FF;
 Wed,  1 Mar 2023 01:17:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4F1D5746335; Wed,  1 Mar 2023 01:17:10 +0100 (CET)
Message-Id: <a51b8b647d3b297c794739a862d3565e3e5ed882.1677628524.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677628524.git.balaton@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 4/7] hw/ppc/pegasos2: Fix PCI interrupt routing
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Date: Wed,  1 Mar 2023 01:17:10 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

According to the PegasosII schematics the PCI interrupt lines are
connected to both the gpp pins of the Mv64361 north bridge and the
PINT pins of the VT8231 south bridge so guests can get interrupts from
either of these. So far we only had the MV64361 connections which
worked for on board devices but for additional PCI devices (such as
network or sound card added with -device) guest OSes expect interrupt
from the ISA IRQ 9 where the firmware routes these PCI interrupts in
VT8231 ISA bridge. After the previous patches we can now model this
and also remove the board specific connection from mv64361. Also
configure routing of these lines when using Virtual Open Firmware to
match board firmware for guests that expect this.

This fixes PCI interrupts on pegasos2 under Linux, MorphOS and AmigaOS.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/mv64361.c |  4 ----
 hw/ppc/pegasos2.c     | 26 +++++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index 298564f1f5..19e8031a3f 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -873,10 +873,6 @@ static void mv64361_realize(DeviceState *dev, Error **errp)
     }
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cpu_irq);
     qdev_init_gpio_in_named(dev, mv64361_gpp_irq, "gpp", 32);
-    /* FIXME: PCI IRQ connections may be board specific */
-    for (i = 0; i < PCI_NUM_PINS; i++) {
-        s->pci[1].irq[i] = qdev_get_gpio_in_named(dev, "gpp", 12 + i);
-    }
 }
 
 static void mv64361_reset(DeviceState *dev)
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 7cc375df05..f1650be5ee 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -73,6 +73,8 @@ struct Pegasos2MachineState {
     MachineState parent_obj;
     PowerPCCPU *cpu;
     DeviceState *mv;
+    qemu_irq mv_pirq[PCI_NUM_PINS];
+    qemu_irq via_pirq[PCI_NUM_PINS];
     Vof *vof;
     void *fdt_blob;
     uint64_t kernel_addr;
@@ -95,6 +97,15 @@ static void pegasos2_cpu_reset(void *opaque)
     }
 }
 
+static void pegasos2_pci_irq(void *opaque, int n, int level)
+{
+    Pegasos2MachineState *pm = opaque;
+
+    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
+    qemu_set_irq(pm->mv_pirq[n], level);
+    qemu_set_irq(pm->via_pirq[n], level);
+}
+
 static void pegasos2_init(MachineState *machine)
 {
     Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
@@ -106,7 +117,7 @@ static void pegasos2_init(MachineState *machine)
     I2CBus *i2c_bus;
     const char *fwname = machine->firmware ?: PROM_FILENAME;
     char *filename;
-    int sz;
+    int i, sz;
     uint8_t *spd_data;
 
     /* init CPU */
@@ -156,11 +167,18 @@ static void pegasos2_init(MachineState *machine)
     /* Marvell Discovery II system controller */
     pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
                           qdev_get_gpio_in(DEVICE(pm->cpu), PPC6xx_INPUT_INT)));
+    for (i = 0; i < PCI_NUM_PINS; i++) {
+        pm->mv_pirq[i] = qdev_get_gpio_in_named(pm->mv, "gpp", 12 + i);
+    }
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
+    pci_bus_irqs(pci_bus, pegasos2_pci_irq, pm, PCI_NUM_PINS);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
     via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
                                                  true, TYPE_VT8231_ISA));
+    for (i = 0; i < PCI_NUM_PINS; i++) {
+        pm->via_pirq[i] = qdev_get_gpio_in_named(DEVICE(via), "pirq", i);
+    }
     object_property_add_alias(OBJECT(machine), "rtc-time",
                               object_resolve_path_component(via, "rtc"),
                               "date");
@@ -267,6 +285,12 @@ static void pegasos2_machine_reset(MachineState *machine, ShutdownCause reason)
                               PCI_INTERRUPT_LINE, 2, 0x9);
     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
                               0x50, 1, 0x2);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x55, 1, 0x90);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x56, 1, 0x99);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x57, 1, 0x90);
 
     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x109);
-- 
2.30.8


