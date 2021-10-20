Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A374349BF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:06:53 +0200 (CEST)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9Qq-0007y9-H0
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iT-00058o-3Q
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iR-00040i-48
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JuroMvBcXiNLBW7beY861j3G2/83t+PnZfmt852Mzro=;
 b=c+siUhBXTNPg9kYlXHL7D9jzapKFoWTBb76TH+tV3VodUFIwU1BVeZvgJJW567SZ3Vd+KP
 6Bn1JEDUEnjQcPbE4915YMrq3fbYP1GIh6z6St9vg0zdkHxusHSG/zXHLNByQl29VMY6Mz
 JdhC5FzL889qfKEplXAPejzkLgj3/eQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-WSxwEhB8MoOGm1wYEs01xg-1; Wed, 20 Oct 2021 06:20:57 -0400
X-MC-Unique: WSxwEhB8MoOGm1wYEs01xg-1
Received: by mail-ed1-f71.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso3353482edt.11
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JuroMvBcXiNLBW7beY861j3G2/83t+PnZfmt852Mzro=;
 b=INxBhMdwYayzaYtip8E3w1DTSBQVqY0VA/nypez5CoGw56tpeKHeX5aYFueBZboPEr
 navmYSB4JPgTdW1YR35CI8ZeZP447ONOQcN1odAwcVsKVikPnuGJeVrK+NJ2qnNuoe4n
 VQW+V39GyYxrwudh459m7VaGSknOBkf/nrk6jcGa1Hov7b5qeeSE51PwO7SLMYBN+TvG
 cpIexjhTD1mwSJR7+xusXfyyxho7jAb0PX7khY2fnIMqhop0uviFw4iC/3TWvneXCCU4
 HT9UA5khcOblUvGdqnzfo2nkgwvPj3rOdkUaWKq39CmQaCxfyq3+7dBDfrl8vxhq3mBe
 LEMw==
X-Gm-Message-State: AOAM5303n3f+O6cJGRdzGlT9A2d3YFifPEedj47JDh1Cj1nlptlVSBXJ
 xc6pdde6FjDEwB1DanVQVH3rNRDEpBT0Rny7d+q3HYcNGKEzUc8I1/QlzU8FDTLXFRaCql5GUnq
 znAHfiuMrWWT+J8Xq9KKkSVi9gWJG3JSLH3ZVvM9r5cGP9DAukPIWbrL0b+G2
X-Received: by 2002:a17:906:d196:: with SMTP id
 c22mr42611084ejz.231.1634725255654; 
 Wed, 20 Oct 2021 03:20:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRJYUjWV9uLKEVfaeKDfEzR2KHENDR/Xn3o+Tp1/6myD52W5Ii56Krdx5xyHxorzMeNquVlw==
X-Received: by 2002:a17:906:d196:: with SMTP id
 c22mr42611060ejz.231.1634725255400; 
 Wed, 20 Oct 2021 03:20:55 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id hp3sm403966ejc.61.2021.10.20.03.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:55 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 36/44] vhost-net: control virtqueue support
Message-ID: <20211020101844.988480-37-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

We assume there's no cvq in the past, this is not true when we need
control virtqueue support for vhost-user backends. So this patch
implements the control virtqueue support for vhost-net. As datapath,
the control virtqueue is also required to be coupled with the
NetClientState. The vhost_net_start/stop() are tweaked to accept the
number of datapath queue pairs plus the the number of control
virtqueue for us to start and stop the vhost device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211020045600.16082-7-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h |  6 ++++--
 hw/net/vhost_net-stub.c |  4 ++--
 hw/net/vhost_net.c      | 43 ++++++++++++++++++++++++++++++-----------
 hw/net/virtio-net.c     |  4 ++--
 4 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index fba40cf695..387e913e4e 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -21,8 +21,10 @@ typedef struct VhostNetOptions {
 uint64_t vhost_net_get_max_queues(VHostNetState *net);
 struct vhost_net *vhost_net_init(VhostNetOptions *options);
 
-int vhost_net_start(VirtIODevice *dev, NetClientState *ncs, int total_queues);
-void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs, int total_queues);
+int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
+                    int data_queue_pairs, int cvq);
+void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
+                    int data_queue_pairs, int cvq);
 
 void vhost_net_cleanup(VHostNetState *net);
 
diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index a7f4252630..89d71cfb8e 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -33,13 +33,13 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
 
 int vhost_net_start(VirtIODevice *dev,
                     NetClientState *ncs,
-                    int total_queues)
+                    int data_queue_pairs, int cvq)
 {
     return -ENOSYS;
 }
 void vhost_net_stop(VirtIODevice *dev,
                     NetClientState *ncs,
-                    int total_queues)
+                    int data_queue_pairs, int cvq)
 {
 }
 
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 386ec2eaa2..e1e9d1ec89 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -315,11 +315,14 @@ static void vhost_net_stop_one(struct vhost_net *net,
 }
 
 int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
-                    int total_queues)
+                    int data_queue_pairs, int cvq)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
+    int total_notifiers = data_queue_pairs * 2 + cvq;
+    VirtIONet *n = VIRTIO_NET(dev);
+    int nvhosts = data_queue_pairs + cvq;
     struct vhost_net *net;
     int r, e, i;
     NetClientState *peer;
@@ -329,9 +332,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         return -ENOSYS;
     }
 
-    for (i = 0; i < total_queues; i++) {
+    for (i = 0; i < nvhosts; i++) {
+
+        if (i < data_queue_pairs) {
+            peer = qemu_get_peer(ncs, i);
+        } else { /* Control Virtqueue */
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
 
-        peer = qemu_get_peer(ncs, i);
         net = get_vhost_net(peer);
         vhost_net_set_vq_index(net, i * 2);
 
@@ -344,14 +352,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
      }
 
-    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, true);
+    r = k->set_guest_notifiers(qbus->parent, total_notifiers, true);
     if (r < 0) {
         error_report("Error binding guest notifier: %d", -r);
         goto err;
     }
 
-    for (i = 0; i < total_queues; i++) {
-        peer = qemu_get_peer(ncs, i);
+    for (i = 0; i < nvhosts; i++) {
+        if (i < data_queue_pairs) {
+            peer = qemu_get_peer(ncs, i);
+        } else {
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
         r = vhost_net_start_one(get_vhost_net(peer), dev);
 
         if (r < 0) {
@@ -375,7 +387,7 @@ err_start:
         peer = qemu_get_peer(ncs , i);
         vhost_net_stop_one(get_vhost_net(peer), dev);
     }
-    e = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
+    e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
     if (e < 0) {
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
         fflush(stderr);
@@ -385,18 +397,27 @@ err:
 }
 
 void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
-                    int total_queues)
+                    int data_queue_pairs, int cvq)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
+    VirtIONet *n = VIRTIO_NET(dev);
+    NetClientState *peer;
+    int total_notifiers = data_queue_pairs * 2 + cvq;
+    int nvhosts = data_queue_pairs + cvq;
     int i, r;
 
-    for (i = 0; i < total_queues; i++) {
-        vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
+    for (i = 0; i < nvhosts; i++) {
+        if (i < data_queue_pairs) {
+            peer = qemu_get_peer(ncs, i);
+        } else {
+            peer = qemu_get_peer(ncs, n->max_queues);
+        }
+        vhost_net_stop_one(get_vhost_net(peer), dev);
     }
 
-    r = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
+    r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
     if (r < 0) {
         fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
         fflush(stderr);
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3dd2896ff9..5ee6729662 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -285,14 +285,14 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
         }
 
         n->vhost_started = 1;
-        r = vhost_net_start(vdev, n->nic->ncs, queues);
+        r = vhost_net_start(vdev, n->nic->ncs, queues, 0);
         if (r < 0) {
             error_report("unable to start vhost net: %d: "
                          "falling back on userspace virtio", -r);
             n->vhost_started = 0;
         }
     } else {
-        vhost_net_stop(vdev, n->nic->ncs, queues);
+        vhost_net_stop(vdev, n->nic->ncs, queues, 0);
         n->vhost_started = 0;
     }
 }
-- 
MST


