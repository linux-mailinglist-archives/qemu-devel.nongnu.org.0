Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37968A571
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 20:13:16 +0200 (CEST)
Received: from localhost ([::1]:47604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxEom-00011J-8J
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 14:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40986)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hxEnT-0007sG-6C
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 14:11:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hxEnS-0004e7-AI
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 14:11:55 -0400
Received: from relay.sw.ru ([185.231.240.75]:50634)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hxEnQ-0004cK-94; Mon, 12 Aug 2019 14:11:52 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hxEnM-0001oT-O7; Mon, 12 Aug 2019 21:11:48 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Mon, 12 Aug 2019 21:11:45 +0300
Message-Id: <20190812181146.26121-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190812181146.26121-1-vsementsov@virtuozzo.com>
References: <20190812181146.26121-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 1/2] block/raw-format: switch to
 BDRV_BLOCK_DATA with BDRV_BLOCK_RECURSE
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BDRV_BLOCK_RAW makes generic bdrv_co_block_status to fallthrough to
returned file. But is it correct behavior at all? If returned file
itself has a backing file, we may report as totally unallocated and
area which actually has data in bottom backing file.

So, mirroring of qcow2 under raw-format is broken. Which is illustrated
by following commit with a test. Let's make raw-format behave more
correctly returning BDRV_BLOCK_DATA.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/raw-format.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/raw-format.c b/block/raw-format.c
index bffd424dd0..a273ee2387 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -275,7 +275,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
     *pnum = bytes;
     *file = bs->file->bs;
     *map = offset + s->offset;
-    return BDRV_BLOCK_RAW | BDRV_BLOCK_OFFSET_VALID;
+    return BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID | BDRV_BLOCK_RECURSE;
 }
 
 static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
-- 
2.18.0


