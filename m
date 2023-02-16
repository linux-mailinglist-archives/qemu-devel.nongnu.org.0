Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75991699399
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:49:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSck7-0004Cg-4w; Thu, 16 Feb 2023 06:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSck4-0004Bg-Dj
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:48:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSck2-0005bk-KN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676548078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOxTKnQxX/V7pj4h/fipsVbjbaWTl7j5IscUzUHX44o=;
 b=KhuzWiE2MY3CgmKkBAX6Q61GWWdbaOuDaJC5UTfD289fN16Gu36E4cDB0kTyrmnvpN0hmN
 uAE7wbK3f3I+rvcdMUXGQLRfJCI4d0tVoEIsrVDmPT6zQHn4mhZNj6p/gjxTXFklcGrxik
 6GaD+xhYAEqmMuGc7DBUzEobwyvk3BM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-B4z6i6LzNgCl_DmptDSaUg-1; Thu, 16 Feb 2023 06:47:56 -0500
X-MC-Unique: B4z6i6LzNgCl_DmptDSaUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6E553C14860;
 Thu, 16 Feb 2023 11:47:56 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.195.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 354E5140EBF6;
 Thu, 16 Feb 2023 11:47:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>
Subject: [PATCH v1 1/2] vhost: Defer filtering memory sections until building
 the vhost memory structure
Date: Thu, 16 Feb 2023 12:47:51 +0100
Message-Id: <20230216114752.198627-2-david@redhat.com>
In-Reply-To: <20230216114752.198627-1-david@redhat.com>
References: <20230216114752.198627-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

Having multiple devices, some filtering memslots and some not filtering
memslots, messes up the "used_memslot" accounting. If we'd have a device
the filters out less memory sections after a device that filters out more,
we'd be in trouble, because our memslot checks stop working reliably.
For example, hotplugging a device that filters out less memslots might end
up passing the checks based on max vs. used memslots, but can run out of
memslots when getting notified about all memory sections.

Further, it will be helpful in memory device context in the near future
to know that a RAM memory region section will consume a memslot, and be
accounted for in the used vs. free memslots, such that we can implement
reservation of memslots for memory devices properly. Whether a device
filters this out and would theoretically still have a free memslot is
then hidden internally, making overall vhost memslot accounting easier.

Let's filter the memslots when creating the vhost memory array,
accounting all RAM && !ROM memory regions as "used_memslots" even if
vhost_user isn't interested in anonymous RAM regions, because it needs
an fd.

When a device actually filters out regions (which should happen rarely
in practice), we might detect a layout change although only filtered
regions changed. We won't bother about optimizing that for now.

Note: we cannot simply filter out the region and count them as
"filtered" to add them to used, because filtered regions could get
merged and result in a smaller effective number of memslots. Further,
we won't touch the hmp/qmp virtio introspection output.

Fixes: 988a27754bbb ("vhost: allow backends to filter memory sections")
Cc: Tiwei Bie <tiwei.bie@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/vhost.c | 79 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 24 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index eb8c4c378c..b7fb960fa9 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -219,8 +219,13 @@ static void vhost_log_sync_range(struct vhost_dev *dev,
     int i;
     /* FIXME: this is N^2 in number of sections */
     for (i = 0; i < dev->n_mem_sections; ++i) {
-        MemoryRegionSection *section = &dev->mem_sections[i];
-        vhost_sync_dirty_bitmap(dev, section, first, last);
+        MemoryRegionSection *mrs = &dev->mem_sections[i];
+
+        if (dev->vhost_ops->vhost_backend_mem_section_filter &&
+            !dev->vhost_ops->vhost_backend_mem_section_filter(dev, mrs)) {
+            continue;
+        }
+        vhost_sync_dirty_bitmap(dev, mrs, first, last);
     }
 }
 
@@ -503,12 +508,6 @@ static bool vhost_section(struct vhost_dev *dev, MemoryRegionSection *section)
             return false;
         }
 
-        if (dev->vhost_ops->vhost_backend_mem_section_filter &&
-            !dev->vhost_ops->vhost_backend_mem_section_filter(dev, section)) {
-            trace_vhost_reject_section(mr->name, 2);
-            return false;
-        }
-
         trace_vhost_section(mr->name);
         return true;
     } else {
@@ -525,6 +524,43 @@ static void vhost_begin(MemoryListener *listener)
     dev->n_tmp_sections = 0;
 }
 
+static void vhost_realloc_vhost_memory(struct vhost_dev *dev,
+                                       unsigned int nregions)
+{
+    const size_t size = offsetof(struct vhost_memory, regions) +
+                        nregions * sizeof dev->mem->regions[0];
+
+    dev->mem = g_realloc(dev->mem, size);
+    dev->mem->nregions = nregions;
+}
+
+static void vhost_rebuild_vhost_memory(struct vhost_dev *dev)
+{
+    unsigned int nregions = 0;
+    int i;
+
+    vhost_realloc_vhost_memory(dev, dev->n_mem_sections);
+    for (i = 0; i < dev->n_mem_sections; i++) {
+        struct MemoryRegionSection *mrs = dev->mem_sections + i;
+        struct vhost_memory_region *cur_vmr;
+
+        if (dev->vhost_ops->vhost_backend_mem_section_filter &&
+            !dev->vhost_ops->vhost_backend_mem_section_filter(dev, mrs)) {
+            continue;
+        }
+        cur_vmr = dev->mem->regions + nregions;
+        nregions++;
+
+        cur_vmr->guest_phys_addr = mrs->offset_within_address_space;
+        cur_vmr->memory_size     = int128_get64(mrs->size);
+        cur_vmr->userspace_addr  =
+            (uintptr_t)memory_region_get_ram_ptr(mrs->mr) +
+            mrs->offset_within_region;
+        cur_vmr->flags_padding   = 0;
+    }
+    vhost_realloc_vhost_memory(dev, nregions);
+}
+
 static void vhost_commit(MemoryListener *listener)
 {
     struct vhost_dev *dev = container_of(listener, struct vhost_dev,
@@ -532,7 +568,6 @@ static void vhost_commit(MemoryListener *listener)
     MemoryRegionSection *old_sections;
     int n_old_sections;
     uint64_t log_size;
-    size_t regions_size;
     int r;
     int i;
     bool changed = false;
@@ -564,23 +599,19 @@ static void vhost_commit(MemoryListener *listener)
         goto out;
     }
 
-    /* Rebuild the regions list from the new sections list */
-    regions_size = offsetof(struct vhost_memory, regions) +
-                       dev->n_mem_sections * sizeof dev->mem->regions[0];
-    dev->mem = g_realloc(dev->mem, regions_size);
-    dev->mem->nregions = dev->n_mem_sections;
+    /*
+     * Globally track the used memslots *without* device specific
+     * filtering. This way, we always know how many memslots are required
+     * when devices with differing filtering requirements get mixed, and
+     * all RAM memory regions of memory devices will consume memslots.
+     */
     used_memslots = dev->mem->nregions;
-    for (i = 0; i < dev->n_mem_sections; i++) {
-        struct vhost_memory_region *cur_vmr = dev->mem->regions + i;
-        struct MemoryRegionSection *mrs = dev->mem_sections + i;
 
-        cur_vmr->guest_phys_addr = mrs->offset_within_address_space;
-        cur_vmr->memory_size     = int128_get64(mrs->size);
-        cur_vmr->userspace_addr  =
-            (uintptr_t)memory_region_get_ram_ptr(mrs->mr) +
-            mrs->offset_within_region;
-        cur_vmr->flags_padding   = 0;
-    }
+    /*
+     * Rebuild the regions list from the new sections list, filtering out all
+     * sections that this device is not interested in.
+     */
+    vhost_rebuild_vhost_memory(dev);
 
     if (!dev->started) {
         goto out;
-- 
2.39.1


