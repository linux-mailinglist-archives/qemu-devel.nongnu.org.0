Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6C500BD1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 13:08:17 +0200 (CEST)
Received: from localhost ([::1]:60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nexKi-0007sN-2U
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 07:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0n-0002Vy-KF
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:41 -0400
Received: from mga12.intel.com ([192.55.52.136]:34772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0k-0005Kn-BM
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649933258; x=1681469258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KHydA018jKFqdkeNibVMAGbxhdJmQrL0qfYlDKZbHHU=;
 b=Ydwly7ceogGIuWi8G2rPbfh8lHxdGNCPbBAUTcDuKEdRLUS4FlmOufeh
 KP+0AOMIq79FUQ5Q+se1yP39K2kTAOz52PRmYAcbujPsuRWe0DAVFJa0E
 Z+8cAhlU2XvFA7suCi7gTTIDe3BJJ9zS5/pt317Tfc5fEU6+fsTPtwrRA
 GstYTbO9gO5fwl4EtgpcyTESvBf9Al21ngmr/N4O31V05ilfP9Tbp4sYU
 gMtiL2WUpU/xr2CS+JAgrc5bXXGoKWRkiGBU+FkK/nxsrZL10tUT7t0F4
 NlWxbXz6pLLHzDIM6b1zaVkO3h+eljCUoLtrqdXizm5A2hv7QSndeJjCl A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="242836505"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="242836505"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="803091230"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2022 03:47:19 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC 11/18] vfio/ccw: Use vfio_[attach/detach]_device
Date: Thu, 14 Apr 2022 03:47:03 -0700
Message-Id: <20220414104710.28534-12-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220414104710.28534-1-yi.l.liu@intel.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yi.l.liu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, thuth@redhat.com,
 yi.l.liu@intel.com, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 jasowang@redhat.com, farman@linux.ibm.com, peterx@redhat.com,
 pasic@linux.ibm.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 chao.p.peng@intel.com, nicolinc@nvidia.com, kevin.tian@intel.com,
 jgg@nvidia.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Let the vfio-ccw device use vfio_attach_device() and
vfio_detach_device(), hence hiding the details of the used
IOMMU backend.

Also now all the devices have been migrated to use the new
vfio_attach_device/vfio_detach_device API, let's turn the
legacy functions into static functions, local to container.c.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/vfio/ccw.c                 | 118 ++++++++--------------------------
 hw/vfio/container.c           |   8 +--
 include/hw/vfio/vfio-common.h |   4 --
 3 files changed, 32 insertions(+), 98 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 0354737666..6fde7849cc 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -579,27 +579,32 @@ static void vfio_ccw_put_region(VFIOCCWDevice *vcdev)
     g_free(vcdev->io_region);
 }
 
-static void vfio_ccw_put_device(VFIOCCWDevice *vcdev)
-{
-    g_free(vcdev->vdev.name);
-    vfio_put_base_device(&vcdev->vdev);
-}
-
-static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
-                                Error **errp)
+static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 {
+    CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
+    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
+    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
+    VFIODevice *vbasedev = &vcdev->vdev;
+    Error *err = NULL;
     char *name = g_strdup_printf("%x.%x.%04x", vcdev->cdev.hostid.cssid,
                                  vcdev->cdev.hostid.ssid,
                                  vcdev->cdev.hostid.devid);
-    VFIODevice *vbasedev;
+    int ret;
 
-    QLIST_FOREACH(vbasedev, &group->device_list, next) {
-        if (strcmp(vbasedev->name, name) == 0) {
-            error_setg(errp, "vfio: subchannel %s has already been attached",
-                       name);
-            goto out_err;
+    /* Call the class init function for subchannel. */
+    if (cdc->realize) {
+        cdc->realize(cdev, vcdev->vdev.sysfsdev, &err);
+        if (err) {
+            goto out_err_propagate;
         }
     }
+    vbasedev->sysfsdev = g_strdup_printf("/sys/bus/css/devices/%s/%s",
+                                         name, cdev->mdevid);
+    vbasedev->ops = &vfio_ccw_ops;
+    vbasedev->type = VFIO_DEVICE_TYPE_CCW;
+    vbasedev->name = name;
+    vbasedev->dev = &vcdev->cdev.parent_obj.parent_obj;
 
     /*
      * All vfio-ccw devices are believed to operate in a way compatible with
@@ -609,80 +614,18 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
      * needs to be set before vfio_get_device() for vfio common to handle
      * ram_block_discard_disable().
      */
-    vcdev->vdev.ram_block_discard_allowed = true;
-
-    if (vfio_get_device(group, vcdev->cdev.mdevid, &vcdev->vdev, errp)) {
-        goto out_err;
-    }
-
-    vcdev->vdev.ops = &vfio_ccw_ops;
-    vcdev->vdev.type = VFIO_DEVICE_TYPE_CCW;
-    vcdev->vdev.name = name;
-    vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
-
-    return;
-
-out_err:
-    g_free(name);
-}
-
-static VFIOGroup *vfio_ccw_get_group(S390CCWDevice *cdev, Error **errp)
-{
-    char *tmp, group_path[PATH_MAX];
-    ssize_t len;
-    int groupid;
 
-    tmp = g_strdup_printf("/sys/bus/css/devices/%x.%x.%04x/%s/iommu_group",
-                          cdev->hostid.cssid, cdev->hostid.ssid,
-                          cdev->hostid.devid, cdev->mdevid);
-    len = readlink(tmp, group_path, sizeof(group_path));
-    g_free(tmp);
+    vbasedev->ram_block_discard_allowed = true;
 
-    if (len <= 0 || len >= sizeof(group_path)) {
-        error_setg(errp, "vfio: no iommu_group found");
-        return NULL;
-    }
-
-    group_path[len] = 0;
-
-    if (sscanf(basename(group_path), "%d", &groupid) != 1) {
-        error_setg(errp, "vfio: failed to read %s", group_path);
-        return NULL;
-    }
-
-    return vfio_get_group(groupid, &address_space_memory, errp);
-}
-
-static void vfio_ccw_realize(DeviceState *dev, Error **errp)
-{
-    VFIOGroup *group;
-    CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
-    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
-    S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
-    Error *err = NULL;
-
-    /* Call the class init function for subchannel. */
-    if (cdc->realize) {
-        cdc->realize(cdev, vcdev->vdev.sysfsdev, &err);
-        if (err) {
-            goto out_err_propagate;
-        }
-    }
-
-    group = vfio_ccw_get_group(cdev, &err);
-    if (!group) {
-        goto out_group_err;
-    }
-
-    vfio_ccw_get_device(group, vcdev, &err);
-    if (err) {
-        goto out_device_err;
+    ret = vfio_attach_device(vbasedev, &address_space_memory, errp);
+    if (ret) {
+        g_free(vbasedev->name);
+        g_free(vbasedev->sysfsdev);
     }
 
     vfio_ccw_get_region(vcdev, &err);
     if (err) {
-        goto out_region_err;
+        goto out_get_dev_err;
     }
 
     vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX, &err);
@@ -714,11 +657,8 @@ out_irq_notifier_err:
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
 out_io_notifier_err:
     vfio_ccw_put_region(vcdev);
-out_region_err:
-    vfio_ccw_put_device(vcdev);
-out_device_err:
-    vfio_put_group(group);
-out_group_err:
+out_get_dev_err:
+    vfio_detach_device(vbasedev);
     if (cdc->unrealize) {
         cdc->unrealize(cdev);
     }
@@ -732,14 +672,12 @@ static void vfio_ccw_unrealize(DeviceState *dev)
     S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
     VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
-    VFIOGroup *group = vcdev->vdev.group;
 
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX);
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
     vfio_ccw_put_region(vcdev);
-    vfio_ccw_put_device(vcdev);
-    vfio_put_group(group);
+    vfio_detach_device(&vcdev->vdev);
 
     if (cdc->unrealize) {
         cdc->unrealize(cdev);
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index c74a3cd4ae..5d73f8285e 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -954,7 +954,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
     }
 }
 
-VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
+static VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 {
     VFIOGroup *group;
     VFIOContainer *bcontainer;
@@ -1023,7 +1023,7 @@ free_group_exit:
     return NULL;
 }
 
-void vfio_put_group(VFIOGroup *group)
+static void vfio_put_group(VFIOGroup *group)
 {
     if (!group || !QLIST_EMPTY(&group->device_list)) {
         return;
@@ -1044,8 +1044,8 @@ void vfio_put_group(VFIOGroup *group)
     }
 }
 
-int vfio_get_device(VFIOGroup *group, const char *name,
-                    VFIODevice *vbasedev, Error **errp)
+static int vfio_get_device(VFIOGroup *group, const char *name,
+                           VFIODevice *vbasedev, Error **errp)
 {
     struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
     int ret, fd;
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 978b2c2f6e..7d7898717e 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -176,10 +176,6 @@ void vfio_region_unmap(VFIORegion *region);
 void vfio_region_exit(VFIORegion *region);
 void vfio_region_finalize(VFIORegion *region);
 void vfio_reset_handler(void *opaque);
-VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
-void vfio_put_group(VFIOGroup *group);
-int vfio_get_device(VFIOGroup *group, const char *name,
-                    VFIODevice *vbasedev, Error **errp);
 int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp);
 void vfio_detach_device(VFIODevice *vbasedev);
 
-- 
2.27.0


