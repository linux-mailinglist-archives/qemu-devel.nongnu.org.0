Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54A65E790
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:21:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMk-0003iO-Gc; Thu, 05 Jan 2023 04:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMU-0003QF-6T
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMS-0007cc-Bi
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QRUIoZW03V+WuN5kcOEjsXyY4l1LhkTY1EinszEnRo=;
 b=M1TtKENQnqunhOXkbnBMplUrPBZaeX7YYwnScaJl+43tRvPNRtvsGtPkvIzOMnHIJ25zW9
 p4VHa1btE3a3BmoMtnAwh3BSorND7LoqI3ILYQnvCRJfiVjpXl/n9tDTAucDaYBzTu1OXP
 z+M/fXC81U61xWbI09x7byKlQMgKQ/M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-ysoN5BYdOYKu_zFh7Xtixw-1; Thu, 05 Jan 2023 04:16:30 -0500
X-MC-Unique: ysoN5BYdOYKu_zFh7Xtixw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso729839wmb.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QRUIoZW03V+WuN5kcOEjsXyY4l1LhkTY1EinszEnRo=;
 b=lLn0eIznH0AhjPocGmixIKiYDYNhLkhy+JYwbVcRY1pi64/yMVZnRKJsLWpK0uJNSF
 BUQlZOaFGlVMCQFriCLSh3EItOcs4nwjiczZpCyFauXwj5D7z/qLGCmVEdO5K8TNdXO/
 bMDTlk+l/ZqO8sNLyOTDCjyRAJXuhjbC+VsMaCdpo+kQYxnW2YgkJXaNDxdURm+TuW8D
 pnVfbzYmhQrHFIU/ACUBWmB8xnacwAwp38Bi0slhbBjhm8d7w4ywa475DoCQ5ZkGxPiq
 DvTq+XgjeIXJUB2P8ZJEfmlFyeITxnQvTE41fnuPOLRrpVC8t+hsusUpIECl34cg1k3B
 e4XQ==
X-Gm-Message-State: AFqh2kqWUnG9DS6+WbrJcjofrjTOcjVagc/dlFQzskbt7WJyisWOSGdY
 IZB2asX1XrpXEvf3Nfkj6X+4Atv0CeuuyDtIYm4nHieCrd7jIA045MvAGr9ElyfZUO9YdGy/T0S
 Z7iO8RWhsXmUWBLLD+MtkUlsf01XPq/WfFECG9JGs9kiLX04HGbY7QfpJ14HN
X-Received: by 2002:adf:ed51:0:b0:242:659f:9411 with SMTP id
 u17-20020adfed51000000b00242659f9411mr37296583wro.9.1672910188982; 
 Thu, 05 Jan 2023 01:16:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsE64Gl3PIzdb5GX+i1WqF7FA9FJqcGc+VSuCzQjjzVJmNB0IUmZq3SZIa5u52EZtNyBen5qA==
X-Received: by 2002:adf:ed51:0:b0:242:659f:9411 with SMTP id
 u17-20020adfed51000000b00242659f9411mr37296565wro.9.1672910188665; 
 Thu, 05 Jan 2023 01:16:28 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm1748193wmc.13.2023.01.05.01.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:28 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Longpeng <longpeng2@huawei.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 38/51] vdpa-dev: get iova range explicitly
Message-ID: <20230105091310.263867-39-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Longpeng <longpeng2@huawei.com>

In commit a585fad26b ("vdpa: request iova_range only once") we remove
GET_IOVA_RANGE form vhost_vdpa_init, the generic vdpa device will start
without iova_range populated, so the device won't work. Let's call
GET_IOVA_RANGE ioctl explicitly.

Fixes: a585fad26b2e6ccc ("vdpa: request iova_range only once")
Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20221224114848.3062-2-longpeng2@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h | 2 ++
 hw/virtio/vdpa-dev.c           | 9 +++++++++
 hw/virtio/vhost-vdpa.c         | 7 +++++++
 net/vhost-vdpa.c               | 8 --------
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 45b969a311..7997f09a8d 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -51,6 +51,8 @@ typedef struct vhost_vdpa {
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
 
+int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
+
 int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
                        hwaddr size, void *vaddr, bool readonly);
 int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index db6ba61152..01b41eb0f1 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -53,6 +53,7 @@ static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VhostVdpaDevice *v = VHOST_VDPA_DEVICE(vdev);
+    struct vhost_vdpa_iova_range iova_range;
     uint16_t max_queue_size;
     struct vhost_virtqueue *vqs;
     int i, ret;
@@ -108,6 +109,14 @@ static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
     v->dev.backend_features = 0;
     v->started = false;
 
+    ret = vhost_vdpa_get_iova_range(v->vhostfd, &iova_range);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: get iova range failed: %s",
+                   strerror(-ret));
+        goto free_vqs;
+    }
+    v->vdpa.iova_range = iova_range;
+
     ret = vhost_dev_init(&v->dev, &v->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
     if (ret < 0) {
         error_setg(errp, "vhost-vdpa-device: vhost initialization failed: %s",
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index fcb1e96316..c295a8c917 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -378,6 +378,13 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     return 0;
 }
 
+int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range)
+{
+    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
+
+    return ret < 0 ? -errno : 0;
+}
+
 /*
  * The use of this function is for requests that only need to be
  * applied once. Typically such request occurs at the beginning
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index b0c6109230..b6e1e84ed2 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -710,14 +710,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     return nc;
 }
 
-static int vhost_vdpa_get_iova_range(int fd,
-                                     struct vhost_vdpa_iova_range *iova_range)
-{
-    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
-
-    return ret < 0 ? -errno : 0;
-}
-
 static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **errp)
 {
     int ret = ioctl(fd, VHOST_GET_FEATURES, features);
-- 
MST


