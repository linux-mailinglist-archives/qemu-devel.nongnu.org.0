Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE79E613750
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:03:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIN-000245-L7; Mon, 31 Oct 2022 08:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHy-0007xe-CS
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHv-0002wF-OR
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LUuRpk4BtsBnPaMPiISdRXaG1NGaSn/p3XCoIVXT8Co=;
 b=VeHUaHn8BAFYkMLSPu+iF0aj3TeAG32W3Kq0ZuLkcszBO+bvGS2iu/52RVtSk1xZ0EDdwX
 0n24Jjkp7uaKbhkSCRQrFWZYVqUeNjdCq7XLJAGDZI1s4rXBXZXhy+jlPn/U6ZRSiPh5BW
 CWVatmiN2LaywvtbaKGPJNiRNL6+ZQc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-MlNy66xOP2CRDTjqmXxZ3A-1; Mon, 31 Oct 2022 08:53:07 -0400
X-MC-Unique: MlNy66xOP2CRDTjqmXxZ3A-1
Received: by mail-wr1-f71.google.com with SMTP id
 e13-20020adf9bcd000000b00236b36cd8cbso1543440wrc.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUuRpk4BtsBnPaMPiISdRXaG1NGaSn/p3XCoIVXT8Co=;
 b=lMo1ssZfzHo5CPS5fvv2DLmbGrKwS0+RowBpRM4iVXdfstFpZpVURY71/rrdFHiqR+
 7TSEHi61O93LxEJjPV57udps2UpoXm771SHbNrfJXFqlOoMvLN96Z7WqiqcmHRVPfaLh
 7M/sdIZPRRk4/SCXdxwtnUkbmlKEA29EO10qzpG9/DTMuW/pq+OeQgiEEFmTjAzkFglK
 HsQPSnPSIzNvtb9bqWd2OuakZCSC41yqjqL6hhXsC8b6V5dxKr5BACuaw/M/lrCzKEqi
 Rkd2OZoxrMjCeMtW0UVfPOVd/iPr2UzLSC+NoKwurgqE7kLMvcAqndHLlLLLo/cW5sv2
 HuWA==
X-Gm-Message-State: ACrzQf3EIXvnrZQlnII09FQL5EH/sWuq9GuRrxxjGmWsXCp6stTB/P+P
 DQGKCOu6nkee8uTjn42xTr//1mp0KifN8Pd+ujWAenhkmBU2fsCBnQYuRN2lIypqDunhVS5oolV
 QBIXVMio/0dy0m4KXzEAw4PzUEvppW3gfW6HDQO4XquE6BC4V3Ip5J+y/BbTh
X-Received: by 2002:a05:600c:2cbb:b0:3c6:c4d9:6004 with SMTP id
 h27-20020a05600c2cbb00b003c6c4d96004mr17916035wmc.66.1667220785616; 
 Mon, 31 Oct 2022 05:53:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6u9GUhobiuzdB4roajF8iatFIx+2ipfQb/B5PUpRlsOJPUHYCDxMs/yGSl1YT4Rd0jKhNT9Q==
X-Received: by 2002:a05:600c:2cbb:b0:3c6:c4d9:6004 with SMTP id
 h27-20020a05600c2cbb00b003c6c4d96004mr17916013wmc.66.1667220785350; 
 Mon, 31 Oct 2022 05:53:05 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bu15-20020a056000078f00b0022ac1be009esm4735807wrb.16.2022.10.31.05.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:05 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 49/86] virtio-net: support queue_enable
Message-ID: <20221031124928.128475-50-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
index 8feeb032b4..f5adba45d5 100644
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
@@ -3802,6 +3822,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->bad_features = virtio_net_bad_features;
     vdc->reset = virtio_net_reset;
     vdc->queue_reset = virtio_net_queue_reset;
+    vdc->queue_enable = virtio_net_queue_enable;
     vdc->set_status = virtio_net_set_status;
     vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;
-- 
MST


