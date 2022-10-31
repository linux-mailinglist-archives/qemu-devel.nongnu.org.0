Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8286861375D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:06:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIO-0002G2-Cy; Mon, 31 Oct 2022 08:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHz-00082q-Fe
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHv-0002w7-NP
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2PhZALlrS13rn5DqF+oM3pCaaJ+NJj7260VLdmczprM=;
 b=elixSyQhflHzwaFICMO3EzLh9BvltxfXqU3NE6Xy9Fanni7UBDGgigZ5QAfOtRvkcJcmcR
 MDVCVMVSA9h0Di+vFwKzCpQXoA8hi77ffV4QEQWm0xzVvSoz6dfEMt9DDjBOPSsTEr4odo
 OxvTYgCxqugA1A0Fn3G39oRdmi4MWxE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-CAUI0XZLN6-7Wx9OQMSuDw-1; Mon, 31 Oct 2022 08:53:04 -0400
X-MC-Unique: CAUI0XZLN6-7Wx9OQMSuDw-1
Received: by mail-wr1-f72.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so3033524wrb.20
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PhZALlrS13rn5DqF+oM3pCaaJ+NJj7260VLdmczprM=;
 b=YKjWRyL4bsvJPf5UCI4ylDES9vW7agPLGi+xcKeRJpcjSJ6SUokCda1sLXyfoTHhM8
 kvIZiNwiBgXlgqsPPzL/TQIhx5mdtTh7oROcyf6p1olcxuBBPrMFqr5jOHD55gqrxm2Q
 p0AFmthNTKPQIEMHv5FXZBkMNVDM49XbWI00QWkjrNScyIXDT5YP9vLi5jv9fca2dWjl
 iCZHLpwItCQTVvwFi/SRNtSZ3H+Gf12L4hMeY75T21GeZkMcxfXy+hdkS3LK24dkfTo3
 oT8rypDf+eTgC3jkk0/3vzYp/U4d4Iwu/t5Pjc43qaSm3S0dAiglnB45jJT+3/8vJmN9
 r94g==
X-Gm-Message-State: ACrzQf2ZsJWT+PtcKzIuV7nlMY6675VQQk2Zy4kWhTTRtzq1LCEZx3sy
 tEb/zNWJO25yVaXtQ/tbMBxoesfdU3bLu16J0Vd3hZx4d3x/OQyktyhjCpH98mh9KqGIkmUkwbN
 goh5UB4as1AqYKlNTW+f0xmFVierzIuIVhKSdQHn/Isf8bW+I0iiLMlDxbX9R
X-Received: by 2002:a05:600c:600e:b0:3c6:fc59:5eda with SMTP id
 az14-20020a05600c600e00b003c6fc595edamr8104977wmb.30.1667220783145; 
 Mon, 31 Oct 2022 05:53:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FbEJujV8S5ciy9LtmV/ArJ5Rvw4EfAYEYWwCg5Qaingf/lztDvDAIEWUkzXj/pE6+C60f7w==
X-Received: by 2002:a05:600c:600e:b0:3c6:fc59:5eda with SMTP id
 az14-20020a05600c600e00b003c6fc595edamr8104949wmb.30.1667220782815; 
 Mon, 31 Oct 2022 05:53:02 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c3b1500b003c6edc05159sm7451858wms.1.2022.10.31.05.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:02 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 48/86] virtio-net: support queue reset
Message-ID: <20221031124928.128475-49-mst@redhat.com>
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

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

virtio-net and vhost-kernel implement queue reset.
Queued packets in the corresponding queue pair are flushed
or purged.

For virtio-net, userspace datapath will be disabled later in
__virtio_queue_reset(). It will set addr of vring to 0 and idx to 0.
Thus, virtio_net_receive() and virtio_net_flush_tx() will not receive
or send packets.

For vhost-net, the datapath will be disabled in vhost_net_virtqueue_reset().

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-13-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 4ace57fa6d..8feeb032b4 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -546,6 +546,23 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
     return info;
 }
 
+static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+
+    if (!nc->peer) {
+        return;
+    }
+
+    if (get_vhost_net(nc->peer) &&
+        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
+        vhost_net_virtqueue_reset(vdev, nc, queue_index);
+    }
+
+    flush_or_purge_queued_packets(nc);
+}
+
 static void virtio_net_reset(VirtIODevice *vdev)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -3784,6 +3801,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->set_features = virtio_net_set_features;
     vdc->bad_features = virtio_net_bad_features;
     vdc->reset = virtio_net_reset;
+    vdc->queue_reset = virtio_net_queue_reset;
     vdc->set_status = virtio_net_set_status;
     vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;
-- 
MST


