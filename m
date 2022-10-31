Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B63F613732
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:59:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUI2-0008Fy-OO; Mon, 31 Oct 2022 08:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHQ-0004Ix-BH
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHO-0002mO-9C
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=05dzwNfg7HbBJ5DnJ73Qkx+E7eiNja915s9Il8Q0iOY=;
 b=CV5sXYbSehakvHWNJ4wV+6kCX5nmvUs6SuZpX+f5Aa6YQ/tIZflXLJnmcfSJzXJRbVtviu
 ID0j1XCViaJlRwsLkbCvbzsOY7bJnc+HuQ8agOSzCvy2fDZ4rB6JqgVMcE8+gUhcv6PZOy
 9mYtE0KiDhc7SRNKnDKzgmdGdcFIpfI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-gv10jyWGPM62LQBPUfIO9g-1; Mon, 31 Oct 2022 08:52:36 -0400
X-MC-Unique: gv10jyWGPM62LQBPUfIO9g-1
Received: by mail-wr1-f70.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so3018282wra.15
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05dzwNfg7HbBJ5DnJ73Qkx+E7eiNja915s9Il8Q0iOY=;
 b=1DrCVt+2aI2qWh3fWYZWHRlalCQqRdTT50rxNS5ji01SL0irwQennAuodJI7mKsy2r
 6+bov51fhpPx6SnPdoK6zAZWKYQZx+34XK7X0USYBEM84rYERG+dYgZ/CV8gbDhR3yxU
 KJURjGn8hzK5bFRjIULGXstITyW9JqkgTOXcPMaCZZQ4SM1JvWWHZt0wr8+929gTK6Xg
 qL1PJXUVOg6l10YWf/sEVy06evP6YRB3bjqfex6lrbyNFjBRTTATCOjf+uYb+95kWfJC
 Pf+Vhi8IIDs281quIu+9SqxiWLPGmrWdO4K1PjFDEmcQFRWoP9aIuns/hV67/Y91fiiI
 +iDw==
X-Gm-Message-State: ACrzQf2cWYLV+DHVtWm2lITP63gYjwpvMZeiEHkMRu3kbHj2QZhy+bIJ
 3qRHVsjiTkUAqCvJx5PXh5RnhQsN/D/O0PmnKw4j/cmlqKZ/pURTkolYNZgy+T0Rwqd0uC3t3wl
 5lt6I3jbxD0ksXFayExV6hvo2ZUuIsSxHBvlfwPExXPGyeomaYn5shFeTgRo8
X-Received: by 2002:a5d:4484:0:b0:236:574f:2536 with SMTP id
 j4-20020a5d4484000000b00236574f2536mr8243632wrq.7.1667220755038; 
 Mon, 31 Oct 2022 05:52:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5vap4Bf08L5tXoCRrdVuZaUBB33glAzx0YIq4W+BTH/e/Pg/tZV8cdoEVVg2+tv8WLRvKSOg==
X-Received: by 2002:a5d:4484:0:b0:236:574f:2536 with SMTP id
 j4-20020a5d4484000000b00236574f2536mr8243610wrq.7.1667220754754; 
 Mon, 31 Oct 2022 05:52:34 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003c71358a42dsm7800851wmi.18.2022.10.31.05.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:34 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 38/86] virtio: introduce virtio_queue_reset()
Message-ID: <20221031124928.128475-39-mst@redhat.com>
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

Introduce a new interface function virtio_queue_reset() to implement
reset for vq.

Add a new callback to VirtioDeviceClass for queue reset operation for
each child device.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-3-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h |  2 ++
 hw/virtio/virtio.c         | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index ebb58feaac..b4c237201d 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -148,6 +148,7 @@ struct VirtioDeviceClass {
     void (*set_config)(VirtIODevice *vdev, const uint8_t *config);
     void (*reset)(VirtIODevice *vdev);
     void (*set_status)(VirtIODevice *vdev, uint8_t val);
+    void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
     /* For transitional devices, this is a bitmap of features
      * that are only exposed on the legacy interface but not
      * the modern one.
@@ -286,6 +287,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
                                       MemoryRegion *mr, bool assign);
 int virtio_set_status(VirtIODevice *vdev, uint8_t val);
 void virtio_reset(void *opaque);
+void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
 void virtio_update_irq(VirtIODevice *vdev);
 int virtio_set_features(VirtIODevice *vdev, uint64_t val);
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 6f42fcadd7..cf5f9ca387 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2484,6 +2484,17 @@ static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
     virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
 }
 
+void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+
+    if (k->queue_reset) {
+        k->queue_reset(vdev, queue_index);
+    }
+
+    __virtio_queue_reset(vdev, queue_index);
+}
+
 void virtio_reset(void *opaque)
 {
     VirtIODevice *vdev = opaque;
-- 
MST


