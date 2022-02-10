Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4832E4B1298
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:23:09 +0100 (CET)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICDr-0001U0-Qf
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:23:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nI9Y0-0003iw-NK; Thu, 10 Feb 2022 08:31:44 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:8677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nI9Xx-0004mf-N6; Thu, 10 Feb 2022 08:31:44 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 3D04046DCB;
 Thu, 10 Feb 2022 14:31:31 +0100 (CET)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] qemu-img: dd: add -l option for loading a snapshot
Date: Thu, 10 Feb 2022 14:31:23 +0100
Message-Id: <20220210133123.347350-5-f.ebner@proxmox.com>
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

Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---
 docs/tools/qemu-img.rst |  7 ++++---
 qemu-img-cmds.hx        |  4 ++--
 qemu-img.c              | 33 +++++++++++++++++++++++++++++++--
 3 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 9b022d9363..b2333d7b04 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -500,10 +500,11 @@ Command description:
   it doesn't need to be specified separately in this case.
 
 
-.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [-n] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [isize=INPUT_SIZE] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
+.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [-n] [-l SNAPSHOT_PARAM] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [isize=INPUT_SIZE] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
 
-  dd copies from *INPUT* file (default: STDIN) to *OUTPUT* file (default:
-  STDOUT) converting it from *FMT* format to *OUTPUT_FMT* format.
+  dd copies from *INPUT* file (default: STDIN) or snapshot *SNAPSHOT_PARAM* to
+  *OUTPUT* file (default: STDOUT) converting it from *FMT* format to
+  *OUTPUT_FMT* format.
 
   The data is by default read and written using blocks of 512 bytes but can be
   modified by specifying *BLOCK_SIZE*. If count=\ *BLOCKS* is specified
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 97e750623f..2f527306b0 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -58,9 +58,9 @@ SRST
 ERST
 
 DEF("dd", img_dd,
-    "dd [--image-opts] [-U] [-f fmt] [-O output_fmt] [-n] [bs=block_size] [count=blocks] [skip=blocks] [isize=input_size] [osize=output_size] [if=input] [of=output]")
+    "dd [--image-opts] [-U] [-f fmt] [-O output_fmt] [-n] [-l snapshot_param] [bs=block_size] [count=blocks] [skip=blocks] [isize=input_size] [osize=output_size] [if=input] [of=output]")
 SRST
-.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [-n] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [isize=INPUT_SIZE] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
+.. option:: dd [--image-opts] [-U] [-f FMT] [-O OUTPUT_FMT] [-n] [-l SNAPSHOT_PARAM] [bs=BLOCK_SIZE] [count=BLOCKS] [skip=BLOCKS] [isize=INPUT_SIZE] [osize=OUTPUT_SIZE] [if=INPUT] [of=OUTPUT]
 ERST
 
 DEF("info", img_info,
diff --git a/qemu-img.c b/qemu-img.c
index 89bf6fd087..28b6430800 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4936,6 +4936,7 @@ static int img_dd(int argc, char **argv)
     BlockDriver *drv = NULL, *proto_drv = NULL;
     BlockBackend *blk1 = NULL, *blk2 = NULL;
     QemuOpts *opts = NULL;
+    QemuOpts *sn_opts = NULL;
     QemuOptsList *create_opts = NULL;
     Error *local_err = NULL;
     bool image_opts = false;
@@ -4945,6 +4946,7 @@ static int img_dd(int argc, char **argv)
     int64_t size = 0, readsize = 0;
     int64_t block_count = 0, out_pos, in_pos;
     bool force_share = false, skip_create = false;
+    const char *snapshot_name = NULL;
     struct DdInfo dd = {
         .flags = 0,
         .count = 0,
@@ -4982,7 +4984,7 @@ static int img_dd(int argc, char **argv)
         { 0, 0, 0, 0 }
     };
 
-    while ((c = getopt_long(argc, argv, ":hf:O:Un", long_options, NULL))) {
+    while ((c = getopt_long(argc, argv, ":hf:O:l:Un", long_options, NULL))) {
         if (c == EOF) {
             break;
         }
@@ -5005,6 +5007,19 @@ static int img_dd(int argc, char **argv)
         case 'n':
             skip_create = true;
             break;
+        case 'l':
+            if (strstart(optarg, SNAPSHOT_OPT_BASE, NULL)) {
+                sn_opts = qemu_opts_parse_noisily(&internal_snapshot_opts,
+                                                  optarg, false);
+                if (!sn_opts) {
+                    error_report("Failed in parsing snapshot param '%s'",
+                                 optarg);
+                    goto out;
+                }
+            } else {
+                snapshot_name = optarg;
+            }
+            break;
         case 'U':
             force_share = true;
             break;
@@ -5074,11 +5089,24 @@ static int img_dd(int argc, char **argv)
     if (dd.flags & C_IF) {
         blk1 = img_open(image_opts, in.filename, fmt, 0, false, false,
                         force_share);
-
         if (!blk1) {
             ret = -1;
             goto out;
         }
+        if (sn_opts) {
+            bdrv_snapshot_load_tmp(blk_bs(blk1),
+                                   qemu_opt_get(sn_opts, SNAPSHOT_OPT_ID),
+                                   qemu_opt_get(sn_opts, SNAPSHOT_OPT_NAME),
+                                   &local_err);
+        } else if (snapshot_name != NULL) {
+            bdrv_snapshot_load_tmp_by_id_or_name(blk_bs(blk1), snapshot_name,
+                                                 &local_err);
+        }
+        if (local_err) {
+            error_reportf_err(local_err, "Failed to load snapshot: ");
+            ret = -1;
+            goto out;
+        }
     }
 
     if (dd.flags & C_ISIZE && dd.isize > 0) {
@@ -5233,6 +5261,7 @@ static int img_dd(int argc, char **argv)
 out:
     g_free(arg);
     qemu_opts_del(opts);
+    qemu_opts_del(sn_opts);
     qemu_opts_free(create_opts);
     blk_unref(blk1);
     blk_unref(blk2);
-- 
2.30.2



