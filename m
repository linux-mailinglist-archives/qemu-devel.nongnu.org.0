Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E25E8B88
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 16:13:25 +0100 (CET)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPTBU-0002Ya-9d
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 11:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iPT85-0007wy-KX
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 11:09:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iPT80-00051f-OP
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 11:09:53 -0400
Received: from relay.sw.ru ([185.231.240.75]:37192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iPT7r-0004yz-17; Tue, 29 Oct 2019 11:09:39 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iPT7n-00062X-F9; Tue, 29 Oct 2019 18:09:35 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block/block-copy: fix s->copy_size for compressed cluster
Date: Tue, 29 Oct 2019 18:09:34 +0300
Message-Id: <20191029150934.26416-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

0e2402452f1f20429 allowed writes larger than cluster, but that's
unsupported for compressed write. Fix it.

Fixes: 0e2402452f1f20429
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index c39cc9cffe..79798a1567 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -109,9 +109,9 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         s->use_copy_range = false;
         s->copy_size = cluster_size;
     } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
-        /* Compression is not supported for copy_range */
+        /* Compression supports only cluster-size writes and no copy-range. */
         s->use_copy_range = false;
-        s->copy_size = MAX(cluster_size, BLOCK_COPY_MAX_BUFFER);
+        s->copy_size = cluster_size;
     } else {
         /*
          * copy_range does not respect max_transfer (it's a TODO), so we factor
-- 
2.21.0


