Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CCF43517C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:39:29 +0200 (CEST)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFYm-0000rl-3x
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUV-00050w-VM
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:03 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUS-0002WA-2d
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:03 -0400
Received: by mail-wm1-x335.google.com with SMTP id v127so20451430wme.5
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IE2Z2g5VHAv0ugACUjC75Ov9MFD4N5L+Ta3HLhuuRgI=;
 b=uC2QuLWwFtWmyhfZq/n0pwY0R5GKH52ISkMTrXtYX/dWqI1YbncKngt1X0C4VlyiXD
 hPZ9vlqvmyFX/hHUwvvADXcLeRrIK4ul5UTiaaDxYmRuVJNCzo5EkENs8b+jGw7w2y1D
 S4IISbGY2WdKTlPomKdIyvDDgmNm02GQJFk5cFF1JUHFXiWWGaD2IcZNGgnZ23i1ddls
 35uUdkwae4toq0loKQUNKjS1HLgqmvaK4dT7nqb99DsMKW2nSbcbBwneNxhy+xRgxE9G
 IdDkbqe3K/iu/cCP5Vljk4zkJJ+HMPO2JupdpAFJEhux50eiidZxs5ehb7KHC4UZ0shL
 U7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IE2Z2g5VHAv0ugACUjC75Ov9MFD4N5L+Ta3HLhuuRgI=;
 b=6McQA6/dQxpVZQlzDjr7c3PbwTJQXAzQkHfcU41k1zo9/PNlx5ublaYZ4pD6TAZ3Sp
 yXuUD/iAMIu2Ahi6CF2u8xzFMQFIdSlVNB9D+GsJn/b3cYCMByx14uuJo89SkUPExSyI
 HJWlaRWTTGYMICsvJGzJ0eBZS8Ph9ePA64ME3Ahr4N7FANYkG+U5BYTeGdIhT+DFEc+n
 qoVvmNr3NlrxY5myIpKMxqZ75dI8SeKN2DvgCB0zoWvfTc/SVcRgt+wiebIymTs/lp1P
 PafaI5MVQCyxp4DzEuGye4bNlngCmv73bNeYPwqjpwN4vIvRB7I/Vgp0dVKbQS/cdbsn
 dqDQ==
X-Gm-Message-State: AOAM533kXsCCno6BFlCpdOvI0xVZO0w5Fpq8sLqlluBQIzYemQE+rfa2
 wXEcuMshg/zcDNfYkSnh/ycI9A==
X-Google-Smtp-Source: ABdhPJxWZuyPKFroOKv0akAgIvrobWmqm9pEBL87Kmtc+Z63zdojAjOqn44pCIyQux4uZNa4ogtR1g==
X-Received: by 2002:a1c:3586:: with SMTP id c128mr15141180wma.78.1634751297735; 
 Wed, 20 Oct 2021 10:34:57 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:34:57 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 01/12] hw/acpi: Add VIOT table
Date: Wed, 20 Oct 2021 18:27:35 +0100
Message-Id: <20211020172745.620101-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function that generates a Virtual I/O Translation table (VIOT),
describing the topology of paravirtual IOMMUs. The table is created if a
virtio-iommu device is present. It contains a virtio-iommu node and PCI
Range nodes for endpoints managed by the IOMMU. By default, a single
node describes all PCI devices. When passing the
"default_bus_bypass_iommu" machine option and "bypass_iommu" PXB option,
only buses that do not bypass the IOMMU are described by PCI Range
nodes.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/acpi/viot.h      |  13 +++++
 hw/acpi/viot.c      | 114 ++++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/Kconfig     |   4 ++
 hw/acpi/meson.build |   1 +
 4 files changed, 132 insertions(+)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c

diff --git a/hw/acpi/viot.h b/hw/acpi/viot.h
new file mode 100644
index 0000000000..9fe565bb87
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
+void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
+                uint16_t virtio_iommu_bdf, const char *oem_id,
+                const char *oem_table_id);
+
+#endif /* VIOT_H */
diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
new file mode 100644
index 0000000000..c1af75206e
--- /dev/null
+++ b/hw/acpi/viot.c
@@ -0,0 +1,114 @@
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
+static int build_pci_range_node(Object *obj, void *opaque)
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
+            /* Type */
+            build_append_int_noprefix(blob, 1 /* PCI range */, 1);
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
+ *
+ * Defined in the ACPI Specification (Version TBD)
+ */
+void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
+                uint16_t virtio_iommu_bdf, const char *oem_id,
+                const char *oem_table_id)
+{
+    /* The virtio-iommu node follows the 48-bytes header */
+    int viommu_off = 48;
+    AcpiTable table = { .sig = "VIOT", .rev = 0,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
+    struct viot_pci_ranges pci_ranges = {
+        .output_node = viommu_off,
+        .blob = g_array_new(false, true /* clear */, 1),
+    };
+
+    /* Build the list of PCI ranges that this viommu manages */
+    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
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
+    /* Type */
+    build_append_int_noprefix(table_data, 3 /* virtio-pci IOMMU */, 1);
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


