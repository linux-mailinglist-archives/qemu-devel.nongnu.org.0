Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7A3620392
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:15:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxP-0001yt-I4; Mon, 07 Nov 2022 17:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxC-0001ow-6K
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAx3-0003y2-Dd
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f2FbzoZ3PQnUW/fnU4amuMiS3Wb694JY7+xlmcZ9RJk=;
 b=cFDKbL+SRDDsTcqyY0Co2yABCU9qy1Hve1meJ3Nvi6bAv3k+F8fgORM1HIdhKTz+wwhCe4
 ZM1ixRSUE1Rz30TJUbQ/EW3H+9bNzLAaxmxwiw9ANIbY0ESm8V6+ctnr+ZwHnawyVtk+AC
 p0whNHBmV5iM5OwaafRXZYJL6RzcRdQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-duo2zAg6NAC9BTLmHHPyrg-1; Mon, 07 Nov 2022 17:50:43 -0500
X-MC-Unique: duo2zAg6NAC9BTLmHHPyrg-1
Received: by mail-qk1-f198.google.com with SMTP id
 h8-20020a05620a284800b006b5c98f09fbso11480496qkp.21
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2FbzoZ3PQnUW/fnU4amuMiS3Wb694JY7+xlmcZ9RJk=;
 b=sKnBZMHqvxaQ2tEFhfWaiXnQOWpZNN/22WtPBX+h1z+NAn9Kfk9w+g07x0hG0TkBtK
 khQeFU4x6wggcfQo5VL8OVr6OwZ0gcsas+Zu/p23lAjZqDfRZpguIP0gMmtd1nwpaJ+1
 AHp3ITwH/SDNhOXiG2hv7RxzYNhwNAzZer1nCfnclmIk5cCDZOKYn8p46UUpDMyDTv4N
 VgQ3B/guYWPsuz+GUPxdCxd2wj84w6JWDQSHnX3B8c8kJNpTIVTVP6hGj2eGkI3K2hs5
 3oW1g1bxTkb/ji84CQHsRUiqCCQLzB+MeY73u971KYYW8sqXwsjsotge97q5pM2EhnYX
 FWQQ==
X-Gm-Message-State: ANoB5pkcLzyipI1+mAM7b2N8G13tpiRtOfrBMZmiAZy037fkWoMeumTr
 OdE54lek9G5cx1oi62W5CEWD/e8orSJdruM9Pn/9vtn/W8za8Iik69lQ36tieDF1OUNqlECYFFA
 GqiSMomM31uUDQpaWpC4D+tJqFL2qW8b+70T/7PbXqVBUxJfceiQgVYIwwX26
X-Received: by 2002:ac8:5c49:0:b0:3a5:87f0:b8a0 with SMTP id
 j9-20020ac85c49000000b003a587f0b8a0mr6413484qtj.377.1667861443235; 
 Mon, 07 Nov 2022 14:50:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf761nXMsHOoaRMUmxPFPJsw1+UqWEn3Dk9KOBeNR1YaQC/UTCppXy+G2/JMXwx1drUc1o6v3A==
X-Received: by 2002:ac8:5c49:0:b0:3a5:87f0:b8a0 with SMTP id
 j9-20020ac85c49000000b003a587f0b8a0mr6413465qtj.377.1667861442938; 
 Mon, 07 Nov 2022 14:50:42 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 k2-20020ac80742000000b0035badb499c7sm6892081qth.21.2022.11.07.14.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:42 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 38/83] virtio-net: support queue reset
Message-ID: <20221107224600.934080-39-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


