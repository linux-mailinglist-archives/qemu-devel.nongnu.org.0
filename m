Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15031567F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:08:10 +0100 (CET)
Received: from localhost ([::1]:50456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YMr-0004oY-VO
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YJQ-0002vs-5a
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YJM-00021j-M9
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uw/8KQdYFFex4P9QuFrS4i6Y1ZCBVpqmZItpysSQRoI=;
 b=Tn+9+b1VyVoxDiLfIVvg15Ktn/GT5lHVlU+wq7zrrCeWTFUYKpxaDXuqHe9cdu4anAkBST
 aMPLyyPdOUO0vm2bO7BktNooDJdxbSG+JW77B6EXHuuTza7JEnz2mdDp0TlooRhaB7WjiN
 IZ/U9amqaAzBEaR53mDiq1LnjZRLgas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-_i-OJdm6PWyRQxSKPBiriQ-1; Tue, 09 Feb 2021 14:04:27 -0500
X-MC-Unique: _i-OJdm6PWyRQxSKPBiriQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EDA5106BB3A
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:04:26 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E352F60C04;
 Tue,  9 Feb 2021 19:04:14 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 07/24] DAX: virtio-fs: Add vhost-user slave commands for
 mapping
Date: Tue,  9 Feb 2021 19:02:07 +0000
Message-Id: <20210209190224.62827-8-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-1-dgilbert@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The daemon may request that fd's be mapped into the virtio-fs cache
visible to the guest.
These mappings are triggered by commands sent over the slave fd
from the daemon.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/interop/vhost-user.rst               | 20 +++++++++++++++++++
 hw/virtio/vhost-user-fs.c                 | 14 +++++++++++++
 hw/virtio/vhost-user.c                    | 14 +++++++++++++
 include/hw/virtio/vhost-user-fs.h         | 24 +++++++++++++++++++++++
 subprojects/libvhost-user/libvhost-user.h |  2 ++
 5 files changed, 74 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index d6085f7045..1deedd3407 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1432,6 +1432,26 @@ Slave message types
 
   The state.num field is currently reserved and must be set to 0.
 
+``VHOST_USER_SLAVE_FS_MAP``
+  :id: 6
+  :equivalent ioctl: N/A
+  :slave payload: fd + n * (offset + address + len)
+  :master payload: N/A
+
+  Requests that the QEMU mmap the given fd into the virtio-fs cache;
+  multiple chunks can be mapped in one command.
+  A reply is generated indicating whether mapping succeeded.
+
+``VHOST_USER_SLAVE_FS_UNMAP``
+  :id: 7
+  :equivalent ioctl: N/A
+  :slave payload: n * (address + len)
+  :master payload: N/A
+
+  Requests that the QEMU un-mmap the given range in the virtio-fs cache;
+  multiple chunks can be unmapped in one command.
+  A reply is generated indicating whether unmapping succeeded.
+
 .. _reply_ack:
 
 VHOST_USER_PROTOCOL_F_REPLY_ACK
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index b077d8e705..78401d2ff1 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -34,6 +34,20 @@
 #define DAX_WINDOW_PROT PROT_NONE
 #endif
 
+uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
+                                 int fd)
+{
+    /* TODO */
+    return (uint64_t)-1;
+}
+
+uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev,
+                                   VhostUserFSSlaveMsg *sm)
+{
+    /* TODO */
+    return (uint64_t)-1;
+}
+
 static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 13789cc55e..21e40ff91a 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -12,6 +12,7 @@
 #include "qapi/error.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user.h"
+#include "hw/virtio/vhost-user-fs.h"
 #include "hw/virtio/vhost-backend.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-net.h"
@@ -132,6 +133,10 @@ typedef enum VhostUserSlaveRequest {
     VHOST_USER_SLAVE_IOTLB_MSG = 1,
     VHOST_USER_SLAVE_CONFIG_CHANGE_MSG = 2,
     VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
+    VHOST_USER_SLAVE_VRING_CALL = 4,
+    VHOST_USER_SLAVE_VRING_ERR = 5,
+    VHOST_USER_SLAVE_FS_MAP = 6,
+    VHOST_USER_SLAVE_FS_UNMAP = 7,
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
@@ -218,6 +223,7 @@ typedef union {
         VhostUserCryptoSession session;
         VhostUserVringArea area;
         VhostUserInflight inflight;
+        VhostUserFSSlaveMsg fs;
 } VhostUserPayload;
 
 typedef struct VhostUserMsg {
@@ -1472,6 +1478,14 @@ static void slave_read(void *opaque)
         ret = vhost_user_slave_handle_vring_host_notifier(dev, &payload.area,
                                                           fd[0]);
         break;
+#ifdef CONFIG_VHOST_USER_FS
+    case VHOST_USER_SLAVE_FS_MAP:
+        ret = vhost_user_fs_slave_map(dev, &payload.fs, fd[0]);
+        break;
+    case VHOST_USER_SLAVE_FS_UNMAP:
+        ret = vhost_user_fs_slave_unmap(dev, &payload.fs);
+        break;
+#endif
     default:
         error_report("Received unexpected msg type: %d.", hdr.request);
         ret = (uint64_t)-EINVAL;
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 04596799e3..25e14ab17a 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -23,6 +23,24 @@
 #define TYPE_VHOST_USER_FS "vhost-user-fs-device"
 OBJECT_DECLARE_SIMPLE_TYPE(VHostUserFS, VHOST_USER_FS)
 
+/* Structures carried over the slave channel back to QEMU */
+#define VHOST_USER_FS_SLAVE_ENTRIES 8
+
+/* For the flags field of VhostUserFSSlaveMsg */
+#define VHOST_USER_FS_FLAG_MAP_R (1ull << 0)
+#define VHOST_USER_FS_FLAG_MAP_W (1ull << 1)
+
+typedef struct {
+    /* Offsets within the file being mapped */
+    uint64_t fd_offset[VHOST_USER_FS_SLAVE_ENTRIES];
+    /* Offsets within the cache */
+    uint64_t c_offset[VHOST_USER_FS_SLAVE_ENTRIES];
+    /* Lengths of sections */
+    uint64_t len[VHOST_USER_FS_SLAVE_ENTRIES];
+    /* Flags, from VHOST_USER_FS_FLAG_* */
+    uint64_t flags[VHOST_USER_FS_SLAVE_ENTRIES];
+} VhostUserFSSlaveMsg;
+
 typedef struct {
     CharBackend chardev;
     char *tag;
@@ -46,4 +64,10 @@ struct VHostUserFS {
     MemoryRegion cache;
 };
 
+/* Callbacks from the vhost-user code for slave commands */
+uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
+                                 int fd);
+uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev,
+                                   VhostUserFSSlaveMsg *sm);
+
 #endif /* _QEMU_VHOST_USER_FS_H */
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index e12e9c1532..150b1121cc 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -119,6 +119,8 @@ typedef enum VhostUserSlaveRequest {
     VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
     VHOST_USER_SLAVE_VRING_CALL = 4,
     VHOST_USER_SLAVE_VRING_ERR = 5,
+    VHOST_USER_SLAVE_FS_MAP = 6,
+    VHOST_USER_SLAVE_FS_UNMAP = 7,
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
-- 
2.29.2


