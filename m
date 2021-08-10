Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8289C3E55E3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:49:51 +0200 (CEST)
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNSI-0006Rf-He
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPK-0006VE-9H
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:46 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPG-000834-TN
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:46 -0400
Received: by mail-ej1-x632.google.com with SMTP id e19so33990772ejs.9
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/o/Uf1wri3qCwdek1lnFkD8g6fp4lM2+UgFr9YmIozI=;
 b=nQ+UUoP+wuuPbFTDeFkTMF34/YPBHROLUxIe/NQXg/bFVM8RJtY1Xs1iGWzG/Qc4uQ
 naQz2qviShtJJBgxCdT9kd4iH4uML//DJJpDx/hCt/SUix/IR7v03bWAvC7dwzhGhDET
 zFG5ABkd0KFIORLgG5BAfJIj0r/V9SDVQQvYrtfRvjWvBS5DXAkEHmsmE5u79cofIVJ1
 Du4CSJgFfETYEnKPAAdef75hgSpCR14l5qHrkhf69rAgeyZq/L5d28UUruaKaWpQpjxI
 9VbBLHhmvvzFVrO38K258OYCe6TJm31f21WwWpejYAzqzM0GrrBCPDrg8HvudNEnyFpx
 SFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/o/Uf1wri3qCwdek1lnFkD8g6fp4lM2+UgFr9YmIozI=;
 b=X6Vw6I6h2e2VIaWjBmH6t43y55DDCtC4awFgym9ADO8dI0F7r/2EiZCuIUxe+zcwXP
 36G8t4yD9gd45uh16HqtCJCyeXKNhgE32xjmy/CJJi094jJGJyQTKGQ26OOu2Wfi4oto
 rqkwXGlEBMYcxKMMySloSMos96IK+OQKbnNdWZPjKBQwnNCpsYXfArr7y8cSG5F+ihOW
 LTUtyGDmrEwtF7z9X26TkBuurOVdC03RDmeUxTKdg59O8W3Ptb2n5n+9T4QNNvIIJash
 RmJoXet+7WZLzOacfwXxqjoiJU9zKLCAzEii+xVNtMOrXpDpB8MFPzmDMVEuWzOCuim+
 u5pQ==
X-Gm-Message-State: AOAM53141saQiadWd9u4A2JZct2dSKoPKahx/RYl2oGtH3EY0fgfrL+W
 WraB6Xn1JCix+LUTh/P2V95Lxw==
X-Google-Smtp-Source: ABdhPJxuZwWRATtwAXz8XAqpeTqYMK5V82Koefu2JnWonplrAxQC65sVkhZpxrY/KC6Aytjs4dItzA==
X-Received: by 2002:a17:906:8606:: with SMTP id
 o6mr26853228ejx.247.1628585201594; 
 Tue, 10 Aug 2021 01:46:41 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id fl2sm1533516ejc.114.2021.08.10.01.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:46:41 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 2/6] hw/acpi: Add VIOT table
Date: Tue, 10 Aug 2021 10:45:02 +0200
Message-Id: <20210810084505.2257983-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810084505.2257983-1-jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com
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
 hw/acpi/viot.h      | 13 +++++++
 hw/acpi/viot.c      | 82 +++++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/Kconfig     |  4 +++
 hw/acpi/meson.build |  1 +
 4 files changed, 100 insertions(+)
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
index 0000000000..5cd10e9553
--- /dev/null
+++ b/hw/acpi/viot.c
@@ -0,0 +1,82 @@
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
+/* Build PCI range for a given PCI host bridge */
+static int viot_host_bridges(Object *obj, void *opaque)
+{
+    GArray *pci_range_blob = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            int min_bus, max_bus;
+
+            pci_bus_range(bus, &min_bus, &max_bus);
+
+            AcpiViotPciRange pci_range = {
+                .type = ACPI_VIOT_NODE_PCI_RANGE,
+                .length = cpu_to_le16(sizeof(pci_range)),
+                .bdf_start = cpu_to_le16(PCI_BUILD_BDF(min_bus, 0)),
+                .bdf_end = cpu_to_le16(PCI_BUILD_BDF(max_bus, 0xff)),
+                .endpoint_start = cpu_to_le32(PCI_BUILD_BDF(min_bus, 0)),
+            };
+
+            g_array_append_val(pci_range_blob, pci_range);
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
+    int i;
+    AcpiViot *viot;
+    AcpiViotPciRange *pci_range;
+    AcpiViotVirtioIommuPci *viommu;
+    int viommu_off = sizeof(*viot);
+    int viot_start = table_data->len;
+    GArray *pci_ranges = g_array_new(false, true, sizeof(*pci_range));
+
+    viot = acpi_data_push(table_data, sizeof(*viot));
+    viot->node_offset = cpu_to_le16(viommu_off);
+
+    viommu = acpi_data_push(table_data, sizeof(*viommu));
+    viommu->type = ACPI_VIOT_NODE_VIRTIO_IOMMU_PCI;
+    viommu->length = cpu_to_le16(sizeof(*viommu));
+    viommu->bdf = cpu_to_le16(virtio_iommu_bdf);
+
+    /* Build the list of PCI ranges that this viommu manages */
+    object_child_foreach_recursive(object_get_root(), viot_host_bridges,
+                                   pci_ranges);
+
+    for (i = 0; i < pci_ranges->len; i++) {
+        pci_range = &g_array_index(pci_ranges, AcpiViotPciRange, i);
+        pci_range->output_node = cpu_to_le16(viommu_off);
+    }
+    viot->node_count = cpu_to_le16(pci_ranges->len + 1);
+
+    g_array_append_vals(table_data, pci_ranges->data,
+                        pci_ranges->len * sizeof(*pci_range));
+    g_array_free(pci_ranges, true);
+
+    build_header(linker, table_data, (void *)(table_data->data + viot_start),
+                 "VIOT", table_data->len - viot_start, 0, oem_id, oem_table_id);
+}
+
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index cfc4ede8d9..abad79c103 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -41,6 +41,10 @@ config ACPI_VMGENID
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
index 29f804d13e..a510988b27 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -16,6 +16,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
-- 
2.32.0


