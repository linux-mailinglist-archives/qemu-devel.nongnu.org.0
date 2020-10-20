Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE0529160D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Oct 2020 07:38:59 +0200 (CEST)
Received: from localhost ([::1]:56754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kU1PF-0003TM-QK
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 01:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhengui@huawei.com>)
 id 1kU1NE-0002YW-D7; Sun, 18 Oct 2020 01:36:52 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5181 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhengui@huawei.com>)
 id 1kU1NC-0004FZ-6b; Sun, 18 Oct 2020 01:36:52 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C8E32EFBE5B79B732E85;
 Sun, 18 Oct 2020 13:36:43 +0800 (CST)
Received: from DESKTOP-80C7KIU.china.huawei.com (10.174.187.210) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Sun, 18 Oct 2020 13:36:33 +0800
From: Zhengui li <lizhengui@huawei.com>
To: <pbonzini@redhat.com>, <stefanha@redhat.com>, <mreitz@redhat.com>,
 <kwolf@redhat.com>
Subject: [PATCH] qemu-img: add support for rate limit in qemu-img convert
Date: Sun, 18 Oct 2020 05:36:30 +0000
Message-ID: <1602999390-21324-1-git-send-email-lizhengui@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=lizhengui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/18 01:36:44
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

Currently, there is no rate limit for qemu-img convert. This may
cause the task of qemu-img convert to consume all the bandwidth
of the storage. This will affect the IO performance of other processes
and virtual machines under shared storage. So we add support for
offline rate limit in qemu-img convert to get better quality of sevice.

Signed-off-by: Zhengui <lizhengui@huawei.com>
---
 qemu-img-cmds.hx |  4 ++--
 qemu-img.c       | 35 ++++++++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index ed55b76..70c0bf7 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -46,9 +46,9 @@ SRST
 ERST
 
 DEF("convert", img_convert,
-    "convert [--object objectdef] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f fmt] [-t cache] [-T src_cache] [-O output_fmt] [-B backing_file] [-o options] [-l snapshot_param] [-S sparse_size] [-m num_coroutines] [-W] [--salvage] filename [filename2 [...]] output_filename")
+    "convert [--object objectdef] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f fmt] [-t cache] [-T src_cache] [-O output_fmt] [-B backing_file] [-o options] [-l snapshot_param] [-S sparse_size] [-r rate_limit] [-m num_coroutines] [-W] [--salvage] filename [filename2 [...]] output_filename")
 SRST
-.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-m NUM_COROUTINES] [-W] [--salvage] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
+.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] [--salvage] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
 ERST
 
 DEF("create", img_create,
diff --git a/qemu-img.c b/qemu-img.c
index 67c83b47..d27d8a6 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -50,6 +50,8 @@
 #include "block/qapi.h"
 #include "crypto/init.h"
 #include "trace/control.h"
+#include "qemu/throttle.h"
+#include "block/throttle-groups.h"
 
 #define QEMU_IMG_VERSION "qemu-img version " QEMU_FULL_VERSION \
                           "\n" QEMU_COPYRIGHT "\n"
@@ -1672,6 +1674,7 @@ enum ImgConvertBlockStatus {
 };
 
 #define MAX_COROUTINES 16
+#define CONVERT_THROTTLE_GROUP "img_convert"
 
 typedef struct ImgConvertState {
     BlockBackend **src;
@@ -2187,6 +2190,17 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
 
 #define MAX_BUF_SECTORS 32768
 
+static void set_rate_limit(BlockBackend *blk, int64_t rate_limit)
+{
+    ThrottleConfig cfg;
+
+    throttle_config_init(&cfg);
+    cfg.buckets[THROTTLE_BPS_WRITE].avg = rate_limit;
+
+    blk_io_limits_enable(blk, CONVERT_THROTTLE_GROUP);
+    blk_set_io_limits(blk, &cfg);
+}
+
 static int img_convert(int argc, char **argv)
 {
     int c, bs_i, flags, src_flags = 0;
@@ -2207,6 +2221,7 @@ static int img_convert(int argc, char **argv)
     bool force_share = false;
     bool explict_min_sparse = false;
     bool bitmaps = false;
+    int64_t rate_limit = 0;
 
     ImgConvertState s = (ImgConvertState) {
         /* Need at least 4k of zeros for sparse detection */
@@ -2229,7 +2244,7 @@ static int img_convert(int argc, char **argv)
             {"bitmaps", no_argument, 0, OPTION_BITMAPS},
             {0, 0, 0, 0}
         };
-        c = getopt_long(argc, argv, ":hf:O:B:Cco:l:S:pt:T:qnm:WU",
+        c = getopt_long(argc, argv, ":hf:O:B:Cco:l:S:pt:T:qnm:WUr:",
                         long_options, NULL);
         if (c == -1) {
             break;
@@ -2326,6 +2341,16 @@ static int img_convert(int argc, char **argv)
         case 'U':
             force_share = true;
             break;
+        case 'r': {
+            char *end;
+            unsigned long long sval = strtoull(optarg, &end, 10);
+            if (*end != '\0' || sval > UINT_MAX) {
+                error_report("rate limit parse failed");
+                ret = -1;
+                goto fail_getopt;
+            }
+            rate_limit = (int64_t)sval * 1024 * 1024;
+        }   break;
         case OPTION_OBJECT: {
             QemuOpts *object_opts;
             object_opts = qemu_opts_parse_noisily(&qemu_object_opts,
@@ -2715,6 +2740,10 @@ static int img_convert(int argc, char **argv)
         s.cluster_sectors = bdi.cluster_size / BDRV_SECTOR_SIZE;
     }
 
+    if (rate_limit) {
+        set_rate_limit(s.target, rate_limit);
+    }
+
     ret = convert_do_copy(&s);
 
     /* Now copy the bitmaps */
@@ -2730,6 +2759,10 @@ out:
     qemu_opts_del(opts);
     qemu_opts_free(create_opts);
     qemu_opts_del(sn_opts);
+    if (s.target && rate_limit &&
+        blk_get_public(s.target)->throttle_group_member.throttle_state) {
+        blk_io_limits_disable(s.target);
+    }
     qobject_unref(open_opts);
     blk_unref(s.target);
     if (s.src) {
-- 
1.8.3.1


