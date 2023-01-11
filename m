Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D7766528B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 04:57:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFSE7-0006wi-6N; Tue, 10 Jan 2023 22:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFSE4-0006w8-0V
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 22:56:32 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFSE0-0003x4-1S
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 22:56:29 -0500
Received: by mail-qv1-xf34.google.com with SMTP id t7so9923738qvv.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 19:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11xpmBwNgjoPFc6a9/KT01BTMNezgo+uFMVTZmsCgC8=;
 b=jnudZ2uErCUvRUgN71tdLbMyUDSec7tVEn2MFxe/3re454ahyOEq3c0bdjjU+u4vLi
 txrPAJwe9sd/Rn4PsVbzOKN4ZGc7pthPPrSP1+FJn4CGaAFiEqZb7MtkD0KvqYGFZ9rw
 FDZc8FYCTcHTjT+5Tnk4lwsYV3mQwOC+839wdJo4gGim+NTsJV1GYUZPmq+pBubwvPYc
 nW9srWy0IXoya69eryhlpSvLfNDbb834PGiY/SC4TYhA5LJAyjYcvsb3xLkAsQeAmTQe
 b24/lh084vdVnYphStpm8Gn62st+i/yMxJQWs3QoIHPPY2C8fNhYvUoLlW+wKUOfIkn7
 z8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11xpmBwNgjoPFc6a9/KT01BTMNezgo+uFMVTZmsCgC8=;
 b=2omkaXBCKBo4KAc9Y7ZyXafr5L4R2YjV4+OjQcusEhzYfmCK3ETk/xjnG9OfBgpgym
 46ynCmI0FRpgUC01EiYQzQWQY6NLdRTtjs32rIDVeOqPQMCwY2zKO1YL4MKcW0h+0FWI
 bD4+QIaJfefRolbddHO865o54Rmi+tEIXJTxf0gbz5kF2bUjqZW4+89adwZ8d8vozgus
 CpYGKNN1mnR9CDqG17uwsI9HlvvXJNqixCjcndjhkdO36RJ3wYl5wRqTcQ3weSGWlRh0
 u6DxZEICOuQZT3PKQeM+gm3mwkb7iKqdu4UMUNAMEU13M5AFTKRZd6PlJM6TAUhagGMJ
 gMaw==
X-Gm-Message-State: AFqh2kqg5AN00ZcQmAPH3lFIw39FpMo0kUc4aHsFnn+AWA7XVnnnPG/H
 Wu6FHxoaFvlfMJBl0za95m8ghu9ln4G9E7lztf8=
X-Google-Smtp-Source: AMrXdXsBhmHeWOQIlF7/a0XsnysJp2r1QJLmovHyYqGiLtkCM/utbx+Y3MUOgIc2mhD/HWWL/kMwAQ==
X-Received: by 2002:a05:6214:12c2:b0:4c6:90b9:b81e with SMTP id
 s2-20020a05621412c200b004c690b9b81emr92203636qvv.22.1673409386763; 
 Tue, 10 Jan 2023 19:56:26 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 u15-20020a37ab0f000000b006f9c2be0b4bsm8146590qke.135.2023.01.10.19.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 19:56:26 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH 2/2] tcg: use QTree instead of GTree
Date: Tue, 10 Jan 2023 22:55:36 -0500
Message-Id: <20230111035536.309885-3-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111035536.309885-1-cota@braap.org>
References: <20230111035536.309885-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::f34;
 envelope-from=cota@braap.org; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qemu-user can hang in a multi-threaded fork. One common
reason is that when creating a TB, between fork and exec
we manipulate a GTree whose memory allocator (GSlice) is
not fork-safe.

Although POSIX does not mandate it, the system's allocator
(e.g. tcmalloc, libc malloc) is probably fork-safe.

Fix some of these hangs by using QTree, which uses
the system's allocator.

For more details, see:
  https://gitlab.com/qemu-project/qemu/-/issues/285

Performance impact on linux-user:
- ~2% slowdown in spec06
- 1.05% slowdown in Nbench-int
- 4.51% slowdown in Nbench-fp

                                        x86_64 spec06
                      Host: AMD Ryzen 7 PRO 5850U with Radeon Graphics
  1.04 +--------------------------------------------------------------------------------------------------+
       |                                                                                    |             |
       |                                                                          qtree-gcc1|.int         |
       |                                                +-+                                 |             |
  1.02 |-+...............................................|..................................|...........+-|
       |                                                 |                                  |             |
       |                          +-+                    |                                  |             |
     1 |-+..........+-+............|............+-+......|..........................+-+.....|...........+-|
       |           **|**           |            *|**     |    *+-+                   |      |             |
       |           *+-+*           |            +-+*     |    *  *    +-+          **|**    |             |
       |           *   *   +-+    *|**          *  *   **|*   *  *     |           *+-+*    |     +-+     |
  0.98 |-+.........*...*....|.....*|.*..........*..*...*.|*...*..*...**|*..........*...*....|....**|**..+-|
       |           *   *  **|**   *| *   +-+    *  *   * |*   *  *   *+-+    +-+   *   *  **|**  *+-+*    |
       |    *+-+*  *   *  * | *   +-+*    |     *  *   * |*   *  *   *  *     |    *   *  * | *  *   *    |
       |    *+-+*  *   *  *+-+*   *  *    |     *  *   * |*   *  *   *  *     |    *   *  * | *  *   *    |
  0.96 |-+..*...*..*...*..*...*...*..*...*|**...*..*...*.|*...*..*...*..*.....|....*...*..*.|.*..*...*..+-|
       |    *   *  *   *  *   *   *  *   *| *   *  *   * |*   *  *   *  *   **|*   *   *  * | *  *   *    |
       |    *   *  *   *  *   *   *  *   +-+*   *  *   *+-+   *  *   *  *   * |*   *   *  * | *  *   *    |
       |    *   *  *   *  *   *   *  *   *  *   *  *   *  *   *  *   *  *   * |*   *   *  * | *  *   *    |
  0.94 |-+..*...*..*...*..*...*...*..*...*..*...*..*...*..*...*..*...*..*...*.|*...*...*..*.|.*..*...*..+-|
       |    *   *  *   *  *   *   *  *   *  *   *  *   *  *   *  *   *  *   * |*   *   *  * | *  *   *    |
       |    *   *  *   *  *   *   *  *   *  *   *  *   *  *   *  *   *  *   *+-+   *   *  * | *  *   *    |
  0.92 |-+..*...*..*...*..*...*...*..*...*..*...*..*...*..*...*..*...*..*...*..*...*...*..*.|.*..*...*..+-|
       |    *   *  *   *  *   *   *  *   *  *   *  *   *  *   *  *   *  *   *  *   *   *  *+-+*  *   *    |
       |    *   *  *   *  *   *   *  *   *  *   *  *   *  *   *  *   *  *   *  *   *   *  *   *  *   *    |
       |    *   *  *   *  *   *   *  *   *  *   *  *   *  *   *  *   *  *   *  *   *   *  *   *  *   *    |
   0.9 +--------------------------------------------------------------------------------------------------+
 400.perlben401.bzip2403.gcc429.m445.gob456.hmme45462.libqua464.h26471.omnet473483.xalancbmkgeomean

                         aarch64 NBench Integer Performance
                  Host: AMD Ryzen 7 PRO 5850U with Radeon Graphics
     81.2 +----------------------------------------------------------------+
          |                     +                    +                     |
          |                    ***                                         |
       81 |-+                   B                                        +-|
          |                    **##                                        |
     80.8 |-+                      ##                                    +-|
          |                          ##                                    |
          |                            ##                                  |
     80.6 |-+                            ##                              +-|
          |                                ##                              |
          |                                  ##                            |
     80.4 |-+                                  ##                        +-|
          |                                      ##                        |
     80.2 |-+                                      ##**                  +-|
          |                                          B                     |
          |                     +                    *                     |
       80 +----------------------------------------------------------------+
                          master-gcc12          qtree-gcc12
                                    QEMU version

                      aarch64 NBench Floating Point Performance
                  Host: AMD Ryzen 7 PRO 5850U with Radeon Graphics
     13.8 +----------------------------------------------------------------+
          |                    *B*                   +                     |
     13.7 |-+                  **##                                      +-|
          |                        ##                                      |
     13.6 |-+                        #                                   +-|
          |                           ##                                   |
     13.5 |-+                           #                                +-|
          |                              ##                                |
     13.4 |-+                              ##                            +-|
          |                                  #                             |
     13.3 |-+                                 ##                         +-|
          |                                     #                          |
     13.2 |-+                                    ##                      +-|
          |                                        ##**                    |
     13.1 |-+                                        B                   +-|
          |                     +                   ***                    |
       13 +----------------------------------------------------------------+
                          master-gcc12          qtree-gcc12
                                    QEMU version

Signed-off-by: Emilio Cota <cota@braap.org>
---
 accel/tcg/tb-maint.c | 17 +++++++++--------
 tcg/region.c         | 19 ++++++++++---------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index b3d6529ae2..e6370ddc71 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/interval-tree.h"
+#include "qemu/qtree.h"
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
@@ -313,7 +314,7 @@ struct page_entry {
  * See also: page_collection_lock().
  */
 struct page_collection {
-    GTree *tree;
+    QTree *tree;
     struct page_entry *max;
 };
 
@@ -466,7 +467,7 @@ static bool page_trylock_add(struct page_collection *set, tb_page_addr_t addr)
     struct page_entry *pe;
     PageDesc *pd;
 
-    pe = g_tree_lookup(set->tree, &index);
+    pe = q_tree_lookup(set->tree, &index);
     if (pe) {
         return false;
     }
@@ -477,7 +478,7 @@ static bool page_trylock_add(struct page_collection *set, tb_page_addr_t addr)
     }
 
     pe = page_entry_new(pd, index);
-    g_tree_insert(set->tree, &pe->index, pe);
+    q_tree_insert(set->tree, &pe->index, pe);
 
     /*
      * If this is either (1) the first insertion or (2) a page whose index
@@ -524,13 +525,13 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
     end   >>= TARGET_PAGE_BITS;
     g_assert(start <= end);
 
-    set->tree = g_tree_new_full(tb_page_addr_cmp, NULL, NULL,
+    set->tree = q_tree_new_full(tb_page_addr_cmp, NULL, NULL,
                                 page_entry_destroy);
     set->max = NULL;
     assert_no_pages_locked();
 
  retry:
-    g_tree_foreach(set->tree, page_entry_lock, NULL);
+    q_tree_foreach(set->tree, page_entry_lock, NULL);
 
     for (index = start; index <= end; index++) {
         TranslationBlock *tb;
@@ -541,7 +542,7 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
             continue;
         }
         if (page_trylock_add(set, index << TARGET_PAGE_BITS)) {
-            g_tree_foreach(set->tree, page_entry_unlock, NULL);
+            q_tree_foreach(set->tree, page_entry_unlock, NULL);
             goto retry;
         }
         assert_page_locked(pd);
@@ -550,7 +551,7 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
                 (tb_page_addr1(tb) != -1 &&
                  page_trylock_add(set, tb_page_addr1(tb)))) {
                 /* drop all locks, and reacquire in order */
-                g_tree_foreach(set->tree, page_entry_unlock, NULL);
+                q_tree_foreach(set->tree, page_entry_unlock, NULL);
                 goto retry;
             }
         }
@@ -561,7 +562,7 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
 static void page_collection_unlock(struct page_collection *set)
 {
     /* entries are unlocked and freed via page_entry_destroy */
-    g_tree_destroy(set->tree);
+    q_tree_destroy(set->tree);
     g_free(set);
 }
 
diff --git a/tcg/region.c b/tcg/region.c
index 88d6bb273f..bef4c4756f 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -28,6 +28,7 @@
 #include "qemu/mprotect.h"
 #include "qemu/memalign.h"
 #include "qemu/cacheinfo.h"
+#include "qemu/qtree.h"
 #include "qapi/error.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
@@ -36,7 +37,7 @@
 
 struct tcg_region_tree {
     QemuMutex lock;
-    GTree *tree;
+    QTree *tree;
     /* padding to avoid false sharing is computed at run-time */
 };
 
@@ -163,7 +164,7 @@ static void tcg_region_trees_init(void)
         struct tcg_region_tree *rt = region_trees + i * tree_size;
 
         qemu_mutex_init(&rt->lock);
-        rt->tree = g_tree_new_full(tb_tc_cmp, NULL, NULL, tb_destroy);
+        rt->tree = q_tree_new_full(tb_tc_cmp, NULL, NULL, tb_destroy);
     }
 }
 
@@ -202,7 +203,7 @@ void tcg_tb_insert(TranslationBlock *tb)
 
     g_assert(rt != NULL);
     qemu_mutex_lock(&rt->lock);
-    g_tree_insert(rt->tree, &tb->tc, tb);
+    q_tree_insert(rt->tree, &tb->tc, tb);
     qemu_mutex_unlock(&rt->lock);
 }
 
@@ -212,7 +213,7 @@ void tcg_tb_remove(TranslationBlock *tb)
 
     g_assert(rt != NULL);
     qemu_mutex_lock(&rt->lock);
-    g_tree_remove(rt->tree, &tb->tc);
+    q_tree_remove(rt->tree, &tb->tc);
     qemu_mutex_unlock(&rt->lock);
 }
 
@@ -232,7 +233,7 @@ TranslationBlock *tcg_tb_lookup(uintptr_t tc_ptr)
     }
 
     qemu_mutex_lock(&rt->lock);
-    tb = g_tree_lookup(rt->tree, &s);
+    tb = q_tree_lookup(rt->tree, &s);
     qemu_mutex_unlock(&rt->lock);
     return tb;
 }
@@ -267,7 +268,7 @@ void tcg_tb_foreach(GTraverseFunc func, gpointer user_data)
     for (i = 0; i < region.n; i++) {
         struct tcg_region_tree *rt = region_trees + i * tree_size;
 
-        g_tree_foreach(rt->tree, func, user_data);
+        q_tree_foreach(rt->tree, func, user_data);
     }
     tcg_region_tree_unlock_all();
 }
@@ -281,7 +282,7 @@ size_t tcg_nb_tbs(void)
     for (i = 0; i < region.n; i++) {
         struct tcg_region_tree *rt = region_trees + i * tree_size;
 
-        nb_tbs += g_tree_nnodes(rt->tree);
+        nb_tbs += q_tree_nnodes(rt->tree);
     }
     tcg_region_tree_unlock_all();
     return nb_tbs;
@@ -296,8 +297,8 @@ static void tcg_region_tree_reset_all(void)
         struct tcg_region_tree *rt = region_trees + i * tree_size;
 
         /* Increment the refcount first so that destroy acts as a reset */
-        g_tree_ref(rt->tree);
-        g_tree_destroy(rt->tree);
+        q_tree_ref(rt->tree);
+        q_tree_destroy(rt->tree);
     }
     tcg_region_tree_unlock_all();
 }
-- 
2.34.1


