Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D17613707
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIH-0001Qr-MR; Mon, 31 Oct 2022 08:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHj-0006rS-Vn
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHi-0002rp-6E
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0jLIU51m573FAYqL6NsmM3zyshjEfoeP0nbK9i/2ZQM=;
 b=c5E8DFvsCkXRHxPKdAXqlx5Fe/MWuLxNQJsl09M6BcV+b9JDxLL8mbp+He3u4oB9/aqsZ/
 O9pR2Q9nqoDuo1MfpZ3w3ZNLni6yJUJZdxE7YbaYnXJDbDsz01WDDCJf6ibJNxwSD6Sf3F
 iEA6dqHDjgNnRlPm9DLRk4GpygihNDs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-IBpT5JzTOXWQmqgRKLbLWg-1; Mon, 31 Oct 2022 08:52:56 -0400
X-MC-Unique: IBpT5JzTOXWQmqgRKLbLWg-1
Received: by mail-wm1-f70.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso265628wmk.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jLIU51m573FAYqL6NsmM3zyshjEfoeP0nbK9i/2ZQM=;
 b=z17NL5JT46dSrWC4EDg6zrafmfDE/QYa3CmiYz8091cOMDkQlHvP8fD+/05IXYgcn8
 RGE91OD0Eunf5uU9n1He3tqIDCt/JPRuZR7tW/5jxz/ODNKviQtkpQpWpByFz/SipzN8
 2fMpADOD32u1aQh3xUEQxd2XpACkZWzenuHrZEtClHZ08Q/x8cE5iaxTPtcVXxuL8yAx
 2UrzYwCXGpjV3J9GJ+5t5UkzLQQYfhGfl2wMozU1pPuxDSSsJFjQ5SlBnlbVt+v48Ryr
 NeB3zx9ZO8QQIIUuClhdv7HTD0JUJS+N3lYM/uL+xi3K9w9x+sn83w24osqo2DqDAzoo
 do0g==
X-Gm-Message-State: ACrzQf2SH2heUIux8r4QFs2mYDel5i8eIEJ/h2VWdzutma3P6mh44jJ3
 wwmhYPjou1LIFQuAlb2hOWAgBIkbgvphVKnowqyKR3GWsHW53YJXFoXySZIPxdf3k0PeONM/BQX
 xtCSgeOkUloU5t2f9HvdaN524KckpFmEs+7/7582eLs29bBuEZIQ1VrdZHGO4
X-Received: by 2002:a05:600c:1d8e:b0:3cf:6fd4:c802 with SMTP id
 p14-20020a05600c1d8e00b003cf6fd4c802mr3755399wms.96.1667220774761; 
 Mon, 31 Oct 2022 05:52:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5H2gjXZJuXRfzplNty24D2Bh7fQZXzgViYCqlnIDeyFj11sDglH8jyeYRIIZ+I2nhbslDW0Q==
X-Received: by 2002:a05:600c:1d8e:b0:3cf:6fd4:c802 with SMTP id
 p14-20020a05600c1d8e00b003cf6fd4c802mr3755382wms.96.1667220774378; 
 Mon, 31 Oct 2022 05:52:54 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6282000000b00236cb3fec8fsm4033095wru.9.2022.10.31.05.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:54 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 45/86] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_reset()
Message-ID: <20221031124928.128475-46-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


