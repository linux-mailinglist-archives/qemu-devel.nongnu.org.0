Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A45972C2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:19:43 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKpa-000623-P3
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKeg-0004c9-DM; Wed, 17 Aug 2022 11:08:26 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKed-0002ly-22; Wed, 17 Aug 2022 11:08:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B348D746396;
 Wed, 17 Aug 2022 17:08:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EE8E374638A; Wed, 17 Aug 2022 17:08:18 +0200 (CEST)
Message-Id: <9b21bdf55e0a728f093bad299e030d98f302ded0.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 01/31] ppc/ppc4xx: Introduce a DCR device model
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:18 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

The Device Control Registers (DCR) of on-SoC devices are accessed by
software through the use of the mtdcr and mfdcr instructions. These
are converted in transactions on a side band bus, the DCR bus, which
connects the on-SoC devices to the CPU.

Ideally, we should model these accesses with a DCR namespace and DCR
memory regions but today the DCR handlers are installed in a DCR table
under the CPU. Instead, introduce a little device model wrapper to hold
a CPU link and handle registration of DCR handlers.

The DCR device inherits from SysBus because most of these devices also
have MMIO regions and/or IRQs. Being a SysBusDevice makes things easier
to install the device model in the overall SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: Explicit opaque parameter for dcr callbacks]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc4xx_devs.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc4xx.h | 17 +++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 069b511951..f4d7ae9567 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -664,3 +664,44 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
                          mal, &dcr_read_mal, &dcr_write_mal);
     }
 }
+
+/* PPC4xx_DCR_DEVICE */
+
+void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
+                         dcr_read_cb dcr_read, dcr_write_cb dcr_write)
+{
+    assert(dev->cpu);
+    ppc_dcr_register(&dev->cpu->env, dcrn, opaque, dcr_read, dcr_write);
+}
+
+bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
+                        Error **errp)
+{
+    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
+    return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
+}
+
+static Property ppc4xx_dcr_properties[] = {
+    DEFINE_PROP_LINK("cpu", Ppc4xxDcrDeviceState, cpu, TYPE_POWERPC_CPU,
+                     PowerPCCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    device_class_set_props(dc, ppc4xx_dcr_properties);
+}
+
+static const TypeInfo ppc4xx_types[] = {
+    {
+        .name           = TYPE_PPC4xx_DCR_DEVICE,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc4xxDcrDeviceState),
+        .class_init     = ppc4xx_dcr_class_init,
+        .abstract       = true,
+    }
+};
+
+DEFINE_TYPES(ppc4xx_types)
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 591e2421a3..a537a5567b 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -27,6 +27,7 @@
 
 #include "hw/ppc/ppc.h"
 #include "exec/memory.h"
+#include "hw/sysbus.h"
 
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         MemoryRegion ram_memories[],
@@ -44,4 +45,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
 
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
+/*
+ * Generic DCR device
+ */
+#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr-device"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
+struct Ppc4xxDcrDeviceState {
+    SysBusDevice parent_obj;
+
+    PowerPCCPU *cpu;
+};
+
+void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
+                         dcr_read_cb dcr_read, dcr_write_cb dcr_write);
+bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
+                        Error **errp);
+
 #endif /* PPC4XX_H */
-- 
2.30.4


