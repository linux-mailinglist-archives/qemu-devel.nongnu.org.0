Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD375613704
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIE-00012l-OF; Mon, 31 Oct 2022 08:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHf-0006Hr-9w
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHd-0002rR-Jh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uP43tqF7KIGeiEXLeAHNEumMXPufRETwc61xJpjS6BM=;
 b=eV2HgcSPZCTj7iYDOs59u58vovNzeP6HVn4zG7pytcMzCSPhlRk9Z10t4bSWGUK5v9uv3I
 q8tTbLYjw8DQnx2ghDW+B6Q0v3S50AxJBF+aJrm5HZ6+w7z4nyVsZtGYUZ1/nEbxbdSysg
 bs9eWRllg4SKvhdtTuGp7SGLuzfyN2U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-kDgeuFqLNO-Kk4mEJm7Xyg-1; Mon, 31 Oct 2022 08:52:50 -0400
X-MC-Unique: kDgeuFqLNO-Kk4mEJm7Xyg-1
Received: by mail-wm1-f69.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so948741wme.8
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uP43tqF7KIGeiEXLeAHNEumMXPufRETwc61xJpjS6BM=;
 b=whpGKXoEKEmXJZzw4uIhrEUAB+FiFoJtBLxd9kUofGrFoizm0lVTcofxar2mFajwDt
 AkiDsFnfu2swC9ZBDcrFqhrGcwLhtbGF23jJwkGs+ysZlIN36f7TnEKEU7OyILEnktkP
 qVUI7Uf9UHIP7H6sOBWOcZhNH2l2cFx2WqCzE8QNFKiN3awk5MWB+5I41J7+evKqi4Yo
 NRKeocov/HEWV4enlRFlax9KhyKOl3Ssf3oSPbPlh5JYYOnztTWhrEJ4LU577jl82dlJ
 n7bVH4VtsB8CyeK3ZWjqSPvyGnf8ieIQ0/oq57izG99xqT42ULiIwhEnGy0Z4kNmXUBV
 ayxA==
X-Gm-Message-State: ACrzQf0xBEuv4wsArZgbvxERc2Yp6WBrSmtwIefal1hp1U52K5HrovaL
 vssGoGDAugG0ByY1kXg1Pd+5amcENCdG/xY3zHkrani3edpJ/iOYgaSHWgqRxjfQW9HsdBrRiQk
 hXSBHY3+BTd8P9ObXQy0ADtSZnRmWLJ/k57kT7DnfOi0tlVFFyNLs7HEHnSbp
X-Received: by 2002:a05:600c:4a89:b0:3cf:74ae:7481 with SMTP id
 b9-20020a05600c4a8900b003cf74ae7481mr1862542wmp.103.1667220769604; 
 Mon, 31 Oct 2022 05:52:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4iHHpzWlzzC+voxwOusc2C6rH4rDeaoihiyxWPSbAJoq9ymtLyLjs96CwujxzWKeB0gpJB2A==
X-Received: by 2002:a05:600c:4a89:b0:3cf:74ae:7481 with SMTP id
 b9-20020a05600c4a8900b003cf74ae7481mr1862526wmp.103.1667220769311; 
 Mon, 31 Oct 2022 05:52:49 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bq9-20020a5d5a09000000b0022ae0965a8asm7272538wrb.24.2022.10.31.05.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:48 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 43/86] vhost: expose vhost_virtqueue_start()
Message-ID: <20221031124928.128475-44-mst@redhat.com>
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


