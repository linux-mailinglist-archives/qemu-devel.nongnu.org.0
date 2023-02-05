Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C4C68B0FF
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 17:39:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOi2F-0002Xp-GV; Sun, 05 Feb 2023 11:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pOi2D-0002Xc-6q
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 11:38:33 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pOi28-0004rc-Ig
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 11:38:32 -0500
Received: by mail-il1-x12b.google.com with SMTP id h18so3918227ilj.6
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 08:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUJqVqypnfp83VaMb+jpgbor+NsQOUsGTMF+kiWKw6o=;
 b=tLhkY+ZK2vrJfcSf6Zv665ydu+VL/THVipM/10ECMJ3y2v8k/dunpDBUNUuO8e9CMP
 rQghwrmqbH+r+J/HgSFEMlfyyy29NmKBExkD3uR/yB+fL4PVgRz85G8Py9uFVJDh1J4s
 A2H6+llgUuZzLlxXIdTAVpK7OjHixJWHHajJcdF4HXm5f4zbdiRRws30bE4mMJ2rQbZs
 Rnok0E97CN484x4DyAiPJAhFyV736J3NsGp6MLdY2AoupXX3XqccUpHSfbNeXIJkbU7L
 J9u+DQQutTwFN4hGrcmw2Zu5W5ZSzIdkTHZAm8ttO6GoKJQiI9WDPy231FYg2nnFuJJG
 l+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUJqVqypnfp83VaMb+jpgbor+NsQOUsGTMF+kiWKw6o=;
 b=vY8ttWcoprFBZUBk6d6vDvQhaEY4ANJDN/od6XLk4pjhmxdOAawXyMHRxBaRLyQAvD
 XRqmqspzio6LW4VNJ0q9/xVmIG+lEX7qsZdXOdQXcyy3+wH7PMeZdQ3YMEEy5u2QSLEC
 YVcMUdKSKvNi/b9jOLLSHFZB5FfF5ck1Wt1tuPw6iT1qG1R6HXOUzFVJj2V53ncyehCO
 etrdtz4ev1DTwWDmITt1EKBNr2JswU4vCmuC+/ZJDJPyD6vNNwrZx19ZIw6zKKJg2UP5
 W5ChcnuaAXWF+4LF6/KJNctRrIk45Zkla1Hsut93ltmqPiso6EGnUmJYc174oCz7wK14
 anKQ==
X-Gm-Message-State: AO0yUKUw4l0SuSUwfjrFGSNtkEYersnHfPAD+W52jUqfFqfzN/Jb7lkR
 f+0gsImibWkoDlKCQou7Xpjzb6LLQ7QVUmK0prw=
X-Google-Smtp-Source: AK7set92sBGIiAWD7YKscvIWELtQmmOjDJon1tXDAsimRGy4jH64vwJ8mzECXQB8KdPzfHO1YTALnA==
X-Received: by 2002:a92:c26e:0:b0:311:6e9:7782 with SMTP id
 h14-20020a92c26e000000b0031106e97782mr14278193ild.1.1675615107214; 
 Sun, 05 Feb 2023 08:38:27 -0800 (PST)
Received: from localhost ([143.244.47.84]) by smtp.gmail.com with ESMTPSA id
 g9-20020a056e02198900b0030f04dcbc2fsm2601936ilf.66.2023.02.05.08.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 08:38:26 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH v2 2/2] tcg: use QTree instead of GTree
Date: Sun,  5 Feb 2023 11:37:58 -0500
Message-Id: <20230205163758.416992-3-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230205163758.416992-1-cota@braap.org>
References: <20230205163758.416992-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::12b;
 envelope-from=cota@braap.org; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Fixes: #285

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


