Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7CA613706
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIG-0001Fd-A0; Mon, 31 Oct 2022 08:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHi-0006g2-9R
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHf-0002rZ-I9
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iblFjKpaXIHtiQIUGFA8gXnv2AWbCgLXsgXlMDiv4m8=;
 b=LcszuwQqZi8+6dgeX8CaW9AtEAQB+RRpdl5j6pF8ie7qBuIqlnEGyAWo8kWpiR69NhCC7y
 t3rOzvErhn/o3fO0i3Ukisb+HLCctzDIe8zMXlpOoGN7RuUi+kTdFUDn08GiQJrkoyrWVo
 psn8gfscrlVkHf3iVwjY+Uk2g96Xb74=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-1HgQNEsWPHuKsSwCe0i4ZQ-1; Mon, 31 Oct 2022 08:52:53 -0400
X-MC-Unique: 1HgQNEsWPHuKsSwCe0i4ZQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so3018536wra.15
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iblFjKpaXIHtiQIUGFA8gXnv2AWbCgLXsgXlMDiv4m8=;
 b=1O9DWZtGPgsNwMD1GkG5b/eTBY9/2l5cdjyvUCnNq/fcUvHuec74hxlqirHTWojFBq
 VrnQzaTU0ooVXO/hDyLcdYzM1bbDsKx/00xsOIDaMZwOBzMrT15tAshSxMPpQic6jAht
 zar+AT+MoV3XDJpRmjJ6JJ+jIP1JmANha3zodq4NfzAsq0YOUTV7YA/KW3wg33Xb2ijT
 4iJ9hZEpiNlqT4HEW1PeQKQ0hKGeVwxqtF+d/9tyCTabZlnGp/KnhAt9du261OWL7zhM
 FDEruEfSCjOCZ9rrCQXRQKnec92wJNf7Vimx4VLnOjsZRU8gNwp5Xv4c6LFYeJ8Hzb5h
 SS6w==
X-Gm-Message-State: ACrzQf1eC+YNFaPLyIQCu61jGS2z2ikJr5RhXTJOme9umgI5PD32rFG+
 rEiKggIT+G50bi2PqJHSpoRZFndl7lHe/z6MKZ3a7PzNTjCCt+0rwbm/6n7s4gaLNVkgU1eu9dQ
 MZS12UI48vCDy6IEBsjmbyviX64vt7yAuvdyJ/wiT13RfEfn0twpwY788Hpsi
X-Received: by 2002:a05:600c:3d92:b0:3cf:3921:d8ad with SMTP id
 bi18-20020a05600c3d9200b003cf3921d8admr17981746wmb.15.1667220772185; 
 Mon, 31 Oct 2022 05:52:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SgvojumbezKCjeVBL5yLvzxgQ70STrBZx55K5YAaOTMFZ/fU3Sikg8NoqkNsGQUpwm5v2hw==
X-Received: by 2002:a05:600c:3d92:b0:3cf:3921:d8ad with SMTP id
 bi18-20020a05600c3d9200b003cf3921d8admr17981730wmb.15.1667220771931; 
 Mon, 31 Oct 2022 05:52:51 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 e7-20020adff347000000b00226dba960b4sm7159169wrp.3.2022.10.31.05.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:51 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 44/86] vhost: expose vhost_virtqueue_stop()
Message-ID: <20221031124928.128475-45-mst@redhat.com>
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

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Expose vhost_virtqueue_stop(), we need to use it when resetting a
virtqueue.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-9-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h | 2 ++
 hw/virtio/vhost.c         | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 0054a695dc..353252ac3e 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -299,6 +299,8 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
 
 int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice *vdev,
                           struct vhost_virtqueue *vq, unsigned idx);
+void vhost_virtqueue_stop(struct vhost_dev *dev, struct VirtIODevice *vdev,
+                          struct vhost_virtqueue *vq, unsigned idx);
 
 void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
 void vhost_dev_free_inflight(struct vhost_inflight *inflight);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 788d0a0679..d1c4c20b8c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1201,10 +1201,10 @@ fail_alloc_desc:
     return r;
 }
 
-static void vhost_virtqueue_stop(struct vhost_dev *dev,
-                                    struct VirtIODevice *vdev,
-                                    struct vhost_virtqueue *vq,
-                                    unsigned idx)
+void vhost_virtqueue_stop(struct vhost_dev *dev,
+                          struct VirtIODevice *vdev,
+                          struct vhost_virtqueue *vq,
+                          unsigned idx)
 {
     int vhost_vq_index = dev->vhost_ops->vhost_get_vq_index(dev, idx);
     struct vhost_vring_state state = {
-- 
MST


