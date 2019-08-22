Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C899EDF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 20:35:02 +0200 (CEST)
Received: from localhost ([::1]:47036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0rvJ-0005EG-8f
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 14:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1i0rre-0004Gs-3G
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 14:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1i0rrc-0003PZ-Ok
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 14:31:13 -0400
Received: from relay.sw.ru ([185.231.240.75]:47102)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1i0rrY-0003ME-UO; Thu, 22 Aug 2019 14:31:09 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1i0rrS-00012d-Pn; Thu, 22 Aug 2019 21:31:02 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 22 Aug 2019 21:31:01 +0300
Message-Id: <1566498661-53008-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] block: workaround for unaligned byte range in
 fallocate()
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
 mreitz@redhat.com, stefanha@redhat.com, andrey.shinkevich@virtuozzo.com,
 den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Revert the commit 118f99442d 'block/io.c: fix for the allocation failure'
and make better error handling for the file systems that do not support
fallocate() for the unaligned byte range. Allow falling back to pwrite
in case fallocate() returns EINVAL.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
Discussed in email thread with the message ID
<1554474244-553661-1-git-send-email-andrey.shinkevich@virtuozzo.com>

 block/file-posix.c | 7 +++++++
 block/io.c         | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index fbeb006..2c254ff 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1588,6 +1588,13 @@ static int handle_aiocb_write_zeroes(void *opaque)
     if (s->has_write_zeroes) {
         int ret = do_fallocate(s->fd, FALLOC_FL_ZERO_RANGE,
                                aiocb->aio_offset, aiocb->aio_nbytes);
+        if (ret == -EINVAL) {
+            /*
+             * Allow falling back to pwrite for file systems that
+             * do not support fallocate() for unaligned byte range.
+             */
+            return -ENOTSUP;
+        }
         if (ret == 0 || ret != -ENOTSUP) {
             return ret;
         }
diff --git a/block/io.c b/block/io.c
index 56bbf19..58f08cd 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1558,7 +1558,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
             assert(!bs->supported_zero_flags);
         }
 
-        if (ret < 0 && !(flags & BDRV_REQ_NO_FALLBACK)) {
+        if (ret == -ENOTSUP && !(flags & BDRV_REQ_NO_FALLBACK)) {
             /* Fall back to bounce buffer if write zeroes is unsupported */
             BdrvRequestFlags write_flags = flags & ~BDRV_REQ_ZERO_WRITE;
 
-- 
1.8.3.1


