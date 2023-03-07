Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202136AF28D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcR6-00033K-3p; Tue, 07 Mar 2023 13:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcR2-0002yl-Qa
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcR1-0002WB-0b
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678215194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tk2/PnF27CbcRCUs1GhrJC8H5sfK6c1nP3V520wbWsY=;
 b=LiG77HKu6ZM1cUcUBBJG73Zypp5kXEG2D4/UrZovNpnFiyoZMu/Xec0nzPQ58d6nypSuKA
 kDOJ/yKDS0KxAydTbGHU0xuklLbjoVuPBKzxBtuYCfEV8QVkjZTSON2jhlK57GramGCGby
 /9HZZTGZdM3oiW2FzU8cxxFdz+iC12A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-MjRIu6BzPGuJ50t1RH-J3g-1; Tue, 07 Mar 2023 13:53:11 -0500
X-MC-Unique: MjRIu6BzPGuJ50t1RH-J3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1444802C18;
 Tue,  7 Mar 2023 18:53:10 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.16.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87D08C15BA0;
 Tue,  7 Mar 2023 18:53:10 +0000 (UTC)
Subject: [PULL 09/17] vfio/common: Record DMA mapped IOVA ranges
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com,
 joao.m.martins@oracle.com
Date: Tue, 07 Mar 2023 11:53:10 -0700
Message-ID: <167821519017.619792.7848782089525868006.stgit@omen>
In-Reply-To: <167821508699.619792.1719671327865445814.stgit@omen>
References: <167821508699.619792.1719671327865445814.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

From: Joao Martins <joao.m.martins@oracle.com>

According to the device DMA logging uAPI, IOVA ranges to be logged by
the device must be provided all at once upon DMA logging start.

As preparation for the following patches which will add device dirty
page tracking, keep a record of all DMA mapped IOVA ranges so later they
can be used for DMA logging start.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20230307125450.62409-10-joao.m.martins@oracle.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c     |   85 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events |    1 +
 2 files changed, 86 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 63831eab78a1..811502dbc97c 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1325,11 +1325,96 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
     return ret;
 }
 
+typedef struct VFIODirtyRanges {
+    hwaddr min32;
+    hwaddr max32;
+    hwaddr min64;
+    hwaddr max64;
+} VFIODirtyRanges;
+
+typedef struct VFIODirtyRangesListener {
+    VFIOContainer *container;
+    VFIODirtyRanges ranges;
+    MemoryListener listener;
+} VFIODirtyRangesListener;
+
+static void vfio_dirty_tracking_update(MemoryListener *listener,
+                                       MemoryRegionSection *section)
+{
+    VFIODirtyRangesListener *dirty = container_of(listener,
+                                                  VFIODirtyRangesListener,
+                                                  listener);
+    VFIODirtyRanges *range = &dirty->ranges;
+    hwaddr iova, end, *min, *max;
+
+    if (!vfio_listener_valid_section(section, "tracking_update") ||
+        !vfio_get_section_iova_range(dirty->container, section,
+                                     &iova, &end, NULL)) {
+        return;
+    }
+
+    /*
+     * The address space passed to the dirty tracker is reduced to two ranges:
+     * one for 32-bit DMA ranges, and another one for 64-bit DMA ranges.
+     * The underlying reports of dirty will query a sub-interval of each of
+     * these ranges.
+     *
+     * The purpose of the dual range handling is to handle known cases of big
+     * holes in the address space, like the x86 AMD 1T hole. The alternative
+     * would be an IOVATree but that has a much bigger runtime overhead and
+     * unnecessary complexity.
+     */
+    min = (end <= UINT32_MAX) ? &range->min32 : &range->min64;
+    max = (end <= UINT32_MAX) ? &range->max32 : &range->max64;
+
+    if (*min > iova) {
+        *min = iova;
+    }
+    if (*max < end) {
+        *max = end;
+    }
+
+    trace_vfio_device_dirty_tracking_update(iova, end, *min, *max);
+    return;
+}
+
+static const MemoryListener vfio_dirty_tracking_listener = {
+    .name = "vfio-tracking",
+    .region_add = vfio_dirty_tracking_update,
+};
+
+static void vfio_dirty_tracking_init(VFIOContainer *container,
+                                     VFIODirtyRanges *ranges)
+{
+    VFIODirtyRangesListener dirty;
+
+    memset(&dirty, 0, sizeof(dirty));
+    dirty.ranges.min32 = UINT32_MAX;
+    dirty.ranges.min64 = UINT64_MAX;
+    dirty.listener = vfio_dirty_tracking_listener;
+    dirty.container = container;
+
+    memory_listener_register(&dirty.listener,
+                             container->space->as);
+
+    *ranges = dirty.ranges;
+
+    /*
+     * The memory listener is synchronous, and used to calculate the range
+     * to dirty tracking. Unregister it after we are done as we are not
+     * interested in any follow-up updates.
+     */
+    memory_listener_unregister(&dirty.listener);
+}
+
 static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    VFIODirtyRanges ranges;
     int ret;
 
+    vfio_dirty_tracking_init(container, &ranges);
+
     ret = vfio_set_dirty_page_tracking(container, true);
     if (ret) {
         vfio_set_migration_error(ret);
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 7173e6a5c721..dd9fd7b9bddb 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -103,6 +103,7 @@ vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr
 vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_within_region, uintptr_t page_size) "Region \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64" qemu_real_host_page_size=0x%"PRIxPTR
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
+vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
 vfio_disconnect_container(int fd) "close container->fd=%d"
 vfio_put_group(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"



