Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACDD6203B6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:25:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxQ-00020B-Dg; Mon, 07 Nov 2022 17:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxG-0001qA-VX
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxC-0003yk-TW
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R69TW5AAW3qysOvzyDIF1yD1Oe9R6ooUnUwNn/cIU3g=;
 b=d9nJZXARH4uPJsm7BSDw6mYCzO5qX4e34FioYpiUPFduLe5S5bqOYjJQ94CWkzeasVChJc
 S4mjV3dEHjMtVU6bApiDTFI4zCm1mi5nwxKTI8Q4/o1LJ3++J0+T+ZuejJ4Z3FecAJOYzo
 wasiL1LFNHHqktLGpuH1jemh0g4eO8o=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-5iQUwwUHNg24d-A0XmaM3g-1; Mon, 07 Nov 2022 17:50:48 -0500
X-MC-Unique: 5iQUwwUHNg24d-A0XmaM3g-1
Received: by mail-qt1-f197.google.com with SMTP id
 cj6-20020a05622a258600b003a519d02f59so9049019qtb.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R69TW5AAW3qysOvzyDIF1yD1Oe9R6ooUnUwNn/cIU3g=;
 b=4EJsuSJslnBbXTXmjMuAr4LYSx1de9CenMBRoP3gCR3ZMCvnPWttl4b8tlYxicLN52
 qSgWQfMRnAHR5sRtZYvx99ullvAXEJWXISmQMQpkw+2DzgUZtD97botQW/MWcZJHAg32
 4ESnpR1TTinyg/OSrAmHTGr+USPYUz/W7CmhoXi/aedr8WhN3YeLUx3kdX9S93HjyhaQ
 iH9CYJWA0I++1I4Nj1tXmZBkIUUFyb0wwYWfRbkIT2DdFD08ofpLm9Gmv72a01RV4eNF
 V+ulRLRrezn3SoKwT6Ej4ZrwuIWmW789GsnyIO1Oqg9aboiy6YVeWjGiuVdfyWCRmii7
 BAtA==
X-Gm-Message-State: ACrzQf0WwxqbU30WZX8xPcsfZPUPaozAzCxxSD7eox/7mzWzZU4bHTd4
 uQQkUYmQ4ytaRWqkZDOpIsstTRIzfQOCJTfPYoWTPuordO1aLcJg0DrQ7xcz8fvQSffIwYLZWuR
 gMx3CXNUcsPFHwShIGBccr1S1ruCECMv5Lsy3Q3KqUXn1P9AgxNUD4NrGTYq9
X-Received: by 2002:a05:620a:2a0c:b0:6cf:9085:683b with SMTP id
 o12-20020a05620a2a0c00b006cf9085683bmr37328509qkp.159.1667861447664; 
 Mon, 07 Nov 2022 14:50:47 -0800 (PST)
X-Google-Smtp-Source: AMsMyM60ZGGDN4I4v3OYLvuGHZDiKNZP/v15QNwBNX/u8hDztCkn+nimDm7aXJhmleQnaPavQvjfpg==
X-Received: by 2002:a05:620a:2a0c:b0:6cf:9085:683b with SMTP id
 o12-20020a05620a2a0c00b006cf9085683bmr37328491qkp.159.1667861447381; 
 Mon, 07 Nov 2022 14:50:47 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 w27-20020a05620a0e9b00b006ee949b8051sm7617470qkm.51.2022.11.07.14.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:47 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 39/83] virtio-net: support queue_enable
Message-ID: <20221107224600.934080-40-mst@redhat.com>
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


