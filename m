Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAEC2ED114
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 14:45:09 +0100 (CET)
Received: from localhost ([::1]:37768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVbA-0005oC-3z
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 08:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxVS5-0004wJ-IF
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:35:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxVS2-0004SR-TM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610026542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAcvYCzOsfSzsISlhG1Pg4+ha0mhGX0n8M02y24P1s4=;
 b=UeaKYS93HhOE83lRaGjX1O8c5IY49aAjhXlkVV/uqkk0NIpSZPN9W7GicNj7uCkww3vMXw
 hTvqiPA3tf5opFLOlo/gEaHN6DOh9cEzANlk95LqEo+JpArDSRVLQSjkwAgYNVeQ9HiLHu
 EohpYhhEwax3fjSagg55hyWx4P0CWG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-youk8R1YMbSoRfYg-py3iA-1; Thu, 07 Jan 2021 08:35:38 -0500
X-MC-Unique: youk8R1YMbSoRfYg-py3iA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C86F1800D42;
 Thu,  7 Jan 2021 13:35:37 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-161.ams2.redhat.com [10.36.114.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D3A35C67A;
 Thu,  7 Jan 2021 13:35:16 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/11] virtio-mem: Implement RamDiscardMgr interface
Date: Thu,  7 Jan 2021 14:34:15 +0100
Message-Id: <20210107133423.44964-4-david@redhat.com>
In-Reply-To: <20210107133423.44964-1-david@redhat.com>
References: <20210107133423.44964-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's properly notify when (un)plugging blocks, after discarding memory
and before allowing the guest to consume memory. Handle errors from
notifiers gracefully (e.g., no remaining VFIO mappings) when plugging,
rolling back the change and telling the guest that the VM is busy.

One special case to take care of is replaying all notifications after
restoring the vmstate. The device starts out with all memory discarded,
so after loading the vmstate, we have to notify about all plugged
blocks.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c         | 258 ++++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-mem.h |   3 +
 2 files changed, 258 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 471e464171..6200813bb8 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -172,7 +172,110 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
     return ret;
 }
 
-static bool virtio_mem_test_bitmap(VirtIOMEM *vmem, uint64_t start_gpa,
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
+static void virtio_mem_notify_unplug(VirtIOMEM *vmem, uint64_t offset,
+                                     uint64_t size)
+{
+    RamDiscardListener *rdl;
+
+    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
+        rdl->notify_discard(rdl, &vmem->memdev->mr, offset, size);
+    }
+}
+
+static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
+                                  uint64_t size)
+{
+    RamDiscardListener *rdl, *rdl2;
+    int ret = 0, ret2;
+
+    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
+        ret = rdl->notify_populate(rdl, &vmem->memdev->mr, offset, size);
+        if (ret) {
+            break;
+        }
+    }
+
+    if (ret) {
+        /* Could be a mapping attempt resulted in memory getting populated. */
+        ret2 = ram_block_discard_range(vmem->memdev->mr.ram_block, offset,
+                                       size);
+        if (ret2) {
+            error_report("Unexpected error discarding RAM: %s",
+                         strerror(-ret2));
+        }
+
+        /* Notify all already-notified listeners. */
+        QLIST_FOREACH(rdl2, &vmem->rdl_list, next) {
+            if (rdl2 == rdl) {
+                break;
+            }
+            rdl2->notify_discard(rdl2, &vmem->memdev->mr, offset, size);
+        }
+    }
+    return ret;
+}
+
+static int virtio_mem_notify_discard_range_cb(const VirtIOMEM *vmem, void *arg,
+                                              uint64_t offset, uint64_t size)
+{
+    RamDiscardListener *rdl;
+
+    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
+        if (!rdl->notify_discard_all) {
+            rdl->notify_discard(rdl, &vmem->memdev->mr, offset, size);
+        }
+    }
+    return 0;
+}
+
+static void virtio_mem_notify_unplug_all(VirtIOMEM *vmem)
+{
+    bool individual_calls = false;
+    RamDiscardListener *rdl;
+
+    if (!vmem->size) {
+        return;
+    }
+
+    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
+        if (rdl->notify_discard_all) {
+            rdl->notify_discard_all(rdl, &vmem->memdev->mr);
+        } else {
+            individual_calls = true;
+        }
+    }
+
+    if (individual_calls) {
+        virtio_mem_for_each_unplugged_range(vmem, NULL,
+                                            virtio_mem_notify_discard_range_cb);
+    }
+}
+
+static bool virtio_mem_test_bitmap(const VirtIOMEM *vmem, uint64_t start_gpa,
                                    uint64_t size, bool plugged)
 {
     const unsigned long first_bit = (start_gpa - vmem->addr) / vmem->block_size;
@@ -225,7 +328,8 @@ static void virtio_mem_send_response_simple(VirtIOMEM *vmem,
     virtio_mem_send_response(vmem, elem, &resp);
 }
 
-static bool virtio_mem_valid_range(VirtIOMEM *vmem, uint64_t gpa, uint64_t size)
+static bool virtio_mem_valid_range(const VirtIOMEM *vmem, uint64_t gpa,
+                                   uint64_t size)
 {
     if (!QEMU_IS_ALIGNED(gpa, vmem->block_size)) {
         return false;
@@ -259,6 +363,9 @@ static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
                          strerror(-ret));
             return -EBUSY;
         }
+        virtio_mem_notify_unplug(vmem, offset, size);
+    } else if (virtio_mem_notify_plug(vmem, offset, size)) {
+        return -EBUSY;
     }
     virtio_mem_set_bitmap(vmem, start_gpa, size, plug);
     return 0;
@@ -356,6 +463,8 @@ static int virtio_mem_unplug_all(VirtIOMEM *vmem)
         error_report("Unexpected error discarding RAM: %s", strerror(-ret));
         return -EBUSY;
     }
+    virtio_mem_notify_unplug_all(vmem);
+
     bitmap_clear(vmem->bitmap, 0, vmem->bitmap_size);
     if (vmem->size) {
         vmem->size = 0;
@@ -604,6 +713,12 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
     vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
     qemu_register_reset(virtio_mem_system_reset, vmem);
     precopy_add_notifier(&vmem->precopy_notifier);
+
+    /*
+     * Set ourselves as RamDiscardMgr before the plug handler maps the memory
+     * region and exposes it via an address space.
+     */
+    memory_region_set_ram_discard_mgr(&vmem->memdev->mr, RAM_DISCARD_MGR(vmem));
 }
 
 static void virtio_mem_device_unrealize(DeviceState *dev)
@@ -611,6 +726,11 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOMEM *vmem = VIRTIO_MEM(dev);
 
+    /*
+     * The unplug handler unmapped the memory region, it cannot be
+     * found via an address space anymore. Unset ourselves.
+     */
+    memory_region_set_ram_discard_mgr(&vmem->memdev->mr, NULL);
     precopy_remove_notifier(&vmem->precopy_notifier);
     qemu_unregister_reset(virtio_mem_system_reset, vmem);
     vmstate_unregister_ram(&vmem->memdev->mr, DEVICE(vmem));
@@ -642,13 +762,41 @@ static int virtio_mem_restore_unplugged(VirtIOMEM *vmem)
                                                virtio_mem_discard_range_cb);
 }
 
+static int virtio_mem_post_load_replay_cb(const VirtIOMEM *vmem, void *arg,
+                                          uint64_t offset, uint64_t size)
+{
+    RamDiscardListener *rdl;
+    int ret = 0;
+
+    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
+        ret = rdl->notify_populate(rdl, &vmem->memdev->mr, offset, size);
+        if (ret) {
+            break;
+        }
+    }
+    return ret;
+}
+
 static int virtio_mem_post_load(void *opaque, int version_id)
 {
+    VirtIOMEM *vmem = VIRTIO_MEM(opaque);
+    int ret;
+
+    /*
+     * We started out with all memory discarded and our memory region is mapped
+     * into an address space. Replay, now that we updated the bitmap.
+     */
+    ret = virtio_mem_for_each_plugged_range(vmem, NULL,
+                                            virtio_mem_post_load_replay_cb);
+    if (ret) {
+        return ret;
+    }
+
     if (migration_in_incoming_postcopy()) {
         return 0;
     }
 
-    return virtio_mem_restore_unplugged(VIRTIO_MEM(opaque));
+    return virtio_mem_restore_unplugged(vmem);
 }
 
 typedef struct VirtIOMEMMigSanityChecks {
@@ -933,6 +1081,7 @@ static void virtio_mem_instance_init(Object *obj)
 
     notifier_list_init(&vmem->size_change_notifiers);
     vmem->precopy_notifier.notify = virtio_mem_precopy_notify;
+    QLIST_INIT(&vmem->rdl_list);
 
     object_property_add(obj, VIRTIO_MEM_SIZE_PROP, "size", virtio_mem_get_size,
                         NULL, NULL, NULL);
@@ -952,11 +1101,104 @@ static Property virtio_mem_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static uint64_t virtio_mem_rdm_get_min_granularity(const RamDiscardMgr *rdm,
+                                                   const MemoryRegion *mr)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+
+    g_assert(mr == &vmem->memdev->mr);
+    return vmem->block_size;
+}
+
+static bool virtio_mem_rdm_is_populated(const RamDiscardMgr *rdm,
+                                        const MemoryRegion *mr,
+                                        ram_addr_t offset, ram_addr_t size)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+    uint64_t start_gpa = QEMU_ALIGN_DOWN(vmem->addr + offset, vmem->block_size);
+    uint64_t end_gpa = QEMU_ALIGN_UP(vmem->addr + offset + size,
+                                     vmem->block_size);
+
+    g_assert(mr == &vmem->memdev->mr);
+    if (!virtio_mem_valid_range(vmem, start_gpa, end_gpa - start_gpa)) {
+        return false;
+    }
+
+    return virtio_mem_test_bitmap(vmem, start_gpa, end_gpa - start_gpa, true);
+}
+
+static int virtio_mem_notify_populate_range_single_cb(const VirtIOMEM *vmem,
+                                                      void *arg,
+                                                      uint64_t offset,
+                                                      uint64_t size)
+{
+    RamDiscardListener *rdl = arg;
+
+    return rdl->notify_populate(rdl, &vmem->memdev->mr, offset, size);
+}
+
+static int virtio_mem_notify_discard_range_single_cb(const VirtIOMEM *vmem,
+                                                     void *arg,
+                                                     uint64_t offset,
+                                                     uint64_t size)
+{
+    RamDiscardListener *rdl = arg;
+
+    rdl->notify_discard(rdl, &vmem->memdev->mr, offset, size);
+    return 0;
+}
+
+static void virtio_mem_rdm_register_listener(RamDiscardMgr *rdm,
+                                             const MemoryRegion *mr,
+                                             RamDiscardListener *rdl)
+{
+    VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+    int ret;
+
+    g_assert(mr == &vmem->memdev->mr);
+    QLIST_INSERT_HEAD(&vmem->rdl_list, rdl, next);
+    ret = virtio_mem_for_each_plugged_range(vmem, rdl,
+                                    virtio_mem_notify_populate_range_single_cb);
+    if (ret) {
+        error_report("%s: Replaying plugged ranges failed: %s", __func__,
+                     strerror(-ret));
+    }
+}
+
+static void virtio_mem_rdm_unregister_listener(RamDiscardMgr *rdm,
+                                               const MemoryRegion *mr,
+                                               RamDiscardListener *rdl)
+{
+    VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+
+    g_assert(mr == &vmem->memdev->mr);
+    if (rdl->notify_discard_all) {
+        rdl->notify_discard_all(rdl, &vmem->memdev->mr);
+    } else {
+        virtio_mem_for_each_plugged_range(vmem, rdl,
+                                     virtio_mem_notify_discard_range_single_cb);
+
+    }
+    QLIST_REMOVE(rdl, next);
+}
+
+static int virtio_mem_rdm_replay_populated(const RamDiscardMgr *rdm,
+                                           const MemoryRegion *mr,
+                                           RamDiscardListener *rdl)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+
+    g_assert(mr == &vmem->memdev->mr);
+    return virtio_mem_for_each_plugged_range(vmem, rdl,
+                                    virtio_mem_notify_populate_range_single_cb);
+}
+
 static void virtio_mem_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
     VirtIOMEMClass *vmc = VIRTIO_MEM_CLASS(klass);
+    RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_CLASS(klass);
 
     device_class_set_props(dc, virtio_mem_properties);
     dc->vmsd = &vmstate_virtio_mem;
@@ -972,6 +1214,12 @@ static void virtio_mem_class_init(ObjectClass *klass, void *data)
     vmc->get_memory_region = virtio_mem_get_memory_region;
     vmc->add_size_change_notifier = virtio_mem_add_size_change_notifier;
     vmc->remove_size_change_notifier = virtio_mem_remove_size_change_notifier;
+
+    rdmc->get_min_granularity = virtio_mem_rdm_get_min_granularity;
+    rdmc->is_populated = virtio_mem_rdm_is_populated;
+    rdmc->register_listener = virtio_mem_rdm_register_listener;
+    rdmc->unregister_listener = virtio_mem_rdm_unregister_listener;
+    rdmc->replay_populated = virtio_mem_rdm_replay_populated;
 }
 
 static const TypeInfo virtio_mem_info = {
@@ -981,6 +1229,10 @@ static const TypeInfo virtio_mem_info = {
     .instance_init = virtio_mem_instance_init,
     .class_init = virtio_mem_class_init,
     .class_size = sizeof(VirtIOMEMClass),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_RAM_DISCARD_MGR },
+        { }
+    },
 };
 
 static void virtio_register_types(void)
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 4eeb82d5dd..9a6e348fa2 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -67,6 +67,9 @@ struct VirtIOMEM {
 
     /* don't migrate unplugged memory */
     NotifierWithReturn precopy_notifier;
+
+    /* listeners to notify on plug/unplug activity. */
+    QLIST_HEAD(, RamDiscardListener) rdl_list;
 };
 
 struct VirtIOMEMClass {
-- 
2.29.2


