Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA79616845
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:18:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGK0-0007l2-Gc; Wed, 02 Nov 2022 12:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJy-0007dK-Aq
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJp-0002zj-AP
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uP43tqF7KIGeiEXLeAHNEumMXPufRETwc61xJpjS6BM=;
 b=MVlBkgulElnhsIOhQUPURYtcStUxpolXJd1yQXXZ54d6FPiRJBftzN3egjQAbX2O00Cz1v
 1b53Cn6Ts3SL5VxlHhxE+5Vk0xoEtZkPtvseblzF/K4hh0yeHWJPaSMPnQA3q3BQG4xqMA
 orJ5z7qfeJkLQv93ZGw9zv2AaLGBFBo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-qZGnac_8NrK8_CCOLcGBbQ-1; Wed, 02 Nov 2022 12:10:19 -0400
X-MC-Unique: qZGnac_8NrK8_CCOLcGBbQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso4982889wrb.8
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uP43tqF7KIGeiEXLeAHNEumMXPufRETwc61xJpjS6BM=;
 b=ERhlfI30q+ig5UDJgqREX2/CjrKcCjmjaaP0RJnOJw2GNXlIdg9vw7siq+oNYOgrfC
 DgHKfpqRza2B3RDaeMgVxO3Nxur0LP2XGYj386KI5CrzIcAIQgetlRdZexVYzlyiuDS1
 HiertnCvgtvi5Y6Y69wOhbotbNRhqjgy7r4Nl9I44J2EcvdIGmgnpX7TrrCYWOLXW5Je
 J0QnB787Lvc9+3yLAMI+Hom9RpmoO7eydvRTGubQKdNo55q0KUWlwtFOdL7DnX2zS567
 gGj/1dgNlUNI5M+miv3iPPn3cnbzPjhi6Eqp7FKZV+MqhFiJAq48PX6k0l7QXs32H+IB
 +h3w==
X-Gm-Message-State: ACrzQf20EsqqfZfE5KeLdaGTW5Ca/12A5KNeI33Xyh3b2chNZ3evgJAu
 KW+V7dpemGEOqB+BduJr+PVgRWpJzrdBZ9SrqNqy+HUkX+o5M8dnPNcznCc8NYjHpjGCWFckunS
 E0fJQugPP80rgYfJAtg3rT2VHdczgykjSSwQLbCAczcP66Mq90ia9rn2Vn68J
X-Received: by 2002:adf:f392:0:b0:236:2c41:d3f5 with SMTP id
 m18-20020adff392000000b002362c41d3f5mr16084030wro.596.1667405418104; 
 Wed, 02 Nov 2022 09:10:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4nyJ101uIyjxx3GwcQSFh7ZescogNAoZxQxXLIreCuzOzi3kNleiWwNxsyYO86EpvhR8lLkA==
X-Received: by 2002:adf:f392:0:b0:236:2c41:d3f5 with SMTP id
 m18-20020adff392000000b002362c41d3f5mr16084001wro.596.1667405417849; 
 Wed, 02 Nov 2022 09:10:17 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 i9-20020a0560001ac900b00228a6ce17b4sm14597126wry.37.2022.11.02.09.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:17 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 41/82] vhost: expose vhost_virtqueue_start()
Message-ID: <20221102160336.616599-42-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


