Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BFA3FEEE1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:44:00 +0200 (CEST)
Received: from localhost ([::1]:33112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLn0Z-000323-Fm
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLmZN-0007q3-Dg
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLmZL-0007Sr-TA
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630588551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQNWaH8RlrrO5hzyddQ6ESB1VHn9VpoGXV3gKxmJawE=;
 b=C8vLk9VBkLhd6WkL4zf2Vmwvinl7J/cBlNQ3OygCtI4FUfwq2ns4BrJ2+iFQFOtQ4zKsh0
 /rTTQgSw8Nta447tPtlXxkAhsXZfO+Jn930MBcpckpZUoT27cxyHh+R9JHpQ0Ch/RhUSk1
 YeZB2CAcqdCketFiOGcO5NJXOAnxc5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-O_Y_Qim4O8udQ05hLAh2WA-1; Thu, 02 Sep 2021 09:15:50 -0400
X-MC-Unique: O_Y_Qim4O8udQ05hLAh2WA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BF3A8145E6;
 Thu,  2 Sep 2021 13:15:49 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C0F46ACE5;
 Thu,  2 Sep 2021 13:15:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/9] virtio-mem: Drop precopy notifier
Date: Thu,  2 Sep 2021 15:14:28 +0200
Message-Id: <20210902131432.23103-6-david@redhat.com>
In-Reply-To: <20210902131432.23103-1-david@redhat.com>
References: <20210902131432.23103-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Migration code now properly handles RAMBlocks which are indirectly managed
by a RamDiscardManager. No need for manual handling via the free page
optimization interface, let's get rid of it.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c         | 34 ----------------------------------
 include/hw/virtio/virtio-mem.h |  3 ---
 2 files changed, 37 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 284096ec5f..d5a578142b 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -776,7 +776,6 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
     host_memory_backend_set_mapped(vmem->memdev, true);
     vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
     qemu_register_reset(virtio_mem_system_reset, vmem);
-    precopy_add_notifier(&vmem->precopy_notifier);
 
     /*
      * Set ourselves as RamDiscardManager before the plug handler maps the
@@ -796,7 +795,6 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
      * found via an address space anymore. Unset ourselves.
      */
     memory_region_set_ram_discard_manager(&vmem->memdev->mr, NULL);
-    precopy_remove_notifier(&vmem->precopy_notifier);
     qemu_unregister_reset(virtio_mem_system_reset, vmem);
     vmstate_unregister_ram(&vmem->memdev->mr, DEVICE(vmem));
     host_memory_backend_set_mapped(vmem->memdev, false);
@@ -1089,43 +1087,11 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
     vmem->block_size = value;
 }
 
-static int virtio_mem_precopy_exclude_range_cb(const VirtIOMEM *vmem, void *arg,
-                                               uint64_t offset, uint64_t size)
-{
-    void * const host = qemu_ram_get_host_addr(vmem->memdev->mr.ram_block);
-
-    qemu_guest_free_page_hint(host + offset, size);
-    return 0;
-}
-
-static void virtio_mem_precopy_exclude_unplugged(VirtIOMEM *vmem)
-{
-    virtio_mem_for_each_unplugged_range(vmem, NULL,
-                                        virtio_mem_precopy_exclude_range_cb);
-}
-
-static int virtio_mem_precopy_notify(NotifierWithReturn *n, void *data)
-{
-    VirtIOMEM *vmem = container_of(n, VirtIOMEM, precopy_notifier);
-    PrecopyNotifyData *pnd = data;
-
-    switch (pnd->reason) {
-    case PRECOPY_NOTIFY_AFTER_BITMAP_SYNC:
-        virtio_mem_precopy_exclude_unplugged(vmem);
-        break;
-    default:
-        break;
-    }
-
-    return 0;
-}
-
 static void virtio_mem_instance_init(Object *obj)
 {
     VirtIOMEM *vmem = VIRTIO_MEM(obj);
 
     notifier_list_init(&vmem->size_change_notifiers);
-    vmem->precopy_notifier.notify = virtio_mem_precopy_notify;
     QLIST_INIT(&vmem->rdl_list);
 
     object_property_add(obj, VIRTIO_MEM_SIZE_PROP, "size", virtio_mem_get_size,
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 9a6e348fa2..a5dd6a493b 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -65,9 +65,6 @@ struct VirtIOMEM {
     /* notifiers to notify when "size" changes */
     NotifierList size_change_notifiers;
 
-    /* don't migrate unplugged memory */
-    NotifierWithReturn precopy_notifier;
-
     /* listeners to notify on plug/unplug activity. */
     QLIST_HEAD(, RamDiscardListener) rdl_list;
 };
-- 
2.31.1


