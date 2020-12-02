Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99222CC531
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:33:39 +0100 (CET)
Received: from localhost ([::1]:43274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkWwc-0003Mr-Pp
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWuG-0001cd-V5; Wed, 02 Dec 2020 13:31:12 -0500
Received: from relay.sw.ru ([185.231.240.75]:49924 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWuB-000101-47; Wed, 02 Dec 2020 13:31:12 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWtu-00BTPZ-H0; Wed, 02 Dec 2020 21:30:50 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v13 08/10] copy-on-read: skip non-guest reads if no copy needed
Date: Wed,  2 Dec 2020 21:30:59 +0300
Message-Id: <1606933861-297777-9-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

If the flag BDRV_REQ_PREFETCH was set, skip idling read/write
operations in COR-driver. It can be taken into account for the
COR-algorithms optimization. That check is being made during the
block stream job by the moment.

Add the BDRV_REQ_PREFETCH flag to the supported_read_flags of the
COR-filter.

block: Modify the comment for the flag BDRV_REQ_PREFETCH as we are
going to use it alone and pass it to the COR-filter driver for further
processing.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/copy-on-read.c  | 14 ++++++++++----
 include/block/block.h |  8 +++++---
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 2cddc96..123d197 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -49,6 +49,8 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    bs->supported_read_flags = BDRV_REQ_PREFETCH;
+
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
         (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
 
@@ -150,10 +152,14 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
             }
         }
 
-        ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
-                                  local_flags);
-        if (ret < 0) {
-            return ret;
+        /* Skip if neither read nor write are needed */
+        if ((local_flags & (BDRV_REQ_PREFETCH | BDRV_REQ_COPY_ON_READ)) !=
+            BDRV_REQ_PREFETCH) {
+            ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
+                                      local_flags);
+            if (ret < 0) {
+                return ret;
+            }
         }
 
         offset += n;
diff --git a/include/block/block.h b/include/block/block.h
index 81a3894..3499554 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -81,9 +81,11 @@ typedef enum {
     BDRV_REQ_NO_FALLBACK        = 0x100,
 
     /*
-     * BDRV_REQ_PREFETCH may be used only together with BDRV_REQ_COPY_ON_READ
-     * on read request and means that caller doesn't really need data to be
-     * written to qiov parameter which may be NULL.
+     * BDRV_REQ_PREFETCH makes sense only in the context of copy-on-read
+     * (i.e., together with the BDRV_REQ_COPY_ON_READ flag or when a COR
+     * filter is involved), in which case it signals that the COR operation
+     * need not read the data into memory (qiov) but only ensure they are
+     * copied to the top layer (i.e., that COR operation is done).
      */
     BDRV_REQ_PREFETCH  = 0x200,
     /* Mask of valid flags */
-- 
1.8.3.1


