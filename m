Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF2B51E958
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:12:43 +0200 (CEST)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPr8-0005LP-Uo
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlP-00059O-EL; Sat, 07 May 2022 15:06:47 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:44598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlN-0001YN-LO; Sat, 07 May 2022 15:06:47 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 o10-20020a4abe8a000000b0035eac0a004aso1831427oop.11; 
 Sat, 07 May 2022 12:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dpaTjFiYrghI3JitsDctayMbtGiCYEaddztQT51dquM=;
 b=fNVECFjzwy50cehAI/MVQ0ERPNUt5DVwEWOtTWevHGEYQJWZfEupf6rpJGVuULOu9t
 4wlcVyEToTlrNFu25nXLXMMxIFPUkuAs37DSSicusLKD8kiWMWzbAdFV+Fu6eScOUnaR
 brN6FuXgJEUwlBkAycHsjjj8rFKKxASzvuyGF60OTWWvUVW056bQkrBqpOvrhkJgHN0o
 2aINRcLpgAOarPXnDYZFbViLPjuxGV2G1InKXOz3PlzDczjiDCFqcOU8lkv8Whci78NR
 1M8tFox/cNcPmH+sXxC0lBi1Hk/xlrn4bQCv128AWuZi02b77mt6mYthOOpfeWlbaWIQ
 f9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dpaTjFiYrghI3JitsDctayMbtGiCYEaddztQT51dquM=;
 b=WQyvLxMLxN2o1H3QHe3l1ID4t3K+WNei0krAFdwaSWqa3bfDqdgdCCj5YrHc7hT4yU
 Jq0QKMYWF8Mjgrtw+EdlNmGwYPNyOAWmzqogck3rp3z2LDKJg5/Y3xHYEySjX6vn9TKp
 n8DPWp6oXYUjfswp/pgfdsFIXMSotcZTYxRvHmi4Wr9jfh6HxszgNLZYe2RHI5Dtvx/o
 +b19z+dwsfR7K0OitOQTXEILVL+ORuDTqcvJiNydg9OpaMRuR+ibLTnbEKU9yxzBhY8I
 Q2Badpi0N8yxxjGO0YKp7IdtNqiiW5pdCtdEczkXgLP9fqXBMpDrYdK2j21J9WBebQsi
 6FWQ==
X-Gm-Message-State: AOAM530CWnBFbh8dWjcclKj6NqlHBQjM4l0gKChQp0h30n+QZhH7ARdv
 8l8y5s3YOsk5CFksrLnuMi3QQrC/CwQ=
X-Google-Smtp-Source: ABdhPJyJnH5XfOyx8DUxXZE3Ndr/TFL8+u33MxQA6A4d0t/Q9CG7aLoSwmUxrNLrL4MaxjKHT+ZFzA==
X-Received: by 2002:a05:6820:1517:b0:35f:5a69:8cc0 with SMTP id
 ay23-20020a056820151700b0035f5a698cc0mr2498903oob.72.1651950404196; 
 Sat, 07 May 2022 12:06:44 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 05/17] ppc/pnv: add pnv-phb device
Date: Sat,  7 May 2022 16:06:12 -0300
Message-Id: <20220507190624.507419-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This device works as a generic pnv-phb that redirects the control flow
to one of the implemented PHB versions (PHB3 and PHB4 at this moment).

The control redirection happens in the instance_init() and realize()
callbacks, where we check which powernv machine we're running and
execute the PnvPHB3 callbacks if running powernv8 or PnvPHB4 if running
powernv9/10.  This will allow us to keep the existing PHB3 and PHB4 code
as is, just changing their device type to PnvPHB3/PnvPHB4 to PnvPHB when
we're ready.

For now we're putting logic to handle the PHB3 version. We'll add PHB4
later on.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/meson.build        |   3 +-
 hw/pci-host/pnv_phb.c          | 116 +++++++++++++++++++++++++++++++++
 hw/pci-host/pnv_phb3.c         |   4 +-
 include/hw/pci-host/pnv_phb3.h |   3 +
 4 files changed, 123 insertions(+), 3 deletions(-)
 create mode 100644 hw/pci-host/pnv_phb.c

diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index 4c4f39c15c..b4107b7a2a 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -32,5 +32,6 @@ specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
   'pnv_phb3_msi.c',
   'pnv_phb3_pbcq.c',
   'pnv_phb4.c',
-  'pnv_phb4_pec.c'
+  'pnv_phb4_pec.c',
+  'pnv_phb.c',
 ))
diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
new file mode 100644
index 0000000000..3dd08f768f
--- /dev/null
+++ b/hw/pci-host/pnv_phb.c
@@ -0,0 +1,116 @@
+/*
+ * QEMU PowerPC PowerNV Unified PHB model
+ *
+ * Copyright (c) 2022, IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/visitor.h"
+#include "qapi/error.h"
+#include "hw/pci-host/pnv_phb.h"
+#include "hw/pci/pcie_host.h"
+#include "hw/pci/pcie_port.h"
+#include "hw/ppc/pnv.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "qom/object.h"
+#include "sysemu/sysemu.h"
+
+
+static char *pnv_phb_get_chip_typename(void)
+{
+    Object *qdev_machine = qdev_get_machine();
+    PnvMachineState *pnv = PNV_MACHINE(qdev_machine);
+    MachineState *machine = MACHINE(pnv);
+    g_autofree char *chip_typename = NULL;
+    int i;
+
+    if (!machine->cpu_type) {
+        return NULL;
+    }
+
+    i = strlen(machine->cpu_type) - strlen(POWERPC_CPU_TYPE_SUFFIX);
+    chip_typename = g_strdup_printf(PNV_CHIP_TYPE_NAME("%.*s"),
+                                    i, machine->cpu_type);
+
+    return g_steal_pointer(&chip_typename);
+}
+
+static void pnv_phb_instance_init(Object *obj)
+{
+    g_autofree char *chip_typename = pnv_phb_get_chip_typename();
+
+    /*
+     * When doing command line instrospection we won't have
+     * a valid machine->cpu_type value.
+     */
+    if (!chip_typename) {
+        return;
+    }
+
+    if (!strcmp(chip_typename, TYPE_PNV_CHIP_POWER8) ||
+        !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8E) ||
+        !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8NVL)) {
+        pnv_phb3_instance_init(obj);
+    }
+}
+
+static void pnv_phb_realize(DeviceState *dev, Error **errp)
+{
+    g_autofree char *chip_typename = pnv_phb_get_chip_typename();
+
+    g_assert(chip_typename != NULL);
+
+    if (!strcmp(chip_typename, TYPE_PNV_CHIP_POWER8) ||
+        !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8E) ||
+        !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8NVL)) {
+        /* PnvPHB3 */
+        pnv_phb3_realize(dev, errp);
+    }
+}
+
+static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
+                                          PCIBus *rootbus)
+{
+    PnvPHB *phb = PNV_PHB(host_bridge);
+
+    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
+             phb->chip_id, phb->phb_id);
+    return phb->bus_path;
+}
+
+static Property pnv_phb_properties[] = {
+    DEFINE_PROP_UINT32("index", PnvPHB, phb_id, 0),
+    DEFINE_PROP_UINT32("chip-id", PnvPHB, chip_id, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pnv_phb_class_init(ObjectClass *klass, void *data)
+{
+    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    hc->root_bus_path = pnv_phb_root_bus_path;
+    dc->realize = pnv_phb_realize;
+    device_class_set_props(dc, pnv_phb_properties);
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->user_creatable = true;
+}
+
+static const TypeInfo pnv_phb_type_info = {
+    .name          = TYPE_PNV_PHB,
+    .parent        = TYPE_PCIE_HOST_BRIDGE,
+    .instance_size = sizeof(PnvPHB),
+    .class_init    = pnv_phb_class_init,
+    .instance_init = pnv_phb_instance_init,
+};
+
+static void pnv_phb_register_types(void)
+{
+    type_register_static(&pnv_phb_type_info);
+}
+
+type_init(pnv_phb_register_types)
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 70d92edd94..8e31a69083 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -966,7 +966,7 @@ static AddressSpace *pnv_phb3_dma_iommu(PCIBus *bus, void *opaque, int devfn)
     return &ds->dma_as;
 }
 
-static void pnv_phb3_instance_init(Object *obj)
+void pnv_phb3_instance_init(Object *obj)
 {
     PnvPHB3 *phb = PNV_PHB3(obj);
 
@@ -986,7 +986,7 @@ static void pnv_phb3_instance_init(Object *obj)
 
 }
 
-static void pnv_phb3_realize(DeviceState *dev, Error **errp)
+void pnv_phb3_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB3 *phb = PNV_PHB3(dev);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index b6b5f91684..aba26f4f7c 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -102,4 +102,7 @@ void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size);
 void pnv_phb3_update_regions(PnvPHB3 *phb);
 void pnv_phb3_remap_irqs(PnvPHB3 *phb);
 
+void pnv_phb3_instance_init(Object *obj);
+void pnv_phb3_realize(DeviceState *dev, Error **errp);
+
 #endif /* PCI_HOST_PNV_PHB3_H */
-- 
2.32.0


