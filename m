Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA31B1D0D62
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 11:52:40 +0200 (CEST)
Received: from localhost ([::1]:42384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYo47-0007ij-Od
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 05:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYo2g-0005xQ-Vb; Wed, 13 May 2020 05:51:10 -0400
Received: from relay.sw.ru ([185.231.240.75]:54000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYo2f-0003ZD-2f; Wed, 13 May 2020 05:51:10 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYo2W-0001e4-56; Wed, 13 May 2020 12:51:00 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 11/15] copy-on-read: Support preadv/pwritev_part functions
Date: Wed, 13 May 2020 12:50:52 +0300
Message-Id: <1589363456-1035571-12-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589363456-1035571-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1589363456-1035571-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 05:51:06
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 armbru@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for the recently introduced functions
bdrv_co_preadv_part()
and
bdrv_co_pwritev_part()
to the COR-filter driver.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/copy-on-read.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 74e01ee..4030d56 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -74,21 +74,25 @@ static int64_t cor_getlength(BlockDriverState *bs)
 }
 
 
-static int coroutine_fn cor_co_preadv(BlockDriverState *bs,
-                                      uint64_t offset, uint64_t bytes,
-                                      QEMUIOVector *qiov, int flags)
+static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
+                                           uint64_t offset, uint64_t bytes,
+                                           QEMUIOVector *qiov,
+                                           size_t qiov_offset,
+                                           int flags)
 {
-    return bdrv_co_preadv(bs->file, offset, bytes, qiov,
-                          flags | BDRV_REQ_COPY_ON_READ);
+    return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
+                               flags | BDRV_REQ_COPY_ON_READ);
 }
 
 
-static int coroutine_fn cor_co_pwritev(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags)
+static int coroutine_fn cor_co_pwritev_part(BlockDriverState *bs,
+                                            uint64_t offset,
+                                            uint64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            size_t qiov_offset, int flags)
 {
-
-    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
+    return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
+                                flags);
 }
 
 
@@ -152,8 +156,8 @@ static BlockDriver bdrv_copy_on_read = {
 
     .bdrv_getlength                     = cor_getlength,
 
-    .bdrv_co_preadv                     = cor_co_preadv,
-    .bdrv_co_pwritev                    = cor_co_pwritev,
+    .bdrv_co_preadv_part                = cor_co_preadv_part,
+    .bdrv_co_pwritev_part               = cor_co_pwritev_part,
     .bdrv_co_pwrite_zeroes              = cor_co_pwrite_zeroes,
     .bdrv_co_pdiscard                   = cor_co_pdiscard,
     .bdrv_co_pwritev_compressed         = cor_co_pwritev_compressed,
-- 
1.8.3.1


