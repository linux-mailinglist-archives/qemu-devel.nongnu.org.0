Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076AA6837EE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMxeF-0003dQ-1e; Tue, 31 Jan 2023 15:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pMxeA-0003IE-EA
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:54:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pMxe7-0004dP-S1
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675198467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CiMYeklWgHsxU3YK7JpMmP4mNkC+vtmaSAHpl+MMsr0=;
 b=c56NEp3Hkbc2b9B5g1YncQEpeXnbdF6y2wRbaHAyTEuslwtStC17w1wKDWbgnaqHip2iAP
 F00D8pyd+919uFlbe8ZqpszPZ2ps0+jRO8Hdi0XVDRvppNoF0I9ww2nE3XEJYPe7lmhm1H
 PDeFaGjBG+P7hssFmtAGTVDQKGE0480=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-YuvJFaCbPGiUxJUXv40dRQ-1; Tue, 31 Jan 2023 15:54:23 -0500
X-MC-Unique: YuvJFaCbPGiUxJUXv40dRQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9F161C0512A;
 Tue, 31 Jan 2023 20:54:21 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 034E740C2064;
 Tue, 31 Jan 2023 20:54:15 +0000 (UTC)
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
Subject: [RFC v3 10/18] vfio/ap: Use vfio_[attach/detach]_device
Date: Tue, 31 Jan 2023 21:52:57 +0100
Message-Id: <20230131205305.2726330-11-eric.auger@redhat.com>
In-Reply-To: <20230131205305.2726330-1-eric.auger@redhat.com>
References: <20230131205305.2726330-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
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

Let the vfio-ap device use vfio_attach_device() and
vfio_detach_device(), hence hiding the details of the used
IOMMU backend.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/vfio/ap.c | 62 ++++++++--------------------------------------------
 1 file changed, 9 insertions(+), 53 deletions(-)

diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index e0dd561e85..286ac638e5 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -50,58 +50,17 @@ struct VFIODeviceOps vfio_ap_ops = {
     .vfio_compute_needs_reset = vfio_ap_compute_needs_reset,
 };
 
-static void vfio_ap_put_device(VFIOAPDevice *vapdev)
-{
-    g_free(vapdev->vdev.name);
-    vfio_put_base_device(&vapdev->vdev);
-}
-
-static VFIOGroup *vfio_ap_get_group(VFIOAPDevice *vapdev, Error **errp)
-{
-    GError *gerror = NULL;
-    char *symlink, *group_path;
-    int groupid;
-
-    symlink = g_strdup_printf("%s/iommu_group", vapdev->vdev.sysfsdev);
-    group_path = g_file_read_link(symlink, &gerror);
-    g_free(symlink);
-
-    if (!group_path) {
-        error_setg(errp, "%s: no iommu_group found for %s: %s",
-                   TYPE_VFIO_AP_DEVICE, vapdev->vdev.sysfsdev, gerror->message);
-        g_error_free(gerror);
-        return NULL;
-    }
-
-    if (sscanf(basename(group_path), "%d", &groupid) != 1) {
-        error_setg(errp, "vfio: failed to read %s", group_path);
-        g_free(group_path);
-        return NULL;
-    }
-
-    g_free(group_path);
-
-    return vfio_get_group(groupid, &address_space_memory, errp);
-}
-
 static void vfio_ap_realize(DeviceState *dev, Error **errp)
 {
-    int ret;
-    char *mdevid;
-    VFIOGroup *vfio_group;
     APDevice *apdev = AP_DEVICE(dev);
     VFIOAPDevice *vapdev = VFIO_AP_DEVICE(apdev);
+    VFIODevice *vbasedev = &vapdev->vdev;
+    int ret;
 
-    vfio_group = vfio_ap_get_group(vapdev, errp);
-    if (!vfio_group) {
-        return;
-    }
-
-    vapdev->vdev.ops = &vfio_ap_ops;
-    vapdev->vdev.type = VFIO_DEVICE_TYPE_AP;
-    mdevid = basename(vapdev->vdev.sysfsdev);
-    vapdev->vdev.name = g_strdup_printf("%s", mdevid);
-    vapdev->vdev.dev = dev;
+    vbasedev->name = g_path_get_basename(vbasedev->sysfsdev);
+    vbasedev->ops = &vfio_ap_ops;
+    vbasedev->type = VFIO_DEVICE_TYPE_AP;
+    vbasedev->dev = dev;
 
     /*
      * vfio-ap devices operate in a way compatible with discarding of
@@ -111,7 +70,7 @@ static void vfio_ap_realize(DeviceState *dev, Error **errp)
      */
     vapdev->vdev.ram_block_discard_allowed = true;
 
-    ret = vfio_get_device(vfio_group, mdevid, &vapdev->vdev, errp);
+    ret = vfio_attach_device(vbasedev, &address_space_memory, errp);
     if (ret) {
         goto out_get_dev_err;
     }
@@ -119,18 +78,15 @@ static void vfio_ap_realize(DeviceState *dev, Error **errp)
     return;
 
 out_get_dev_err:
-    vfio_ap_put_device(vapdev);
-    vfio_put_group(vfio_group);
+    vfio_detach_device(vbasedev);
 }
 
 static void vfio_ap_unrealize(DeviceState *dev)
 {
     APDevice *apdev = AP_DEVICE(dev);
     VFIOAPDevice *vapdev = VFIO_AP_DEVICE(apdev);
-    VFIOGroup *group = vapdev->vdev.group;
 
-    vfio_ap_put_device(vapdev);
-    vfio_put_group(group);
+    vfio_detach_device(&vapdev->vdev);
 }
 
 static Property vfio_ap_properties[] = {
-- 
2.37.3


