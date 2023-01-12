Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9279F667BDF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:49:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0gn-0004M5-BS; Thu, 12 Jan 2023 11:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0gh-0004IT-RK
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0gg-0000eS-Dj
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673541861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgQjdh3Mi2wV7Ozw1+2OFyhWNhf/GxfVbjinAS4PQ60=;
 b=FieZfecce70JHyJUhhO2QYopdh9C++fp3RRZ06GevfPi3eUHMz4V9tL+Mm6htG9WvapCjW
 dpPz8jnMnWcbcojSSaG1KI8WVuNWS8D2thWqojDqO4XA0/lEpACPIwQM2K/YAywuuybN97
 VbxbaY6c58YXh9KmlSFuq6YFXNLVVvc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-joZFcE3dMgG7aBBvcxQi6g-1; Thu, 12 Jan 2023 11:44:20 -0500
X-MC-Unique: joZFcE3dMgG7aBBvcxQi6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26CB1811E6E
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 16:44:20 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 330174078903;
 Thu, 12 Jan 2023 16:44:17 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [PATCH v3 6/8] virtio-mem: Fail if a memory backend with
 "prealloc=on" is specified
Date: Thu, 12 Jan 2023 17:44:01 +0100
Message-Id: <20230112164403.105085-7-david@redhat.com>
In-Reply-To: <20230112164403.105085-1-david@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

"prealloc=on" for the memory backend does not work as expected, as
virtio-mem will simply discard all preallocated memory immediately again.
In the best case, it's an expensive NOP. In the worst case, it's an
unexpected allocation error.

Instead, "prealloc=on" should be specified for the virtio-mem device only,
such that virtio-mem will try preallocating memory before plugging
memory dynamically to the guest. Fail if such a memory backend is
provided.

Tested-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 1ed1f5a4af..02f7b5469a 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -772,6 +772,12 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "'%s' property specifies an unsupported memdev",
                    VIRTIO_MEM_MEMDEV_PROP);
         return;
+    } else if (vmem->memdev->prealloc) {
+        error_setg(errp, "'%s' property specifies a memdev with preallocation"
+                   " enabled: %s. Instead, specify 'prealloc=on' for the"
+                   " virtio-mem device. ", VIRTIO_MEM_MEMDEV_PROP,
+                   object_get_canonical_path_component(OBJECT(vmem->memdev)));
+        return;
     }
 
     if ((nb_numa_nodes && vmem->node >= nb_numa_nodes) ||
-- 
2.39.0


