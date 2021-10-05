Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228A422D95
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:13:43 +0200 (CEST)
Received: from localhost ([::1]:43780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXn4X-0000sQ-PI
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsm-0000AE-Oc
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsi-0004us-R1
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E/2AbBIxr8gJIB7YiiNV6HX7OyqnjUd6KvubBiO23Xo=;
 b=ZXbiViFg7PT5eWPcVFiS+5+0hOEH4H0PUDZDcTOhTDNbZaK6Ikneo2vn9I9j/Qfx47Gsqy
 O13SFyfP29ZyUiqLmuhb/Px66mdlSN7qm09JHMoLv4kRQDiXKTDA3qwQGcC7DVT2CYno7T
 a3lsXyGAXVi8Xo7q+CCS/NnH+tim08M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-jhwAf8ACP1SFFvXfJJtGmw-1; Tue, 05 Oct 2021 12:01:25 -0400
X-MC-Unique: jhwAf8ACP1SFFvXfJJtGmw-1
Received: by mail-wr1-f70.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so5921795wrh.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E/2AbBIxr8gJIB7YiiNV6HX7OyqnjUd6KvubBiO23Xo=;
 b=qMmEsA1qePk+bvM/YMAudSjIrL1N0wvIFz08Xv/ZfXwYNyJaemiSk6HGqxaL6JZibj
 iIauzNKzct3sxR5AYkyDsswnQEzkJoRXH+3AQX/VMrl8KfkobGlw3MlPqU/GCwEz8Twr
 TTtOAXAxfY/Pf1pN35fUcCjQ5uvEPJnZ9dNjxGrD++HQTOCLIRRLbizJEX2bfVctEIl9
 Gm5EhPBxzBLaC8p9K/r4Q0/0i000FpIubieQotqaUK3Ja75HuP91d+aKgHk0C0Sl7JHn
 safY0b9VtkErkfrI+WP3/KbYdpFo9v3Xgs2JV7aR/Q6qcGnAyGJ5/a3wVzUn/sKSgplP
 ybSg==
X-Gm-Message-State: AOAM533jaidz2/kb2LEX2l8TJAm8Hr38RQqpObIe3ZEVjbhE2Km+B5o8
 ObDHKPJfP9BHWlx0TU8mqoSLS8CoXhtgHTq28OfZTeuQdQHobmT1PsgNi5M0bO8FLwDD6W444SI
 SmeJFtW3S+/f5Il9vy4PBujCLQx3m5ljFYLQYgpqhcdGelwx02atCs8wQR/KK
X-Received: by 2002:a1c:43c3:: with SMTP id q186mr4218967wma.143.1633449683519; 
 Tue, 05 Oct 2021 09:01:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvDYisFhozDkxlqSWshcqezbP5c8oMJhq+JguusiNSjzMFVO4EAvdwTbzxTfL2iqn+p0muGw==
X-Received: by 2002:a1c:43c3:: with SMTP id q186mr4218933wma.143.1633449683285; 
 Tue, 05 Oct 2021 09:01:23 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id d16sm2238699wmb.2.2021.10.05.09.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:22 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/57] virtio-net: vhost control virtqueue support
Message-ID: <20211005155946.513818-12-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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

This patch implements the control virtqueue support for vhost. This
requires virtio-net to figure out the datapath queue pairs and control
virtqueue via is_datapath and pass the number of those two types
of virtqueues to vhost_net_start()/vhost_net_stop().

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210907090322.1756-10-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 +
 hw/net/vhost_net.c             |  2 +-
 hw/net/virtio-net.c            | 23 +++++++++++++++++++----
 3 files changed, 21 insertions(+), 5 deletions(-)

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
index 2ade019b22..57a0cbc6cd 100644
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
@@ -3393,9 +3394,23 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
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
-- 
MST


