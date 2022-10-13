Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62795FDBFF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 16:06:26 +0200 (CEST)
Received: from localhost ([::1]:34892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyqv-0008PS-Qa
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 10:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiylw-0003YK-Q9
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 10:01:16 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:60935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiylr-0003vI-Km
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 10:01:15 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MbSXf-1pGNm92VPF-00bq9i; Thu, 13 Oct 2022 16:01:00 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 alex.williamson@redhat.com
Subject: [PATCH RFC] virtio-net: fix bottom-half packet TX on asynchronous
 completion
Date: Thu, 13 Oct 2022 16:00:57 +0200
Message-Id: <20221013140057.63575-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zhbP6L+pLm58WfXKcUyKMs0nTReRNEDpNHo0isWZFrLrJLtJW0z
 rXV7osEr7xKknhfpZJuU9Z4nka4M2lr99BqSsgL25iYOSfOfno0oAyYgA9i9YBTGXqzcEzc
 W/aNTQWWklRQt8KKK8UMAxOGbID9j6NEw60HTauU5n/bgDXmuJsw9huoER2ELXy/VigMksn
 80kLX2pDjxy3uQZ6OHKVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WbO84iE5bg8=:PvF0yLQ6zWu9YFZyHL49WC
 cJkVddWpe643MdY2FSZfhzxECIl5LvONGWpGTaaM9GLpR6f0ivHZ6fmQ9ZtZX8jk27qyTbG5Q
 qU+bUApmdGpoUms1URc5Nxa5Xy6QJ49oaHIeiJyu06EvueREBDtVYI9fOkFFSMO1RTLTmkAlW
 1Fral60lyX/NPz9MoxdxtrWjHy0bT82N6UHoMQZIEwJRY8owH38xM3J00wxYQ/1XW8u9sB2DN
 yaxPAlroigBtjG61ZboWuADPFAGsC225FRqYTxRaXmNtY6QSIg5fl/ArvBdDlesuXvVIM+qjA
 ytw3/gA00krPKIzs6z8nVYoeiad4HFX2gqDdwbabQYWCYnjj2nl20wogrzceiS+mcFdJ3yDKM
 sKQjL5ZlJKzJ4r22xBPPTdjSHPb15ktyxWYDHskIt1ch5Q6+vEPU49ZezmxZmjQdet5dvzhkW
 cAf3i+klRU6gTnT6cu/h2kEKf3JVmODacwnfqwHSD9v8jR8uxYUUf2X2ZZa/F70/qtsl8mQTz
 Yz9mM1JT1i1MpZvBCIOOZ9G3CwW12gYl3tgAZxJdQfjBkoEtwDS2y1lvF6VbHVjyzRFxyX0tE
 Jl/sy2nQgj8OT8YdkLX6amabvTaihjrghlMbPuck2UZljRplPp63YFveKbNKKfaPxSMWguMd/
 o01hc9NKokoIZ6+oNQ+90F8s6YxIGczwnYGCUQw3Gr6aHENTOSv1+LC/J5CPiWDCe3guWTRbT
 bq/k2TI1MIOdgI/RgShcm79cjqhHH7Kwj5aByiNTM6WXPDZQKSzzir88INXS7QKoaUHAQqJLJ
 o2PmsVp
Received-SPF: permerror client-ip=217.72.192.75;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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

When virtio-net is used with the socket netdev backend, the backend
can be busy and not able to collect new packets.

In this case, net_socket_receive() returns 0 and registers a poll function
to detect when the socket is ready again.

In virtio_net_tx_bh(), virtio_net_flush_tx() forwards the 0, the virtio
notifications are disabled and the function is not rescheduled, waiting
for the backend to be ready.

When the socket netdev backend is again able to send packets, the poll
function re-starts to flush remaining packets. This is done by
calling virtio_net_tx_complete(). It re-enables notifications and calls
again virtio_net_flush_tx().

But it seems if virtio_net_flush_tx() reaches the tx_burst value all
the queue is not flushed and no new notification is sent to reschedule
virtio_net_tx_bh(). Nothing re-start to flush the queue and remaining packets
are stuck in the queue.

To fix that, detect in virtio_net_tx_complete() if virtio_net_flush_tx()
has been stopped by tx_burst and if yes reschedule the bottom half
function virtio_net_tx_bh() to flush the remaining packets.

This is what is done in virtio_net_tx_bh() when the virtio_net_flush_tx()
is synchronous, and completely by-passed when the operation needs to be
asynchronous.

RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC

Do we need to reschedule the function in the other case managed
in virtio_net_tx_bh() and by-passed when the completion is asynchronous?

    /* If less than a full burst, re-enable notification and flush
     * anything that may have come in while we weren't looking.  If
     * we find something, assume the guest is still active and reschedule */
    virtio_queue_set_notification(q->tx_vq, 1);
    ret = virtio_net_flush_tx(q);
    if (ret == -EINVAL) {
        return;
    } else if (ret > 0) {
        virtio_queue_set_notification(q->tx_vq, 0);
        qemu_bh_schedule(q->tx_bh);
        q->tx_waiting = 1;
    }

RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC

Fixes: a697a334b3c4 ("virtio-net: Introduce a new bottom half packet TX")
Cc: alex.williamson@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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


