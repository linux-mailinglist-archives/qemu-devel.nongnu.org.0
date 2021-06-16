Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CF43A9D5F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:17:01 +0200 (CEST)
Received: from localhost ([::1]:52482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWLk-0002tb-JC
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1ltWKg-0001s8-4P
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:15:54 -0400
Received: from mr85p00im-zteg06022001.me.com ([17.58.23.193]:40301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1ltWKd-0003eq-Ow
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623852950; bh=3vhLpjjFzzmIPvBB+GPhfEzo1rCON43sjtS2afhfs9U=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=IbL/RIsQ8Gqe63P01YO018XOeRfI1fHrir0J64fgcY7rtu+x9gB6oIDtJVr6Raia3
 TmnR3ZDBFcji2QWKiZ0qFuHIZoLZxc5sqiMNDBf9Vl/4JWrQklcDC9oqV1z0Th0xX/
 kqPGBCrE3V+5IdhPktnBAYNa6uyk8kGhwc6HbF5bawYs38rdoSOfqxp25Dk1NlpE77
 jGeoywNARn8WVkAKnTPHnHNLlTOWuGJhJ7sFNoj9dR2utISZnbCwDGjYx41sq05LUN
 Fh+gWwQ+LHweSE04zXDv5y0b2kRwB9WdKTyekbCrBMLBQqZ22DkBPvsCb5PCa8642o
 a/w6c65Rk1Xug==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-zteg06022001.me.com (Postfix) with ESMTPSA id 9155A38084F;
 Wed, 16 Jun 2021 14:15:49 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>,
	richard.henderson@linaro.org
Subject: [PATCH v2] alpha: Provide a PCI-ISA bridge device node for guest OS's
 that expect one
Date: Wed, 16 Jun 2021 07:15:38 -0700
Message-Id: <20210616141538.25436-1-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-16=5F05:2021-06-15=5F02,2021-06-16=5F05,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106160083
Received-SPF: pass client-ip=17.58.23.193; envelope-from=thorpej@me.com;
 helo=mr85p00im-zteg06022001.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Move initialization of the ISA bus from typhoon_init() to clipper_init();
  this apsect of device topology is really associated with the individual
  model, not the core logic chipset.  typhoon_init() now returns the IRQ
  to use for the output of the ISA PIC.

- In clipper_init(), instantiate an i82378 instance, and connect its
  PIC output to the ISA IRQ input provided by typhoon_init().  Remove
  the explicit instantiations of i8254 and i82374, as these devices
  are subsumed by the i82378.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 hw/alpha/Kconfig     |  1 +
 hw/alpha/alpha_sys.h |  2 +-
 hw/alpha/dp264.c     | 36 ++++++++++++++++++++++++++++++------
 hw/alpha/typhoon.c   | 19 ++++---------------
 4 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/hw/alpha/Kconfig b/hw/alpha/Kconfig
index 15c59ff264..e907a052c3 100644
--- a/hw/alpha/Kconfig
+++ b/hw/alpha/Kconfig
@@ -4,6 +4,7 @@ config DP264
     imply TEST_DEVICES
     imply E1000_PCI
     select I82374
+    select I82378
     select I8254
     select I8259
     select IDE_CMD646
diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index 4835b3d5ee..2263e821da 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -10,7 +10,7 @@
 #include "hw/intc/i8259.h"
 
 
-PCIBus *typhoon_init(MemoryRegion *, ISABus **, qemu_irq *, AlphaCPU *[4],
+PCIBus *typhoon_init(MemoryRegion *, qemu_irq *, qemu_irq *, AlphaCPU *[4],
                      pci_map_irq_fn, uint8_t devfn_min);
 
 /* alpha_pci.c.  */
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index d86dcb1d81..3e279a8c2a 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -58,8 +58,10 @@ static void clipper_init(MachineState *machine)
     AlphaCPU *cpus[4];
     PCIBus *pci_bus;
     PCIDevice *pci_dev;
+    DeviceState *i82378_dev;
     ISABus *isa_bus;
     qemu_irq rtc_irq;
+    qemu_irq isa_irq;
     long size, i;
     char *palcode_filename;
     uint64_t palcode_entry;
@@ -89,14 +91,39 @@ static void clipper_init(MachineState *machine)
 
     /* Init the chipset.  Because we're using CLIPPER IRQ mappings,
        the minimum PCI device IdSel is 1.  */
-    pci_bus = typhoon_init(machine->ram, &isa_bus, &rtc_irq, cpus,
+    pci_bus = typhoon_init(machine->ram, &isa_irq, &rtc_irq, cpus,
                            clipper_pci_map_irq, PCI_DEVFN(1, 0));
 
+    /*
+     * Init the PCI -> ISA bridge.
+     *
+     * Technically, PCI-based Alphas shipped with one of three different
+     * PCI-ISA bridges:
+     *
+     * - Intel i82378 SIO
+     * - Cypress CY82c693UB
+     * - ALI M1533
+     *
+     * (An Intel i82375 PCI-EISA bridge was also used on some models.)
+     *
+     * For simplicity, we model an i82378 here, even though it wouldn't
+     * have been on any Tsunami/Typhoon systems; it's close enough, and
+     * we don't want to deal with modelling the CY82c693UB (which has
+     * incompatible edge/level control registers, plus other peripherals
+     * like IDE and USB) or the M1533 (which also has IDE and USB).
+     *
+     * Importantly, we need to provide a PCI device node for it, otherwise
+     * some operating systems won't notice there's an ISA bus to configure.
+     */
+    i82378_dev = DEVICE(pci_create_simple(pci_bus, PCI_DEVFN(7, 0), "i82378"));
+    isa_bus = ISA_BUS(qdev_get_child_bus(i82378_dev, "isa.0"));
+
+    /* Connect the ISA PIC to the Typhoon IRQ used for ISA interrupts. */
+    qdev_connect_gpio_out(i82378_dev, 0, isa_irq);
+
     /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
     mc146818_rtc_init(isa_bus, 1900, rtc_irq);
 
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
-
     /* VGA setup.  Don't bother loading the bios.  */
     pci_vga_init(pci_bus);
 
@@ -105,9 +132,6 @@ static void clipper_init(MachineState *machine)
         pci_nic_init_nofail(&nd_table[i], pci_bus, "e1000", NULL);
     }
 
-    /* 2 82C37 (dma) */
-    isa_create_simple(isa_bus, "i82374");
-
     /* Super I/O */
     isa_create_simple(isa_bus, TYPE_SMC37C669_SUPERIO);
 
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index fa31a2f286..bd39c8ca86 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -814,9 +814,9 @@ static void typhoon_alarm_timer(void *opaque)
     cpu_interrupt(CPU(s->cchip.cpu[cpu]), CPU_INTERRUPT_TIMER);
 }
 
-PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
-                     AlphaCPU *cpus[4], pci_map_irq_fn sys_map_irq,
-                     uint8_t devfn_min)
+PCIBus *typhoon_init(MemoryRegion *ram, qemu_irq *p_isa_irq,
+                     qemu_irq *p_rtc_irq, AlphaCPU *cpus[4],
+                     pci_map_irq_fn sys_map_irq, uint8_t devfn_min)
 {
     MemoryRegion *addr_space = get_system_memory();
     DeviceState *dev;
@@ -844,6 +844,7 @@ PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
         }
     }
 
+    *p_isa_irq = qemu_allocate_irq(typhoon_set_isa_irq, s, 0);
     *p_rtc_irq = qemu_allocate_irq(typhoon_set_timer_irq, s, 0);
 
     /* Main memory region, 0x00.0000.0000.  Real hardware supports 32GB,
@@ -919,18 +920,6 @@ PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
     /* Pchip1 PCI I/O, 0x802.FC00.0000, 32MB.  */
     /* Pchip1 PCI configuration, 0x802.FE00.0000, 16MB.  */
 
-    /* Init the ISA bus.  */
-    /* ??? Technically there should be a cy82c693ub pci-isa bridge.  */
-    {
-        qemu_irq *isa_irqs;
-
-        *isa_bus = isa_bus_new(NULL, get_system_memory(), &s->pchip.reg_io,
-                               &error_abort);
-        isa_irqs = i8259_init(*isa_bus,
-                              qemu_allocate_irq(typhoon_set_isa_irq, s, 0));
-        isa_bus_irqs(*isa_bus, isa_irqs);
-    }
-
     return b;
 }
 
-- 
2.30.2


