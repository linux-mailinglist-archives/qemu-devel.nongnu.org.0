Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E00F4B1436
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:28:30 +0100 (CET)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDF7-0001If-Md
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:28:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nI9Y4-0003oz-H2; Thu, 10 Feb 2022 08:31:52 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:50075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nI9Xx-0004mb-MK; Thu, 10 Feb 2022 08:31:48 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 03BEE46DD6;
 Thu, 10 Feb 2022 14:31:31 +0100 (CET)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] qemu-img: dd: add -n option (skip target volume creation)
Date: Thu, 10 Feb 2022 14:31:22 +0100
Message-Id: <20220210133123.347350-4-f.ebner@proxmox.com>
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

From: Alexandre Derumier <aderumier@odiso.com>

Same rationale as in
b2e10493c7 ("add qemu-img convert -n option (skip target volume creation)")

Originally-by: Alexandre Derumier <aderumier@odiso.com>
Signed-off-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
[FE: avoid wrong colon in getopt's optstring
     add documentation + commit message]
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---
 docs/tools/qemu-img.rst |  6 +++++-
 qemu-img-cmds.hx        |  4 ++--
 qemu-img.c              | 23 ++++++++++++++---------
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 43328fe108..9b022d9363 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -210,6 +210,10 @@ Parameters to dd subcommand:
 
 .. program:: qemu-img-dd
 
+.. option:: -n
+
+  Skip the creation of the target volume
+
 .. option:: bs=BLOCK_SIZE
 
   Defines the block size
@@ -496,7 +500,7 @@ Command description:
   it doesn't need to be specified separately in this case.
 
 
-.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [isize=INPUT_SIZE] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
+.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [-n] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [isize=INPUT_SIZE] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
 
   dd copies from *INPUT* file (default: STDIN) to *OUTPUT* file (default:
   STDOUT) converting it from *FMT* format to *OUTPUT_FMT* format.
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 50993e6c47..97e750623f 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -58,9 +58,9 @@ SRST
 ERST
 
 DEF("dd", img_dd,
-    "dd [--image-opts] [-U] [-f fmt] [-O output_fmt] [bs=block_size] [count=blocks] [skip=blocks] [isize=input_size] [osize=output_size] [if=input] [of=output]")
+    "dd [--image-opts] [-U] [-f fmt] [-O output_fmt] [-n] [bs=block_size] [count=blocks] [skip=blocks] [isize=input_size] [osize=output_size] [if=input] [of=output]")
 SRST
-.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [isize=INPUT_SIZE] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
+.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [-n] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [isize=INPUT_SIZE] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
 ERST
 
 DEF("info", img_info,
diff --git a/qemu-img.c b/qemu-img.c
index 630928773d..89bf6fd087 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4944,7 +4944,7 @@ static int img_dd(int argc, char **argv)
     const char *fmt = NULL;
     int64_t size = 0, readsize = 0;
     int64_t block_count = 0, out_pos, in_pos;
-    bool force_share = false;
+    bool force_share = false, skip_create = false;
     struct DdInfo dd = {
         .flags = 0,
         .count = 0,
@@ -4982,7 +4982,7 @@ static int img_dd(int argc, char **argv)
         { 0, 0, 0, 0 }
     };
 
-    while ((c = getopt_long(argc, argv, ":hf:O:U", long_options, NULL))) {
+    while ((c = getopt_long(argc, argv, ":hf:O:Un", long_options, NULL))) {
         if (c == EOF) {
             break;
         }
@@ -5002,6 +5002,9 @@ static int img_dd(int argc, char **argv)
         case 'h':
             help();
             break;
+        case 'n':
+            skip_create = true;
+            break;
         case 'U':
             force_share = true;
             break;
@@ -5144,13 +5147,15 @@ static int img_dd(int argc, char **argv)
                                 size - in.bsz * in.offset, &error_abort);
         }
 
-        ret = bdrv_create(drv, out.filename, opts, &local_err);
-        if (ret < 0) {
-            error_reportf_err(local_err,
-                              "%s: error while creating output image: ",
-                              out.filename);
-            ret = -1;
-            goto out;
+        if (!skip_create) {
+            ret = bdrv_create(drv, out.filename, opts, &local_err);
+            if (ret < 0) {
+                error_reportf_err(local_err,
+                                  "%s: error while creating output image: ",
+                                  out.filename);
+                ret = -1;
+                goto out;
+            }
         }
 
         /* TODO, we can't honour --image-opts for the target,
-- 
2.30.2



