Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068FD463195
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:54:06 +0100 (CET)
Received: from localhost ([::1]:59492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0lx-0007le-5c
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:54:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms0aV-0006AX-Rk
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:42:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms0aT-000151-Qq
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638268932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFBwqshgG2JfNEJVA9/cXb1GcBIhMuW43BKcNMNMdoM=;
 b=MuF3YHrJdNQL1GIQMxb//tOooX1T69IXJZpXqC2aK2otAwetilvSrBNJMK4YzFmMOSHMDC
 JeDRT39Y+F7x/OCSgIKgf8/hmR5kyMsVdQ1mpNjDRdy84ejdMoC6FpbV8WULm5Wr1CLjoK
 By5cbasUzY7q+fIVcp0l1X9Z8XI7wRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-ny8_tcAcMHiood2sPC_eAw-1; Tue, 30 Nov 2021 05:42:09 -0500
X-MC-Unique: ny8_tcAcMHiood2sPC_eAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03C68192CC40;
 Tue, 30 Nov 2021 10:42:08 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02DA8101E589;
 Tue, 30 Nov 2021 10:42:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 8/8] virtio-mem: Support "prealloc=on" option
Date: Tue, 30 Nov 2021 11:41:36 +0100
Message-Id: <20211130104136.40927-9-david@redhat.com>
In-Reply-To: <20211130104136.40927-1-david@redhat.com>
References: <20211130104136.40927-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For scarce memory resources, such as hugetlb, we want to be able to
prealloc such memory resources in order to not crash later on access. On
simple user errors we could otherwise easily run out of memory resources
an crash the VM -- pretty much undesired.

For ordinary memory devices, such as DIMMs, we preallocate memory via the
memory backend for such use cases; however, with virtio-mem we're dealing
with sparse memory backends; preallocating the whole memory backend
destroys the whole purpose of virtio-mem.

Instead, we want to preallocate memory when actually exposing memory to the
VM dynamically, and fail plugging memory gracefully + warn the user in case
preallocation fails.

A common use case for hugetlb will be using "reserve=off,prealloc=off" for
the memory backend and "prealloc=on" for the virtio-mem device. This
way, no huge pages will be reserved for the process, but we can recover
if there are no actual huge pages when plugging memory. Libvirt is
already prepared for this.

Note that preallocation cannot protect from the OOM killer -- which
holds true for any kind of preallocation in QEMU. It's primarily useful
only for scarce memory resources such as hugetlb, or shared file-backed
memory. It's of little use for ordinary anonymous memory that can be
swapped, KSM merged, ... but we won't forbid it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c         | 39 ++++++++++++++++++++++++++++++----
 include/hw/virtio/virtio-mem.h |  4 ++++
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index a5d26d414f..33c7884aa0 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -450,10 +450,40 @@ static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
             return -EBUSY;
         }
         virtio_mem_notify_unplug(vmem, offset, size);
-    } else if (virtio_mem_notify_plug(vmem, offset, size)) {
-        /* Could be a mapping attempt resulted in memory getting populated. */
-        ram_block_discard_range(vmem->memdev->mr.ram_block, offset, size);
-        return -EBUSY;
+    } else {
+        int ret = 0;
+
+        if (vmem->prealloc) {
+            void *area = memory_region_get_ram_ptr(&vmem->memdev->mr) + offset;
+            int fd = memory_region_get_fd(&vmem->memdev->mr);
+            Error *local_err = NULL;
+
+            os_mem_prealloc(fd, area, size, 1, &local_err);
+            if (local_err) {
+                static bool warned;
+
+                /*
+                 * Warn only once, we don't want to fill the log with these
+                 * warnings.
+                 */
+                if (!warned) {
+                    warn_report_err(local_err);
+                    warned = true;
+                } else {
+                    error_free(local_err);
+                }
+                ret = -EBUSY;
+            }
+        }
+        if (!ret) {
+            ret = virtio_mem_notify_plug(vmem, offset, size);
+        }
+
+        if (ret) {
+            /* Could be preallocation or a notifier populated memory. */
+            ram_block_discard_range(vmem->memdev->mr.ram_block, offset, size);
+            return -EBUSY;
+        }
     }
     virtio_mem_set_bitmap(vmem, start_gpa, size, plug);
     return 0;
@@ -1165,6 +1195,7 @@ static void virtio_mem_instance_init(Object *obj)
 static Property virtio_mem_properties[] = {
     DEFINE_PROP_UINT64(VIRTIO_MEM_ADDR_PROP, VirtIOMEM, addr, 0),
     DEFINE_PROP_UINT32(VIRTIO_MEM_NODE_PROP, VirtIOMEM, node, 0),
+    DEFINE_PROP_BOOL(VIRTIO_MEM_PREALLOC_PROP, VirtIOMEM, prealloc, false),
     DEFINE_PROP_LINK(VIRTIO_MEM_MEMDEV_PROP, VirtIOMEM, memdev,
                      TYPE_MEMORY_BACKEND, HostMemoryBackend *),
 #if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 38c67a89f2..7745cfc1a3 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(VirtIOMEM, VirtIOMEMClass,
 #define VIRTIO_MEM_BLOCK_SIZE_PROP "block-size"
 #define VIRTIO_MEM_ADDR_PROP "memaddr"
 #define VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP "unplugged-inaccessible"
+#define VIRTIO_MEM_PREALLOC_PROP "prealloc"
 
 struct VirtIOMEM {
     VirtIODevice parent_obj;
@@ -70,6 +71,9 @@ struct VirtIOMEM {
      */
     OnOffAuto unplugged_inaccessible;
 
+    /* whether to prealloc memory when plugging new blocks */
+    bool prealloc;
+
     /* notifiers to notify when "size" changes */
     NotifierList size_change_notifiers;
 
-- 
2.31.1


