Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB535DC22
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:05:46 +0200 (CEST)
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWFvV-0000B6-FR
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFoM-00082b-S9
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFoJ-0004rM-DA
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618307898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cR2rSK+ujh+Sv2mmrZbqLMcR535n2RRR8xM4067PLPU=;
 b=JHuKZtoLqJRg2DM7Wj/b1GCh/xTtCZyPZc7jXjpR/m8A4AkMablL/01F2AXhcWWPwWacE6
 J3h0Ggo+3nRboVnLLAQg6SdyDvq5CBuhH88gdssF3NMg0i955xlRPkWbqC5BHiQpLPnqxI
 CHpQHfr1AwtirhUeJzV8oNzhhcAnvKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-5Pxyy85oM0q_VxAHKpWuQA-1; Tue, 13 Apr 2021 05:58:15 -0400
X-MC-Unique: 5Pxyy85oM0q_VxAHKpWuQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E14EC8030C9;
 Tue, 13 Apr 2021 09:58:13 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-69.ams2.redhat.com [10.36.115.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DF5C5C8AB;
 Tue, 13 Apr 2021 09:57:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v7 05/13] virtio-mem: Implement RamDiscardManager
 interface
Date: Tue, 13 Apr 2021 11:55:23 +0200
Message-Id: <20210413095531.25603-6-david@redhat.com>
In-Reply-To: <20210413095531.25603-1-david@redhat.com>
References: <20210413095531.25603-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
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

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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
 hw/virtio/virtio-mem.c         | 288 ++++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-mem.h |   3 +
 2 files changed, 288 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index bbe42ad83b..e209b56057 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -172,7 +172,146 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
     return ret;
 }
 
-static bool virtio_mem_test_bitmap(VirtIOMEM *vmem, uint64_t start_gpa,
+/*
+ * Adjust the memory section to cover the intersection with the given range.
+ *
+ * Returns false if the intersection is empty, otherwise returns true.
+ */
+static bool virito_mem_intersect_memory_section(MemoryRegionSection *s,
+                                                uint64_t offset, uint64_t size)
+{
+    uint64_t start = MAX(s->offset_within_region, offset);
+    uint64_t end = MIN(s->offset_within_region + int128_get64(s->size),
+                       offset + size);
+
+    if (end <= start) {
+        return false;
+    }
+
+    s->offset_within_address_space += start - s->offset_within_region;
+    s->offset_within_region = start;
+    s->size = int128_make64(end - start);
+    return true;
+}
+
+typedef int (*virtio_mem_section_cb)(MemoryRegionSection *s, void *arg);
+
+static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
+                                               MemoryRegionSection *s,
+                                               void *arg,
+                                               virtio_mem_section_cb cb)
+{
+    unsigned long first_bit, last_bit;
+    uint64_t offset, size;
+    int ret = 0;
+
+    first_bit = s->offset_within_region / vmem->bitmap_size;
+    first_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
+    while (first_bit < vmem->bitmap_size) {
+        MemoryRegionSection tmp = *s;
+
+        offset = first_bit * vmem->block_size;
+        last_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
+                                      first_bit + 1) - 1;
+        size = (last_bit - first_bit + 1) * vmem->block_size;
+
+        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+            break;
+        }
+        ret = cb(&tmp, arg);
+        if (ret) {
+            break;
+        }
+        first_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
+                                  last_bit + 2);
+    }
+    return ret;
+}
+
+static int virtio_mem_notify_populate_cb(MemoryRegionSection *s, void *arg)
+{
+    RamDiscardListener *rdl = arg;
+
+    return rdl->notify_populate(rdl, s);
+}
+
+static int virtio_mem_notify_discard_cb(MemoryRegionSection *s, void *arg)
+{
+    RamDiscardListener *rdl = arg;
+
+    rdl->notify_discard(rdl, s);
+    return 0;
+}
+
+static void virtio_mem_notify_unplug(VirtIOMEM *vmem, uint64_t offset,
+                                     uint64_t size)
+{
+    RamDiscardListener *rdl;
+
+    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
+        MemoryRegionSection tmp = *rdl->section;
+
+        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+            continue;
+        }
+        rdl->notify_discard(rdl, &tmp);
+    }
+}
+
+static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
+                                  uint64_t size)
+{
+    RamDiscardListener *rdl, *rdl2;
+    int ret = 0;
+
+    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
+        MemoryRegionSection tmp = *rdl->section;
+
+        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+            continue;
+        }
+        ret = rdl->notify_populate(rdl, &tmp);
+        if (ret) {
+            break;
+        }
+    }
+
+    if (ret) {
+        /* Notify all already-notified listeners. */
+        QLIST_FOREACH(rdl2, &vmem->rdl_list, next) {
+            MemoryRegionSection tmp = *rdl->section;
+
+            if (rdl2 == rdl) {
+                break;
+            }
+            if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+                continue;
+            }
+            rdl2->notify_discard(rdl2, &tmp);
+        }
+    }
+    return ret;
+}
+
+static void virtio_mem_notify_unplug_all(VirtIOMEM *vmem)
+{
+    RamDiscardListener *rdl;
+
+    if (!vmem->size) {
+        return;
+    }
+
+    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
+        if (rdl->double_discard_supported) {
+            rdl->notify_discard(rdl, rdl->section);
+        } else {
+            virtio_mem_for_each_plugged_section(vmem, rdl->section, rdl,
+                                                virtio_mem_notify_discard_cb);
+        }
+    }
+}
+
+static bool virtio_mem_test_bitmap(const VirtIOMEM *vmem, uint64_t start_gpa,
                                    uint64_t size, bool plugged)
 {
     const unsigned long first_bit = (start_gpa - vmem->addr) / vmem->block_size;
@@ -225,7 +364,8 @@ static void virtio_mem_send_response_simple(VirtIOMEM *vmem,
     virtio_mem_send_response(vmem, elem, &resp);
 }
 
-static bool virtio_mem_valid_range(VirtIOMEM *vmem, uint64_t gpa, uint64_t size)
+static bool virtio_mem_valid_range(const VirtIOMEM *vmem, uint64_t gpa,
+                                   uint64_t size)
 {
     if (!QEMU_IS_ALIGNED(gpa, vmem->block_size)) {
         return false;
@@ -256,6 +396,11 @@ static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
         if (ram_block_discard_range(rb, offset, size)) {
             return -EBUSY;
         }
+        virtio_mem_notify_unplug(vmem, offset, size);
+    } else if (virtio_mem_notify_plug(vmem, offset, size)) {
+        /* Could be a mapping attempt resulted in memory getting populated. */
+        ram_block_discard_range(vmem->memdev->mr.ram_block, offset, size);
+        return -EBUSY;
     }
     virtio_mem_set_bitmap(vmem, start_gpa, size, plug);
     return 0;
@@ -350,6 +495,8 @@ static int virtio_mem_unplug_all(VirtIOMEM *vmem)
     if (ram_block_discard_range(rb, 0, qemu_ram_get_used_length(rb))) {
         return -EBUSY;
     }
+    virtio_mem_notify_unplug_all(vmem);
+
     bitmap_clear(vmem->bitmap, 0, vmem->bitmap_size);
     if (vmem->size) {
         vmem->size = 0;
@@ -598,6 +745,13 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
     vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
     qemu_register_reset(virtio_mem_system_reset, vmem);
     precopy_add_notifier(&vmem->precopy_notifier);
+
+    /*
+     * Set ourselves as RamDiscardManager before the plug handler maps the
+     * memory region and exposes it via an address space.
+     */
+    memory_region_set_ram_discard_manager(&vmem->memdev->mr,
+                                          RAM_DISCARD_MANAGER(vmem));
 }
 
 static void virtio_mem_device_unrealize(DeviceState *dev)
@@ -605,6 +759,11 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOMEM *vmem = VIRTIO_MEM(dev);
 
+    /*
+     * The unplug handler unmapped the memory region, it cannot be
+     * found via an address space anymore. Unset ourselves.
+     */
+    memory_region_set_ram_discard_manager(&vmem->memdev->mr, NULL);
     precopy_remove_notifier(&vmem->precopy_notifier);
     qemu_unregister_reset(virtio_mem_system_reset, vmem);
     vmstate_unregister_ram(&vmem->memdev->mr, DEVICE(vmem));
@@ -632,11 +791,27 @@ static int virtio_mem_restore_unplugged(VirtIOMEM *vmem)
 
 static int virtio_mem_post_load(void *opaque, int version_id)
 {
+    VirtIOMEM *vmem = VIRTIO_MEM(opaque);
+    RamDiscardListener *rdl;
+    int ret;
+
+    /*
+     * We started out with all memory discarded and our memory region is mapped
+     * into an address space. Replay, now that we updated the bitmap.
+     */
+    QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
+        ret = virtio_mem_for_each_plugged_section(vmem, rdl->section, rdl,
+                                                 virtio_mem_notify_populate_cb);
+        if (ret) {
+            return ret;
+        }
+    }
+
     if (migration_in_incoming_postcopy()) {
         return 0;
     }
 
-    return virtio_mem_restore_unplugged(VIRTIO_MEM(opaque));
+    return virtio_mem_restore_unplugged(vmem);
 }
 
 typedef struct VirtIOMEMMigSanityChecks {
@@ -921,6 +1096,7 @@ static void virtio_mem_instance_init(Object *obj)
 
     notifier_list_init(&vmem->size_change_notifiers);
     vmem->precopy_notifier.notify = virtio_mem_precopy_notify;
+    QLIST_INIT(&vmem->rdl_list);
 
     object_property_add(obj, VIRTIO_MEM_SIZE_PROP, "size", virtio_mem_get_size,
                         NULL, NULL, NULL);
@@ -940,11 +1116,107 @@ static Property virtio_mem_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static uint64_t virtio_mem_rdm_get_min_granularity(const RamDiscardManager *rdm,
+                                                   const MemoryRegion *mr)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+
+    g_assert(mr == &vmem->memdev->mr);
+    return vmem->block_size;
+}
+
+static bool virtio_mem_rdm_is_populated(const RamDiscardManager *rdm,
+                                        const MemoryRegionSection *s)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+    uint64_t start_gpa = vmem->addr + s->offset_within_region;
+    uint64_t end_gpa = start_gpa + int128_get64(s->size);
+
+    g_assert(s->mr == &vmem->memdev->mr);
+
+    start_gpa = QEMU_ALIGN_DOWN(start_gpa, vmem->block_size);
+    end_gpa = QEMU_ALIGN_UP(end_gpa, vmem->block_size);
+
+    if (!virtio_mem_valid_range(vmem, start_gpa, end_gpa - start_gpa)) {
+        return false;
+    }
+
+    return virtio_mem_test_bitmap(vmem, start_gpa, end_gpa - start_gpa, true);
+}
+
+struct VirtIOMEMReplayData {
+    void *fn;
+    void *opaque;
+};
+
+static int virtio_mem_rdm_replay_populated_cb(MemoryRegionSection *s, void *arg)
+{
+    struct VirtIOMEMReplayData *data = arg;
+
+    return ((ReplayRamPopulate)data->fn)(s, data->opaque);
+}
+
+static int virtio_mem_rdm_replay_populated(const RamDiscardManager *rdm,
+                                           MemoryRegionSection *s,
+                                           ReplayRamPopulate replay_fn,
+                                           void *opaque)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+    struct VirtIOMEMReplayData data = {
+        .fn = replay_fn,
+        .opaque = opaque,
+    };
+
+    g_assert(s->mr == &vmem->memdev->mr);
+    return virtio_mem_for_each_plugged_section(vmem, s, &data,
+                                            virtio_mem_rdm_replay_populated_cb);
+}
+
+static void virtio_mem_rdm_register_listener(RamDiscardManager *rdm,
+                                             RamDiscardListener *rdl,
+                                             MemoryRegionSection *s)
+{
+    VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+    int ret;
+
+    g_assert(s->mr == &vmem->memdev->mr);
+    rdl->section = memory_region_section_new_copy(s);
+
+    QLIST_INSERT_HEAD(&vmem->rdl_list, rdl, next);
+    ret = virtio_mem_for_each_plugged_section(vmem, rdl->section, rdl,
+                                              virtio_mem_notify_populate_cb);
+    if (ret) {
+        error_report("%s: Replaying plugged ranges failed: %s", __func__,
+                     strerror(-ret));
+    }
+}
+
+static void virtio_mem_rdm_unregister_listener(RamDiscardManager *rdm,
+                                               RamDiscardListener *rdl)
+{
+    VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+
+    g_assert(rdl->section->mr == &vmem->memdev->mr);
+    if (vmem->size) {
+        if (rdl->double_discard_supported) {
+            rdl->notify_discard(rdl, rdl->section);
+        } else {
+            virtio_mem_for_each_plugged_section(vmem, rdl->section, rdl,
+                                                virtio_mem_notify_discard_cb);
+        }
+    }
+
+    memory_region_section_free_copy(rdl->section);
+    rdl->section = NULL;
+    QLIST_REMOVE(rdl, next);
+}
+
 static void virtio_mem_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
     VirtIOMEMClass *vmc = VIRTIO_MEM_CLASS(klass);
+    RamDiscardManagerClass *rdmc = RAM_DISCARD_MANAGER_CLASS(klass);
 
     device_class_set_props(dc, virtio_mem_properties);
     dc->vmsd = &vmstate_virtio_mem;
@@ -960,6 +1232,12 @@ static void virtio_mem_class_init(ObjectClass *klass, void *data)
     vmc->get_memory_region = virtio_mem_get_memory_region;
     vmc->add_size_change_notifier = virtio_mem_add_size_change_notifier;
     vmc->remove_size_change_notifier = virtio_mem_remove_size_change_notifier;
+
+    rdmc->get_min_granularity = virtio_mem_rdm_get_min_granularity;
+    rdmc->is_populated = virtio_mem_rdm_is_populated;
+    rdmc->replay_populated = virtio_mem_rdm_replay_populated;
+    rdmc->register_listener = virtio_mem_rdm_register_listener;
+    rdmc->unregister_listener = virtio_mem_rdm_unregister_listener;
 }
 
 static const TypeInfo virtio_mem_info = {
@@ -969,6 +1247,10 @@ static const TypeInfo virtio_mem_info = {
     .instance_init = virtio_mem_instance_init,
     .class_init = virtio_mem_class_init,
     .class_size = sizeof(VirtIOMEMClass),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_RAM_DISCARD_MANAGER },
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
2.30.2


