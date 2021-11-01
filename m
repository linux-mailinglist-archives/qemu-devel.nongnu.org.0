Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E4044234B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:21:06 +0100 (CET)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfft-0004S1-V2
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUr-0007DQ-10
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUm-0000dt-7T
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIlkv3kUVM5FLjDY6YlHGmvpDrEJaIZ60b+7KENr5m4=;
 b=AI7g+aK5oG1K9x5wMvy6YzafdFzn2EC+YuW65LKn4s1BAB/thT31Dy+x+7T5dstdCM+LO3
 0Bm+1STmd8ppX9q41iiXSZKEDUpNBBUvZGHyufKixIdlXt9klDW7srlOXLBs5edkFLAMTF
 0Yckj1i5tJtwDmR4HGDi941NsnZIUyM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-EyMkTitkPCaaM2p7Z89qDQ-1; Mon, 01 Nov 2021 18:09:34 -0400
X-MC-Unique: EyMkTitkPCaaM2p7Z89qDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 67-20020a1c0046000000b0032cd88916e5so4695887wma.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FIlkv3kUVM5FLjDY6YlHGmvpDrEJaIZ60b+7KENr5m4=;
 b=4nMCJupdX03nq10x+5YP2dURiye+JHCrGL6p/WdV71g6Fkpbb9GU5lEGKIzifZBXZt
 tr/cq2BeMAhS0Y7MsYHoBInaRq9EMfa7jyxGY+NAJ6y3qYKNbsdAq/nw4W5li9BsK5mz
 8FHosB8eA4G/46/WuTmoAivHamzh0wWRG+lvz64tjwVAAwnJxW4gbTm1IqOTNvs7R6qn
 9ElKo3kw6gPaPD2ZSz9wixR45fynOs6HJfNBfrJDVel/yeS1ZdFRUCABaoKvFdCVy5wK
 FVfbHTelB5nAa+roglob9+OaLKDBS4hjIy7FYuo2yN6z4c/GwVVROLFz+y1K+JDFgF38
 6QMw==
X-Gm-Message-State: AOAM532S3qLy/nJ90EgbGNv+U5s8MLIMvyDPUcupD+ZZ4c0H6wc+VioK
 NC6fDyJEqmrfW5qcWO+yzVdlzR7SbDsv29NM4jQ+Gk9k5u5c12e3uLbNWhfVzhtUHtTY6sZnXQ8
 Ma3I3y+T7EYrRqQD2kw5DfxR3Z2Pc6OM30b3DqgUFDPfcvuEK2E6a0cNgtjdODFckP9U=
X-Received: by 2002:a5d:64af:: with SMTP id m15mr12543629wrp.267.1635804573257; 
 Mon, 01 Nov 2021 15:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrZQZMxAe13255F4Umt/lsvtqR2XTX2d+P8MJlbDMrZGA3GCpF4nzZPJktxVFBm5Hby8r3Kg==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr12543584wrp.267.1635804573009; 
 Mon, 01 Nov 2021 15:09:33 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id m35sm1212614wms.2.2021.11.01.15.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] virtio-mem: Drop precopy notifier
Date: Mon,  1 Nov 2021 23:09:06 +0100
Message-Id: <20211101220912.10039-15-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Migration code now properly handles RAMBlocks which are indirectly managed
by a RamDiscardManager. No need for manual handling via the free page
optimization interface, let's get rid of it.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/virtio/virtio-mem.h |  3 ---
 hw/virtio/virtio-mem.c         | 34 ----------------------------------
 2 files changed, 37 deletions(-)

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
-- 
2.33.1


