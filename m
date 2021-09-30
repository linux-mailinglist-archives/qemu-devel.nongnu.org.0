Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EBF41DDD7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:43:17 +0200 (CEST)
Received: from localhost ([::1]:38026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyDM-0006kb-Vn
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy2B-0005nY-Gd
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy29-0002yM-ER
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7s1zVOLCa+EqNrNjVD5AqhiHtdWNtcDXT2NvEyfahq4=;
 b=K1bebCnIN3rQLoPtejrgzZA/6JPxyh6oqmGV1vRmvSdVwJS85oIN8Db8ZWC5hEKP+6X+KP
 0/vgx7YTrBafBo8zTMrQ4fic0LItZaaa0TqHjIo3y9LGBmNiIz4V7tDyqxZvfrh07P/e0O
 8buSP9lo9UJSNlVcUZxTh8m6R5gs8Co=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-yGFgfm6LOJSwsOPGKehGFA-1; Thu, 30 Sep 2021 11:31:39 -0400
X-MC-Unique: yGFgfm6LOJSwsOPGKehGFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7688C1006AA7;
 Thu, 30 Sep 2021 15:31:38 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9587D60CC6;
 Thu, 30 Sep 2021 15:30:56 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id F1906228288; Thu, 30 Sep 2021 11:30:47 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 09/13] virtiofsd: Specify size of notification buffer using
 config space
Date: Thu, 30 Sep 2021 11:30:33 -0400
Message-Id: <20210930153037.1194279-10-vgoyal@redhat.com>
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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

Daemon specifies size of notification buffer needed and that should be
done using config space.

Only ->notify_buf_size value of config space comes from daemon. Rest of
it is filled by qemu device emulation code.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
---
 hw/virtio/vhost-user-fs.c                  | 27 +++++++++++++++++++
 include/hw/virtio/vhost-user-fs.h          |  2 ++
 include/standard-headers/linux/virtio_fs.h |  2 ++
 tools/virtiofsd/fuse_virtio.c              | 31 ++++++++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 6bafcf0243..68a94708b4 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -36,15 +36,41 @@ static const int user_feature_bits[] = {
     VHOST_INVALID_FEATURE_BIT
 };
 
+static int vhost_user_fs_handle_config_change(struct vhost_dev *dev)
+{
+    return 0;
+}
+
+const VhostDevConfigOps fs_ops = {
+    .vhost_dev_config_notifier = vhost_user_fs_handle_config_change,
+};
+
 static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
     struct virtio_fs_config fscfg = {};
+    Error *local_err = NULL;
+    int ret;
+
+    /*
+     * As of now we only get notification buffer size from device. And that's
+     * needed only if notification queue is enabled.
+     */
+    if (fs->notify_enabled) {
+        ret = vhost_dev_get_config(&fs->vhost_dev, (uint8_t *)&fs->fscfg,
+                                   sizeof(struct virtio_fs_config),
+                                   &local_err);
+        if (ret) {
+            error_report_err(local_err);
+            return;
+        }
+    }
 
     memcpy((char *)fscfg.tag, fs->conf.tag,
            MIN(strlen(fs->conf.tag) + 1, sizeof(fscfg.tag)));
 
     virtio_stl_p(vdev, &fscfg.num_request_queues, fs->conf.num_request_queues);
+    virtio_stl_p(vdev, &fscfg.notify_buf_size, fs->fscfg.notify_buf_size);
 
     memcpy(config, &fscfg, sizeof(fscfg));
 }
@@ -316,6 +342,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
                 sizeof(struct virtio_fs_config));
 
     vuf_create_vqs(vdev, true);
+    vhost_dev_set_config_notifier(&fs->vhost_dev, &fs_ops);
     ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 95dc0dd402..3b114ee260 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -14,6 +14,7 @@
 #ifndef _QEMU_VHOST_USER_FS_H
 #define _QEMU_VHOST_USER_FS_H
 
+#include "standard-headers/linux/virtio_fs.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user.h"
@@ -37,6 +38,7 @@ struct VHostUserFS {
     struct vhost_virtqueue *vhost_vqs;
     struct vhost_dev vhost_dev;
     VhostUserState vhost_user;
+    struct virtio_fs_config fscfg;
     VirtQueue **req_vqs;
     VirtQueue *hiprio_vq;
     VirtQueue *notification_vq;
diff --git a/include/standard-headers/linux/virtio_fs.h b/include/standard-headers/linux/virtio_fs.h
index b7f015186e..867d18acf6 100644
--- a/include/standard-headers/linux/virtio_fs.h
+++ b/include/standard-headers/linux/virtio_fs.h
@@ -17,6 +17,8 @@ struct virtio_fs_config {
 
 	/* Number of request queues */
 	uint32_t num_request_queues;
+	/* Size of notification buffer */
+	uint32_t notify_buf_size;
 } QEMU_PACKED;
 
 /* For the id field in virtio_pci_shm_cap */
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index f5b87a508a..3b720c5d4a 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -856,6 +856,35 @@ static bool fv_queue_order(VuDev *dev, int qidx)
     return false;
 }
 
+static uint64_t fv_get_protocol_features(VuDev *dev)
+{
+    return 1ull << VHOST_USER_PROTOCOL_F_CONFIG;
+}
+
+static int fv_get_config(VuDev *dev, uint8_t *config, uint32_t len)
+{
+    struct virtio_fs_config fscfg = {};
+    unsigned notify_size, roundto = 64;
+    union fuse_notify_union {
+        struct fuse_notify_poll_wakeup_out  wakeup_out;
+        struct fuse_notify_inval_inode_out  inode_out;
+        struct fuse_notify_inval_entry_out  entry_out;
+        struct fuse_notify_delete_out       delete_out;
+        struct fuse_notify_store_out        store_out;
+        struct fuse_notify_retrieve_out     retrieve_out;
+    };
+
+    notify_size = sizeof(struct fuse_out_header) +
+              sizeof(union fuse_notify_union);
+    notify_size = ((notify_size + roundto) / roundto) * roundto;
+
+    fscfg.notify_buf_size = notify_size;
+    memcpy(config, &fscfg, len);
+    fuse_log(FUSE_LOG_DEBUG, "%s:Setting notify_buf_size=%d\n", __func__,
+             fscfg.notify_buf_size);
+    return 0;
+}
+
 static const VuDevIface fv_iface = {
     .get_features = fv_get_features,
     .set_features = fv_set_features,
@@ -864,6 +893,8 @@ static const VuDevIface fv_iface = {
     .queue_set_started = fv_queue_set_started,
 
     .queue_is_processed_in_order = fv_queue_order,
+    .get_protocol_features = fv_get_protocol_features,
+    .get_config = fv_get_config,
 };
 
 /*
-- 
2.31.1


