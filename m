Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D24B368570
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 19:05:30 +0200 (CEST)
Received: from localhost ([::1]:42540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcld-00043k-CO
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 13:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZcj4-000251-Mb
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 13:02:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZciz-0001SF-8Z
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 13:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619110964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvvvm1DLQfQY2HB7/05dSUPKs9vhVP50ZFC/Yz784qU=;
 b=b69uFDhYH299QMwBq7R5NswwPLqr3xkir4N4jSwrranHOO/kPKEnDWiBvWHZfI5Ra60755
 my7o+5ATWbqF2rLQ+jAKrRJ+4JGz4t8PBtG60Lxc85pJ/v3Gnx6x/QGrqyc9C9Mnz/BcN/
 1UuHwbzfISuhMDC6ZXOXBcAQ+GPy9PQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-2LryIS5WOaS6yanXsKeT-g-1; Thu, 22 Apr 2021 13:02:42 -0400
X-MC-Unique: 2LryIS5WOaS6yanXsKeT-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA88187504E;
 Thu, 22 Apr 2021 17:02:40 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-159.ams2.redhat.com [10.36.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85BE719C45;
 Thu, 22 Apr 2021 17:02:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/5] vhost-user-blk: Use Error more consistently
Date: Thu, 22 Apr 2021 19:02:18 +0200
Message-Id: <20210422170221.285006-3-kwolf@redhat.com>
In-Reply-To: <20210422170221.285006-1-kwolf@redhat.com>
References: <20210422170221.285006-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, den-plotnikov@yandex-team.ru, mst@redhat.com,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that vhost_user_blk_connect() is not called from an event handler
any more, but directly from vhost_user_blk_device_realize(), we don't
have to resort to error_report() any more, but can use Error again.

With Error, the callers are responsible for adding context if necessary
(such as the "-device" option the error refers to). Additional prefixes
are redundant and better omitted.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/vhost-user-blk.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index e824b0a759..8422a29470 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -311,7 +311,7 @@ static void vhost_user_blk_reset(VirtIODevice *vdev)
     vhost_dev_free_inflight(s->inflight);
 }
 
-static int vhost_user_blk_connect(DeviceState *dev)
+static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
@@ -331,8 +331,7 @@ static int vhost_user_blk_connect(DeviceState *dev)
 
     ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0);
     if (ret < 0) {
-        error_report("vhost-user-blk: vhost initialization failed: %s",
-                     strerror(-ret));
+        error_setg_errno(errp, -ret, "vhost initialization failed");
         return ret;
     }
 
@@ -340,8 +339,7 @@ static int vhost_user_blk_connect(DeviceState *dev)
     if (virtio_device_started(vdev, vdev->status)) {
         ret = vhost_user_blk_start(vdev);
         if (ret < 0) {
-            error_report("vhost-user-blk: vhost start failed: %s",
-                         strerror(-ret));
+            error_setg_errno(errp, -ret, "vhost start failed");
             return ret;
         }
     }
@@ -380,10 +378,12 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
     DeviceState *dev = opaque;
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    Error *local_err = NULL;
 
     switch (event) {
     case CHR_EVENT_OPENED:
-        if (vhost_user_blk_connect(dev) < 0) {
+        if (vhost_user_blk_connect(dev, &local_err) < 0) {
+            error_report_err(local_err);
             qemu_chr_fe_disconnect(&s->chardev);
             return;
         }
@@ -427,7 +427,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
     int i, ret;
 
     if (!s->chardev.chr) {
-        error_setg(errp, "vhost-user-blk: chardev is mandatory");
+        error_setg(errp, "chardev is mandatory");
         return;
     }
 
@@ -435,16 +435,16 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         s->num_queues = 1;
     }
     if (!s->num_queues || s->num_queues > VIRTIO_QUEUE_MAX) {
-        error_setg(errp, "vhost-user-blk: invalid number of IO queues");
+        error_setg(errp, "invalid number of IO queues");
         return;
     }
 
     if (!s->queue_size) {
-        error_setg(errp, "vhost-user-blk: queue size must be non-zero");
+        error_setg(errp, "queue size must be non-zero");
         return;
     }
     if (s->queue_size > VIRTQUEUE_MAX_SIZE) {
-        error_setg(errp, "vhost-user-blk: queue size must not exceed %d",
+        error_setg(errp, "queue size must not exceed %d",
                    VIRTQUEUE_MAX_SIZE);
         return;
     }
@@ -471,7 +471,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         goto virtio_err;
     }
 
-    if (vhost_user_blk_connect(dev) < 0) {
+    if (vhost_user_blk_connect(dev, errp) < 0) {
         qemu_chr_fe_disconnect(&s->chardev);
         goto virtio_err;
     }
-- 
2.30.2


