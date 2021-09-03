Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B140015C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:41:08 +0200 (CEST)
Received: from localhost ([::1]:46224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMANP-00024e-Df
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFJ-0004MI-MY
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:47 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFI-0005gp-2b
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id n5so8500801wro.12
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ML4iX6CFCZNHlVUqfCS6XVSF7GyOD2bEAeWn+nVwWZ4=;
 b=Jp3N57nQeWK9FnE2qNloGy3jMZaRiAsKcWsu94VHm7GdypSuZhachsocQkSmJiKnH8
 jvHEE7iCIQQK5/SK6HSl8Fc5gSvSbOwnAHuAhJtFicQc4y2UNwrEaxpee0WDB4IudajO
 HE++DjngBdOfnjNQPP5ge2lTPef8MsK8UZYDIHghybqH9to5/Y1qptHua9pyVcJ96iyG
 jWU1ADgEZsuSsXs26YmHC47dMDpYkxbqLEbNdamxIyied9me3JNoES+FlavI6BnxTBeN
 Lc7i4K7u7opnKTBFrSkc+c5/jKgPW9Kw9Wfdyj1QOE1wmnMi8a8+aU2FJRoKi+NQpulE
 Gelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ML4iX6CFCZNHlVUqfCS6XVSF7GyOD2bEAeWn+nVwWZ4=;
 b=MbWasJcdhckntRJElr3lnUK3ZpDaOXR08vlJRzQ2h5uyJzf1nRMURb4AvH3e6hpAFc
 eZKqdjxhNjP+cQBvR/42Uyvv40ZY6Pba2PCjkzHBIpB6/+wETpxAUryi1Onpemc/RaCs
 T5N3wV0cwV3rNMsWkL/X+6N6RLvVMlamDIC9LMkC/wvlDD5vYjz9t8Etp6Q8nk+J1sYU
 wI8O2gp5pCdKlcOslRm0urQAK0KBNHsdsKWRcqmriN100gNVGZaxn7YE37DnUMugg52d
 WDHoSiBsrN8e+8OEWT7+VhOZgODLhW+S1Jrk4MRL5+ZxlLlGYtcEdOp9IZvA25cymTf2
 vwZw==
X-Gm-Message-State: AOAM530sgwcbu5TYqtJCTd8nA9mjwrYCbxn+hseSg/Kb9eZJF3IhvRpc
 I69iYOr1qL+hzio6ZQCO+bSTtA==
X-Google-Smtp-Source: ABdhPJwBF6aqxN84Nadej+9YabICyOOUENKKCrQQOfMZARrNiGC9Jgkl5WWYTzDsp/z3X4suYv7Ncw==
X-Received: by 2002:adf:b781:: with SMTP id s1mr4533749wre.165.1630679562704; 
 Fri, 03 Sep 2021 07:32:42 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:42 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 6/8] pc: Add VIOT table for virtio-iommu
Date: Fri,  3 Sep 2021 16:32:07 +0200
Message-Id: <20210903143208.2434284-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The ACPI Virtual I/O Translation table (VIOT) describes the relation
between a virtio-iommu and the endpoints it manages. When a virtio-iommu
device is instantiated, add a VIOT table.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/i386/Kconfig      | 1 +
 include/hw/i386/pc.h | 2 ++
 hw/i386/acpi-build.c | 5 +++++
 hw/i386/pc.c         | 7 +++++++
 4 files changed, 15 insertions(+)

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
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88dffe7517..979b8d0b7c 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,6 +45,8 @@ typedef struct PCMachineState {
     bool pit_enabled;
     bool hpet_enabled;
     bool default_bus_bypass_iommu;
+    bool virtio_iommu;
+    uint16_t virtio_iommu_bdf;
     uint64_t max_fw_size;
 
     /* NUMA information: */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a33ac8b91e..078b7f5c6f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -71,6 +71,7 @@
 
 #include "hw/acpi/ipmi.h"
 #include "hw/acpi/hmat.h"
+#include "hw/acpi/viot.h"
 
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
@@ -2559,6 +2560,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
             build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
                            x86ms->oem_table_id);
         }
+    } else if (pcms->virtio_iommu) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(tables_blob, tables->linker, pcms->virtio_iommu_bdf,
+                   x86ms->oem_id, x86ms->oem_table_id);
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c2b9d62a35..694fc9ce07 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -84,6 +84,7 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/net/ne2000-isa.h"
 #include "standard-headers/asm-x86/bootparam.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "hw/virtio/virtio-pmem-pci.h"
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/mem/memory-device.h"
@@ -1388,6 +1389,12 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
 
-- 
2.33.0


