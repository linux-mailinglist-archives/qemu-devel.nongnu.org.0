Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CCE3AA167
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:34:33 +0200 (CEST)
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYUq-0007ho-1P
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ltYRD-0002ik-C7
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ltYRB-0007XR-GF
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623861044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ykQuSsCqtzByJeKywlfuGKSwJTcMtmKOm8JjUVsQww=;
 b=IiVTSqxmCGrjmn9ZMM9kuL513v7NXixSdJMn0fE5tiyAfc1RayoumFBLpwxUhHYlhbnbD/
 KMIV+rys+6tC1GvhjgKDLlJWs2zl019Qr5SyA2jfcnmdtAiHlEEeQgc8AP4STz1wpEtXi7
 3ldK/7+EKlSkPhbpG3aWQH4JJK8/gGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-ZynhAplFM2arTGRDvO2RNw-1; Wed, 16 Jun 2021 12:30:43 -0400
X-MC-Unique: ZynhAplFM2arTGRDvO2RNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83F2D79EF2;
 Wed, 16 Jun 2021 16:30:42 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-100.ams2.redhat.com [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D94A414103;
 Wed, 16 Jun 2021 16:30:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/6] virtio-mem: Drop precopy notifier
Date: Wed, 16 Jun 2021 18:29:38 +0200
Message-Id: <20210616162940.28630-5-david@redhat.com>
In-Reply-To: <20210616162940.28630-1-david@redhat.com>
References: <20210616162940.28630-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Migration code now properly handles RAMBlocks which are indirectly managed
by a RamDiscardManager. No need for manual handling via the free page
optimization interface, let's get rid of it.

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


