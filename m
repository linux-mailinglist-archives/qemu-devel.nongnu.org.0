Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E524025FF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:10:50 +0200 (CEST)
Received: from localhost ([::1]:57710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNX7x-000680-WA
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNX1k-000413-OK
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNX1g-0005DP-DS
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631005459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxMyeVs8a1/b+Fl2UTS6JvUsG4q8MSqQloCcaKZzMlc=;
 b=fuMBFZ4pPoZUQ+HesqBYJzZX9OeQl8E8kuiWu+cG2w1EeWnvN5V5zyEm+tDoxZhN84HAN3
 vaOiuCx9St6dTgc1+e/yLWX+xAlbhChA1aKKRbyOJfGYelVWcqb3tjKqR0GCkoa5lwpiHA
 DUlqYonbGHNGi2CiR47Sk87YDShIWW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-DUtLC7z4P3KWZQ0lk_02kw-1; Tue, 07 Sep 2021 05:04:16 -0400
X-MC-Unique: DUtLC7z4P3KWZQ0lk_02kw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FFA28145E6;
 Tue,  7 Sep 2021 09:04:15 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-183.pek2.redhat.com
 [10.72.12.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1F4C5C1CF;
 Tue,  7 Sep 2021 09:04:12 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V3 09/10] virtio-net: vhost control virtqueue support
Date: Tue,  7 Sep 2021 17:03:21 +0800
Message-Id: <20210907090322.1756-10-jasowang@redhat.com>
In-Reply-To: <20210907090322.1756-1-jasowang@redhat.com>
References: <20210907090322.1756-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: eperezma@redhat.com, elic@nvidia.com, gdawar@xilinx.com,
 lingshan.zhu@intel.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the control virtqueue support for vhost. This
requires virtio-net to figure out the datapath queue pairs and control
virtqueue via is_datapath and pass the number of those two types
of virtqueues to vhost_net_start()/vhost_net_stop().

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vhost_net.c             |  2 +-
 hw/net/virtio-net.c            | 23 +++++++++++++++++++----
 include/hw/virtio/virtio-net.h |  1 +
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 3aabab06ea..0d888f29a6 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -326,7 +326,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     VirtIONet *n = VIRTIO_NET(dev);
     int nvhosts = data_queue_pairs + cvq;
     struct vhost_net *net;
-    int r, e, i, last_index = data_qps * 2;
+    int r, e, i, last_index = data_queue_pairs * 2;
     NetClientState *peer;
 
     if (!cvq) {
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 926b6c930e..bd39d2edc4 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -244,6 +244,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     NetClientState *nc = qemu_get_queue(n->nic);
     int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
+    int cvq = n->max_ncs - n->max_queue_pairs;
 
     if (!get_vhost_net(nc->peer)) {
         return;
@@ -285,14 +286,14 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
         }
 
         n->vhost_started = 1;
-        r = vhost_net_start(vdev, n->nic->ncs, queue_pairs, 0);
+        r = vhost_net_start(vdev, n->nic->ncs, queue_pairs, cvq);
         if (r < 0) {
             error_report("unable to start vhost net: %d: "
                          "falling back on userspace virtio", -r);
             n->vhost_started = 0;
         }
     } else {
-        vhost_net_stop(vdev, n->nic->ncs, queue_pairs, 0);
+        vhost_net_stop(vdev, n->nic->ncs, queue_pairs, cvq);
         n->vhost_started = 0;
     }
 }
@@ -3368,9 +3369,23 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    n->max_queue_pairs = MAX(n->nic_conf.peers.queues, 1);
+    n->max_ncs = MAX(n->nic_conf.peers.queues, 1);
+
+    /*
+     * Figure out the datapath queue pairs since the backend could
+     * provide control queue via peers as well.
+     */
+    if (n->nic_conf.peers.queues) {
+        for (i = 0; i < n->max_ncs; i++) {
+            if (n->nic_conf.peers.ncs[i]->is_datapath) {
+                ++n->max_queue_pairs;
+            }
+        }
+    }
+    n->max_queue_pairs = MAX(n->max_queue_pairs, 1);
+
     if (n->max_queue_pairs * 2 + 1 > VIRTIO_QUEUE_MAX) {
-        error_setg(errp, "Invalid number of queue_pairs (= %" PRIu32 "), "
+        error_setg(errp, "Invalid number of queue pairs (= %" PRIu32 "), "
                    "must be a positive integer less than %d.",
                    n->max_queue_pairs, (VIRTIO_QUEUE_MAX - 1) / 2);
         virtio_cleanup(vdev);
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 71cbdc26d7..08ee6dea39 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -196,6 +196,7 @@ struct VirtIONet {
     int multiqueue;
     uint16_t max_queue_pairs;
     uint16_t curr_queue_pairs;
+    uint16_t max_ncs;
     size_t config_size;
     char *netclient_name;
     char *netclient_type;
-- 
2.25.1


