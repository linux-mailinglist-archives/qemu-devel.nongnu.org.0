Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E2B5F5FA0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:30:31 +0200 (CEST)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHag-0002PZ-3Q
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIZ-0006Jp-2O
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:47 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIV-0006xB-7Q
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:46 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d24so545580pls.4
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=N/9lafWzfQqL6g4rB+QWqqgpDqQLDq6AjNiRH51vrg0=;
 b=qRmOogJ1MAtnzMtiDO4ffYUzpzHk+0pUxkVgr/BwFQ+2ci83hvAAU3FHb478l1CrcQ
 nl06WM4m4eto5TnSiKSqrjKO7tM4W9m5jL0wVDIrGiZsFc6Fb1XYbT/mDrOZDoCNX29M
 KTM56YonTK1oXGTTVIzZqH++V1W2xPd0bkvVULRSykxzgGdidEF4XWqmR6hypQ7fk1cf
 WDZ7WL1doWSqawnoxtMXj58dMKOCemayMzMHDd95n1eCYTsqLfjLWdQ9ZvXqvvEj6WNx
 XQhDjEyF+Ys1Jeg3EV2c+A58O8+hMQdx9M1npVncR8huCsa+fiKOx9WyfhjGKil+4H/3
 E02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N/9lafWzfQqL6g4rB+QWqqgpDqQLDq6AjNiRH51vrg0=;
 b=d2oDW64renUiwpajD27wNR0GrxKN2vPhLM62iU8W9qev/pNbWbAO+BQWOXY6ywbnL9
 IzHWcP9bReqp8WicIHStgN9fV6ximPnpcRmzM7Y2EYNFqqfUEwiDSdNeoMpwnJZrkNkG
 zMqgoAvfCWPsInmd1einOqgYWdEPyQ+Yos6MDZHgyfZwiLKvbdxaNCSw1VxToQGC5T/V
 a6eDEfe6kAdyFtpa0VZjpibEKhEpy2A3Zg95AsTJ57XjKRdUiBQakEHTaUuDmluYNM1K
 rtEgQBBApgBXwvip5Dvq5gJqU+GSowxxHas+4bso6KjU19QrofkL+FaEreIXy+Jkd0LU
 7DLg==
X-Gm-Message-State: ACrzQf1asB6e2urmSe80Wl8WHtqQqL28O5vHKT7pxw7OZSLaUb90Xtg3
 sRAULHu4BSZh548aJa/MSuiIBjff9cleAg==
X-Google-Smtp-Source: AMsMyM4nF9F7qVvxgK9OgXUVBCa4Aa4y+qbgW5IeUsISCsxhjlOi5Nu6gDGt0wixZtgnWd5FcYxlKA==
X-Received: by 2002:a17:902:f550:b0:178:5b6a:3a1c with SMTP id
 h16-20020a170902f55000b001785b6a3a1cmr2651682plf.36.1665025902192; 
 Wed, 05 Oct 2022 20:11:42 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 22/24] accel/tcg: Use interval tree for user-only page tracking
Date: Wed,  5 Oct 2022 20:11:11 -0700
Message-Id: <20221006031113.1139454-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finish weaning user-only away from PageDesc.

Using an interval tree to track page permissions means that
we can represent very large regions efficiently.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/290
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/967
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1214
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h           |   4 +-
 accel/tcg/tb-maint.c           |  20 +-
 accel/tcg/user-exec.c          | 614 ++++++++++++++++++++++-----------
 tests/tcg/multiarch/test-vma.c |  22 ++
 4 files changed, 451 insertions(+), 209 deletions(-)
 create mode 100644 tests/tcg/multiarch/test-vma.c

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 250f0daac9..c7e157d1cd 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -24,9 +24,7 @@
 #endif
 
 typedef struct PageDesc {
-#ifdef CONFIG_USER_ONLY
-    unsigned long flags;
-#else
+#ifndef CONFIG_USER_ONLY
     QemuSpin lock;
     /* list of TBs intersecting this ram page */
     uintptr_t first_tb;
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 14e8e47a6a..694440cb4a 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -68,15 +68,23 @@ static void page_flush_tb(void)
 /* Call with mmap_lock held. */
 static void tb_page_add(TranslationBlock *tb, PageDesc *p1, PageDesc *p2)
 {
-    /* translator_loop() must have made all TB pages non-writable */
-    assert(!(p1->flags & PAGE_WRITE));
-    if (p2) {
-        assert(!(p2->flags & PAGE_WRITE));
-    }
+    target_ulong addr;
+    int flags;
 
     assert_memory_lock();
-
     tb->itree.last = tb->itree.start + tb->size - 1;
+
+    /* translator_loop() must have made all TB pages non-writable */
+    addr = tb_page_addr0(tb);
+    flags = page_get_flags(addr);
+    assert(!(flags & PAGE_WRITE));
+
+    addr = tb_page_addr1(tb);
+    if (addr != -1) {
+        flags = page_get_flags(addr);
+        assert(!(flags & PAGE_WRITE));
+    }
+
     interval_tree_insert(&tb->itree, &tb_root);
 }
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index b6050e2bfe..3b47a9e26a 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -135,106 +135,61 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
     }
 }
 
-/*
- * Walks guest process memory "regions" one by one
- * and calls callback function 'fn' for each region.
- */
-struct walk_memory_regions_data {
-    walk_memory_regions_fn fn;
-    void *priv;
-    target_ulong start;
-    int prot;
-};
+typedef struct PageFlagsNode {
+    IntervalTreeNode itree;
+    int flags;
+} PageFlagsNode;
 
-static int walk_memory_regions_end(struct walk_memory_regions_data *data,
-                                   target_ulong end, int new_prot)
+static IntervalTreeRoot pageflags_root;
+
+static PageFlagsNode *pageflags_find(target_ulong start, target_long last)
 {
-    if (data->start != -1u) {
-        int rc = data->fn(data->priv, data->start, end, data->prot);
-        if (rc != 0) {
-            return rc;
-        }
-    }
+    IntervalTreeNode *n;
 
-    data->start = (new_prot ? end : -1u);
-    data->prot = new_prot;
-
-    return 0;
+    n = interval_tree_iter_first(&pageflags_root, start, last);
+    return n ? container_of(n, PageFlagsNode, itree) : NULL;
 }
 
-static int walk_memory_regions_1(struct walk_memory_regions_data *data,
-                                 target_ulong base, int level, void **lp)
+static PageFlagsNode *pageflags_next(PageFlagsNode *p, target_ulong start,
+                                     target_long last)
 {
-    target_ulong pa;
-    int i, rc;
+    IntervalTreeNode *n;
 
-    if (*lp == NULL) {
-        return walk_memory_regions_end(data, base, 0);
-    }
-
-    if (level == 0) {
-        PageDesc *pd = *lp;
-
-        for (i = 0; i < V_L2_SIZE; ++i) {
-            int prot = pd[i].flags;
-
-            pa = base | (i << TARGET_PAGE_BITS);
-            if (prot != data->prot) {
-                rc = walk_memory_regions_end(data, pa, prot);
-                if (rc != 0) {
-                    return rc;
-                }
-            }
-        }
-    } else {
-        void **pp = *lp;
-
-        for (i = 0; i < V_L2_SIZE; ++i) {
-            pa = base | ((target_ulong)i <<
-                (TARGET_PAGE_BITS + V_L2_BITS * level));
-            rc = walk_memory_regions_1(data, pa, level - 1, pp + i);
-            if (rc != 0) {
-                return rc;
-            }
-        }
-    }
-
-    return 0;
+    n = interval_tree_iter_next(&p->itree, start, last);
+    return n ? container_of(n, PageFlagsNode, itree) : NULL;
 }
 
 int walk_memory_regions(void *priv, walk_memory_regions_fn fn)
 {
-    struct walk_memory_regions_data data;
-    uintptr_t i, l1_sz = v_l1_size;
+    IntervalTreeNode *n;
+    int rc = 0;
 
-    data.fn = fn;
-    data.priv = priv;
-    data.start = -1u;
-    data.prot = 0;
+    mmap_lock();
+    for (n = interval_tree_iter_first(&pageflags_root, 0, -1);
+         n != NULL;
+         n = interval_tree_iter_next(n, 0, -1)) {
+        PageFlagsNode *p = container_of(n, PageFlagsNode, itree);
 
-    for (i = 0; i < l1_sz; i++) {
-        target_ulong base = i << (v_l1_shift + TARGET_PAGE_BITS);
-        int rc = walk_memory_regions_1(&data, base, v_l2_levels, l1_map + i);
+        rc = fn(priv, n->start, n->last + 1, p->flags);
         if (rc != 0) {
-            return rc;
+            break;
         }
     }
+    mmap_unlock();
 
-    return walk_memory_regions_end(&data, 0, 0);
+    return rc;
 }
 
 static int dump_region(void *priv, target_ulong start,
-    target_ulong end, unsigned long prot)
+                       target_ulong end, unsigned long prot)
 {
     FILE *f = (FILE *)priv;
 
-    (void) fprintf(f, TARGET_FMT_lx"-"TARGET_FMT_lx
-        " "TARGET_FMT_lx" %c%c%c\n",
-        start, end, end - start,
-        ((prot & PAGE_READ) ? 'r' : '-'),
-        ((prot & PAGE_WRITE) ? 'w' : '-'),
-        ((prot & PAGE_EXEC) ? 'x' : '-'));
-
+    fprintf(f, TARGET_FMT_lx"-"TARGET_FMT_lx" "TARGET_FMT_lx" %c%c%c\n",
+            start, end, end - start,
+            ((prot & PAGE_READ) ? 'r' : '-'),
+            ((prot & PAGE_WRITE) ? 'w' : '-'),
+            ((prot & PAGE_EXEC) ? 'x' : '-'));
     return 0;
 }
 
@@ -242,22 +197,134 @@ static int dump_region(void *priv, target_ulong start,
 void page_dump(FILE *f)
 {
     const int length = sizeof(target_ulong) * 2;
-    (void) fprintf(f, "%-*s %-*s %-*s %s\n",
+
+    fprintf(f, "%-*s %-*s %-*s %s\n",
             length, "start", length, "end", length, "size", "prot");
     walk_memory_regions(f, dump_region);
 }
 
 int page_get_flags(target_ulong address)
 {
-    PageDesc *p;
+    PageFlagsNode *p = pageflags_find(address, address);
 
-    p = page_find(address >> TARGET_PAGE_BITS);
+    /*
+     * See util/interval-tree.c re lockless lookups: no false positives but
+     * there are false negatives.  If we find nothing, retry with the mmap
+     * lock acquired.
+     */
     if (!p) {
-        return 0;
+        if (have_mmap_lock()) {
+            return 0;
+        }
+        mmap_lock();
+        p = pageflags_find(address, address);
+        mmap_unlock();
+        if (!p) {
+            return 0;
+        }
     }
     return p->flags;
 }
 
+/* A subroutine of page_set_flags: insert a new node for [start,last]. */
+static void pageflags_create(target_ulong start, target_ulong last, int flags)
+{
+    PageFlagsNode *p = g_new(PageFlagsNode, 1);
+
+    p->itree.start = start;
+    p->itree.last = last;
+    p->flags = flags;
+    interval_tree_insert(&p->itree, &pageflags_root);
+}
+
+/* A subroutine of page_set_flags: remove everything in [start,last]. */
+static bool pageflags_unset(target_ulong start, target_ulong last)
+{
+    bool inval_tb = false;
+
+    while (true) {
+        PageFlagsNode *p = pageflags_find(start, last);
+        target_ulong p_last;
+
+        if (!p) {
+            break;
+        }
+
+        if (p->flags & PAGE_EXEC) {
+            inval_tb = true;
+        }
+
+        interval_tree_remove(&p->itree, &pageflags_root);
+        p_last = p->itree.last;
+
+        if (p->itree.start < start) {
+            /* Truncate the node from the end, or split out the middle. */
+            p->itree.last = start - 1;
+            interval_tree_insert(&p->itree, &pageflags_root);
+            if (last < p_last) {
+                pageflags_create(last + 1, p_last, p->flags);
+                break;
+            }
+        } else if (p_last <= last) {
+            /* Range completely covers node -- remove it. */
+            g_free(p);
+        } else {
+            /* Truncate the node from the start. */
+            p->itree.start = last + 1;
+            interval_tree_insert(&p->itree, &pageflags_root);
+            break;
+        }
+    }
+
+    return inval_tb;
+}
+
+/*
+ * A subroutine of page_set_flags: nothing overlaps [start,last],
+ * but check adjacent mappings and maybe merge into a single range.
+ */
+static void pageflags_create_merge(target_ulong start, target_ulong last,
+                                   int flags)
+{
+    PageFlagsNode *next = NULL, *prev = NULL;
+
+    if (start > 0) {
+        prev = pageflags_find(start - 1, start - 1);
+        if (prev) {
+            if (prev->flags == flags) {
+                interval_tree_remove(&prev->itree, &pageflags_root);
+            } else {
+                prev = NULL;
+            }
+        }
+    }
+    if (last + 1 != 0) {
+        next = pageflags_find(last + 1, last + 1);
+        if (next) {
+            if (next->flags == flags) {
+                interval_tree_remove(&next->itree, &pageflags_root);
+            } else {
+                next = NULL;
+            }
+        }
+    }
+
+    if (prev) {
+        if (next) {
+            prev->itree.last = next->itree.last;
+            g_free(next);
+        } else {
+            prev->itree.last = last;
+        }
+        interval_tree_insert(&prev->itree, &pageflags_root);
+    } else if (next) {
+        next->itree.start = start;
+        interval_tree_insert(&next->itree, &pageflags_root);
+    } else {
+        pageflags_create(start, last, flags);
+    }
+}
+
 /*
  * Allow the target to decide if PAGE_TARGET_[12] may be reset.
  * By default, they are not kept.
@@ -267,6 +334,146 @@ int page_get_flags(target_ulong address)
 #endif
 #define PAGE_STICKY  (PAGE_ANON | PAGE_PASSTHROUGH | PAGE_TARGET_STICKY)
 
+/* A subroutine of page_set_flags: add flags to [start,last]. */
+static bool pageflags_set_clear(target_ulong start, target_ulong last,
+                                int set_flags, int clear_flags)
+{
+    PageFlagsNode *p;
+    target_ulong p_start, p_last;
+    int p_flags, merge_flags;
+    bool inval_tb = false;
+
+ restart:
+    p = pageflags_find(start, last);
+    if (!p) {
+        if (set_flags) {
+            pageflags_create_merge(start, last, set_flags);
+        }
+        goto done;
+    }
+
+    p_start = p->itree.start;
+    p_last = p->itree.last;
+    p_flags = p->flags;
+    /* Using mprotect on a page does not change sticky bits. */
+    merge_flags = (p_flags & ~clear_flags) | set_flags;
+
+    /*
+     * Need to flush if an overlapping executable region
+     * removes exec, or adds write.
+     */
+    if ((p_flags & PAGE_EXEC)
+        && (!(merge_flags & PAGE_EXEC)
+            || (merge_flags & ~p_flags & PAGE_WRITE))) {
+        inval_tb = true;
+    }
+
+    /*
+     * If there is an exact range match, update and return without
+     * attempting to merge with adjacent regions.
+     */
+    if (start == p_start && last == p_last) {
+        if (merge_flags) {
+            p->flags = merge_flags;
+        } else {
+            interval_tree_remove(&p->itree, &pageflags_root);
+            g_free(p);
+        }
+        goto done;
+    }
+
+    /*
+     * If sticky bits affect the original mapping, then we must be more
+     * careful about the existing intervals and the separate flags.
+     */
+    if (set_flags != merge_flags) {
+        if (p_start < start) {
+            interval_tree_remove(&p->itree, &pageflags_root);
+            p->itree.last = start - 1;
+            interval_tree_insert(&p->itree, &pageflags_root);
+
+            if (last < p_last) {
+                if (merge_flags) {
+                    pageflags_create(start, last, merge_flags);
+                }
+                pageflags_create(last + 1, p_last, p_flags);
+            } else {
+                if (merge_flags) {
+                    pageflags_create(start, p_last, merge_flags);
+                }
+                if (p_last < last) {
+                    start = p_last + 1;
+                    goto restart;
+                }
+            }
+        } else {
+            if (start < p_start && set_flags) {
+                pageflags_create(start, p_start - 1, set_flags);
+            }
+            if (last < p_last) {
+                interval_tree_remove(&p->itree, &pageflags_root);
+                p->itree.start = last + 1;
+                interval_tree_insert(&p->itree, &pageflags_root);
+                if (merge_flags) {
+                    pageflags_create(start, last, merge_flags);
+                }
+            } else {
+                if (merge_flags) {
+                    p->flags = merge_flags;
+                } else {
+                    interval_tree_remove(&p->itree, &pageflags_root);
+                    g_free(p);
+                }
+                if (p_last < last) {
+                    start = p_last + 1;
+                    goto restart;
+                }
+            }
+        }
+        goto done;
+    }
+
+    /* If flags are not changing for this range, incorporate it. */
+    if (set_flags == p_flags) {
+        if (start < p_start) {
+            interval_tree_remove(&p->itree, &pageflags_root);
+            p->itree.start = start;
+            interval_tree_insert(&p->itree, &pageflags_root);
+        }
+        if (p_last < last) {
+            start = p_last + 1;
+            goto restart;
+        }
+        goto done;
+    }
+
+    /* Maybe split out head and/or tail ranges with the original flags. */
+    interval_tree_remove(&p->itree, &pageflags_root);
+    if (p_start < start) {
+        p->itree.last = start - 1;
+        interval_tree_insert(&p->itree, &pageflags_root);
+
+        if (p_last < last) {
+            goto restart;
+        }
+        if (last < p_last) {
+            pageflags_create(last + 1, p_last, p_flags);
+        }
+    } else if (last < p_last) {
+        p->itree.start = last + 1;
+        interval_tree_insert(&p->itree, &pageflags_root);
+    } else {
+        g_free(p);
+        goto restart;
+    }
+    if (set_flags) {
+        pageflags_create(start, last, set_flags);
+    }
+
+ done:
+    return inval_tb;
+}
+
 /*
  * Modify the flags of a page and invalidate the code if necessary.
  * The flag PAGE_WRITE_ORG is positioned automatically depending
@@ -274,49 +481,41 @@ int page_get_flags(target_ulong address)
  */
 void page_set_flags(target_ulong start, target_ulong end, int flags)
 {
-    target_ulong addr, len;
-    bool reset, inval_tb = false;
+    target_ulong last;
+    bool reset = false;
+    bool inval_tb = false;
 
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
        a missing call to h2g_valid.  */
-    assert(end - 1 <= GUEST_ADDR_MAX);
     assert(start < end);
+    assert(end - 1 <= GUEST_ADDR_MAX);
     /* Only set PAGE_ANON with new mappings. */
     assert(!(flags & PAGE_ANON) || (flags & PAGE_RESET));
     assert_memory_lock();
 
     start = start & TARGET_PAGE_MASK;
     end = TARGET_PAGE_ALIGN(end);
+    last = end - 1;
 
-    if (flags & PAGE_WRITE) {
-        flags |= PAGE_WRITE_ORG;
-    }
-    reset = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
-    if (reset) {
-        page_reset_target_data(start, end);
-    }
-    flags &= ~PAGE_RESET;
-
-    for (addr = start, len = end - start;
-         len != 0;
-         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
-
-        /*
-         * If the page was executable, but is reset, or is no longer
-         * executable, or has become writable, then invalidate any code.
-         */
-        if ((p->flags & PAGE_EXEC)
-            && (reset ||
-                !(flags & PAGE_EXEC) ||
-                (flags & ~p->flags & PAGE_WRITE))) {
-            inval_tb = true;
+    if (!(flags & PAGE_VALID)) {
+        flags = 0;
+    } else {
+        reset = flags & PAGE_RESET;
+        flags &= ~PAGE_RESET;
+        if (flags & PAGE_WRITE) {
+            flags |= PAGE_WRITE_ORG;
         }
-        /* Using mprotect on a page does not change sticky bits. */
-        p->flags = (reset ? 0 : p->flags & PAGE_STICKY) | flags;
     }
 
+    if (!flags || reset) {
+        page_reset_target_data(start, end);
+        inval_tb |= pageflags_unset(start, last);
+    }
+    if (flags) {
+        inval_tb |= pageflags_set_clear(start, last, flags,
+                                        ~(reset ? 0 : PAGE_STICKY));
+    }
     if (inval_tb) {
         tb_invalidate_phys_range(start, end);
     }
@@ -324,87 +523,89 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
 
 int page_check_range(target_ulong start, target_ulong len, int flags)
 {
-    PageDesc *p;
-    target_ulong end;
-    target_ulong addr;
-
-    /*
-     * This function should never be called with addresses outside the
-     * guest address space.  If this assert fires, it probably indicates
-     * a missing call to h2g_valid.
-     */
-    if (TARGET_ABI_BITS > L1_MAP_ADDR_SPACE_BITS) {
-        assert(start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
-    }
+    target_ulong last;
 
     if (len == 0) {
-        return 0;
-    }
-    if (start + len - 1 < start) {
-        /* We've wrapped around.  */
-        return -1;
+        return 0;  /* trivial length */
     }
 
-    /* must do before we loose bits in the next step */
-    end = TARGET_PAGE_ALIGN(start + len);
-    start = start & TARGET_PAGE_MASK;
+    last = start + len - 1;
+    if (last < start) {
+        return -1; /* wrap around */
+    }
+
+    while (true) {
+        PageFlagsNode *p = pageflags_find(start, last);
+        int missing;
 
-    for (addr = start, len = end - start;
-         len != 0;
-         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        p = page_find(addr >> TARGET_PAGE_BITS);
         if (!p) {
-            return -1;
+            return -1; /* entire region invalid */
         }
-        if (!(p->flags & PAGE_VALID)) {
-            return -1;
+        if (start < p->itree.start) {
+            return -1; /* initial bytes invalid */
         }
 
-        if ((flags & PAGE_READ) && !(p->flags & PAGE_READ)) {
-            return -1;
+        missing = flags & ~p->flags;
+        if (missing & PAGE_READ) {
+            return -1; /* page not readable */
         }
-        if (flags & PAGE_WRITE) {
+        if (missing & PAGE_WRITE) {
             if (!(p->flags & PAGE_WRITE_ORG)) {
+                return -1; /* page not writable */
+            }
+            /* Asking about writable, but has been protected: undo. */
+            if (!page_unprotect(start, 0)) {
                 return -1;
             }
-            /* unprotect the page if it was put read-only because it
-               contains translated code */
-            if (!(p->flags & PAGE_WRITE)) {
-                if (!page_unprotect(addr, 0)) {
-                    return -1;
-                }
+            /* TODO: page_unprotect should take a range, not a single page. */
+            if (last - start < TARGET_PAGE_SIZE) {
+                return 0; /* ok */
             }
+            start += TARGET_PAGE_SIZE;
+            continue;
         }
+
+        if (last <= p->itree.last) {
+            return 0; /* ok */
+        }
+        start = p->itree.last + 1;
     }
-    return 0;
 }
 
-void page_protect(tb_page_addr_t page_addr)
+void page_protect(tb_page_addr_t address)
 {
-    target_ulong addr;
-    PageDesc *p;
+    PageFlagsNode *p;
+    target_ulong start, last;
     int prot;
 
-    p = page_find(page_addr >> TARGET_PAGE_BITS);
-    if (p && (p->flags & PAGE_WRITE)) {
-        /*
-         * Force the host page as non writable (writes will have a page fault +
-         * mprotect overhead).
-         */
-        page_addr &= qemu_host_page_mask;
-        prot = 0;
-        for (addr = page_addr; addr < page_addr + qemu_host_page_size;
-             addr += TARGET_PAGE_SIZE) {
+    assert_memory_lock();
 
-            p = page_find(addr >> TARGET_PAGE_BITS);
-            if (!p) {
-                continue;
-            }
+    if (qemu_host_page_size <= TARGET_PAGE_SIZE) {
+        start = address & TARGET_PAGE_MASK;
+        last = start + TARGET_PAGE_SIZE - 1;
+    } else {
+        start = address & qemu_host_page_mask;
+        last = start + qemu_host_page_size - 1;
+    }
+
+    p = pageflags_find(start, last);
+    if (!p) {
+        return;
+    }
+    prot = p->flags;
+
+    if (unlikely(p->itree.last < last)) {
+        /* More than one protection region covers the one host page. */
+        assert(TARGET_PAGE_SIZE < qemu_host_page_size);
+        while ((p = pageflags_next(p, start, last)) != NULL) {
             prot |= p->flags;
-            p->flags &= ~PAGE_WRITE;
         }
-        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
-                 (prot & PAGE_BITS) & ~PAGE_WRITE);
+    }
+
+    if (prot & PAGE_WRITE) {
+        pageflags_set_clear(start, last, 0, PAGE_WRITE);
+        mprotect(g2h_untagged(start), qemu_host_page_size,
+                 prot & (PAGE_READ | PAGE_EXEC) ? PROT_READ : PROT_NONE);
     }
 }
 
@@ -417,10 +618,8 @@ void page_protect(tb_page_addr_t page_addr)
  */
 int page_unprotect(target_ulong address, uintptr_t pc)
 {
-    unsigned int prot;
+    PageFlagsNode *p;
     bool current_tb_invalidated;
-    PageDesc *p;
-    target_ulong host_start, host_end, addr;
 
     /*
      * Technically this isn't safe inside a signal handler.  However we
@@ -429,40 +628,54 @@ int page_unprotect(target_ulong address, uintptr_t pc)
      */
     mmap_lock();
 
-    p = page_find(address >> TARGET_PAGE_BITS);
-    if (!p) {
+    p = pageflags_find(address, address);
+
+    /* If this address was not really writable, nothing to do. */
+    if (!p || !(p->flags & PAGE_WRITE_ORG)) {
         mmap_unlock();
         return 0;
     }
 
-    /*
-     * If the page was really writable, then we change its
-     * protection back to writable.
-     */
-    if (p->flags & PAGE_WRITE_ORG) {
-        current_tb_invalidated = false;
-        if (p->flags & PAGE_WRITE) {
-            /*
-             * If the page is actually marked WRITE then assume this is because
-             * this thread raced with another one which got here first and
-             * set the page to PAGE_WRITE and did the TB invalidate for us.
-             */
+    current_tb_invalidated = false;
+    if (p->flags & PAGE_WRITE) {
+        /*
+         * If the page is actually marked WRITE then assume this is because
+         * this thread raced with another one which got here first and
+         * set the page to PAGE_WRITE and did the TB invalidate for us.
+         */
 #ifdef TARGET_HAS_PRECISE_SMC
-            TranslationBlock *current_tb = tcg_tb_lookup(pc);
-            if (current_tb) {
-                current_tb_invalidated = tb_cflags(current_tb) & CF_INVALID;
-            }
+        TranslationBlock *current_tb = tcg_tb_lookup(pc);
+        if (current_tb) {
+            current_tb_invalidated = tb_cflags(current_tb) & CF_INVALID;
+        }
 #endif
+    } else {
+        target_ulong start, len, i;
+        int prot;
+
+        if (qemu_host_page_size <= TARGET_PAGE_SIZE) {
+            start = address & TARGET_PAGE_MASK;
+            len = TARGET_PAGE_SIZE;
+            prot = p->flags | PAGE_WRITE;
+            pageflags_set_clear(start, start + len - 1, PAGE_WRITE, 0);
+            current_tb_invalidated = tb_invalidate_phys_page_unwind(start, pc);
         } else {
-            host_start = address & qemu_host_page_mask;
-            host_end = host_start + qemu_host_page_size;
-
+            start = address & qemu_host_page_mask;
+            len = qemu_host_page_size;
             prot = 0;
-            for (addr = host_start; addr < host_end; addr += TARGET_PAGE_SIZE) {
-                p = page_find(addr >> TARGET_PAGE_BITS);
-                p->flags |= PAGE_WRITE;
-                prot |= p->flags;
 
+            for (i = 0; i < len; i += TARGET_PAGE_SIZE) {
+                target_ulong addr = start + i;
+
+                p = pageflags_find(addr, addr);
+                if (p) {
+                    prot |= p->flags;
+                    if (p->flags & PAGE_WRITE_ORG) {
+                        prot |= PAGE_WRITE;
+                        pageflags_set_clear(addr, addr + TARGET_PAGE_SIZE - 1,
+                                            PAGE_WRITE, 0);
+                    }
+                }
                 /*
                  * Since the content will be modified, we must invalidate
                  * the corresponding translated code.
@@ -470,15 +683,16 @@ int page_unprotect(target_ulong address, uintptr_t pc)
                 current_tb_invalidated |=
                     tb_invalidate_phys_page_unwind(addr, pc);
             }
-            mprotect((void *)g2h_untagged(host_start), qemu_host_page_size,
-                     prot & PAGE_BITS);
         }
-        mmap_unlock();
-        /* If current TB was invalidated return to main loop */
-        return current_tb_invalidated ? 2 : 1;
+        if (prot & PAGE_EXEC) {
+            prot = (prot & ~PAGE_EXEC) | PAGE_READ;
+        }
+        mprotect((void *)g2h_untagged(start), len, prot & PAGE_BITS);
     }
     mmap_unlock();
-    return 0;
+
+    /* If current TB was invalidated return to main loop */
+    return current_tb_invalidated ? 2 : 1;
 }
 
 static int probe_access_internal(CPUArchState *env, target_ulong addr,
diff --git a/tests/tcg/multiarch/test-vma.c b/tests/tcg/multiarch/test-vma.c
new file mode 100644
index 0000000000..2893d60334
--- /dev/null
+++ b/tests/tcg/multiarch/test-vma.c
@@ -0,0 +1,22 @@
+/*
+ * Test very large vma allocations.
+ * The qemu out-of-memory condition was within the mmap syscall itself.
+ * If the syscall actually returns with MAP_FAILED, the test succeeded.
+ */
+#include <sys/mman.h>
+
+int main()
+{
+    int n = sizeof(size_t) == 4 ? 32 : 45;
+
+    for (int i = 28; i < n; i++) {
+        size_t l = (size_t)1 << i;
+        void *p = mmap(0, l, PROT_NONE,
+                       MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
+        if (p == MAP_FAILED) {
+            break;
+        }
+        munmap(p, l);
+    }
+    return 0;
+}
-- 
2.34.1


