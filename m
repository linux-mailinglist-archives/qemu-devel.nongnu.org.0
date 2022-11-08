Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95A62201D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:10:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbZ-0004rv-7c; Tue, 08 Nov 2022 18:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbU-0004ok-18
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbO-0003ef-Cr
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:01:58 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8Mx3cc026328
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=Go4SaR34fzioUFsIa0C/6EV2tprNf/cGCx7446bN6dk=;
 b=aXby3o6s4Fd/G0mN/IjfFfXyC2hMwsdgZ779NEUgUr7mK2HX8/DBfnPDmUuO/a4Fyw2S
 QqRnPj7XOVvGrpx5Aa6MI3EwHvugiKW5XFj3i5Dgq3ltRh3k+54Sm1dZ6EsdIpah7NZL
 P9KjgXbAHKpqZgUSn75RImQ6QoHo4grD00/tP396e5JfsWdyHgbpb4KvA1zKyHHOobDo
 hO/ZfP18B/iiW1GEtIM05QlVJVOiZ7onEkeKOtMDXTFfPBOJmZbLxWpQYnj/HJW63V+A
 NizBM+wG4aCpqZBg8guoiQAeP4wry5HzSVBWAO4QpiIocAzC0riTEUiuYCuhFwqmRndF vQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqy68g7w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:46 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6H004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:44 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:44 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/24] vfio-user: add region cache
Date: Tue,  8 Nov 2022 15:13:26 -0800
Message-Id: <9440b5c4c72085055eaa9cdb1f4671adb04d78a4.1667542066.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211080151
X-Proofpoint-GUID: WsPnSxGg-GvV9hdQp23yfuW4b4dPnN2j
X-Proofpoint-ORIG-GUID: WsPnSxGg-GvV9hdQp23yfuW4b4dPnN2j
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

cache VFIO_DEVICE_GET_REGION_INFO results to reduce
memory alloc/free cycles and as prep work for vfio-user

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/ccw.c                 |  5 -----
 hw/vfio/common.c              | 41 +++++++++++++++++++++++++++++++++++------
 hw/vfio/igd.c                 | 23 +++++++++--------------
 hw/vfio/migration.c           |  2 --
 hw/vfio/pci-quirks.c          | 19 +++++--------------
 hw/vfio/pci.c                 |  8 --------
 include/hw/vfio/vfio-common.h |  2 ++
 7 files changed, 51 insertions(+), 49 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 0354737..06b588c 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -517,7 +517,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
 
     vcdev->io_region_offset = info->offset;
     vcdev->io_region = g_malloc0(info->size);
-    g_free(info);
 
     /* check for the optional async command region */
     ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
@@ -530,7 +529,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         }
         vcdev->async_cmd_region_offset = info->offset;
         vcdev->async_cmd_region = g_malloc0(info->size);
-        g_free(info);
     }
 
     ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
@@ -543,7 +541,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         }
         vcdev->schib_region_offset = info->offset;
         vcdev->schib_region = g_malloc(info->size);
-        g_free(info);
     }
 
     ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
@@ -557,7 +554,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         }
         vcdev->crw_region_offset = info->offset;
         vcdev->crw_region = g_malloc(info->size);
-        g_free(info);
     }
 
     return;
@@ -567,7 +563,6 @@ out_err:
     g_free(vcdev->schib_region);
     g_free(vcdev->async_cmd_region);
     g_free(vcdev->io_region);
-    g_free(info);
     return;
 }
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 83d69b9..dd9104f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1600,8 +1600,6 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
         }
     }
 
-    g_free(info);
-
     trace_vfio_region_setup(vbasedev->name, index, name,
                             region->flags, region->fd_offset, region->size);
     return 0;
@@ -2357,6 +2355,16 @@ void vfio_put_group(VFIOGroup *group)
     }
 }
 
+void vfio_get_all_regions(VFIODevice *vbasedev)
+{
+    struct vfio_region_info *info;
+    int i;
+
+    for (i = 0; i < vbasedev->num_regions; i++) {
+        vfio_get_region_info(vbasedev, i, &info);
+    }
+}
+
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp)
 {
@@ -2412,12 +2420,23 @@ int vfio_get_device(VFIOGroup *group, const char *name,
     trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
                           dev_info.num_irqs);
 
+    vfio_get_all_regions(vbasedev);
     vbasedev->reset_works = !!(dev_info.flags & VFIO_DEVICE_FLAGS_RESET);
     return 0;
 }
 
 void vfio_put_base_device(VFIODevice *vbasedev)
 {
+    if (vbasedev->regions != NULL) {
+        int i;
+
+        for (i = 0; i < vbasedev->num_regions; i++) {
+            g_free(vbasedev->regions[i]);
+        }
+        g_free(vbasedev->regions);
+        vbasedev->regions = NULL;
+    }
+
     if (!vbasedev->group) {
         return;
     }
@@ -2432,6 +2451,17 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 {
     size_t argsz = sizeof(struct vfio_region_info);
 
+    /* create region cache */
+    if (vbasedev->regions == NULL) {
+        vbasedev->regions = g_new0(struct vfio_region_info *,
+                                   vbasedev->num_regions);
+    }
+    /* check cache */
+    if (vbasedev->regions[index] != NULL) {
+        *info = vbasedev->regions[index];
+        return 0;
+    }
+
     *info = g_malloc0(argsz);
 
     (*info)->index = index;
@@ -2451,6 +2481,9 @@ retry:
         goto retry;
     }
 
+    /* fill cache */
+    vbasedev->regions[index] = *info;
+
     return 0;
 }
 
@@ -2469,7 +2502,6 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
 
         hdr = vfio_get_region_info_cap(*info, VFIO_REGION_INFO_CAP_TYPE);
         if (!hdr) {
-            g_free(*info);
             continue;
         }
 
@@ -2481,8 +2513,6 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
         if (cap_type->type == type && cap_type->subtype == subtype) {
             return 0;
         }
-
-        g_free(*info);
     }
 
     *info = NULL;
@@ -2498,7 +2528,6 @@ bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_type)
         if (vfio_get_region_info_cap(info, cap_type)) {
             ret = true;
         }
-        g_free(info);
     }
 
     return ret;
diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
index afe3fe7..22efa1a 100644
--- a/hw/vfio/igd.c
+++ b/hw/vfio/igd.c
@@ -425,7 +425,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if ((ret || !rom->size) && !vdev->pdev.romfile) {
         error_report("IGD device %s has no ROM, legacy mode disabled",
                      vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     /*
@@ -436,7 +436,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
         error_report("IGD device %s hotplugged, ROM disabled, "
                      "legacy mode disabled", vdev->vbasedev.name);
         vdev->rom_read_failed = true;
-        goto out;
+        return;
     }
 
     /*
@@ -449,7 +449,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_report("IGD device %s does not support OpRegion access,"
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     ret = vfio_get_dev_region_info(&vdev->vbasedev,
@@ -458,7 +458,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_report("IGD device %s does not support host bridge access,"
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     ret = vfio_get_dev_region_info(&vdev->vbasedev,
@@ -467,7 +467,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_report("IGD device %s does not support LPC bridge access,"
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     gmch = vfio_pci_read_config(&vdev->pdev, IGD_GMCH, 4);
@@ -481,7 +481,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
         error_report("IGD device %s failed to enable VGA access, "
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     /* Create our LPC/ISA bridge */
@@ -489,7 +489,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_report("IGD device %s failed to create LPC bridge, "
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     /* Stuff some host values into the VM PCI host bridge */
@@ -497,7 +497,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_report("IGD device %s failed to modify host bridge, "
                      "legacy mode disabled", vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     /* Setup OpRegion access */
@@ -505,7 +505,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     if (ret) {
         error_append_hint(&err, "IGD legacy mode disabled\n");
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
-        goto out;
+        return;
     }
 
     /* Setup our quirk to munge GTT addresses to the VM allocated buffer */
@@ -608,9 +608,4 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
 
     trace_vfio_pci_igd_bdsm_enabled(vdev->vbasedev.name, ggms_mb + gms_mb);
 
-out:
-    g_free(rom);
-    g_free(opregion);
-    g_free(host);
-    g_free(lpc);
 }
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a6ad1f8..397be43 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -879,13 +879,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
     }
 
     trace_vfio_migration_probe(vbasedev->name, info->index);
-    g_free(info);
     return 0;
 
 add_blocker:
     error_setg(&vbasedev->migration_blocker,
                "VFIO device doesn't support migration");
-    g_free(info);
 
     ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
     if (ret < 0) {
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index f0147a0..c04ee19 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1585,16 +1585,14 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
 
     hdr = vfio_get_region_info_cap(nv2reg, VFIO_REGION_INFO_CAP_NVLINK2_SSATGT);
     if (!hdr) {
-        ret = -ENODEV;
-        goto free_exit;
+        return -ENODEV;
     }
     cap = (void *) hdr;
 
     p = mmap(NULL, nv2reg->size, PROT_READ | PROT_WRITE,
              MAP_SHARED, vdev->vbasedev.fd, nv2reg->offset);
     if (p == MAP_FAILED) {
-        ret = -errno;
-        goto free_exit;
+        return -errno;
     }
 
     quirk = vfio_quirk_alloc(1);
@@ -1607,8 +1605,6 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
                                    OBJ_PROP_FLAG_READ);
     trace_vfio_pci_nvidia_gpu_setup_quirk(vdev->vbasedev.name, cap->tgt,
                                           nv2reg->size);
-free_exit:
-    g_free(nv2reg);
 
     return ret;
 }
@@ -1635,16 +1631,14 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
     hdr = vfio_get_region_info_cap(atsdreg,
                                    VFIO_REGION_INFO_CAP_NVLINK2_SSATGT);
     if (!hdr) {
-        ret = -ENODEV;
-        goto free_exit;
+        return -ENODEV;
     }
     captgt = (void *) hdr;
 
     hdr = vfio_get_region_info_cap(atsdreg,
                                    VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD);
     if (!hdr) {
-        ret = -ENODEV;
-        goto free_exit;
+        return -ENODEV;
     }
     capspeed = (void *) hdr;
 
@@ -1653,8 +1647,7 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
         p = mmap(NULL, atsdreg->size, PROT_READ | PROT_WRITE,
                  MAP_SHARED, vdev->vbasedev.fd, atsdreg->offset);
         if (p == MAP_FAILED) {
-            ret = -errno;
-            goto free_exit;
+            return -errno;
         }
 
         quirk = vfio_quirk_alloc(1);
@@ -1674,8 +1667,6 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
                                    OBJ_PROP_FLAG_READ);
     trace_vfio_pci_nvlink2_setup_quirk_lnkspd(vdev->vbasedev.name,
                                               capspeed->link_speed);
-free_exit:
-    g_free(atsdreg);
 
     return ret;
 }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 60acde5..1c7618d 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -836,8 +836,6 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
     vdev->rom_size = size = reg_info->size;
     vdev->rom_offset = reg_info->offset;
 
-    g_free(reg_info);
-
     if (!vdev->rom_size) {
         vdev->rom_read_failed = true;
         error_report("vfio-pci: Cannot read device rom at "
@@ -2564,7 +2562,6 @@ int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
         error_setg(errp, "unexpected VGA info, flags 0x%lx, size 0x%lx",
                    (unsigned long)reg_info->flags,
                    (unsigned long)reg_info->size);
-        g_free(reg_info);
         return -EINVAL;
     }
 
@@ -2573,8 +2570,6 @@ int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
     vdev->vga->fd_offset = reg_info->offset;
     vdev->vga->fd = vdev->vbasedev.fd;
 
-    g_free(reg_info);
-
     vdev->vga->region[QEMU_PCI_VGA_MEM].offset = QEMU_PCI_VGA_MEM_BASE;
     vdev->vga->region[QEMU_PCI_VGA_MEM].nr = QEMU_PCI_VGA_MEM;
     QLIST_INIT(&vdev->vga->region[QEMU_PCI_VGA_MEM].quirks);
@@ -2669,8 +2664,6 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
     }
     vdev->config_offset = reg_info->offset;
 
-    g_free(reg_info);
-
     if (vdev->features & VFIO_FEATURE_ENABLE_VGA) {
         ret = vfio_populate_vga(vdev, errp);
         if (ret) {
@@ -3079,7 +3072,6 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
 
         ret = vfio_pci_igd_opregion_init(vdev, opregion, errp);
-        g_free(opregion);
         if (ret) {
             goto out_teardown;
         }
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6fd40f1..a1db165 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -145,6 +145,7 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    struct vfio_region_info **regions;
 } VFIODevice;
 
 struct VFIODeviceOps {
@@ -258,6 +259,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info);
 int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
                              uint32_t subtype, struct vfio_region_info **info);
+void vfio_get_all_regions(VFIODevice *vbasedev);
 bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_type);
 struct vfio_info_cap_header *
 vfio_get_region_info_cap(struct vfio_region_info *info, uint16_t id);
-- 
1.8.3.1


