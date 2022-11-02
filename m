Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5976168B2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKH-0000Fb-M3; Wed, 02 Nov 2022 12:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKF-00007n-3R
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGK4-00036a-PG
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f2FbzoZ3PQnUW/fnU4amuMiS3Wb694JY7+xlmcZ9RJk=;
 b=KjfSauHmM/haaQWWEKIaOIx72W0lWT7r5tOSTwKzz8ZDlGNMU3QQjnv9qGqK4Nk3QKh4Bg
 xQnCoOpju5nX9Opx1TrSa+vPp3YmY0UaAp2zGNGTvA3yGtwDcVlmCTHH9NaVjBKRspPsRI
 bYB8qm+i25qKqKQC9Mvpqc5/vy7gSEY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-KDc9ofcRPnSj7p0OpSYmEA-1; Wed, 02 Nov 2022 12:10:34 -0400
X-MC-Unique: KDc9ofcRPnSj7p0OpSYmEA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so1795392wmb.0
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2FbzoZ3PQnUW/fnU4amuMiS3Wb694JY7+xlmcZ9RJk=;
 b=vviQz29BGUBJ6goZHK3B9y8NXX+O56le4GTw9XBzMzbNITv857ytfW8C9CFKPlX9vQ
 1342euuJRv//FkrKwqYxFl2QUn9nnjRL3Xim+EwrPtHu5ue1T1hCseFBDpkXPvWFfYdb
 3RmJKJKfOoI6p9GcHRDbk9+5knQQjyRUBkumjmm+jjpl14+XHNRRXGtb5Pq9FRLDn/cu
 0ZFMVFyuxD6uW5MInQwzkNF5uMrt0Fvw/dGBNWwuBg7dgjaLTQs9Ad2fJI8FyH/YvKAi
 EjhaPhUmyWZDUf6El6J3nh7VGDEK2+NFYLuZcFDqPbY2NfwQYD3sgo4owGSYwlr8vcvc
 e/7w==
X-Gm-Message-State: ACrzQf0l863Lu4TTyXPBlzFTuxbc0sR6rbsaNCG5Rq7Z5mJv7mwvyBxd
 Z8ExolxDn1CaxFGu/597RM09qzvmA159wlNKzAmfbR8BOMuSKhaIStf7JeB7jF+mG711k5duWT+
 J+2AjT89RQ7N6CLgBQhv+TsC2Wn0jlMC4TDHB+2StTaMQnpUZo/ux/uhKWNR1
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id
 z10-20020adfec8a000000b002365b80da83mr15321673wrn.509.1667405432322; 
 Wed, 02 Nov 2022 09:10:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6n5NNAF+bz39pYhTmj3Q/sAp9iP6Hp12E0m+sZucHkK/eofKn/ya/lMvJ+hBPPo0WHKBbPNA==
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id
 z10-20020adfec8a000000b002365b80da83mr15321643wrn.509.1667405432047; 
 Wed, 02 Nov 2022 09:10:32 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bx10-20020a5d5b0a000000b0022e47b57735sm13578895wrb.97.2022.11.02.09.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:31 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 46/82] virtio-net: support queue reset
Message-ID: <20221102160336.616599-47-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
index 038a6fba7c..34fb4b1423 100644
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
@@ -3827,6 +3844,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->set_features = virtio_net_set_features;
     vdc->bad_features = virtio_net_bad_features;
     vdc->reset = virtio_net_reset;
+    vdc->queue_reset = virtio_net_queue_reset;
     vdc->set_status = virtio_net_set_status;
     vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;
-- 
MST


