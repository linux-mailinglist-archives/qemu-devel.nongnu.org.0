Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C48B382CD0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:06:21 +0200 (CEST)
Received: from localhost ([::1]:53994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licwt-0005y0-RN
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1licvB-0004dy-6w
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:04:33 -0400
Received: from mail.ispras.ru ([83.149.199.84]:49832)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1licv8-0001yx-E6
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:04:32 -0400
Received: from [127.0.1.1] (unknown [85.142.117.224])
 by mail.ispras.ru (Postfix) with ESMTPSA id 77D1F4076B5E;
 Mon, 17 May 2021 13:04:20 +0000 (UTC)
Subject: [PATCH] replay: improve determinism of virtio-net
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Mon, 17 May 2021 16:04:20 +0300
Message-ID: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, jasowang@redhat.com,
 pavel.dovgalyuk@ispras.ru, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-net device uses bottom halves for callbacks.
These callbacks should be deterministic, because they affect VM state.
This patch replaces BH invocations with corresponding replay functions,
making them deterministic in record/replay mode.
This patch also disables guest announce timers for record/replay,
because they break correct loadvm in deterministic mode.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 hw/net/virtio-net.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 6b7e8dd04e..e876363236 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -44,6 +44,7 @@
 #include "hw/pci/pci.h"
 #include "net_rx_pkt.h"
 #include "hw/virtio/vhost.h"
+#include "sysemu/replay.h"
 
 #define VIRTIO_NET_VM_VERSION    11
 
@@ -394,7 +395,7 @@ static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t status)
                 timer_mod(q->tx_timer,
                                qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
             } else {
-                qemu_bh_schedule(q->tx_bh);
+                replay_bh_schedule_event(q->tx_bh);
             }
         } else {
             if (q->tx_timer) {
@@ -2546,7 +2547,7 @@ static void virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
         return;
     }
     virtio_queue_set_notification(vq, 0);
-    qemu_bh_schedule(q->tx_bh);
+    replay_bh_schedule_event(q->tx_bh);
 }
 
 static void virtio_net_tx_timer(void *opaque)
@@ -2602,7 +2603,7 @@ static void virtio_net_tx_bh(void *opaque)
     /* If we flush a full burst of packets, assume there are
      * more coming and immediately reschedule */
     if (ret >= n->tx_burst) {
-        qemu_bh_schedule(q->tx_bh);
+        replay_bh_schedule_event(q->tx_bh);
         q->tx_waiting = 1;
         return;
     }
@@ -2616,7 +2617,7 @@ static void virtio_net_tx_bh(void *opaque)
         return;
     } else if (ret > 0) {
         virtio_queue_set_notification(q->tx_vq, 0);
-        qemu_bh_schedule(q->tx_bh);
+        replay_bh_schedule_event(q->tx_bh);
         q->tx_waiting = 1;
     }
 }
@@ -3206,6 +3207,10 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
         n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
     }
 
+    if (replay_mode != REPLAY_MODE_NONE) {
+        n->host_features &= ~(1ULL << VIRTIO_NET_F_GUEST_ANNOUNCE);
+    }
+
     if (n->net_conf.duplex_str) {
         if (strncmp(n->net_conf.duplex_str, "half", 5) == 0) {
             n->net_conf.duplex = DUPLEX_HALF;


