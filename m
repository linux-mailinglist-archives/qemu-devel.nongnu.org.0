Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0AA6837EF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMxeC-00032c-G2; Tue, 31 Jan 2023 15:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pMxe3-00032D-SC
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pMxe2-0004bu-2c
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675198460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtAg5DUb82n6UjvQsoPDdgTe0EU0nJ4kL2b98q4vdiU=;
 b=clykiuW6k5Pe7iG7Bjx3R3tX25TrrEgzrJ8MnuJKGyL2yltjMt2ZfvFeh0PmNR/uzFed+M
 KQpb3kxt5sJJ4MgwgbBK8EYbRfVn0h/lfFCYh9qYj2qPAc4wwRWVfewu5Wn79XO7AENT9j
 CagdLFUw6e6esSDhZCN/aLOb4uOqw0Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-JEOr0yeJPBmXxukJfHWDRQ-1; Tue, 31 Jan 2023 15:54:17 -0500
X-MC-Unique: JEOr0yeJPBmXxukJfHWDRQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5BAD3813F38;
 Tue, 31 Jan 2023 20:54:15 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A3C040C2064;
 Tue, 31 Jan 2023 20:54:09 +0000 (UTC)
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
Subject: [RFC v3 09/18] vfio/platform: Use vfio_[attach/detach]_device
Date: Tue, 31 Jan 2023 21:52:56 +0100
Message-Id: <20230131205305.2726330-10-eric.auger@redhat.com>
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

Let the vfio-platform device use vfio_attach_device() and
vfio_detach_device(), hence hiding the details of the used
IOMMU backend.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/vfio/platform.c | 42 ++----------------------------------------
 1 file changed, 2 insertions(+), 40 deletions(-)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 5af73f9287..3bcdc20667 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -529,12 +529,7 @@ static VFIODeviceOps vfio_platform_ops = {
  */
 static int vfio_base_device_init(VFIODevice *vbasedev, Error **errp)
 {
-    VFIOGroup *group;
-    VFIODevice *vbasedev_iter;
-    char *tmp, group_path[PATH_MAX], *group_name;
-    ssize_t len;
     struct stat st;
-    int groupid;
     int ret;
 
     /* @sysfsdev takes precedence over @host */
@@ -557,47 +552,14 @@ static int vfio_base_device_init(VFIODevice *vbasedev, Error **errp)
         return -errno;
     }
 
-    tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
-    len = readlink(tmp, group_path, sizeof(group_path));
-    g_free(tmp);
-
-    if (len < 0 || len >= sizeof(group_path)) {
-        ret = len < 0 ? -errno : -ENAMETOOLONG;
-        error_setg_errno(errp, -ret, "no iommu_group found");
-        return ret;
-    }
-
-    group_path[len] = 0;
-
-    group_name = basename(group_path);
-    if (sscanf(group_name, "%d", &groupid) != 1) {
-        error_setg_errno(errp, errno, "failed to read %s", group_path);
-        return -errno;
-    }
-
-    trace_vfio_platform_base_device_init(vbasedev->name, groupid);
-
-    group = vfio_get_group(groupid, &address_space_memory, errp);
-    if (!group) {
-        return -ENOENT;
-    }
-
-    QLIST_FOREACH(vbasedev_iter, &group->device_list, next) {
-        if (strcmp(vbasedev_iter->name, vbasedev->name) == 0) {
-            error_setg(errp, "device is already attached");
-            vfio_put_group(group);
-            return -EBUSY;
-        }
-    }
-    ret = vfio_get_device(group, vbasedev->name, vbasedev, errp);
+    ret = vfio_attach_device(vbasedev, &address_space_memory, errp);
     if (ret) {
-        vfio_put_group(group);
         return ret;
     }
 
     ret = vfio_populate_device(vbasedev, errp);
     if (ret) {
-        vfio_put_group(group);
+        vfio_detach_device(vbasedev);
     }
 
     return ret;
-- 
2.37.3


