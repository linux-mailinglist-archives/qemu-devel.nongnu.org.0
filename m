Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5CD61DCB2
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:51:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpX-0008Ac-7w; Sat, 05 Nov 2022 13:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnf-00076m-Ix
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnd-0007Zh-5c
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R69TW5AAW3qysOvzyDIF1yD1Oe9R6ooUnUwNn/cIU3g=;
 b=JblrtPXHWjhvCQ9qcj+3YNeic+2wGr3gF2ZpXP66UP8feUD5eHMc/cQNOa3er23/lpo/m4
 QRfSkuWjGHQjgwrvYpfhT1l/TpNYAllO66myaXuatOtjn4RKjuxtsHA8JZbzhwC90R4Dkg
 1PcT6RKWqSQ2GMeM4YuPtq3Xl0raYZ0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-9oylNqcjMv6xg-HUr9cLFA-1; Sat, 05 Nov 2022 13:17:39 -0400
X-MC-Unique: 9oylNqcjMv6xg-HUr9cLFA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso1900291wrc.10
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R69TW5AAW3qysOvzyDIF1yD1Oe9R6ooUnUwNn/cIU3g=;
 b=QJmdNtZ3rhawj0yjKviwZV+9FjdF0O1Y8kTMmgX2Awf+qUondwAraU3lZjOcNthYfq
 9gKcfrkY/aO5oZK+zYVQqu6jZuF4eBlmcx3QpcZ5HbakM3znw7trnhfou/fHwMsliXLx
 1Q00sOfONzqHnwMwlr5fP3ZXtM92Cw1ulhh+KSowxmq4BDXFHH+1PdoHlopQIjJSnDis
 D9YVQkxdMDDB8RDgpqY++y+LyD2T1CyiboBNqV8XdQwhYmi5qysGkf4uWjFHr0xL5Hna
 WEOklX3oILevPtaG92Dz8xNufIGXJw8ZoV8WEcy2Dd+O02Ds0hxaUTkgpmJF02hOR7zy
 C5NQ==
X-Gm-Message-State: ACrzQf2W3z/pGnF3EfRACZ9n8AJ/+/kOEAx5X2fDbEp2ngfWpVHKD+wU
 xCqs19XEIDEgg1cH+R20hxY//5Aktrt1fl7yvaw/42XcUd1bjNp0+iYI05D+k/+s3IpHfNORP6P
 8zEmyfk/9YVp8QTJR4AjOblJMUQ4MBIB94kgdZpobnSMlxfSyper4ZgnmfILg
X-Received: by 2002:a05:600c:19d1:b0:3c7:b52:3aa4 with SMTP id
 u17-20020a05600c19d100b003c70b523aa4mr38288425wmq.56.1667668658265; 
 Sat, 05 Nov 2022 10:17:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM52jUgEXLBGtyfw+ttJ544mFEL5OyFpiuqKHlmvUU7JKWVwK7GJ1x2xArIANQd5twRhv5JN0Q==
X-Received: by 2002:a05:600c:19d1:b0:3c7:b52:3aa4 with SMTP id
 u17-20020a05600c19d100b003c70b523aa4mr38288413wmq.56.1667668658018; 
 Sat, 05 Nov 2022 10:17:38 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d46d1000000b0022efc4322a9sm2634667wrs.10.2022.11.05.10.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:37 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 44/81] virtio-net: support queue_enable
Message-ID: <20221105171116.432921-45-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Support queue_enable in vhost-kernel scenario. It can be called when
a vq reset operation has been performed and the vq is restared.

It should be noted that we can restart the vq when the vhost has
already started. When launching a new vhost device, the vhost is not
started and all vqs are not initalized until VIRTIO_PCI_COMMON_STATUS
is written. Thus, we should use vhost_started to differentiate the
two cases: vq reset and device start.

Currently it only supports vhost-kernel.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-14-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 34fb4b1423..e68daf51bb 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -563,6 +563,26 @@ static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
     flush_or_purge_queued_packets(nc);
 }
 
+static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+    int r;
+
+    if (!nc->peer || !vdev->vhost_started) {
+        return;
+    }
+
+    if (get_vhost_net(nc->peer) &&
+        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
+        r = vhost_net_virtqueue_restart(vdev, nc, queue_index);
+        if (r < 0) {
+            error_report("unable to restart vhost net virtqueue: %d, "
+                            "when resetting the queue", queue_index);
+        }
+    }
+}
+
 static void virtio_net_reset(VirtIODevice *vdev)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -3845,6 +3865,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->bad_features = virtio_net_bad_features;
     vdc->reset = virtio_net_reset;
     vdc->queue_reset = virtio_net_queue_reset;
+    vdc->queue_enable = virtio_net_queue_enable;
     vdc->set_status = virtio_net_set_status;
     vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;
-- 
MST


