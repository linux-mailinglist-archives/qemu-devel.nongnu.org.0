Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D3315693
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:15:54 +0100 (CET)
Received: from localhost ([::1]:37200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YUK-0002rZ-4O
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YLQ-0004L5-Hy
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YKZ-0002NQ-Lh
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNzMYMma9BmiNHsoGKqBx/7LZMqn2DePQZYu1UsVyUo=;
 b=ePdFY3ZlSfJqgS4kkzjJQrnw+iX4FpBFPAokn+i+UXMTM+hXa+7psKMpsQQg+jaO5Qql6z
 /RKEp2nOipRzeijUzO1IdOc1LhLjKyGLSYZiOWik3zkME7w6yVWT7SYAozBYowcqrLAXom
 Q/Vj6tgrJn+wB0mLxB+aBUgb1Wa1IKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-n0I18hqQPoGOBzj3UYhKuQ-1; Tue, 09 Feb 2021 14:05:42 -0500
X-MC-Unique: n0I18hqQPoGOBzj3UYhKuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 890FE803F47
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:05:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0BA960C04;
 Tue,  9 Feb 2021 19:05:36 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 16/24] DAX/unmap: virtiofsd: Add VHOST_USER_SLAVE_FS_IO
Date: Tue,  9 Feb 2021 19:02:16 +0000
Message-Id: <20210209190224.62827-17-dgilbert@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 docs/interop/vhost-user.rst               | 11 +++
 hw/virtio/trace-events                    |  6 ++
 hw/virtio/vhost-user-fs.c                 | 84 +++++++++++++++++++++++
 hw/virtio/vhost-user.c                    |  4 ++
 include/hw/virtio/vhost-user-fs.h         |  2 +
 subprojects/libvhost-user/libvhost-user.h |  1 +
 6 files changed, 108 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 1deedd3407..821712f4a2 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1452,6 +1452,17 @@ Slave message types
   multiple chunks can be unmapped in one command.
   A reply is generated indicating whether unmapping succeeded.
 
+``VHOST_USER_SLAVE_FS_IO``
+  :id: 9
+  :equivalent ioctl: N/A
+  :slave payload: fd + n * (offset + address + len)
+  :master payload: N/A
+
+  Requests that the QEMU performs IO directly from an fd to guest memory
+  on behalf of the daemon; this is normally for a case where a memory region
+  isn't visible to the daemon. slave payload has flags which determine
+  the direction of IO operation.
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
index 5f2fca4d82..357bc1d04e 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -23,6 +23,8 @@
 #include "hw/virtio/vhost-user-fs.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
 
 /*
  * The powerpc kernel code expects the memory to be accessible during
@@ -155,6 +157,88 @@ uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev,
     return (uint64_t)res;
 }
 
+uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
+                                int fd)
+{
+    VHostUserFS *fs = VHOST_USER_FS(dev->vdev);
+    if (!fs) {
+        /* Shouldn't happen - but seen it in error paths */
+        error_report("Bad fs ptr");
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
+    for (i = 0; i < VHOST_USER_FS_SLAVE_ENTRIES && !res; i++) {
+        if (sm->len[i] == 0) {
+            continue;
+        }
+
+        size_t len = sm->len[i];
+        hwaddr gpa = sm->c_offset[i];
+
+        while (len && !res) {
+            MemoryRegionSection mrs = memory_region_find(get_system_memory(),
+                                                         gpa, len);
+            size_t mrs_size = (size_t)int128_get64(mrs.size);
+
+            if (!mrs_size) {
+                error_report("No guest region found for 0x%" HWADDR_PRIx, gpa);
+                res = -EFAULT;
+                break;
+            }
+
+            trace_vhost_user_fs_slave_io_loop(mrs.mr->name,
+                                          (uint64_t)mrs.offset_within_region,
+                                          memory_region_is_ram(mrs.mr),
+                                          memory_region_is_romd(mrs.mr),
+                                          (size_t)mrs_size);
+
+            void *hostptr = qemu_map_ram_ptr(mrs.mr->ram_block,
+                                             mrs.offset_within_region);
+            ssize_t transferred;
+            if (sm->flags[i] & VHOST_USER_FS_FLAG_MAP_R) {
+                /* Read from file into RAM */
+                if (mrs.mr->readonly) {
+                    res = -EFAULT;
+                    break;
+                }
+                transferred = pread(fd, hostptr, mrs_size, sm->fd_offset[i]);
+            } else {
+                /* Write into file from RAM */
+                assert((sm->flags[i] & VHOST_USER_FS_FLAG_MAP_W));
+                transferred = pwrite(fd, hostptr, mrs_size, sm->fd_offset[i]);
+            }
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
index 21e40ff91a..0bc83c2714 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -137,6 +137,7 @@ typedef enum VhostUserSlaveRequest {
     VHOST_USER_SLAVE_VRING_ERR = 5,
     VHOST_USER_SLAVE_FS_MAP = 6,
     VHOST_USER_SLAVE_FS_UNMAP = 7,
+    VHOST_USER_SLAVE_FS_IO = 8,
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
@@ -1485,6 +1486,9 @@ static void slave_read(void *opaque)
     case VHOST_USER_SLAVE_FS_UNMAP:
         ret = vhost_user_fs_slave_unmap(dev, &payload.fs);
         break;
+    case VHOST_USER_SLAVE_FS_IO:
+        ret = vhost_user_fs_slave_io(dev, &payload.fs, fd[0]);
+        break;
 #endif
     default:
         error_report("Received unexpected msg type: %d.", hdr.request);
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 25e14ab17a..ffd3165c29 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -69,5 +69,7 @@ uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
                                  int fd);
 uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev,
                                    VhostUserFSSlaveMsg *sm);
+uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
+                                int fd);
 
 #endif /* _QEMU_VHOST_USER_FS_H */
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 150b1121cc..a398148ed9 100644
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
2.29.2


