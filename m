Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC875667C01
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:53:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0gn-0004Mg-To; Thu, 12 Jan 2023 11:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0gk-0004LT-SB
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0gj-0000fQ-6w
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673541864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuVG8JV+7c5if5wuQgRLkz9lzWotElbt8ZFW7yztIew=;
 b=QobkU69G+bpLjQcFYH9pYSWF2N7nfrrlWvq9FNQ2D0tebDjeerZ3dHoVWqp2oS8XdHBFgB
 /vyVcMh5+yaVVC5jqLOom9wv10ogfPDKW6SLM8QdDWloh+jLfOEwHcd7RA59Giq+KqYy+H
 JZ9xfug9FfezfNzDtBFxdrdh07sKgIc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-H1A3AcO9PbWJy9mgWJhWbw-1; Thu, 12 Jan 2023 11:44:22 -0500
X-MC-Unique: H1A3AcO9PbWJy9mgWJhWbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 643BA882822
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 16:44:22 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85EAA4078903;
 Thu, 12 Jan 2023 16:44:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [PATCH v3 7/8] virtio-mem: Migrate immutable properties early
Date: Thu, 12 Jan 2023 17:44:02 +0100
Message-Id: <20230112164403.105085-8-david@redhat.com>
In-Reply-To: <20230112164403.105085-1-david@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

The bitmap and the size are immutable while migration is active: see
virtio_mem_is_busy(). We can migrate this information early, before
migrating any actual RAM content. Further, all information we need for
sanity checks is immutable as well.

Having this information in place early will, for example, allow for
properly preallocating memory before touching these memory locations
during RAM migration: this way, we can make sure that all memory was
actually preallocated and that any user errors (e.g., insufficient
hugetlb pages) can be handled gracefully.

In contrast, usable_region_size and requested_size can theoretically
still be modified on the source while the VM is running. Keep migrating
these properties the usual, late, way.

Use a new device property to keep behavior of compat machines
unmodified.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/machine.c              |  4 ++-
 hw/virtio/virtio-mem.c         | 51 ++++++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-mem.h |  8 ++++++
 3 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 616f3a207c..29b57f6448 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -41,7 +41,9 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"
 
-GlobalProperty hw_compat_7_2[] = {};
+GlobalProperty hw_compat_7_2[] = {
+    { "virtio-mem", "x-early-migration", "false" },
+};
 const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
 
 GlobalProperty hw_compat_7_1[] = {
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 02f7b5469a..51666baa01 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -31,6 +31,8 @@
 #include CONFIG_DEVICES
 #include "trace.h"
 
+static const VMStateDescription vmstate_virtio_mem_device_early;
+
 /*
  * We only had legacy x86 guests that did not support
  * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE. Other targets don't have legacy guests.
@@ -878,6 +880,10 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
 
     host_memory_backend_set_mapped(vmem->memdev, true);
     vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
+    if (vmem->early_migration) {
+        vmstate_register(VMSTATE_IF(vmem), VMSTATE_INSTANCE_ID_ANY,
+                         &vmstate_virtio_mem_device_early, vmem);
+    }
     qemu_register_reset(virtio_mem_system_reset, vmem);
 
     /*
@@ -899,6 +905,10 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
      */
     memory_region_set_ram_discard_manager(&vmem->memdev->mr, NULL);
     qemu_unregister_reset(virtio_mem_system_reset, vmem);
+    if (vmem->early_migration) {
+        vmstate_unregister(VMSTATE_IF(vmem), &vmstate_virtio_mem_device_early,
+                           vmem);
+    }
     vmstate_unregister_ram(&vmem->memdev->mr, DEVICE(vmem));
     host_memory_backend_set_mapped(vmem->memdev, false);
     virtio_del_queue(vdev, 0);
@@ -1015,18 +1025,53 @@ static const VMStateDescription vmstate_virtio_mem_sanity_checks = {
     },
 };
 
+static bool virtio_mem_vmstate_field_exists(void *opaque, int version_id)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(opaque);
+
+    /* With early migration, these fields were already migrated. */
+    return !vmem->early_migration;
+}
+
 static const VMStateDescription vmstate_virtio_mem_device = {
     .name = "virtio-mem-device",
     .minimum_version_id = 1,
     .version_id = 1,
     .priority = MIG_PRI_VIRTIO_MEM,
     .post_load = virtio_mem_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_WITH_TMP_TEST(VirtIOMEM, virtio_mem_vmstate_field_exists,
+                              VirtIOMEMMigSanityChecks,
+                              vmstate_virtio_mem_sanity_checks),
+        VMSTATE_UINT64(usable_region_size, VirtIOMEM),
+        VMSTATE_UINT64_TEST(size, VirtIOMEM, virtio_mem_vmstate_field_exists),
+        VMSTATE_UINT64(requested_size, VirtIOMEM),
+        VMSTATE_BITMAP_TEST(bitmap, VirtIOMEM, virtio_mem_vmstate_field_exists,
+                            0, bitmap_size),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+/*
+ * Transfer properties that are immutable while migration is active early,
+ * such that we have have this information around before migrating any RAM
+ * content.
+ *
+ * Note that virtio_mem_is_busy() makes sure these properties can no longer
+ * change on the migration source until migration completed.
+ *
+ * With QEMU compat machines, we transmit these properties later, via
+ * vmstate_virtio_mem_device instead -- see virtio_mem_vmstate_field_exists().
+ */
+static const VMStateDescription vmstate_virtio_mem_device_early = {
+    .name = "virtio-mem-device-early",
+    .minimum_version_id = 1,
+    .version_id = 1,
+    .immutable = 1,
     .fields = (VMStateField[]) {
         VMSTATE_WITH_TMP(VirtIOMEM, VirtIOMEMMigSanityChecks,
                          vmstate_virtio_mem_sanity_checks),
-        VMSTATE_UINT64(usable_region_size, VirtIOMEM),
         VMSTATE_UINT64(size, VirtIOMEM),
-        VMSTATE_UINT64(requested_size, VirtIOMEM),
         VMSTATE_BITMAP(bitmap, VirtIOMEM, 0, bitmap_size),
         VMSTATE_END_OF_LIST()
     },
@@ -1211,6 +1256,8 @@ static Property virtio_mem_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
                             unplugged_inaccessible, ON_OFF_AUTO_AUTO),
 #endif
+    DEFINE_PROP_BOOL(VIRTIO_MEM_EARLY_MIGRATION_PROP, VirtIOMEM,
+                     early_migration, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 7745cfc1a3..f15e561785 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(VirtIOMEM, VirtIOMEMClass,
 #define VIRTIO_MEM_BLOCK_SIZE_PROP "block-size"
 #define VIRTIO_MEM_ADDR_PROP "memaddr"
 #define VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP "unplugged-inaccessible"
+#define VIRTIO_MEM_EARLY_MIGRATION_PROP "x-early-migration"
 #define VIRTIO_MEM_PREALLOC_PROP "prealloc"
 
 struct VirtIOMEM {
@@ -74,6 +75,13 @@ struct VirtIOMEM {
     /* whether to prealloc memory when plugging new blocks */
     bool prealloc;
 
+    /*
+     * Whether we migrate properties that are immutable while migration is
+     * active early, before state of other devices and especially, before
+     * migrating any RAM content.
+     */
+    bool early_migration;
+
     /* notifiers to notify when "size" changes */
     NotifierList size_change_notifiers;
 
-- 
2.39.0


