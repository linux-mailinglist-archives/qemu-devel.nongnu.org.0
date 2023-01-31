Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB266837F4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMxe4-00031z-4P; Tue, 31 Jan 2023 15:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pMxdw-000310-E2
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:54:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pMxdu-0004aE-LK
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675198454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ig/aOIViXEXkmTrW1Yhu0BwPc9603/ixAmICCcAz7Ig=;
 b=AuwTAGIqRbxSmf6tkLwAhLRAXvF7zxcObmK8I1HoKicTkCDuLS9AfQDcBXSTyP6QPj0y7i
 IRWnzGatJUOa9OBlTLR993xgsPE9lkhmOpbFbUBoO/n3QcqhssNQ3mivUPZPtJcXoHAYSr
 sRC4xF5vkfTJsGhu6QULLUNLU8j/4U0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-Otz6ru6UOYKYaV0PQpAEkA-1; Tue, 31 Jan 2023 15:54:10 -0500
X-MC-Unique: Otz6ru6UOYKYaV0PQpAEkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE0D73C02B79;
 Tue, 31 Jan 2023 20:54:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00BE240C2064;
 Tue, 31 Jan 2023 20:54:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, yi.l.liu@intel.com,
 yi.y.sun@intel.com, alex.williamson@redhat.com, clg@redhat.com,
 qemu-devel@nongnu.org
Cc: david@gibson.dropbear.id.au, thuth@redhat.com, farman@linux.ibm.com,
 mjrosato@linux.ibm.com, akrowiak@linux.ibm.com, pasic@linux.ibm.com,
 jjherne@linux.ibm.com, jasowang@redhat.com, kvm@vger.kernel.org,
 jgg@nvidia.com, nicolinc@nvidia.com, kevin.tian@intel.com,
 chao.p.peng@intel.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 berrange@redhat.com, apopple@nvidia.com, suravee.suthikulpanit@amd.com
Subject: [RFC v3 08/18] vfio/container: Introduce vfio_[attach/detach]_device
Date: Tue, 31 Jan 2023 21:52:55 +0100
Message-Id: <20230131205305.2726330-9-eric.auger@redhat.com>
In-Reply-To: <20230131205305.2726330-1-eric.auger@redhat.com>
References: <20230131205305.2726330-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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

We want the VFIO devices to be able to use two different
IOMMU callbacks, the legacy VFIO one and the new iommufd one.

Introduce vfio_[attach/detach]_device which aim at hiding the
underlying IOMMU backend (IOCTLs, datatypes, ...).

Once vfio_attach_device completes, the device is attached
to a security context and its fd can be used. Conversely
When vfio_detach_device completes, the device has been
detached to the security context.

In this patch, only the vfio-pci device gets converted to use
the new API. Subsequent patches will handle other devices.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 include/hw/vfio/vfio-common.h |  2 ++
 hw/vfio/container.c           | 65 +++++++++++++++++++++++++++++++++++
 hw/vfio/pci.c                 | 50 +++------------------------
 3 files changed, 72 insertions(+), 45 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 63566ddbc0..9465c4b021 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -180,6 +180,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp);
+void vfio_detach_device(VFIODevice *vbasedev);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index ca24f7f922..6e466ef037 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -1252,6 +1252,71 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
     return vfio_eeh_container_op(container, op);
 }
 
+static int vfio_device_groupid(VFIODevice *vbasedev, Error **errp)
+{
+    char *tmp, group_path[PATH_MAX], *group_name;
+    int ret, groupid;
+    ssize_t len;
+
+    tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
+    len = readlink(tmp, group_path, sizeof(group_path));
+    g_free(tmp);
+
+    if (len <= 0 || len >= sizeof(group_path)) {
+        ret = len < 0 ? -errno : -ENAMETOOLONG;
+        error_setg_errno(errp, -ret, "no iommu_group found");
+        return ret;
+    }
+
+    group_path[len] = 0;
+
+    group_name = basename(group_path);
+    if (sscanf(group_name, "%d", &groupid) != 1) {
+        error_setg_errno(errp, errno, "failed to read %s", group_path);
+        return -errno;
+    }
+    return groupid;
+}
+
+int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
+{
+    int groupid = vfio_device_groupid(vbasedev, errp);
+    VFIODevice *vbasedev_iter;
+    VFIOGroup *group;
+    int ret;
+
+    if (groupid < 0) {
+        return groupid;
+    }
+
+    trace_vfio_realize(vbasedev->name, groupid);
+    group = vfio_get_group(groupid, as, errp);
+    if (!group) {
+        return -1;
+    }
+
+    QLIST_FOREACH(vbasedev_iter, &group->device_list, next) {
+        if (strcmp(vbasedev_iter->name, vbasedev->name) == 0) {
+            error_setg(errp, "device is already attached");
+            vfio_put_group(group);
+            return -1;
+        }
+    }
+    ret = vfio_get_device(group, vbasedev->name, vbasedev, errp);
+    if (ret) {
+        vfio_put_group(group);
+        return -1;
+    }
+
+    return 0;
+}
+
+void vfio_detach_device(VFIODevice *vbasedev)
+{
+    vfio_put_base_device(vbasedev);
+    vfio_put_group(vbasedev->group);
+}
+
 static void vfio_iommu_backend_legacy_ops_class_init(ObjectClass *oc,
                                                      void *data) {
     VFIOIOMMUBackendOpsClass *ops = VFIO_IOMMU_BACKEND_OPS_CLASS(oc);
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index a9973a6d6a..9856d81819 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2697,10 +2697,9 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 
 static void vfio_put_device(VFIOPCIDevice *vdev)
 {
-    g_free(vdev->vbasedev.name);
     g_free(vdev->msix);
 
-    vfio_put_base_device(&vdev->vbasedev);
+    vfio_detach_device(&vdev->vbasedev);
 }
 
 static void vfio_err_notifier_handler(void *opaque)
@@ -2847,13 +2846,9 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(pdev);
     VFIODevice *vbasedev = &vdev->vbasedev;
-    VFIODevice *vbasedev_iter;
-    VFIOGroup *group;
-    char *tmp, *subsys, group_path[PATH_MAX], *group_name;
+    char *tmp, *subsys;
     Error *err = NULL;
-    ssize_t len;
     struct stat st;
-    int groupid;
     int i, ret;
     bool is_mdev;
 
@@ -2882,39 +2877,6 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->dev = DEVICE(vdev);
 
-    tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
-    len = readlink(tmp, group_path, sizeof(group_path));
-    g_free(tmp);
-
-    if (len <= 0 || len >= sizeof(group_path)) {
-        error_setg_errno(errp, len < 0 ? errno : ENAMETOOLONG,
-                         "no iommu_group found");
-        goto error;
-    }
-
-    group_path[len] = 0;
-
-    group_name = basename(group_path);
-    if (sscanf(group_name, "%d", &groupid) != 1) {
-        error_setg_errno(errp, errno, "failed to read %s", group_path);
-        goto error;
-    }
-
-    trace_vfio_realize(vbasedev->name, groupid);
-
-    group = vfio_get_group(groupid, pci_device_iommu_address_space(pdev), errp);
-    if (!group) {
-        goto error;
-    }
-
-    QLIST_FOREACH(vbasedev_iter, &group->device_list, next) {
-        if (strcmp(vbasedev_iter->name, vbasedev->name) == 0) {
-            error_setg(errp, "device is already attached");
-            vfio_put_group(group);
-            goto error;
-        }
-    }
-
     /*
      * Mediated devices *might* operate compatibly with discarding of RAM, but
      * we cannot know for certain, it depends on whether the mdev vendor driver
@@ -2932,13 +2894,12 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     if (vbasedev->ram_block_discard_allowed && !is_mdev) {
         error_setg(errp, "x-balloon-allowed only potentially compatible "
                    "with mdev devices");
-        vfio_put_group(group);
         goto error;
     }
 
-    ret = vfio_get_device(group, vbasedev->name, vbasedev, errp);
+    ret = vfio_attach_device(vbasedev,
+                             pci_device_iommu_address_space(pdev), errp);
     if (ret) {
-        vfio_put_group(group);
         goto error;
     }
 
@@ -3167,12 +3128,12 @@ out_teardown:
     vfio_bars_exit(vdev);
 error:
     error_prepend(errp, VFIO_MSG_PREFIX, vbasedev->name);
+    vfio_detach_device(vbasedev);
 }
 
 static void vfio_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(obj);
-    VFIOGroup *group = vdev->vbasedev.group;
 
     vfio_display_finalize(vdev);
     vfio_bars_finalize(vdev);
@@ -3186,7 +3147,6 @@ static void vfio_instance_finalize(Object *obj)
      * g_free(vdev->igd_opregion);
      */
     vfio_put_device(vdev);
-    vfio_put_group(group);
 }
 
 static void vfio_exitfn(PCIDevice *pdev)
-- 
2.37.3


