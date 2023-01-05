Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2490565E814
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLg-0002JJ-N2; Thu, 05 Jan 2023 04:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLK-00025B-Ca
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLI-00073M-Fs
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JfZmU89DZylsMPxnHgpyHtp8Ce4+lUJ+AKt/F8kA8Qw=;
 b=auqAK1pT2P9L69ofOnxySeE2VAzV/M7zo8Go6U7LKUyOuc+H5yDKNXozl/WEGN6EeyL64l
 mDBrrjpuxPfFTQhZ3swtBeB7fJ4nNxCNtstTa/AdpyZRGmrPB045UXX27AVZ7a+7AXkFMN
 ac8QgsVBDNaPqucsGqUV5AwDJQv14oY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-xQ-Ct3wiPc2iab5idkEvyw-1; Thu, 05 Jan 2023 04:15:10 -0500
X-MC-Unique: xQ-Ct3wiPc2iab5idkEvyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c66-20020a1c3545000000b003d355c13229so750363wma.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JfZmU89DZylsMPxnHgpyHtp8Ce4+lUJ+AKt/F8kA8Qw=;
 b=sApO9gDmafBGo54lxGyEk6Quw6pDn0XFfi/OZPSKMrHA64+d9O/6Ah8fZyG3NBvM3q
 /2XoHUYKgnkz7qy5eBXnELuGvW2jLJ7zaOBRg+OXftZRIBP/2c/APH8uCQ2QlgcPnEWT
 cIDBYcfL2fFepNDA72Px6jJG0MfZSFodw5qApsbJ7wvyfUEUDV0cHskfZpr+zryFgeXq
 6jwM/LsnfaL5hNmupyU4pT4y0hFyzQwqzlBg5OcCdA0FVmhYpdE4QpYtv1YcRRRomQ0D
 5zJ7v/xx1F3hI2UssaEabPhcjWEL3Q8ku02TDTjBOor5V4e8oLe5K2Za/SJAK5w6sUto
 hLVQ==
X-Gm-Message-State: AFqh2ko3LdEG3bbYJuFEZ6MYnr3Qv9eYQFvV5rVVZ59u84RJl5PuTlBk
 9M6friXSWQzpICyd44yvWSv+L9cOe5VTr5y7d6EterV1CF7OrLohlRtbDjX5BYdHM6EO9QSGzc1
 0DlSLV/f7z8qiSqK4NG+XxLatUN8LsSr93sc8LfeBu1Od7WmwwFSMQ+N4g3CI
X-Received: by 2002:a05:600c:35c8:b0:3cf:85f7:bbc4 with SMTP id
 r8-20020a05600c35c800b003cf85f7bbc4mr36398884wmq.2.1672910109300; 
 Thu, 05 Jan 2023 01:15:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3lz1yLPvv7ypvAIQcBMHQ1eaWkR8S4Kp+WUfd6OVHPp55KFbzTyce0f/f9Yo8O7KzdwYgWw==
X-Received: by 2002:a05:600c:35c8:b0:3cf:85f7:bbc4 with SMTP id
 r8-20020a05600c35c800b003cf85f7bbc4mr36398855wmq.2.1672910108997; 
 Thu, 05 Jan 2023 01:15:08 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 k41-20020a05600c1ca900b003d974076f13sm1967760wms.3.2023.01.05.01.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:08 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, virtio-fs@redhat.com
Subject: [PULL 15/51] virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
Message-ID: <20230105091310.263867-16-mst@redhat.com>
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

From: Cindy Lu <lulu@redhat.com>

To support configure interrupt for vhost-vdpa
Introduce VIRTIO_CONFIG_IRQ_IDX -1 as configure interrupt's queue index,
Then we can reuse the functions guest_notifier_mask and guest_notifier_pending.
Add the check of queue index in these drivers, if the driver does not support
configure interrupt, the function will just return

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20221222070451.936503-2-lulu@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h     |  3 +++
 hw/display/vhost-user-gpu.c    | 18 ++++++++++++++++++
 hw/net/virtio-net.c            | 22 ++++++++++++++++++++--
 hw/virtio/vhost-user-fs.c      | 18 ++++++++++++++++++
 hw/virtio/vhost-user-gpio.c    | 10 ++++++++++
 hw/virtio/vhost-vsock-common.c | 18 ++++++++++++++++++
 hw/virtio/virtio-crypto.c      | 18 ++++++++++++++++++
 7 files changed, 105 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 24561e933a..8266d240cc 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -79,6 +79,9 @@ typedef struct VirtQueueElement
 
 #define VIRTIO_NO_VECTOR 0xffff
 
+/* special index value used internally for config irqs */
+#define VIRTIO_CONFIG_IRQ_IDX -1
+
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 19c0e20103..4380a5e672 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -486,6 +486,15 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&g->vhost->dev, idx);
 }
 
@@ -494,6 +503,15 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
 }
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b342d66160..0bfe454c23 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3325,6 +3325,15 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     } else {
         nc = qemu_get_subqueue(n->nic, vq2q(idx));
     }
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return false
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
 
@@ -3348,8 +3357,17 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     } else {
         nc = qemu_get_subqueue(n->nic, vq2q(idx));
     }
-    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
-                             vdev, idx, mask);
+    /*
+     *Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
+
+    vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
 }
 
 static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index d97b179e6f..f5049735ac 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -159,6 +159,15 @@ static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
 }
 
@@ -166,6 +175,15 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&fs->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index b7b82a1099..fe3da32c74 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -191,6 +191,16 @@ static void vu_gpio_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
+
     vhost_virtqueue_mask(&gpio->vhost_dev, vdev, idx, mask);
 }
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index d21c72b401..d2b5519d5a 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -127,6 +127,15 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
 }
 
@@ -135,6 +144,15 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 97da74e719..516425e26a 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -1182,6 +1182,15 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
 
     assert(vcrypto->vhost_started);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
     cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
 }
 
@@ -1192,6 +1201,15 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
 
     assert(vcrypto->vhost_started);
 
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
     return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
 }
 
-- 
MST


