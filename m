Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8682302FC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 08:33:41 +0200 (CEST)
Received: from localhost ([::1]:44024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0JBA-0007mP-CT
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 02:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1k0J5f-000171-4R
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 02:27:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:41265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1k0J5a-0002At-UT
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 02:27:54 -0400
IronPort-SDR: X2VwYHWph6vups1BSsJKma9jw/U8K/IIQYSKS7yeDaevxdd2oLHB+doX+aiJLNn0y73lCmD+BB
 eOKnhmU8Ezag==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="149021037"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; d="scan'208";a="149021037"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 23:27:36 -0700
IronPort-SDR: gjiCFW7yS1WHS4TgbI/iVZNh8UNwneCKfXy6nGYMmpwpFVATz/Oy9i9dqz4+k+yuiseWErmGI8
 Oe5AmSEsCs1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; d="scan'208";a="394232840"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2020 23:27:35 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, alex.williamson@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
Subject: [RFC v9 06/25] vfio: pass nesting requirement into vfio_get_group()
Date: Mon, 27 Jul 2020 23:33:59 -0700
Message-Id: <1595918058-33392-7-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595918058-33392-1-git-send-email-yi.l.liu@intel.com>
References: <1595918058-33392-1-git-send-email-yi.l.liu@intel.com>
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yi.l.liu@intel.com;
 helo=mga11.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 02:27:41
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, yi.l.liu@intel.com,
 Yi Sun <yi.y.sun@linux.intel.com>, kvm@vger.kernel.org, mst@redhat.com,
 jun.j.tian@intel.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, pbonzini@redhat.com,
 hao.wu@intel.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch passes the nesting requirement into vfio_get_group() to
indicate whether VFIO_TYPE1_NESTING_IOMMU is required.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/vfio/ap.c                  | 2 +-
 hw/vfio/ccw.c                 | 2 +-
 hw/vfio/common.c              | 3 ++-
 hw/vfio/pci.c                 | 9 ++++++++-
 hw/vfio/platform.c            | 2 +-
 include/hw/vfio/vfio-common.h | 3 ++-
 6 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index b9330a8..2101a1c 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -82,7 +82,7 @@ static VFIOGroup *vfio_ap_get_group(VFIOAPDevice *vapdev, Error **errp)
 
     g_free(group_path);
 
-    return vfio_get_group(groupid, &address_space_memory, errp);
+    return vfio_get_group(groupid, &address_space_memory, false, errp);
 }
 
 static void vfio_ap_realize(DeviceState *dev, Error **errp)
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index ff7f369..30d00a7 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -621,7 +621,7 @@ static VFIOGroup *vfio_ccw_get_group(S390CCWDevice *cdev, Error **errp)
         return NULL;
     }
 
-    return vfio_get_group(groupid, &address_space_memory, errp);
+    return vfio_get_group(groupid, &address_space_memory, false, errp);
 }
 
 static void vfio_ccw_realize(DeviceState *dev, Error **errp)
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3335714..80d7a00 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1457,7 +1457,8 @@ static void vfio_disconnect_container(VFIOGroup *group)
     }
 }
 
-VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
+VFIOGroup *vfio_get_group(int groupid, AddressSpace *as,
+                          bool want_nested, Error **errp)
 {
     VFIOGroup *group;
     char path[32];
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 2e561c0..8cd1e72 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2714,6 +2714,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     int groupid;
     int i, ret;
     bool is_mdev;
+    bool want_nested;
 
     if (!vdev->vbasedev.sysfsdev) {
         if (!(~vdev->host.domain || ~vdev->host.bus ||
@@ -2771,7 +2772,13 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
 
     trace_vfio_realize(vdev->vbasedev.name, groupid);
 
-    group = vfio_get_group(groupid, pci_device_iommu_address_space(pdev), errp);
+    if (pci_device_get_iommu_attr(pdev,
+                         IOMMU_WANT_NESTING, &want_nested)) {
+        want_nested = false;
+    }
+
+    group = vfio_get_group(groupid, pci_device_iommu_address_space(pdev),
+                           want_nested, errp);
     if (!group) {
         goto error;
     }
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index ac2cefc..7ad7702 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -580,7 +580,7 @@ static int vfio_base_device_init(VFIODevice *vbasedev, Error **errp)
 
     trace_vfio_platform_base_device_init(vbasedev->name, groupid);
 
-    group = vfio_get_group(groupid, &address_space_memory, errp);
+    group = vfio_get_group(groupid, &address_space_memory, false, errp);
     if (!group) {
         return -ENOENT;
     }
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index c78f3ff..bdb09f4 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -174,7 +174,8 @@ void vfio_region_mmaps_set_enabled(VFIORegion *region, bool enabled);
 void vfio_region_exit(VFIORegion *region);
 void vfio_region_finalize(VFIORegion *region);
 void vfio_reset_handler(void *opaque);
-VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
+VFIOGroup *vfio_get_group(int groupid, AddressSpace *as,
+                          bool want_nested, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
-- 
2.7.4


