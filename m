Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5DC4B140F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:22:18 +0100 (CET)
Received: from localhost ([::1]:54056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nID97-0003vf-Hq
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:22:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nI9Y4-0003ow-BW; Thu, 10 Feb 2022 08:31:52 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:51161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nI9Xx-0004md-Jx; Thu, 10 Feb 2022 08:31:47 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 124F846DCD;
 Thu, 10 Feb 2022 14:31:31 +0100 (CET)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] qemu-img: dd: add isize parameter
Date: Thu, 10 Feb 2022 14:31:21 +0100
Message-Id: <20220210133123.347350-3-f.ebner@proxmox.com>
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

for writing small images from stdin to bigger ones.

In order to distinguish between an actually unexpected and
an expected end of input.

Signed-off-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
Signed-off-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
[FE: override size earlier
     use flag to detect parameter
     add documenation]
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---
 docs/tools/qemu-img.rst | 10 ++++++++--
 qemu-img-cmds.hx        |  4 ++--
 qemu-img.c              | 24 +++++++++++++++++++++++-
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 775eaf3097..43328fe108 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -230,6 +230,10 @@ Parameters to dd subcommand:
 
   Sets the number of input blocks to skip
 
+.. option:: isize=INPUT_SIZE
+
+  Treat the input image or stream as if it had this size
+
 .. option:: osize=OUTPUT_SIZE
 
   Sets the output image's size
@@ -492,7 +496,7 @@ Command description:
   it doesn't need to be specified separately in this case.
 
 
-.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
+.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [isize=INPUT_SIZE] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
 
   dd copies from *INPUT* file (default: STDIN) to *OUTPUT* file (default:
   STDOUT) converting it from *FMT* format to *OUTPUT_FMT* format.
@@ -504,7 +508,9 @@ Command description:
   The size syntax is similar to :manpage:`dd(1)`'s size syntax.
 
   The output image will be created with size *OUTPUT_SIZE* and at most this many
-  bytes will be copied.
+  bytes will be copied. When *INPUT_SIZE* is positive, it overrides the input
+  image's size for the copy operation. When *INPUT_SIZE* is zero and reading
+  from STDIN, do not treat premature end of the input stream as an error.
 
 .. option:: info [--object OBJECTDEF] [--image-opts] [-f FMT] [--output=OFMT] [--backing-chain] [-U] FILENAME
 
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index e4935365c9..50993e6c47 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -58,9 +58,9 @@ SRST
 ERST
 
 DEF("dd", img_dd,
-    "dd [--image-opts] [-U] [-f fmt] [-O output_fmt] [bs=block_size] [count=blocks] [skip=blocks] [osize=output_size] [if=input] [of=output]")
+    "dd [--image-opts] [-U] [-f fmt] [-O output_fmt] [bs=block_size] [count=blocks] [skip=blocks] [isize=input_size] [osize=output_size] [if=input] [of=output]")
 SRST
-.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
+.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [isize=INPUT_SIZE] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
 ERST
 
 DEF("info", img_info,
diff --git a/qemu-img.c b/qemu-img.c
index ea488fd190..630928773d 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4820,11 +4820,13 @@ static int img_bitmap(int argc, char **argv)
 #define C_OF      010
 #define C_SKIP    020
 #define C_OSIZE   040
+#define C_ISIZE   0100
 
 struct DdInfo {
     unsigned int flags;
     int64_t count;
     int64_t osize;
+    int64_t isize;
 };
 
 struct DdIo {
@@ -4913,6 +4915,19 @@ static int img_dd_osize(const char *arg,
     return 0;
 }
 
+static int img_dd_isize(const char *arg,
+                        struct DdIo *in, struct DdIo *out,
+                        struct DdInfo *dd)
+{
+    dd->isize = cvtnum("isize", arg);
+
+    if (dd->isize < 0) {
+        return 1;
+    }
+
+    return 0;
+}
+
 static int img_dd(int argc, char **argv)
 {
     int ret = 0;
@@ -4934,6 +4949,7 @@ static int img_dd(int argc, char **argv)
         .flags = 0,
         .count = 0,
         .osize = 0,
+        .isize = 0,
     };
     struct DdIo in = {
         .bsz = 512, /* Block size is by default 512 bytes */
@@ -4955,6 +4971,7 @@ static int img_dd(int argc, char **argv)
         { "of", img_dd_of, C_OF },
         { "skip", img_dd_skip, C_SKIP },
         { "osize", img_dd_osize, C_OSIZE },
+        { "isize", img_dd_isize, C_ISIZE },
         { NULL, NULL, 0 }
     };
     const struct option long_options[] = {
@@ -5061,7 +5078,9 @@ static int img_dd(int argc, char **argv)
         }
     }
 
-    if (dd.flags & C_IF) {
+    if (dd.flags & C_ISIZE && dd.isize > 0) {
+        size = dd.isize;
+    } else if (dd.flags & C_IF) {
         size = blk_getlength(blk1);
         if (size < 0) {
             error_report("Failed to get size for '%s'", in.filename);
@@ -5174,6 +5193,9 @@ static int img_dd(int argc, char **argv)
         } else {
             in_ret = read(STDIN_FILENO, in.buf, in_bsz);
             if (in_ret == 0) {
+                if (dd.flags & C_ISIZE && dd.isize == 0) {
+                    goto out;
+                }
                 /* early EOF is considered an error */
                 error_report("Input ended unexpectedly");
                 ret = -1;
-- 
2.30.2



