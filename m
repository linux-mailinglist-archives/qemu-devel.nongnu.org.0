Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DDF41F44D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 20:04:39 +0200 (CEST)
Received: from localhost ([::1]:37532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMti-0000sf-Lt
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 14:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUM-0000Zj-GE
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUF-0000l8-Po
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id r7so1132732wrc.10
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ZMT/fPQaI7mMrURnWk+8owajZ9ST42bm/R218dwfdI=;
 b=OU0OdLERdnfL4cZd4XU1LJBoB+7KHrZ/l641zlG7MT9eKYmX1Ac6+I4nYaLsU0XMtK
 mtpL2LEFVZk+FeX7Vsd0gtkR0kM6e2wOsr5fduKL3QWhZ2MLKeqDRuu36tLbQThwNXFU
 ENKbuGKnlfZFd3h/GB1kSkUjQqZ3v+XMMMucdlPtNifzhOdAypZ5J1zt7frRrVeUXzLI
 OyXST7ruWfTsvuCcKIOKQ0CubD4Dt9uv29KniksEhjQH4L3tFvPAyM5ZhfMM3+JmWkUv
 5I2EG/WClctTrSa0IxLKNZqNg8wpIX+lXri9Pn9rYjsXxv7kZKMzRDI2RsuAHE38hE62
 2xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZMT/fPQaI7mMrURnWk+8owajZ9ST42bm/R218dwfdI=;
 b=Wmclp89ig2xKeegyM2uKNnABaoag7oRTo1rMhcUP1kQi0zjl9z8rRm12eM1mUUbYDr
 OwOV5OyrVt/ZKIvQxZrtCFdCto0msI5zlqVlgrEq2CceB8w6zW1aaSOrvfU4rRjof//R
 WjmBPE7XUA5FmpqM2ApXXjyXObZmTp2qsMREpBeXUoGL0b6Khe0nkN3u+EoWA+gK36C3
 5XjGKvRhS6Wwez5Qb17vG3/2650EMvEhIT8G3TqPdXphd/uZur9iDrTDxKWB0Xi54Xz1
 Bp1aLXrBPEMsVTtsiBy5xRK/LZaf8cv5aYnPDe3YwDtwLfyf0OCiarDm6wSjRoPhAX0G
 tTdA==
X-Gm-Message-State: AOAM533AQClY7rqH2aYWXWCy/ZTz/6/dqfVub2uaHQ+ANemQI+7SNRZ7
 9tqVSStqZ2t40D6/eQEUqfpcBQ==
X-Google-Smtp-Source: ABdhPJzp3LCreZpm1exOsbk8Xsf/WwKZXvq/FQsIZJRdbbKSgbA3Pg78n1vsSQ+zAcdNTIVVGKGYuQ==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr14263403wri.62.1633109898222; 
 Fri, 01 Oct 2021 10:38:18 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 07/11] pc: Allow instantiating a virtio-iommu device
Date: Fri,  1 Oct 2021 18:33:55 +0100
Message-Id: <20211001173358.863017-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 ani@anisinha.ca, pbonzini@redhat.com
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

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/i386/pc.h |  2 ++
 hw/i386/acpi-build.c |  5 +++++
 hw/i386/pc.c         | 24 ++++++++++++++++++++++--
 hw/i386/Kconfig      |  1 +
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 82cf7b7e30..f3ba1ee4c0 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,6 +45,8 @@ typedef struct PCMachineState {
     bool pit_enabled;
     bool hpet_enabled;
     bool default_bus_bypass_iommu;
+    bool virtio_iommu;
+    uint16_t virtio_iommu_bdf;
     uint64_t max_fw_size;
 
     /* ACPI Memory hotplug IO base address */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d1c28440f4..4e46585709 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -71,6 +71,7 @@
 
 #include "hw/acpi/ipmi.h"
 #include "hw/acpi/hmat.h"
+#include "hw/acpi/viot.h"
 
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
@@ -2593,6 +2594,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
             build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
                            x86ms->oem_table_id);
         }
+    } else if (pcms->virtio_iommu) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(machine, tables_blob, tables->linker, pcms->virtio_iommu_bdf,
+                   x86ms->oem_id, x86ms->oem_table_id);
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 789ccb6ef4..31710bc4fb 100644
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
@@ -1367,8 +1368,11 @@ static void pc_virtio_md_pci_unplug(HotplugHandler *hotplug_dev,
 static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                           DeviceState *dev, Error **errp)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) &&
-        x86_iommu_get_default()) {
+    PCMachineState *pcms = PC_MACHINE(hotplug_dev);
+
+    if ((object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
+         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) &&
+        (x86_iommu_get_default() || pcms->virtio_iommu)) {
         error_setg(errp, "QEMU does not support multiple vIOMMUs "
                    "for x86 yet.");
         return;
@@ -1381,6 +1385,15 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        /* Declare the APIC range as the reserved MSI region */
+        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
+                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
+
+        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
+        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
+                                resv_prop_str, errp);
+        g_free(resv_prop_str);
     }
 }
 
@@ -1394,6 +1407,12 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
+        PCIDevice *pdev = PCI_DEVICE(dev);
+
+        pcms->virtio_iommu = true;
+        pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
     }
 }
 
@@ -1436,6 +1455,7 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
         return HOTPLUG_HANDLER(machine);
     }
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index ddedcef0b2..13db05d557 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -54,6 +54,7 @@ config PC_ACPI
     select ACPI_X86
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
+    select ACPI_VIOT
     select SMBUS_EEPROM
     select PFLASH_CFI01
     depends on ACPI_SMBUS
-- 
2.33.0


