Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE2690CEB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:27:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ8nu-0004XW-SC; Thu, 09 Feb 2023 10:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pQ8nt-0004X6-3j
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:25:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pQ8nq-0000jb-9b
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675956337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bpBKHZApS0/+vJ3wZdWbcJB8Rmlox3uykvk1P5xoMg=;
 b=MqcJJJdp21UwGT+fmpzNolNaPWq7a39GXn+qaEBxXCdoxe/R7/mmqRSBP89fEu277l5ZZi
 opxZDbuheBieekLl34VZCPfoP7H1ob4dKpQnF+xRhXm0gQ1BhvRbdFuKr92gLXa7ljQ1ih
 eR0QA++pO5nIjS9nlyFmOKTDoXBIi+c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-IklZAKPYP9OGTGTOCDpl7w-1; Thu, 09 Feb 2023 10:25:35 -0500
X-MC-Unique: IklZAKPYP9OGTGTOCDpl7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FDAD8828D1;
 Thu,  9 Feb 2023 15:25:32 +0000 (UTC)
Received: from localhost (unknown [10.39.193.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D3CD40B42D4;
 Thu,  9 Feb 2023 15:25:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, virtio-fs@redhat.com,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 5/6] qemu-io: add -r option to register I/O buffer
Date: Thu,  9 Feb 2023 10:25:19 -0500
Message-Id: <20230209152520.434183-6-stefanha@redhat.com>
In-Reply-To: <20230209152520.434183-1-stefanha@redhat.com>
References: <20230209152520.434183-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The blk_register_buf() API is an optimization hint that allows some
block drivers to avoid I/O buffer housekeeping or bounce buffers.

Add an -r option to register the I/O buffer so that qemu-io can be used
to test the blk_register_buf() API. The next commit will add a test that
uses the new option.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230207203719.242926-4-stefanha@redhat.com>
---
 qemu-io-cmds.c | 204 +++++++++++++++++++++++++++++++------------------
 1 file changed, 129 insertions(+), 75 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 1f60c23ba4..e7a02f5b99 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -338,7 +338,8 @@ static int parse_pattern(const char *arg)
  */
 
 #define MISALIGN_OFFSET     16
-static void *qemu_io_alloc(BlockBackend *blk, size_t len, int pattern)
+static void *qemu_io_alloc(BlockBackend *blk, size_t len, int pattern,
+                           bool register_buf)
 {
     void *buf;
 
@@ -347,16 +348,24 @@ static void *qemu_io_alloc(BlockBackend *blk, size_t len, int pattern)
     }
     buf = blk_blockalign(blk, len);
     memset(buf, pattern, len);
+    if (register_buf) {
+        blk_register_buf(blk, buf, len, &error_abort);
+    }
     if (qemuio_misalign) {
         buf += MISALIGN_OFFSET;
     }
     return buf;
 }
 
-static void qemu_io_free(void *p)
+static void qemu_io_free(BlockBackend *blk, void *p, size_t len,
+                         bool unregister_buf)
 {
     if (qemuio_misalign) {
         p -= MISALIGN_OFFSET;
+        len += MISALIGN_OFFSET;
+    }
+    if (unregister_buf) {
+        blk_unregister_buf(blk, p, len);
     }
     qemu_vfree(p);
 }
@@ -371,14 +380,16 @@ static void qemu_io_free(void *p)
  * @blk - the block backend where the buffer content is going to be written to
  * @len - the buffer length
  * @file_name - the file to read the content from
+ * @register_buf - call blk_register_buf()
  *
  * Returns: the buffer pointer on success
  *          NULL on error
  */
 static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
-                                     const char *file_name)
+                                     const char *file_name, bool register_buf)
 {
-    char *buf, *buf_origin;
+    size_t alloc_len = len + (qemuio_misalign ? MISALIGN_OFFSET : 0);
+    char *alloc_buf, *buf, *end;
     FILE *f = fopen(file_name, "r");
     int pattern_len;
 
@@ -387,19 +398,13 @@ static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
         return NULL;
     }
 
-    if (qemuio_misalign) {
-        len += MISALIGN_OFFSET;
-    }
-
-    buf_origin = buf = blk_blockalign(blk, len);
+    alloc_buf = buf = blk_blockalign(blk, alloc_len);
 
     if (qemuio_misalign) {
-        buf_origin += MISALIGN_OFFSET;
         buf += MISALIGN_OFFSET;
-        len -= MISALIGN_OFFSET;
     }
 
-    pattern_len = fread(buf_origin, 1, len, f);
+    pattern_len = fread(buf, 1, len, f);
 
     if (ferror(f)) {
         perror(file_name);
@@ -414,24 +419,23 @@ static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
     fclose(f);
     f = NULL;
 
-    if (len > pattern_len) {
-        len -= pattern_len;
-        buf += pattern_len;
-
-        while (len > 0) {
-            size_t len_to_copy = MIN(pattern_len, len);
-
-            memcpy(buf, buf_origin, len_to_copy);
+    if (register_buf) {
+        blk_register_buf(blk, alloc_buf, alloc_len, &error_abort);
+    }
 
-            len -= len_to_copy;
-            buf += len_to_copy;
-        }
+    end = buf + len;
+    for (char *p = buf + pattern_len; p < end; p += pattern_len) {
+        memcpy(p, buf, MIN(pattern_len, end - p));
     }
 
-    return buf_origin;
+    return buf;
 
 error:
-    qemu_io_free(buf_origin);
+    /*
+     * This code path is only taken before blk_register_buf() is called, so
+     * hardcode the qemu_io_free() unregister_buf argument to false.
+     */
+    qemu_io_free(blk, alloc_buf, alloc_len, false);
     if (f) {
         fclose(f);
     }
@@ -490,7 +494,7 @@ static void print_report(const char *op, struct timespec *t, int64_t offset,
  */
 static void *
 create_iovec(BlockBackend *blk, QEMUIOVector *qiov, char **argv, int nr_iov,
-             int pattern)
+             int pattern, bool register_buf)
 {
     size_t *sizes = g_new0(size_t, nr_iov);
     size_t count = 0;
@@ -526,7 +530,7 @@ create_iovec(BlockBackend *blk, QEMUIOVector *qiov, char **argv, int nr_iov,
 
     qemu_iovec_init(qiov, nr_iov);
 
-    buf = p = qemu_io_alloc(blk, count, pattern);
+    buf = p = qemu_io_alloc(blk, count, pattern, register_buf);
 
     for (i = 0; i < nr_iov; i++) {
         qemu_iovec_add(qiov, p, sizes[i]);
@@ -539,7 +543,7 @@ fail:
 }
 
 static int do_pread(BlockBackend *blk, char *buf, int64_t offset,
-                    int64_t bytes, int64_t *total)
+                    int64_t bytes, BdrvRequestFlags flags, int64_t *total)
 {
     int ret;
 
@@ -547,7 +551,7 @@ static int do_pread(BlockBackend *blk, char *buf, int64_t offset,
         return -ERANGE;
     }
 
-    ret = blk_pread(blk, offset, bytes, (uint8_t *)buf, 0);
+    ret = blk_pread(blk, offset, bytes, (uint8_t *)buf, flags);
     if (ret < 0) {
         return ret;
     }
@@ -638,11 +642,11 @@ static void aio_rw_done(void *opaque, int ret)
 }
 
 static int do_aio_readv(BlockBackend *blk, QEMUIOVector *qiov,
-                        int64_t offset, int *total)
+                        int64_t offset, BdrvRequestFlags flags, int *total)
 {
     int async_ret = NOT_DONE;
 
-    blk_aio_preadv(blk, offset, qiov, 0, aio_rw_done, &async_ret);
+    blk_aio_preadv(blk, offset, qiov, flags, aio_rw_done, &async_ret);
     while (async_ret == NOT_DONE) {
         main_loop_wait(false);
     }
@@ -682,6 +686,7 @@ static void read_help(void)
 " -p, -- ignored for backwards compatibility\n"
 " -P, -- use a pattern to verify read data\n"
 " -q, -- quiet mode, do not show I/O statistics\n"
+" -r, -- register I/O buffer\n"
 " -s, -- start offset for pattern verification (only with -P)\n"
 " -v, -- dump buffer to standard output\n"
 "\n");
@@ -695,7 +700,7 @@ static const cmdinfo_t read_cmd = {
     .cfunc      = read_f,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-abCqv] [-P pattern [-s off] [-l len]] off len",
+    .args       = "[-abCqrv] [-P pattern [-s off] [-l len]] off len",
     .oneline    = "reads a number of bytes at a specified offset",
     .help       = read_help,
 };
@@ -713,8 +718,9 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
     int64_t total = 0;
     int pattern = 0;
     int64_t pattern_offset = 0, pattern_count = 0;
+    BdrvRequestFlags flags = 0;
 
-    while ((c = getopt(argc, argv, "bCl:pP:qs:v")) != -1) {
+    while ((c = getopt(argc, argv, "bCl:pP:qrs:v")) != -1) {
         switch (c) {
         case 'b':
             bflag = true;
@@ -743,6 +749,9 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
         case 'q':
             qflag = true;
             break;
+        case 'r':
+            flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 's':
             sflag = true;
             pattern_offset = cvtnum(optarg);
@@ -807,15 +816,20 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
                    count);
             return -EINVAL;
         }
+        if (flags & BDRV_REQ_REGISTERED_BUF) {
+            printf("I/O buffer registration is not supported when reading "
+                    "from vmstate\n");
+            return -EINVAL;
+        }
     }
 
-    buf = qemu_io_alloc(blk, count, 0xab);
+    buf = qemu_io_alloc(blk, count, 0xab, flags & BDRV_REQ_REGISTERED_BUF);
 
     clock_gettime(CLOCK_MONOTONIC, &t1);
     if (bflag) {
         ret = do_load_vmstate(blk, buf, offset, count, &total);
     } else {
-        ret = do_pread(blk, buf, offset, count, &total);
+        ret = do_pread(blk, buf, offset, count, flags, &total);
     }
     clock_gettime(CLOCK_MONOTONIC, &t2);
 
@@ -852,7 +866,7 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
     print_report("read", &t2, offset, count, total, cnt, Cflag);
 
 out:
-    qemu_io_free(buf);
+    qemu_io_free(blk, buf, count, flags & BDRV_REQ_REGISTERED_BUF);
     return ret;
 }
 
@@ -870,8 +884,9 @@ static void readv_help(void)
 " Uses multiple iovec buffers if more than one byte range is specified.\n"
 " -C, -- report statistics in a machine parsable format\n"
 " -P, -- use a pattern to verify read data\n"
-" -v, -- dump buffer to standard output\n"
 " -q, -- quiet mode, do not show I/O statistics\n"
+" -r, -- register I/O buffer\n"
+" -v, -- dump buffer to standard output\n"
 "\n");
 }
 
@@ -882,7 +897,7 @@ static const cmdinfo_t readv_cmd = {
     .cfunc      = readv_f,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-Cqv] [-P pattern] off len [len..]",
+    .args       = "[-Cqrv] [-P pattern] off len [len..]",
     .oneline    = "reads a number of bytes at a specified offset",
     .help       = readv_help,
 };
@@ -900,8 +915,9 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
     QEMUIOVector qiov;
     int pattern = 0;
     bool Pflag = false;
+    BdrvRequestFlags flags = 0;
 
-    while ((c = getopt(argc, argv, "CP:qv")) != -1) {
+    while ((c = getopt(argc, argv, "CP:qrv")) != -1) {
         switch (c) {
         case 'C':
             Cflag = true;
@@ -916,6 +932,9 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
         case 'q':
             qflag = true;
             break;
+        case 'r':
+            flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 'v':
             vflag = true;
             break;
@@ -939,13 +958,14 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
     optind++;
 
     nr_iov = argc - optind;
-    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, 0xab);
+    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, 0xab,
+                       flags & BDRV_REQ_REGISTERED_BUF);
     if (buf == NULL) {
         return -EINVAL;
     }
 
     clock_gettime(CLOCK_MONOTONIC, &t1);
-    ret = do_aio_readv(blk, &qiov, offset, &total);
+    ret = do_aio_readv(blk, &qiov, offset, flags, &total);
     clock_gettime(CLOCK_MONOTONIC, &t2);
 
     if (ret < 0) {
@@ -980,8 +1000,8 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
     print_report("read", &t2, offset, qiov.size, total, cnt, Cflag);
 
 out:
+    qemu_io_free(blk, buf, qiov.size, flags & BDRV_REQ_REGISTERED_BUF);
     qemu_iovec_destroy(&qiov);
-    qemu_io_free(buf);
     return ret;
 }
 
@@ -998,13 +1018,14 @@ static void write_help(void)
 " filled with a set pattern (0xcdcdcdcd).\n"
 " -b, -- write to the VM state rather than the virtual disk\n"
 " -c, -- write compressed data with blk_write_compressed\n"
+" -C, -- report statistics in a machine parsable format\n"
 " -f, -- use Force Unit Access semantics\n"
 " -n, -- with -z, don't allow slow fallback\n"
 " -p, -- ignored for backwards compatibility\n"
 " -P, -- use different pattern to fill file\n"
+" -q, -- quiet mode, do not show I/O statistics\n"
+" -r, -- register I/O buffer\n"
 " -s, -- use a pattern file to fill the write buffer\n"
-" -C, -- report statistics in a machine parsable format\n"
-" -q, -- quiet mode, do not show I/O statistics\n"
 " -u, -- with -z, allow unmapping\n"
 " -z, -- write zeroes using blk_pwrite_zeroes\n"
 "\n");
@@ -1019,7 +1040,7 @@ static const cmdinfo_t write_cmd = {
     .perm       = BLK_PERM_WRITE,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-bcCfnquz] [-P pattern | -s source_file] off len",
+    .args       = "[-bcCfnqruz] [-P pattern | -s source_file] off len",
     .oneline    = "writes a number of bytes at a specified offset",
     .help       = write_help,
 };
@@ -1039,7 +1060,7 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     int pattern = 0xcd;
     const char *file_name = NULL;
 
-    while ((c = getopt(argc, argv, "bcCfnpP:qs:uz")) != -1) {
+    while ((c = getopt(argc, argv, "bcCfnpP:qrs:uz")) != -1) {
         switch (c) {
         case 'b':
             bflag = true;
@@ -1069,6 +1090,9 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
         case 'q':
             qflag = true;
             break;
+        case 'r':
+            flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 's':
             sflag = true;
             file_name = optarg;
@@ -1148,14 +1172,21 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
         }
     }
 
-    if (!zflag) {
+    if (zflag) {
+        if (flags & BDRV_REQ_REGISTERED_BUF) {
+            printf("cannot combine zero write with registered I/O buffer\n");
+            return -EINVAL;
+        }
+    } else {
         if (sflag) {
-            buf = qemu_io_alloc_from_file(blk, count, file_name);
+            buf = qemu_io_alloc_from_file(blk, count, file_name,
+                                          flags & BDRV_REQ_REGISTERED_BUF);
             if (!buf) {
                 return -EINVAL;
             }
         } else {
-            buf = qemu_io_alloc(blk, count, pattern);
+            buf = qemu_io_alloc(blk, count, pattern,
+                                flags & BDRV_REQ_REGISTERED_BUF);
         }
     }
 
@@ -1189,7 +1220,7 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
 
 out:
     if (!zflag) {
-        qemu_io_free(buf);
+        qemu_io_free(blk, buf, count, flags & BDRV_REQ_REGISTERED_BUF);
     }
     return ret;
 }
@@ -1206,10 +1237,11 @@ writev_help(void)
 "\n"
 " Writes into a segment of the currently open file, using a buffer\n"
 " filled with a set pattern (0xcdcdcdcd).\n"
-" -P, -- use different pattern to fill file\n"
 " -C, -- report statistics in a machine parsable format\n"
 " -f, -- use Force Unit Access semantics\n"
+" -P, -- use different pattern to fill file\n"
 " -q, -- quiet mode, do not show I/O statistics\n"
+" -r, -- register I/O buffer\n"
 "\n");
 }
 
@@ -1221,7 +1253,7 @@ static const cmdinfo_t writev_cmd = {
     .perm       = BLK_PERM_WRITE,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-Cfq] [-P pattern] off len [len..]",
+    .args       = "[-Cfqr] [-P pattern] off len [len..]",
     .oneline    = "writes a number of bytes at a specified offset",
     .help       = writev_help,
 };
@@ -1240,7 +1272,7 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
     int pattern = 0xcd;
     QEMUIOVector qiov;
 
-    while ((c = getopt(argc, argv, "CfqP:")) != -1) {
+    while ((c = getopt(argc, argv, "CfP:qr")) != -1) {
         switch (c) {
         case 'C':
             Cflag = true;
@@ -1251,6 +1283,9 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
         case 'q':
             qflag = true;
             break;
+        case 'r':
+            flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 'P':
             pattern = parse_pattern(optarg);
             if (pattern < 0) {
@@ -1276,7 +1311,8 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
     optind++;
 
     nr_iov = argc - optind;
-    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern);
+    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern,
+                       flags & BDRV_REQ_REGISTERED_BUF);
     if (buf == NULL) {
         return -EINVAL;
     }
@@ -1301,8 +1337,8 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
     t2 = tsub(t2, t1);
     print_report("wrote", &t2, offset, qiov.size, total, cnt, Cflag);
 out:
+    qemu_io_free(blk, buf, qiov.size, flags & BDRV_REQ_REGISTERED_BUF);
     qemu_iovec_destroy(&qiov);
-    qemu_io_free(buf);
     return ret;
 }
 
@@ -1318,6 +1354,7 @@ struct aio_ctx {
     bool zflag;
     BlockAcctCookie acct;
     int pattern;
+    BdrvRequestFlags flags;
     struct timespec t1;
 };
 
@@ -1347,7 +1384,8 @@ static void aio_write_done(void *opaque, int ret)
                  ctx->qiov.size, 1, ctx->Cflag);
 out:
     if (!ctx->zflag) {
-        qemu_io_free(ctx->buf);
+        qemu_io_free(ctx->blk, ctx->buf, ctx->qiov.size,
+                     ctx->flags & BDRV_REQ_REGISTERED_BUF);
         qemu_iovec_destroy(&ctx->qiov);
     }
     g_free(ctx);
@@ -1392,7 +1430,8 @@ static void aio_read_done(void *opaque, int ret)
     print_report("read", &t2, ctx->offset, ctx->qiov.size,
                  ctx->qiov.size, 1, ctx->Cflag);
 out:
-    qemu_io_free(ctx->buf);
+    qemu_io_free(ctx->blk, ctx->buf, ctx->qiov.size,
+                 ctx->flags & BDRV_REQ_REGISTERED_BUF);
     qemu_iovec_destroy(&ctx->qiov);
     g_free(ctx);
 }
@@ -1414,10 +1453,11 @@ static void aio_read_help(void)
 " considered successful once the request is submitted, independently\n"
 " of potential I/O errors or pattern mismatches.\n"
 " -C, -- report statistics in a machine parsable format\n"
-" -P, -- use a pattern to verify read data\n"
 " -i, -- treat request as invalid, for exercising stats\n"
-" -v, -- dump buffer to standard output\n"
+" -P, -- use a pattern to verify read data\n"
 " -q, -- quiet mode, do not show I/O statistics\n"
+" -r, -- register I/O buffer\n"
+" -v, -- dump buffer to standard output\n"
 "\n");
 }
 
@@ -1428,7 +1468,7 @@ static const cmdinfo_t aio_read_cmd = {
     .cfunc      = aio_read_f,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-Ciqv] [-P pattern] off len [len..]",
+    .args       = "[-Ciqrv] [-P pattern] off len [len..]",
     .oneline    = "asynchronously reads a number of bytes",
     .help       = aio_read_help,
 };
@@ -1439,7 +1479,7 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
     struct aio_ctx *ctx = g_new0(struct aio_ctx, 1);
 
     ctx->blk = blk;
-    while ((c = getopt(argc, argv, "CP:iqv")) != -1) {
+    while ((c = getopt(argc, argv, "CiP:qrv")) != -1) {
         switch (c) {
         case 'C':
             ctx->Cflag = true;
@@ -1460,6 +1500,9 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
         case 'q':
             ctx->qflag = true;
             break;
+        case 'r':
+            ctx->flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 'v':
             ctx->vflag = true;
             break;
@@ -1486,7 +1529,8 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
     optind++;
 
     nr_iov = argc - optind;
-    ctx->buf = create_iovec(blk, &ctx->qiov, &argv[optind], nr_iov, 0xab);
+    ctx->buf = create_iovec(blk, &ctx->qiov, &argv[optind], nr_iov, 0xab,
+                            ctx->flags & BDRV_REQ_REGISTERED_BUF);
     if (ctx->buf == NULL) {
         block_acct_invalid(blk_get_stats(blk), BLOCK_ACCT_READ);
         g_free(ctx);
@@ -1496,7 +1540,8 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
     clock_gettime(CLOCK_MONOTONIC, &ctx->t1);
     block_acct_start(blk_get_stats(blk), &ctx->acct, ctx->qiov.size,
                      BLOCK_ACCT_READ);
-    blk_aio_preadv(blk, ctx->offset, &ctx->qiov, 0, aio_read_done, ctx);
+    blk_aio_preadv(blk, ctx->offset, &ctx->qiov, ctx->flags, aio_read_done,
+                   ctx);
     return 0;
 }
 
@@ -1517,11 +1562,12 @@ static void aio_write_help(void)
 " Note that due to its asynchronous nature, this command will be\n"
 " considered successful once the request is submitted, independently\n"
 " of potential I/O errors or pattern mismatches.\n"
-" -P, -- use different pattern to fill file\n"
 " -C, -- report statistics in a machine parsable format\n"
 " -f, -- use Force Unit Access semantics\n"
 " -i, -- treat request as invalid, for exercising stats\n"
+" -P, -- use different pattern to fill file\n"
 " -q, -- quiet mode, do not show I/O statistics\n"
+" -r, -- register I/O buffer\n"
 " -u, -- with -z, allow unmapping\n"
 " -z, -- write zeroes using blk_aio_pwrite_zeroes\n"
 "\n");
@@ -1535,7 +1581,7 @@ static const cmdinfo_t aio_write_cmd = {
     .perm       = BLK_PERM_WRITE,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-Cfiquz] [-P pattern] off len [len..]",
+    .args       = "[-Cfiqruz] [-P pattern] off len [len..]",
     .oneline    = "asynchronously writes a number of bytes",
     .help       = aio_write_help,
 };
@@ -1545,22 +1591,24 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
     int nr_iov, c;
     int pattern = 0xcd;
     struct aio_ctx *ctx = g_new0(struct aio_ctx, 1);
-    BdrvRequestFlags flags = 0;
 
     ctx->blk = blk;
-    while ((c = getopt(argc, argv, "CfiqP:uz")) != -1) {
+    while ((c = getopt(argc, argv, "CfiP:qruz")) != -1) {
         switch (c) {
         case 'C':
             ctx->Cflag = true;
             break;
         case 'f':
-            flags |= BDRV_REQ_FUA;
+            ctx->flags |= BDRV_REQ_FUA;
             break;
         case 'q':
             ctx->qflag = true;
             break;
+        case 'r':
+            ctx->flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 'u':
-            flags |= BDRV_REQ_MAY_UNMAP;
+            ctx->flags |= BDRV_REQ_MAY_UNMAP;
             break;
         case 'P':
             pattern = parse_pattern(optarg);
@@ -1596,7 +1644,7 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
         return -EINVAL;
     }
 
-    if ((flags & BDRV_REQ_MAY_UNMAP) && !ctx->zflag) {
+    if ((ctx->flags & BDRV_REQ_MAY_UNMAP) && !ctx->zflag) {
         printf("-u requires -z to be specified\n");
         g_free(ctx);
         return -EINVAL;
@@ -1608,6 +1656,12 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
         return -EINVAL;
     }
 
+    if (ctx->zflag && (ctx->flags & BDRV_REQ_REGISTERED_BUF)) {
+        printf("cannot combine zero write with registered I/O buffer\n");
+        g_free(ctx);
+        return -EINVAL;
+    }
+
     ctx->offset = cvtnum(argv[optind]);
     if (ctx->offset < 0) {
         int ret = ctx->offset;
@@ -1626,12 +1680,12 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
         }
 
         ctx->qiov.size = count;
-        blk_aio_pwrite_zeroes(blk, ctx->offset, count, flags, aio_write_done,
-                              ctx);
+        blk_aio_pwrite_zeroes(blk, ctx->offset, count, ctx->flags,
+                              aio_write_done, ctx);
     } else {
         nr_iov = argc - optind;
         ctx->buf = create_iovec(blk, &ctx->qiov, &argv[optind], nr_iov,
-                                pattern);
+                                pattern, ctx->flags & BDRV_REQ_REGISTERED_BUF);
         if (ctx->buf == NULL) {
             block_acct_invalid(blk_get_stats(blk), BLOCK_ACCT_WRITE);
             g_free(ctx);
@@ -1642,8 +1696,8 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
         block_acct_start(blk_get_stats(blk), &ctx->acct, ctx->qiov.size,
                          BLOCK_ACCT_WRITE);
 
-        blk_aio_pwritev(blk, ctx->offset, &ctx->qiov, flags, aio_write_done,
-                        ctx);
+        blk_aio_pwritev(blk, ctx->offset, &ctx->qiov, ctx->flags,
+                        aio_write_done, ctx);
     }
 
     return 0;
-- 
2.39.1


