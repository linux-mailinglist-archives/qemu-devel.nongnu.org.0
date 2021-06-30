Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826503B870D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:27:20 +0200 (CEST)
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyd3X-0005xM-Ir
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycg9-000382-Kl
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfk-00079M-Cu
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Etn6oUUzO4ANe9n/wA5G/QI1PGrS5csr8Jhf/5aX0G0=;
 b=BsIT3lo2bp56C+Ul0hFPMjDSDkIQuuCIqiW4FtpiWDXJJq8/LBpq7MtNDH9T0b/VxWmJDJ
 rrYYeWPD4ugAOn+8bjL3VbxdrBz0rT8rHDhlaxJQ7kN32FqOzAVf0zxmQbrgAescl7FW4a
 HEI7+L5PH9o7aNNpPzhzRtzP8u89CHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-Kk66EDYWMkSGL_tXQ0hrSA-1; Wed, 30 Jun 2021 12:02:41 -0400
X-MC-Unique: Kk66EDYWMkSGL_tXQ0hrSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11098800D55;
 Wed, 30 Jun 2021 16:02:40 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AA22604CD;
 Wed, 30 Jun 2021 16:02:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 23/24] vhost-user-blk: Factor out
 vhost_user_blk_realize_connect()
Date: Wed, 30 Jun 2021 18:02:05 +0200
Message-Id: <20210630160206.276439-24-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is the part that we will want to retry if the connection
is lost during initialisation, so factor it out to keep the following
patch simpler.

The error path for vhost_dev_get_config() forgot disconnecting the
chardev, add this while touching the code.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210609154658.350308-7-kwolf@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/vhost-user-blk.c | 48 ++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 3770f715da..e49d2e4c83 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -423,6 +423,36 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
     }
 }
 
+static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
+{
+    DeviceState *dev = &s->parent_obj.parent_obj;
+    int ret;
+
+    s->connected = false;
+
+    ret = qemu_chr_fe_wait_connected(&s->chardev, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = vhost_user_blk_connect(dev, errp);
+    if (ret < 0) {
+        qemu_chr_fe_disconnect(&s->chardev);
+        return ret;
+    }
+    assert(s->connected);
+
+    ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
+                               sizeof(struct virtio_blk_config), errp);
+    if (ret < 0) {
+        qemu_chr_fe_disconnect(&s->chardev);
+        vhost_dev_cleanup(&s->dev);
+        return ret;
+    }
+
+    return 0;
+}
+
 static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -467,22 +497,10 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
 
     s->inflight = g_new0(struct vhost_inflight, 1);
     s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
-    s->connected = false;
-
-    if (qemu_chr_fe_wait_connected(&s->chardev, errp) < 0) {
-        goto virtio_err;
-    }
 
-    if (vhost_user_blk_connect(dev, errp) < 0) {
-        qemu_chr_fe_disconnect(&s->chardev);
-        goto virtio_err;
-    }
-    assert(s->connected);
-
-    ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
-                               sizeof(struct virtio_blk_config), errp);
+    ret = vhost_user_blk_realize_connect(s, errp);
     if (ret < 0) {
-        goto vhost_err;
+        goto virtio_err;
     }
 
     /* we're fully initialized, now we can operate, so add the handler */
@@ -491,8 +509,6 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
                              NULL, true);
     return;
 
-vhost_err:
-    vhost_dev_cleanup(&s->dev);
 virtio_err:
     g_free(s->vhost_vqs);
     s->vhost_vqs = NULL;
-- 
2.31.1


