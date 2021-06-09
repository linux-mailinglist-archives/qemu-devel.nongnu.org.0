Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF373A1A39
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:54:16 +0200 (CEST)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0X1-00087X-RY
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QS-0007X3-RW
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QN-0003Yh-Mu
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623253643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3FKQlHkGfNUWftxKfhvnk0jyAMxY9WtPIUYiEnccnU=;
 b=ROC5FkTg46AtIwdcFF6no+zMlBmUJ4swVZXzProQN49tXteSVm4ymcEXLKNQ1Dnmcsp2BI
 yB0tBxpA/GglEy+4/gdvJUmUkZck0GyGj7NNZwHVjFUdnT+8YNffXSoX8a2QG8Jaq5M+o4
 594QolWYf2XRnx74m5AZ5FfaehrWT8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-I-yG0DLDPTG-Yxp3AqPYGQ-1; Wed, 09 Jun 2021 11:47:21 -0400
X-MC-Unique: I-yG0DLDPTG-Yxp3AqPYGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 908D01922963;
 Wed,  9 Jun 2021 15:47:20 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36BB760C04;
 Wed,  9 Jun 2021 15:47:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/7] vhost-user-blk: Add Error parameter to
 vhost_user_blk_start()
Date: Wed,  9 Jun 2021 17:46:55 +0200
Message-Id: <20210609154658.350308-5-kwolf@redhat.com>
In-Reply-To: <20210609154658.350308-1-kwolf@redhat.com>
References: <20210609154658.350308-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: kwolf@redhat.com, raphael.norwitz@nutanix.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of letting the caller make up a meaningless error message, add
an Error parameter to allow reporting the real error.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/vhost-user-blk.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 0cb56baefb..e9382e152a 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -113,7 +113,7 @@ const VhostDevConfigOps blk_ops = {
     .vhost_dev_config_notifier = vhost_user_blk_handle_config_change,
 };
 
-static int vhost_user_blk_start(VirtIODevice *vdev)
+static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
@@ -121,19 +121,19 @@ static int vhost_user_blk_start(VirtIODevice *vdev)
     int i, ret;
 
     if (!k->set_guest_notifiers) {
-        error_report("binding does not support guest notifiers");
+        error_setg(errp, "binding does not support guest notifiers");
         return -ENOSYS;
     }
 
     ret = vhost_dev_enable_notifiers(&s->dev, vdev);
     if (ret < 0) {
-        error_report("Error enabling host notifiers: %d", -ret);
+        error_setg_errno(errp, -ret, "Error enabling host notifiers");
         return ret;
     }
 
     ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
     if (ret < 0) {
-        error_report("Error binding guest notifier: %d", -ret);
+        error_setg_errno(errp, -ret, "Error binding guest notifier");
         goto err_host_notifiers;
     }
 
@@ -141,27 +141,27 @@ static int vhost_user_blk_start(VirtIODevice *vdev)
 
     ret = vhost_dev_prepare_inflight(&s->dev, vdev);
     if (ret < 0) {
-        error_report("Error set inflight format: %d", -ret);
+        error_setg_errno(errp, -ret, "Error setting inflight format");
         goto err_guest_notifiers;
     }
 
     if (!s->inflight->addr) {
         ret = vhost_dev_get_inflight(&s->dev, s->queue_size, s->inflight);
         if (ret < 0) {
-            error_report("Error get inflight: %d", -ret);
+            error_setg_errno(errp, -ret, "Error getting inflight");
             goto err_guest_notifiers;
         }
     }
 
     ret = vhost_dev_set_inflight(&s->dev, s->inflight);
     if (ret < 0) {
-        error_report("Error set inflight: %d", -ret);
+        error_setg_errno(errp, -ret, "Error setting inflight");
         goto err_guest_notifiers;
     }
 
     ret = vhost_dev_start(&s->dev, vdev);
     if (ret < 0) {
-        error_report("Error starting vhost: %d", -ret);
+        error_setg_errno(errp, -ret, "Error starting vhost");
         goto err_guest_notifiers;
     }
     s->started_vu = true;
@@ -214,6 +214,7 @@ static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
     bool should_start = virtio_device_started(vdev, status);
+    Error *local_err = NULL;
     int ret;
 
     if (!vdev->vm_running) {
@@ -229,10 +230,9 @@ static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
     }
 
     if (should_start) {
-        ret = vhost_user_blk_start(vdev);
+        ret = vhost_user_blk_start(vdev, &local_err);
         if (ret < 0) {
-            error_report("vhost-user-blk: vhost start failed: %s",
-                         strerror(-ret));
+            error_reportf_err(local_err, "vhost-user-blk: vhost start failed: ");
             qemu_chr_fe_disconnect(&s->chardev);
         }
     } else {
@@ -270,6 +270,7 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
 static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    Error *local_err = NULL;
     int i, ret;
 
     if (!vdev->start_on_kick) {
@@ -287,10 +288,9 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
     /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so start
      * vhost here instead of waiting for .set_status().
      */
-    ret = vhost_user_blk_start(vdev);
+    ret = vhost_user_blk_start(vdev, &local_err);
     if (ret < 0) {
-        error_report("vhost-user-blk: vhost start failed: %s",
-                     strerror(-ret));
+        error_reportf_err(local_err, "vhost-user-blk: vhost start failed: ");
         qemu_chr_fe_disconnect(&s->chardev);
         return;
     }
@@ -340,9 +340,8 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
 
     /* restore vhost state */
     if (virtio_device_started(vdev, vdev->status)) {
-        ret = vhost_user_blk_start(vdev);
+        ret = vhost_user_blk_start(vdev, errp);
         if (ret < 0) {
-            error_setg_errno(errp, -ret, "vhost start failed");
             return ret;
         }
     }
-- 
2.30.2


