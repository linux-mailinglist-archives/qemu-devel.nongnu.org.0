Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F14D3077AA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:08:22 +0100 (CET)
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57y8-0007gX-Uu
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l57xD-0007ET-9L
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:07:23 -0500
Received: from kerio.kamp.de ([195.62.97.192]:52547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l57xA-0003NO-TD
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:07:23 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:07:05 +0100
Received: (qmail 62107 invoked from network); 28 Jan 2021 14:07:10 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 28 Jan 2021 14:07:10 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 6E75C13D87F; Thu, 28 Jan 2021 15:07:10 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH] qemu-img: add seek and -n option to dd command
Date: Thu, 28 Jan 2021 15:07:04 +0100
Message-Id: <20210128140704.6547-1-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Lieven <pl@kamp.de>

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index b615aa8419..7d4564c2b8 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -209,6 +209,10 @@ Parameters to dd subcommand:
 
 .. program:: qemu-img-dd
 
+.. option:: -n
+
+  Skip the creation of the output file
+
 .. option:: bs=BLOCK_SIZE
 
   Defines the block size
@@ -229,6 +233,10 @@ Parameters to dd subcommand:
 
   Sets the number of input blocks to skip
 
+.. option:: sseek=BLOCKS
+
+  Sets the number of blocks to seek into the output
+
 Parameters to snapshot subcommand:
 
 .. program:: qemu-img-snapshot
diff --git a/qemu-img.c b/qemu-img.c
index 8597d069af..d7f390e382 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -213,12 +213,17 @@ static void QEMU_NORETURN help(void)
            "  '-s' run in Strict mode - fail on different image size or sector allocation\n"
            "\n"
            "Parameters to dd subcommand:\n"
+           "  '-n' skips the target volume creation (useful if the volume is created\n"
+           "       prior to running qemu-img). Note that he behaviour is not identical to\n"
+           "       original dd option conv=nocreat. The output is neither truncated nor\n"
+           "       is it possible to write past the end of an existing file.\n"
            "  'bs=BYTES' read and write up to BYTES bytes at a time "
            "(default: 512)\n"
            "  'count=N' copy only N input blocks\n"
            "  'if=FILE' read from FILE\n"
            "  'of=FILE' write to FILE\n"
-           "  'skip=N' skip N bs-sized blocks at the start of input\n";
+           "  'skip=N' skip N bs-sized blocks at the start of input\n"
+           "  'seek=N' seek N bs-sized blocks into the output\n";
 
     printf("%s\nSupported formats:", help_msg);
     bdrv_iterate_format(format_print, NULL, false);
@@ -4885,6 +4890,7 @@ static int img_bitmap(int argc, char **argv)
 #define C_IF      04
 #define C_OF      010
 #define C_SKIP    020
+#define C_SEEK    040
 
 struct DdInfo {
     unsigned int flags;
@@ -4964,6 +4970,19 @@ static int img_dd_skip(const char *arg,
     return 0;
 }
 
+static int img_dd_seek(const char *arg,
+                       struct DdIo *in, struct DdIo *out,
+                       struct DdInfo *dd)
+{
+    out->offset = cvtnum("seek", arg);
+
+    if (in->offset < 0) {
+        return 1;
+    }
+
+    return 0;
+}
+
 static int img_dd(int argc, char **argv)
 {
     int ret = 0;
@@ -4980,7 +4999,7 @@ static int img_dd(int argc, char **argv)
     const char *fmt = NULL;
     int64_t size = 0;
     int64_t block_count = 0, out_pos, in_pos;
-    bool force_share = false;
+    bool force_share = false, skip_create = false;
     struct DdInfo dd = {
         .flags = 0,
         .count = 0,
@@ -5004,6 +5023,7 @@ static int img_dd(int argc, char **argv)
         { "if", img_dd_if, C_IF },
         { "of", img_dd_of, C_OF },
         { "skip", img_dd_skip, C_SKIP },
+        { "seek", img_dd_seek, C_SEEK },
         { NULL, NULL, 0 }
     };
     const struct option long_options[] = {
@@ -5014,7 +5034,7 @@ static int img_dd(int argc, char **argv)
         { 0, 0, 0, 0 }
     };
 
-    while ((c = getopt_long(argc, argv, ":hf:O:U", long_options, NULL))) {
+    while ((c = getopt_long(argc, argv, ":hf:O:Un", long_options, NULL))) {
         if (c == EOF) {
             break;
         }
@@ -5037,6 +5057,9 @@ static int img_dd(int argc, char **argv)
         case 'U':
             force_share = true;
             break;
+        case 'n':
+            skip_create = true;
+            break;
         case OPTION_OBJECT:
             if (!qemu_opts_parse_noisily(&qemu_object_opts, optarg, true)) {
                 ret = -1;
@@ -5116,22 +5139,25 @@ static int img_dd(int argc, char **argv)
         ret = -1;
         goto out;
     }
-    if (!drv->create_opts) {
-        error_report("Format driver '%s' does not support image creation",
-                     drv->format_name);
-        ret = -1;
-        goto out;
-    }
-    if (!proto_drv->create_opts) {
-        error_report("Protocol driver '%s' does not support image creation",
-                     proto_drv->format_name);
-        ret = -1;
-        goto out;
-    }
-    create_opts = qemu_opts_append(create_opts, drv->create_opts);
-    create_opts = qemu_opts_append(create_opts, proto_drv->create_opts);
 
-    opts = qemu_opts_create(create_opts, NULL, 0, &error_abort);
+    if (!skip_create) {
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
+
+        opts = qemu_opts_create(create_opts, NULL, 0, &error_abort);
+    }
 
     size = blk_getlength(blk1);
     if (size < 0) {
@@ -5145,22 +5171,25 @@ static int img_dd(int argc, char **argv)
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
+    if (!skip_create) {
+        /* Overflow means the specified offset is beyond input image's size */
+        if (dd.flags & C_SKIP && (in.offset > INT64_MAX / in.bsz ||
+                                  size < in.bsz * in.offset)) {
+            qemu_opt_set_number(opts, BLOCK_OPT_SIZE, 0, &error_abort);
+        } else {
+            qemu_opt_set_number(opts, BLOCK_OPT_SIZE,
+                                out.bsz * out.offset + size -
+                                in.bsz * in.offset, &error_abort);
+        }
 
-    ret = bdrv_create(drv, out.filename, opts, &local_err);
-    if (ret < 0) {
-        error_reportf_err(local_err,
-                          "%s: error while creating output image: ",
-                          out.filename);
-        ret = -1;
-        goto out;
+        ret = bdrv_create(drv, out.filename, opts, &local_err);
+        if (ret < 0) {
+            error_reportf_err(local_err,
+                              "%s: error while creating output image: ",
+                              out.filename);
+            ret = -1;
+            goto out;
+        }
     }
 
     /* TODO, we can't honour --image-opts for the target,
@@ -5189,7 +5218,7 @@ static int img_dd(int argc, char **argv)
 
     in.buf = g_new(uint8_t, in.bsz);
 
-    for (out_pos = 0; in_pos < size; block_count++) {
+    for (out_pos = out.offset * out.bsz; in_pos < size; block_count++) {
         int in_ret, out_ret;
 
         if (in_pos + in.bsz > size) {
-- 
2.17.1



