Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AA7653EB1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 12:07:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8JLS-0007tB-DU; Thu, 22 Dec 2022 06:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p8JLN-0007pz-U5
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:02:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p8JLM-0000eL-3t
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:02:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671706951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lmQ5wsyvSzjKBf/IDUrMm4eBwOJhPf42l97obI7maA=;
 b=IcwJOaeLAV/P0AcXSWBHwtg/6SxLEOr2EoVACr70uY3u8wTJ0go0IUlYER4Er2za/1D5cv
 lcOTxMtxd4Jpjwc/FQT9Esqrf3VAL8E/I61at3/Bh3SfWbluFQOuL8oOh2cwBacMmQs8uh
 vvxvAVx7frE/Pv7ugd9KxzJrNIgpjKw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-maRIFQQ2P4CEc_ELO2r2RQ-1; Thu, 22 Dec 2022 06:02:30 -0500
X-MC-Unique: maRIFQQ2P4CEc_ELO2r2RQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2E332806051
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 11:02:29 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58F7F14152F4;
 Thu, 22 Dec 2022 11:02:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, Jing Qi <jinqi@redhat.com>
Subject: [PATCH v3 6/6] virtio-mem: Proper support for preallocation with
 migration
Date: Thu, 22 Dec 2022 12:02:15 +0100
Message-Id: <20221222110215.130392-7-david@redhat.com>
In-Reply-To: <20221222110215.130392-1-david@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Ordinary memory preallocation runs when QEMU starts up and creates the
memory backends, before processing the incoming migration stream. With
virtio-mem, we don't know which memory blocks to preallocate before
migration started. Now that we migrate the virtio-mem bitmap early, before
migrating any RAM content, we can safely preallocate memory for all plugged
memory blocks before migrating any RAM content.

This is especially relevant for the following cases:

(1) User errors

With hugetlb/files, if we don't have sufficient backend memory available on
the migration destination, we'll crash QEMU (SIGBUS) during RAM migration
when running out of backend memory. Preallocating memory before actual
RAM migration allows for failing gracefully and informing the user about
the setup problem.

(2) Excluded memory ranges during migration

For example, virtio-balloon free page hinting will exclude some pages
from getting migrated. In that case, we won't crash during RAM
migration, but later, when running the VM on the destination, which is
bad.

To fix this for new QEMU machines that migrate the bitmap early,
preallocate the memory early, before any RAM migration. Warn with old
QEMU machines.

Getting postcopy right is a bit tricky, but we essentially now implement
the same (problematic) preallocation logic as ordinary preallocation:
preallocate memory early and discard it again before precopy starts. During
ordinary preallocation, discarding of RAM happens when postcopy is advised.
As the our state (bitmap) is loaded after postcopy was advised but before
postcopy starts listening, we have to discard memory we preallocated
immediately again ourselves.

Note that nothing (not even hugetlb reservations) guarantees for postcopy
that backend memory (especially, hugetlb pages) are still free after they
were freed ones while discarding RAM. Still, allocating that memory at
least once helps catching some basic setup problems.

Before this change, trying to restore a VM when insufficient hugetlb
pages are around results in the process crashing to to a "Bus error"
(SIGBUS). With this change, QEMU fails gracefully:

  qemu-system-x86_64: qemu_prealloc_mem: preallocating memory failed: Bad address
  qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-mem-device-early'
  qemu-system-x86_64: load of migration failed: Cannot allocate memory

Reported-by: Jing Qi <jinqi@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 97 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 043b96f509..c1cf448046 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -204,6 +204,30 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
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
@@ -938,6 +962,10 @@ static int virtio_mem_post_load(void *opaque, int version_id)
     RamDiscardListener *rdl;
     int ret;
 
+    if (vmem->prealloc && !vmem->early_migration) {
+        warn_report("Proper preallocation with migration requires a newer QEMU machine");
+    }
+
     /*
      * We started out with all memory discarded and our memory region is mapped
      * into an address space. Replay, now that we updated the bitmap.
@@ -957,6 +985,74 @@ static int virtio_mem_post_load(void *opaque, int version_id)
     return virtio_mem_restore_unplugged(vmem);
 }
 
+static int virtio_mem_prealloc_range_cb(const VirtIOMEM *vmem, void *arg,
+                                        uint64_t offset, uint64_t size)
+{
+    void *area = memory_region_get_ram_ptr(&vmem->memdev->mr) + offset;
+    int fd = memory_region_get_fd(&vmem->memdev->mr);
+    Error *local_err = NULL;
+
+    qemu_prealloc_mem(fd, area, size, 1, NULL, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        return -ENOMEM;
+    }
+    return 0;
+}
+
+static int virtio_mem_post_load_early(void *opaque, int version_id)
+{
+    VirtIOMEM *vmem = VIRTIO_MEM(opaque);
+    RAMBlock *rb = vmem->memdev->mr.ram_block;
+    int ret;
+
+    if (!vmem->prealloc) {
+        return 0;
+    }
+
+    if (migration_incoming_postcopy_listening()) {
+        /*
+         * This is unexpected, we're not supposed to be loaded after
+         * postcopy is listening because ram_block_enable_notify() already
+         * armed userfaultfd. Let's play safe and catch it.
+         */
+        warn_report("Postcopy is already listening, preallocation is impossible.");
+        return -EBUSY;
+    }
+
+    /*
+     * We restored the bitmap and verified that the basic properties
+     * match on source and destination, so we can go ahead and preallocate
+     * memory for all plugged memory blocks, before actual RAM migration starts
+     * touching this memory.
+     */
+    ret = virtio_mem_for_each_plugged_range(vmem, NULL,
+                                            virtio_mem_prealloc_range_cb);
+    if (ret) {
+        return ret;
+    }
+
+    /*
+     * This is tricky: postcopy wants to start with a clean slate. On
+     * POSTCOPY_INCOMING_ADVISE, postcopy code discards all (ordinarily
+     * preallocated) RAM such that postcopy will work as expected later.
+     *
+     * However, we run after POSTCOPY_INCOMING_ADVISE -- but before actual
+     * RAM migration. So let's discard all memory again. This looks like an
+     * expensive NOP, but actually serves a purpose: we made sure that we
+     * were able to allocate all required backend memory once. We cannot
+     * guarantee that the backend memory we will free will remain free
+     * until we need it during postcopy, but at least we can catch the
+     * obvious setup issues this way.
+     */
+    if (migration_incoming_postcopy_advised()) {
+        if (ram_block_discard_range(rb, 0, qemu_ram_get_used_length(rb))) {
+            return -EBUSY;
+        }
+    }
+    return 0;
+}
+
 typedef struct VirtIOMEMMigSanityChecks {
     VirtIOMEM *parent;
     uint64_t addr;
@@ -1068,6 +1164,7 @@ static const VMStateDescription vmstate_virtio_mem_device_early = {
     .minimum_version_id = 1,
     .version_id = 1,
     .priority = MIG_PRI_POST_SETUP,
+    .post_load = virtio_mem_post_load_early,
     .fields = (VMStateField[]) {
         VMSTATE_WITH_TMP(VirtIOMEM, VirtIOMEMMigSanityChecks,
                          vmstate_virtio_mem_sanity_checks),
-- 
2.38.1


