Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE75168757B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:47:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPJ-00089Y-Ha; Thu, 02 Feb 2023 00:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPE-00088D-So
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:08 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPC-00079b-Op
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:08 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124jb3p014485; Thu, 2 Feb 2023 05:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=s1MDzqiEhZvEGj20HMCmrvGS6OT/WBSFA+G7cai9Qos=;
 b=aqjdW39hgU9Ou70SSC3FG1I6UUwX68KP5Cj7j7feOujFtk1VmobM7kTTJDPSa+RWMfuo
 gIFR2CFhAlQiM/HNO1FKg6gdPXxlk4VPiLAu8S/xw0RlSnANdlJnfyuGJCObZELoUPVr
 u+jMYRSYRA0YYkszZgbiEDj+MOKffklujoEJo6f4PTuWJdknFAb/XN+MumuTIemyP2e8
 rMHqI6EzGkrz+TGv71Vra7Uw04Y/V7UrHuqrScapC0RRUkCVVRYaVZAfCATTma90eNh/
 /jrZD2r3L1vn9zRACdA8TavKTaap0GCoM/IlIsjkMmw19J2bA3lvHvcI+j8incxmzj90 bw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfq4hj0cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:05 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254Ppg013015; Thu, 2 Feb 2023 05:45:04 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:45:04 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 11/23] vfio-user: get region info
Date: Wed,  1 Feb 2023 21:55:47 -0800
Message-Id: <f8cb1656f09ac50ab5ba68ca40be700fc2d66e59.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020053
X-Proofpoint-GUID: 1U52E3Atx7ugWV9PD93DWAwCTheSoEOx
X-Proofpoint-ORIG-GUID: 1U52E3Atx7ugWV9PD93DWAwCTheSoEOx
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

Add per-region FD to support mmap() of remote device regions

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h       | 14 +++++++++
 hw/vfio/user.h                |  2 ++
 include/hw/vfio/vfio-common.h |  5 +++-
 hw/vfio/ap.c                  |  1 +
 hw/vfio/ccw.c                 |  1 +
 hw/vfio/common.c              | 31 ++++++++++++++++++--
 hw/vfio/pci.c                 |  1 +
 hw/vfio/platform.c            |  1 +
 hw/vfio/user-pci.c            |  2 ++
 hw/vfio/user.c                | 68 +++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |  1 +
 11 files changed, 123 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 5f9ef17..6f70a48 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -125,4 +125,18 @@ typedef struct {
     uint32_t num_irqs;
 } VFIOUserDeviceInfo;
 
+/*
+ * VFIO_USER_DEVICE_GET_REGION_INFO
+ * imported from struct vfio_region_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t cap_offset;
+    uint64_t size;
+    uint64_t offset;
+} VFIOUserRegionInfo;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index d148661..e6485dc 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -93,4 +93,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
 int vfio_user_get_device(VFIODevice *vbasedev, Error **errp);
 int vfio_user_validate_version(VFIOUserProxy *proxy, Error **errp);
 
+extern VFIODeviceIO vfio_dev_io_sock;
+
 #endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 0962e37..9fb4c80 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -56,6 +56,7 @@ typedef struct VFIORegion {
     uint32_t nr_mmaps;
     VFIOMmap *mmaps;
     uint8_t nr; /* cache the region number for debug */
+    int fd; /* fd to mmap() region */
 } VFIORegion;
 
 typedef struct VFIOMigration {
@@ -140,6 +141,7 @@ typedef struct VFIODevice {
     bool no_mmap;
     bool ram_block_discard_allowed;
     bool enable_migration;
+    bool use_regfds;
     VFIODeviceOps *ops;
     VFIODeviceIO *io;
     unsigned int num_irqs;
@@ -150,6 +152,7 @@ typedef struct VFIODevice {
     OnOffAuto pre_copy_dirty_page_tracking;
     VFIOUserProxy *proxy;
     struct vfio_region_info **regions;
+    int *regfds;
 } VFIODevice;
 
 struct VFIODeviceOps {
@@ -171,7 +174,7 @@ struct VFIODeviceOps {
  */
 struct VFIODeviceIO {
     int (*get_region_info)(VFIODevice *vdev,
-                           struct vfio_region_info *info);
+                           struct vfio_region_info *info, int *fd);
     int (*get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *irq);
     int (*set_irqs)(VFIODevice *vdev, struct vfio_irq_set *irqs);
     int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index c6638d5..06d745f 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -103,6 +103,7 @@ static void vfio_ap_realize(DeviceState *dev, Error **errp)
     vapdev->vdev.name = g_strdup_printf("%s", mdevid);
     vapdev->vdev.dev = dev;
     vapdev->vdev.io = &vfio_dev_io_ioctl;
+    vapdev->vdev.use_regfds = false;
 
     /*
      * vfio-ap devices operate in a way compatible with discarding of
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index e4d840d..00605bd 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -615,6 +615,7 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
     vcdev->vdev.name = name;
     vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
     vcdev->vdev.io = &vfio_dev_io_ioctl;
+    vcdev->vdev.use_regfds = false;
 
     return;
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 792e247..d26b325 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1584,6 +1584,11 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
     region->size = info->size;
     region->fd_offset = info->offset;
     region->nr = index;
+    if (vbasedev->regfds != NULL) {
+        region->fd = vbasedev->regfds[index];
+    } else {
+        region->fd = vbasedev->fd;
+    }
 
     if (region->size) {
         region->mem = g_new0(MemoryRegion, 1);
@@ -1635,7 +1640,7 @@ int vfio_region_mmap(VFIORegion *region)
 
     for (i = 0; i < region->nr_mmaps; i++) {
         region->mmaps[i].mmap = mmap(NULL, region->mmaps[i].size, prot,
-                                     MAP_SHARED, region->vbasedev->fd,
+                                     MAP_SHARED, region->fd,
                                      region->fd_offset +
                                      region->mmaps[i].offset);
         if (region->mmaps[i].mmap == MAP_FAILED) {
@@ -2442,10 +2447,17 @@ void vfio_put_base_device(VFIODevice *vbasedev)
         int i;
 
         for (i = 0; i < vbasedev->num_regions; i++) {
+            if (vbasedev->regfds != NULL && vbasedev->regfds[i] != -1) {
+                close(vbasedev->regfds[i]);
+            }
             g_free(vbasedev->regions[i]);
         }
         g_free(vbasedev->regions);
         vbasedev->regions = NULL;
+        if (vbasedev->regfds != NULL) {
+            g_free(vbasedev->regfds);
+            vbasedev->regfds = NULL;
+        }
     }
 
     if (!vbasedev->group) {
@@ -2461,12 +2473,16 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info)
 {
     size_t argsz = sizeof(struct vfio_region_info);
+    int fd = -1;
     int ret;
 
     /* create region cache */
     if (vbasedev->regions == NULL) {
         vbasedev->regions = g_new0(struct vfio_region_info *,
                                    vbasedev->num_regions);
+        if (vbasedev->use_regfds) {
+            vbasedev->regfds = g_new0(int, vbasedev->num_regions);
+        }
     }
     /* check cache */
     if (vbasedev->regions[index] != NULL) {
@@ -2480,7 +2496,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 retry:
     (*info)->argsz = argsz;
 
-    ret = vbasedev->io->get_region_info(vbasedev, *info);
+    ret = vbasedev->io->get_region_info(vbasedev, *info, &fd);
     if (ret != 0) {
         g_free(*info);
         *info = NULL;
@@ -2490,12 +2506,19 @@ retry:
     if ((*info)->argsz > argsz) {
         argsz = (*info)->argsz;
         *info = g_realloc(*info, argsz);
+        if (fd != -1) {
+            close(fd);
+            fd = -1;
+        }
 
         goto retry;
     }
 
     /* fill cache */
     vbasedev->regions[index] = *info;
+    if (vbasedev->regfds != NULL) {
+        vbasedev->regfds[index] = fd;
+    }
 
     return 0;
 }
@@ -2646,10 +2669,12 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
  */
 
 static int vfio_io_get_region_info(VFIODevice *vbasedev,
-                                   struct vfio_region_info *info)
+                                   struct vfio_region_info *info,
+                                   int *fd)
 {
     int ret;
 
+    *fd = -1;
     ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, info);
 
     return ret < 0 ? -errno : ret;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index a8bc0ea..935d247 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2908,6 +2908,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->dev = DEVICE(vdev);
     vbasedev->io = &vfio_dev_io_ioctl;
+    vbasedev->use_regfds = false;
 
     tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 222405e..8ddfcca 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -622,6 +622,7 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
     vbasedev->dev = dev;
     vbasedev->ops = &vfio_platform_ops;
     vbasedev->io = &vfio_dev_io_ioctl;
+    vbasedev->use_regfds = false;
 
     qemu_mutex_init(&vdev->intp_mutex);
 
diff --git a/hw/vfio/user-pci.c b/hw/vfio/user-pci.c
index e5a9450..09c6c98 100644
--- a/hw/vfio/user-pci.c
+++ b/hw/vfio/user-pci.c
@@ -116,6 +116,8 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->ops = &vfio_user_pci_ops;
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->dev = DEVICE(vdev);
+    vbasedev->io = &vfio_dev_io_sock;
+    vbasedev->use_regfds = true;
 
     ret = vfio_user_get_device(vbasedev, errp);
     if (ret) {
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index d0ec14c..a05ba80 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1143,3 +1143,71 @@ static int vfio_user_get_info(VFIOUserProxy *proxy,
     memcpy(info, &msg.argsz, argsz);
     return 0;
 }
+
+static int vfio_user_get_region_info(VFIOUserProxy *proxy,
+                                     struct vfio_region_info *info,
+                                     VFIOUserFDs *fds)
+{
+    g_autofree VFIOUserRegionInfo *msgp = NULL;
+    uint32_t size;
+
+    /* data returned can be larger than vfio_region_info */
+    if (info->argsz < sizeof(*info)) {
+        error_printf("vfio_user_get_region_info argsz too small\n");
+        return -E2BIG;
+    }
+    if (fds != NULL && fds->send_fds != 0) {
+        error_printf("vfio_user_get_region_info can't send FDs\n");
+        return -EINVAL;
+    }
+
+    size = info->argsz + sizeof(VFIOUserHdr);
+    msgp = g_malloc0(size);
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_GET_REGION_INFO,
+                          sizeof(*msgp), 0);
+    msgp->argsz = info->argsz;
+    msgp->index = info->index;
+
+    vfio_user_send_wait(proxy, &msgp->hdr, fds, size, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->hdr.error_reply;
+    }
+    trace_vfio_user_get_region_info(msgp->index, msgp->flags, msgp->size);
+
+    memcpy(info, &msgp->argsz, info->argsz);
+    return 0;
+}
+
+
+/*
+ * Socket-based io_ops
+ */
+
+static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
+                                        struct vfio_region_info *info,
+                                        int *fd)
+{
+    int ret;
+    VFIOUserFDs fds = { 0, 1, fd};
+
+    ret = vfio_user_get_region_info(vbasedev->proxy, info, &fds);
+    if (ret) {
+        return ret;
+    }
+
+    if (info->index > vbasedev->num_regions) {
+        return -EINVAL;
+    }
+    /* cap_offset in valid area */
+    if ((info->flags & VFIO_REGION_INFO_FLAG_CAPS) &&
+        (info->cap_offset < sizeof(*info) || info->cap_offset > info->argsz)) {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+VFIODeviceIO vfio_dev_io_sock = {
+    .get_region_info = vfio_user_io_get_region_info,
+};
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index ff903c0..939113a 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -174,3 +174,4 @@ vfio_user_recv_request(uint16_t cmd) " command 0x%x"
 vfio_user_send_write(uint16_t id, int wrote) " id 0x%x wrote 0x%x"
 vfio_user_version(uint16_t major, uint16_t minor, const char *caps) " major %d minor %d caps: %s"
 vfio_user_get_info(uint32_t nregions, uint32_t nirqs) " #regions %d #irqs %d"
+vfio_user_get_region_info(uint32_t index, uint32_t flags, uint64_t size) " index %d flags 0x%x size 0x%"PRIx64
-- 
1.9.4


