Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C561688E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:23:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKI-0000JU-RY; Wed, 02 Nov 2022 12:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKG-0000Df-Ex
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKD-000375-MX
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R69TW5AAW3qysOvzyDIF1yD1Oe9R6ooUnUwNn/cIU3g=;
 b=NiANBbV2FltNJS6QEt5I1F6IpoS7OTUV54e5yiaugv4knKDp1XtZrRXvQoxaeITnvMwEj7
 XNADFB47YZd5p3B/K5QlDqqlQJj5cVYIC0ksDdj9BU7xfK5iZOrD1YlGEwWj3TWTxeYplE
 23BZEGihU+8cqACImiJ2MsyapGv3Bsc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-lBcVP5aHNzqotVmQ7CE3ww-1; Wed, 02 Nov 2022 12:10:42 -0400
X-MC-Unique: lBcVP5aHNzqotVmQ7CE3ww-1
Received: by mail-wm1-f69.google.com with SMTP id
 c5-20020a1c3505000000b003c56da8e894so1275776wma.0
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R69TW5AAW3qysOvzyDIF1yD1Oe9R6ooUnUwNn/cIU3g=;
 b=kb461jmLQyirManJZmg3sNITIV4zfw4guc4T5e9N9VKt4N0imW/t/jAlHqLRkHtDOu
 L7qq7n+qAtZZcY8yYwhvNza3THnG6VOFGYqn9qEV+MyPOMNIZDkGnbQUZ+Y3QYEH/l6X
 gza1VsgU7419H0cEqHW5LZOB6uZe9+oUF9dh8k8Es/cj4E+JnvWKUYkF0v1Y69mCAr2e
 1av2NuBQdnI6qSN+9ex8ZjgvlpBdzGKiiADYOdM1jcbUsmAr3kQ7hLcm1xTTY1tGlbov
 Du/6AWsIdk3J8Nf6TC5TOMSLRS+PUNcth7I+ifWWCY4ubd3rqec4O/8lGKt3RCLLPILM
 SNKA==
X-Gm-Message-State: ACrzQf35JcPAbp4aG0/exXVXiyvUPGwRODUR0HS+Z5PvecvVkzTBOrgp
 h5vJO43ZwcwSvDgkEBhIXa7QwUjfYFJfQ2PXRoQfdm7cuPpGfAtrL8cwD54JA8TS+oumhx80LXw
 OrSpZu3slQawBHq3evbPXEirwMi4vFlpwcP1vpFZpC4Nz4SfbxNxdetzW3a4N
X-Received: by 2002:a5d:6901:0:b0:22f:b097:7de6 with SMTP id
 t1-20020a5d6901000000b0022fb0977de6mr16269850wru.373.1667405435499; 
 Wed, 02 Nov 2022 09:10:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7LaZw4W2tiaAiCtV0S9FdJuGvjbtE2QkYn6r4n2qWv1Iu0xt8FpX9x3c5FbkT6gdTMnDWVBQ==
X-Received: by 2002:a5d:6901:0:b0:22f:b097:7de6 with SMTP id
 t1-20020a5d6901000000b0022fb0977de6mr16269821wru.373.1667405435241; 
 Wed, 02 Nov 2022 09:10:35 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 n188-20020a1c27c5000000b003b49ab8ff53sm2587393wmn.8.2022.11.02.09.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:34 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 47/82] virtio-net: support queue_enable
Message-ID: <20221102160336.616599-48-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Support queue_enable in vhost-kernel scenario. It can be called when
a vq reset operation has been performed and the vq is restared.

It should be noted that we can restart the vq when the vhost has
already started. When launching a new vhost device, the vhost is not
started and all vqs are not initalized until VIRTIO_PCI_COMMON_STATUS
is written. Thus, we should use vhost_started to differentiate the
two cases: vq reset and device start.

Currently it only supports vhost-kernel.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-14-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 34fb4b1423..e68daf51bb 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -563,6 +563,26 @@ static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
     flush_or_purge_queued_packets(nc);
 }
 
+static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+    int r;
+
+    if (!nc->peer || !vdev->vhost_started) {
+        return;
+    }
+
+    if (get_vhost_net(nc->peer) &&
+        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
+        r = vhost_net_virtqueue_restart(vdev, nc, queue_index);
+        if (r < 0) {
+            error_report("unable to restart vhost net virtqueue: %d, "
+                            "when resetting the queue", queue_index);
+        }
+    }
+}
+
 static void virtio_net_reset(VirtIODevice *vdev)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -3845,6 +3865,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->bad_features = virtio_net_bad_features;
     vdc->reset = virtio_net_reset;
     vdc->queue_reset = virtio_net_queue_reset;
+    vdc->queue_enable = virtio_net_queue_enable;
     vdc->set_status = virtio_net_set_status;
     vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;
-- 
MST


