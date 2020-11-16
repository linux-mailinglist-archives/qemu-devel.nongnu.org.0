Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F92B41AC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:49:32 +0100 (CET)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kec4h-0006Bp-9E
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebxx-0007xF-Ei; Mon, 16 Nov 2020 05:42:35 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:41330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebxu-0000YD-LP; Mon, 16 Nov 2020 05:42:33 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAeAO7126607;
 Mon, 16 Nov 2020 10:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=Ig7ZX54D3gJ7u/x4bH9mITVitb1U3FNzzy73EbHWHoU=;
 b=NfnEDe58+ydU7TjAXAYgeCBV4B6Sc2L6sYtxv69ADqpkG/d+Tn6JJOrblYmz1jPiKcpb
 iFC60Uj5zoMtZJGOKoVAT+4RUD16SJRUAbwTYmJHDCQgeFn0hu4RgGBtIMNpBExeN6SU
 vwbBuydhJKohTmOrMXJK7XIfB2Ad6vn4amqjeabO3EQM0+apzxP7y26Lo2etlzr8CnRf
 lUwBQ+wiZlsXv4+BBaz0hn35sMrl7pVMeMfhVn6Q2G7wstQamLrRopjh9lccKbeDWqjo
 M1HMssBZCAnnnDmOBkEfd+QDdpA6fx6kLSKyvEvYv3tLpUQ2SGeALkgNOC12XZ0dHIS1 7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 34t4ramj0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Nov 2020 10:42:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAfAqi068479;
 Mon, 16 Nov 2020 10:42:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 34umcwp46s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 10:42:25 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AGAgOeP025557;
 Mon, 16 Nov 2020 10:42:24 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 16 Nov 2020 02:42:23 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id b3324a9f;
 Mon, 16 Nov 2020 10:42:16 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/5] hw/arm: Flash image mapping follows image size
Date: Mon, 16 Nov 2020 10:42:15 +0000
Message-Id: <20201116104216.439650-5-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116104216.439650-1-david.edmondson@oracle.com>
References: <20201116104216.439650-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=3 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160062
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 05:42:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When mapping flash images into the bottom 128MB, create mappings that
match the size of the underlying block device rather than 64MB.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/arm/trace-events      |  2 +
 hw/arm/virt-acpi-build.c | 29 ++++++++-------
 hw/arm/virt.c            | 79 +++++++++++++++++++++-------------------
 include/hw/arm/virt.h    |  1 +
 4 files changed, 60 insertions(+), 51 deletions(-)

diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index a335ee891d..a9174f8fba 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -53,3 +53,5 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
 
+# virt.c
+virt_flash_map1(const char *name, uint64_t base, uint64_t size) "map %s at 0x%"PRIx64" + 0x%"PRIx64
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9747a6458f..2c08d36624 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -102,28 +102,31 @@ static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
     aml_append(scope, dev);
 }
 
-static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
+static void acpi_dsdt_add_flash1(Aml *scope, int index,
+                                 hwaddr base, hwaddr size)
 {
     Aml *dev, *crs;
-    hwaddr base = flash_memmap->base;
-    hwaddr size = flash_memmap->size / 2;
 
-    dev = aml_device("FLS0");
+    dev = aml_device("FLS%u", index);
     aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0015")));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_UID", aml_int(index)));
 
     crs = aml_resource_template();
     aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
     aml_append(dev, aml_name_decl("_CRS", crs));
     aml_append(scope, dev);
+}
 
-    dev = aml_device("FLS1");
-    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0015")));
-    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
-    crs = aml_resource_template();
-    aml_append(crs, aml_memory32_fixed(base + size, size, AML_READ_WRITE));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-    aml_append(scope, dev);
+static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap,
+    PFlashCFI01 *flash[2])
+{
+    acpi_dsdt_add_flash1(scope, 0,
+                         flash_memmap->base,
+                         virt_flash_size(flash[0]));
+
+    acpi_dsdt_add_flash1(scope, 1,
+                         flash_memmap->base + flash_memmap->size / 2,
+                         virt_flash_size(flash[1]));
 }
 
 static void acpi_dsdt_add_virtio(Aml *scope,
@@ -603,7 +606,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
-        acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
+        acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH], vms->flash);
     }
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f9f10987dc..03ec844bf3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -50,6 +50,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/tpm.h"
 #include "sysemu/kvm.h"
+#include "sysemu/block-backend.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 #include "qemu/bitops.h"
@@ -78,6 +79,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "trace.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -931,6 +933,11 @@ static void create_virtio_devices(const VirtMachineState *vms)
 
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
+int64_t virt_flash_size(PFlashCFI01 *flash)
+{
+    return blk_getlength(pflash_cfi01_get_blk(flash));
+}
+
 static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
                                         const char *name,
                                         const char *alias_prop_name)
@@ -969,6 +976,8 @@ static void virt_flash_map1(PFlashCFI01 *flash,
     DeviceState *dev = DEVICE(flash);
     const char *name = blk_name(pflash_cfi01_get_blk(flash));
 
+    trace_virt_flash_map1(name, base, size);
+
     if (size == 0 || !QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE)) {
         error_report("system firmware block device %s has invalid size "
                      "%" PRId64, name, size);
@@ -995,63 +1004,57 @@ static void virt_flash_map(VirtMachineState *vms,
                            MemoryRegion *secure_sysmem)
 {
     /*
-     * Map two flash devices to fill the VIRT_FLASH space in the memmap.
+     * Map two flash devices in the VIRT_FLASH space in the memmap.
      * sysmem is the system memory space. secure_sysmem is the secure view
      * of the system, and the first flash device should be made visible only
      * there. The second flash device is visible to both secure and nonsecure.
      * If sysmem == secure_sysmem this means there is no separate Secure
      * address space and both flash devices are generally visible.
      */
-    hwaddr flashsize = vms->memmap[VIRT_FLASH].size / 2;
-    hwaddr flashbase = vms->memmap[VIRT_FLASH].base;
+    MemMapEntry *m = &vms->memmap[VIRT_FLASH];
 
-    virt_flash_map1(vms->flash[0], flashbase, flashsize,
-                    secure_sysmem);
-    virt_flash_map1(vms->flash[1], flashbase + flashsize, flashsize,
-                    sysmem);
+    virt_flash_map1(vms->flash[0], m->base,
+                    virt_flash_size(vms->flash[0]), secure_sysmem);
+
+    virt_flash_map1(vms->flash[1], m->base + m->size / 2,
+                    virt_flash_size(vms->flash[1]), sysmem);
 }
 
 static void virt_flash_fdt(VirtMachineState *vms,
                            MemoryRegion *sysmem,
                            MemoryRegion *secure_sysmem)
 {
-    hwaddr flashsize = vms->memmap[VIRT_FLASH].size / 2;
-    hwaddr flashbase = vms->memmap[VIRT_FLASH].base;
+    bool secure = sysmem != secure_sysmem;
+    MemMapEntry *m = &vms->memmap[VIRT_FLASH];
+    hwaddr flashbase0 = m->base;
+    hwaddr flashbase1 = m->base + m->size / 2;
+    hwaddr flashsize0 = virt_flash_size(vms->flash[0]);
+    hwaddr flashsize1 = virt_flash_size(vms->flash[1]);
     char *nodename;
 
-    if (sysmem == secure_sysmem) {
-        /* Report both flash devices as a single node in the DT */
-        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
-        qemu_fdt_add_subnode(vms->fdt, nodename);
-        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
-        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                     2, flashbase, 2, flashsize,
-                                     2, flashbase + flashsize, 2, flashsize);
-        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
-        g_free(nodename);
+    if (secure) {
+        nodename = g_strdup_printf("/secflash@%" PRIx64, flashbase0);
     } else {
-        /*
-         * Report the devices as separate nodes so we can mark one as
-         * only visible to the secure world.
-         */
-        nodename = g_strdup_printf("/secflash@%" PRIx64, flashbase);
-        qemu_fdt_add_subnode(vms->fdt, nodename);
-        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
-        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                     2, flashbase, 2, flashsize);
-        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase0);
+    }
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                 2, flashbase0, 2, flashsize0);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+    if (secure) {
         qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
         qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
-        g_free(nodename);
-
-        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
-        qemu_fdt_add_subnode(vms->fdt, nodename);
-        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
-        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                     2, flashbase + flashsize, 2, flashsize);
-        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
-        g_free(nodename);
     }
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/flash@%" PRIx64, flashbase1);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                 2, flashbase1, 2, flashsize1);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+    g_free(nodename);
 }
 
 static bool virt_firmware_init(VirtMachineState *vms,
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index aad6d69841..ee21d691ea 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -172,6 +172,7 @@ OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
 bool virt_is_acpi_enabled(VirtMachineState *vms);
+int64_t virt_flash_size(PFlashCFI01 *flash);
 
 /* Return the number of used redistributor regions  */
 static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
-- 
2.28.0


