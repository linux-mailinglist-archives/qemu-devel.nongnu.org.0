Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C907736D666
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:23:54 +0200 (CEST)
Received: from localhost ([::1]:34296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbiIL-0006Dp-Tl
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxs-0006vE-R2
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxh-0005QA-KW
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V2BlothwnuvK74svt80ryMiDyNHZ1Slm0mwafWJ7S6I=;
 b=B2ErH+6cpsdKhist1n7EI0vAcC76YXligd8U8qJOtnQsLYK8LDbF1/XDR1TxjnmhhJG4sx
 YaBxCLUxmitq74BpYbmlDtwcbkIIuTmOhzp1sOCH4Vhqrm3wom5rvjcYG+CnCzjr6my2XZ
 2sSAJOZeojSePMMt9C9+wtQlycLhEN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-7Lp1PuXEOA-VV9kUlbp93A-1; Wed, 28 Apr 2021 07:02:30 -0400
X-MC-Unique: 7Lp1PuXEOA-VV9kUlbp93A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC30180402F;
 Wed, 28 Apr 2021 11:02:29 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F53810016FC;
 Wed, 28 Apr 2021 11:02:28 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 26/26] virtiofsd: Ask qemu to drop CAP_FSETID if client
 asked for it
Date: Wed, 28 Apr 2021 12:01:00 +0100
Message-Id: <20210428110100.27757-27-dgilbert@redhat.com>
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

If qemu guest asked to drop CAP_FSETID upon write, send that info
to qemu in SLAVE_FS_IO message so that qemu can drop capability
before WRITE. This is to make sure that any setuid bit is killed
on fd (if there is one set).

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/buffer.c         | 10 ++++++----
 tools/virtiofsd/fuse_common.h    |  6 +++++-
 tools/virtiofsd/fuse_lowlevel.h  |  6 +++++-
 tools/virtiofsd/fuse_virtio.c    |  5 ++++-
 tools/virtiofsd/passthrough_ll.c |  2 +-
 5 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 8135d52d2a..b4cda7db9a 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -203,7 +203,7 @@ static ssize_t fuse_buf_fd_to_fd(const struct fuse_buf *dst, size_t dst_off,
 static ssize_t fuse_buf_copy_one(fuse_req_t req,
                                  const struct fuse_buf *dst, size_t dst_off,
                                  const struct fuse_buf *src, size_t src_off,
-                                 size_t len)
+                                 size_t len, bool dropped_cap_fsetid)
 {
     int src_is_fd = src->flags & FUSE_BUF_IS_FD;
     int dst_is_fd = dst->flags & FUSE_BUF_IS_FD;
@@ -211,7 +211,8 @@ static ssize_t fuse_buf_copy_one(fuse_req_t req,
     int dst_is_phys = src->flags & FUSE_BUF_PHYS_ADDR;
 
     if (src_is_phys && !src_is_fd && dst_is_fd) {
-        return fuse_virtio_write(req, dst, dst_off, src, src_off, len);
+        return fuse_virtio_write(req, dst, dst_off, src, src_off, len,
+                                 dropped_cap_fsetid);
     }
     assert(!src_is_phys && !dst_is_phys);
     if (!src_is_fd && !dst_is_fd) {
@@ -267,7 +268,7 @@ static int fuse_bufvec_advance(struct fuse_bufvec *bufv, size_t len)
 }
 
 ssize_t fuse_buf_copy(fuse_req_t req, struct fuse_bufvec *dstv,
-                      struct fuse_bufvec *srcv)
+                      struct fuse_bufvec *srcv, bool dropped_cap_fsetid)
 {
     size_t copied = 0, i;
 
@@ -309,7 +310,8 @@ ssize_t fuse_buf_copy(fuse_req_t req, struct fuse_bufvec *dstv,
         dst_len = dst->size - dstv->off;
         len = min_size(src_len, dst_len);
 
-        res = fuse_buf_copy_one(req, dst, dstv->off, src, srcv->off, len);
+        res = fuse_buf_copy_one(req, dst, dstv->off, src, srcv->off, len,
+                                dropped_cap_fsetid);
         if (res < 0) {
             if (!copied) {
                 return res;
diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index beed03aa93..8a75729be9 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -733,10 +733,14 @@ size_t fuse_buf_size(const struct fuse_bufvec *bufv);
  * @param req The request this copy is part of
  * @param dst destination buffer vector
  * @param src source buffer vector
+ * @param dropped_cap_fsetid Caller has dropped CAP_FSETID. If work is handed
+ *        over to a different thread/process, CAP_FSETID needs to be dropped
+ *        there as well.
  * @return actual number of bytes copied or -errno on error
  */
 ssize_t fuse_buf_copy(fuse_req_t req,
-                      struct fuse_bufvec *dst, struct fuse_bufvec *src);
+                      struct fuse_bufvec *dst, struct fuse_bufvec *src,
+                      bool dropped_cap_fsetid);
 
 /**
  * Memory buffer iterator
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 24e580aafe..dfd7e1525c 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -2030,9 +2030,13 @@ int64_t fuse_virtio_io(struct fuse_session *se, VhostUserFSSlaveMsg *msg,
  * @param src The source (memory) buffer
  * @param src_off The GPA
  * @param len Length in bytes
+ * @param dropped_cap_fsetid Caller dropped CAP_FSETID. If it is being handed
+ *        over to different thread/process, CAP_FSETID needs to be dropped
+ *        before write.
  */
 ssize_t fuse_virtio_write(fuse_req_t req, const struct fuse_buf *dst,
                           size_t dst_off, const struct fuse_buf *src,
-                          size_t src_off, size_t len);
+                          size_t src_off, size_t len,
+                          bool dropped_cap_fsetid);
 
 #endif /* FUSE_LOWLEVEL_H_ */
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index c6ea2bd2a1..9f3d38942a 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -1291,7 +1291,7 @@ int64_t fuse_virtio_io(struct fuse_session *se, VhostUserFSSlaveMsg *msg,
  */
 ssize_t fuse_virtio_write(fuse_req_t req, const struct fuse_buf *dst,
                           size_t dst_off, const struct fuse_buf *src,
-                          size_t src_off, size_t len)
+                          size_t src_off, size_t len, bool dropped_cap_fsetid)
 {
     VhostUserFSSlaveMsg *msg = g_malloc0(sizeof(VhostUserFSSlaveMsg) +
                                          sizeof(VhostUserFSSlaveMsgEntry));
@@ -1311,6 +1311,9 @@ ssize_t fuse_virtio_write(fuse_req_t req, const struct fuse_buf *dst,
     msg->entries[0].c_offset = (uintptr_t)src->mem + src_off;
     msg->entries[0].len = len;
     msg->entries[0].flags = VHOST_USER_FS_FLAG_MAP_W;
+    if (dropped_cap_fsetid) {
+        msg->flags |= VHOST_USER_FS_GENFLAG_DROP_FSETID;
+    }
 
     int64_t result = fuse_virtio_io(req->se, msg, dst->fd);
     fuse_log(FUSE_LOG_DEBUG, "%s: result=%" PRId64 " \n", __func__, result);
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index c5b8a1f5b1..b76d878509 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2301,7 +2301,7 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t ino,
         }
     }
 
-    res = fuse_buf_copy(req, &out_buf, in_buf);
+    res = fuse_buf_copy(req, &out_buf, in_buf, fi->kill_priv);
     if (res < 0) {
         fuse_reply_err(req, -res);
     } else {
-- 
2.31.1


