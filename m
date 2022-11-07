Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D58B6203B9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:26:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAwl-0001Lm-9t; Mon, 07 Nov 2022 17:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwi-0001FT-Rk
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwg-0003p2-EA
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uP43tqF7KIGeiEXLeAHNEumMXPufRETwc61xJpjS6BM=;
 b=anJdQXz32vWHXbZqCYuaeat10KAbFltS8Y74QuOU3+bfS8Fzt+mZH4Vo7VlUA2n9qm2c5b
 7A5koMCR9Mgpnj5bDQ+30tmXSK31WNSTSruVbGU5F0RYxYwWp70Rj2iSRU0IBPW2RKpVgq
 JKXfcAsltfpR+uuBKuIq9yAR4IScOGY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-Pi1dlS4qOQmqHCqFamGvPQ-1; Mon, 07 Nov 2022 17:50:20 -0500
X-MC-Unique: Pi1dlS4qOQmqHCqFamGvPQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 cm12-20020a05622a250c00b003a521f66e8eso9109615qtb.17
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uP43tqF7KIGeiEXLeAHNEumMXPufRETwc61xJpjS6BM=;
 b=we51IKXsJm1NgXOulMbwkAaEjFsJIf9nqRDGziUOMw0VGLE1XXcZpmf/bDpBo0LoEF
 L8Fpr6l+VBvrvMNQiEcMZaX4wLSCNG3b6GKm3ISUcqGoPqAivGtIsL8nM5Mt1bKYqPSd
 gR0uIjGFlNlrDyOWKeDUWIJmdYRRC1z7/Lim6S0l0/nLUC8G59FfHudFfwz2uRGOd+Pe
 Ni618xMKvdbmyNR7uaVdvM7UfoyZ2KzceWOX6NIO/D3rjynA0WF/Olr8Vyth2qHtjYLN
 B+T2MB+Dd7VQZZ3Op8IoodLsSooZdv1eWR2iCd+kRuAKlx5h5azBH5i9noAxVCAWs1vk
 MEGA==
X-Gm-Message-State: ACrzQf1SFicHNaJPG6CoBisFBnhzTxNVstH+DubuHuknYEwIHJgk4wu9
 CVMqL0zyXYgZyqWTKcpLdMezBSKzJCzZoi3OCWdwAgENoFZuzrpz02hJKCLNgUHndhithn6hBCh
 FPIuStIhGgOPEyMt/dQGKoBdqPMVwzUV+PsuJGNKcCGUYYuZV9XBbBqg4mYxK
X-Received: by 2002:a05:620a:5319:b0:6fa:4c1b:f054 with SMTP id
 oo25-20020a05620a531900b006fa4c1bf054mr25780815qkn.15.1667861420262; 
 Mon, 07 Nov 2022 14:50:20 -0800 (PST)
X-Google-Smtp-Source: AMsMyM66DEuTl5uHVPcaiExs8B4i4+S6qQlQhIrpQ9Sqe0TuO2NbCyi3/Hg7d00XcPzTBfeVoSEdKw==
X-Received: by 2002:a05:620a:5319:b0:6fa:4c1b:f054 with SMTP id
 oo25-20020a05620a531900b006fa4c1bf054mr25780790qkn.15.1667861419657; 
 Mon, 07 Nov 2022 14:50:19 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 s26-20020a05622a1a9a00b0039a610a04b1sm7050718qtc.37.2022.11.07.14.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:19 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 33/83] vhost: expose vhost_virtqueue_start()
Message-ID: <20221107224600.934080-34-mst@redhat.com>
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

Expose vhost_virtqueue_start(), we need to use it when restarting a
virtqueue.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-8-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h | 3 +++
 hw/virtio/vhost.c         | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index d7eb557885..0054a695dc 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -297,6 +297,9 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
 
 int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
 
+int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice *vdev,
+                          struct vhost_virtqueue *vq, unsigned idx);
+
 void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
 void vhost_dev_free_inflight(struct vhost_inflight *inflight);
 void vhost_dev_save_inflight(struct vhost_inflight *inflight, QEMUFile *f);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 5185c15295..788d0a0679 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1081,10 +1081,10 @@ out:
     return ret;
 }
 
-static int vhost_virtqueue_start(struct vhost_dev *dev,
-                                struct VirtIODevice *vdev,
-                                struct vhost_virtqueue *vq,
-                                unsigned idx)
+int vhost_virtqueue_start(struct vhost_dev *dev,
+                          struct VirtIODevice *vdev,
+                          struct vhost_virtqueue *vq,
+                          unsigned idx)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
-- 
MST


