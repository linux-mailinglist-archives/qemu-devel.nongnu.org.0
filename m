Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C894858C6AC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 12:44:37 +0200 (CEST)
Received: from localhost ([::1]:60282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0FQ-0007WZ-Tr
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 06:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzS-0005OR-QM; Mon, 08 Aug 2022 06:28:06 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzQ-0001RG-NJ; Mon, 08 Aug 2022 06:28:06 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M1XTb4n7qz4x1K;
 Mon,  8 Aug 2022 20:28:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M1XTY4X7jz4xTy;
 Mon,  8 Aug 2022 20:28:01 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 08/22] ppc/ppc4xx: Introduce a DCR device model
Date: Mon,  8 Aug 2022 12:27:20 +0200
Message-Id: <20220808102734.133084-9-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808102734.133084-1-clg@kaod.org>
References: <20220808102734.133084-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=c6th=YM=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The Device Control Registers (DCR) of on-SoC devices are accessed by
software through the use of the mtdcr and mfdcr instructions. These
are converted in transactions on a side band bus, the DCR bus, which
connects the on-SoC devices to the CPU.

Ideally, we should model these accesses with a DCR namespace and DCR
memory regions but today the DCR handlers are installed in a DCR table
under the CPU. Instead introduce a little device model wrapper to hold
a CPU link and handle registration of DCR handlers.

The DCR device inherits from SysBus because most of these devices also
have a MMIO regions and/or IRQs. Being a SysBusDevice makes things
easier to install the device model in the overall SoC.

The "cpu" link should be considered as modeling the piece of HW logic
connecting the device to the DCR bus.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/ppc4xx.h | 17 +++++++++++++++
 hw/ppc/ppc4xx_devs.c    | 46 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 021376c2d260..bb373db0ba10 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -27,6 +27,7 @@
 
 #include "hw/ppc/ppc.h"
 #include "exec/memory.h"
+#include "hw/sysbus.h"
 
 /* PowerPC 4xx core initialization */
 void ppc4xx_reset(void *opaque);
@@ -50,4 +51,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
 
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
+/*
+ * Generic DCR device
+ */
+#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
+struct Ppc4xxDcrDeviceState {
+    SysBusDevice parent_obj;
+
+    PowerPCCPU *cpu;
+};
+
+void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
+                         dcr_read_cb dcr_read, dcr_write_cb dcr_write);
+bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
+                        Error **errp);
+
 #endif /* PPC4XX_H */
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index f20098cf417c..e07bdba0f912 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -696,3 +696,49 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
                          mal, &dcr_read_mal, &dcr_write_mal);
     }
 }
+
+void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
+                         dcr_read_cb dcr_read, dcr_write_cb dcr_write)
+{
+    CPUPPCState *env;
+
+    assert(dev->cpu);
+
+    env = &dev->cpu->env;
+
+    ppc_dcr_register(env, dcrn, dev, dcr_read, dcr_write);
+}
+
+bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
+                        Error **errp)
+{
+    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
+    return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
+}
+
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
+    dc->user_creatable = false;
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
-- 
2.37.1


