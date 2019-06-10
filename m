Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DA73B5F7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 15:27:46 +0200 (CEST)
Received: from localhost ([::1]:46414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haKKv-0003Zr-Om
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 09:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45059)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1haKJr-00039x-D7
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:26:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1haKJq-0003bq-4w
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:26:39 -0400
Received: from relay.sw.ru ([185.231.240.75]:60776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1haKEr-0000Jz-6W; Mon, 10 Jun 2019 09:21:29 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.91)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1haKEn-0003MW-1b; Mon, 10 Jun 2019 16:21:25 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: kwolf@redhat.com,
	mreitz@redhat.com
Date: Mon, 10 Jun 2019 16:21:24 +0300
Message-Id: <20190610132124.3568-1-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v6] qemu-io: add pattern file for write command
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch allows to provide a pattern file for write
command. There was no similar ability before.

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
v6:
  * the pattern file is read once to reduce io

v5:
  * file name initiated with null to make compilers happy

v4:
  * missing signed-off clause added

v3:
  * missing file closing added
  * exclusive flags processing changed
  * buffer void* converted to char* to fix pointer arithmetics
  * file reading error processing added
---
 qemu-io-cmds.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 6 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 09750a23ce..e27203f747 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -343,6 +343,69 @@ static void *qemu_io_alloc(BlockBackend *blk, size_t len, int pattern)
     return buf;
 }
 
+static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
+                                     char *file_name)
+{
+    char *buf, *buf_origin;
+    FILE *f = fopen(file_name, "r");
+    int l;
+
+    if (!f) {
+        printf("'%s': %s\n", file_name, strerror(errno));
+        return NULL;
+    }
+
+    if (qemuio_misalign) {
+        len += MISALIGN_OFFSET;
+    }
+    buf_origin = blk_blockalign(blk, len);
+    memset(buf_origin, 0, len);
+
+    buf = buf_origin;
+
+    l = fread(buf, sizeof(char), len, f);
+
+    if (ferror(f)) {
+        printf("'%s': %s\n", file_name, strerror(errno));
+        goto error;
+    }
+
+    if (l == 0) {
+        printf("'%s' is empty\n", file_name);
+        goto error;
+    }
+
+    if (l < len) {
+        char *file_buf = g_malloc(sizeof(char) * l);
+        memcpy(file_buf, buf, l);
+        len -= l;
+        buf += l;
+
+        while (len > 0) {
+            size_t len_to_copy = len > l ? l : len;
+
+            memcpy(buf, file_buf, len_to_copy);
+
+            len -= len_to_copy;
+            buf += len_to_copy;
+        }
+        qemu_vfree(file_buf);
+    }
+
+    if (qemuio_misalign) {
+        buf_origin += MISALIGN_OFFSET;
+    }
+
+    goto out;
+
+error:
+    qemu_vfree(buf);
+    buf_origin = NULL;
+out:
+    fclose(f);
+    return buf_origin;
+}
+
 static void qemu_io_free(void *p)
 {
     if (qemuio_misalign) {
@@ -965,7 +1028,7 @@ static const cmdinfo_t write_cmd = {
     .perm       = BLK_PERM_WRITE,
     .argmin     = 2,
     .argmax     = -1,
-    .args       = "[-bcCfnquz] [-P pattern] off len",
+    .args       = "[-bcCfnquz] [-P pattern | -s source_file] off len",
     .oneline    = "writes a number of bytes at a specified offset",
     .help       = write_help,
 };
@@ -974,7 +1037,7 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
 {
     struct timeval t1, t2;
     bool Cflag = false, qflag = false, bflag = false;
-    bool Pflag = false, zflag = false, cflag = false;
+    bool Pflag = false, zflag = false, cflag = false, sflag = false;
     int flags = 0;
     int c, cnt, ret;
     char *buf = NULL;
@@ -983,8 +1046,9 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     /* Some compilers get confused and warn if this is not initialized.  */
     int64_t total = 0;
     int pattern = 0xcd;
+    char *file_name = NULL;
 
-    while ((c = getopt(argc, argv, "bcCfnpP:quz")) != -1) {
+    while ((c = getopt(argc, argv, "bcCfnpP:quzs:")) != -1) {
         switch (c) {
         case 'b':
             bflag = true;
@@ -1020,6 +1084,10 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
         case 'z':
             zflag = true;
             break;
+        case 's':
+            sflag = true;
+            file_name = g_strdup(optarg);
+            break;
         default:
             qemuio_command_usage(&write_cmd);
             return -EINVAL;
@@ -1051,8 +1119,9 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
         return -EINVAL;
     }
 
-    if (zflag && Pflag) {
-        printf("-z and -P cannot be specified at the same time\n");
+    if ((int)zflag + (int)Pflag + (int)sflag > 1) {
+        printf("Only one of -z, -P, and -s"
+               "can be specified at the same time\n");
         return -EINVAL;
     }
 
@@ -1088,7 +1157,14 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     }
 
     if (!zflag) {
-        buf = qemu_io_alloc(blk, count, pattern);
+        if (sflag) {
+            buf = qemu_io_alloc_from_file(blk, count, file_name);
+            if (!buf) {
+                return -EINVAL;
+            }
+        } else {
+            buf = qemu_io_alloc(blk, count, pattern);
+        }
     }
 
     gettimeofday(&t1, NULL);
-- 
2.17.0


