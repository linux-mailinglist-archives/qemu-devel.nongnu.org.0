Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B536D61D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:08:19 +0200 (CEST)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbi3G-0002dy-5H
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhwf-0005sP-Dk
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhwd-0004uH-LQ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFtLfLC7j0WjNTwXgWNY54K5yrKdt9r7ZZL0hXU51BY=;
 b=F93GNYY4yzxNgW+JliRzZJARax4ZB1ud4cP5/3s+Mv0XPxROukbIo9d6E2oLw6h84tCI2K
 wSEU61GLqOeC7yAFy9ioic+tdJ1ms9hNxLJ7mC4BZUm6rWyUjcjnlEbdC7aXJgvdVo0jW8
 SLCci5uyTMtx/JM0AOTlU+yVXdngP10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-c_kUO4OdPVe1vycm2b-lrw-1; Wed, 28 Apr 2021 07:01:13 -0400
X-MC-Unique: c_kUO4OdPVe1vycm2b-lrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E4ED802ED7;
 Wed, 28 Apr 2021 11:01:13 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C93271042A91;
 Wed, 28 Apr 2021 11:01:11 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 02/26] virtiofsd: Don't assume header layout
Date: Wed, 28 Apr 2021 12:00:36 +0100
Message-Id: <20210428110100.27757-3-dgilbert@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

virtiofsd incorrectly assumed a fixed set of header layout in the virt
queue; assuming that the fuse and write headers were conveniently
separated from the data;  the spec doesn't allow us to take that
convenience, so fix it up to deal with it the hard way.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 94 +++++++++++++++++++++++++++--------
 1 file changed, 73 insertions(+), 21 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 3e13997406..6dd73c9b72 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -129,18 +129,55 @@ static void fv_panic(VuDev *dev, const char *err)
  * Copy from an iovec into a fuse_buf (memory only)
  * Caller must ensure there is space
  */
-static void copy_from_iov(struct fuse_buf *buf, size_t out_num,
-                          const struct iovec *out_sg)
+static size_t copy_from_iov(struct fuse_buf *buf, size_t out_num,
+                            const struct iovec *out_sg,
+                            size_t max)
 {
     void *dest = buf->mem;
+    size_t copied = 0;
 
-    while (out_num) {
+    while (out_num && max) {
         size_t onelen = out_sg->iov_len;
+        onelen = MIN(onelen, max);
         memcpy(dest, out_sg->iov_base, onelen);
         dest += onelen;
+        copied += onelen;
         out_sg++;
         out_num--;
+        max -= onelen;
     }
+
+    return copied;
+}
+
+/*
+ * Skip 'skip' bytes in the iov; 'sg_1stindex' is set as
+ * the index for the 1st iovec to read data from, and
+ * 'sg_1stskip' is the number of bytes to skip in that entry.
+ *
+ * Returns True if there are at least 'skip' bytes in the iovec
+ *
+ */
+static bool skip_iov(const struct iovec *sg, size_t sg_size,
+                     size_t skip,
+                     size_t *sg_1stindex, size_t *sg_1stskip)
+{
+    size_t vec;
+
+    for (vec = 0; vec < sg_size; vec++) {
+        if (sg[vec].iov_len > skip) {
+            *sg_1stskip = skip;
+            *sg_1stindex = vec;
+
+            return true;
+        }
+
+        skip -= sg[vec].iov_len;
+    }
+
+    *sg_1stindex = vec;
+    *sg_1stskip = 0;
+    return skip == 0;
 }
 
 /*
@@ -457,6 +494,7 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
     bool allocated_bufv = false;
     struct fuse_bufvec bufv;
     struct fuse_bufvec *pbufv;
+    struct fuse_in_header inh;
 
     assert(se->bufsize > sizeof(struct fuse_in_header));
 
@@ -505,14 +543,15 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
                  elem->index);
         assert(0); /* TODO */
     }
-    /* Copy just the first element and look at it */
-    copy_from_iov(&fbuf, 1, out_sg);
+    /* Copy just the fuse_in_header and look at it */
+    copy_from_iov(&fbuf, out_num, out_sg,
+                  sizeof(struct fuse_in_header));
+    memcpy(&inh, fbuf.mem, sizeof(struct fuse_in_header));
 
     pbufv = NULL; /* Compiler thinks an unitialised path */
-    if (out_num > 2 &&
-        out_sg[0].iov_len == sizeof(struct fuse_in_header) &&
-        ((struct fuse_in_header *)fbuf.mem)->opcode == FUSE_WRITE &&
-        out_sg[1].iov_len == sizeof(struct fuse_write_in)) {
+    if (inh.opcode == FUSE_WRITE &&
+        out_len >= (sizeof(struct fuse_in_header) +
+                    sizeof(struct fuse_write_in))) {
         /*
          * For a write we don't actually need to copy the
          * data, we can just do it straight out of guest memory
@@ -521,15 +560,15 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
          */
         fuse_log(FUSE_LOG_DEBUG, "%s: Write special case\n", __func__);
 
-        /* copy the fuse_write_in header afte rthe fuse_in_header */
-        fbuf.mem += out_sg->iov_len;
-        copy_from_iov(&fbuf, 1, out_sg + 1);
-        fbuf.mem -= out_sg->iov_len;
-        fbuf.size = out_sg[0].iov_len + out_sg[1].iov_len;
+        fbuf.size = copy_from_iov(&fbuf, out_num, out_sg,
+                                  sizeof(struct fuse_in_header) +
+                                  sizeof(struct fuse_write_in));
+        /* That copy reread the in_header, make sure we use the original */
+        memcpy(fbuf.mem, &inh, sizeof(struct fuse_in_header));
 
         /* Allocate the bufv, with space for the rest of the iov */
         pbufv = malloc(sizeof(struct fuse_bufvec) +
-                       sizeof(struct fuse_buf) * (out_num - 2));
+                       sizeof(struct fuse_buf) * out_num);
         if (!pbufv) {
             fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
                     __func__);
@@ -540,24 +579,37 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
         pbufv->count = 1;
         pbufv->buf[0] = fbuf;
 
-        size_t iovindex, pbufvindex;
-        iovindex = 2; /* 2 headers, separate iovs */
+        size_t iovindex, pbufvindex, iov_bytes_skip;
         pbufvindex = 1; /* 2 headers, 1 fusebuf */
 
+        if (!skip_iov(out_sg, out_num,
+                      sizeof(struct fuse_in_header) +
+                      sizeof(struct fuse_write_in),
+                      &iovindex, &iov_bytes_skip)) {
+            fuse_log(FUSE_LOG_ERR, "%s: skip failed\n",
+                    __func__);
+            goto out;
+        }
+
         for (; iovindex < out_num; iovindex++, pbufvindex++) {
             pbufv->count++;
             pbufv->buf[pbufvindex].pos = ~0; /* Dummy */
             pbufv->buf[pbufvindex].flags = 0;
             pbufv->buf[pbufvindex].mem = out_sg[iovindex].iov_base;
             pbufv->buf[pbufvindex].size = out_sg[iovindex].iov_len;
+
+            if (iov_bytes_skip) {
+                pbufv->buf[pbufvindex].mem += iov_bytes_skip;
+                pbufv->buf[pbufvindex].size -= iov_bytes_skip;
+                iov_bytes_skip = 0;
+            }
         }
     } else {
         /* Normal (non fast write) path */
 
-        /* Copy the rest of the buffer */
-        fbuf.mem += out_sg->iov_len;
-        copy_from_iov(&fbuf, out_num - 1, out_sg + 1);
-        fbuf.mem -= out_sg->iov_len;
+        copy_from_iov(&fbuf, out_num, out_sg, se->bufsize);
+        /* That copy reread the in_header, make sure we use the original */
+        memcpy(fbuf.mem, &inh, sizeof(struct fuse_in_header));
         fbuf.size = out_len;
 
         /* TODO! Endianness of header */
-- 
2.31.1


