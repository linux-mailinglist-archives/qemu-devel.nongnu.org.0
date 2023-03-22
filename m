Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369C6C4F01
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:09:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf04A-0002hL-0j; Wed, 22 Mar 2023 11:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf048-0002gP-0d
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:07:52 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf046-0007Fk-0A
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:07:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id w4so11476142plg.9
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMY/vAWySJgtF4AXv2RQlxqwdk/wExvFK2+RnIza0g8=;
 b=lnhhn9gp2CzztoUq0/u5Gsck2jBo+71aCIXsHlR8OzvmCY4SjYHlHfCZwdXt254fBD
 ej2tclNAbLyoVmhoZbseQ0p+0/mGFgI3VzigzDtQ8q9C0opl12mGnEiaV3TpxsNYFs25
 5HkpOYVjUGrcmrSJ0OPkb290ttwo1QaWL/XlbfyctbaVhOsvLVhMQBbUFUEtmibFxooJ
 9rFyWDTmrajWP/LHP4uPdT+OM1j2tnsy9Un8Zh9hrffAFGj+crTQLI4D7q6UvXnkLt4s
 xy3ktFj5XoK35CjiXXUBrhJyZWq00qCQAnRIiRjsDUe/X6jbuZAwmo4JWswujH4REq/c
 xgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMY/vAWySJgtF4AXv2RQlxqwdk/wExvFK2+RnIza0g8=;
 b=wbgyYpyWVFt/jvdGH22YfrFYuXc9+wHvkCi/HJ4gmzu9FVNgioeAy+yk1dChkJRWkK
 Ynp2k2hXPOI7rnd5X6XyHgsmZighqo6sqQi5uPG2a4eFsMxoMfZdcthBzHBARcz4I1h+
 S+2Wtypsp1uZYcQudZESaE56Z5ZzPdE3XMZHemHzJv5RNsnPN4HjS/gHMSOyxrkXpYRx
 +qoNR/FPLtKaiRNkcP/ERJwI9bZog90x3hXC1IhZUENpH0Ipw3f8sM/kN+XBTUKc7tvE
 it5obYkDEeGc6/RWgIF5y3DrHAczg6YRe/7N96Zd826e7wNK9TTMiF6gjxxiRz/+B/pQ
 nFiA==
X-Gm-Message-State: AO0yUKV04rrzAnc0OC77ZQsCVCrm+BZGd4fxMa1MMRBqItrTBnEYLbtp
 j8lUxhYS0XRUKIO2nRsil3frBwkKCdBVgWqFoz0=
X-Google-Smtp-Source: AK7set90p8uGDcdisd3MyAZsSKA0IT5vfmYMQl0uNu3vXHbudpkrQD8Wr4dVjs9xTtVktAJNe0sgvQ==
X-Received: by 2002:a17:90b:3149:b0:23f:7dfb:7dc1 with SMTP id
 ip9-20020a17090b314900b0023f7dfb7dc1mr4139973pjb.33.1679497668696; 
 Wed, 22 Mar 2023 08:07:48 -0700 (PDT)
Received: from stoup.. (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm10757555plo.3.2023.03.22.08.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:07:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, peter.maydell@linaro.org,
 Valentin David <me@valentindavid.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 02/11] tcg: use QTree instead of GTree
Date: Wed, 22 Mar 2023 08:07:35 -0700
Message-Id: <20230322150744.175010-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322150744.175010-1-richard.henderson@linaro.org>
References: <20230322150744.175010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emilio Cota <cota@braap.org>

qemu-user can hang in a multi-threaded fork. One common
reason is that when creating a TB, between fork and exec
we manipulate a GTree whose memory allocator (GSlice) is
not fork-safe.

Although POSIX does not mandate it, the system's allocator
(e.g. tcmalloc, libc malloc) is probably fork-safe.

Fix some of these hangs by using QTree, which uses the system's
allocator regardless of the Glib version that we used at
configuration time.

Tested with the test program in the original bug report, i.e.:
```

void garble() {
  int pid = fork();
  if (pid == 0) {
    exit(0);
  } else {
    int wstatus;
    waitpid(pid, &wstatus, 0);
  }
}

void supragarble(unsigned depth) {
  if (depth == 0)
    return ;

  std::thread a(supragarble, depth-1);
  std::thread b(supragarble, depth-1);
  garble();
  a.join();
  b.join();
}

int main() {
  supragarble(10);
}
```

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/285
Reported-by: Valentin David <me@valentindavid.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230205163758.416992-3-cota@braap.org>
[rth: Add QEMU_DISABLE_CFI for all callback using functions.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 17 +++++++++--------
 tcg/region.c         | 19 ++++++++++---------
 util/qtree.c         |  8 ++++----
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 7246c1c46b..a173db17e6 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/interval-tree.h"
+#include "qemu/qtree.h"
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
@@ -314,7 +315,7 @@ struct page_entry {
  * See also: page_collection_lock().
  */
 struct page_collection {
-    GTree *tree;
+    QTree *tree;
     struct page_entry *max;
 };
 
@@ -467,7 +468,7 @@ static bool page_trylock_add(struct page_collection *set, tb_page_addr_t addr)
     struct page_entry *pe;
     PageDesc *pd;
 
-    pe = g_tree_lookup(set->tree, &index);
+    pe = q_tree_lookup(set->tree, &index);
     if (pe) {
         return false;
     }
@@ -478,7 +479,7 @@ static bool page_trylock_add(struct page_collection *set, tb_page_addr_t addr)
     }
 
     pe = page_entry_new(pd, index);
-    g_tree_insert(set->tree, &pe->index, pe);
+    q_tree_insert(set->tree, &pe->index, pe);
 
     /*
      * If this is either (1) the first insertion or (2) a page whose index
@@ -525,13 +526,13 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
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
@@ -542,7 +543,7 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
             continue;
         }
         if (page_trylock_add(set, index << TARGET_PAGE_BITS)) {
-            g_tree_foreach(set->tree, page_entry_unlock, NULL);
+            q_tree_foreach(set->tree, page_entry_unlock, NULL);
             goto retry;
         }
         assert_page_locked(pd);
@@ -551,7 +552,7 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
                 (tb_page_addr1(tb) != -1 &&
                  page_trylock_add(set, tb_page_addr1(tb)))) {
                 /* drop all locks, and reacquire in order */
-                g_tree_foreach(set->tree, page_entry_unlock, NULL);
+                q_tree_foreach(set->tree, page_entry_unlock, NULL);
                 goto retry;
             }
         }
@@ -562,7 +563,7 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
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
diff --git a/util/qtree.c b/util/qtree.c
index deb46c187f..31f0b46182 100644
--- a/util/qtree.c
+++ b/util/qtree.c
@@ -310,7 +310,7 @@ q_tree_node_next(QTreeNode *node)
  *
  * Since: 2.70 in GLib. Internal in Qtree, i.e. not in the public API.
  */
-static void
+static void QEMU_DISABLE_CFI
 q_tree_remove_all(QTree *tree)
 {
     QTreeNode *node;
@@ -532,7 +532,7 @@ q_tree_replace(QTree    *tree,
 }
 
 /* internal insert routine */
-static QTreeNode *
+static QTreeNode * QEMU_DISABLE_CFI
 q_tree_insert_internal(QTree    *tree,
                        gpointer  key,
                        gpointer  value,
@@ -721,7 +721,7 @@ q_tree_steal(QTree         *tree,
 }
 
 /* internal remove routine */
-static gboolean
+static gboolean QEMU_DISABLE_CFI
 q_tree_remove_internal(QTree         *tree,
                        gconstpointer  key,
                        gboolean       steal)
@@ -1182,7 +1182,7 @@ q_tree_node_balance(QTreeNode *node)
     return node;
 }
 
-static QTreeNode *
+static QTreeNode * QEMU_DISABLE_CFI
 q_tree_find_node(QTree        *tree,
                  gconstpointer key)
 {
-- 
2.34.1


