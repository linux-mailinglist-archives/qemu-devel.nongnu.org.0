Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F305FEE7D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 15:23:18 +0200 (CEST)
Received: from localhost ([::1]:45298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojKej-0000J4-PJ
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 09:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ojKbs-0004Ni-TT
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:20:21 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ojKbr-0005Rl-2J
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:20:20 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N2EDg-1p9E3j30vu-013iQ3; Fri, 14 Oct 2022 15:20:09 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Brivio <sbrivio@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 alex.williamson@redhat.com
Subject: [PATCH v2 2/2] virtio-net: fix TX timer with tx_burst
Date: Fri, 14 Oct 2022 15:20:04 +0200
Message-Id: <20221014132004.114602-3-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014132004.114602-1-lvivier@redhat.com>
References: <20221014132004.114602-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yUYdvKAO8+ratG6LTkQeJMKn2VK8BpDcBDheSNM6OpY7CFk5yIs
 OpJeFHLtIF4+M58SCUp75HnTSDepzkAdQ7RYV9j4t3AOEhkZH0VMEScEFzLSwxXWtaYQxeu
 AIUQtjAzJtT7rzT0VNYkDyi5UcXfzpq3NvV8vyNRyoR4YEN9gpAEbPOwec2C+ShDs1uOOpJ
 9S6sGPNSW52vvNOo4aS8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jghyiOYPz0M=:uiIgM+DkDNdoEZbsaxWuEq
 x8SuS/nthT/hq+75RmbBAxtlZgpQp7ManBY3+D0fd1N5Qj0nElG+ffPFTNgfvvZ97OboDhrdi
 0IsCUnJ7CggEKdJM4nFdXI/+mlX213BHhucQxZvEn98wQuAszSQo+Dos8WQopDVHU+RIjRLlk
 1WdV123SoPQ9WqFUqsw7BmAcL7NPnFe8QsJxCQuc8lK5C9zR8RXXAdWebI5sajkUX6+Gge8pj
 tXi8y+qRNiOG2exPUVY09sgFFV+TCz3fMxPpfAL57hekDosP4fDHREjckc4fog8VffS9+zMW8
 mxZVWZDMG7k/opXhZO4cICitKYx70nF4u3U6GHtn+XxhjWDHis2+DxdTnMFOHhsTI3XBmviuY
 9WcZxWvy2RmAuQYgCBNejQdlRLFowzpa92IBt8DAzQm9fp0q/m5kBWDXOIg5HnDxPtxF8cpKP
 nhVGKJCCgHwxhi1x4qoIVzCG8T7hyqYmfNNPryv8aK0hJV9eEw4rjwK1SDwSb0eifx4cFYj3H
 a09edNb7IT6irmdRWoBMi2xw9qO3yC6OkxUWx7sOmEEpP7f9R8Wm52+hiLBdh0Xb0fND03Qoz
 tlhS9Z6dUd2ljsfzEAnNdPSSesqHkqRjClnP4eOPHaaWDnkpE6P6lHDpiP2iu7duC5VfFdktY
 8rwIFMRd5+9ZxsGtg25d+9PS87vun3x3Rs2XWT/SptFjwl/r0T/fXnNL1HUzWJpkwRU/6mMZd
 mqyEy8UOo/7a8dR417dG3G2PBn9+txmW9jhLqmiIsGdE8cO767VHktmnpceD8LMKAxn7oNkMC
 P9ttXQJ
Received-SPF: permerror client-ip=212.227.17.13;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When virtio_net_flush_tx() reaches the tx_burst value all
the queue is not flushed and nothing restart the timer.

Fix that by doing for TX timer as we do for bottom half TX:
rearming the timer if we find any packet to send during the
virtio_net_flush_tx() call.

Fixes: e3f30488e5f8 ("virtio-net: Limit number of packets sent per TX flush")
Cc: alex.williamson@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/net/virtio-net.c | 59 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 13 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1fbf2f3e19a7..b4964b821021 100644
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
@@ -2661,18 +2668,17 @@ static void virtio_net_handle_tx_timer(VirtIODevice *vdev, VirtQueue *vq)
     }
 
     if (q->tx_waiting) {
-        virtio_queue_set_notification(vq, 1);
+        /* We already have queued packets, immediately flush */
         timer_del(q->tx_timer);
-        q->tx_waiting = 0;
-        if (virtio_net_flush_tx(q) == -EINVAL) {
-            return;
-        }
-    } else {
-        timer_mod(q->tx_timer,
-                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
-        q->tx_waiting = 1;
-        virtio_queue_set_notification(vq, 0);
+        virtio_net_tx_timer(q);
+        return;
     }
+
+    /* re-arm timer to flush it (and more) on next tick */
+    timer_mod(q->tx_timer,
+              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
+    q->tx_waiting = 1;
+    virtio_queue_set_notification(vq, 0);
 }
 
 static void virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
@@ -2702,6 +2708,8 @@ static void virtio_net_tx_timer(void *opaque)
     VirtIONetQueue *q = opaque;
     VirtIONet *n = q->n;
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
+    int ret;
+
     /* This happens when device was stopped but BH wasn't. */
     if (!vdev->vm_running) {
         /* Make sure tx waiting is set, so we'll run when restarted. */
@@ -2716,8 +2724,33 @@ static void virtio_net_tx_timer(void *opaque)
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
2.37.3


