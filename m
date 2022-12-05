Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E84642652
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:04:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28Ch-0003P2-6S; Mon, 05 Dec 2022 04:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28Ca-0003D9-57
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:55:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28CY-0007Tc-7r
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e0E6XFOGPzqvm62vJ/QfqSQvA8SKYQxBhXRiPgztEbo=;
 b=H+EjjQB969KfIz8FeoKHM52DkrGmHcwUFBvg7X0+2kcxcnnLljNtRIAksA6YbqET4qh/Cq
 ApkxhD7GrIOFRy8WADxzKI3sEtkhm34B9mSTwRU6HKjbBdUYalVSHI+nFwxX6ptkvwQJbb
 +EJreYoaGDI+iBRJ/AXjCIREFzQtgC8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-iz8BsuEyPEa7DhCV5tr_cA-1; Mon, 05 Dec 2022 04:55:48 -0500
X-MC-Unique: iz8BsuEyPEa7DhCV5tr_cA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B8F63813F20;
 Mon,  5 Dec 2022 09:55:47 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE3AC2166B29;
 Mon,  5 Dec 2022 09:55:39 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 24/51] hw/loongarch/virt: Add cfi01 pflash device
Date: Mon,  5 Dec 2022 10:52:01 +0100
Message-Id: <20221205095228.1314-25-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add cfi01 pflash device for LoongArch virt machine

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221130100647.398565-1-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 include/hw/loongarch/virt.h |  5 +++
 hw/loongarch/acpi-build.c   | 18 +++++++++++
 hw/loongarch/virt.c         | 62 +++++++++++++++++++++++++++++++++++++
 hw/loongarch/Kconfig        |  1 +
 4 files changed, 86 insertions(+)

diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 45c383f5a7..f5f818894e 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -12,6 +12,7 @@
 #include "hw/boards.h"
 #include "qemu/queue.h"
 #include "hw/intc/loongarch_ipi.h"
+#include "hw/block/flash.h"
 
 #define LOONGARCH_MAX_VCPUS     4
 
@@ -20,6 +21,9 @@
 #define VIRT_FWCFG_BASE         0x1e020000UL
 #define VIRT_BIOS_BASE          0x1c000000UL
 #define VIRT_BIOS_SIZE          (4 * MiB)
+#define VIRT_FLASH_SECTOR_SIZE  (128 * KiB)
+#define VIRT_FLASH_BASE         0x1d000000UL
+#define VIRT_FLASH_SIZE         (16 * MiB)
 
 #define VIRT_LOWMEM_BASE        0
 #define VIRT_LOWMEM_SIZE        0x10000000
@@ -48,6 +52,7 @@ struct LoongArchMachineState {
     int          fdt_size;
     DeviceState *platform_bus_dev;
     PCIBus       *pci_bus;
+    PFlashCFI01  *flash;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 7d5f5a757d..c2b237736d 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -279,6 +279,23 @@ static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
     acpi_dsdt_add_gpex(scope, &cfg);
 }
 
+static void build_flash_aml(Aml *scope, LoongArchMachineState *lams)
+{
+    Aml *dev, *crs;
+
+    hwaddr flash_base = VIRT_FLASH_BASE;
+    hwaddr flash_size = VIRT_FLASH_SIZE;
+
+    dev = aml_device("FLS0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0015")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(flash_base, flash_size, AML_READ_WRITE));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 #ifdef CONFIG_TPM
 static void acpi_dsdt_add_tpm(Aml *scope, LoongArchMachineState *vms)
 {
@@ -328,6 +345,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_uart_device_aml(dsdt);
     build_pci_device_aml(dsdt, lams);
     build_la_ged_aml(dsdt, machine);
+    build_flash_aml(dsdt, lams);
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(dsdt, lams);
 #endif
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 958be74fa1..c8a495ea30 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -42,6 +42,63 @@
 #include "hw/display/ramfb.h"
 #include "hw/mem/pc-dimm.h"
 #include "sysemu/tpm.h"
+#include "sysemu/block-backend.h"
+#include "hw/block/flash.h"
+
+static void virt_flash_create(LoongArchMachineState *lams)
+{
+    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
+
+    qdev_prop_set_uint64(dev, "sector-length", VIRT_FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 4);
+    qdev_prop_set_uint8(dev, "device-width", 2);
+    qdev_prop_set_bit(dev, "big-endian", false);
+    qdev_prop_set_uint16(dev, "id0", 0x89);
+    qdev_prop_set_uint16(dev, "id1", 0x18);
+    qdev_prop_set_uint16(dev, "id2", 0x00);
+    qdev_prop_set_uint16(dev, "id3", 0x00);
+    qdev_prop_set_string(dev, "name", "virt.flash");
+    object_property_add_child(OBJECT(lams), "virt.flash", OBJECT(dev));
+    object_property_add_alias(OBJECT(lams), "pflash",
+                              OBJECT(dev), "drive");
+
+    lams->flash = PFLASH_CFI01(dev);
+}
+
+static void virt_flash_map(LoongArchMachineState *lams,
+                           MemoryRegion *sysmem)
+{
+    PFlashCFI01 *flash = lams->flash;
+    DeviceState *dev = DEVICE(flash);
+    hwaddr base = VIRT_FLASH_BASE;
+    hwaddr size = VIRT_FLASH_SIZE;
+
+    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
+    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
+
+    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    memory_region_add_subregion(sysmem, base,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
+
+}
+
+static void fdt_add_flash_node(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    char *nodename;
+
+    hwaddr flash_base = VIRT_FLASH_BASE;
+    hwaddr flash_size = VIRT_FLASH_SIZE;
+
+    nodename = g_strdup_printf("/flash@%" PRIx64, flash_base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, flash_base, 2, flash_size);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "bank-width", 4);
+    g_free(nodename);
+}
 
 static void fdt_add_rtc_node(LoongArchMachineState *lams)
 {
@@ -596,6 +653,9 @@ static void loongarch_firmware_init(LoongArchMachineState *lams)
     int bios_size;
 
     lams->bios_loaded = false;
+
+    virt_flash_map(lams, get_system_memory());
+
     if (filename) {
         bios_name = qemu_find_file(QEMU_FILE_TYPE_BIOS, filename);
         if (!bios_name) {
@@ -779,6 +839,7 @@ static void loongarch_init(MachineState *machine)
             loongarch_direct_kernel_boot(lams);
         }
     }
+    fdt_add_flash_node(lams);
     /* register reset function */
     for (i = 0; i < machine->smp.cpus; i++) {
         lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
@@ -838,6 +899,7 @@ static void loongarch_machine_initfn(Object *obj)
     lams->acpi = ON_OFF_AUTO_AUTO;
     lams->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+    virt_flash_create(lams);
 }
 
 static bool memhp_type_supported(DeviceState *dev)
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 17d15b6c90..eb112af990 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -20,3 +20,4 @@ config LOONGARCH_VIRT
     select ACPI_HW_REDUCED
     select FW_CFG_DMA
     select DIMM
+    select PFLASH_CFI01
-- 
2.38.1


