Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89698605C45
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:29:16 +0200 (CEST)
Received: from localhost ([::1]:34938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSnb-0002Ex-E9
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:29:15 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSfR-00044R-Uq
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olSKM-00024z-2P
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:59:04 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olSKF-000098-Mb
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:58:58 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M5Q6n-1omHfj2K7J-001R3M; Thu, 20 Oct 2022 11:58:50 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, alex.williamson@redhat.com
Subject: [PATCH v3 1/2] virtio-net: fix bottom-half packet TX on asynchronous
 completion
Date: Thu, 20 Oct 2022 11:58:45 +0200
Message-Id: <20221020095846.63831-2-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020095846.63831-1-lvivier@redhat.com>
References: <20221020095846.63831-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oMFlOkoONldzjUS74jD2fpic0+3Lf6ct3UCOMqPiAI+iLhYYBoe
 auzXbOsRbiMRhWVOFEMb0Xin/UIcrno34KePgATO+3d2RMfReUCm1vl2kfjA3+d0I+/QL4z
 Ugo/KP9zMR94Msg9TF/WBtl/QLaIoeKSlHvadbUmq3MUwtyM94C6zxtj+AoDNeog6uDcN//
 fezhv1S7lH7P4WU1G+zVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kNZ1u7iKMU4=:D21cWwA3U3yoGm+RdDECAi
 VarEHgXYAVMNEseoZj4u6r09vPAusEu8ya2Xzy61cL8WBOR/1EiCj/XlvqqMKM7DlnZUxL5qw
 AtnRjk5hUe+bbNBGKvQdd7Kw8Zstw//NShi8IFz4NzqfaNt5aAbCniC0/fUX1njfT77wVqTBT
 sdCex1QbzCW9HLJbVD/msMTyr1wr2OmLprmWQmsYFMoPqDgpms9ogl43rrcoqqZX1xDlvYmLW
 OjpvCBb/UasA+OrvpivlPSKhCHrvNLMHg2qSaTtahI7kl9Fq2SyumM3Lz0liedfsTPHb64xlH
 ccuItmDTTUVMf+7rBnWNMHeEpNJatJ3JB9I/DSSkzXzwLs778z5KCLBbcAXrHCu+GM48EO6SD
 KZHgq5pPwfrjnvz5DQb1s5uhTaopcJPwmPZePs9tb8j5Dfy8Kgn2f4Dq7DkawWcOJ6wBchsaj
 m92Z7WgIqePVkS3wdI9a6AVYWFpy0JELpOnf6afGqmpPZOOq2WNqCAe4F1cUV/vo8YBxV6rrO
 seLgEkkGqcHXMF5cw3UbG/EBQ9610WIptUqBoXHPxdsTjefiH/Ahp/VQBEduDTEMq+Z8inE13
 5lwFSzz9O8rl3CLUSl8QUoeeRcv5w+BznnflGN0gAnUHUFU5+9jyUqokf6UbwDyP0rlFCJWuu
 2PoC5cdAuPEtFSkzw/K+aesd9GtHkcQ3V0klz+qMJ+15hLjyvjr/QoElOt3vAB7F9caFFoZjt
 uh6wHRMhbtdZExjUfMpUXkhvnW20Iiev4uYgndXFncsMK4OPLm/zKqp47QvhiOsOGOvtUaG+h
 RFNNjP4
Received-SPF: permerror client-ip=212.227.126.133;
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
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index e9f696b4cfeb..1fbf2f3e19a7 100644
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
2.37.3


