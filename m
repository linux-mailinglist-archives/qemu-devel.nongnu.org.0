Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7C379F81
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:05:31 +0200 (CEST)
Received: from localhost ([::1]:49830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLWM-0006Mj-MQ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lgLNA-0004uD-P2; Tue, 11 May 2021 01:56:00 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:3603
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>)
 id 1lgLN7-0003UO-Qb; Tue, 11 May 2021 01:56:00 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ASMU+PK5N1yHmB7nhQQPXwPTXdLJyesId70hD?=
 =?us-ascii?q?6qkRc20wTiX8ra2TdZsguyMc9wx6ZJhNo7G90cq7MBbhHPxOkOos1N6ZNWGIhI?=
 =?us-ascii?q?LCFvAB0WKN+V3dMhy73utc+IMlSKJmFeD3ZGIQse/KpCW+DPYsqePqzJyV?=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="108115337"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 May 2021 13:55:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5E4734D0BA7A;
 Tue, 11 May 2021 13:55:49 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 11 May 2021 13:55:43 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 11 May 2021 13:55:45 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <berrange@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <qemu-block@nongnu.org>
Subject: [PATCH v2] block: Improve backing file validation
Date: Tue, 11 May 2021 13:55:18 +0800
Message-ID: <20210511055518.31876-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-yoursite-MailScanner-ID: 5E4734D0BA7A.AE945
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

Here we check their inode number instead of file name.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

---
v2: utilize stat() instead of realpath() (Daniel)

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 block.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index 9ad725d205..db4ae57959 100644
--- a/block.c
+++ b/block.c
@@ -6431,6 +6431,37 @@ bool bdrv_op_blocker_is_empty(BlockDriverState *bs)
     return true;
 }
 
+static bool validate_backing_file(const char *filename,
+                                  const char *backing_file, Error **errp)
+{
+    struct stat filename_stat, backing_stat;
+
+    if (backing_file[0] == '\0') {
+        error_setg(errp, "Expected backing file name, got empty string");
+        goto out;
+    }
+
+    /* check whether filename and backing_file are refering to the same file */
+    if (stat(backing_file, &backing_stat) == -1) {
+        error_setg(errp, "Cannot stat backing file %s", backing_file);
+        goto out;
+    }
+    if (stat(filename, &filename_stat) == -1) {
+        /* Simply consider filename doesn't exist, no need to further check */
+        return true;
+    }
+    if ((filename_stat.st_dev == backing_stat.st_dev) &&
+        (filename_stat.st_ino == backing_stat.st_ino)) {
+        error_setg(errp, "Error: Trying to create an image with the "
+                         "same filename as the backing file");
+        goto out;
+    }
+
+    return true;
+out:
+    return false;
+}
+
 void bdrv_img_create(const char *filename, const char *fmt,
                      const char *base_filename, const char *base_fmt,
                      char *options, uint64_t img_size, int flags, bool quiet,
@@ -6507,13 +6538,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
 
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




