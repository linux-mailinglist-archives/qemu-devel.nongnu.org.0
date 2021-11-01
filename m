Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7944246E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:58:54 +0100 (CET)
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhCX-0005Hz-5V
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyl-00020f-5C
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyi-0004FY-VO
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V9FWr0j37d3VBNphNAtMkiS5bz48/xHnQY0wdPZWJX8=;
 b=fqDiaWz5XkXyw5kxYziPvHc89uhD+dVYVgKvacgQ18szH4hffOvrGyhmYF5NMjToQpejnx
 ZNKTlnJwtiwpgiglgIDq4IZ3MGwFtRVSEfgdWj543F67Jsc2Jubw09AjqwEKwchMK5zzgk
 pgSFCbUZLZn8J5/zBO8+EsNopb2+6/c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-f3syQuwOPGWGSg2ey36i3A-1; Mon, 01 Nov 2021 19:44:34 -0400
X-MC-Unique: f3syQuwOPGWGSg2ey36i3A-1
Received: by mail-ed1-f69.google.com with SMTP id
 h16-20020a05640250d000b003dd8167857aso17113113edb.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V9FWr0j37d3VBNphNAtMkiS5bz48/xHnQY0wdPZWJX8=;
 b=Weijk+Y/thW6UrkZlWc/yF0CMLYVTdpv5malCu/TFdVPF6PGD0togQmCBt5x/SZZ+w
 bcOMr2sEnB0BAY8R1PW5KGY/Wb1TrUTf9rymkmBDo1NqeB6TMoSyXvu0GV5OrAYANxkl
 k6eN47q3cK2iHDpdjuCv3D/tIuB2s3J02vq32L+85o2JwFsiL7Tud2VFITpvrhf2P0Mp
 uR0rZCdK+CyaHPMjASiul1x06ZeqzZ5w2RAlEvP2OcRIp57oE2nqGLoq03pJyRNb/Jzv
 SxMcIHc4gyY3H5nEWoKW4M4FZVRHaApLMEJ4QljeM54+kOq1RRrpzskzYOJRZ+wAlwwZ
 1p5Q==
X-Gm-Message-State: AOAM533KMmLAKEAzx9DG5LKLyXJfOkAanOFUY3pxuKPUGPs/rTVNi1N5
 5SzT/8lAD8tX1yKKYpr1rbeMgYGFLOjI4NGniWmBYZt9DdU5AbPJOgU8AxJHao8VfwIjzVu0A9/
 awBvobDG+I3XFpJz72j6arRezxTp3yhdJlqyzK9D0yakZ+j5zToAXLpSCNAxq
X-Received: by 2002:a50:d50c:: with SMTP id u12mr45760085edi.118.1635810272319; 
 Mon, 01 Nov 2021 16:44:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0l+XQ3FouWeS8Qkde1Ap4Mqp4tBuTCKrA6kZDFEvfp2odEF0QdgdEXKgFPzeBXECWJuJoHA==
X-Received: by 2002:a50:d50c:: with SMTP id u12mr45760044edi.118.1635810272068; 
 Mon, 01 Nov 2021 16:44:32 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id ho30sm1073398ejc.30.2021.11.01.16.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:31 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] hw/acpi: Add VIOT table
Message-ID: <20211101234358.582487-4-mst@redhat.com>
References: <20211101234358.582487-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211101234358.582487-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

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
Message-Id: <20211026182024.2642038-2-jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


