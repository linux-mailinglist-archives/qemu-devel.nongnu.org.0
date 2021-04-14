Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E635F8B9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:14:47 +0200 (CEST)
Received: from localhost ([::1]:45782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiAA-00033u-OM
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoT-0008R3-7K
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoP-0000Sw-7G
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jlsb5sfmoaD/lonstNPHjpveSV9zO5eW55DbeU14usA=;
 b=BDJIGDaoegdQc87LJ39mjBoDjxgRwcfCYOsyTrBxrimIwJMKFhpxHMSnK2O/DIfVPA+Px2
 Z5WukqMXHBtQvr51CjhFQYG/Qo17BPoGZSDfqXEzypiRf5yP720qQ8WAWsSz2mNTyG9fg6
 iQ9u+nqIx4uloNFKeV3PTbcbdQHCly4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-5TE3dN0WOj-qJ3vyavyEmA-1; Wed, 14 Apr 2021 11:52:14 -0400
X-MC-Unique: 5TE3dN0WOj-qJ3vyavyEmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8DC81020C21
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:52:13 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBFC5610A8;
 Wed, 14 Apr 2021 15:52:12 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 21/25] DAX/unmap virtiofsd: route unmappable write to slave
 command
Date: Wed, 14 Apr 2021 16:51:33 +0100
Message-Id: <20210414155137.46522-22-dgilbert@redhat.com>
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

When a fuse_buf_copy is performed on an element with FUSE_BUF_PHYS_ADDR
route it to a fuse_virtio_write request that does a slave command to
perform the write.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/buffer.c         | 14 +++++++++++---
 tools/virtiofsd/fuse_common.h    |  6 +++++-
 tools/virtiofsd/fuse_lowlevel.h  |  3 ---
 tools/virtiofsd/passthrough_ll.c |  2 +-
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 1a050aa441..8135d52d2a 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -200,13 +200,20 @@ static ssize_t fuse_buf_fd_to_fd(const struct fuse_buf *dst, size_t dst_off,
     return copied;
 }
 
-static ssize_t fuse_buf_copy_one(const struct fuse_buf *dst, size_t dst_off,
+static ssize_t fuse_buf_copy_one(fuse_req_t req,
+                                 const struct fuse_buf *dst, size_t dst_off,
                                  const struct fuse_buf *src, size_t src_off,
                                  size_t len)
 {
     int src_is_fd = src->flags & FUSE_BUF_IS_FD;
     int dst_is_fd = dst->flags & FUSE_BUF_IS_FD;
+    int src_is_phys = src->flags & FUSE_BUF_PHYS_ADDR;
+    int dst_is_phys = src->flags & FUSE_BUF_PHYS_ADDR;
 
+    if (src_is_phys && !src_is_fd && dst_is_fd) {
+        return fuse_virtio_write(req, dst, dst_off, src, src_off, len);
+    }
+    assert(!src_is_phys && !dst_is_phys);
     if (!src_is_fd && !dst_is_fd) {
         char *dstmem = (char *)dst->mem + dst_off;
         char *srcmem = (char *)src->mem + src_off;
@@ -259,7 +266,8 @@ static int fuse_bufvec_advance(struct fuse_bufvec *bufv, size_t len)
     return 1;
 }
 
-ssize_t fuse_buf_copy(struct fuse_bufvec *dstv, struct fuse_bufvec *srcv)
+ssize_t fuse_buf_copy(fuse_req_t req, struct fuse_bufvec *dstv,
+                      struct fuse_bufvec *srcv)
 {
     size_t copied = 0, i;
 
@@ -301,7 +309,7 @@ ssize_t fuse_buf_copy(struct fuse_bufvec *dstv, struct fuse_bufvec *srcv)
         dst_len = dst->size - dstv->off;
         len = min_size(src_len, dst_len);
 
-        res = fuse_buf_copy_one(dst, dstv->off, src, srcv->off, len);
+        res = fuse_buf_copy_one(req, dst, dstv->off, src, srcv->off, len);
         if (res < 0) {
             if (!copied) {
                 return res;
diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index af43cf19f9..beed03aa93 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -510,6 +510,8 @@ struct fuse_conn_info {
 struct fuse_session;
 struct fuse_pollhandle;
 struct fuse_conn_info_opts;
+struct fuse_req;
+typedef struct fuse_req *fuse_req_t;
 
 /**
  * This function parses several command-line options that can be used
@@ -728,11 +730,13 @@ size_t fuse_buf_size(const struct fuse_bufvec *bufv);
 /**
  * Copy data from one buffer vector to another
  *
+ * @param req The request this copy is part of
  * @param dst destination buffer vector
  * @param src source buffer vector
  * @return actual number of bytes copied or -errno on error
  */
-ssize_t fuse_buf_copy(struct fuse_bufvec *dst, struct fuse_bufvec *src);
+ssize_t fuse_buf_copy(fuse_req_t req,
+                      struct fuse_bufvec *dst, struct fuse_bufvec *src);
 
 /**
  * Memory buffer iterator
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 757cdae49b..24e580aafe 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -42,9 +42,6 @@
 /** Inode number type */
 typedef uint64_t fuse_ino_t;
 
-/** Request pointer type */
-typedef struct fuse_req *fuse_req_t;
-
 /**
  * Session
  *
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 726343677e..b3954376b3 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2301,7 +2301,7 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t ino,
         }
     }
 
-    res = fuse_buf_copy(&out_buf, in_buf);
+    res = fuse_buf_copy(req, &out_buf, in_buf);
     if (res < 0) {
         fuse_reply_err(req, -res);
     } else {
-- 
2.31.1


