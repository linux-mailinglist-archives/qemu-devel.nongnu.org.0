Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A62FF3F6
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Nov 2019 17:38:13 +0100 (CET)
Received: from localhost ([::1]:48998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iW15Q-0001Uh-Nf
	for lists+qemu-devel@lfdr.de; Sat, 16 Nov 2019 11:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iW11i-000529-IN
 for qemu-devel@nongnu.org; Sat, 16 Nov 2019 11:34:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iW11h-0005TG-D3
 for qemu-devel@nongnu.org; Sat, 16 Nov 2019 11:34:22 -0500
Received: from relay.sw.ru ([185.231.240.75]:37806)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iW11f-0005RS-1m; Sat, 16 Nov 2019 11:34:19 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iW11Y-0005cn-Ju; Sat, 16 Nov 2019 19:34:12 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/4] block/io: fix bdrv_is_allocated_above
Date: Sat, 16 Nov 2019 19:34:10 +0300
Message-Id: <20191116163410.12129-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191116163410.12129-1-vsementsov@virtuozzo.com>
References: <20191116163410.12129-1-vsementsov@virtuozzo.com>
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
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_is_allocated_above wrongly handles short backing files: it reports
after-EOF space as UNALLOCATED which is wrong, as on read the data is
generated on the level of short backing file (if all overlays has
unallocated area at that place).

Reusing bdrv_common_block_status_above fixes the issue and unifies code
path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 43 +++++--------------------------------------
 1 file changed, 5 insertions(+), 38 deletions(-)

diff --git a/block/io.c b/block/io.c
index f05b2e8ecc..6946120587 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2581,52 +2581,19 @@ int coroutine_fn bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
  * at 'offset + *pnum' may return the same allocation status (in other
  * words, the result is not necessarily the maximum possible range);
  * but 'pnum' will only be 0 when end of file is reached.
- *
  */
 int bdrv_is_allocated_above(BlockDriverState *top,
                             BlockDriverState *base,
                             bool include_base, int64_t offset,
                             int64_t bytes, int64_t *pnum)
 {
-    BlockDriverState *intermediate;
-    int ret;
-    int64_t n = bytes;
-
-    assert(base || !include_base);
-
-    intermediate = top;
-    while (include_base || intermediate != base) {
-        int64_t pnum_inter;
-        int64_t size_inter;
-
-        assert(intermediate);
-        ret = bdrv_is_allocated(intermediate, offset, bytes, &pnum_inter);
-        if (ret < 0) {
-            return ret;
-        }
-        if (ret) {
-            *pnum = pnum_inter;
-            return 1;
-        }
-
-        size_inter = bdrv_getlength(intermediate);
-        if (size_inter < 0) {
-            return size_inter;
-        }
-        if (n > pnum_inter &&
-            (intermediate == top || offset + pnum_inter < size_inter)) {
-            n = pnum_inter;
-        }
-
-        if (intermediate == base) {
-            break;
-        }
-
-        intermediate = backing_bs(intermediate);
+    int ret = bdrv_common_block_status_above(top, base, include_base, false,
+                                             offset, bytes, pnum, NULL, NULL);
+    if (ret < 0) {
+        return ret;
     }
 
-    *pnum = n;
-    return 0;
+    return !!(ret & BDRV_BLOCK_ALLOCATED);
 }
 
 typedef struct BdrvVmstateCo {
-- 
2.21.0


