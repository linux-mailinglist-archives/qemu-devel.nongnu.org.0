Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10869A20A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnGX-0001wu-RB; Thu, 16 Feb 2023 18:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGV-0001vV-8O
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:02:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGT-0005Vo-Fa
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676588528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+IkozIjQKiHH8PGuRoil87YVIIzA8rfKzX2Mdki6k7g=;
 b=KoWYhC5mPtFQ+6KtXAPXjvtA/197cLkz4iQfYwkE1B3NsTZyLqhMqWkR6oV4XiQ3zoW+u6
 Uq/x83staPwVzwJ2kcEXUPzPXMFaJklRk986OW6bIR4CQd42cQWrEpgfwzW/9ty+/ZTAkv
 tnXIBl227pMDVBmzXVzi9peYVhouh+E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-_N7IldneNfCNHyXdz6GqWw-1; Thu, 16 Feb 2023 18:02:07 -0500
X-MC-Unique: _N7IldneNfCNHyXdz6GqWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA5F1802D32;
 Thu, 16 Feb 2023 23:02:06 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E6E01415108;
 Thu, 16 Feb 2023 23:02:06 +0000 (UTC)
Subject: [PULL 03/12] vfio/migration: Allow migration without VFIO IOMMU dirty
 tracking support
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com
Date: Thu, 16 Feb 2023 16:02:06 -0700
Message-ID: <167658852600.932837.15806628304062927059.stgit@omen>
In-Reply-To: <167658846945.932837.1420176491103357684.stgit@omen>
References: <167658846945.932837.1420176491103357684.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

From: Avihai Horon <avihaih@nvidia.com>

Currently, if IOMMU of a VFIO container doesn't support dirty page
tracking, migration is blocked. This is because a DMA-able VFIO device
can dirty RAM pages without updating QEMU about it, thus breaking the
migration.

However, this doesn't mean that migration can't be done at all.
In such case, allow migration and let QEMU VFIO code mark all pages
dirty.

This guarantees that all pages that might have gotten dirty are reported
back, and thus guarantees a valid migration even without VFIO IOMMU
dirty tracking support.

The motivation for this patch is the introduction of iommufd [1].
iommufd can directly implement the /dev/vfio/vfio container IOCTLs by
mapping them into its internal ops, allowing the usage of these IOCTLs
over iommufd. However, VFIO IOMMU dirty tracking is not supported by
this VFIO compatibility API.

This patch will allow migration by hosts that use the VFIO compatibility
API and prevent migration regressions caused by the lack of VFIO IOMMU
dirty tracking support.

[1]
https://lore.kernel.org/kvm/0-v6-a196d26f289e+11787-iommufd_jgg@nvidia.com/

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Link: https://lore.kernel.org/r/20230216143630.25610-4-avihaih@nvidia.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c    |   20 ++++++++++++++++++--
 hw/vfio/migration.c |    3 +--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 130e5d1dc702..f6dd5715492e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -488,6 +488,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
+    if (iotlb && vfio_devices_all_running_and_saving(container)) {
+        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
+                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
+                                            DIRTY_CLIENTS_NOCODE);
+    }
+
     return 0;
 }
 
@@ -1201,6 +1207,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         .argsz = sizeof(dirty),
     };
 
+    if (!container->dirty_pages_supported) {
+        return;
+    }
+
     if (start) {
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
     } else {
@@ -1236,6 +1246,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
     uint64_t pages;
     int ret;
 
+    if (!container->dirty_pages_supported) {
+        cpu_physical_memory_set_dirty_range(ram_addr, size,
+                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
+                                            DIRTY_CLIENTS_NOCODE);
+        return 0;
+    }
+
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1409,8 +1426,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
-    if (vfio_listener_skipped_section(section) ||
-        !container->dirty_pages_supported) {
+    if (vfio_listener_skipped_section(section)) {
         return;
     }
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 65f3f3bef795..e56eef1ee83c 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -858,11 +858,10 @@ int64_t vfio_mig_bytes_transferred(void)
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
-    VFIOContainer *container = vbasedev->group->container;
     struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
-    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
+    if (!vbasedev->enable_migration) {
         goto add_blocker;
     }
 



