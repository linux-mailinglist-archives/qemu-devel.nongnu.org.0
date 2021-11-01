Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FE844245F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:53:36 +0100 (CET)
Received: from localhost ([::1]:57826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhh7P-00062q-6j
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyx-00023Y-PV
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgys-0004Gu-8P
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=87si2iofmNbSxccGunRxGUaDXwE4hg4UwpFbhmuRxZ0=;
 b=f0ReRC6cEGafJdXpu4J7UG1BU8su5W8JeHjts+sDNcWnyp1MLb0lLE7R7BkQcWPvEdWWYV
 cpgZozfgVVdHpW0tcWsq0eUU+SwwwntYo6wJoT568rY/UYbn8P7ZVXiDnCQsSEMbyKz056
 VdyTlg5dRdp36N2FAbtiH06RiNEKuYc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-Adw1jrjrMe-gIyADtn9f3w-1; Mon, 01 Nov 2021 19:44:44 -0400
X-MC-Unique: Adw1jrjrMe-gIyADtn9f3w-1
Received: by mail-ed1-f71.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso17145584edj.13
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=87si2iofmNbSxccGunRxGUaDXwE4hg4UwpFbhmuRxZ0=;
 b=nbd8SU+ky8G2Jh5/KJ0cNY3usU+mt8Eo0P7DXQrWWHBNpu8nnU55Mp4oKo5PydNGOk
 vXm4YR2dLlQTPd/Wm7azhzKZyxYxY+flHC8FqDdUWc/8yMNrTCc2x7gX8Qgzdksnmp0U
 RE7mLipc28W47DST/GCokMPCKNOLZ2S1rCgm/T8d9BQcnWhpj/Zwo2BzSSJUmsLpjPec
 hhlrFVK4dPScqqPDJHBNWaNtqkRRJGzz8EvEtm2KqGnxox/W+S04XIbMCaoq3Vo42o76
 qEkLlLeGWpNK7u25mJfEFsaRGL9hwL51M8fdEZiMl6wPw+lAmu5KLqSwQQRIUaxeMz44
 Qu4Q==
X-Gm-Message-State: AOAM531ZYYPJ8rY8SYxF7Rx2OHRPJvm6eP9x93T9YQFLdq/CF7n26oXl
 jLbqo5aFGPzJgB00/DZGInT6mcI0vk8qAVoDC3h0zv1It5+q3/ibGV4I7DfLPQK/qVwUw9dcJtv
 DK/U4BJ+w8cK7thVzBQC9GpJ5s2pSGbhEzSKnfMBsTiKZ1tN0RheVJyNWKRE3
X-Received: by 2002:a50:ee01:: with SMTP id g1mr18447025eds.389.1635810283123; 
 Mon, 01 Nov 2021 16:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP98rN7GBUGQx4nvmyvbrARnwtsVmN+v2WulGcuvBKfQE4Gsqep3W8sHo6Q/YiBiL3Kwsi1g==
X-Received: by 2002:a50:ee01:: with SMTP id g1mr18446992eds.389.1635810282941; 
 Mon, 01 Nov 2021 16:44:42 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id o12sm9584008edw.84.2021.11.01.16.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:42 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] hw/i386/pc: Allow instantiating a virtio-iommu device
Message-ID: <20211101234358.582487-7-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Allow instantiating a virtio-iommu device by adding an ACPI Virtual I/O
Translation table (VIOT), which describes the relation between the
virtio-iommu and the endpoints it manages.

Add a hotplug handler for virtio-iommu on x86 and set the necessary
reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
region is reserved for MSIs. DMA transactions to this range either
trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.

Although virtio-iommu does not support IRQ remapping it must be informed
of the reserved region so that it can forward DMA transactions targeting
this region.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20211026182024.2642038-5-jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 10 +++++++++-
 hw/i386/pc.c         | 16 +++++++++++++++-
 hw/i386/Kconfig      |  1 +
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ab49e799ff..3ca6cc8118 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -68,9 +68,11 @@
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/virtio/virtio-iommu.h"
 
 #include "hw/acpi/ipmi.h"
 #include "hw/acpi/hmat.h"
+#include "hw/acpi/viot.h"
 
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
@@ -2488,7 +2490,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(machine);
-    X86IOMMUState *iommu = x86_iommu_get_default();
+    DeviceState *iommu = pcms->iommu;
     GArray *table_offsets;
     unsigned facs, dsdt, rsdt, fadt;
     AcpiPmInfo pm;
@@ -2613,6 +2615,12 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         acpi_add_table(table_offsets, tables_blob);
         build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
                        x86ms->oem_table_id);
+    } else if (object_dynamic_cast(OBJECT(iommu), TYPE_VIRTIO_IOMMU_PCI)) {
+        PCIDevice *pdev = PCI_DEVICE(iommu);
+
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(machine, tables_blob, tables->linker, pci_get_bdf(pdev),
+                   x86ms->oem_id, x86ms->oem_table_id);
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7b1c4f41cd..e99017e662 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -83,6 +83,7 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/net/ne2000-isa.h"
 #include "standard-headers/asm-x86/bootparam.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "hw/virtio/virtio-pmem-pci.h"
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/mem/memory-device.h"
@@ -1330,7 +1331,19 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
-    } else if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        /* Declare the APIC range as the reserved MSI region */
+        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
+                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
+
+        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
+        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
+                                resv_prop_str, errp);
+        g_free(resv_prop_str);
+    }
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         PCMachineState *pcms = PC_MACHINE(hotplug_dev);
 
         if (pcms->iommu) {
@@ -1394,6 +1407,7 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
         return HOTPLUG_HANDLER(machine);
     }
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 962d2c981b..d22ac4a4b9 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -59,6 +59,7 @@ config PC_ACPI
     select ACPI_X86
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
+    select ACPI_VIOT
     select SMBUS_EEPROM
     select PFLASH_CFI01
     depends on ACPI_SMBUS
-- 
MST


