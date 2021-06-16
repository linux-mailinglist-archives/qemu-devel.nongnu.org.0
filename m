Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BD83AA581
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:44:05 +0200 (CEST)
Received: from localhost ([::1]:52144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcOJ-0007iQ-Gr
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbOf-00035c-Cz
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbOS-0000bL-3s
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623872406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ziP+ZNfLLgkOxkWbiKlfs4e3G8pX5HQXUWLVQFFhlY=;
 b=AufS4mTDSGEDXfWdl0j+9BVx+USUY6Fsm6i8COZip6TPmDlMtFmVrUWp1IOE00lZ7zKkdq
 q9kIO18vIJrKFaxGL6SEMuuNdt7Vbgh81kv8p2KXnqbpCtmG/UqoIb2gO2uBgFIZ+Mnzk4
 5j6qHjK/RU4dMViAc7Mf+D7/CpZlYwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-hedHqTQHP5-JjjxnDuFKkw-1; Wed, 16 Jun 2021 15:40:02 -0400
X-MC-Unique: hedHqTQHP5-JjjxnDuFKkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90E119F936
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 19:40:01 +0000 (UTC)
Received: from iangelak.remote.csb (ovpn-113-44.rdu2.redhat.com [10.10.113.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38A6060BF1;
 Wed, 16 Jun 2021 19:39:54 +0000 (UTC)
From: Ioannis Angelakopoulos <iangelak@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 3/6] virtiofsd: Specify size of notification buffer using
 config space
Date: Wed, 16 Jun 2021 15:39:18 -0400
Message-Id: <20210616193921.608720-4-iangelak@redhat.com>
In-Reply-To: <20210616193921.608720-1-iangelak@redhat.com>
References: <20210616193921.608720-1-iangelak@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=iangelak@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=iangelak@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Jun 2021 16:41:47 -0400
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
Cc: iangelak@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

Daemon specifies size of notification buffer needed and that should be
done using config space.

Only ->notify_buf_size value of config space comes from daemon. Rest of
it is filled by qemu device emulation code.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
---
 hw/virtio/vhost-user-fs.c                  | 27 +++++++++++++++++++
 include/hw/virtio/vhost-user-fs.h          |  4 ++-
 include/standard-headers/linux/virtio_fs.h |  2 ++
 tools/virtiofsd/fuse_virtio.c              | 31 ++++++++++++++++++++++
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index c7fd5f3123..f510bd8029 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -36,15 +36,40 @@ static const int user_feature_bits[] = {
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
+    int ret;
+
+    /*
+     * As of now we only get notification buffer size from device. And that's
+     * needed only if notification queue is enabled.
+     */
+    if (fs->notify_enabled) {
+        ret = vhost_dev_get_config(&fs->vhost_dev, (uint8_t *)&fs->fscfg,
+                                   sizeof(struct virtio_fs_config));
+        if (ret < 0) {
+            error_report("vhost-user-fs: get device config space failed."
+                         " ret=%d", ret);
+            return;
+        }
+    }
 
     memcpy((char *)fscfg.tag, fs->conf.tag,
            MIN(strlen(fs->conf.tag) + 1, sizeof(fscfg.tag)));
 
     virtio_stl_p(vdev, &fscfg.num_request_queues, fs->conf.num_request_queues);
+    virtio_stl_p(vdev, &fscfg.notify_buf_size, fs->fscfg.notify_buf_size);
 
     memcpy(config, &fscfg, sizeof(fscfg));
 }
@@ -255,6 +280,8 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
     /* 1 high prio queue, 1 notification queue plus the number configured */
     fs->vhost_dev.nvqs = 2 + fs->conf.num_request_queues;
     fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
+
+    vhost_dev_set_config_notifier(&fs->vhost_dev, &fs_ops);
     ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0);
     if (ret < 0) {
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 13e2cbc48e..03780322ee 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -14,6 +14,7 @@
 #ifndef _QEMU_VHOST_USER_FS_H
 #define _QEMU_VHOST_USER_FS_H
 
+#include "standard-headers/linux/virtio_fs.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user.h"
@@ -37,11 +38,12 @@ struct VHostUserFS {
     struct vhost_virtqueue *vhost_vqs;
     struct vhost_dev vhost_dev;
     VhostUserState vhost_user;
+    struct virtio_fs_config fscfg;
     VirtQueue **req_vqs;
     VirtQueue *hiprio_vq;
     int32_t bootindex;
-    bool notify_enabled;
     /*< public >*/
+    bool notify_enabled;
 };
 
 #endif /* _QEMU_VHOST_USER_FS_H */
diff --git a/include/standard-headers/linux/virtio_fs.h b/include/standard-headers/linux/virtio_fs.h
index 6383d723a3..8f0075269a 100644
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
index 3ff4cc1430..f16801bbee 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -851,6 +851,35 @@ static bool fv_queue_order(VuDev *dev, int qidx)
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
@@ -859,6 +888,8 @@ static const VuDevIface fv_iface = {
     .queue_set_started = fv_queue_set_started,
 
     .queue_is_processed_in_order = fv_queue_order,
+    .get_protocol_features = fv_get_protocol_features,
+    .get_config = fv_get_config,
 };
 
 /*
-- 
2.27.0


