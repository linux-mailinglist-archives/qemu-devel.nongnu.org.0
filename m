Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023135DC15
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:02:29 +0200 (CEST)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWFsK-0003NX-3n
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFne-0007ef-Ah
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:57:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFnc-0004VT-In
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618307855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApNb0tXtuhjuAMjd5kbyJzjLUnCPeD+SZQYkXRqV6Rs=;
 b=De4UVJa5AbsR5SJv7HB8w7FTfEqXWg94caQRg5o+8CbI+VJMPicV+eCqaiJSQv8JsvyHvG
 hUCa6cK2Ty3qUvs8yTzPF0yTqocRpYs+V9ZbBUKCy9o6npg3gMhnY+J7idkcO+h+vNjMJg
 zFtxI6vh1/yaGxSNWkMTObFdwR28fqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-k-pTt4KDNNer5VNM75j16A-1; Tue, 13 Apr 2021 05:57:34 -0400
X-MC-Unique: k-pTt4KDNNer5VNM75j16A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CECD91271;
 Tue, 13 Apr 2021 09:57:33 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-69.ams2.redhat.com [10.36.115.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1B675C5FD;
 Tue, 13 Apr 2021 09:57:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v7 03/13] virtio-mem: Factor out traversing unplugged
 ranges
Date: Tue, 13 Apr 2021 11:55:21 +0200
Message-Id: <20210413095531.25603-4-david@redhat.com>
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
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's factor out the core logic, no need to replicate.

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
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
 hw/virtio/virtio-mem.c | 86 ++++++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 655824ff81..471e464171 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -145,6 +145,33 @@ static bool virtio_mem_is_busy(void)
     return migration_in_incoming_postcopy() || !migration_is_idle();
 }
 
+typedef int (*virtio_mem_range_cb)(const VirtIOMEM *vmem, void *arg,
+                                   uint64_t offset, uint64_t size);
+
+static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
+                                               virtio_mem_range_cb cb)
+{
+    unsigned long first_zero_bit, last_zero_bit;
+    uint64_t offset, size;
+    int ret = 0;
+
+    first_zero_bit = find_first_zero_bit(vmem->bitmap, vmem->bitmap_size);
+    while (first_zero_bit < vmem->bitmap_size) {
+        offset = first_zero_bit * vmem->block_size;
+        last_zero_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
+                                      first_zero_bit + 1) - 1;
+        size = (last_zero_bit - first_zero_bit + 1) * vmem->block_size;
+
+        ret = cb(vmem, arg, offset, size);
+        if (ret) {
+            break;
+        }
+        first_zero_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
+                                            last_zero_bit + 2);
+    }
+    return ret;
+}
+
 static bool virtio_mem_test_bitmap(VirtIOMEM *vmem, uint64_t start_gpa,
                                    uint64_t size, bool plugged)
 {
@@ -594,33 +621,27 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
     ram_block_discard_require(false);
 }
 
-static int virtio_mem_restore_unplugged(VirtIOMEM *vmem)
+static int virtio_mem_discard_range_cb(const VirtIOMEM *vmem, void *arg,
+                                       uint64_t offset, uint64_t size)
 {
     RAMBlock *rb = vmem->memdev->mr.ram_block;
-    unsigned long first_zero_bit, last_zero_bit;
-    uint64_t offset, length;
     int ret;
 
-    /* Find consecutive unplugged blocks and discard the consecutive range. */
-    first_zero_bit = find_first_zero_bit(vmem->bitmap, vmem->bitmap_size);
-    while (first_zero_bit < vmem->bitmap_size) {
-        offset = first_zero_bit * vmem->block_size;
-        last_zero_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
-                                      first_zero_bit + 1) - 1;
-        length = (last_zero_bit - first_zero_bit + 1) * vmem->block_size;
-
-        ret = ram_block_discard_range(rb, offset, length);
-        if (ret) {
-            error_report("Unexpected error discarding RAM: %s",
-                         strerror(-ret));
-            return -EINVAL;
-        }
-        first_zero_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
-                                            last_zero_bit + 2);
+    ret = ram_block_discard_range(rb, offset, size);
+    if (ret) {
+        error_report("Unexpected error discarding RAM: %s", strerror(-ret));
+        return -EINVAL;
     }
     return 0;
 }
 
+static int virtio_mem_restore_unplugged(VirtIOMEM *vmem)
+{
+    /* Make sure all memory is really discarded after migration. */
+    return virtio_mem_for_each_unplugged_range(vmem, NULL,
+                                               virtio_mem_discard_range_cb);
+}
+
 static int virtio_mem_post_load(void *opaque, int version_id)
 {
     if (migration_in_incoming_postcopy()) {
@@ -872,28 +893,19 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
     vmem->block_size = value;
 }
 
-static void virtio_mem_precopy_exclude_unplugged(VirtIOMEM *vmem)
+static int virtio_mem_precopy_exclude_range_cb(const VirtIOMEM *vmem, void *arg,
+                                               uint64_t offset, uint64_t size)
 {
     void * const host = qemu_ram_get_host_addr(vmem->memdev->mr.ram_block);
-    unsigned long first_zero_bit, last_zero_bit;
-    uint64_t offset, length;
 
-    /*
-     * Find consecutive unplugged blocks and exclude them from migration.
-     *
-     * Note: Blocks cannot get (un)plugged during precopy, no locking needed.
-     */
-    first_zero_bit = find_first_zero_bit(vmem->bitmap, vmem->bitmap_size);
-    while (first_zero_bit < vmem->bitmap_size) {
-        offset = first_zero_bit * vmem->block_size;
-        last_zero_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
-                                      first_zero_bit + 1) - 1;
-        length = (last_zero_bit - first_zero_bit + 1) * vmem->block_size;
+    qemu_guest_free_page_hint(host + offset, size);
+    return 0;
+}
 
-        qemu_guest_free_page_hint(host + offset, length);
-        first_zero_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
-                                            last_zero_bit + 2);
-    }
+static void virtio_mem_precopy_exclude_unplugged(VirtIOMEM *vmem)
+{
+    virtio_mem_for_each_unplugged_range(vmem, NULL,
+                                        virtio_mem_precopy_exclude_range_cb);
 }
 
 static int virtio_mem_precopy_notify(NotifierWithReturn *n, void *data)
-- 
2.30.2


