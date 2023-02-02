Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D3688634
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 19:17:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNe7j-0004Qf-Ks; Thu, 02 Feb 2023 13:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1pNe7d-0004Pc-5M; Thu, 02 Feb 2023 13:15:48 -0500
Received: from relay.virtuozzo.com ([130.117.225.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1pNe7a-0003S0-P3; Thu, 02 Feb 2023 13:15:44 -0500
Received: from dev006.ch-qa.sw.ru ([172.29.1.11])
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1pNe7M-005EQg-1w; Thu, 02 Feb 2023 19:15:28 +0100
To: vsementsov@yandex-team.ru
Cc: hreitz@redhat.com, eblake@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hbitmap: fix hbitmap_status() return value for first dirty
 bit case
Date: Thu,  2 Feb 2023 21:15:23 +0300
Message-Id: <20230202181523.423131-1-andrey.zhadchenko@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=andrey.zhadchenko@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
From:  Andrey Zhadchenko via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The last return statement should return true, as we already evaluated that
start == next_dirty

Also, fix hbitmap_status() description in header

Cc: qemu-stable@nongnu.org
Fixes: a6426475a75 ("block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()")
Signed-off-by: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
---
 include/qemu/hbitmap.h | 2 +-
 util/hbitmap.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index af4e4ab746..8136e33674 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -330,7 +330,7 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
                              int64_t *dirty_start, int64_t *dirty_count);
 
 /*
- * bdrv_dirty_bitmap_status:
+ * hbitmap_status:
  * @hb: The HBitmap to operate on
  * @start: The bit to start from
  * @count: Number of bits to proceed
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 297db35fb1..6d6e1b595d 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -331,7 +331,7 @@ bool hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
 
     assert(next_zero > start);
     *pnum = next_zero - start;
-    return false;
+    return true;
 }
 
 bool hbitmap_empty(const HBitmap *hb)
-- 
2.36.1


