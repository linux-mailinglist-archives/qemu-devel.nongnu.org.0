Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2224929A0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:27:18 +0100 (CET)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qOD-00049O-MM
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:27:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9q5p-0000SP-9Z
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:08:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9q5n-0006cn-61
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642518494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALE3K/cz+IibQ3ygej27zRm1ecd6bqF3Pl8dg6DnOFM=;
 b=N69mzJP7ixV+unY3qVg5rDm6OwZHiRSuYUegcw257jqC314AaoUtJZ0I5uJtD/KoJ4h80d
 2OA0FHLKM8fWIl6Bha9Oz26cV2KlwHXgWbiqhh4zt7FpGRwuYfgCDeJxAkD7412Q5fmziH
 HTg+nGLxIz9s7F9AO1E30DIsvm2w4dI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-EpTte8irOIOXn33xaVMnMw-1; Tue, 18 Jan 2022 10:08:13 -0500
X-MC-Unique: EpTte8irOIOXn33xaVMnMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C55B839A42
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 15:08:12 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AF5E5DBA2;
 Tue, 18 Jan 2022 15:08:10 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] virtio-mem: Handle preallocation with migration
Date: Tue, 18 Jan 2022 16:07:12 +0100
Message-Id: <20220118150712.139953-3-david@redhat.com>
In-Reply-To: <20220118150712.139953-1-david@redhat.com>
References: <20220118150712.139953-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michal Privoznik <mprivozn@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During precopy we usually write all plugged ares and essentially
allocate them. However, there are two corner cases:

1) Migrating the zeropage

When the zeropage gets migrated, we first check if the destination range is
already zero and avoid performing a write in that case:
ram_handle_compressed(). If the memory backend, like anonymous RAM or
most filesystems, populate the shared zeropage when reading a (file) hole,
we don't preallocate backend memory. In that case, we have to explicitly
trigger the allocation to allocate actual backend memory.

2) Excluding memory ranges during migration

For example, virtio-balloon free page hinting will exclude some pages
from getting migrated. In that case, we don't allocate memory for
plugged ranges when migrating.

So trigger allocation of all plugged ranges when restoring the device state
and fail gracefully if allocation fails.

Handling postcopy is a bit more tricky, as postcopy and preallocation
are problematic in general. To at least mimic what ordinary
preallocation does, temporarily try allocating the requested amount
of memory and fail postcopy in case the requested size on source and
destination doesn't match. This way, we at least checked that there isn't
a fundamental configuration issue and that we were able to preallocate
the required amount of memory at least once, instead of failing
unrecoverably during postcopy later. However, just as ordinary
preallocation with postcopy, it's racy.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c         | 136 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-mem.h |   6 ++
 2 files changed, 142 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 6c337db0a7..f48e684aa9 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -27,6 +27,7 @@
 #include "qapi/visitor.h"
 #include "exec/ram_addr.h"
 #include "migration/misc.h"
+#include "migration/postcopy-ram.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include CONFIG_DEVICES
@@ -193,6 +194,30 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
     return ret;
 }
 
+static int virtio_mem_for_each_plugged_range(const VirtIOMEM *vmem, void *arg,
+                                             virtio_mem_range_cb cb)
+{
+    unsigned long first_bit, last_bit;
+    uint64_t offset, size;
+    int ret = 0;
+
+    first_bit = find_first_bit(vmem->bitmap, vmem->bitmap_size);
+    while (first_bit < vmem->bitmap_size) {
+        offset = first_bit * vmem->block_size;
+        last_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
+                                      first_bit + 1) - 1;
+        size = (last_bit - first_bit + 1) * vmem->block_size;
+
+        ret = cb(vmem, arg, offset, size);
+        if (ret) {
+            break;
+        }
+        first_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
+                                  last_bit + 2);
+    }
+    return ret;
+}
+
 /*
  * Adjust the memory section to cover the intersection with the given range.
  *
@@ -819,6 +844,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
     if (!vmem->block_size) {
         vmem->block_size = virtio_mem_default_block_size(rb);
     }
+    vmem->initial_requested_size = vmem->requested_size;
 
     if (vmem->block_size < page_size) {
         error_setg(errp, "'%s' property has to be at least the page size (0x%"
@@ -879,6 +905,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
      */
     memory_region_set_ram_discard_manager(&vmem->memdev->mr,
                                           RAM_DISCARD_MANAGER(vmem));
+    postcopy_add_notifier(&vmem->postcopy_notifier);
 }
 
 static void virtio_mem_device_unrealize(DeviceState *dev)
@@ -886,6 +913,7 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOMEM *vmem = VIRTIO_MEM(dev);
 
+    postcopy_remove_notifier(&vmem->postcopy_notifier);
     /*
      * The unplug handler unmapped the memory region, it cannot be
      * found via an address space anymore. Unset ourselves.
@@ -915,12 +943,119 @@ static int virtio_mem_restore_unplugged(VirtIOMEM *vmem)
                                                virtio_mem_discard_range_cb);
 }
 
+static int virtio_mem_prealloc_range(const VirtIOMEM *vmem, uint64_t offset,
+                                     uint64_t size)
+{
+    void *area = memory_region_get_ram_ptr(&vmem->memdev->mr) + offset;
+    int fd = memory_region_get_fd(&vmem->memdev->mr);
+    Error *local_err = NULL;
+
+    os_mem_prealloc(fd, area, size, 1, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        return -ENOMEM;
+    }
+    return 0;
+}
+
+static int virtio_mem_prealloc_range_cb(const VirtIOMEM *vmem, void *arg,
+                                        uint64_t offset, uint64_t size)
+{
+    return virtio_mem_prealloc_range(vmem, offset, size);
+}
+
+static int virtio_mem_restore_prealloc(VirtIOMEM *vmem)
+{
+    /*
+     * Make sure any preallocated memory is really preallocated. Migration
+     * might have skipped some pages or optimized for the zeropage.
+     */
+    return virtio_mem_for_each_plugged_range(vmem, NULL,
+                                             virtio_mem_prealloc_range_cb);
+}
+
+static int virtio_mem_postcopy_notify(NotifierWithReturn *notifier,
+                                      void *opaque)
+{
+    struct PostcopyNotifyData *pnd = opaque;
+    VirtIOMEM *vmem = container_of(notifier, VirtIOMEM, postcopy_notifier);
+    RAMBlock *rb = vmem->memdev->mr.ram_block;
+    int ret;
+
+    if (pnd->reason != POSTCOPY_NOTIFY_INBOUND_ADVISE || !vmem->prealloc ||
+        !vmem->initial_requested_size) {
+        return 0;
+    }
+    assert(!vmem->size);
+
+    /*
+     * When creating the device we discard all memory and we don't know
+     * which blocks the source has plugged (and should be preallocated) until we
+     * restore the device state. However, we cannot allocate when restoring the
+     * device state either if postcopy is already active.
+     *
+     * If we reach this point, postcopy is possible and we have preallocation
+     * enabled.
+     *
+     * Temporarily allocate the requested size to see if there is a fundamental
+     * configuration issue that would make postcopy fail because the memory
+     * backend is out of memory. While this increases reliability,
+     * prealloc+postcopy cannot be fully reliable: see the comment in
+     * virtio_mem_post_load().
+     */
+    ret = virtio_mem_prealloc_range(vmem, 0, vmem->initial_requested_size);
+    if (ram_block_discard_range(rb, 0, vmem->initial_requested_size)) {
+        ret = ret ? ret : -EINVAL;
+        return ret;
+    }
+    return 0;
+}
+
 static int virtio_mem_post_load(void *opaque, int version_id)
 {
     VirtIOMEM *vmem = VIRTIO_MEM(opaque);
     RamDiscardListener *rdl;
     int ret;
 
+    if (vmem->prealloc) {
+        if (migration_in_incoming_postcopy()) {
+            /*
+             * Prealloc with postcopy cannot possibly work fully reliable in
+             * general: preallocation has to populate all memory immediately and
+             * fail gracefully before the guest started running on the
+             * destination while postcopy wants to discard memory and populate
+             * on demand after the guest started running on the destination.
+             *
+             * For ordinary memory backends, "prealloc=on" is essentially
+             * overridden by postcopy, which will simply discard preallocated
+             * pages and might fail later when running out of backend memory
+             * when trying to place a page: the earlier preallocation only makes
+             * it less likely to fail, but nothing (not even huge page
+             * reservation) will guarantee that postcopy will find a free page
+             * to place once the guest is running on the destination.
+             *
+             * We temporarily allocate "requested-size" during
+             * POSTCOPY_NOTIFY_INBOUND_ADVISE, before migrating any memory. This
+             * resembles what is done with ordinary memory backends.
+             *
+             * We need to have a matching requested size on source and
+             * destination that we actually temporarily allocated the right
+             * amount of memory. As requested-size changed when restoring the
+             * state, check against the initial value.
+             */
+            if (vmem->requested_size != vmem->initial_requested_size) {
+                error_report("postcopy with 'prealloc=on' needs matching"
+                             " 'requested-size' on source and destination");
+                return -EINVAL;
+            }
+        } else {
+            ret = virtio_mem_restore_prealloc(vmem);
+            if (ret) {
+                return ret;
+            }
+        }
+    }
+
     /*
      * We started out with all memory discarded and our memory region is mapped
      * into an address space. Replay, now that we updated the bitmap.
@@ -1189,6 +1324,7 @@ static void virtio_mem_instance_init(Object *obj)
 
     notifier_list_init(&vmem->size_change_notifiers);
     QLIST_INIT(&vmem->rdl_list);
+    vmem->postcopy_notifier.notify = virtio_mem_postcopy_notify;
 
     object_property_add(obj, VIRTIO_MEM_SIZE_PROP, "size", virtio_mem_get_size,
                         NULL, NULL, NULL);
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 7745cfc1a3..45395152d2 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -61,6 +61,9 @@ struct VirtIOMEM {
     /* requested size */
     uint64_t requested_size;
 
+    /* initial requested size on startup */
+    uint64_t initial_requested_size;
+
     /* block size and alignment */
     uint64_t block_size;
 
@@ -77,6 +80,9 @@ struct VirtIOMEM {
     /* notifiers to notify when "size" changes */
     NotifierList size_change_notifiers;
 
+    /* notifier for postcopy events */
+    NotifierWithReturn postcopy_notifier;
+
     /* listeners to notify on plug/unplug activity. */
     QLIST_HEAD(, RamDiscardListener) rdl_list;
 };
-- 
2.34.1


