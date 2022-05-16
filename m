Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE51528302
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:19:40 +0200 (CEST)
Received: from localhost ([::1]:42874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYlH-0000ot-5P
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6N-0006wD-4H
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6K-0005N3-Vb
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBEGI22/vx+ykcwHLGBu5jUbJAVBiA+dvpYxazB3QOg=;
 b=Cmwt38M6312l7RvoxgBrPgRM7tjnmcwkrqu59+5rJqvNH+RBn05O5/5gdWToalZeGcjNrS
 2IMESMSYPslviEhX/fybmyeFXXFxnkUy9VLg6jQMj0ufo8k8dKBnBqTuLkOt0KnB16Wsk9
 NxraUgZXHhaURLzyk2j6A8Yir08/5+s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-5-fMpijdMiGXQ5h19MbYSg-1; Mon, 16 May 2022 06:37:16 -0400
X-MC-Unique: 5-fMpijdMiGXQ5h19MbYSg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso10136992wma.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CBEGI22/vx+ykcwHLGBu5jUbJAVBiA+dvpYxazB3QOg=;
 b=PH1aDALXpFEJsYitnkalRiis4EtG/BT+hdtyFKarcmSECgScfGb4BeKGxZQbiEZ2qU
 +rrZZi9hW/CVydXN9lKrGB7Y4ERHGNyKKmFsHQVWpI8BFJAdMzzT2i4HZ//hU/pDvmvf
 bWxGwB4TmOwKh7btpOxc/bJlszdpScTCn7H7n5fdBOFFexdThBcu7S1lyvHRDP0tI18L
 qA1EoOrKkwQDVBANuTQGtYsfvuvW0j7l8MLUE3SLj2bQDzdY5n4Zlji5VqD9Ne69xGaj
 KVyjVM4yijFbZtc1nRMHVtTH0Ot/KLzU48FU/BIP+0lbpdqD/kUln+7/RppCWTe93gVO
 H9Rw==
X-Gm-Message-State: AOAM533PPPjvVSXHPJqDaw98NY8vh1AKtu0ls8qHqhE42POJ9b0FTpiy
 gO3FcbGT45mWYODmv4QAUSRYiMviIj5bEDoJiGsUPv8q+/0GEx47r5X6tonDVven7vLasYg8vqL
 r7fFoPp/B+jVNCwcwiEwFQpsiFeCVdd2r87BIFuGc9Rfpl2WxTXlJtrSyyGxR
X-Received: by 2002:a05:600c:15c6:b0:394:2cc6:6b with SMTP id
 v6-20020a05600c15c600b003942cc6006bmr16029575wmf.106.1652697434800; 
 Mon, 16 May 2022 03:37:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylnC/1SJonPYyrUs0bgB4lcVV9cOiIKtHL1phFqGOEmChOw45kQrcH2YS/Kz29SMmY4LAJrg==
X-Received: by 2002:a05:600c:15c6:b0:394:2cc6:6b with SMTP id
 v6-20020a05600c15c600b003942cc6006bmr16029531wmf.106.1652697434222; 
 Mon, 16 May 2022 03:37:14 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 w6-20020adf8bc6000000b0020c5253d8besm9500346wra.10.2022.05.16.03.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:13 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 27/91] acpi/cxl: Create the CEDT (9.14.1)
Message-ID: <20220516095448.507876-28-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ben Widawsky <ben.widawsky@intel.com>

The CXL Early Discovery Table is defined in the CXL 2.0 specification as
a way for the OS to get CXL specific information from the system
firmware.

CXL 2.0 specification adds an _HID, ACPI0016, for CXL capable host
bridges, with a _CID of PNP0A08 (PCIe host bridge). CXL aware software
is able to use this initiate the proper _OSC method, and get the _UID
which is referenced by the CEDT. Therefore the existence of an ACPI0016
device allows a CXL aware driver perform the necessary actions. For a
CXL capable OS, this works. For a CXL unaware OS, this works.

CEDT awaremess requires more. The motivation for ACPI0017 is to provide
the possibility of having a Linux CXL module that can work on a legacy
Linux kernel. Linux core PCI/ACPI which won't be built as a module,
will see the _CID of PNP0A08 and bind a driver to it. If we later loaded
a driver for ACPI0016, Linux won't be able to bind it to the hardware
because it has already bound the PNP0A08 driver. The ACPI0017 device is
an opportunity to have an object to bind a driver will be used by a
Linux driver to walk the CXL topology and do everything that we would
have preferred to do with ACPI0016.

There is another motivation for an ACPI0017 device which isn't
implemented here. An operating system needs an attach point for a
non-volatile region provider that understands cross-hostbridge
interleaving. Since QEMU emulation doesn't support interleaving yet,
this is more important on the OS side, for now.

As of CXL 2.0 spec, only 1 sub structure is defined, the CXL Host Bridge
Structure (CHBS) which is primarily useful for telling the OS exactly
where the MMIO for the host bridge is.

Link: https://lore.kernel.org/linux-cxl/20210115034911.nkgpzc756d6qmjpl@intel.com/T/#t
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-26-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/cxl.h               |  5 +++
 include/hw/pci/pci_bridge.h         | 20 +++++++++
 hw/acpi/cxl.c                       | 68 +++++++++++++++++++++++++++++
 hw/i386/acpi-build.c                | 27 ++++++++++++
 hw/pci-bridge/pci_expander_bridge.c | 17 --------
 5 files changed, 120 insertions(+), 17 deletions(-)

diff --git a/include/hw/acpi/cxl.h b/include/hw/acpi/cxl.h
index 7b8f3b8a2e..0c496538c0 100644
--- a/include/hw/acpi/cxl.h
+++ b/include/hw/acpi/cxl.h
@@ -18,6 +18,11 @@
 #ifndef HW_ACPI_CXL_H
 #define HW_ACPI_CXL_H
 
+#include "hw/acpi/bios-linker-loader.h"
+
+void cxl_build_cedt(MachineState *ms, GArray *table_offsets, GArray *table_data,
+                    BIOSLinker *linker, const char *oem_id,
+                    const char *oem_table_id);
 void build_cxl_osc_method(Aml *dev);
 
 #endif
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 30691a6e57..ba4bafac7c 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -28,6 +28,7 @@
 
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/cxl/cxl.h"
 #include "qom/object.h"
 
 typedef struct PCIBridgeWindows PCIBridgeWindows;
@@ -80,6 +81,25 @@ struct PCIBridge {
 #define PCI_BRIDGE_DEV_PROP_CHASSIS_NR "chassis_nr"
 #define PCI_BRIDGE_DEV_PROP_MSI        "msi"
 #define PCI_BRIDGE_DEV_PROP_SHPC       "shpc"
+typedef struct CXLHost CXLHost;
+
+struct PXBDev {
+    /*< private >*/
+    PCIDevice parent_obj;
+    /*< public >*/
+
+    uint8_t bus_nr;
+    uint16_t numa_node;
+    bool bypass_iommu;
+    struct cxl_dev {
+        CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
+    } cxl;
+};
+
+typedef struct PXBDev PXBDev;
+#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
+DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
+                         TYPE_PXB_CXL_DEVICE)
 
 int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
                           uint16_t svid, uint16_t ssid,
diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index ca1f04f359..aa4af86a4c 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -18,7 +18,11 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_host.h"
 #include "hw/cxl/cxl.h"
+#include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
@@ -26,6 +30,70 @@
 #include "qapi/error.h"
 #include "qemu/uuid.h"
 
+static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(cxl->cxl.cxl_host_bridge);
+    struct MemoryRegion *mr = sbd->mmio[0].memory;
+
+    /* Type */
+    build_append_int_noprefix(table_data, 0, 1);
+
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 1);
+
+    /* Record Length */
+    build_append_int_noprefix(table_data, 32, 2);
+
+    /* UID - currently equal to bus number */
+    build_append_int_noprefix(table_data, cxl->bus_nr, 4);
+
+    /* Version */
+    build_append_int_noprefix(table_data, 1, 4);
+
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
+
+    /* Base - subregion within a container that is in PA space */
+    build_append_int_noprefix(table_data, mr->container->addr + mr->addr, 8);
+
+    /* Length */
+    build_append_int_noprefix(table_data, memory_region_size(mr), 8);
+}
+
+static int cxl_foreach_pxb_hb(Object *obj, void *opaque)
+{
+    Aml *cedt = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PXB_CXL_DEVICE)) {
+        cedt_build_chbs(cedt->buf, PXB_CXL_DEV(obj));
+    }
+
+    return 0;
+}
+
+void cxl_build_cedt(MachineState *ms, GArray *table_offsets, GArray *table_data,
+                    BIOSLinker *linker, const char *oem_id,
+                    const char *oem_table_id)
+{
+    Aml *cedt;
+    AcpiTable table = { .sig = "CEDT", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
+
+    acpi_add_table(table_offsets, table_data);
+    acpi_table_begin(&table, table_data);
+    cedt = init_aml_allocator();
+
+    /* reserve space for CEDT header */
+
+    object_child_foreach_recursive(object_get_root(), cxl_foreach_pxb_hb, cedt);
+
+    /* copy AML table into ACPI tables blob and patch header there */
+    g_array_append_vals(table_data, cedt->buf->data, cedt->buf->len);
+    free_aml_allocator();
+
+    acpi_table_end(linker, &table);
+}
+
 static Aml *__build_cxl_osc_method(void)
 {
     Aml *method, *if_uuid, *else_uuid, *if_arg1_not_1, *if_cxl, *if_caps_masked;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 59ede8b2e9..c125939ed6 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -77,6 +77,7 @@
 #include "hw/acpi/ipmi.h"
 #include "hw/acpi/hmat.h"
 #include "hw/acpi/viot.h"
+#include "hw/acpi/cxl.h"
 
 #include CONFIG_DEVICES
 
@@ -1411,6 +1412,22 @@ static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
     aml_append(table, scope);
 }
 
+static void build_acpi0017(Aml *table)
+{
+    Aml *dev, *scope, *method;
+
+    scope =  aml_scope("_SB");
+    dev = aml_device("CXLM");
+    aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0017")));
+
+    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_return(aml_int(0x01)));
+    aml_append(dev, method);
+
+    aml_append(scope, dev);
+    aml_append(table, scope);
+}
+
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
@@ -1430,6 +1447,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 #ifdef CONFIG_TPM
     TPMIf *tpm = tpm_find();
 #endif
+    bool cxl_present = false;
     int i;
     VMBusBridge *vmbus_bridge = vmbus_bridge_find();
     AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
@@ -1618,12 +1636,17 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                 MemoryRegion *mr = &machine->cxl_devices_state->host_mr;
                 uint64_t base = mr->addr;
 
+                cxl_present = true;
                 crs_range_insert(crs_range_set.mem_ranges, base,
                                  base + memory_region_size(mr) - 1);
             }
         }
     }
 
+    if (cxl_present) {
+        build_acpi0017(dsdt);
+    }
+
     /*
      * At this point crs_range_set has all the ranges used by pci
      * busses *other* than PCI0.  These ranges will be excluded from
@@ -2688,6 +2711,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                           machine->nvdimms_state, machine->ram_slots,
                           x86ms->oem_id, x86ms->oem_table_id);
     }
+    if (machine->cxl_devices_state->is_enabled) {
+        cxl_build_cedt(machine, table_offsets, tables_blob, tables->linker,
+                       x86ms->oem_id, x86ms->oem_table_id);
+    }
 
     acpi_add_table(table_offsets, tables_blob);
     build_waet(tables_blob, tables->linker, x86ms->oem_id, x86ms->oem_table_id);
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 8fb4f2ea91..22feda1ff0 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -57,23 +57,6 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
                          TYPE_PXB_PCIE_DEVICE)
 
-#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
-DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
-                         TYPE_PXB_CXL_DEVICE)
-
-struct PXBDev {
-    /*< private >*/
-    PCIDevice parent_obj;
-    /*< public >*/
-
-    uint8_t bus_nr;
-    uint16_t numa_node;
-    bool bypass_iommu;
-    struct cxl_dev {
-        CXLHost *cxl_host_bridge;
-    } cxl;
-};
-
 static PXBDev *convert_to_pxb(PCIDevice *dev)
 {
     /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
-- 
MST


