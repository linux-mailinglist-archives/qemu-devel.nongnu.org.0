Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4864B4B12B5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:27:55 +0100 (CET)
Received: from localhost ([::1]:59050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICIU-0006cp-2B
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:27:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nI9Y1-0003kg-FR; Thu, 10 Feb 2022 08:31:46 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:48311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nI9Xx-0004mk-Jy; Thu, 10 Feb 2022 08:31:45 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id AE00346AB4;
 Thu, 10 Feb 2022 14:31:31 +0100 (CET)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] qemu-img: dd: add osize and read from/to stdin/stdout
Date: Thu, 10 Feb 2022 14:31:20 +0100
Message-Id: <20220210133123.347350-2-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210133123.347350-1-f.ebner@proxmox.com>
References: <20220210133123.347350-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, w.bumiller@proxmox.com, qemu-block@nongnu.org,
 aderumier@odiso.com, hreitz@redhat.com, t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wolfgang Bumiller <w.bumiller@proxmox.com>

Neither convert nor dd were previously able to write to or
read from a pipe. Particularly serializing an image file
into a raw stream or vice versa can be useful, but using
`qemu-img convert -f qcow2 -O raw foo.qcow2 /dev/stdout` in
a pipe will fail trying to seek.

While dd and convert have overlapping use cases, `dd` is a
simple read/write loop while convert is much more
sophisticated and has ways to dealing with holes and blocks
of zeroes.
Since these typically can't be detected in pipes via
SEEK_DATA/HOLE or skipped while writing, dd seems to be the
better choice for implementing stdin/stdout streams.

This patch causes "if" and "of" to default to stdin and
stdout respectively, allowing only the "raw" format to be
used in these cases.
Since the input can now be a pipe we have no way of
detecting the size of the output image to create. Since we
also want to support images with a size not matching the
dd command's "bs" parameter (which, together with "count"
could be used to calculate the desired size, and is already
used to limit it), the "osize" option is added to explicitly
override the output file's size.

Signed-off-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
Signed-off-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
[FE: add documentation
     avoid error when osize is larger than input image's size
     fail if both count and osize are specified
     fail if skip is specified when reading from stdin]
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---
 docs/tools/qemu-img.rst |  17 +++-
 qemu-img-cmds.hx        |   4 +-
 qemu-img.c              | 201 ++++++++++++++++++++++++++--------------
 3 files changed, 146 insertions(+), 76 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 8885ea11cf..775eaf3097 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -220,16 +220,20 @@ Parameters to dd subcommand:
 
 .. option:: if=INPUT
 
-  Sets the input file
+  Sets the input file (defaults to STDIN)
 
 .. option:: of=OUTPUT
 
-  Sets the output file
+  Sets the output file (defaults to STDOUT)
 
 .. option:: skip=BLOCKS
 
   Sets the number of input blocks to skip
 
+.. option:: osize=OUTPUT_SIZE
+
+  Sets the output image's size
+
 Parameters to snapshot subcommand:
 
 .. program:: qemu-img-snapshot
@@ -488,10 +492,10 @@ Command description:
   it doesn't need to be specified separately in this case.
 
 
-.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] if=INPUT of=OUTPUT
+.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
 
-  dd copies from *INPUT* file to *OUTPUT* file converting it from
-  *FMT* format to *OUTPUT_FMT* format.
+  dd copies from *INPUT* file (default: STDIN) to *OUTPUT* file (default:
+  STDOUT) converting it from *FMT* format to *OUTPUT_FMT* format.
 
   The data is by default read and written using blocks of 512 bytes but can be
   modified by specifying *BLOCK_SIZE*. If count=\ *BLOCKS* is specified
@@ -499,6 +503,9 @@ Command description:
 
   The size syntax is similar to :manpage:`dd(1)`'s size syntax.
 
+  The output image will be created with size *OUTPUT_SIZE* and at most this many
+  bytes will be copied.
+
 .. option:: info [--object OBJECTDEF] [--image-opts] [-f FMT] [--output=OFMT] [--backing-chain] [-U] FILENAME
 
   Give information about the disk image *FILENAME*. Use it in
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 1b1dab5b17..e4935365c9 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -58,9 +58,9 @@ SRST
 ERST
 
 DEF("dd", img_dd,
-    "dd [--image-opts] [-U] [-f fmt] [-O output_fmt] [bs=block_size] [count=blocks] [skip=blocks] if=input of=output")
+    "dd [--image-opts] [-U] [-f fmt] [-O output_fmt] [bs=block_size] [count=blocks] [skip=blocks] [osize=output_size] [if=input] [of=output]")
 SRST
-.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] if=INPUT of=OUTPUT
+.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
 ERST
 
 DEF("info", img_info,
diff --git a/qemu-img.c b/qemu-img.c
index 6fe2466032..ea488fd190 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4819,10 +4819,12 @@ static int img_bitmap(int argc, char **argv)
 #define C_IF      04
 #define C_OF      010
 #define C_SKIP    020
+#define C_OSIZE   040
 
 struct DdInfo {
     unsigned int flags;
     int64_t count;
+    int64_t osize;
 };
 
 struct DdIo {
@@ -4898,6 +4900,19 @@ static int img_dd_skip(const char *arg,
     return 0;
 }
 
+static int img_dd_osize(const char *arg,
+                        struct DdIo *in, struct DdIo *out,
+                        struct DdInfo *dd)
+{
+    dd->osize = cvtnum("osize", arg);
+
+    if (dd->osize < 0) {
+        return 1;
+    }
+
+    return 0;
+}
+
 static int img_dd(int argc, char **argv)
 {
     int ret = 0;
@@ -4912,12 +4927,13 @@ static int img_dd(int argc, char **argv)
     int c, i;
     const char *out_fmt = "raw";
     const char *fmt = NULL;
-    int64_t size = 0;
+    int64_t size = 0, readsize = 0;
     int64_t block_count = 0, out_pos, in_pos;
     bool force_share = false;
     struct DdInfo dd = {
         .flags = 0,
         .count = 0,
+        .osize = 0,
     };
     struct DdIo in = {
         .bsz = 512, /* Block size is by default 512 bytes */
@@ -4938,6 +4954,7 @@ static int img_dd(int argc, char **argv)
         { "if", img_dd_if, C_IF },
         { "of", img_dd_of, C_OF },
         { "skip", img_dd_skip, C_SKIP },
+        { "osize", img_dd_osize, C_OSIZE },
         { NULL, NULL, 0 }
     };
     const struct option long_options[] = {
@@ -5013,91 +5030,122 @@ static int img_dd(int argc, char **argv)
         arg = NULL;
     }
 
-    if (!(dd.flags & C_IF && dd.flags & C_OF)) {
-        error_report("Must specify both input and output files");
+    if (!(dd.flags & C_IF) && (!fmt || strcmp(fmt, "raw") != 0)) {
+        error_report("Input format must be raw when reading from stdin");
         ret = -1;
         goto out;
     }
-
-    blk1 = img_open(image_opts, in.filename, fmt, 0, false, false,
-                    force_share);
-
-    if (!blk1) {
-        ret = -1;
-        goto out;
-    }
-
-    drv = bdrv_find_format(out_fmt);
-    if (!drv) {
-        error_report("Unknown file format");
-        ret = -1;
-        goto out;
-    }
-    proto_drv = bdrv_find_protocol(out.filename, true, &local_err);
-
-    if (!proto_drv) {
-        error_report_err(local_err);
+    if (!(dd.flags & C_OF) && strcmp(out_fmt, "raw") != 0) {
+        error_report("Output format must be raw when writing to stdout");
         ret = -1;
         goto out;
     }
-    if (!drv->create_opts) {
-        error_report("Format driver '%s' does not support image creation",
-                     drv->format_name);
+    if (dd.flags & C_OSIZE && dd.flags & C_COUNT) {
+        error_report("Cannot specify both count and osize");
         ret = -1;
         goto out;
     }
-    if (!proto_drv->create_opts) {
-        error_report("Protocol driver '%s' does not support image creation",
-                     proto_drv->format_name);
+    if (!(dd.flags & C_IF) && dd.flags & C_SKIP) {
+        error_report("Cannot specify skip when reading from stdin");
         ret = -1;
         goto out;
     }
-    create_opts = qemu_opts_append(create_opts, drv->create_opts);
-    create_opts = qemu_opts_append(create_opts, proto_drv->create_opts);
 
-    opts = qemu_opts_create(create_opts, NULL, 0, &error_abort);
+    if (dd.flags & C_IF) {
+        blk1 = img_open(image_opts, in.filename, fmt, 0, false, false,
+                        force_share);
 
-    size = blk_getlength(blk1);
-    if (size < 0) {
-        error_report("Failed to get size for '%s'", in.filename);
+        if (!blk1) {
+            ret = -1;
+            goto out;
+        }
+    }
+
+    if (dd.flags & C_IF) {
+        size = blk_getlength(blk1);
+        if (size < 0) {
+            error_report("Failed to get size for '%s'", in.filename);
+            ret = -1;
+            goto out;
+        }
+    } else if (dd.flags & C_OSIZE) {
+        size = dd.osize;
+    } else if (dd.flags & C_COUNT) {
+        size = dd.count * in.bsz;
+    } else {
+        error_report("Output size must be known when reading from stdin");
         ret = -1;
         goto out;
     }
 
-    if (dd.flags & C_COUNT && dd.count <= INT64_MAX / in.bsz &&
-        dd.count * in.bsz < size) {
+    if (!(dd.flags & C_OSIZE) && dd.flags & C_COUNT &&
+        dd.count <= INT64_MAX / in.bsz && dd.count * in.bsz < size) {
         size = dd.count * in.bsz;
     }
 
-    /* Overflow means the specified offset is beyond input image's size */
-    if (dd.flags & C_SKIP && (in.offset > INT64_MAX / in.bsz ||
-                              size < in.bsz * in.offset)) {
-        qemu_opt_set_number(opts, BLOCK_OPT_SIZE, 0, &error_abort);
-    } else {
-        qemu_opt_set_number(opts, BLOCK_OPT_SIZE,
-                            size - in.bsz * in.offset, &error_abort);
-    }
+    if (dd.flags & C_OF) {
+        drv = bdrv_find_format(out_fmt);
+        if (!drv) {
+            error_report("Unknown file format");
+            ret = -1;
+            goto out;
+        }
+        proto_drv = bdrv_find_protocol(out.filename, true, &local_err);
 
-    ret = bdrv_create(drv, out.filename, opts, &local_err);
-    if (ret < 0) {
-        error_reportf_err(local_err,
-                          "%s: error while creating output image: ",
-                          out.filename);
-        ret = -1;
-        goto out;
-    }
+        if (!proto_drv) {
+            error_report_err(local_err);
+            ret = -1;
+            goto out;
+        }
+        if (!drv->create_opts) {
+            error_report("Format driver '%s' does not support image creation",
+                         drv->format_name);
+            ret = -1;
+            goto out;
+        }
+        if (!proto_drv->create_opts) {
+            error_report("Protocol driver '%s' does not support image creation",
+                         proto_drv->format_name);
+            ret = -1;
+            goto out;
+        }
+        create_opts = qemu_opts_append(create_opts, drv->create_opts);
+        create_opts = qemu_opts_append(create_opts, proto_drv->create_opts);
 
-    /* TODO, we can't honour --image-opts for the target,
-     * since it needs to be given in a format compatible
-     * with the bdrv_create() call above which does not
-     * support image-opts style.
-     */
-    blk2 = img_open_file(out.filename, NULL, out_fmt, BDRV_O_RDWR,
-                         false, false, false);
+        opts = qemu_opts_create(create_opts, NULL, 0, &error_abort);
 
-    if (!blk2) {
-        ret = -1;
-        goto out;
+        /* Overflow means the specified offset is beyond input image's size */
+        if (dd.flags & C_OSIZE) {
+            qemu_opt_set_number(opts, BLOCK_OPT_SIZE, dd.osize, &error_abort);
+        } else if (dd.flags & C_SKIP && (in.offset > INT64_MAX / in.bsz ||
+                                         size < in.bsz * in.offset)) {
+            qemu_opt_set_number(opts, BLOCK_OPT_SIZE, 0, &error_abort);
+        } else {
+            qemu_opt_set_number(opts, BLOCK_OPT_SIZE,
+                                size - in.bsz * in.offset, &error_abort);
+        }
+
+        ret = bdrv_create(drv, out.filename, opts, &local_err);
+        if (ret < 0) {
+            error_reportf_err(local_err,
+                              "%s: error while creating output image: ",
+                              out.filename);
+            ret = -1;
+            goto out;
+        }
+
+        /* TODO, we can't honour --image-opts for the target,
+         * since it needs to be given in a format compatible
+         * with the bdrv_create() call above which does not
+         * support image-opts style.
+         */
+        blk2 = img_open_file(out.filename, NULL, out_fmt, BDRV_O_RDWR,
+                             false, false, false);
+
+        if (!blk2) {
+            ret = -1;
+            goto out;
+        }
     }
 
     if (dd.flags & C_SKIP && (in.offset > INT64_MAX / in.bsz ||
@@ -5113,13 +5161,24 @@ static int img_dd(int argc, char **argv)
 
     in.buf = g_new(uint8_t, in.bsz);
 
-    for (out_pos = 0; in_pos < size; block_count++) {
+    if (dd.flags & C_OSIZE && dd.osize < size - in_pos) {
+        readsize = in_pos + dd.osize;
+    } else {
+        readsize = size;
+    }
+    for (out_pos = 0; in_pos < readsize; block_count++) {
         int in_ret, out_ret;
-
-        if (in_pos + in.bsz > size) {
-            in_ret = blk_pread(blk1, in_pos, in.buf, size - in_pos);
+        size_t in_bsz = in_pos + in.bsz > readsize ? readsize - in_pos : in.bsz;
+        if (blk1) {
+            in_ret = blk_pread(blk1, in_pos, in.buf, in_bsz);
         } else {
-            in_ret = blk_pread(blk1, in_pos, in.buf, in.bsz);
+            in_ret = read(STDIN_FILENO, in.buf, in_bsz);
+            if (in_ret == 0) {
+                /* early EOF is considered an error */
+                error_report("Input ended unexpectedly");
+                ret = -1;
+                goto out;
+            }
         }
         if (in_ret < 0) {
             error_report("error while reading from input image file: %s",
@@ -5129,9 +5188,13 @@ static int img_dd(int argc, char **argv)
         }
         in_pos += in_ret;
 
-        out_ret = blk_pwrite(blk2, out_pos, in.buf, in_ret, 0);
+        if (blk2) {
+            out_ret = blk_pwrite(blk2, out_pos, in.buf, in_ret, 0);
+        } else {
+            out_ret = write(STDOUT_FILENO, in.buf, in_ret);
+        }
 
-        if (out_ret < 0) {
+        if (out_ret != in_ret) {
             error_report("error while writing to output image file: %s",
                          strerror(-out_ret));
             ret = -1;
-- 
2.30.2



