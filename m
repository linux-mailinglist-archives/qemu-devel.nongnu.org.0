Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6A319F80C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 16:35:47 +0200 (CEST)
Received: from localhost ([::1]:32886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLSqo-0000h6-Ef
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 10:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jLSpp-0008OL-14
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 10:34:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jLSpn-0006MG-TT
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 10:34:44 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:47347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jLSpn-0006BP-Jz; Mon, 06 Apr 2020 10:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=4GWbeQ2pliEe6uGlHb33wkxZbf0DrTbM06Aojy9guGw=; 
 b=TKtLg4sWr9gVXdx2sFgvcRhrxvvlrcUdqJIwLN3iRHAt5xoqKKFKnj77CbrsEJWOWZmNjMkxN0X+qFT8T6REhkwAIZoBl/E/UH3Z7m9EQdC+Z9+J4IuMd7k4Dgt32GjI0K7vF5V+FrWLa3TCagA3szZntsJ3p6ZajkqDYCtcDqPsfHAyaiaa84HENWCOCYlKFand4mHu6Qv652XBWb55QMh8Mw0wgJKe3GPNi2+EbmAEEt9zz5g6pqRpaX56Ku7xX7fn2/Lg+H6ffvVtW4VD5sJ0E0xhNWkdLODuRJn11jFRnDjEbYl7o5zH0ckhNQx6owoTCmh3TmoQ5kzeCqQVVQ==;
Received: from [81.0.35.113] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jLSpO-0006Kr-2U; Mon, 06 Apr 2020 16:34:18 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jLSpA-0006zs-0M; Mon, 06 Apr 2020 16:34:04 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qcow2: Check request size in
 qcow2_co_pwritev_compressed_part()
Date: Mon,  6 Apr 2020 16:34:01 +0200
Message-Id: <20200406143401.26854-1-berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Pavel Butsykin <pbutsykin@virtuozzo.com>, Max Reitz <mreitz@redhat.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When issuing a compressed write request the number of bytes must be a
multiple of the cluster size or reach the end of the last cluster.

With the current code such requests are allowed and we hit an
assertion:

   $ qemu-img create -f qcow2 img.qcow2 1M
   $ qemu-io -c 'write -c 0 32k' img.qcow2

   qemu-io: block/qcow2.c:4257: qcow2_co_pwritev_compressed_task:
   Assertion `bytes == s->cluster_size || (bytes < s->cluster_size &&
              (offset + bytes == bs->total_sectors << BDRV_SECTOR_BITS))' failed.
   Aborted

This patch fixes a regression introduced in 0d483dce38

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 2bb536b014..587cf51948 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4349,6 +4349,11 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
         return -EINVAL;
     }
 
+    if (offset_into_cluster(s, bytes) &&
+        (offset + bytes) != (bs->total_sectors << BDRV_SECTOR_BITS)) {
+        return -EINVAL;
+    }
+
     while (bytes && aio_task_pool_status(aio) == 0) {
         uint64_t chunk_size = MIN(bytes, s->cluster_size);
 
-- 
2.20.1


