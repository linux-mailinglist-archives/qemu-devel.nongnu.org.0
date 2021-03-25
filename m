Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BF8349528
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:17:22 +0100 (CET)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRjd-0007gd-12
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lPRf6-0002qM-8k; Thu, 25 Mar 2021 11:12:40 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:36674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lPRf1-00022K-IJ; Thu, 25 Mar 2021 11:12:39 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 15A3F2E16B0;
 Thu, 25 Mar 2021 18:12:29 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 1UX54ZKLeG-CScG9HV3; Thu, 25 Mar 2021 18:12:29 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1616685149; bh=hBzrSLh8wifxU2O9BusH9ecMk35sqRl8yAeQIM+ZXKo=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=QlYFKJjUJK9rfeIVNaggP5IM9dnY2aOTPfsLOBI1bfjpvP1io3S8O5oGBni7lk1iF
 dNpqiaYpOWqfSuCb8F+RrkuTwmrPzuXCqsKfAA4AOFLhLJ/uuBZqFDbz8jn2Oh+xzd
 oL8N/4Q2XZyuq6VLiKkKvCSRYD5l6XTX8Z4893Us=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8801::1:8])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ejfhBn90eX-CSpGF4iT; Thu, 25 Mar 2021 18:12:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] vhost-user-blk: use different event handlers on
 initialization
Date: Thu, 25 Mar 2021 18:12:15 +0300
Message-Id: <20210325151217.262793-2-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
References: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 raphael.norwitz@nutanix.com, yc-core@yandex-team.ru, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is useful to use different connect/disconnect event handlers
on device initialization and operation as seen from the further
commit fixing a bug on device initialization.

This patch refactors the code to make use of them: we don't rely any
more on the VM state for choosing how to cleanup the device, instead
we explicitly use the proper event handler depending on whether
the device has been initialized.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/block/vhost-user-blk.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index b870a50e6b20..1af95ec6aae7 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -362,7 +362,18 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
     vhost_dev_cleanup(&s->dev);
 }
 
-static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
+static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
+                                 bool realized);
+
+static void vhost_user_blk_event_realize(void *opaque, QEMUChrEvent event)
+{
+    vhost_user_blk_event(opaque, event, false);
+}
+
+static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent event)
+{
+    vhost_user_blk_event(opaque, event, true);
+}
 
 static void vhost_user_blk_chr_closed_bh(void *opaque)
 {
@@ -371,11 +382,12 @@ static void vhost_user_blk_chr_closed_bh(void *opaque)
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
 
     vhost_user_blk_disconnect(dev);
-    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_event,
-            NULL, opaque, NULL, true);
+    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL,
+            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
 }
 
-static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
+static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
+                                 bool realized)
 {
     DeviceState *dev = opaque;
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -406,7 +418,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
          * TODO: maybe it is a good idea to make the same fix
          * for other vhost-user devices.
          */
-        if (runstate_is_running()) {
+        if (realized) {
             AioContext *ctx = qemu_get_current_aio_context();
 
             qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
@@ -473,8 +485,9 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
     s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
     s->connected = false;
 
-    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL, vhost_user_blk_event,
-                             NULL, (void *)dev, NULL, true);
+    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
+                             vhost_user_blk_event_realize, NULL, (void *)dev,
+                             NULL, true);
 
 reconnect:
     if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
@@ -494,6 +507,10 @@ reconnect:
         goto reconnect;
     }
 
+    /* we're fully initialized, now we can operate, so change the handler */
+    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
+                             vhost_user_blk_event_oper, NULL, (void *)dev,
+                             NULL, true);
     return;
 
 virtio_err:
-- 
2.25.1


