Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC441DDBC
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:39:31 +0200 (CEST)
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVy9i-0000Mj-Ie
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy23-0005Ze-E0
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy20-0002rA-HY
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4RwjsBN+VD0misqMm0HefaBLHKqBs/oGV+OSDFCfxU=;
 b=aSi1pKJLeLtjOjT/ZXOpEIzDzxWtH5KG/Dhwl5OC4SIhGZ54ymiTehfsFC7WIFDjTHUcIt
 KxNqjaQGPhfpkK9bqgOveO4TxEqKR2j30NVMWxvFdgUD6CW9vB0qjL+3XY9PkXNUd6cFyc
 kUxmFoSMYsEElhNuqo37s6zp73rQHgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-e9qtjP_VPByfx6WuSDdhCQ-1; Thu, 30 Sep 2021 11:31:30 -0400
X-MC-Unique: e9qtjP_VPByfx6WuSDdhCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09DD6DF8A3;
 Thu, 30 Sep 2021 15:31:29 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0D6F60657;
 Thu, 30 Sep 2021 15:30:48 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E33B4228285; Thu, 30 Sep 2021 11:30:47 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 06/13] vhost-user-fs: Use helpers to create/cleanup virtqueue
Date: Thu, 30 Sep 2021 11:30:30 -0400
Message-Id: <20210930153037.1194279-7-vgoyal@redhat.com>
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jaggel@bu.edu, iangelak@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add helpers to create/cleanup virtuqueues and use those helpers. I will
need to reconfigure queues in later patches and using helpers will allow
reusing the code.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 hw/virtio/vhost-user-fs.c | 87 +++++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 35 deletions(-)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index c595957983..d1efbc5b18 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -139,6 +139,55 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
     }
 }
 
+static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /*
+     * Not normally called; it's the daemon that handles the queue;
+     * however virtio's cleanup path can call this.
+     */
+}
+
+static void vuf_create_vqs(VirtIODevice *vdev)
+{
+    VHostUserFS *fs = VHOST_USER_FS(vdev);
+    unsigned int i;
+
+    /* Hiprio queue */
+    fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size,
+                                     vuf_handle_output);
+
+    /* Request queues */
+    fs->req_vqs = g_new(VirtQueue *, fs->conf.num_request_queues);
+    for (i = 0; i < fs->conf.num_request_queues; i++) {
+        fs->req_vqs[i] = virtio_add_queue(vdev, fs->conf.queue_size,
+                                          vuf_handle_output);
+    }
+
+    /* 1 high prio queue, plus the number configured */
+    fs->vhost_dev.nvqs = 1 + fs->conf.num_request_queues;
+    fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
+}
+
+static void vuf_cleanup_vqs(VirtIODevice *vdev)
+{
+    VHostUserFS *fs = VHOST_USER_FS(vdev);
+    unsigned int i;
+
+    virtio_delete_queue(fs->hiprio_vq);
+    fs->hiprio_vq = NULL;
+
+    for (i = 0; i < fs->conf.num_request_queues; i++) {
+        virtio_delete_queue(fs->req_vqs[i]);
+    }
+
+    g_free(fs->req_vqs);
+    fs->req_vqs = NULL;
+
+    fs->vhost_dev.nvqs = 0;
+    g_free(fs->vhost_dev.vqs);
+    fs->vhost_dev.vqs = NULL;
+}
+
 static uint64_t vuf_get_features(VirtIODevice *vdev,
                                  uint64_t features,
                                  Error **errp)
@@ -148,14 +197,6 @@ static uint64_t vuf_get_features(VirtIODevice *vdev,
     return vhost_get_features(&fs->vhost_dev, user_feature_bits, features);
 }
 
-static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
-{
-    /*
-     * Not normally called; it's the daemon that handles the queue;
-     * however virtio's cleanup path can call this.
-     */
-}
-
 static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
                                             bool mask)
 {
@@ -175,7 +216,6 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserFS *fs = VHOST_USER_FS(dev);
-    unsigned int i;
     size_t len;
     int ret;
 
@@ -222,18 +262,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
     virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
                 sizeof(struct virtio_fs_config));
 
-    /* Hiprio queue */
-    fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
-
-    /* Request queues */
-    fs->req_vqs = g_new(VirtQueue *, fs->conf.num_request_queues);
-    for (i = 0; i < fs->conf.num_request_queues; i++) {
-        fs->req_vqs[i] = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
-    }
-
-    /* 1 high prio queue, plus the number configured */
-    fs->vhost_dev.nvqs = 1 + fs->conf.num_request_queues;
-    fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
+    vuf_create_vqs(vdev);
     ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
@@ -244,13 +273,8 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
 
 err_virtio:
     vhost_user_cleanup(&fs->vhost_user);
-    virtio_delete_queue(fs->hiprio_vq);
-    for (i = 0; i < fs->conf.num_request_queues; i++) {
-        virtio_delete_queue(fs->req_vqs[i]);
-    }
-    g_free(fs->req_vqs);
+    vuf_cleanup_vqs(vdev);
     virtio_cleanup(vdev);
-    g_free(fs->vhost_dev.vqs);
     return;
 }
 
@@ -258,7 +282,6 @@ static void vuf_device_unrealize(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserFS *fs = VHOST_USER_FS(dev);
-    int i;
 
     /* This will stop vhost backend if appropriate. */
     vuf_set_status(vdev, 0);
@@ -267,14 +290,8 @@ static void vuf_device_unrealize(DeviceState *dev)
 
     vhost_user_cleanup(&fs->vhost_user);
 
-    virtio_delete_queue(fs->hiprio_vq);
-    for (i = 0; i < fs->conf.num_request_queues; i++) {
-        virtio_delete_queue(fs->req_vqs[i]);
-    }
-    g_free(fs->req_vqs);
+    vuf_cleanup_vqs(vdev);
     virtio_cleanup(vdev);
-    g_free(fs->vhost_dev.vqs);
-    fs->vhost_dev.vqs = NULL;
 }
 
 static const VMStateDescription vuf_vmstate = {
-- 
2.31.1


