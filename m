Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB83A5A94
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 23:19:22 +0200 (CEST)
Received: from localhost ([::1]:52364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsXVp-00018i-UT
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 17:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXTA-0005np-Mw
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:16:36 -0400
Received: from mr85p00im-ztdg06021101.me.com ([17.58.23.180]:55210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXT8-0001SR-IE
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623618993; bh=Y20/OnA1InddzQnxJH5sFn3MzAD/qYzwhMkzYe+90t4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=GXEL8YNL1D0tH8nbaqAGz991VDRFemY+TPjcAgGhfwFExoMeKdxThsWkFXR1qLqrv
 6ifPiFm5p4BsUnXJjw5hTemIfKA7Fzd8Zx71dOxYJ7xa8m9/X0rL9mvl1UnGLy85Yz
 npgCdQWGguoSrlf3nazKJNtUtmt+gObKjfq+to/gPm5d5LN7fEekDHWzTekCuq6ojp
 jBU1n6ogX4qFd+a6rIQRZdMPAJ/3a2WoB21tDZ8DhhrA1OO8ExlzuakywxLbEeB/bg
 wW+KT4MRDK8kC6d59JgzvmCKtpocMJ23vLUNHV6PAH5zEt/AlPcGoBK7lkjbuhew/s
 22bYiwdNviYRQ==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06021101.me.com (Postfix) with ESMTPSA id EFCEE340137;
 Sun, 13 Jun 2021 21:16:32 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>,
	richard.henderson@linaro.org
Subject: [PATCH 3/4] alpha: Provide a PCI-ISA bridge device node for guest
 OS's that expect it
Date: Sun, 13 Jun 2021 14:15:48 -0700
Message-Id: <20210613211549.18094-4-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210613211549.18094-1-thorpej@me.com>
References: <20210613211549.18094-1-thorpej@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-13=5F09:2021-06-11=5F06,2021-06-13=5F09,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106130151
Received-SPF: pass client-ip=17.58.23.180; envelope-from=thorpej@me.com;
 helo=mr85p00im-ztdg06021101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Provide a PCI device node at ID 7 for the PCI-ISA bridge.  Even though
Tsunami/Typhoon systems would have used a different chip (Cypress or ALI),
for simplicity we model the Intel i82378, which was also used on several
Alpha models.  This is needed for some operating systems that only probe
ISA devices if a PCI-ISA or PCI-EISA bridge is found.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 hw/alpha/typhoon.c | 111 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 2 deletions(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index fa31a2f286..de01828d23 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -919,11 +919,32 @@ PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
     /* Pchip1 PCI I/O, 0x802.FC00.0000, 32MB.  */
     /* Pchip1 PCI configuration, 0x802.FE00.0000, 16MB.  */
 
-    /* Init the ISA bus.  */
-    /* ??? Technically there should be a cy82c693ub pci-isa bridge.  */
+    /* Init the PCI-ISA bridge.  Technically, PCI-based Alphas shipped
+       with one of three different PCI-ISA bridges:
+
+       - Intel i82378 SIO
+       - Cypress CY82c693UB
+       - ALI M1533
+
+       (An Intel i82375 PCI-EISA bridge was also used on some models.)
+
+       For simplicity, we model an i82378 here, even though it wouldn't
+       have been on any Tsunami/Typhoon systems; it's close enough, and
+       we don't want to deal with modelling the CY82c693UB (which has
+       incompatible edge/level control registers, plus other peripherals
+       like IDE and USB) or the M1533 (which also has IDE and USB).
+
+       Importantly, we need to provide a PCI device node for it, otherwise
+       some operating systems won't notice there's an ISA bus to configure.
+
+       ??? We are using a private, stripped-down implementation of i82378
+       so that we can handle the way the ISA interrupts are wired up on
+       Tsunami/Typhoon systems.  */
     {
         qemu_irq *isa_irqs;
 
+        pci_create_simple(b, PCI_DEVFN(7, 0), "i82378-typhoon");
+
         *isa_bus = isa_bus_new(NULL, get_system_memory(), &s->pchip.reg_io,
                                &error_abort);
         isa_irqs = i8259_init(*isa_bus,
@@ -954,10 +975,96 @@ static const TypeInfo typhoon_iommu_memory_region_info = {
     .class_init = typhoon_iommu_memory_region_class_init,
 };
 
+/* The following was copied from hw/isa/i82378.c and modified to provide
+   only the minimal PCI device node.  */
+
+/*
+ * QEMU Intel i82378 emulation (PCI to ISA bridge)
+ *
+ * Copyright (c) 2010-2011 Herv\xc3\xa9 Poussineau
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "migration/vmstate.h"
+
+#define TYPE_I82378 "i82378-typhoon"
+#define I82378(obj) \
+    OBJECT_CHECK(I82378State, (obj), TYPE_I82378)
+
+typedef struct I82378State {
+    PCIDevice parent_obj;
+} I82378State;
+
+static const VMStateDescription vmstate_i82378 = {
+    .name = "pci-i82378-typhoon",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(parent_obj, I82378State),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void i82378_realize(PCIDevice *pci, Error **errp)
+{
+    uint8_t *pci_conf;
+
+    pci_conf = pci->config;
+    pci_set_word(pci_conf + PCI_COMMAND,
+                 PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
+    pci_set_word(pci_conf + PCI_STATUS,
+                 PCI_STATUS_DEVSEL_MEDIUM);
+
+    pci_config_set_interrupt_pin(pci_conf, 1); /* interrupt pin 0 */
+}
+
+static void i82378_init(Object *obj)
+{
+}
+
+static void i82378_class_init(ObjectClass *klass, void *data)
+{
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    k->realize = i82378_realize;
+    k->vendor_id = PCI_VENDOR_ID_INTEL;
+    k->device_id = PCI_DEVICE_ID_INTEL_82378;
+    k->revision = 0x03;
+    k->class_id = PCI_CLASS_BRIDGE_ISA;
+    dc->vmsd = &vmstate_i82378;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+}
+
+static const TypeInfo i82378_typhoon_type_info = {
+    .name = TYPE_I82378,
+    .parent = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(I82378State),
+    .instance_init = i82378_init,
+    .class_init = i82378_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
 static void typhoon_register_types(void)
 {
     type_register_static(&typhoon_pcihost_info);
     type_register_static(&typhoon_iommu_memory_region_info);
+    type_register_static(&i82378_typhoon_type_info);
 }
 
 type_init(typhoon_register_types)
-- 
2.30.2


