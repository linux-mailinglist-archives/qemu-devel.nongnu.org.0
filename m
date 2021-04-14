Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF8C35F8B8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:14:42 +0200 (CEST)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiA5-0002mU-9p
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoN-0008Lo-FX
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoJ-0000RM-Kd
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CuDZEs8lmVlxTps3BnuwpOHpgC5D6YAUERZmQXpwB0k=;
 b=GNIZmFQm0TgzC4sY0mnXq1u6XHsugQsn66DONt+v73nOA3XaT+pntQORgbBywzgS73Q9LY
 d4ZAAvU2O0yUz84iD2OlxzvRb4zvnKRNlynUXo6ZSkzxqGwmjbGI4J+z1d1JYUyNEAZrP5
 I2bElKfyPBeblOvjQ3A7Vz3zdvB5kx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-a0U3ymZeMB-tLYEVsNOZnA-1; Wed, 14 Apr 2021 11:52:09 -0400
X-MC-Unique: a0U3ymZeMB-tLYEVsNOZnA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35E1E87322B
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:52:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23755610F0;
 Wed, 14 Apr 2021 15:52:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 17/25] DAX/unmap: virtiofsd: Add VHOST_USER_SLAVE_FS_IO
Date: Wed, 14 Apr 2021 16:51:29 +0100
Message-Id: <20210414155137.46522-18-dgilbert@redhat.com>
In-Reply-To: <20210414155137.46522-1-dgilbert@redhat.com>
References: <20210414155137.46522-1-dgilbert@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Define a new slave command 'VHOST_USER_SLAVE_FS_IO' for a
client to ask qemu to perform a read/write from an fd directly
to GPA.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/interop/vhost-user.rst               | 16 ++++
 hw/virtio/trace-events                    |  6 ++
 hw/virtio/vhost-user-fs.c                 | 95 +++++++++++++++++++++++
 hw/virtio/vhost-user.c                    |  4 +
 include/hw/virtio/vhost-user-fs.h         |  2 +
 subprojects/libvhost-user/libvhost-user.h |  1 +
 6 files changed, 124 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 09aee3565d..2fa62ea451 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1453,6 +1453,22 @@ Slave message types
   multiple chunks can be unmapped in one command.
   A reply is generated indicating whether unmapping succeeded.
 
+``VHOST_USER_SLAVE_FS_IO``
+  :id: 9
+  :equivalent ioctl: N/A
+  :slave payload: ``struct VhostUserFSSlaveMsg``
+  :master payload: N/A
+
+  Requests that IO be performed directly from an fd, passed in ancillary
+  data, to guest memory on behalf of the daemon; this is normally for a
+  case where a memory region isn't visible to the daemon. slave payload
+  has flags which determine the direction of IO operation.
+
+  The ``VHOST_USER_FS_FLAG_MAP_R`` flag must be set in the ``flags`` field to
+  read from the file into RAM.
+  The ``VHOST_USER_FS_FLAG_MAP_W`` flag must be set in the ``flags`` field to
+  write to the file from RAM.
+
 .. _reply_ack:
 
 VHOST_USER_PROTOCOL_F_REPLY_ACK
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index c62727f879..20557a078e 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -53,6 +53,12 @@ vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRI
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
 
+# vhost-user-fs.c
+
+vhost_user_fs_slave_io_loop(const char *name, uint64_t owr, int is_ram, int is_romd, size_t size) "region %s with internal offset 0x%"PRIx64 " ram=%d romd=%d mrs.size=%zd"
+vhost_user_fs_slave_io_loop_res(ssize_t transferred) "%zd"
+vhost_user_fs_slave_io_exit(int res, size_t done) "res: %d done: %zd"
+
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
 virtqueue_fill(void *vq, const void *elem, unsigned int len, unsigned int idx) "vq %p elem %p len %u idx %u"
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 963f694435..5511838f29 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -23,6 +23,8 @@
 #include "hw/virtio/vhost-user-fs.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
 
 static const int user_feature_bits[] = {
     VIRTIO_F_VERSION_1,
@@ -220,6 +222,99 @@ uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev, int message_size,
     return (uint64_t)res;
 }
 
+uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, int message_size,
+                                VhostUserFSSlaveMsg *sm, int fd)
+{
+    VHostUserFS *fs = (VHostUserFS *)object_dynamic_cast(OBJECT(dev->vdev),
+                          TYPE_VHOST_USER_FS);
+    if (!fs) {
+        error_report("%s: Bad fs ptr", __func__);
+        return (uint64_t)-1;
+    }
+    if (!check_slave_message_entries(sm, message_size)) {
+        return (uint64_t)-1;
+    }
+
+    unsigned int i;
+    int res = 0;
+    size_t done = 0;
+
+    if (fd < 0) {
+        error_report("Bad fd for map");
+        return (uint64_t)-1;
+    }
+
+    for (i = 0; i < sm->count && !res; i++) {
+        VhostUserFSSlaveMsgEntry *e = &sm->entries[i];
+        if (e->len == 0) {
+            continue;
+        }
+
+        size_t len = e->len;
+        uint64_t fd_offset = e->fd_offset;
+        hwaddr gpa = e->c_offset;
+
+        while (len && !res) {
+            hwaddr xlat, xlat_len;
+            bool is_write = e->flags & VHOST_USER_FS_FLAG_MAP_W;
+            MemoryRegion *mr = address_space_translate(dev->vdev->dma_as, gpa,
+                                                       &xlat, &xlat_len,
+                                                       is_write,
+                                                       MEMTXATTRS_UNSPECIFIED);
+            if (!mr || !xlat_len) {
+                error_report("No guest region found for 0x%" HWADDR_PRIx, gpa);
+                res = -EFAULT;
+                break;
+            }
+
+            trace_vhost_user_fs_slave_io_loop(mr->name,
+                                          (uint64_t)xlat,
+                                          memory_region_is_ram(mr),
+                                          memory_region_is_romd(mr),
+                                          (size_t)xlat_len);
+
+            void *hostptr = qemu_map_ram_ptr(mr->ram_block,
+                                             xlat);
+            ssize_t transferred;
+            if (e->flags & VHOST_USER_FS_FLAG_MAP_R) {
+                /* Read from file into RAM */
+                if (mr->readonly) {
+                    res = -EFAULT;
+                    break;
+                }
+                transferred = pread(fd, hostptr, xlat_len, fd_offset);
+            } else if (e->flags & VHOST_USER_FS_FLAG_MAP_W) {
+                /* Write into file from RAM */
+                transferred = pwrite(fd, hostptr, xlat_len, fd_offset);
+            } else {
+                transferred = EINVAL;
+            }
+
+            trace_vhost_user_fs_slave_io_loop_res(transferred);
+            if (transferred < 0) {
+                res = -errno;
+                break;
+            }
+            if (!transferred) {
+                /* EOF */
+                break;
+            }
+
+            done += transferred;
+            fd_offset += transferred;
+            gpa += transferred;
+            len -= transferred;
+        }
+    }
+    close(fd);
+
+    trace_vhost_user_fs_slave_io_exit(res, done);
+    if (res < 0) {
+        return (uint64_t)res;
+    }
+    return (uint64_t)done;
+}
+
 static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ad9170f8dc..b9699586ae 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -138,6 +138,7 @@ typedef enum VhostUserSlaveRequest {
     VHOST_USER_SLAVE_VRING_ERR = 5,
     VHOST_USER_SLAVE_FS_MAP = 6,
     VHOST_USER_SLAVE_FS_UNMAP = 7,
+    VHOST_USER_SLAVE_FS_IO = 8,
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
@@ -1562,6 +1563,9 @@ static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
     case VHOST_USER_SLAVE_FS_UNMAP:
         ret = vhost_user_fs_slave_unmap(dev, hdr.size, &payload.fs);
         break;
+    case VHOST_USER_SLAVE_FS_IO:
+        ret = vhost_user_fs_slave_io(dev, hdr.size, &payload.fs, fd[0]);
+        break;
 #endif
     default:
         error_report("Received unexpected msg type: %d.", hdr.request);
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 0766f17548..2931164e23 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -78,5 +78,7 @@ uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, int message_size,
                                  VhostUserFSSlaveMsg *sm, int fd);
 uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev, int message_size,
                                    VhostUserFSSlaveMsg *sm);
+uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, int message_size,
+                                VhostUserFSSlaveMsg *sm, int fd);
 
 #endif /* _QEMU_VHOST_USER_FS_H */
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index a98c5f5c11..42b0833c4b 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -121,6 +121,7 @@ typedef enum VhostUserSlaveRequest {
     VHOST_USER_SLAVE_VRING_ERR = 5,
     VHOST_USER_SLAVE_FS_MAP = 6,
     VHOST_USER_SLAVE_FS_UNMAP = 7,
+    VHOST_USER_SLAVE_FS_IO = 8,
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
-- 
2.31.1


