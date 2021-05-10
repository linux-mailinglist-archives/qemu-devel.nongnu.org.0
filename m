Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50552377B40
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 06:32:43 +0200 (CEST)
Received: from localhost ([::1]:53962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfxb0-0007Z9-Dn
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 00:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lfxZk-0006Bb-4o; Mon, 10 May 2021 00:31:24 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:42743
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>)
 id 1lfxZh-0007dx-VH; Mon, 10 May 2021 00:31:23 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3APcDOu6lCIu6hNAG6wDxFNL3LKE/pDfLE3DAb?=
 =?us-ascii?q?v31ZSRFFG/Fxl6iV8sjzsiWE7Ar5OUtQ/uxoV5PhfZqxz/JICOoqTNKftWvdyQ?=
 =?us-ascii?q?iVxehZhOOIqVDd8kbFl9K1u50OT0EHMqyTMbFlt7eA3CCIV8Yn3MKc8L2lwcPX?=
 =?us-ascii?q?z3JWRwlsbK16hj0JczqzIwlnQhVcH5olGN657spDnTCpfnMadYCVHX8ANtKz3+?=
 =?us-ascii?q?Hjpdb3ZwIcHR475E2rhTOs0rTzFB+VxVM/flp0sNEfzVQ=3D?=
X-IronPort-AV: E=Sophos;i="5.82,286,1613404800"; d="scan'208";a="108013891"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 May 2021 12:31:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A07D74D0BA85;
 Mon, 10 May 2021 12:31:12 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 10 May 2021 12:31:03 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Mon, 10 May 2021 12:31:03 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <kwolf@redhat.com>, <mreitz@redhat.com>, <qemu-block@nongnu.org>
Subject: [PATCH] block: Improve backing file validation
Date: Mon, 10 May 2021 12:30:45 +0800
Message-ID: <20210510043045.15238-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: A07D74D0BA85.AD028
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Image below user cases:
case 1:
```
$ qemu-img create -f raw source.raw 1G
$ qemu-img create -f qcow2 -F raw -b source.raw ./source.raw
qemu-img info source.raw
image: source.raw
file format: qcow2
virtual size: 193K (197120 bytes)
disk size: 196K
cluster_size: 65536
backing file: source.raw <<<<<<
backing file format: raw
Format specific information:
    compat: 1.1
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
```

case 2:
```
$ qemu-img create -f raw source.raw 1G
$ ln -sf source.raw destination.qcow2
$ qemu-img create -f qcow2 -F raw -b source.raw ./destination.qcow2
qemu-img info source.raw
image: source.raw
file format: qcow2 <<<<<<
virtual size: 2.0G (2147483648 bytes)
disk size: 196K
cluster_size: 65536
backing file: source.raw
backing file format: raw
Format specific information:
    compat: 1.1
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
```
Generally, we don't expect to corrupte the source.raw anyway, while
actually it does.

Here we validate the realpath of file instead the input string.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 block.c | 46 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index 9ad725d205..523845b763 100644
--- a/block.c
+++ b/block.c
@@ -6431,6 +6431,44 @@ bool bdrv_op_blocker_is_empty(BlockDriverState *bs)
     return true;
 }
 
+static bool validate_backing_file(const char *filename,
+                                  const char *backing_file, Error **errp)
+{
+    bool ret = false;
+    char *rf, *real_filename = g_malloc0(PATH_MAX + 1);
+    char *rb, *real_backing = g_malloc0(PATH_MAX + 1);
+
+    rf = realpath(filename, real_filename);
+    if (!rf) {
+        if (errno == ENOENT) {
+            /* filename doesn't exit, ignore it */
+            rf = (char *)filename;
+        } else {
+            error_setg(errp, "Failed to resolve %s", filename);
+            goto out;
+        }
+    }
+    rb = realpath(backing_file, real_backing);
+    if (!rb) {
+        error_setg(errp, "Failed to resolve %s", backing_file);
+        goto out;
+    }
+    if (!strcmp(rf, rb)) {
+        error_setg(errp, "Error: Trying to create an image with the "
+                            "same filename as the backing file");
+        goto out;
+    }
+    if (backing_file[0] == '\0') {
+        error_setg(errp, "Expected backing file name, got empty string");
+        goto out;
+    }
+    ret = true;
+out:
+    g_free(real_filename);
+    g_free(real_backing);
+    return ret;
+}
+
 void bdrv_img_create(const char *filename, const char *fmt,
                      const char *base_filename, const char *base_fmt,
                      char *options, uint64_t img_size, int flags, bool quiet,
@@ -6507,13 +6545,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
 
     backing_file = qemu_opt_get(opts, BLOCK_OPT_BACKING_FILE);
     if (backing_file) {
-        if (!strcmp(filename, backing_file)) {
-            error_setg(errp, "Error: Trying to create an image with the "
-                             "same filename as the backing file");
-            goto out;
-        }
-        if (backing_file[0] == '\0') {
-            error_setg(errp, "Expected backing file name, got empty string");
+        if (!validate_backing_file(filename, backing_file, errp)) {
             goto out;
         }
     }
-- 
2.30.2




