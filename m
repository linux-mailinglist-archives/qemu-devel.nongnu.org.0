Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7751F2BB400
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 19:58:38 +0100 (CET)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBcD-0008WG-Ft
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 13:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBWE-0004Ud-4T
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:52:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBWC-00071S-6A
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBKfLERfSf5dIrOoBodiDDSFxkynaDNC4JNMEvaUCDk=;
 b=SCiB1HEka9YFy0+h+PBOK8XD5eWwyPmcFGaPN4Nb18MFGJwsyVwLFc1aM6Kp8rRBA2xxt9
 Z6X0BdxyiQ2WDtsj4HhbY3trcbKBvnrzWcLDaUwArLqh0jclOIAat7hGYw7QuUalkyK079
 EtE5yiVvlJiJuEvD3TCR/42B/dY1SJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-DQLDp4S1P1eb-cRn3OpcPw-1; Fri, 20 Nov 2020 13:52:19 -0500
X-MC-Unique: DQLDp4S1P1eb-cRn3OpcPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A853E814418;
 Fri, 20 Nov 2020 18:52:16 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90D515C1D5;
 Fri, 20 Nov 2020 18:52:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/27] vhost: Add hdev->dev.sw_lm_vq_handler
Date: Fri, 20 Nov 2020 19:50:43 +0100
Message-Id: <20201120185105.279030-6-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only virtio-net honors it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h |  1 +
 hw/net/virtio-net.c       | 39 ++++++++++++++++++++++++++++-----------
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 4a8bc75415..b5b7496537 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -83,6 +83,7 @@ struct vhost_dev {
     bool started;
     bool log_enabled;
     uint64_t log_size;
+    VirtIOHandleOutput sw_lm_vq_handler;
     Error *migration_blocker;
     const VhostOps *vhost_ops;
     void *opaque;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9179013ac4..9a69ae3598 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2628,24 +2628,32 @@ static void virtio_net_tx_bh(void *opaque)
     }
 }
 
-static void virtio_net_add_queue(VirtIONet *n, int index)
+static void virtio_net_add_queue(VirtIONet *n, int index,
+                                 VirtIOHandleOutput custom_handler)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
+    VirtIOHandleOutput rx_vq_handler = virtio_net_handle_rx;
+    VirtIOHandleOutput tx_vq_handler;
+    bool tx_timer = n->net_conf.tx && !strcmp(n->net_conf.tx, "timer");
+
+    if (custom_handler) {
+        rx_vq_handler = tx_vq_handler = custom_handler;
+    } else if (tx_timer) {
+        tx_vq_handler = virtio_net_handle_tx_timer;
+    } else {
+        tx_vq_handler = virtio_net_handle_tx_bh;
+    }
 
     n->vqs[index].rx_vq = virtio_add_queue(vdev, n->net_conf.rx_queue_size,
-                                           virtio_net_handle_rx);
+                                           rx_vq_handler);
+    n->vqs[index].tx_vq = virtio_add_queue(vdev, n->net_conf.tx_queue_size,
+                                           tx_vq_handler);
 
-    if (n->net_conf.tx && !strcmp(n->net_conf.tx, "timer")) {
-        n->vqs[index].tx_vq =
-            virtio_add_queue(vdev, n->net_conf.tx_queue_size,
-                             virtio_net_handle_tx_timer);
+    if (tx_timer) {
         n->vqs[index].tx_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                               virtio_net_tx_timer,
                                               &n->vqs[index]);
     } else {
-        n->vqs[index].tx_vq =
-            virtio_add_queue(vdev, n->net_conf.tx_queue_size,
-                             virtio_net_handle_tx_bh);
         n->vqs[index].tx_bh = qemu_bh_new(virtio_net_tx_bh, &n->vqs[index]);
     }
 
@@ -2677,6 +2685,10 @@ static void virtio_net_del_queue(VirtIONet *n, int index)
 static void virtio_net_change_num_queues(VirtIONet *n, int new_max_queues)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
+    NetClientState *nc = n->nic->conf->peers.ncs[0];
+    struct vhost_net *hdev = get_vhost_net(nc);
+    VirtIOHandleOutput custom_handler = hdev ? hdev->dev.sw_lm_vq_handler
+                                             : NULL;
     int old_num_queues = virtio_get_num_queues(vdev);
     int new_num_queues = new_max_queues * 2 + 1;
     int i;
@@ -2702,7 +2714,7 @@ static void virtio_net_change_num_queues(VirtIONet *n, int new_max_queues)
 
     for (i = old_num_queues - 1; i < new_num_queues - 1; i += 2) {
         /* new_num_queues > old_num_queues */
-        virtio_net_add_queue(n, i / 2);
+        virtio_net_add_queue(n, i / 2, custom_handler);
     }
 
     /* add ctrl_vq last */
@@ -3256,6 +3268,8 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIONet *n = VIRTIO_NET(dev);
     NetClientState *nc;
+    struct vhost_net *hdev;
+    VirtIOHandleOutput custom_handler;
     int i;
 
     if (n->net_conf.mtu) {
@@ -3347,8 +3361,11 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     n->net_conf.tx_queue_size = MIN(virtio_net_max_tx_queue_size(n),
                                     n->net_conf.tx_queue_size);
 
+    nc = n->nic_conf.peers.ncs[0];
+    hdev = get_vhost_net(nc);
+    custom_handler = hdev ? hdev->dev.sw_lm_vq_handler : NULL;
     for (i = 0; i < n->max_queues; i++) {
-        virtio_net_add_queue(n, i);
+        virtio_net_add_queue(n, i, custom_handler);
     }
 
     n->ctrl_vq = virtio_add_queue(vdev, 64, virtio_net_handle_ctrl);
-- 
2.18.4


