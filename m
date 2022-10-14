Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C85FEE7C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 15:23:17 +0200 (CEST)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojKei-0000FK-GU
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 09:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ojKbr-0004Ng-9f
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:20:21 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:40753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ojKbo-0005Rh-LI
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:20:18 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N6bwO-1pDduZ0Cqs-01868F; Fri, 14 Oct 2022 15:20:09 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Brivio <sbrivio@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 alex.williamson@redhat.com
Subject: [PATCH v2 1/2] virtio-net: fix bottom-half packet TX on asynchronous
 completion
Date: Fri, 14 Oct 2022 15:20:03 +0200
Message-Id: <20221014132004.114602-2-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014132004.114602-1-lvivier@redhat.com>
References: <20221014132004.114602-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LbT5j+d0cwRRc2EwgnTEbeb/8JFseST9qWis5zeywmRpvzMPDDy
 hzi6WpFX/LB0VXJuWfRyPgFLZu1djVdU52HHgynbti3sKT71ltY5lauEjS00yGI2IMTbcne
 NWW/NQiucx2WmKYlNIA0yDJUOiKkSJd1kRhjOZlcMaAGPXkUCAIqckdiHqBZ1O80XzXbb/b
 AYKJ3HiuYZ1aYP+pPkVpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8xJgM/Pg0NQ=:1mvMx7cmh9LPtdtVX6rRVd
 lgY5hvmgvgtfAFpQzrgOjvsgNnloVM93g+/6yRDpZnwNVgmnbYnutM852vhy2rCpddACslV/w
 lenvoWGQNK8Qb+B2eSon+eZ+iXN7PoXFdWVSu9YnZv9hTbo4sIXUkHacPDvhmEG5e2KYI+8Rs
 c1HVxwuVH8XaiSUZ5223E+GT7gIiuan3rQpDjpmAuXJYh779n4HXIuHN88hMH6ZLhtetqCbUv
 2lmkZH6ZeAPRy6B7bwifdd48tRGPZjwoK4olEEMPkKWzAweBGIoAfVjxZtXLeTHwcX4WWtFRK
 bp97jd5l468BMI9JgI7lZWxvf20vc5+6snira0HrTEEsNF5PYw6VNePmAfN9ka3d85hitdsju
 ElkEWtgyWj6wQPrAGP1mAGWwOaLYm5savZekD+XZau95Von5aaYKHQD3KVR9D5PYJ7+hVwm/y
 Uusxf0nyMS3ZmM4pcIb/VnKjNs3qauHFwqAErQCTWWcgcESNaWCRPskOYLTi2+UhON2xDz2Oj
 7Hvr6o0kHT5D1p+aDX9Tza3PrafA306G3hNJejAp4Gx81OputBYXTHwzGaIRZaICDvSh8O9Kv
 +fKf+QUQAm1gN6191oA4Xeg4pn5XKhKOG1C4q4IUZybYiAIN0EZM0AW1TKcn7V3w8UE3OdLvh
 DO4k2CfMqzKidFxlOOqOL1UudyeRoLH05ktLRtmFKPpkwDcLQ6BeA4CD0/6IeXWRttOPznTTr
 C1Jeg7EZ2lpJ7qfRhhgqwWgk2jjAMaZNerUdnDQn2R4zkhwVp5pvwaEKc3B0AIHW/wImCE3MN
 s+PE7T0
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


