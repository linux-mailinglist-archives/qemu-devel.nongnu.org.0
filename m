Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF76E6B0F96
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:02:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8J-0004aB-Om; Wed, 08 Mar 2023 11:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8H-0004Yk-3c; Wed, 08 Mar 2023 11:59:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8E-00045l-5a; Wed, 08 Mar 2023 11:59:16 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A17C94010B;
 Wed,  8 Mar 2023 19:58:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 60AB013A;
 Wed,  8 Mar 2023 19:58:36 +0300 (MSK)
Received: (nullmailer pid 2098344 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 33/47] vhost-user-gpio: Configure vhost_dev when connecting
Date: Wed,  8 Mar 2023 19:57:36 +0300
Message-Id: <20230308165815.2098148-33-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

vhost_dev_cleanup(), called from vu_gpio_disconnect(), clears vhost_dev
so vhost-user-gpio must set the members of vhost_dev each time
connecting.

do_vhost_user_cleanup() should also acquire the pointer to vqs directly
from VHostUserGPIO instead of referring to vhost_dev as it can be called
after vhost_dev_cleanup().

Fixes: 27ba7b027f ("hw/virtio: add boilerplate for vhost-user-gpio device")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230130140320.77999-1-akihiko.odaki@daynix.com>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit daae36c13abc73cf1055abc2d33cb71cc5d34310)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/vhost-user-gpio.c         | 10 ++++++----
 include/hw/virtio/vhost-user-gpio.h |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 5851cb3bc9..72af765f33 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -16,6 +16,7 @@
 #include "trace.h"
 
 #define REALIZE_CONNECTION_RETRIES 3
+#define VHOST_NVQS 2
 
 /* Features required from VirtIO */
 static const int feature_bits[] = {
@@ -201,8 +202,7 @@ static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserGPIO *gpio)
 {
     virtio_delete_queue(gpio->command_vq);
     virtio_delete_queue(gpio->interrupt_vq);
-    g_free(gpio->vhost_dev.vqs);
-    gpio->vhost_dev.vqs = NULL;
+    g_free(gpio->vhost_vqs);
     virtio_cleanup(vdev);
     vhost_user_cleanup(&gpio->vhost_user);
 }
@@ -222,6 +222,9 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
     vhost_dev_set_config_notifier(vhost_dev, &gpio_ops);
     gpio->vhost_user.supports_config = true;
 
+    gpio->vhost_dev.nvqs = VHOST_NVQS;
+    gpio->vhost_dev.vqs = gpio->vhost_vqs;
+
     ret = vhost_dev_init(vhost_dev, &gpio->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
@@ -331,10 +334,9 @@ static void vu_gpio_device_realize(DeviceState *dev, Error **errp)
 
     virtio_init(vdev, VIRTIO_ID_GPIO, sizeof(gpio->config));
 
-    gpio->vhost_dev.nvqs = 2;
     gpio->command_vq = virtio_add_queue(vdev, 256, vu_gpio_handle_output);
     gpio->interrupt_vq = virtio_add_queue(vdev, 256, vu_gpio_handle_output);
-    gpio->vhost_dev.vqs = g_new0(struct vhost_virtqueue, gpio->vhost_dev.nvqs);
+    gpio->vhost_vqs = g_new0(struct vhost_virtqueue, VHOST_NVQS);
 
     gpio->connected = false;
 
diff --git a/include/hw/virtio/vhost-user-gpio.h b/include/hw/virtio/vhost-user-gpio.h
index 4fe9aeecc0..c17a5a351a 100644
--- a/include/hw/virtio/vhost-user-gpio.h
+++ b/include/hw/virtio/vhost-user-gpio.h
@@ -23,7 +23,7 @@ struct VHostUserGPIO {
     VirtIODevice parent_obj;
     CharBackend chardev;
     struct virtio_gpio_config config;
-    struct vhost_virtqueue *vhost_vq;
+    struct vhost_virtqueue *vhost_vqs;
     struct vhost_dev vhost_dev;
     VhostUserState vhost_user;
     VirtQueue *command_vq;
-- 
2.30.2


