Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2981CC2426
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 17:21:37 +0200 (CEST)
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iExUU-00072J-PY
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 11:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60105)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iExOK-0004ZB-E8
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:15:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iExOJ-0005vb-2f
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:15:12 -0400
Received: from relay.sw.ru ([185.231.240.75]:46690)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iExOF-0005os-8V; Mon, 30 Sep 2019 11:15:07 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iExOB-0005tD-EB; Mon, 30 Sep 2019 18:15:03 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 02/10] hbitmap: move hbitmap_iter_next_word to hbitmap.c
Date: Mon, 30 Sep 2019 18:14:54 +0300
Message-Id: <20190930151502.7829-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190930151502.7829-1-vsementsov@virtuozzo.com>
References: <20190930151502.7829-1-vsementsov@virtuozzo.com>
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
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is definitely internal (it's not used by third party and
it has complicated interface). Move it to .c file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/hbitmap.h | 30 ------------------------------
 util/hbitmap.c         | 29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 82317c5364..d9a792b067 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -369,34 +369,4 @@ void hbitmap_free_meta(HBitmap *hb);
  */
 int64_t hbitmap_iter_next(HBitmapIter *hbi);
 
-/**
- * hbitmap_iter_next_word:
- * @hbi: HBitmapIter to operate on.
- * @p_cur: Location where to store the next non-zero word.
- *
- * Return the index of the next nonzero word that is set in @hbi's
- * associated HBitmap, and set *p_cur to the content of that word
- * (bits before the index that was passed to hbitmap_iter_init are
- * trimmed on the first call).  Return -1, and set *p_cur to zero,
- * if all remaining words are zero.
- */
-static inline size_t hbitmap_iter_next_word(HBitmapIter *hbi, unsigned long *p_cur)
-{
-    unsigned long cur = hbi->cur[HBITMAP_LEVELS - 1];
-
-    if (cur == 0) {
-        cur = hbitmap_iter_skip_words(hbi);
-        if (cur == 0) {
-            *p_cur = 0;
-            return -1;
-        }
-    }
-
-    /* The next call will resume work from the next word.  */
-    hbi->cur[HBITMAP_LEVELS - 1] = 0;
-    *p_cur = cur;
-    return hbi->pos;
-}
-
-
 #endif
diff --git a/util/hbitmap.c b/util/hbitmap.c
index df192234e3..2799f51b62 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -298,6 +298,35 @@ uint64_t hbitmap_count(const HBitmap *hb)
     return hb->count << hb->granularity;
 }
 
+/**
+ * hbitmap_iter_next_word:
+ * @hbi: HBitmapIter to operate on.
+ * @p_cur: Location where to store the next non-zero word.
+ *
+ * Return the index of the next nonzero word that is set in @hbi's
+ * associated HBitmap, and set *p_cur to the content of that word
+ * (bits before the index that was passed to hbitmap_iter_init are
+ * trimmed on the first call).  Return -1, and set *p_cur to zero,
+ * if all remaining words are zero.
+ */
+static size_t hbitmap_iter_next_word(HBitmapIter *hbi, unsigned long *p_cur)
+{
+    unsigned long cur = hbi->cur[HBITMAP_LEVELS - 1];
+
+    if (cur == 0) {
+        cur = hbitmap_iter_skip_words(hbi);
+        if (cur == 0) {
+            *p_cur = 0;
+            return -1;
+        }
+    }
+
+    /* The next call will resume work from the next word.  */
+    hbi->cur[HBITMAP_LEVELS - 1] = 0;
+    *p_cur = cur;
+    return hbi->pos;
+}
+
 /* Count the number of set bits between start and end, not accounting for
  * the granularity.  Also an example of how to use hbitmap_iter_next_word.
  */
-- 
2.21.0


