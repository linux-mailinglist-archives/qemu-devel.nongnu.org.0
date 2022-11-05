Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18761DCB4
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:52:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpW-00089A-JT; Sat, 05 Nov 2022 13:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnd-00075x-PU
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnb-0007ZN-9m
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f2FbzoZ3PQnUW/fnU4amuMiS3Wb694JY7+xlmcZ9RJk=;
 b=PJ3Ewomm9nPH9eWh+f1l7hbJYehLhm4UjKM6dtgbqh+Dxl4Js4CzVfdJXcBzvXpW/KEp4Q
 KKPRKjNJptBD6q9rMAP3FeRI7A9bxOwKkBjCNb2ObJ1QNc+k7lQCyiOBCrF2NXtrEJvrrn
 BmLEV8eAlPYNKKiKO6leMhHqwNNrgGU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-WzvsWuCMPu6p8uoZpkfNkw-1; Sat, 05 Nov 2022 13:17:36 -0400
X-MC-Unique: WzvsWuCMPu6p8uoZpkfNkw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso899127wme.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2FbzoZ3PQnUW/fnU4amuMiS3Wb694JY7+xlmcZ9RJk=;
 b=D0gxKs/RGQGOOarUk8fAueUExjJuFrqU+LOE/MedwkLppDv6oXMYMKOvh2hr8T/X0G
 VZ76mVz/5aaCgFI/FR28LSwT5esPRjSJV3Unpf9sN8sj5NQubKA4Y/11FbLCZBVIJo9e
 RCC2AnBJ18y7sq+9lx+hQqYuxFF+VZ3p3/MjDwo0XQlx0gb+nOMGWHnPF1pVqo8zJMWL
 J4H8qYk8W0jThvj2KaGr+Cz5pzX5Y0eWd9axNMAyQLoXRP3vC0ygnSJgsaSv9RUDipUY
 p27luZjH+2PZeXqb8F2GWcTVPjoMtG7lp7ahEB8Ck8fInILnG8ZVfLjcblFlI0mSSAIo
 dSyA==
X-Gm-Message-State: ACrzQf0PNlJHAn5Hra64gD4zaQYFifw9GytWpGjJ0vEPeew4KHxWVYFU
 Sbpfcd86r4ZrKdWBhUUcBEBQVmBMu7ezYjKHZrhDD9/FkhTKG4Y3WFqQM98h2VYl0ZnW93pOGgK
 stFRLW/f0TrkeLDosBuF0UESOLdn0/7X2bPolfZQcErRNOlshYLWXFna3nlUm
X-Received: by 2002:a05:600c:4383:b0:3cf:6ab5:5c38 with SMTP id
 e3-20020a05600c438300b003cf6ab55c38mr25108118wmn.194.1667668655575; 
 Sat, 05 Nov 2022 10:17:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6MT+llvxMqJJjclu1Gu9g/W0gF1g8JxgJVApJ1PRpdwdbVIXjHsvTcBPc5etoKlhRF9/hFhQ==
X-Received: by 2002:a05:600c:4383:b0:3cf:6ab5:5c38 with SMTP id
 e3-20020a05600c438300b003cf6ab55c38mr25108105wmn.194.1667668655301; 
 Sat, 05 Nov 2022 10:17:35 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 v4-20020a5d4a44000000b002365254ea42sm2651972wrs.1.2022.11.05.10.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:34 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 43/81] virtio-net: support queue reset
Message-ID: <20221105171116.432921-44-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


