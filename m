Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90771D7151
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 08:53:01 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaZe0-00057L-Nw
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 02:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jaZZl-0005y0-Hr
 for qemu-devel@nongnu.org; Mon, 18 May 2020 02:48:37 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jaZZi-0004MW-S4
 for qemu-devel@nongnu.org; Mon, 18 May 2020 02:48:37 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec22f330000>; Sun, 17 May 2020 23:46:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sun, 17 May 2020 23:48:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sun, 17 May 2020 23:48:33 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 May
 2020 06:48:32 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 18 May 2020 06:48:24 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH QEMU v22 13/18] vfio: Get migration capability flags for
 container
Date: Mon, 18 May 2020 11:43:13 +0530
Message-ID: <1589782398-24406-14-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1589782398-24406-1-git-send-email-kwankhede@nvidia.com>
References: <1589782398-24406-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1589784372; bh=JNjKlN0vKZPPS1PavuXbSBturKW8V18Gp9dWsQv+bX0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=ijhNGJt7l63xeSA61jC6vfYEPdyol0ld9ajAJO6XtafypXuzqce71B4Lzr3lglgO4
 AFGtEh92H/J8ubxilo2qUaEd1GJtaGk/NHULEQoh8lpAvc00Yf84CYFvzoCzioluTu
 6QKF160OnNPLFwYjmLInzBL1eSc0krgEBUirxzzOfiDI0QBNdak2delvmXLATHHO/i
 WXiHy2huMNVPUjsFkCUg1ZoocUgjXQkDM5l8FIjWxjPQzAlEfELTCmbv5T/kS5FShQ
 Y+WHPeZLvDbqQp22o9s6gk7Dy1MilC0WWLbPACngdCBcHuqD4GRkBWu6QEnqly6ndI
 +RmbP69sDrrWg==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 02:29:50
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: cohuck@redhat.com, aik@ozlabs.ru, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, peterx@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, yi.l.liu@intel.com,
 quintela@redhat.com, ziye.yang@intel.com, armbru@redhat.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, felipe@nutanix.com,
 zhi.a.wang@intel.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 dgilbert@redhat.com, Eric Auger <eric.auger@redhat.com>,
 changpeng.liu@intel.com, eskultet@redhat.com, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added helper functions to get IOMMU info capability chain.
Added function to get migration capability information from that
capability chain for IOMMU container.

Similar change was proposed earlier:
https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg03759.html

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c              | 91 +++++++++++++++++++++++++++++++++++++++----
 include/hw/vfio/vfio-common.h |  3 ++
 2 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 2c2db4bcba20..8e9d1431178c 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1227,6 +1227,75 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
     return 0;
 }
 
+static int vfio_get_iommu_info(VFIOContainer *container,
+                               struct vfio_iommu_type1_info **info)
+{
+
+    size_t argsz = sizeof(struct vfio_iommu_type1_info);
+
+    *info = g_new0(struct vfio_iommu_type1_info, 1);
+again:
+    (*info)->argsz = argsz;
+
+    if (ioctl(container->fd, VFIO_IOMMU_GET_INFO, *info)) {
+        g_free(*info);
+        *info = NULL;
+        return -errno;
+    }
+
+    if (((*info)->argsz > argsz)) {
+        argsz = (*info)->argsz;
+        *info = g_realloc(*info, argsz);
+        goto again;
+    }
+
+    return 0;
+}
+
+static struct vfio_info_cap_header *
+vfio_get_iommu_info_cap(struct vfio_iommu_type1_info *info, uint16_t id)
+{
+    struct vfio_info_cap_header *hdr;
+    void *ptr = info;
+
+    if (!(info->flags & VFIO_IOMMU_INFO_CAPS)) {
+        return NULL;
+    }
+
+    for (hdr = ptr + info->cap_offset; hdr != ptr; hdr = ptr + hdr->next) {
+        if (hdr->id == id) {
+            return hdr;
+        }
+    }
+
+    return NULL;
+}
+
+static void vfio_get_iommu_info_migration(VFIOContainer *container,
+                                         struct vfio_iommu_type1_info *info)
+{
+    struct vfio_info_cap_header *hdr;
+    struct vfio_iommu_type1_info_cap_migration *cap_mig;
+
+    hdr = vfio_get_iommu_info_cap(info, VFIO_IOMMU_TYPE1_INFO_CAP_MIGRATION);
+    if (!hdr) {
+        return;
+    }
+
+    cap_mig = container_of(hdr, struct vfio_iommu_type1_info_cap_migration,
+                            header);
+
+    container->dirty_pages_supported = true;
+    container->max_dirty_bitmap_size = cap_mig->max_dirty_bitmap_size;
+    container->dirty_pgsizes = cap_mig->pgsize_bitmap;
+
+    /*
+     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
+     * TARGET_PAGE_SIZE to mark those dirty.
+     */
+    assert(container->dirty_pgsizes & TARGET_PAGE_SIZE);
+}
+
 static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                                   Error **errp)
 {
@@ -1291,6 +1360,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->space = space;
     container->fd = fd;
     container->error = NULL;
+    container->dirty_pages_supported = false;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
 
@@ -1303,7 +1373,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     case VFIO_TYPE1v2_IOMMU:
     case VFIO_TYPE1_IOMMU:
     {
-        struct vfio_iommu_type1_info info;
+        struct vfio_iommu_type1_info *info;
 
         /*
          * FIXME: This assumes that a Type1 IOMMU can map any 64-bit
@@ -1312,15 +1382,20 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
          * existing Type1 IOMMUs generally support any IOVA we're
          * going to actually try in practice.
          */
-        info.argsz = sizeof(info);
-        ret = ioctl(fd, VFIO_IOMMU_GET_INFO, &info);
-        /* Ignore errors */
-        if (ret || !(info.flags & VFIO_IOMMU_INFO_PGSIZES)) {
+        ret = vfio_get_iommu_info(container, &info);
+        if (ret) {
+                goto free_container_exit;
+        }
+
+        if (!(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
             /* Assume 4k IOVA page size */
-            info.iova_pgsizes = 4096;
+            info->iova_pgsizes = 4096;
         }
-        vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
-        container->pgsizes = info.iova_pgsizes;
+        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
+        container->pgsizes = info->iova_pgsizes;
+
+        vfio_get_iommu_info_migration(container, info);
+        g_free(info);
         break;
     }
     case VFIO_SPAPR_TCE_v2_IOMMU:
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index c78033e4149d..5a57a78ec517 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -79,6 +79,9 @@ typedef struct VFIOContainer {
     unsigned iommu_type;
     Error *error;
     bool initialized;
+    bool dirty_pages_supported;
+    uint64_t dirty_pgsizes;
+    uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
-- 
2.7.0


