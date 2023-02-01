Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A8686A41
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:28:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNF20-0001Yh-Vy; Wed, 01 Feb 2023 10:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNF1r-0001Xz-RM
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:28:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNF1p-00071c-Ba
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675265284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2hIXF/mYogunec/yrmU1P7RyLBw703SG1y1M7FpzMM=;
 b=GfeXox/cViOVutyQGWyrND5zbqMZbHeqcW8d3Mat8Arnjq5JKJTs976oAyHbHRjW11DheF
 0Who9f6/wRxZlaQMgw/sH15CH0lICYXpydsqx1BfbxOdar6r7mNC79f4p+fD8Ev3lnNSZV
 oWumXEUifBanfWsjQDbn9JMrz///4JI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-_8xmmDIaMjar3CnYYfHXyg-1; Wed, 01 Feb 2023 10:28:02 -0500
X-MC-Unique: _8xmmDIaMjar3CnYYfHXyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6E29385F37A;
 Wed,  1 Feb 2023 15:28:01 +0000 (UTC)
Received: from localhost (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE504112132C;
 Wed,  1 Feb 2023 15:28:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 3/4] qemu-io: add -r option to register I/O buffer
Date: Wed,  1 Feb 2023 10:27:50 -0500
Message-Id: <20230201152751.270508-4-stefanha@redhat.com>
In-Reply-To: <20230201152751.270508-1-stefanha@redhat.com>
References: <20230201152751.270508-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qemu-io-cmds.c | 167 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 114 insertions(+), 53 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index c0125d14c0..4b8dbef36d 100644
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
 
@@ -347,17 +348,24 @@ static void *qemu_io_alloc(BlockBackend *blk, size_t len, int pattern)
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
     }
+    if (unregister_buf) {
+        blk_unregister_buf(blk, p, len);
+    }
     qemu_vfree(p);
 }
 
@@ -371,12 +379,13 @@ static void qemu_io_free(void *p)
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
     char *buf, *buf_origin;
     FILE *f = fopen(file_name, "r");
@@ -414,6 +423,10 @@ static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
     fclose(f);
     f = NULL;
 
+    if (register_buf) {
+        blk_register_buf(blk, buf_origin, len, &error_abort);
+    }
+
     if (len > pattern_len) {
         len -= pattern_len;
         buf += pattern_len;
@@ -431,7 +444,11 @@ static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
     return buf_origin;
 
 error:
-    qemu_io_free(buf_origin);
+    /*
+     * This code path is only taken before blk_register_buf() is called, so
+     * hardcode the qemu_io_free() unregister_buf argument to false.
+     */
+    qemu_io_free(blk, buf_origin, len, false);
     if (f) {
         fclose(f);
     }
@@ -490,7 +507,7 @@ static void print_report(const char *op, struct timespec *t, int64_t offset,
  */
 static void *
 create_iovec(BlockBackend *blk, QEMUIOVector *qiov, char **argv, int nr_iov,
-             int pattern)
+             int pattern, bool register_buf)
 {
     size_t *sizes = g_new0(size_t, nr_iov);
     size_t count = 0;
@@ -526,7 +543,7 @@ create_iovec(BlockBackend *blk, QEMUIOVector *qiov, char **argv, int nr_iov,
 
     qemu_iovec_init(qiov, nr_iov);
 
-    buf = p = qemu_io_alloc(blk, count, pattern);
+    buf = p = qemu_io_alloc(blk, count, pattern, register_buf);
 
     for (i = 0; i < nr_iov; i++) {
         qemu_iovec_add(qiov, p, sizes[i]);
@@ -539,7 +556,7 @@ fail:
 }
 
 static int do_pread(BlockBackend *blk, char *buf, int64_t offset,
-                    int64_t bytes, int64_t *total)
+                    int64_t bytes, BdrvRequestFlags flags, int64_t *total)
 {
     int ret;
 
@@ -547,7 +564,7 @@ static int do_pread(BlockBackend *blk, char *buf, int64_t offset,
         return -ERANGE;
     }
 
-    ret = blk_pread(blk, offset, bytes, (uint8_t *)buf, 0);
+    ret = blk_pread(blk, offset, bytes, (uint8_t *)buf, flags);
     if (ret < 0) {
         return ret;
     }
@@ -675,11 +692,11 @@ static void aio_rw_done(void *opaque, int ret)
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
@@ -719,6 +736,7 @@ static void read_help(void)
 " -p, -- ignored for backwards compatibility\n"
 " -P, -- use a pattern to verify read data\n"
 " -q, -- quiet mode, do not show I/O statistics\n"
+" -r, -- register I/O buffer\n"
 " -s, -- start offset for pattern verification (only with -P)\n"
 " -v, -- dump buffer to standard output\n"
 "\n");
@@ -732,7 +750,7 @@ static const cmdinfo_t read_cmd = {
     .cfunc      = read_f,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-abCqv] [-P pattern [-s off] [-l len]] off len",
+    .args       = "[-abCqrv] [-P pattern [-s off] [-l len]] off len",
     .oneline    = "reads a number of bytes at a specified offset",
     .help       = read_help,
 };
@@ -750,6 +768,7 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
     int64_t total = 0;
     int pattern = 0;
     int64_t pattern_offset = 0, pattern_count = 0;
+    BdrvRequestFlags flags = 0;
 
     while ((c = getopt(argc, argv, "bCl:pP:qs:v")) != -1) {
         switch (c) {
@@ -780,6 +799,9 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
         case 'q':
             qflag = true;
             break;
+        case 'r':
+            flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 's':
             sflag = true;
             pattern_offset = cvtnum(optarg);
@@ -844,15 +866,20 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
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
 
@@ -889,7 +916,7 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
     print_report("read", &t2, offset, count, total, cnt, Cflag);
 
 out:
-    qemu_io_free(buf);
+    qemu_io_free(blk, buf, count, flags & BDRV_REQ_REGISTERED_BUF);
     return ret;
 }
 
@@ -907,8 +934,9 @@ static void readv_help(void)
 " Uses multiple iovec buffers if more than one byte range is specified.\n"
 " -C, -- report statistics in a machine parsable format\n"
 " -P, -- use a pattern to verify read data\n"
-" -v, -- dump buffer to standard output\n"
 " -q, -- quiet mode, do not show I/O statistics\n"
+" -r, -- register I/O buffer\n"
+" -v, -- dump buffer to standard output\n"
 "\n");
 }
 
@@ -919,7 +947,7 @@ static const cmdinfo_t readv_cmd = {
     .cfunc      = readv_f,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-Cqv] [-P pattern] off len [len..]",
+    .args       = "[-Cqrv] [-P pattern] off len [len..]",
     .oneline    = "reads a number of bytes at a specified offset",
     .help       = readv_help,
 };
@@ -937,8 +965,9 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
     QEMUIOVector qiov;
     int pattern = 0;
     bool Pflag = false;
+    BdrvRequestFlags flags = 0;
 
-    while ((c = getopt(argc, argv, "CP:qv")) != -1) {
+    while ((c = getopt(argc, argv, "CP:qrv")) != -1) {
         switch (c) {
         case 'C':
             Cflag = true;
@@ -953,6 +982,9 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
         case 'q':
             qflag = true;
             break;
+        case 'r':
+            flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 'v':
             vflag = true;
             break;
@@ -976,13 +1008,14 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
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
@@ -1017,8 +1050,8 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
     print_report("read", &t2, offset, qiov.size, total, cnt, Cflag);
 
 out:
+    qemu_io_free(blk, buf, qiov.size, flags & BDRV_REQ_REGISTERED_BUF);
     qemu_iovec_destroy(&qiov);
-    qemu_io_free(buf);
     return ret;
 }
 
@@ -1035,13 +1068,14 @@ static void write_help(void)
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
 " -z, -- write zeroes using blk_co_pwrite_zeroes\n"
 "\n");
@@ -1056,7 +1090,7 @@ static const cmdinfo_t write_cmd = {
     .perm       = BLK_PERM_WRITE,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-bcCfnquz] [-P pattern | -s source_file] off len",
+    .args       = "[-bcCfnqruz] [-P pattern | -s source_file] off len",
     .oneline    = "writes a number of bytes at a specified offset",
     .help       = write_help,
 };
@@ -1076,7 +1110,7 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     int pattern = 0xcd;
     const char *file_name = NULL;
 
-    while ((c = getopt(argc, argv, "bcCfnpP:qs:uz")) != -1) {
+    while ((c = getopt(argc, argv, "bcCfnpP:qrs:uz")) != -1) {
         switch (c) {
         case 'b':
             bflag = true;
@@ -1106,6 +1140,9 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
         case 'q':
             qflag = true;
             break;
+        case 'r':
+            flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 's':
             sflag = true;
             file_name = optarg;
@@ -1185,14 +1222,21 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
         }
     }
 
-    if (!zflag) {
+    if (zflag) {
+        if (flags & BDRV_REQ_REGISTERED_BUF) {
+            printf("cannot combine zero write with register I/O buffer\n");
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
 
@@ -1226,7 +1270,7 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
 
 out:
     if (!zflag) {
-        qemu_io_free(buf);
+        qemu_io_free(blk, buf, count, flags & BDRV_REQ_REGISTERED_BUF);
     }
     return ret;
 }
@@ -1243,10 +1287,11 @@ writev_help(void)
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
 
@@ -1258,7 +1303,7 @@ static const cmdinfo_t writev_cmd = {
     .perm       = BLK_PERM_WRITE,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-Cfq] [-P pattern] off len [len..]",
+    .args       = "[-Cfqr] [-P pattern] off len [len..]",
     .oneline    = "writes a number of bytes at a specified offset",
     .help       = writev_help,
 };
@@ -1277,7 +1322,7 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
     int pattern = 0xcd;
     QEMUIOVector qiov;
 
-    while ((c = getopt(argc, argv, "CfqP:")) != -1) {
+    while ((c = getopt(argc, argv, "CfP:qr")) != -1) {
         switch (c) {
         case 'C':
             Cflag = true;
@@ -1288,6 +1333,9 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
         case 'q':
             qflag = true;
             break;
+        case 'r':
+            flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 'P':
             pattern = parse_pattern(optarg);
             if (pattern < 0) {
@@ -1313,7 +1361,8 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
     optind++;
 
     nr_iov = argc - optind;
-    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern);
+    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern,
+                       flags & BDRV_REQ_REGISTERED_BUF);
     if (buf == NULL) {
         return -EINVAL;
     }
@@ -1338,8 +1387,8 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
     t2 = tsub(t2, t1);
     print_report("wrote", &t2, offset, qiov.size, total, cnt, Cflag);
 out:
+    qemu_io_free(blk, buf, qiov.size, flags & BDRV_REQ_REGISTERED_BUF);
     qemu_iovec_destroy(&qiov);
-    qemu_io_free(buf);
     return ret;
 }
 
@@ -1355,6 +1404,7 @@ struct aio_ctx {
     bool zflag;
     BlockAcctCookie acct;
     int pattern;
+    BdrvRequestFlags flags;
     struct timespec t1;
 };
 
@@ -1384,8 +1434,9 @@ static void aio_write_done(void *opaque, int ret)
                  ctx->qiov.size, 1, ctx->Cflag);
 out:
     if (!ctx->zflag) {
-        qemu_io_free(ctx->buf);
         qemu_iovec_destroy(&ctx->qiov);
+        qemu_io_free(ctx->blk, ctx->buf, ctx->qiov.size,
+                     ctx->flags & BDRV_REQ_REGISTERED_BUF);
     }
     g_free(ctx);
 }
@@ -1429,7 +1480,8 @@ static void aio_read_done(void *opaque, int ret)
     print_report("read", &t2, ctx->offset, ctx->qiov.size,
                  ctx->qiov.size, 1, ctx->Cflag);
 out:
-    qemu_io_free(ctx->buf);
+    qemu_io_free(ctx->blk, ctx->buf, ctx->qiov.size,
+                 ctx->flags & BDRV_REQ_REGISTERED_BUF);
     qemu_iovec_destroy(&ctx->qiov);
     g_free(ctx);
 }
@@ -1451,10 +1503,11 @@ static void aio_read_help(void)
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
 
@@ -1465,7 +1518,7 @@ static const cmdinfo_t aio_read_cmd = {
     .cfunc      = aio_read_f,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-Ciqv] [-P pattern] off len [len..]",
+    .args       = "[-Ciqrv] [-P pattern] off len [len..]",
     .oneline    = "asynchronously reads a number of bytes",
     .help       = aio_read_help,
 };
@@ -1476,7 +1529,7 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
     struct aio_ctx *ctx = g_new0(struct aio_ctx, 1);
 
     ctx->blk = blk;
-    while ((c = getopt(argc, argv, "CP:iqv")) != -1) {
+    while ((c = getopt(argc, argv, "CiP:qrv")) != -1) {
         switch (c) {
         case 'C':
             ctx->Cflag = true;
@@ -1497,6 +1550,9 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
         case 'q':
             ctx->qflag = true;
             break;
+        case 'r':
+            ctx->flags |= BDRV_REQ_REGISTERED_BUF;
+            break;
         case 'v':
             ctx->vflag = true;
             break;
@@ -1523,7 +1579,8 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
     optind++;
 
     nr_iov = argc - optind;
-    ctx->buf = create_iovec(blk, &ctx->qiov, &argv[optind], nr_iov, 0xab);
+    ctx->buf = create_iovec(blk, &ctx->qiov, &argv[optind], nr_iov, 0xab,
+                            ctx->flags & BDRV_REQ_REGISTERED_BUF);
     if (ctx->buf == NULL) {
         block_acct_invalid(blk_get_stats(blk), BLOCK_ACCT_READ);
         g_free(ctx);
@@ -1533,7 +1590,8 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
     clock_gettime(CLOCK_MONOTONIC, &ctx->t1);
     block_acct_start(blk_get_stats(blk), &ctx->acct, ctx->qiov.size,
                      BLOCK_ACCT_READ);
-    blk_aio_preadv(blk, ctx->offset, &ctx->qiov, 0, aio_read_done, ctx);
+    blk_aio_preadv(blk, ctx->offset, &ctx->qiov, ctx->flags, aio_read_done,
+                   ctx);
     return 0;
 }
 
@@ -1554,11 +1612,12 @@ static void aio_write_help(void)
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
@@ -1572,7 +1631,7 @@ static const cmdinfo_t aio_write_cmd = {
     .perm       = BLK_PERM_WRITE,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-Cfiquz] [-P pattern] off len [len..]",
+    .args       = "[-Cfiqruz] [-P pattern] off len [len..]",
     .oneline    = "asynchronously writes a number of bytes",
     .help       = aio_write_help,
 };
@@ -1582,22 +1641,24 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
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
@@ -1633,7 +1694,7 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
         return -EINVAL;
     }
 
-    if ((flags & BDRV_REQ_MAY_UNMAP) && !ctx->zflag) {
+    if ((ctx->flags & BDRV_REQ_MAY_UNMAP) && !ctx->zflag) {
         printf("-u requires -z to be specified\n");
         g_free(ctx);
         return -EINVAL;
@@ -1663,12 +1724,12 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
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
@@ -1679,8 +1740,8 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
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


