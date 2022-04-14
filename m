Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71273500BA6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 12:55:00 +0200 (CEST)
Received: from localhost ([::1]:36112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nex7r-0007bs-Ii
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 06:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0a-0002CH-26
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:28 -0400
Received: from mga12.intel.com ([192.55.52.136]:34772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0Y-0005Kn-8o
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649933246; x=1681469246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gM0xGzwg7MLnTWpYcUR+4zIK9VWgzL3tJ/HAYadjIXo=;
 b=iJeO7BB0tpLBRDlEIBV9Vpeg8T363pv8DRsv6Y/PKzImOw6hHtFOvg2h
 t+JLvxkdAmj/Fyutdpr94xZUQSybsI9Uz/x7AzOKwyvznlcfnBSGSBNRQ
 z/5PFcGuxTSvDNcmRh2g7ErMUy0w1zuj1tr9SoW8SDFU8+pnw2rE7aA0U
 /nU7yqvcYua4ulITc/l+eGtCI7e2GLAsExSEVJFeHbrXXxosJVVJBR1Kp
 KJtEweazjuuhIRO5D+xfwluRPjXD7WuZvZ5A8k71WEswf+VICRmiL5WC8
 WSymYnTZTeeFfm8r8cDENUysGhJkbYoZRmDdzfiih7dw5/z6H2m3dP1nV g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="242836497"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="242836497"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="803091221"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2022 03:47:17 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC 09/18] vfio/platform: Use vfio_[attach/detach]_device
Date: Thu, 14 Apr 2022 03:47:01 -0700
Message-Id: <20220414104710.28534-10-yi.l.liu@intel.com>
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
2.27.0


