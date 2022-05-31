Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DEA53991A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:53:34 +0200 (CEST)
Received: from localhost ([::1]:59846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9nx-0004Je-7u
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9k5-0000PZ-H7; Tue, 31 May 2022 17:49:33 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:37777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9k3-0003Kv-Kc; Tue, 31 May 2022 17:49:33 -0400
Received: by mail-oi1-x235.google.com with SMTP id s188so198370oie.4;
 Tue, 31 May 2022 14:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y/l3aFhWfMgz1DksEB6yo5ZEcVK6bbfjAh8obfrgZsc=;
 b=BCYEJXE/5hjVGv5Cf8cmo/lsbzUinF08memQqS5uvOpxtZiV1A2KLMzl8bs1Yt/zj6
 yETBd5zJO/vjmBkSq+A8VsK/jPya9vnmW49OPiUomuw19rzzOW+3wcqzZMnOuNJYswJS
 LOmi6nN8GpCCU/PSd2g4jYLkECl94xVc75xnSbc5qm6RIV3/EjTjJnIA+FG7oFx6eHm9
 Hzg4yF6ezkNG7TNZPGtRLLXUhS+pT6H61eA1YdiEcCFSeB6MLr16JfVZykYpX0SC2bYA
 +Txfhq9BHlJzsvib3LRPdUpBR3h5HcXeQfltHvZ9hn6SblpO5HRpoQlc2E1xG9d9MYTS
 2nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/l3aFhWfMgz1DksEB6yo5ZEcVK6bbfjAh8obfrgZsc=;
 b=nG+ck79AONIk889nsaut/X3iajRDhNbCwXsF//7vN+UO+sS8ijZzfF4ifu5Fa9UgAf
 al1mQn4ov9+TXH+qm5zH2ID+WLOYf5oa+qaVmJIvdto+4CWA9DQr+zHXrYqHWBTvBICO
 QJKXrzNl1I/qJa2ZQAGki2Dtp7R0lqppnE/E3lfoTK7+70Bj7u3JxD46n2Q48IeQ268P
 u7tCuxLwzREDNAQTjAKSlNLfjT5FH/cSYezJE+sgjAl1JPNRtAGkttUZEFGNt6xz4+PV
 zfetMyQWEPx41QCg6kHIHG20N21uxDtE97lqYitF3Cd3oYYQ8NSPuwn3xBe4ZeYuFAZz
 2IVA==
X-Gm-Message-State: AOAM530s0H5t2FZjATecuUtLhx7CTcbQRV1Jn8mYU+05ybQtiqG3ZFye
 YocTeF1RN8ZnYuxT8nxyJzFyub5obXi9yw==
X-Google-Smtp-Source: ABdhPJyyfQ0gvr8AoWGqnJdShYpPQwzMzesP3Mr2T6JO2XtyCMLOmFlXUt8WpyxmnnmEXFoZWh40YQ==
X-Received: by 2002:a05:6808:1246:b0:2c9:efa5:7209 with SMTP id
 o6-20020a056808124600b002c9efa57209mr13613065oiv.62.1654033770176; 
 Tue, 31 May 2022 14:49:30 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 03/16] ppc/pnv: add PnvPHB base/proxy device
Date: Tue, 31 May 2022 18:49:04 -0300
Message-Id: <20220531214917.31668-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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

The PnvPHB device is going to be the base device for all other powernv
PHBs. It consists of a device that has the same user API as the other
PHB, namely being a PCIHostBridge and having chip-id and index
properties. It also has a 'backend' pointer that will be initialized
with the PHB implementation that the device is going to use.

The initialization of the PHB backend is done by checking the PHB
version via a 'version' attribute that can be set via a global machine
property.  The 'version' field will be used to make adjustments based on
the running version, e.g. PHB3 uses a 'chip' reference while PHB4 uses
'pec'. To init the PnvPHB bus we'll rely on helpers for each version.
The version 3 helper is already added (pnv_phb3_bus_init), the PHB4
helper will be added later on.

For now let's add the basic logic of the PnvPHB object, which consists
mostly of pnv_phb_realize() doing all the work of checking the
phb->version set, initializing the proper backend, passing through its
attributes to the chosen backend, finalizing the backend realize and
adding a root port in the end.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/meson.build |   3 +-
 hw/pci-host/pnv_phb.c   | 123 ++++++++++++++++++++++++++++++++++++++++
 hw/pci-host/pnv_phb.h   |  39 +++++++++++++
 3 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 hw/pci-host/pnv_phb.c
 create mode 100644 hw/pci-host/pnv_phb.h

diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index c07596d0d1..e832babc9d 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -35,5 +35,6 @@ specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
   'pnv_phb3_msi.c',
   'pnv_phb3_pbcq.c',
   'pnv_phb4.c',
-  'pnv_phb4_pec.c'
+  'pnv_phb4_pec.c',
+  'pnv_phb.c',
 ))
diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
new file mode 100644
index 0000000000..fa8472622f
--- /dev/null
+++ b/hw/pci-host/pnv_phb.c
@@ -0,0 +1,123 @@
+/*
+ * QEMU PowerPC PowerNV Proxy PHB model
+ *
+ * Copyright (c) 2022, IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/visitor.h"
+#include "qapi/error.h"
+#include "hw/pci-host/pnv_phb.h"
+#include "hw/pci-host/pnv_phb3.h"
+#include "hw/pci-host/pnv_phb4.h"
+#include "hw/ppc/pnv.h"
+#include "hw/qdev-properties.h"
+#include "qom/object.h"
+
+
+static void pnv_phb_realize(DeviceState *dev, Error **errp)
+{
+    PnvPHB *phb = PNV_PHB(dev);
+    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
+    g_autofree char *phb_typename = NULL;
+    g_autofree char *phb_rootport_typename = NULL;
+
+    if (!phb->version) {
+        error_setg(errp, "version not specified");
+        return;
+    }
+
+    switch (phb->version) {
+    case 3:
+        phb_typename = g_strdup(TYPE_PNV_PHB3);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB3_ROOT_PORT);
+        break;
+    case 4:
+        phb_typename = g_strdup(TYPE_PNV_PHB4);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB4_ROOT_PORT);
+        break;
+    case 5:
+        phb_typename = g_strdup(TYPE_PNV_PHB5);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB5_ROOT_PORT);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    phb->backend = object_new(phb_typename);
+    object_property_add_child(OBJECT(dev), "phb-device", phb->backend);
+
+    /* Passthrough child device properties to the proxy device */
+    object_property_set_uint(phb->backend, "index", phb->phb_id, errp);
+    object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
+    object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
+
+    if (phb->version == 3) {
+        object_property_set_link(phb->backend, "chip",
+                                 OBJECT(phb->chip), errp);
+    } else {
+        object_property_set_link(phb->backend, "pec", OBJECT(phb->pec), errp);
+    }
+
+    if (!qdev_realize(DEVICE(phb->backend), NULL, errp)) {
+        return;
+    }
+
+    if (phb->version == 3) {
+        pnv_phb3_bus_init(dev, (PnvPHB3 *)phb->backend);
+    }
+
+    pnv_phb_attach_root_port(pci, phb_rootport_typename);
+}
+
+static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
+                                         PCIBus *rootbus)
+{
+    PnvPHB *phb = PNV_PHB(host_bridge);
+
+    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
+             phb->chip_id, phb->phb_id);
+    return phb->bus_path;
+}
+
+static Property pnv_phb_properties[] = {
+        DEFINE_PROP_UINT32("index", PnvPHB, phb_id, 0),
+        DEFINE_PROP_UINT32("chip-id", PnvPHB, chip_id, 0),
+        DEFINE_PROP_UINT32("version", PnvPHB, version, 0),
+
+        DEFINE_PROP_LINK("chip", PnvPHB, chip, TYPE_PNV_CHIP, PnvChip *),
+
+        DEFINE_PROP_LINK("pec", PnvPHB, pec, TYPE_PNV_PHB4_PEC,
+                         PnvPhb4PecState *),
+
+        DEFINE_PROP_END_OF_LIST(),
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
+static void pnv_phb_register_type(void)
+{
+    static const TypeInfo pnv_phb_type_info = {
+        .name          = TYPE_PNV_PHB,
+        .parent        = TYPE_PCIE_HOST_BRIDGE,
+        .instance_size = sizeof(PnvPHB),
+        .class_init    = pnv_phb_class_init,
+    };
+
+    type_register_static(&pnv_phb_type_info);
+}
+type_init(pnv_phb_register_type)
diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
new file mode 100644
index 0000000000..a7cc8610e2
--- /dev/null
+++ b/hw/pci-host/pnv_phb.h
@@ -0,0 +1,39 @@
+/*
+ * QEMU PowerPC PowerNV Proxy PHB model
+ *
+ * Copyright (c) 2022, IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef PCI_HOST_PNV_PHB_H
+#define PCI_HOST_PNV_PHB_H
+
+#include "hw/pci/pcie_host.h"
+#include "hw/pci/pcie_port.h"
+#include "qom/object.h"
+
+typedef struct PnvChip PnvChip;
+typedef struct PnvPhb4PecState PnvPhb4PecState;
+
+struct PnvPHB {
+    PCIExpressHost parent_obj;
+
+    uint32_t chip_id;
+    uint32_t phb_id;
+    uint32_t version;
+    char bus_path[8];
+
+    PnvChip *chip;
+
+    PnvPhb4PecState *pec;
+
+    /* The PHB backend (PnvPHB3, PnvPHB4 ...) being used */
+    Object *backend;
+};
+
+#define TYPE_PNV_PHB "pnv-phb"
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
+
+#endif /* PCI_HOST_PNV_PHB_H */
-- 
2.36.1


