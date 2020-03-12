Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB80182B15
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 09:21:24 +0100 (CET)
Received: from localhost ([::1]:37410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCJ5n-0006sI-4H
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 04:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44137)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jCJ4h-00067M-7s
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 04:20:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jCJ4c-0007Ud-6Q
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 04:20:15 -0400
Received: from relay.sw.ru ([185.231.240.75]:47084)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jCJ4Z-0007Mr-BP; Thu, 12 Mar 2020 04:20:07 -0400
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1jCJ4S-0004G7-Lu; Thu, 12 Mar 2020 11:20:00 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block/io: fix bdrv_co_do_copy_on_readv
Date: Thu, 12 Mar 2020 11:19:49 +0300
Message-Id: <20200312081949.5350-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prior to 1143ec5ebf4 it was OK to qemu_iovec_from_buf() from aligned-up
buffer to original qiov, as qemu_iovec_from_buf() will stop at qiov end
anyway.

But after 1143ec5ebf4 we assume that bdrv_co_do_copy_on_readv works on
part of original qiov, defined by qiov_offset and bytes. So we must not
touch qiov behind qiov_offset+bytes bound. Fix it.

Cc: qemu-stable@nongnu.org # v4.2
Fixes: 1143ec5ebf4
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index 7e4cb74cf4..aba67f66b9 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1399,7 +1399,7 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
             if (!(flags & BDRV_REQ_PREFETCH)) {
                 qemu_iovec_from_buf(qiov, qiov_offset + progress,
                                     bounce_buffer + skip_bytes,
-                                    pnum - skip_bytes);
+                                    MIN(pnum - skip_bytes, bytes - progress));
             }
         } else if (!(flags & BDRV_REQ_PREFETCH)) {
             /* Read directly into the destination */
-- 
2.21.0


