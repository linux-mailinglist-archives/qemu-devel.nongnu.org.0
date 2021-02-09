Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B3C3156C6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:32:36 +0100 (CET)
Received: from localhost ([::1]:48512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YkU-0004RP-Tv
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YLB-00048z-Mj
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YKl-0002PE-Hk
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vnDcYNtXdA75tzYyQ3WuP21iiFzA1/9eBscdagyK00=;
 b=ehLZC1E/hn2664STiikj05PaKwi3LPAMM1kAn5ByT83HUKYrUjDdZ2tUW70MSsW1kw+iO3
 v2StVTSpEQ49VYAW9IzanbjnTnMlInFmcLfFAisQvIWCTJ9ZWv6aJcFerVu+nR0WFSLiou
 9q0F7eXid+MEcQI1udvVvv7zjjgUQBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-A70neh55O4SJG1MkPBTRHg-1; Tue, 09 Feb 2021 14:05:56 -0500
X-MC-Unique: A70neh55O4SJG1MkPBTRHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA1CE803F48
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:05:55 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E345B60C04;
 Tue,  9 Feb 2021 19:05:41 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 17/24] DAX/unmap virtiofsd: Add wrappers for
 VHOST_USER_SLAVE_FS_IO
Date: Tue,  9 Feb 2021 19:02:17 +0000
Message-Id: <20210209190224.62827-18-dgilbert@redhat.com>
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

Add a wrapper to send VHOST_USER_SLAVE_FS_IO commands and a
further wrapper for sending a fuse_buf write using the FS_IO
slave command.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.h | 25 ++++++++++++++++++++++
 tools/virtiofsd/fuse_virtio.c   | 38 +++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 53439f5432..af928b262f 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -2012,4 +2012,29 @@ int64_t fuse_virtio_map(fuse_req_t req, VhostUserFSSlaveMsg *msg, int fd);
  */
 int64_t fuse_virtio_unmap(struct fuse_session *se, VhostUserFSSlaveMsg *msg);
 
+/**
+ * For use with virtio-fs; request IO directly to memory
+ *
+ * @param se The current session
+ * @param msg A set of IO requests
+ * @param fd The fd to map
+ * @return Length on success, negative errno on error
+ */
+int64_t fuse_virtio_io(struct fuse_session *se, VhostUserFSSlaveMsg *msg,
+                       int fd);
+
+/**
+ * For use with virtio-fs; wrapper for fuse_virtio_io for writes
+ * from memory to an fd
+ * @param req The request that triggered this action
+ * @param dst The destination (file) memory buffer
+ * @param dst_off Byte offset in the file
+ * @param src The source (memory) buffer
+ * @param src_off The GPA
+ * @param len Length in bytes
+ */
+ssize_t fuse_virtio_write(fuse_req_t req, const struct fuse_buf *dst,
+                          size_t dst_off, const struct fuse_buf *src,
+                          size_t src_off, size_t len);
+
 #endif /* FUSE_LOWLEVEL_H_ */
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index f217a093c8..8feb3c0261 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -1062,3 +1062,41 @@ int64_t fuse_virtio_unmap(struct fuse_session *se, VhostUserFSSlaveMsg *msg)
     return vu_fs_cache_request(&se->virtio_dev->dev, VHOST_USER_SLAVE_FS_UNMAP,
                                -1, msg);
 }
+
+int64_t fuse_virtio_io(struct fuse_session *se, VhostUserFSSlaveMsg *msg,
+                       int fd)
+{
+    if (!se->virtio_dev) {
+        return -ENODEV;
+    }
+    return vu_fs_cache_request(&se->virtio_dev->dev, VHOST_USER_SLAVE_FS_IO,
+                               fd, msg);
+}
+
+/*
+ * Write to a file (dst) from an area of guest GPA (src) that probably
+ * isn't visible to the daemon.
+ */
+ssize_t fuse_virtio_write(fuse_req_t req, const struct fuse_buf *dst,
+                          size_t dst_off, const struct fuse_buf *src,
+                          size_t src_off, size_t len)
+{
+    VhostUserFSSlaveMsg msg = { 0 };
+
+    if (dst->flags & FUSE_BUF_FD_SEEK) {
+        msg.fd_offset[0] = dst->pos + dst_off;
+    } else {
+        off_t cur = lseek(dst->fd, 0, SEEK_CUR);
+        if (cur == (off_t)-1) {
+            return -errno;
+        }
+        msg.fd_offset[0] = cur;
+    }
+    msg.c_offset[0] = (uintptr_t)src->mem + src_off;
+    msg.len[0] = len;
+    msg.flags[0] = VHOST_USER_FS_FLAG_MAP_W;
+
+    int64_t result = fuse_virtio_io(req->se, &msg, dst->fd);
+    fuse_log(FUSE_LOG_DEBUG, "%s: result=%ld\n", __func__, result);
+    return result;
+}
-- 
2.29.2


