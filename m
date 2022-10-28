Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179256109E8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:54:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIEx-0006xU-Bo; Fri, 28 Oct 2022 01:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEf-0006wW-C0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEd-0007Ey-K6
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2s+5PdM/irWBkedRs5+WqSIkfMfVYRJ06UoB70jpIJs=;
 b=FT64Xp+5n+36VSA6eJUGsTQTifsr1t8bAImynR6HU8soojviIocA1KRJOZz1VGtwsdWHFe
 5keTS6Iz639S3+IEqVAJsrhEDIcm99C/yJGn7AIRuQXtYPQJB4hguQwBWeHShrZBMsW0Ws
 tOWQOmkplCJR4qeUts5KJjKFaFpBtOk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-usdGbIDJMie9hwqYPdqTcA-1; Fri, 28 Oct 2022 01:48:48 -0400
X-MC-Unique: usdGbIDJMie9hwqYPdqTcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA194101A54E
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:48:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0928FC2C7E3;
 Fri, 28 Oct 2022 05:48:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, alex.williamson@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 02/26] virtio-net: fix TX timer with tx_burst
Date: Fri, 28 Oct 2022 13:48:11 +0800
Message-Id: <20221028054835.29674-3-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

When virtio_net_flush_tx() reaches the tx_burst value all
the queue is not flushed and nothing restart the timer.

Fix that by doing for TX timer as we do for bottom half TX:
rearming the timer if we find any packet to send during the
virtio_net_flush_tx() call.

Fixes: e3f30488e5f8 ("virtio-net: Limit number of packets sent per TX flush")
Cc: alex.williamson@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1fbf2f3..b6903ae 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2536,14 +2536,19 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
 
     virtio_queue_set_notification(q->tx_vq, 1);
     ret = virtio_net_flush_tx(q);
-    if (q->tx_bh && ret >= n->tx_burst) {
+    if (ret >= n->tx_burst) {
         /*
          * the flush has been stopped by tx_burst
          * we will not receive notification for the
          * remainining part, so re-schedule
          */
         virtio_queue_set_notification(q->tx_vq, 0);
-        qemu_bh_schedule(q->tx_bh);
+        if (q->tx_bh) {
+            qemu_bh_schedule(q->tx_bh);
+        } else {
+            timer_mod(q->tx_timer,
+                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
+        }
         q->tx_waiting = 1;
     }
 }
@@ -2644,6 +2649,8 @@ drop:
     return num_packets;
 }
 
+static void virtio_net_tx_timer(void *opaque);
+
 static void virtio_net_handle_tx_timer(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -2661,15 +2668,13 @@ static void virtio_net_handle_tx_timer(VirtIODevice *vdev, VirtQueue *vq)
     }
 
     if (q->tx_waiting) {
-        virtio_queue_set_notification(vq, 1);
+        /* We already have queued packets, immediately flush */
         timer_del(q->tx_timer);
-        q->tx_waiting = 0;
-        if (virtio_net_flush_tx(q) == -EINVAL) {
-            return;
-        }
+        virtio_net_tx_timer(q);
     } else {
+        /* re-arm timer to flush it (and more) on next tick */
         timer_mod(q->tx_timer,
-                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
+                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
         q->tx_waiting = 1;
         virtio_queue_set_notification(vq, 0);
     }
@@ -2702,6 +2707,8 @@ static void virtio_net_tx_timer(void *opaque)
     VirtIONetQueue *q = opaque;
     VirtIONet *n = q->n;
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
+    int ret;
+
     /* This happens when device was stopped but BH wasn't. */
     if (!vdev->vm_running) {
         /* Make sure tx waiting is set, so we'll run when restarted. */
@@ -2716,8 +2723,33 @@ static void virtio_net_tx_timer(void *opaque)
         return;
     }
 
+    ret = virtio_net_flush_tx(q);
+    if (ret == -EBUSY || ret == -EINVAL) {
+        return;
+    }
+    /*
+     * If we flush a full burst of packets, assume there are
+     * more coming and immediately rearm
+     */
+    if (ret >= n->tx_burst) {
+        q->tx_waiting = 1;
+        timer_mod(q->tx_timer,
+                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
+        return;
+    }
+    /*
+     * If less than a full burst, re-enable notification and flush
+     * anything that may have come in while we weren't looking.  If
+     * we find something, assume the guest is still active and rearm
+     */
     virtio_queue_set_notification(q->tx_vq, 1);
-    virtio_net_flush_tx(q);
+    ret = virtio_net_flush_tx(q);
+    if (ret > 0) {
+        virtio_queue_set_notification(q->tx_vq, 0);
+        q->tx_waiting = 1;
+        timer_mod(q->tx_timer,
+                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
+    }
 }
 
 static void virtio_net_tx_bh(void *opaque)
-- 
2.7.4


