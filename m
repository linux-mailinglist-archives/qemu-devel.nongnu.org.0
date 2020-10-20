Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7671293F0B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 16:53:03 +0200 (CEST)
Received: from localhost ([::1]:46510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUt0Y-0003GC-Un
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 10:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhengui@huawei.com>)
 id 1kUsvo-00070E-Qr; Tue, 20 Oct 2020 10:48:08 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5195 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhengui@huawei.com>)
 id 1kUsvm-00031H-Nb; Tue, 20 Oct 2020 10:48:08 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 314E3A4AB1BAD10B0ED8;
 Tue, 20 Oct 2020 22:47:59 +0800 (CST)
Received: from DESKTOP-80C7KIU.china.huawei.com (10.174.187.210) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 20 Oct 2020 22:47:49 +0800
From: Zhengui li <lizhengui@huawei.com>
To: <pbonzini@redhat.com>, <stefanha@redhat.com>, <mreitz@redhat.com>,
 <kwolf@redhat.com>
Subject: [PATCH v3 1/2] qemu-img: add support for rate limit in qemu-img commit
Date: Tue, 20 Oct 2020 14:47:43 +0000
Message-ID: <1603205264-17424-2-git-send-email-lizhengui@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1603205264-17424-1-git-send-email-lizhengui@huawei.com>
References: <1603205264-17424-1-git-send-email-lizhengui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=lizhengui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 09:15:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: xieyingtai@huawei.com, lizhengui@huawei.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhengui <lizhengui@huawei.com>

add support for rate limit in qemu-img commit.

Signed-off-by: Zhengui <lizhengui@huawei.com>
---
 docs/tools/qemu-img.rst |  4 +++-
 qemu-img-cmds.hx        |  4 ++--
 qemu-img.c              | 11 +++++++++--
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index c35bd64..bcb11b0 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -349,7 +349,7 @@ Command description:
   state after (the attempt at) repairing it. That is, a successful ``-r all``
   will yield the exit code 0, independently of the image state before.
 
-.. option:: commit [--object OBJECTDEF] [--image-opts] [-q] [-f FMT] [-t CACHE] [-b BASE] [-d] [-p] FILENAME
+.. option:: commit [--object OBJECTDEF] [--image-opts] [-q] [-f FMT] [-t CACHE] [-b BASE] [-r RATE_LIMIT] [-d] [-p] FILENAME
 
   Commit the changes recorded in *FILENAME* in its base image or backing file.
   If the backing file is smaller than the snapshot, then the backing file will be
@@ -371,6 +371,8 @@ Command description:
   garbage data when read. For this reason, ``-b`` implies ``-d`` (so that
   the top image stays valid).
 
+  The rate limit for the commit process is specified by ``-r``.
+
 .. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] FILENAME1 FILENAME2
 
   Check if two images have the same content. You can compare images with
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index b89c019..2a31806 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -34,9 +34,9 @@ SRST
 ERST
 
 DEF("commit", img_commit,
-    "commit [--object objectdef] [--image-opts] [-q] [-f fmt] [-t cache] [-b base] [-d] [-p] filename")
+    "commit [--object objectdef] [--image-opts] [-q] [-f fmt] [-t cache] [-b base] [-r rate_limit] [-d] [-p] filename")
 SRST
-.. option:: commit [--object OBJECTDEF] [--image-opts] [-q] [-f FMT] [-t CACHE] [-b BASE] [-d] [-p] FILENAME
+.. option:: commit [--object OBJECTDEF] [--image-opts] [-q] [-f FMT] [-t CACHE] [-b BASE] [-r RATE_LIMIT] [-d] [-p] FILENAME
 ERST
 
 DEF("compare", img_compare,
diff --git a/qemu-img.c b/qemu-img.c
index 2103507..3023abe 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -980,6 +980,7 @@ static int img_commit(int argc, char **argv)
     CommonBlockJobCBInfo cbi;
     bool image_opts = false;
     AioContext *aio_context;
+    int64_t rate_limit = 0;
 
     fmt = NULL;
     cache = BDRV_DEFAULT_CACHE;
@@ -991,7 +992,7 @@ static int img_commit(int argc, char **argv)
             {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
             {0, 0, 0, 0}
         };
-        c = getopt_long(argc, argv, ":f:ht:b:dpq",
+        c = getopt_long(argc, argv, ":f:ht:b:dpqr:",
                         long_options, NULL);
         if (c == -1) {
             break;
@@ -1026,6 +1027,12 @@ static int img_commit(int argc, char **argv)
         case 'q':
             quiet = true;
             break;
+        case 'r':
+            rate_limit = cvtnum("rate limit", optarg);
+            if (rate_limit < 0) {
+                return 1;
+            }
+            break;
         case OPTION_OBJECT: {
             QemuOpts *opts;
             opts = qemu_opts_parse_noisily(&qemu_object_opts,
@@ -1099,7 +1106,7 @@ static int img_commit(int argc, char **argv)
 
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
-    commit_active_start("commit", bs, base_bs, JOB_DEFAULT, 0,
+    commit_active_start("commit", bs, base_bs, JOB_DEFAULT, rate_limit,
                         BLOCKDEV_ON_ERROR_REPORT, NULL, common_block_job_cb,
                         &cbi, false, &local_err);
     aio_context_release(aio_context);
-- 
2.6.4.windows.1


