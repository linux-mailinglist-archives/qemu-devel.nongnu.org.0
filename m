Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5856109D3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:51:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIFB-0007CB-AT; Fri, 28 Oct 2022 01:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEi-0006wk-3a
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEg-0007GN-Gv
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESJ1m7lDb8uPMJw6DO13povZGHg1JFKCvmSQ+03kY6Y=;
 b=gVazilhNBoi42baPRawz6OH+Wl+8jAcJOqTyIe5C86Aq/XImJHVKh+2wOgDQ9XQzfB+vHJ
 r4VDre+VLQ/R6q45qL0ZHtpWNjzAolOqZXH1NXu1BHUdYovww2NpXgH6gWASLjfClj9qlh
 uOn011ZcKR4nicInBksubD1RYI+TT+g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-wUt3KWh2NACzjc8udMt6fg-1; Fri, 28 Oct 2022 01:48:49 -0400
X-MC-Unique: wUt3KWh2NACzjc8udMt6fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 981E285A5A6
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:48:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96DC7C1E1B1;
 Fri, 28 Oct 2022 05:48:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, alex.williamson@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 01/26] virtio-net: fix bottom-half packet TX on asynchronous
 completion
Date: Fri, 28 Oct 2022 13:48:10 +0800
Message-Id: <20221028054835.29674-2-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

From: Laurent Vivier <lvivier@redhat.com>

When virtio-net is used with the socket netdev backend, the backend
can be busy and not able to collect new packets.

In this case, net_socket_receive() returns 0 and registers a poll function
to detect when the socket is ready again.

In virtio_net_tx_bh(), virtio_net_flush_tx() forwards the 0, the virtio
notifications are disabled and the function is not re-scheduled, waiting
for the backend to be ready.

When the socket netdev backend is again able to send packets, the poll
function re-starts to flush remaining packets. This is done by
calling virtio_net_tx_complete(). It re-enables notifications and calls
again virtio_net_flush_tx().

But it seems if virtio_net_flush_tx() reaches the tx_burst value all
the queue is not flushed and no new notification is sent to re-schedule
virtio_net_tx_bh(). Nothing re-start to flush the queue and remaining
packets are stuck in the queue.

To fix that, detect in virtio_net_tx_complete() if virtio_net_flush_tx()
has been stopped by tx_burst and if yes re-schedule the bottom half
function virtio_net_tx_bh() to flush the remaining packets.

This is what is done in virtio_net_tx_bh() when the virtio_net_flush_tx()
is synchronous, and completly by-passed when the operation needs to be
asynchronous.

Fixes: a697a334b3c4 ("virtio-net: Introduce a new bottom half packet TX")
Cc: alex.williamson@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index e9f696b..1fbf2f3 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2526,6 +2526,7 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
     VirtIONet *n = qemu_get_nic_opaque(nc);
     VirtIONetQueue *q = virtio_net_get_subqueue(nc);
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
+    int ret;
 
     virtqueue_push(q->tx_vq, q->async_tx.elem, 0);
     virtio_notify(vdev, q->tx_vq);
@@ -2534,7 +2535,17 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
     q->async_tx.elem = NULL;
 
     virtio_queue_set_notification(q->tx_vq, 1);
-    virtio_net_flush_tx(q);
+    ret = virtio_net_flush_tx(q);
+    if (q->tx_bh && ret >= n->tx_burst) {
+        /*
+         * the flush has been stopped by tx_burst
+         * we will not receive notification for the
+         * remainining part, so re-schedule
+         */
+        virtio_queue_set_notification(q->tx_vq, 0);
+        qemu_bh_schedule(q->tx_bh);
+        q->tx_waiting = 1;
+    }
 }
 
 /* TX */
-- 
2.7.4


