Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3126B0F9C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:03:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8Y-0004pE-Q4; Wed, 08 Mar 2023 11:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8G-0004YW-VB; Wed, 08 Mar 2023 11:59:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8E-00045m-3X; Wed, 08 Mar 2023 11:59:16 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D03F94010C;
 Wed,  8 Mar 2023 19:58:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 990D292;
 Wed,  8 Mar 2023 19:58:36 +0300 (MSK)
Received: (nullmailer pid 2098346 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 34/47] vhost-user-i2c: Back up vqs before cleaning up vhost_dev
Date: Wed,  8 Mar 2023 19:57:37 +0300
Message-Id: <20230308165815.2098148-34-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
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

vhost_dev_cleanup() clears vhost_dev so back up its vqs member to free
the memory pointed by the member.

Fixes: 7221d3b634 ("hw/virtio: add boilerplate for vhost-user-i2c device")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230130140435.78049-1-akihiko.odaki@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 0126793bee853e7c134627f51d2de5428a612e99)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/vhost-user-i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 1c9f3d20dc..2634d81539 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -143,8 +143,6 @@ static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserI2C *i2c)
     vhost_user_cleanup(&i2c->vhost_user);
     virtio_delete_queue(i2c->vq);
     virtio_cleanup(vdev);
-    g_free(i2c->vhost_dev.vqs);
-    i2c->vhost_dev.vqs = NULL;
 }
 
 static int vu_i2c_connect(DeviceState *dev)
@@ -228,6 +226,7 @@ static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
     ret = vhost_dev_init(&i2c->vhost_dev, &i2c->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
+        g_free(i2c->vhost_dev.vqs);
         do_vhost_user_cleanup(vdev, i2c);
     }
 
@@ -239,10 +238,12 @@ static void vu_i2c_device_unrealize(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserI2C *i2c = VHOST_USER_I2C(dev);
+    struct vhost_virtqueue *vhost_vqs = i2c->vhost_dev.vqs;
 
     /* This will stop vhost backend if appropriate. */
     vu_i2c_set_status(vdev, 0);
     vhost_dev_cleanup(&i2c->vhost_dev);
+    g_free(vhost_vqs);
     do_vhost_user_cleanup(vdev, i2c);
 }
 
-- 
2.30.2


