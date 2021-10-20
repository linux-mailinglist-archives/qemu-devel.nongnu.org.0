Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E15434475
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 07:03:48 +0200 (CEST)
Received: from localhost ([::1]:47028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3lT-0005t2-Kr
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 01:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3f6-0002wC-9E
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md3f4-0008Fn-HV
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634705830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vyhwmtJBJ95uYZlCJKRnQNUPfDB/7pSjSyOdelmJhFk=;
 b=gqGp+X58bRtOPSnoLfeCrF1sQMn7QwSH++EjQyGD9hYI6znDNt/BjQdU3B8IgxoVWzVwD1
 idzS9WBb89cRE0ntVGmpfPi6jdgEpOZ7CmsL054Ly22dEGYjBhYSXhJVoguLBgvO/8Yoq/
 XqenRiBnLQivGtwX6AqG3zIKXuFhdhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-S6ATq32MOwSGNW998VopGA-1; Wed, 20 Oct 2021 00:57:06 -0400
X-MC-Unique: S6ATq32MOwSGNW998VopGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E9DD189CD24;
 Wed, 20 Oct 2021 04:57:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-13.pek2.redhat.com [10.72.13.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EBF160BF1;
 Wed, 20 Oct 2021 04:56:58 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V5 09/10] virtio-net: vhost control virtqueue support
Date: Wed, 20 Oct 2021 12:55:59 +0800
Message-Id: <20211020045600.16082-10-jasowang@redhat.com>
In-Reply-To: <20211020045600.16082-1-jasowang@redhat.com>
References: <20211020045600.16082-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 7594f7ea92..f2014d5ea0 100644
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
@@ -3411,9 +3412,23 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
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
index 2903b79a92..eb87032627 100644
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


