Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A444D94F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:41:39 +0100 (CET)
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCCo-0001hk-4W
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:41:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5e-0004TG-67; Thu, 11 Nov 2021 10:34:14 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:40820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5b-00043B-HK; Thu, 11 Nov 2021 10:34:13 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 6B4142E0F0C;
 Thu, 11 Nov 2021 18:34:04 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 yQdTineD7N-Y3sauMY9; Thu, 11 Nov 2021 18:34:04 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636644844; bh=onBHYclEWqTrLTuKxrhI0qfx+uh/6jIvyO6vsNh5V+Y=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=PPeICqI8mBvlFzMqe+wp5rWKsTRJuXl46SoLjmQHgMlMvnbTx7be8vZB/ymZRLB4+
 LDW4px5QoMqIvjlw5KZPAvCplIvf4s+XeAMvv3Nojud7OsQ7WLlu3NA4Vg2af4/TVd
 Bpm78yKGc4rSfnIwM0Db7yfsJi/LE/oT6kPtbQJs=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8830::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 WgGv8YbvMJ-Y3wCu82d; Thu, 11 Nov 2021 18:34:03 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] vhost-vdpa: stick to -errno error return convention
Date: Thu, 11 Nov 2021 18:33:51 +0300
Message-Id: <20211111153354.18807-8-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111153354.18807-1-rvkagan@yandex-team.ru>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Almost all VhostOps methods in vdpa_ops follow the convention of
returning negated errno on error.

Adjust the few that don't.  To that end, rework vhost_vdpa_add_status to
check if setting of the requested status bits has succeeded and return
the respective error code it hasn't, and propagate the error codes
wherever it's appropriate.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 hw/virtio/vhost-vdpa.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 0d8051426c..a3b885902a 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -292,18 +292,34 @@ static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
     return ret < 0 ? -errno : ret;
 }
 
-static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
+static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
 {
     uint8_t s;
+    int ret;
 
     trace_vhost_vdpa_add_status(dev, status);
-    if (vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s)) {
-        return;
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
+    if (ret < 0) {
+        return ret;
     }
 
     s |= status;
 
-    vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (!(s & status)) {
+        return -EIO;
+    }
+
+    return 0;
 }
 
 static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
@@ -484,7 +500,7 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
         }
     }
     if (mem->padding) {
-        return -1;
+        return -EINVAL;
     }
 
     return 0;
@@ -501,14 +517,11 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
 
     trace_vhost_vdpa_set_features(dev, features);
     ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
-    uint8_t status = 0;
     if (ret) {
         return ret;
     }
-    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
-    vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
 
-    return !(status & VIRTIO_CONFIG_S_FEATURES_OK);
+    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
 }
 
 static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
@@ -650,12 +663,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     }
 
     if (started) {
-        uint8_t status = 0;
         memory_listener_register(&v->listener, &address_space_memory);
-        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
-        vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
-
-        return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
+        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-- 
2.33.1


