Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2520C62034F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:08:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAwo-0001UR-Qs; Mon, 07 Nov 2022 17:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwm-0001QE-Ix
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwl-0003tC-1w
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iblFjKpaXIHtiQIUGFA8gXnv2AWbCgLXsgXlMDiv4m8=;
 b=MYWoB7bK+sfI7qr9FhdUiryUZ6nJuWZx54eH3TQpoqgmRljT+Qd6gjAvaNT6KeUY1ubG+W
 UjCVsMrvZS4hEAqjumf3mVPGZY0igDHUm2moCwJJlxCWkBNmXLnCC1Y1ErLGdKhm2QAfPo
 K8T8qdd4vE07GYx08I00Bhj60+y0GmQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-114-heiiHp_iNKal3enA6e7sOA-1; Mon, 07 Nov 2022 17:50:25 -0500
X-MC-Unique: heiiHp_iNKal3enA6e7sOA-1
Received: by mail-qv1-f69.google.com with SMTP id
 nn2-20020a056214358200b004bb7bc3dfdcso8678773qvb.23
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iblFjKpaXIHtiQIUGFA8gXnv2AWbCgLXsgXlMDiv4m8=;
 b=2xC0oBQ81CmEvFguZgHJqfSZAR1Obh5MEm8cImaAy4yFYecIhvGgncJAGMKKsm1pVm
 EDtV8uaz6xpyr7zZrMKNyz9UjNqwq1JORAlEWgPvaYPtIErro6YR5qStsDw3Q3iQzLVR
 7qHgrjrSBtIdnn6T7mB382XWRomu04eUZWdK0YAbq1aowlTzAtAU11BB0z7NZ/n5Zbg5
 XJRPDQdeGvH5VS6+svFSzHJxQOc248Z9FLMcCwWpN8yCredhRdskwiipZRYBlDoWLvnh
 QeJ0d04nDa1iUMzRbyqDWudEGuqL6HZ66dbadzlg6HvKaN8M6on98s9wGa2Jsumn1JjI
 1Ozw==
X-Gm-Message-State: ACrzQf3yjCQ32+Ipqs9rT8j/LRugaCvGhAhBYjDGKwES3VdpWxiMcoVY
 B7GOFQZmNkGOGPGU+R3UJHct3RfMaj0nD270xfgwP7ka2Nleo3PtGtiNRW5R6+89LlTMF3sBm+9
 cGtG0KyPpWONqrDwxrayxSeisbuBbkYYqWuVKlTKgOERVfmWu+pCraNQgMrAu
X-Received: by 2002:a05:620a:1263:b0:6fa:15e:26a4 with SMTP id
 b3-20020a05620a126300b006fa015e26a4mr36539907qkl.596.1667861424803; 
 Mon, 07 Nov 2022 14:50:24 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6BLoGjCykk60BfCtJBsJhcWovveQ+n1pPIL4SOX+r6D7xnw23ffmczPdF7oLXoX/mNDc5odw==
X-Received: by 2002:a05:620a:1263:b0:6fa:15e:26a4 with SMTP id
 b3-20020a05620a126300b006fa015e26a4mr36539886qkl.596.1667861424471; 
 Mon, 07 Nov 2022 14:50:24 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 cb11-20020a05622a1f8b00b0038d9555b580sm6914328qtb.44.2022.11.07.14.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:24 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 34/83] vhost: expose vhost_virtqueue_stop()
Message-ID: <20221107224600.934080-35-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


