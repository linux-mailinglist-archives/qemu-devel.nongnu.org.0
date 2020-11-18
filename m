Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0B2B7C47
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 12:20:30 +0100 (CET)
Received: from localhost ([::1]:38172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfLVl-0001f3-Dh
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 06:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kfLU0-00007m-Hp; Wed, 18 Nov 2020 06:18:40 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:52802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kfLTv-0002xn-6p; Wed, 18 Nov 2020 06:18:40 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIBEGt5026703;
 Wed, 18 Nov 2020 11:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=ng8oSMkG5tH2O/pKjw9WzZZE2q7ts1JlGcPvAyqm/3E=;
 b=x/3ENjELiWudHjdItTO5W9+qxCGOwkc4kQs2qYaJtwxQ6dRvvRqdIjM+9iX21AM6ONrf
 tLaA396ktafsmLzEXE9n6xBFYqjoqWfDBrIvu/tIm/CylJNoZ+0I5xdSc4Atrc7CDG65
 g98Z/5Sr3jWgu/GZVishXxOxaXHaQvNng3aoy4MA7i50R2kdLrT6/ciAF6+JJMlhCPSZ
 eBVXFQBDauZs04nrDykUgZuLryT3QZZc4qD3YNq66pcAagn0EuOxq0S9olfkLv8uih6X
 hCUm/TkeKLYysH2Ikt8eER7p0k7gD/lVQxUdssmkoTovAlumf7yMa3NTlLC7svCOxYVC 1w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 34t76kyhu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Nov 2020 11:18:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIBFWan104538;
 Wed, 18 Nov 2020 11:18:30 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 34ts0s6cgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 11:18:30 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AIBISRd026228;
 Wed, 18 Nov 2020 11:18:28 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Nov 2020 03:18:28 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 0f2c299a;
 Wed, 18 Nov 2020 11:18:19 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] hw/arm: Only minimise flash size on older machines
Date: Wed, 18 Nov 2020 11:18:19 +0000
Message-Id: <20201118111819.4588-6-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118111819.4588-1-david.edmondson@oracle.com>
References: <20201118111819.4588-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 bulkscore=0 suspectscore=3 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011180079
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=david.edmondson@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 06:18:27
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

Prior to 5.2 the flash images loaded into the bottom 128MB always
filled the region. Ensure that this continues to be the case.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/arm/virt-acpi-build.c | 11 +++---
 hw/arm/virt.c            | 79 ++++++++++++++++++++++++++--------------
 include/hw/arm/virt.h    |  3 +-
 3 files changed, 60 insertions(+), 33 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 2c08d36624..6e3d72a9e9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -117,16 +117,17 @@ static void acpi_dsdt_add_flash1(Aml *scope, int index,
     aml_append(scope, dev);
 }
 
-static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap,
-    PFlashCFI01 *flash[2])
+static void acpi_dsdt_add_flash(Aml *scope, VirtMachineState *vms)
 {
+    MemMapEntry *flash_memmap = &vms->memmap[VIRT_FLASH];
+
     acpi_dsdt_add_flash1(scope, 0,
                          flash_memmap->base,
-                         virt_flash_size(flash[0]));
+                         virt_flash_size(vms, vms->flash[0]));
 
     acpi_dsdt_add_flash1(scope, 1,
                          flash_memmap->base + flash_memmap->size / 2,
-                         virt_flash_size(flash[1]));
+                         virt_flash_size(vms, vms->flash[1]));
 }
 
 static void acpi_dsdt_add_virtio(Aml *scope,
@@ -606,7 +607,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
-        acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH], vms->flash);
+        acpi_dsdt_add_flash(scope, vms);
     }
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0744a512f2..88495c1fb4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -933,9 +933,15 @@ static void create_virtio_devices(const VirtMachineState *vms)
 
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
-int64_t virt_flash_size(PFlashCFI01 *flash)
+int64_t virt_flash_size(VirtMachineState *vms, PFlashCFI01 *flash)
 {
-    return blk_getlength(pflash_cfi01_get_blk(flash));
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
+    if (vmc->maximize_flash_size) {
+        return vms->memmap[VIRT_FLASH].size / 2;
+    } else {
+        return blk_getlength(pflash_cfi01_get_blk(flash));
+    }
 }
 
 static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
@@ -1014,47 +1020,65 @@ static void virt_flash_map(VirtMachineState *vms,
     MemMapEntry *m = &vms->memmap[VIRT_FLASH];
 
     virt_flash_map1(vms->flash[0], m->base,
-                    virt_flash_size(vms->flash[0]), secure_sysmem);
+                    virt_flash_size(vms, vms->flash[0]), secure_sysmem);
 
     virt_flash_map1(vms->flash[1], m->base + m->size / 2,
-                    virt_flash_size(vms->flash[1]), sysmem);
+                    virt_flash_size(vms, vms->flash[1]), sysmem);
 }
 
 static void virt_flash_fdt(VirtMachineState *vms,
                            MemoryRegion *sysmem,
                            MemoryRegion *secure_sysmem)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     bool secure = sysmem != secure_sysmem;
     MemMapEntry *m = &vms->memmap[VIRT_FLASH];
     hwaddr flashbase0 = m->base;
     hwaddr flashbase1 = m->base + m->size / 2;
-    hwaddr flashsize0 = virt_flash_size(vms->flash[0]);
-    hwaddr flashsize1 = virt_flash_size(vms->flash[1]);
+    hwaddr flashsize0 = virt_flash_size(vms, vms->flash[0]);
+    hwaddr flashsize1 = virt_flash_size(vms, vms->flash[1]);
     char *nodename;
 
-    if (secure) {
-        nodename = g_strdup_printf("/secflash@%" PRIx64, flashbase0);
-    } else {
+    if (vmc->maximize_flash_size && !secure) {
+        /* Report both flash devices as a single node in the DT */
         nodename = g_strdup_printf("/flash@%" PRIx64, flashbase0);
-    }
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                 2, flashbase0, 2, flashsize0);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
-    if (secure) {
-        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
-        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
-    }
-    g_free(nodename);
+        qemu_fdt_add_subnode(vms->fdt, nodename);
+        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                     2, flashbase0, 2, flashsize0,
+                                     2, flashbase1, 2, flashsize1);
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+        g_free(nodename);
+    } else {
+        /*
+         * If we are not intending to fill the flash region or one is
+         * device is secure, report two distinct nodes.
+         */
+        if (secure) {
+            nodename = g_strdup_printf("/secflash@%" PRIx64, flashbase0);
+        } else {
+            nodename = g_strdup_printf("/flash@%" PRIx64, flashbase0);
+        }
+        qemu_fdt_add_subnode(vms->fdt, nodename);
+        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                     2, flashbase0, 2, flashsize0);
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+        if (secure) {
+            qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
+            qemu_fdt_setprop_string(vms->fdt, nodename,
+                                    "secure-status", "okay");
+        }
+        g_free(nodename);
 
-    nodename = g_strdup_printf("/flash@%" PRIx64, flashbase1);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                 2, flashbase1, 2, flashsize1);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
-    g_free(nodename);
+        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase1);
+        qemu_fdt_add_subnode(vms->fdt, nodename);
+        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                     2, flashbase1, 2, flashsize1);
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+        g_free(nodename);
+    }
 }
 
 static bool virt_firmware_init(VirtMachineState *vms,
@@ -2614,6 +2638,7 @@ static void virt_machine_5_1_options(MachineClass *mc)
     virt_machine_5_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     vmc->no_kvm_steal_time = true;
+    vmc->maximize_flash_size = true;
 }
 DEFINE_VIRT_MACHINE(5, 1)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ee21d691ea..1135e7e165 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -127,6 +127,7 @@ struct VirtMachineClass {
     bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
+    bool maximize_flash_size;
 };
 
 struct VirtMachineState {
@@ -172,7 +173,7 @@ OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
 bool virt_is_acpi_enabled(VirtMachineState *vms);
-int64_t virt_flash_size(PFlashCFI01 *flash);
+int64_t virt_flash_size(VirtMachineState *vms, PFlashCFI01 *flash);
 
 /* Return the number of used redistributor regions  */
 static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
-- 
2.29.2


