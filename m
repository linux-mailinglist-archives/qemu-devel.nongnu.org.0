Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2241F43B9C9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:42:38 +0200 (CEST)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRPB-0004X8-7w
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8V-0005st-6w
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:23 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8J-0006kP-0i
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:21 -0400
Received: by mail-wr1-x431.google.com with SMTP id s19so20770033wra.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mvNZcbwdV2DZzaz1Q9u+jT5ccl/dNtRIvjKzAKbzqIs=;
 b=usB+2WLF/0t/jC5nWDCTSrwUDvhs5j88icyygWTIO+mxb1MQhfx6uXBPYSg2Unq1yo
 k0s7aEIJFMsRi9U1WSddBHzgrSX2TFPNSyul+ltztm1/36SJXH9V+52HYPElmUFLAGSO
 eWZN7cX2joQttvxznfvFjn3+iDlgkHSCSc/hQwIrsCkZ4/nQIaT2oYqYCANkMGI17E43
 AbyVut9qc6GdRi00p+Z3VLDw9uQ6883wmZs6aMbiU9swZBVOSUMJg1BspRVDpyWO+yJe
 pQGsKmBB04L8/lap+/SVMr8UqYET19Dmaf+i3XWG0lYGhZk2cszzw3w8dEKMPeB7rl5l
 Gkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mvNZcbwdV2DZzaz1Q9u+jT5ccl/dNtRIvjKzAKbzqIs=;
 b=QjtZEseGdBzxGgPFX69clfYnwyvxt2TAaXchL9cAO1MvoUkAjVMeRqTimSLQOKJ8WL
 pkX2XT6RxmVqlsyuloKblMXRbiTI9yIYTc1vrYqa00wf4X0mfIgdTRXjbMq8qfSLxv5T
 a/fqrqhxMvfDZ7DSdJrLDLLrdjJ3gkue//JsCwsNdv4U+KDkdfnWpayvY1IXuemkC/0l
 xN5sJToWIFAWvTT4J7Yb7RZPuC+AZFztSs0v+viC73GfRNv2oxCp3QkMsK9S1V8wqB+n
 ihfqP1Cb+ABQYPKq6uxlQ4XSWNIGQntK/tJSkBRrmNGNnwN7MRV42V1m1K+c4cLLiIWo
 vqTA==
X-Gm-Message-State: AOAM530pVheaa3d1QOJ/yiegSdSFrIaKf7LCUiPfG35oLuoHB5+ikzJ1
 NNN1GigVXeKcC66ExWZ0EPsD7Q==
X-Google-Smtp-Source: ABdhPJxxZFyCEopQ/f4CJaOnJMtRZYyEk+WEWBjWeQPsM2aDY8BDLp0/A3gZYJu4rkg2ojSY802xJw==
X-Received: by 2002:adf:a118:: with SMTP id o24mr33684139wro.15.1635272709735; 
 Tue, 26 Oct 2021 11:25:09 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id b19sm1275283wmj.9.2021.10.26.11.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:25:09 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v6 4/7] hw/i386/pc: Allow instantiating a virtio-iommu device
Date: Tue, 26 Oct 2021 19:20:23 +0100
Message-Id: <20211026182024.2642038-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211026182024.2642038-1-jean-philippe@linaro.org>
References: <20211026182024.2642038-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x431.google.com
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
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, eric.auger@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index fcbf328e8d..f47f7866c7 100644
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
2.33.0


