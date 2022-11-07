Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91E6620372
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAx2-0001ek-NN; Mon, 07 Nov 2022 17:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwr-0001by-OQ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwp-0003w1-Et
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9WAG+6UVBZa9BFa+G580I9ppzoTYCiRdriGpJVhyE2E=;
 b=HA4G3JA59Ju3cKCKdqn6utOLM8uq3C4X9Ls1dkA85C5x4vos3PQCD6O2U7dxHi+8NkEWLI
 /y5mhfj0Mhnj5cOAqH8GwmMBsCIPkIVR0E1r38TNNxYEB+p4bHA91GNWp03vc9F4pZ31tQ
 3mJTLaRLo9HCC+LcPM8WEIhF/a037io=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-_ARoheWjPfWZnWsjUjAipg-1; Mon, 07 Nov 2022 17:50:29 -0500
X-MC-Unique: _ARoheWjPfWZnWsjUjAipg-1
Received: by mail-qk1-f200.google.com with SMTP id
 bm2-20020a05620a198200b006fa6eeee4a9so11401441qkb.14
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9WAG+6UVBZa9BFa+G580I9ppzoTYCiRdriGpJVhyE2E=;
 b=LWgxk5NFt/9mj7SQtsds59hXscc8tmeaH0pLiC1r8/ac4Pyw/0e7O6DGDkC8sauvso
 jkNR//fJG6m0W3kjw3vFli6lEevcsGNix4NmlKPkNkWORn9p7fJ4dEoegx3cQMl6Dw7H
 h5ZN2soNI1ro5SkCBqhwMxFiEZ5YiO8TufgCk30ppqYQ+xqmGzvbVpohbw/+puls5BLn
 1cyCbToauyemMinGBL5A4KvteZpTErsB4s4qlNFQQv/ElWgFEOVFIoTR7KjOxQpHuxzv
 RRGgiVFhBCoaU5GIoIwE3uoPgQUnwEY3jj0XWEkJbOOIyGjaDIaCOpkM72TpkQexsvl2
 X8ew==
X-Gm-Message-State: ACrzQf2nkKYgx/Co45112jTobmH8BUUNF7mqjEY8zq0S6c9LOC2Smq9P
 A4gllxvwUe/ZvkFSjAZGK9ytjdQ2HIsLRoOkLaLg13G0HnQP9ghqGWSk0rPMNn5wOw2+OM3I1cA
 HHXqH0aNVHtts7JBAeIjRzIpTySIpLeUieg4DUBsnv4TubzlHaBTZvoKp9Enm
X-Received: by 2002:ac8:7493:0:b0:3a5:287b:d6c8 with SMTP id
 v19-20020ac87493000000b003a5287bd6c8mr34125529qtq.241.1667861429251; 
 Mon, 07 Nov 2022 14:50:29 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4QIvkpFZm6weNLSW6b4ldCFwIhUC2L3lh2un91SyShutPKehdqmRCnDqaHw3mMm2m+MyJjHA==
X-Received: by 2002:ac8:7493:0:b0:3a5:287b:d6c8 with SMTP id
 v19-20020ac87493000000b003a5287bd6c8mr34125510qtq.241.1667861428916; 
 Mon, 07 Nov 2022 14:50:28 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 l16-20020ac81490000000b003a57004313fsm6928270qtj.3.2022.11.07.14.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:28 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 35/83] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_reset()
Message-ID: <20221107224600.934080-36-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Introduce vhost_virtqueue_reset(), which can reset the specific
virtqueue in the device. Then it will unmap vrings and the desc
of the virtqueue.

Here we do not reuse the vhost_net_stop_one() or vhost_dev_stop(),
because they work at queue pair level. We do not use
vhost_virtqueue_stop() because it may stop the device in the
backend.

This patch only considers the case of vhost-kernel, when
NetClientDriver is NET_CLIENT_DRIVER_TAP.

Furthermore, we do not need net->nc->info->poll() because
it enables userspace datapath and we want to stop all
datapaths for this reset virtqueue here.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-10-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h |  2 ++
 hw/net/vhost_net-stub.c |  6 ++++++
 hw/net/vhost_net.c      | 25 +++++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 387e913e4e..85d85a4957 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -48,4 +48,6 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net);
 
 int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
 
+void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
+                               int vq_index);
 #endif
diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index 89d71cfb8e..2d745e359c 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -101,3 +101,9 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
 {
     return 0;
 }
+
+void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
+                               int vq_index)
+{
+
+}
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index d28f8b974b..8beecb4d22 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -531,3 +531,28 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
 
     return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
 }
+
+void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
+                               int vq_index)
+{
+    VHostNetState *net = get_vhost_net(nc->peer);
+    const VhostOps *vhost_ops = net->dev.vhost_ops;
+    struct vhost_vring_file file = { .fd = -1 };
+    int idx;
+
+    /* should only be called after backend is connected */
+    assert(vhost_ops);
+
+    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
+
+    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
+        file.index = idx;
+        int r = vhost_net_set_backend(&net->dev, &file);
+        assert(r >= 0);
+    }
+
+    vhost_virtqueue_stop(&net->dev,
+                         vdev,
+                         net->dev.vqs + idx,
+                         net->dev.vq_index + idx);
+}
-- 
MST


