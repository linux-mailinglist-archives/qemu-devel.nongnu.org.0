Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B031DB38E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 14:35:21 +0200 (CEST)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbNwO-0001gA-GV
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 08:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jbNuK-0006WP-PW
 for qemu-devel@nongnu.org; Wed, 20 May 2020 08:33:12 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22629
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jbNuJ-0007ZX-2P
 for qemu-devel@nongnu.org; Wed, 20 May 2020 08:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589977990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdpjenewQz/H4V5/mqin3G1PK9j+2PZi+WLSTA5b8QE=;
 b=VWdWly7S2z6gKLaWm8WBjiLrixD7QKhlqIEVUy/P14h57uXHbE9RjSMEsCwxG3EuKAeRsB
 Hxqij/Mei2eOXXU7lzuKmeC1D6UcmN9gSq174w1VCzFjISDfUfJOHVxcB9xt1egvFg67+P
 zFk9W2vbnpIrjfBtBln9TFkyC7WZ+Lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-5gXcNDydMGi75JluHA8qeg-1; Wed, 20 May 2020 08:33:08 -0400
X-MC-Unique: 5gXcNDydMGi75JluHA8qeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82B0D18FE860;
 Wed, 20 May 2020 12:33:07 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 747F46E9EA;
 Wed, 20 May 2020 12:33:05 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/19] virtio-mem: Allow notifiers for size changes
Date: Wed, 20 May 2020 14:31:49 +0200
Message-Id: <20200520123152.60527-17-david@redhat.com>
In-Reply-To: <20200520123152.60527-1-david@redhat.com>
References: <20200520123152.60527-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=207.211.31.81; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 04:09:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to send qapi events in case the size of a virtio-mem device
changes. This allows upper layers to always know how much memory is
actually currently consumed via a virtio-mem device.

Unfortuantely, we have to report the id of our proxy device. Let's provide
an easy way for our proxy device to register, so it can send the qapi
events. Piggy-backing on the notifier infrastructure (although we'll
only ever have one notifier registered) seems to be an easy way.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c         | 21 ++++++++++++++++++++-
 include/hw/virtio/virtio-mem.h |  5 +++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index a7b5a02dac..11c500960c 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -177,6 +177,7 @@ static int virtio_mem_state_change_request(VirtIOMEM *vmem, uint64_t gpa,
     } else {
         vmem->size -= size;
     }
+    notifier_list_notify(&vmem->size_change_notifiers, &vmem->size);
     return VIRTIO_MEM_RESP_ACK;
 }
 
@@ -232,7 +233,10 @@ static int virtio_mem_unplug_all(VirtIOMEM *vmem)
         return -EBUSY;
     }
     bitmap_clear(vmem->bitmap, 0, vmem->bitmap_size);
-    vmem->size = 0;
+    if (vmem->size) {
+        vmem->size = 0;
+        notifier_list_notify(&vmem->size_change_notifiers, &vmem->size);
+    }
 
     virtio_mem_resize_usable_region(vmem, vmem->requested_size, true);
     return 0;
@@ -553,6 +557,18 @@ static MemoryRegion *virtio_mem_get_memory_region(VirtIOMEM *vmem, Error **errp)
     return &vmem->memdev->mr;
 }
 
+static void virtio_mem_add_size_change_notifier(VirtIOMEM *vmem,
+                                                Notifier *notifier)
+{
+    notifier_list_add(&vmem->size_change_notifiers, notifier);
+}
+
+static void virtio_mem_remove_size_change_notifier(VirtIOMEM *vmem,
+                                                   Notifier *notifier)
+{
+    notifier_remove(notifier);
+}
+
 static void virtio_mem_get_size(Object *obj, Visitor *v, const char *name,
                                 void *opaque, Error **errp)
 {
@@ -664,6 +680,7 @@ static void virtio_mem_instance_init(Object *obj)
     VirtIOMEM *vmem = VIRTIO_MEM(obj);
 
     vmem->block_size = VIRTIO_MEM_MIN_BLOCK_SIZE;
+    notifier_list_init(&vmem->size_change_notifiers);
 
     object_property_add(obj, VIRTIO_MEM_SIZE_PROP, "size", virtio_mem_get_size,
                         NULL, NULL, NULL);
@@ -701,6 +718,8 @@ static void virtio_mem_class_init(ObjectClass *klass, void *data)
 
     vmc->fill_device_info = virtio_mem_fill_device_info;
     vmc->get_memory_region = virtio_mem_get_memory_region;
+    vmc->add_size_change_notifier = virtio_mem_add_size_change_notifier;
+    vmc->remove_size_change_notifier = virtio_mem_remove_size_change_notifier;
 }
 
 static const TypeInfo virtio_mem_info = {
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 26b90e8f3e..408a6ede50 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -64,6 +64,9 @@ typedef struct VirtIOMEM {
 
     /* block size and alignment */
     uint32_t block_size;
+
+    /* notifiers to notify when "size" changes */
+    NotifierList size_change_notifiers;
 } VirtIOMEM;
 
 typedef struct VirtIOMEMClass {
@@ -73,6 +76,8 @@ typedef struct VirtIOMEMClass {
     /* public */
     void (*fill_device_info)(const VirtIOMEM *vmen, VirtioMEMDeviceInfo *vi);
     MemoryRegion *(*get_memory_region)(VirtIOMEM *vmem, Error **errp);
+    void (*add_size_change_notifier)(VirtIOMEM *vmem, Notifier *notifier);
+    void (*remove_size_change_notifier)(VirtIOMEM *vmem, Notifier *notifier);
 } VirtIOMEMClass;
 
 #endif
-- 
2.25.4


