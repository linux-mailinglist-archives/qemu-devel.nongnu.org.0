Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4D3156C7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:32:37 +0100 (CET)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YkW-0004Xe-Js
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YLB-00047o-5d
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YKu-0002PQ-1p
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faTCVSeQLqChQ09ek9mWExtkX355uDV6HPGJ7MDvDg8=;
 b=bpyofkvJrVXTAWqLkQMbsBJ8SYJrEiuXAuG3kKWP4XcHo9+iM5JsPrc15NTFaYMd13sIsK
 DwCgVtShYz7MF77IFi3io5ZARJHV7ozFWjyFn6b0UnP8I17m3Bch/nfmIBC3IYnaaL7pFZ
 /qjnUSs8V27hzYT982CL1c1I++BqrH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-TqHOhcwoOACvU7jHeP9GOw-1; Tue, 09 Feb 2021 14:06:01 -0500
X-MC-Unique: TqHOhcwoOACvU7jHeP9GOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A3F192AB7D
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:06:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A80C60C04;
 Tue,  9 Feb 2021 19:05:55 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 18/24] DAX/unmap virtiofsd: Parse unmappable elements
Date: Tue,  9 Feb 2021 19:02:18 +0000
Message-Id: <20210209190224.62827-19-dgilbert@redhat.com>
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
 tools/virtiofsd/fuse_virtio.c | 191 ++++++++++++++++++++++++----------
 3 files changed, 145 insertions(+), 57 deletions(-)

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
index a090040bb2..ed9280de91 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -611,6 +611,13 @@ enum fuse_buf_flags {
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
index 8feb3c0261..8fa438525f 100644
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
@@ -291,8 +295,10 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
 
     /* The 'in' part of the elem is to qemu */
     unsigned int in_num = elem->in_num;
+    unsigned int bad_in_num = req->bad_in_num;
     struct iovec *in_sg = elem->in_sg;
     size_t in_len = iov_size(in_sg, in_num);
+    size_t in_len_writeable = iov_size(in_sg, in_num - bad_in_num);
     fuse_log(FUSE_LOG_DEBUG, "%s: elem %d: with %d in desc of length %zd\n",
              __func__, elem->index, in_num, in_len);
 
@@ -300,7 +306,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
      * The elem should have room for a 'fuse_out_header' (out from fuse)
      * plus the data based on the len in the header.
      */
-    if (in_len < sizeof(struct fuse_out_header)) {
+    if (in_len_writeable < sizeof(struct fuse_out_header)) {
         fuse_log(FUSE_LOG_ERR, "%s: elem %d too short for out_header\n",
                  __func__, elem->index);
         ret = E2BIG;
@@ -327,7 +333,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
     memcpy(in_sg_cpy, in_sg, sizeof(struct iovec) * in_num);
     /* These get updated as we skip */
     struct iovec *in_sg_ptr = in_sg_cpy;
-    int in_sg_cpy_count = in_num;
+    int in_sg_cpy_count = in_num - bad_in_num;
 
     /* skip over parts of in_sg that contained the header iov */
     size_t skip_size = iov_len;
@@ -460,17 +466,21 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
 
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
@@ -484,63 +494,129 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
     copy_from_iov(&fbuf, 1, out_sg);
 
     pbufv = NULL; /* Compiler thinks an unitialised path */
-    if (out_num > 2 &&
-        out_sg[0].iov_len == sizeof(struct fuse_in_header) &&
-        ((struct fuse_in_header *)fbuf.mem)->opcode == FUSE_WRITE &&
-        out_sg[1].iov_len == sizeof(struct fuse_write_in)) {
-        /*
-         * For a write we don't actually need to copy the
-         * data, we can just do it straight out of guest memory
-         * but we must still copy the headers in case the guest
-         * was nasty and changed them while we were using them.
-         */
-        fuse_log(FUSE_LOG_DEBUG, "%s: Write special case\n", __func__);
-
-        /* copy the fuse_write_in header afte rthe fuse_in_header */
-        fbuf.mem += out_sg->iov_len;
-        copy_from_iov(&fbuf, 1, out_sg + 1);
-        fbuf.mem -= out_sg->iov_len;
-        fbuf.size = out_sg[0].iov_len + out_sg[1].iov_len;
-
-        /* Allocate the bufv, with space for the rest of the iov */
-        pbufv = malloc(sizeof(struct fuse_bufvec) +
-                       sizeof(struct fuse_buf) * (out_num - 2));
-        if (!pbufv) {
-            fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
-                    __func__);
-            goto out;
-        }
+    if (req->bad_in_num || req->bad_out_num) {
+        bool handled_unmappable = false;
+
+        if (out_num > 2 && out_num_readable >= 2 && !req->bad_in_num &&
+            out_sg[0].iov_len == sizeof(struct fuse_in_header) &&
+            ((struct fuse_in_header *)fbuf.mem)->opcode == FUSE_WRITE &&
+            out_sg[1].iov_len == sizeof(struct fuse_write_in)) {
+            handled_unmappable = true;
+
+            /* copy the fuse_write_in header after fuse_in_header */
+            fbuf.mem += out_sg->iov_len;
+            copy_from_iov(&fbuf, 1, out_sg + 1);
+            fbuf.mem -= out_sg->iov_len;
+            fbuf.size = out_sg[0].iov_len + out_sg[1].iov_len;
+
+            /* Allocate the bufv, with space for the rest of the iov */
+            pbufv = malloc(sizeof(struct fuse_bufvec) +
+                           sizeof(struct fuse_buf) * (out_num - 2));
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
+
+            size_t iovindex, pbufvindex;
+            iovindex = 2; /* 2 headers, separate iovs */
+            pbufvindex = 1; /* 2 headers, 1 fusebuf */
+
+            for (; iovindex < out_num; iovindex++, pbufvindex++) {
+                pbufv->count++;
+                pbufv->buf[pbufvindex].pos = ~0; /* Dummy */
+                pbufv->buf[pbufvindex].flags =
+                    (iovindex < out_num_readable) ? 0 :
+                                                    FUSE_BUF_PHYS_ADDR;
+                pbufv->buf[pbufvindex].mem = out_sg[iovindex].iov_base;
+                pbufv->buf[pbufvindex].size = out_sg[iovindex].iov_len;
+            }
+        }
 
-        size_t iovindex, pbufvindex;
-        iovindex = 2; /* 2 headers, separate iovs */
-        pbufvindex = 1; /* 2 headers, 1 fusebuf */
+        if (out_num == 2 && out_num_readable == 2 && req->bad_in_num &&
+            out_sg[0].iov_len == sizeof(struct fuse_in_header) &&
+            ((struct fuse_in_header *)fbuf.mem)->opcode == FUSE_READ &&
+            out_sg[1].iov_len == sizeof(struct fuse_read_in)) {
+            fuse_log(FUSE_LOG_DEBUG,
+                     "Unmappable read case "
+                     "in_num=%d bad_in_num=%d\n",
+                     elem->in_num, req->bad_in_num);
+            handled_unmappable = true;
+        }
 
-        for (; iovindex < out_num; iovindex++, pbufvindex++) {
-            pbufv->count++;
-            pbufv->buf[pbufvindex].pos = ~0; /* Dummy */
-            pbufv->buf[pbufvindex].flags = 0;
-            pbufv->buf[pbufvindex].mem = out_sg[iovindex].iov_base;
-            pbufv->buf[pbufvindex].size = out_sg[iovindex].iov_len;
+        if (!handled_unmappable) {
+            fuse_log(FUSE_LOG_ERR,
+                     "Unhandled unmappable element: out: %d(b:%d) in: "
+                     "%d(b:%d)",
+                     out_num, req->bad_out_num, elem->in_num, req->bad_in_num);
+            fv_panic(dev, "Unhandled unmappable element");
         }
-    } else {
-        /* Normal (non fast write) path */
+    }
+
+    if (!req->bad_out_num) {
+        if (out_num > 2 &&
+            out_sg[0].iov_len == sizeof(struct fuse_in_header) &&
+            ((struct fuse_in_header *)fbuf.mem)->opcode == FUSE_WRITE &&
+            out_sg[1].iov_len == sizeof(struct fuse_write_in)) {
+            /*
+             * For a write we don't actually need to copy the
+             * data, we can just do it straight out of guest memory
+             * but we must still copy the headers in case the guest
+             * was nasty and changed them while we were using them.
+             */
+            fuse_log(FUSE_LOG_DEBUG, "%s: Write special case\n",
+                     __func__);
+
+            /* copy the fuse_write_in header after fuse_in_header */
+            fbuf.mem += out_sg->iov_len;
+            copy_from_iov(&fbuf, 1, out_sg + 1);
+            fbuf.mem -= out_sg->iov_len;
+            fbuf.size = out_sg[0].iov_len + out_sg[1].iov_len;
+
+            /* Allocate the bufv, with space for the rest of the iov */
+            pbufv = malloc(sizeof(struct fuse_bufvec) +
+                           sizeof(struct fuse_buf) * (out_num - 2));
+            if (!pbufv) {
+                fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
+                        __func__);
+                goto out;
+            }
 
-        /* Copy the rest of the buffer */
-        fbuf.mem += out_sg->iov_len;
-        copy_from_iov(&fbuf, out_num - 1, out_sg + 1);
-        fbuf.mem -= out_sg->iov_len;
-        fbuf.size = out_len;
+            allocated_bufv = true;
+            pbufv->count = 1;
+            pbufv->buf[0] = fbuf;
 
-        /* TODO! Endianness of header */
+            size_t iovindex, pbufvindex;
+            iovindex = 2; /* 2 headers, separate iovs */
+            pbufvindex = 1; /* 2 headers, 1 fusebuf */
 
-        /* TODO: Add checks for fuse_session_exited */
-        bufv.buf[0] = fbuf;
-        bufv.count = 1;
-        pbufv = &bufv;
+            for (; iovindex < out_num; iovindex++, pbufvindex++) {
+                pbufv->count++;
+                pbufv->buf[pbufvindex].pos = ~0; /* Dummy */
+                pbufv->buf[pbufvindex].flags = 0;
+                pbufv->buf[pbufvindex].mem = out_sg[iovindex].iov_base;
+                pbufv->buf[pbufvindex].size = out_sg[iovindex].iov_len;
+            }
+        } else {
+            /* Normal (non fast write) path */
+
+            /* Copy the rest of the buffer */
+            fbuf.mem += out_sg->iov_len;
+            copy_from_iov(&fbuf, out_num - 1, out_sg + 1);
+            fbuf.mem -= out_sg->iov_len;
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
@@ -657,13 +733,16 @@ static void *fv_queue_thread(void *opaque)
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
2.29.2


