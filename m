Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8764329978F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 20:59:35 +0100 (CET)
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX8eU-0007NA-Gb
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 15:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kX8Fw-0002gI-8h
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 15:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kX8Fu-00021X-7n
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 15:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603740849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYPCZhCKZmPOkFGWkmFcZ4hATiIF5ei8yhE+MTwMt6g=;
 b=EdLq+uD1zjjBYrfBEYsBskRP8roVW2C0ZUi/EActZHpOfghbo1dZARFtUGlOzy0wLQknc6
 XGIaVGxtMay+r5B3chjchz3KbRXRC7Yps2eEyHA+dTqsidSnCk2sBYqVm+GgXncuqFSRUt
 usc87X8xrVjggApZ40R9vbpjV8D2KcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-CdFJyB5xNdqCUxxIj8Imzw-1; Mon, 26 Oct 2020 15:34:06 -0400
X-MC-Unique: CdFJyB5xNdqCUxxIj8Imzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54F761009E39;
 Mon, 26 Oct 2020 19:34:05 +0000 (UTC)
Received: from gimli.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E65215C1BB;
 Mon, 26 Oct 2020 19:34:01 +0000 (UTC)
Subject: [PULL 11/32] vfio: Get migration capability flags for container
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Oct 2020 13:34:01 -0600
Message-ID: <160374084162.22414.8961750734855904272.stgit@gimli.home>
In-Reply-To: <160374054442.22414.10832953989449611268.stgit@gimli.home>
References: <160374054442.22414.10832953989449611268.stgit@gimli.home>
User-Agent: StGit/0.21-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kirti Wankhede <kwankhede@nvidia.com>

Added helper functions to get IOMMU info capability chain.
Added function to get migration capability information from that
capability chain for IOMMU container.

Similar change was proposed earlier:
https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg03759.html

Disable migration for devices if IOMMU module doesn't support migration
capability.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c              |   90 +++++++++++++++++++++++++++++++++++++----
 hw/vfio/migration.c           |    7 +++
 include/hw/vfio/vfio-common.h |    3 +
 3 files changed, 91 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c6e98b8d61be..d4959c036dd1 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1228,6 +1228,75 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
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
+    /*
+     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
+     * TARGET_PAGE_SIZE to mark those dirty.
+     */
+    if (cap_mig->pgsize_bitmap & TARGET_PAGE_SIZE) {
+        container->dirty_pages_supported = true;
+        container->max_dirty_bitmap_size = cap_mig->max_dirty_bitmap_size;
+        container->dirty_pgsizes = cap_mig->pgsize_bitmap;
+    }
+}
+
 static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                                   Error **errp)
 {
@@ -1297,6 +1366,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->space = space;
     container->fd = fd;
     container->error = NULL;
+    container->dirty_pages_supported = false;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
 
@@ -1309,7 +1379,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     case VFIO_TYPE1v2_IOMMU:
     case VFIO_TYPE1_IOMMU:
     {
-        struct vfio_iommu_type1_info info;
+        struct vfio_iommu_type1_info *info;
 
         /*
          * FIXME: This assumes that a Type1 IOMMU can map any 64-bit
@@ -1318,15 +1388,19 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
          * existing Type1 IOMMUs generally support any IOVA we're
          * going to actually try in practice.
          */
-        info.argsz = sizeof(info);
-        ret = ioctl(fd, VFIO_IOMMU_GET_INFO, &info);
-        /* Ignore errors */
-        if (ret || !(info.flags & VFIO_IOMMU_INFO_PGSIZES)) {
+        ret = vfio_get_iommu_info(container, &info);
+
+        if (ret || !(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
             /* Assume 4k IOVA page size */
-            info.iova_pgsizes = 4096;
+            info->iova_pgsizes = 4096;
         }
-        vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
-        container->pgsizes = info.iova_pgsizes;
+        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
+        container->pgsizes = info->iova_pgsizes;
+
+        if (!ret) {
+            vfio_get_iommu_info_migration(container, info);
+        }
+        g_free(info);
         break;
     }
     case VFIO_SPAPR_TCE_v2_IOMMU:
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 6ac72b46a88b..93f8fe7bd869 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -832,9 +832,14 @@ err:
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
+    VFIOContainer *container = vbasedev->group->container;
     struct vfio_region_info *info = NULL;
     Error *local_err = NULL;
-    int ret;
+    int ret = -ENOTSUP;
+
+    if (!container->dirty_pages_supported) {
+        goto add_blocker;
+    }
 
     ret = vfio_get_dev_region_info(vbasedev, VFIO_REGION_TYPE_MIGRATION,
                                    VFIO_REGION_SUBTYPE_MIGRATION, &info);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index f4ebdae013ad..b1c1b18fd228 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -84,6 +84,9 @@ typedef struct VFIOContainer {
     unsigned iommu_type;
     Error *error;
     bool initialized;
+    bool dirty_pages_supported;
+    uint64_t dirty_pgsizes;
+    uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;


