Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83736D659
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:19:15 +0200 (CEST)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbiDr-0008TJ-0N
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxX-0006lY-TE
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxS-0005Ha-ML
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vaU6R0aK4DNMKLGcGgqR2HOQ+NBT7Xp/8ZjmE4c9aPw=;
 b=PlpFwbjYTHbWva/McmeAjIenvuTMULu413rM6bnAwK9Agx674h0mznAuMMDKbvPirkm5XP
 DewkXXyspvB44bDxi27WQzjha5BPWrmz1TVMgeKaoZ58Yn/7eDC5ladtcTDdU4n1bUqnzd
 YLHlUhI3iMwg/cyhhTp7ubzoZHFAHQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-EDHqzSb_MDyOTIVTzd-ePQ-1; Wed, 28 Apr 2021 07:02:14 -0400
X-MC-Unique: EDHqzSb_MDyOTIVTzd-ePQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A060107ACFC;
 Wed, 28 Apr 2021 11:02:13 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36C7210016FC;
 Wed, 28 Apr 2021 11:02:11 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 20/26] DAX/unmap virtiofsd: Parse unmappable elements
Date: Wed, 28 Apr 2021 12:00:54 +0100
Message-Id: <20210428110100.27757-21-dgilbert@redhat.com>
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

For some read/writes the virtio queue elements are unmappable by
the daemon; these are cases where the data is to be read/written
from non-RAM.  In viritofs's case this is typically a direct read/write
into an mmap'd DAX file also on virtiofs (possibly on another instance).

When we receive a virtio queue element, check that we have enough
mappable data to handle the headers.  Make a note of the number of
unmappable 'in' entries (ie. for read data back to the VMM),
and flag the fuse_bufvec for 'out' entries with a new flag
FUSE_BUF_PHYS_ADDR.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
with fix by:
Signed-off-by: Liu Bo <bo.liu@linux.alibaba.com>
---
 tools/virtiofsd/buffer.c      |   4 +-
 tools/virtiofsd/fuse_common.h |   7 ++
 tools/virtiofsd/fuse_virtio.c | 230 ++++++++++++++++++++++++----------
 3 files changed, 173 insertions(+), 68 deletions(-)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 874f01c488..1a050aa441 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -77,6 +77,7 @@ static ssize_t fuse_buf_write(const struct fuse_buf *dst, size_t dst_off,
     ssize_t res = 0;
     size_t copied = 0;
 
+    assert(!(src->flags & FUSE_BUF_PHYS_ADDR));
     while (len) {
         if (dst->flags & FUSE_BUF_FD_SEEK) {
             res = pwrite(dst->fd, (char *)src->mem + src_off, len,
@@ -272,7 +273,8 @@ ssize_t fuse_buf_copy(struct fuse_bufvec *dstv, struct fuse_bufvec *srcv)
      * process
      */
     for (i = 0; i < srcv->count; i++) {
-        if (srcv->buf[i].flags & FUSE_BUF_IS_FD) {
+        if ((srcv->buf[i].flags & FUSE_BUF_PHYS_ADDR) ||
+            (srcv->buf[i].flags & FUSE_BUF_IS_FD)) {
             break;
         }
     }
diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index fa9671872e..af43cf19f9 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -626,6 +626,13 @@ enum fuse_buf_flags {
      * detected.
      */
     FUSE_BUF_FD_RETRY = (1 << 3),
+
+    /**
+     * The addresses in the iovec represent guest physical addresses
+     * that can't be mapped by the daemon process.
+     * IO must be bounced back to the VMM to do it.
+     */
+    FUSE_BUF_PHYS_ADDR = (1 << 4),
 };
 
 /**
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 91317bade8..f8fd158bb2 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -49,6 +49,10 @@ typedef struct {
     VuVirtqElement elem;
     struct fuse_chan ch;
 
+    /* Number of unmappable iovecs */
+    unsigned bad_in_num;
+    unsigned bad_out_num;
+
     /* Used to complete requests that involve no reply */
     bool reply_sent;
 } FVRequest;
@@ -353,8 +357,10 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
 
     /* The 'in' part of the elem is to qemu */
     unsigned int in_num = elem->in_num;
+    unsigned int bad_in_num = req->bad_in_num;
     struct iovec *in_sg = elem->in_sg;
     size_t in_len = iov_size(in_sg, in_num);
+    size_t in_len_writeable = iov_size(in_sg, in_num - bad_in_num);
     fuse_log(FUSE_LOG_DEBUG, "%s: elem %d: with %d in desc of length %zd\n",
              __func__, elem->index, in_num, in_len);
 
@@ -362,7 +368,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
      * The elem should have room for a 'fuse_out_header' (out from fuse)
      * plus the data based on the len in the header.
      */
-    if (in_len < sizeof(struct fuse_out_header)) {
+    if (in_len_writeable < sizeof(struct fuse_out_header)) {
         fuse_log(FUSE_LOG_ERR, "%s: elem %d too short for out_header\n",
                  __func__, elem->index);
         ret = E2BIG;
@@ -389,7 +395,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
     memcpy(in_sg_cpy, in_sg, sizeof(struct iovec) * in_num);
     /* These get updated as we skip */
     struct iovec *in_sg_ptr = in_sg_cpy;
-    int in_sg_cpy_count = in_num;
+    int in_sg_cpy_count = in_num - bad_in_num;
 
     /* skip over parts of in_sg that contained the header iov */
     size_t skip_size = iov_len;
@@ -523,17 +529,21 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
 
     /* The 'out' part of the elem is from qemu */
     unsigned int out_num = elem->out_num;
+    unsigned int out_num_readable = out_num - req->bad_out_num;
     struct iovec *out_sg = elem->out_sg;
     size_t out_len = iov_size(out_sg, out_num);
+    size_t out_len_readable = iov_size(out_sg, out_num_readable);
     fuse_log(FUSE_LOG_DEBUG,
-             "%s: elem %d: with %d out desc of length %zd\n",
-             __func__, elem->index, out_num, out_len);
+             "%s: elem %d: with %d out desc of length %zd"
+             " bad_in_num=%u bad_out_num=%u\n",
+             __func__, elem->index, out_num, out_len, req->bad_in_num,
+             req->bad_out_num);
 
     /*
      * The elem should contain a 'fuse_in_header' (in to fuse)
      * plus the data based on the len in the header.
      */
-    if (out_len < sizeof(struct fuse_in_header)) {
+    if (out_len_readable < sizeof(struct fuse_in_header)) {
         fuse_log(FUSE_LOG_ERR, "%s: elem %d too short for in_header\n",
                  __func__, elem->index);
         assert(0); /* TODO */
@@ -544,80 +554,163 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
         assert(0); /* TODO */
     }
     /* Copy just the fuse_in_header and look at it */
-    copy_from_iov(&fbuf, out_num, out_sg,
+    copy_from_iov(&fbuf, out_num_readable, out_sg,
                   sizeof(struct fuse_in_header));
     memcpy(&inh, fbuf.mem, sizeof(struct fuse_in_header));
 
     pbufv = NULL; /* Compiler thinks an unitialised path */
-    if (inh.opcode == FUSE_WRITE &&
-        out_len >= (sizeof(struct fuse_in_header) +
-                    sizeof(struct fuse_write_in))) {
-        /*
-         * For a write we don't actually need to copy the
-         * data, we can just do it straight out of guest memory
-         * but we must still copy the headers in case the guest
-         * was nasty and changed them while we were using them.
-         */
-        fuse_log(FUSE_LOG_DEBUG, "%s: Write special case\n", __func__);
-
-        fbuf.size = copy_from_iov(&fbuf, out_num, out_sg,
-                                  sizeof(struct fuse_in_header) +
-                                  sizeof(struct fuse_write_in));
-        /* That copy reread the in_header, make sure we use the original */
-        memcpy(fbuf.mem, &inh, sizeof(struct fuse_in_header));
-
-        /* Allocate the bufv, with space for the rest of the iov */
-        pbufv = malloc(sizeof(struct fuse_bufvec) +
-                       sizeof(struct fuse_buf) * out_num);
-        if (!pbufv) {
-            fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
-                    __func__);
-            goto out;
-        }
+    if (req->bad_in_num || req->bad_out_num) {
+        bool handled_unmappable = false;
+
+        if (!req->bad_in_num &&
+            inh.opcode == FUSE_WRITE &&
+            out_len_readable >= (sizeof(struct fuse_in_header) +
+                                 sizeof(struct fuse_write_in))) {
+            handled_unmappable = true;
+
+            /* copy the fuse_write_in header after fuse_in_header */
+            fbuf.size = copy_from_iov(&fbuf, out_num_readable, out_sg,
+                                      sizeof(struct fuse_in_header) +
+                                      sizeof(struct fuse_write_in));
+            /* That copy reread the in_header, make sure we use the original */
+            memcpy(fbuf.mem, &inh, sizeof(struct fuse_in_header));
+
+            /* Allocate the bufv, with space for the rest of the iov */
+            pbufv = malloc(sizeof(struct fuse_bufvec) +
+                           sizeof(struct fuse_buf) * out_num);
+            if (!pbufv) {
+                fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
+                        __func__);
+                goto out;
+            }
 
-        allocated_bufv = true;
-        pbufv->count = 1;
-        pbufv->buf[0] = fbuf;
+            allocated_bufv = true;
+            pbufv->count = 1;
+            pbufv->buf[0] = fbuf;
 
-        size_t iovindex, pbufvindex, iov_bytes_skip;
-        pbufvindex = 1; /* 2 headers, 1 fusebuf */
+            size_t iovindex, pbufvindex, iov_bytes_skip;
+            pbufvindex = 1; /* 2 headers, 1 fusebuf */
 
-        if (!skip_iov(out_sg, out_num,
-                      sizeof(struct fuse_in_header) +
-                      sizeof(struct fuse_write_in),
-                      &iovindex, &iov_bytes_skip)) {
-            fuse_log(FUSE_LOG_ERR, "%s: skip failed\n",
-                    __func__);
-            goto out;
-        }
+            if (!skip_iov(out_sg, out_num,
+                          sizeof(struct fuse_in_header) +
+                          sizeof(struct fuse_write_in),
+                          &iovindex, &iov_bytes_skip)) {
+                fuse_log(FUSE_LOG_ERR, "%s: skip failed\n",
+                        __func__);
+                goto out;
+            }
 
-        for (; iovindex < out_num; iovindex++, pbufvindex++) {
-            pbufv->count++;
-            pbufv->buf[pbufvindex].pos = ~0; /* Dummy */
-            pbufv->buf[pbufvindex].flags = 0;
-            pbufv->buf[pbufvindex].mem = out_sg[iovindex].iov_base;
-            pbufv->buf[pbufvindex].size = out_sg[iovindex].iov_len;
-
-            if (iov_bytes_skip) {
-                pbufv->buf[pbufvindex].mem += iov_bytes_skip;
-                pbufv->buf[pbufvindex].size -= iov_bytes_skip;
-                iov_bytes_skip = 0;
+            for (; iovindex < out_num; iovindex++, pbufvindex++) {
+                pbufv->count++;
+                pbufv->buf[pbufvindex].pos = ~0; /* Dummy */
+                pbufv->buf[pbufvindex].flags =
+                    (iovindex < out_num_readable) ? 0 :
+                                                    FUSE_BUF_PHYS_ADDR;
+                pbufv->buf[pbufvindex].mem = out_sg[iovindex].iov_base;
+                pbufv->buf[pbufvindex].size = out_sg[iovindex].iov_len;
+
+                if (iov_bytes_skip) {
+                    pbufv->buf[pbufvindex].mem += iov_bytes_skip;
+                    pbufv->buf[pbufvindex].size -= iov_bytes_skip;
+                    iov_bytes_skip = 0;
+                }
             }
         }
-    } else {
-        /* Normal (non fast write) path */
 
-        copy_from_iov(&fbuf, out_num, out_sg, se->bufsize);
-        /* That copy reread the in_header, make sure we use the original */
-        memcpy(fbuf.mem, &inh, sizeof(struct fuse_in_header));
-        fbuf.size = out_len;
+        if (req->bad_in_num &&
+            inh.opcode == FUSE_READ &&
+            out_len_readable >=
+                (sizeof(struct fuse_in_header) + sizeof(struct fuse_read_in))) {
+            fuse_log(FUSE_LOG_DEBUG,
+                     "Unmappable read case "
+                     "in_num=%d bad_in_num=%d\n",
+                     elem->in_num, req->bad_in_num);
+            handled_unmappable = true;
+        }
+
+        if (!handled_unmappable) {
+            fuse_log(FUSE_LOG_ERR,
+                     "Unhandled unmappable element: out: %d(b:%d) in: "
+                     "%d(b:%d)",
+                     out_num, req->bad_out_num, elem->in_num, req->bad_in_num);
+            fv_panic(dev, "Unhandled unmappable element");
+        }
+    }
+
+    if (!req->bad_out_num) {
+        if (inh.opcode == FUSE_WRITE &&
+            out_len_readable >= (sizeof(struct fuse_in_header) +
+                                 sizeof(struct fuse_write_in))) {
+            /*
+             * For a write we don't actually need to copy the
+             * data, we can just do it straight out of guest memory
+             * but we must still copy the headers in case the guest
+             * was nasty and changed them while we were using them.
+             */
+            fuse_log(FUSE_LOG_DEBUG, "%s: Write special case\n",
+                     __func__);
+
+            fbuf.size = copy_from_iov(&fbuf, out_num, out_sg,
+                                      sizeof(struct fuse_in_header) +
+                                      sizeof(struct fuse_write_in));
+            /* That copy reread the in_header, make sure we use the original */
+            memcpy(fbuf.mem, &inh, sizeof(struct fuse_in_header));
+
+            /* Allocate the bufv, with space for the rest of the iov */
+            pbufv = malloc(sizeof(struct fuse_bufvec) +
+                           sizeof(struct fuse_buf) * out_num);
+            if (!pbufv) {
+                fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
+                        __func__);
+                goto out;
+            }
+
+            allocated_bufv = true;
+            pbufv->count = 1;
+            pbufv->buf[0] = fbuf;
 
-        /* TODO! Endianness of header */
+            size_t iovindex, pbufvindex, iov_bytes_skip;
+            pbufvindex = 1; /* 2 headers, 1 fusebuf */
 
-        /* TODO: Add checks for fuse_session_exited */
-        bufv.buf[0] = fbuf;
-        bufv.count = 1;
-        pbufv = &bufv;
+            if (!skip_iov(out_sg, out_num,
+                          sizeof(struct fuse_in_header) +
+                          sizeof(struct fuse_write_in),
+                          &iovindex, &iov_bytes_skip)) {
+                fuse_log(FUSE_LOG_ERR, "%s: skip failed\n",
+                        __func__);
+                goto out;
+            }
+
+            for (; iovindex < out_num; iovindex++, pbufvindex++) {
+                pbufv->count++;
+                pbufv->buf[pbufvindex].pos = ~0; /* Dummy */
+                pbufv->buf[pbufvindex].flags = 0;
+                pbufv->buf[pbufvindex].mem = out_sg[iovindex].iov_base;
+                pbufv->buf[pbufvindex].size = out_sg[iovindex].iov_len;
+
+                if (iov_bytes_skip) {
+                    pbufv->buf[pbufvindex].mem += iov_bytes_skip;
+                    pbufv->buf[pbufvindex].size -= iov_bytes_skip;
+                    iov_bytes_skip = 0;
+                }
+            }
+        } else {
+            /* Normal (non fast write) path */
+
+            /* Copy the rest of the buffer */
+            copy_from_iov(&fbuf, out_num, out_sg, se->bufsize);
+            /* That copy reread the in_header, make sure we use the original */
+            memcpy(fbuf.mem, &inh, sizeof(struct fuse_in_header));
+
+            fbuf.size = out_len;
+
+            /* TODO! Endianness of header */
+
+            /* TODO: Add checks for fuse_session_exited */
+            bufv.buf[0] = fbuf;
+            bufv.count = 1;
+            pbufv = &bufv;
+        }
     }
     pbufv->idx = 0;
     pbufv->off = 0;
@@ -732,13 +825,16 @@ static void *fv_queue_thread(void *opaque)
                  __func__, qi->qidx, (size_t)evalue, in_bytes, out_bytes);
 
         while (1) {
+            unsigned int bad_in_num = 0, bad_out_num = 0;
             FVRequest *req = vu_queue_pop(dev, q, sizeof(FVRequest),
-                                          NULL, NULL);
+                                          &bad_in_num, &bad_out_num);
             if (!req) {
                 break;
             }
 
             req->reply_sent = false;
+            req->bad_in_num = bad_in_num;
+            req->bad_out_num = bad_out_num;
 
             if (!se->thread_pool_size) {
                 req_list = g_list_prepend(req_list, req);
-- 
2.31.1


