Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A8D40B190
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:41:54 +0200 (CEST)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9dB-0007ha-5i
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MJ-000621-Ch
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MG-0005KH-Mw
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id g128so4994405wma.5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nS823/pARC7E/cGVolQgi0MZdIiDHOIoVcnOe7Dvd/w=;
 b=Mdf6Lhjex71nvzRWOBSf0SW3lReizEsZX2F8iwkTC5+SEdMv7OMwaNUtaHza4o/j2F
 wP9OcOZDBfYyFnC8dVPF5sWsQ5SgEgCgvQ+e3pt1HEuXANbTOclXtwWc84ISM8VPaDbM
 oSLieAQJHpQ+RvneyWlMp9gQ7fTiHHcWfcgQgFPOPzU/gEehjSyftTyP7u3Vm14vTNnS
 R4hahuTmbeq9eb2CbPJnbPx0l0uxjyggsEkruAADIqmjptxvi+XTFC7pFzbBq3m5FjnF
 4XN5I8ZYz/xX6cjYaeHSEmajeUfS9cuR5evcwCj4AgKONyI0uHqAGPoBLsKgirfEYptV
 xBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nS823/pARC7E/cGVolQgi0MZdIiDHOIoVcnOe7Dvd/w=;
 b=2w7KKfWFVKwFh1Q0MxJEnr51fLYUs7LZMwYKZI/qWZ892KCcm8vwho9bz9mgnGUZHN
 dNBamtcfPZ2Gz0nKN/fsg0G9by/bcNEdJGPEJaGeTtHPYjMP/Iy754EVmtL8jGgLrDfa
 wHO1lV1EmywFWJ74Q+XMg+oNtn+wsO6Fq00aNKVz3H0OR1YRy7K75th9yU1eZWxs2Bxu
 fmdIL4aPmle62ryVN8aaGKeQbklvdyhVqgMqJcsvbOP2TiRXSGYfCFGjIjlbkkiS9OFK
 iDSX5IBYtdmdTefF0jN2c3v+1PsYIoHZXydEI4o2Syvfa4MpQefcJnS+x/AvEptgK4su
 zbmg==
X-Gm-Message-State: AOAM530rx89tSK3vPpzcO04H+eq1epROUPAA3qfbQfn6nmEJawNreyiG
 1sz/BbOC5VzC5EogXUCiCy2O6g==
X-Google-Smtp-Source: ABdhPJyzbdz1YqhY0LFyKRM+v+u+/5yvTdUIdRcMBxA8HgpWtHkcoV9CwBMBLBoegle+/SoJcS+7Hg==
X-Received: by 2002:a05:600c:2e43:: with SMTP id
 q3mr2512682wmf.119.1631629462040; 
 Tue, 14 Sep 2021 07:24:22 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:21 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 01/10] hw/acpi: Add VIOT table
Date: Tue, 14 Sep 2021 15:19:56 +0100
Message-Id: <20210914142004.2433568-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function that generates a Virtual I/O Translation table (VIOT),
describing the topology of paravirtual IOMMUs. The table is created when
instantiating a virtio-iommu device. It contains a virtio-iommu node and
PCI Range nodes for endpoints managed by the IOMMU. By default, a single
node describes all PCI devices. When passing the "default_bus_bypass_iommu"
machine option and "bypass_iommu" PXB option, only buses that do not
bypass the IOMMU are described by PCI Range nodes.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
Sizes and types are hardcoded because it will now be the default style
https://lore.kernel.org/qemu-devel/20210708154617.1538485-1-imammedo@redhat.com/
---
 hw/acpi/viot.h      |  13 +++++
 hw/acpi/viot.c      | 112 ++++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/Kconfig     |   4 ++
 hw/acpi/meson.build |   1 +
 4 files changed, 130 insertions(+)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c

diff --git a/hw/acpi/viot.h b/hw/acpi/viot.h
new file mode 100644
index 0000000000..4cef29a640
--- /dev/null
+++ b/hw/acpi/viot.h
@@ -0,0 +1,13 @@
+/*
+ * ACPI Virtual I/O Translation Table implementation
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef VIOT_H
+#define VIOT_H
+
+void build_viot(GArray *table_data, BIOSLinker *linker,
+                uint16_t virtio_iommu_bdf, const char *oem_id,
+                const char *oem_table_id);
+
+#endif /* VIOT_H */
diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
new file mode 100644
index 0000000000..e7f7605119
--- /dev/null
+++ b/hw/acpi/viot.c
@@ -0,0 +1,112 @@
+/*
+ * ACPI Virtual I/O Translation table implementation
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/viot.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_host.h"
+
+struct viot_pci_ranges {
+    GArray *blob;
+    size_t count;
+    uint16_t output_node;
+};
+
+/* Build PCI range for a given PCI host bridge */
+static int viot_host_bridges(Object *obj, void *opaque)
+{
+    struct viot_pci_ranges *pci_ranges = opaque;
+    GArray *blob = pci_ranges->blob;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            int min_bus, max_bus;
+
+            pci_bus_range(bus, &min_bus, &max_bus);
+
+            /* Type (PCI range) */
+            build_append_int_noprefix(blob, 1, 1);
+            /* Reserved */
+            build_append_int_noprefix(blob, 0, 1);
+            /* Length */
+            build_append_int_noprefix(blob, 24, 2);
+            /* Endpoint start */
+            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
+            /* PCI Segment start */
+            build_append_int_noprefix(blob, 0, 2);
+            /* PCI Segment end */
+            build_append_int_noprefix(blob, 0, 2);
+            /* PCI BDF start */
+            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 2);
+            /* PCI BDF end */
+            build_append_int_noprefix(blob, PCI_BUILD_BDF(max_bus, 0xff), 2);
+            /* Output node */
+            build_append_int_noprefix(blob, pci_ranges->output_node, 2);
+            /* Reserved */
+            build_append_int_noprefix(blob, 0, 6);
+
+            pci_ranges->count++;
+        }
+    }
+
+    return 0;
+}
+
+/*
+ * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
+ * endpoints.
+ */
+void build_viot(GArray *table_data, BIOSLinker *linker,
+                uint16_t virtio_iommu_bdf, const char *oem_id,
+                const char *oem_table_id)
+{
+    /* The virtio-iommu node follows the 48-bytes header */
+    int viommu_off = 48;
+    AcpiTable table = { .sig = "VIOT", .rev = 0,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
+    struct viot_pci_ranges pci_ranges = {
+        .output_node = viommu_off,
+        .blob = g_array_new(false, true, 1),
+    };
+
+    /* Build the list of PCI ranges that this viommu manages */
+    object_child_foreach_recursive(object_get_root(), viot_host_bridges,
+                                   &pci_ranges);
+
+    /* ACPI table header */
+    acpi_table_begin(&table, table_data);
+    /* Node count */
+    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
+    /* Node offset */
+    build_append_int_noprefix(table_data, viommu_off, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8);
+
+    /* Virtio-iommu node */
+    /* Type (virtio-pci IOMMU)  */
+    build_append_int_noprefix(table_data, 3, 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 1);
+    /* Length */
+    build_append_int_noprefix(table_data, 16, 2);
+    /* PCI Segment */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* PCI BDF number */
+    build_append_int_noprefix(table_data, virtio_iommu_bdf, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8);
+
+    /* PCI ranges found above */
+    g_array_append_vals(table_data, pci_ranges.blob->data,
+                        pci_ranges.blob->len);
+    g_array_free(pci_ranges.blob, true);
+
+    acpi_table_end(linker, &table);
+}
+
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 3b5e118c54..622b0b50b7 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -51,6 +51,10 @@ config ACPI_VMGENID
     default y
     depends on PC
 
+config ACPI_VIOT
+    bool
+    depends on ACPI
+
 config ACPI_HW_REDUCED
     bool
     select ACPI
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 7d8c0eb43e..adf6347bc4 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -20,6 +20,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files(
 acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
-- 
2.33.0


