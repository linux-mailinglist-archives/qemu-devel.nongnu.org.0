Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C49454DE1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:30:58 +0100 (CET)
Received: from localhost ([::1]:52178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnQe2-00033C-3j
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:30:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mnQcc-0001je-71
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:29:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mnQca-0006nz-7n
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637177367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TRVEir5wcLj+woABf+J6RdCNy0gsCKQ01Zw+llBfNM=;
 b=Y0Vv8CHXPFa/QMYfX29vxzCQqdYMTQB7zP60yqBRSGLdtwd3qREJZdjRVcgr3OBxC7qBw3
 tZG1bhrt9gLogCLGMAuoP1N6Rv5TqQQiJL6zkkVJNWXZDQvBB4hD89x+AaUVUVaeQFC4dX
 ZMALx0DIV050mcK6+FiHaEoC+5YVA8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-tLT84sNGP8CW10xSa-GXEQ-1; Wed, 17 Nov 2021 14:29:26 -0500
X-MC-Unique: tLT84sNGP8CW10xSa-GXEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EA871572D
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 19:29:25 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7C7E60BF1;
 Wed, 17 Nov 2021 19:29:23 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] virtio-net: Only enable userland vq if using tap backend
Date: Wed, 17 Nov 2021 20:28:50 +0100
Message-Id: <20211117192851.65529-3-eperezma@redhat.com>
In-Reply-To: <20211117192851.65529-1-eperezma@redhat.com>
References: <20211117192851.65529-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
cases. These assumes a tap device can handle the packets.

If a vdpa device fail to start, it can trigger a sigsegv because of
that. Do not resort on them unless actually possible.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio.h |  2 ++
 hw/net/virtio-net.c        |  4 ++++
 hw/virtio/virtio.c         | 21 +++++++++++++--------
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb75..1712ba0b4c 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -105,6 +105,8 @@ struct VirtIODevice
     VMChangeStateEntry *vmstate;
     char *bus_name;
     uint8_t device_endian;
+    /* backend does not support userspace handler */
+    bool disable_ioeventfd_handler;
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 004acf858f..8c5c4e5a9d 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3501,6 +3501,10 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     nc = qemu_get_queue(n->nic);
     nc->rxfilter_notify_enabled = 1;
 
+    if (!nc->peer || nc->peer->info->type != NET_CLIENT_DRIVER_TAP) {
+        /* Only tap can use userspace networking */
+        vdev->disable_ioeventfd_handler = true;
+    }
     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
         struct virtio_net_config netcfg = {};
         memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ea7c079fb0..1e04db6650 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3734,17 +3734,22 @@ static int virtio_device_start_ioeventfd_impl(VirtIODevice *vdev)
             err = r;
             goto assign_error;
         }
-        event_notifier_set_handler(&vq->host_notifier,
-                                   virtio_queue_host_notifier_read);
+
+        if (!vdev->disable_ioeventfd_handler) {
+            event_notifier_set_handler(&vq->host_notifier,
+                                       virtio_queue_host_notifier_read);
+        }
     }
 
-    for (n = 0; n < VIRTIO_QUEUE_MAX; n++) {
-        /* Kick right away to begin processing requests already in vring */
-        VirtQueue *vq = &vdev->vq[n];
-        if (!vq->vring.num) {
-            continue;
+    if (!vdev->disable_ioeventfd_handler) {
+        for (n = 0; n < VIRTIO_QUEUE_MAX; n++) {
+            /* Kick right away to begin processing requests already in vring */
+            VirtQueue *vq = &vdev->vq[n];
+            if (!vq->vring.num) {
+                continue;
+            }
+            event_notifier_set(&vq->host_notifier);
         }
-        event_notifier_set(&vq->host_notifier);
     }
     memory_region_transaction_commit();
     return 0;
-- 
2.27.0


