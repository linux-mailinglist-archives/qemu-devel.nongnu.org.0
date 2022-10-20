Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4671605C4B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:29:49 +0200 (CEST)
Received: from localhost ([::1]:40656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSo8-0003f8-J8
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:29:48 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSjO-0004Sz-K6
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olSKM-000250-2i
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:59:04 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:51523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olSKG-00009J-IZ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:58:59 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mwfj0-1p1a9x1PhK-00yC2V; Thu, 20 Oct 2022 11:58:51 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, alex.williamson@redhat.com
Subject: [PATCH v3 2/2] virtio-net: fix TX timer with tx_burst
Date: Thu, 20 Oct 2022 11:58:46 +0200
Message-Id: <20221020095846.63831-3-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020095846.63831-1-lvivier@redhat.com>
References: <20221020095846.63831-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q7ocp/1P/q+QYZqmeZDeFzYRgVG1xv+CabOSXye+3Ls7oW21Beh
 UpXIKR8AHydIeOO7Og5cU1dj/yuqy8wmt8pZAo1jo8xPwgXUCzDL2Uv1a9OBu62y8gRyWm+
 x/UamHptoZ4Ns28ng7YQjHpixe/84Cwen0ByxIIvqasDN6Eqljh1qg6tHMvS+M+3ix8341I
 qmQe/o+s43bl5GinechjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZF22+bSBpsA=:DICq1fknvXXqwq2DygQ528
 9zX5uMT24sGY8n2Jh8PEu48X/HILAhYMycGmSgjH2PcKqA92L1HymJ0FwqifJjkUub7Zt1+Qf
 Sh8oFGJhcBxxymHJteNjWZ5jN1VSPlOd0FHnRpE8x10/eNjZNvJvw2SuZ2YOpMsqu+Py+EFJ0
 myG2NNcXJUpJiI6uFp56u2h2N1a1+ox+s5rmA5fJlQy467QhnsqLUF57UMglddVJkKH86YW99
 dW+3Oz0usva44B7yCtCdZRy9T+dJPI++8U4tj/7BbET0gq3Nmtvdmw4BR166xhVsSSgahJar9
 MyThaLwSIU6UZi875xsP3p60BDOzWPwPJa+JRASe47CwM8Qc9o+OUC4vOgC67W3em/0ENm80Y
 0KOXCSQEupZFmXuv3cBSHpe9d9ukNOjiEVO0+nYrX0j3ybJhaLo+jIitffmRZxsejU3ifZ3s7
 KHv+siNODhFUgi7y7Yv7blOo5MnRZJlD8bAp5JP/43W9YLIk/gzkCzv/dYj0Z2nHs56k2k2T5
 VYKRIQpD7bt6hlQQAmtFXj0dwe5C8gdeftdGgUIr7WAt9YRQRrG1hcvpLuP9mfC/0sJJDJ2+a
 4/lidIZC9RP8y6xdLOKcnKiadB3Go3zCNjwSxhYwTGcdwf/3WcyDbfbDF2LGoHZxlgv08rQjZ
 ODJRlZMBP5192yHfWnjipy1OBG2+kPZeBlyTNkZI4dq9I3vjhlqM1Vte62vWX1MPl0gG00Ckc
 jt+7RoouLqRPE26uWqS7LW3KNAvPII/vGbGbqRZVDLu7vA6RNg/5p5uKzQ9FYisESupCM/erE
 0sTT/iK
Received-SPF: permerror client-ip=212.227.126.187;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
 hw/net/virtio-net.c | 50 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1fbf2f3e19a7..b6903aea5450 100644
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
2.37.3


