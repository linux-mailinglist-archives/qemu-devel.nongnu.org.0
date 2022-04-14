Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED2500BB5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 12:59:53 +0200 (CEST)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nexCa-0006gl-DM
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 06:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex1D-0003V9-VS
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:48:08 -0400
Received: from mga12.intel.com ([192.55.52.136]:34772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex1C-0005Kn-6w
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649933286; x=1681469286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F9ZmIqeNr50Fo8Vzy6kBuBQvKFH22JABuQLYrlJNHNM=;
 b=jtEitNVNd3vngRwFx9kHVTCZlXeBx6wnN+TcBJ3XWcxxmZoL5R5Arqcz
 6j9hHr45tCH9mPSBJAveh3ps6+b5e6IaY4x4R8BDLLxjkpX1w59MPgx5+
 kbU/CFjHrjXjazrJ9RBPU4YQM/uQ9RMfkTGFWJ4nuJ0ul8o10I56neO9S
 1Rhn2MOwW7AFY9B7lF3CnqYLFpgst53FAqr1KxZE97jVNJ/BO1XIXStmM
 GMv73IGPJ9WZcxXBgoxiHfxxaE6dCZpF5P+JHcRTl/wLXZKRg3Y5ilgvy
 Kh4CID/tOlq05PUSWulzBe6fve2fuQSolzyKOXaegpCKG8NYUdWelEunL Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="242836523"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="242836523"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="803091263"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2022 03:47:24 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC 17/18] vfio/as: Allow the selection of a given iommu backend
Date: Thu, 14 Apr 2022 03:47:09 -0700
Message-Id: <20220414104710.28534-18-yi.l.liu@intel.com>
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

Now we support two types of iommu backends, let's add the capability
to select one of them. This is based on a VFIODevice auto/on/off
iommu_be field. This field is likely to be forced to a given value or
set by a device option.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/vfio/as.c                  | 31 ++++++++++++++++++++++++++++++-
 include/hw/vfio/vfio-common.h |  1 +
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/as.c b/hw/vfio/as.c
index 13a6653a0d..fce7a088e9 100644
--- a/hw/vfio/as.c
+++ b/hw/vfio/as.c
@@ -985,16 +985,45 @@ vfio_get_container_class(VFIOIOMMUBackendType be)
     case VFIO_IOMMU_BACKEND_TYPE_LEGACY:
         klass = object_class_by_name(TYPE_VFIO_LEGACY_CONTAINER);
         return VFIO_CONTAINER_OBJ_CLASS(klass);
+    case VFIO_IOMMU_BACKEND_TYPE_IOMMUFD:
+        klass = object_class_by_name(TYPE_VFIO_IOMMUFD_CONTAINER);
+        return VFIO_CONTAINER_OBJ_CLASS(klass);
     default:
         return NULL;
     }
 }
 
+static VFIOContainerClass *
+select_iommu_backend(OnOffAuto value, Error **errp)
+{
+    VFIOContainerClass *vccs = NULL;
+
+    if (value == ON_OFF_AUTO_OFF) {
+        return vfio_get_container_class(VFIO_IOMMU_BACKEND_TYPE_LEGACY);
+    } else {
+        int iommufd = qemu_open_old("/dev/iommu", O_RDWR);
+
+        vccs = vfio_get_container_class(VFIO_IOMMU_BACKEND_TYPE_IOMMUFD);
+        if (iommufd < 0 || !vccs) {
+            if (value == ON_OFF_AUTO_AUTO) {
+                vccs = vfio_get_container_class(VFIO_IOMMU_BACKEND_TYPE_LEGACY);
+            } else { /* ON */
+                error_setg(errp, "iommufd backend is not supported by %s",
+                           iommufd < 0 ? "the host" : "QEMU");
+                error_append_hint(errp, "set iommufd=off\n");
+                vccs = NULL;
+            }
+        }
+        close(iommufd);
+    }
+    return vccs;
+}
+
 int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp)
 {
     VFIOContainerClass *vccs;
 
-    vccs = vfio_get_container_class(VFIO_IOMMU_BACKEND_TYPE_LEGACY);
+    vccs = select_iommu_backend(vbasedev->iommufd_be, errp);
     if (!vccs) {
         return -ENOENT;
     }
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index bef48ddfaf..2d941aae70 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -126,6 +126,7 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    OnOffAuto iommufd_be;
 } VFIODevice;
 
 struct VFIODeviceOps {
-- 
2.27.0


