Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E72616886
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGK1-0007oq-CV; Wed, 02 Nov 2022 12:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJy-0007dT-Bz
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJw-00034J-NP
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0jLIU51m573FAYqL6NsmM3zyshjEfoeP0nbK9i/2ZQM=;
 b=ai7ORaRfyr3XBBN/k5HH2mGOiFwa9WxGFnje9rPrFCriaXj3PhotkJ2TjyWBARFt90lNtX
 XZlTmF1ayUxORfg4O63yeHEspvbpugz4tw3Cs9Y4mRgVR0dixDHpdjdRoUnGeGIBVz5CS4
 qcH6yREmyFbfzdgpCPg3+uuIZjYiog8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-jPGFg4k0PvuSUWB9tCs5gA-1; Wed, 02 Nov 2022 12:10:25 -0400
X-MC-Unique: jPGFg4k0PvuSUWB9tCs5gA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso4988649wra.1
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jLIU51m573FAYqL6NsmM3zyshjEfoeP0nbK9i/2ZQM=;
 b=S1G1RUrW/HEQIEoXirf2DSup6pyMH0aqOZiHsb5NZJLFr9XMhMpwf3R+QYgDLQLCkt
 zgqnTEUfzKIU3ySvSE2Zx+Si9BsYqKxw3fywTwhhygEPuMNCtaRJlAXbu9L2pq0KvdNy
 thJyIMWWHdOS3srsS2WAdxSpIuMzDv/7QEnfgHU0hj/+/igwdH3kXl0J/1vx56ZiAmh/
 SxQyyUurdyw6U2VESYwTOwxVjuVwuShS5C+MIt5+bHSFEumppFB6C1b6K0Mr5oqivVPa
 rrhNSRj/Qyi/EI0tV23KBaT5uWK6563UNXQxQeMIHz7NW+woV9MYUUNdUUHReoBoLM7s
 uZlw==
X-Gm-Message-State: ACrzQf3z9TcIdP63UCjuUBodW9+zi7AmY0RY3SyjU86TRcvYW8Z3cKjl
 UVKBA7ccQD1gXHAF0bs37Wud1Om66BzSWMipaYl61MQjUpFSSdresl5u5vUMgLs+zDS0Azir93C
 FReAk6aFntTYgyqj6dHpTEO7qWOrSO+2bslkWxh8cDwiFZNktg3mxrWVUx4EY
X-Received: by 2002:a1c:2543:0:b0:3c6:b7bd:a474 with SMTP id
 l64-20020a1c2543000000b003c6b7bda474mr25255182wml.95.1667405423964; 
 Wed, 02 Nov 2022 09:10:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Sc9uG//FkJcLwDdlezZRRhp5L+PdT6EAJp/ZjXuXatrtfjGcNCXDW02cJ3FG7K/Z3HrcY+g==
X-Received: by 2002:a1c:2543:0:b0:3c6:b7bd:a474 with SMTP id
 l64-20020a1c2543000000b003c6b7bda474mr25255152wml.95.1667405423721; 
 Wed, 02 Nov 2022 09:10:23 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 w12-20020a5d404c000000b002365254ea42sm13380079wrp.1.2022.11.02.09.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:23 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 43/82] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_reset()
Message-ID: <20221102160336.616599-44-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index d6924f5e57..519dced899 100644
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


