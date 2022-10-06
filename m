Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CA15F5F67
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:19:04 +0200 (CEST)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHPb-000091-Q5
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIA-0005CO-Ga
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:22 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHI6-0006vf-L5
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:22 -0400
Received: by mail-pg1-x532.google.com with SMTP id 78so665448pgb.13
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BW3H+5DIKUCdPK57jewRd950NZmPnGc/mycAUjs00JA=;
 b=gst9f/9ODEa16c0t1tGt826O5pKk0LNDDm4QgnlgYPesaAWUPHNKq1La3kUKkp5B+S
 N8AiofqwSkV/G0fRf1tOD6076k6hILxi4G+67lVqx2Cl40ytDg3eZwT3p3NY/BKgbmDD
 oyRA3k4Y7XnOcC8ZT6IxxPByyTrlVSSpkXJ30tfXGL0S8WhDxgbhjZt8eLrJJrxfygGn
 Iei7GuMqmAmWO/PrrZPytIPSg3lN/Ngl0MEH2MIT5lJ3esX3fjMD9g2E84q4GHKZkCNC
 bmXo1ZyN+8oYHlyIzVa8N8W4gSQ4SUjK4F9Qj+5V8RjiHNrpzd5/osNlmBuayqCvpNm3
 tmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BW3H+5DIKUCdPK57jewRd950NZmPnGc/mycAUjs00JA=;
 b=VRhVMG6mZoBP/brveQHvfxsMeZX0KZw8FJXRNd18Tktkp4gjLwxPck7rYj04IrtEAd
 2VcBwvVErd6paQa40r9y1TAPcI6B3NJruZ7NrICJwUOW5c8NQMr0Dh7Y3gNKKjeJBJcZ
 C6yi7oWtwpjh/3E0EmWwYg6nIRNUZu0wJL4yTpjM3HYNDN9v5Qj1fkIbMPKf/qt763Ke
 bzl7jrPiS5bAb4vyPANy7w2ImeZjiQGn+Eg2ydf5ZfIhLocqb/I0pwBwJNhEo2Kmvq73
 7qMk3S4niPvi+LsH01LEymNfpnhZN287o+CXM9X3D4MuzVJs4ojSEH5ErFtwv3P/IWvO
 0hFA==
X-Gm-Message-State: ACrzQf0siHShT2zbzJLBCCCWJTUZe9UNAiwYvJ7gBDTnizQW1GqajX/o
 FAMyJWJli4EEc/ihvCdm8DtojN6+Ystb8Q==
X-Google-Smtp-Source: AMsMyM6glrB3ukOJfiu9JATS+u+zKphDLtChSZ4AKI9ipgHhRHni3CyAkfABzBcBZBBmeZZayGLysg==
X-Received: by 2002:a05:6a00:140d:b0:52a:d561:d991 with SMTP id
 l13-20020a056a00140d00b0052ad561d991mr2974605pfu.46.1665025876736; 
 Wed, 05 Oct 2022 20:11:16 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 01/24] util: Add interval-tree.c
Date: Wed,  5 Oct 2022 20:10:50 -0700
Message-Id: <20221006031113.1139454-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Copy and simplify the Linux kernel's interval_tree_generic.h,
instantiating for uint64_t.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/interval-tree.h    |  99 ++++
 tests/unit/test-interval-tree.c | 209 ++++++++
 util/interval-tree.c            | 881 ++++++++++++++++++++++++++++++++
 tests/unit/meson.build          |   1 +
 util/meson.build                |   1 +
 5 files changed, 1191 insertions(+)
 create mode 100644 include/qemu/interval-tree.h
 create mode 100644 tests/unit/test-interval-tree.c
 create mode 100644 util/interval-tree.c

diff --git a/include/qemu/interval-tree.h b/include/qemu/interval-tree.h
new file mode 100644
index 0000000000..25006debe8
--- /dev/null
+++ b/include/qemu/interval-tree.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Interval trees.
+ *
+ * Derived from include/linux/interval_tree.h and its dependencies.
+ */
+
+#ifndef QEMU_INTERVAL_TREE_H
+#define QEMU_INTERVAL_TREE_H
+
+/*
+ * For now, don't expose Linux Red-Black Trees separately, but retain the
+ * separate type definitions to keep the implementation sane, and allow
+ * the possibility of disentangling them later.
+ */
+typedef struct RBNode
+{
+    /* Encodes parent with color in the lsb. */
+    uintptr_t rb_parent_color;
+    struct RBNode *rb_right;
+    struct RBNode *rb_left;
+} RBNode;
+
+typedef struct RBRoot
+{
+    RBNode *rb_node;
+} RBRoot;
+
+typedef struct RBRootLeftCached {
+    RBRoot rb_root;
+    RBNode *rb_leftmost;
+} RBRootLeftCached;
+
+typedef struct IntervalTreeNode
+{
+    RBNode rb;
+
+    uint64_t start;    /* Start of interval */
+    uint64_t last;     /* Last location _in_ interval */
+    uint64_t subtree_last;
+} IntervalTreeNode;
+
+typedef RBRootLeftCached IntervalTreeRoot;
+
+/**
+ * interval_tree_is_empty
+ * @root: root of the tree.
+ *
+ * Returns true if the tree contains no nodes.
+ */
+static inline bool interval_tree_is_empty(const IntervalTreeRoot *root)
+{
+    return root->rb_root.rb_node == NULL;
+}
+
+/**
+ * interval_tree_insert
+ * @node: node to insert,
+ * @root: root of the tree.
+ *
+ * Insert @node into @root, and rebalance.
+ */
+void interval_tree_insert(IntervalTreeNode *node, IntervalTreeRoot *root);
+
+/**
+ * interval_tree_remove
+ * @node: node to remove,
+ * @root: root of the tree.
+ *
+ * Remove @node from @root, and rebalance.
+ */
+void interval_tree_remove(IntervalTreeNode *node, IntervalTreeRoot *root);
+
+/**
+ * interval_tree_iter_first:
+ * @root: root of the tree,
+ * @start, @last: the inclusive interval [start, last].
+ *
+ * Locate the "first" of a set of nodes within the tree at @root
+ * that overlap the interval, where "first" is sorted by start.
+ * Returns NULL if no overlap found.
+ */
+IntervalTreeNode *interval_tree_iter_first(IntervalTreeRoot *root,
+                                           uint64_t start, uint64_t last);
+
+/**
+ * interval_tree_iter_next:
+ * @node: previous search result
+ * @start, @last: the inclusive interval [start, last].
+ *
+ * Locate the "next" of a set of nodes within the tree that overlap the
+ * interval; @next is the result of a previous call to
+ * interval_tree_iter_{first,next}.  Returns NULL if @next was the last
+ * node in the set.
+ */
+IntervalTreeNode *interval_tree_iter_next(IntervalTreeNode *node,
+                                          uint64_t start, uint64_t last);
+
+#endif /* QEMU_INTERVAL_TREE_H */
diff --git a/tests/unit/test-interval-tree.c b/tests/unit/test-interval-tree.c
new file mode 100644
index 0000000000..119817a019
--- /dev/null
+++ b/tests/unit/test-interval-tree.c
@@ -0,0 +1,209 @@
+/*
+ * Test interval trees
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/interval-tree.h"
+
+static IntervalTreeNode nodes[20];
+static IntervalTreeRoot root;
+
+static void rand_interval(IntervalTreeNode *n, uint64_t start, uint64_t last)
+{
+    gint32 s_ofs, l_ofs, l_max;
+
+    if (last - start > INT32_MAX) {
+        l_max = INT32_MAX;
+    } else {
+        l_max = last - start;
+    }
+    s_ofs = g_test_rand_int_range(0, l_max);
+    l_ofs = g_test_rand_int_range(s_ofs, l_max);
+
+    n->start = start + s_ofs;
+    n->last = start + l_ofs;
+}
+
+static void test_empty(void)
+{
+    g_assert(root.rb_root.rb_node == NULL);
+    g_assert(root.rb_leftmost == NULL);
+    g_assert(interval_tree_iter_first(&root, 0, UINT64_MAX) == NULL);
+}
+
+static void test_find_one_point(void)
+{
+    /* Create a tree of a single node, which is the point [1,1]. */
+    nodes[0].start = 1;
+    nodes[0].last = 1;
+
+    interval_tree_insert(&nodes[0], &root);
+
+    g_assert(interval_tree_iter_first(&root, 0, 9) == &nodes[0]);
+    g_assert(interval_tree_iter_next(&nodes[0], 0, 9) == NULL);
+    g_assert(interval_tree_iter_first(&root, 0, 0) == NULL);
+    g_assert(interval_tree_iter_next(&nodes[0], 0, 0) == NULL);
+    g_assert(interval_tree_iter_first(&root, 0, 1) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 1, 1) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 1, 2) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 2, 2) == NULL);
+
+    interval_tree_remove(&nodes[0], &root);
+    g_assert(root.rb_root.rb_node == NULL);
+    g_assert(root.rb_leftmost == NULL);
+}
+
+static void test_find_two_point(void)
+{
+    IntervalTreeNode *find0, *find1;
+
+    /* Create a tree of a two nodes, which are both the point [1,1]. */
+    nodes[0].start = 1;
+    nodes[0].last = 1;
+    nodes[1] = nodes[0];
+
+    interval_tree_insert(&nodes[0], &root);
+    interval_tree_insert(&nodes[1], &root);
+
+    find0 = interval_tree_iter_first(&root, 0, 9);
+    g_assert(find0 == &nodes[0] || find0 == &nodes[1]);
+
+    find1 = interval_tree_iter_next(find0, 0, 9);
+    g_assert(find1 == &nodes[0] || find1 == &nodes[1]);
+    g_assert(find0 != find1);
+
+    interval_tree_remove(&nodes[1], &root);
+
+    g_assert(interval_tree_iter_first(&root, 0, 9) == &nodes[0]);
+    g_assert(interval_tree_iter_next(&nodes[0], 0, 9) == NULL);
+
+    interval_tree_remove(&nodes[0], &root);
+}
+
+static void test_find_one_range(void)
+{
+    /* Create a tree of a single node, which is the range [1,8]. */
+    nodes[0].start = 1;
+    nodes[0].last = 8;
+
+    interval_tree_insert(&nodes[0], &root);
+
+    g_assert(interval_tree_iter_first(&root, 0, 9) == &nodes[0]);
+    g_assert(interval_tree_iter_next(&nodes[0], 0, 9) == NULL);
+    g_assert(interval_tree_iter_first(&root, 0, 0) == NULL);
+    g_assert(interval_tree_iter_first(&root, 0, 1) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 1, 1) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 4, 6) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 8, 8) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 9, 9) == NULL);
+
+    interval_tree_remove(&nodes[0], &root);
+}
+
+static void test_find_one_range_many(void)
+{
+    int i;
+
+    /*
+     * Create a tree of many nodes in [0,99] and [200,299],
+     * but only one node with exactly [110,190].
+     */
+    nodes[0].start = 110;
+    nodes[0].last = 190;
+
+    for (i = 1; i < ARRAY_SIZE(nodes) / 2; ++i) {
+        rand_interval(&nodes[i], 0, 99);
+    }
+    for (; i < ARRAY_SIZE(nodes); ++i) {
+        rand_interval(&nodes[i], 200, 299);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(nodes); ++i) {
+        interval_tree_insert(&nodes[i], &root);
+    }
+
+    /* Test that we find exactly the one node. */
+    g_assert(interval_tree_iter_first(&root, 100, 199) == &nodes[0]);
+    g_assert(interval_tree_iter_next(&nodes[0], 100, 199) == NULL);
+    g_assert(interval_tree_iter_first(&root, 100, 109) == NULL);
+    g_assert(interval_tree_iter_first(&root, 100, 110) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 111, 120) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 111, 199) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 190, 199) == &nodes[0]);
+    g_assert(interval_tree_iter_first(&root, 192, 199) == NULL);
+
+    /*
+     * Test that if there are multiple matches, we return the one
+     * with the minimal start.
+     */
+    g_assert(interval_tree_iter_first(&root, 100, 300) == &nodes[0]);
+
+    /* Test that we don't find it after it is removed. */
+    interval_tree_remove(&nodes[0], &root);
+    g_assert(interval_tree_iter_first(&root, 100, 199) == NULL);
+
+    for (i = 1; i < ARRAY_SIZE(nodes); ++i) {
+        interval_tree_remove(&nodes[i], &root);
+    }
+}
+
+static void test_find_many_range(void)
+{
+    IntervalTreeNode *find;
+    int i, n;
+
+    n = g_test_rand_int_range(ARRAY_SIZE(nodes) / 3, ARRAY_SIZE(nodes) / 2);
+
+    /*
+     * Create a fair few nodes in [2000,2999], with the others
+     * distributed around.
+     */
+    for (i = 0; i < n; ++i) {
+        rand_interval(&nodes[i], 2000, 2999);
+    }
+    for (; i < ARRAY_SIZE(nodes) * 2 / 3; ++i) {
+        rand_interval(&nodes[i], 1000, 1899);
+    }
+    for (; i < ARRAY_SIZE(nodes); ++i) {
+        rand_interval(&nodes[i], 3100, 3999);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(nodes); ++i) {
+        interval_tree_insert(&nodes[i], &root);
+    }
+
+    /* Test that we find all of the nodes. */
+    find = interval_tree_iter_first(&root, 2000, 2999);
+    for (i = 0; find != NULL; i++) {
+        find = interval_tree_iter_next(find, 2000, 2999);
+    }
+    g_assert_cmpint(i, ==, n);
+
+    g_assert(interval_tree_iter_first(&root,    0,  999) == NULL);
+    g_assert(interval_tree_iter_first(&root, 1900, 1999) == NULL);
+    g_assert(interval_tree_iter_first(&root, 3000, 3099) == NULL);
+    g_assert(interval_tree_iter_first(&root, 4000, UINT64_MAX) == NULL);
+
+    for (i = 0; i < ARRAY_SIZE(nodes); ++i) {
+        interval_tree_remove(&nodes[i], &root);
+    }
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    g_test_add_func("/interval-tree/empty", test_empty);
+    g_test_add_func("/interval-tree/find-one-point", test_find_one_point);
+    g_test_add_func("/interval-tree/find-two-point", test_find_two_point);
+    g_test_add_func("/interval-tree/find-one-range", test_find_one_range);
+    g_test_add_func("/interval-tree/find-one-range-many",
+                    test_find_one_range_many);
+    g_test_add_func("/interval-tree/find-many-range", test_find_many_range);
+
+    return g_test_run();
+}
diff --git a/util/interval-tree.c b/util/interval-tree.c
new file mode 100644
index 0000000000..9578c05830
--- /dev/null
+++ b/util/interval-tree.c
@@ -0,0 +1,881 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "qemu/osdep.h"
+#include "qemu/interval-tree.h"
+#include "qemu/atomic.h"
+
+/*
+ * Red Black Trees.
+ *
+ * For now, don't expose Linux Red-Black Trees separately, but retain the
+ * separate type definitions to keep the implementation sane, and allow
+ * the possibility of separating them later.
+ *
+ * Derived from include/linux/rbtree_augmented.h and its dependencies.
+ */
+
+/*
+ * red-black trees properties:  https://en.wikipedia.org/wiki/Rbtree
+ *
+ *  1) A node is either red or black
+ *  2) The root is black
+ *  3) All leaves (NULL) are black
+ *  4) Both children of every red node are black
+ *  5) Every simple path from root to leaves contains the same number
+ *     of black nodes.
+ *
+ *  4 and 5 give the O(log n) guarantee, since 4 implies you cannot have two
+ *  consecutive red nodes in a path and every red node is therefore followed by
+ *  a black. So if B is the number of black nodes on every simple path (as per
+ *  5), then the longest possible path due to 4 is 2B.
+ *
+ *  We shall indicate color with case, where black nodes are uppercase and red
+ *  nodes will be lowercase. Unknown color nodes shall be drawn as red within
+ *  parentheses and have some accompanying text comment.
+ *
+ * Notes on lockless lookups:
+ *
+ * All stores to the tree structure (rb_left and rb_right) must be done using
+ * WRITE_ONCE [qatomic_set for QEMU]. And we must not inadvertently cause
+ * (temporary) loops in the tree structure as seen in program order.
+ *
+ * These two requirements will allow lockless iteration of the tree -- not
+ * correct iteration mind you, tree rotations are not atomic so a lookup might
+ * miss entire subtrees.
+ *
+ * But they do guarantee that any such traversal will only see valid elements
+ * and that it will indeed complete -- does not get stuck in a loop.
+ *
+ * It also guarantees that if the lookup returns an element it is the 'correct'
+ * one. But not returning an element does _NOT_ mean it's not present.
+ *
+ * NOTE:
+ *
+ * Stores to __rb_parent_color are not important for simple lookups so those
+ * are left undone as of now. Nor did I check for loops involving parent
+ * pointers.
+ */
+
+typedef enum RBColor
+{
+    RB_RED,
+    RB_BLACK,
+} RBColor;
+
+typedef struct RBAugmentCallbacks {
+    void (*propagate)(RBNode *node, RBNode *stop);
+    void (*copy)(RBNode *old, RBNode *new);
+    void (*rotate)(RBNode *old, RBNode *new);
+} RBAugmentCallbacks;
+
+static inline RBNode *rb_parent(const RBNode *n)
+{
+    return (RBNode *)(n->rb_parent_color & ~1);
+}
+
+static inline RBNode *rb_red_parent(const RBNode *n)
+{
+    return (RBNode *)n->rb_parent_color;
+}
+
+static inline RBColor pc_color(uintptr_t pc)
+{
+    return (RBColor)(pc & 1);
+}
+
+static inline bool pc_is_red(uintptr_t pc)
+{
+    return pc_color(pc) == RB_RED;
+}
+
+static inline bool pc_is_black(uintptr_t pc)
+{
+    return !pc_is_red(pc);
+}
+
+static inline RBColor rb_color(const RBNode *n)
+{
+    return pc_color(n->rb_parent_color);
+}
+
+static inline bool rb_is_red(const RBNode *n)
+{
+    return pc_is_red(n->rb_parent_color);
+}
+
+static inline bool rb_is_black(const RBNode *n)
+{
+    return pc_is_black(n->rb_parent_color);
+}
+
+static inline void rb_set_black(RBNode *n)
+{
+    n->rb_parent_color |= RB_BLACK;
+}
+
+static inline void rb_set_parent_color(RBNode *n, RBNode *p, RBColor color)
+{
+    n->rb_parent_color = (uintptr_t)p | color;
+}
+
+static inline void rb_set_parent(RBNode *n, RBNode *p)
+{
+    rb_set_parent_color(n, p, rb_color(n));
+}
+
+static inline void rb_link_node(RBNode *node, RBNode *parent, RBNode **rb_link)
+{
+    node->rb_parent_color = (uintptr_t)parent;
+    node->rb_left = node->rb_right = NULL;
+
+    qatomic_set(rb_link, node);
+}
+
+static RBNode *rb_next(RBNode *node)
+{
+    RBNode *parent;
+
+    /* OMIT: if empty node, return null. */
+
+    /*
+     * If we have a right-hand child, go down and then left as far as we can.
+     */
+    if (node->rb_right) {
+        node = node->rb_right;
+        while (node->rb_left) {
+            node = node->rb_left;
+        }
+        return node;
+    }
+
+    /*
+     * No right-hand children. Everything down and left is smaller than us,
+     * so any 'next' node must be in the general direction of our parent.
+     * Go up the tree; any time the ancestor is a right-hand child of its
+     * parent, keep going up. First time it's a left-hand child of its
+     * parent, said parent is our 'next' node.
+     */
+    while ((parent = rb_parent(node)) && node == parent->rb_right) {
+        node = parent;
+    }
+
+    return parent;
+}
+
+static inline void rb_change_child(RBNode *old, RBNode *new,
+                                   RBNode *parent, RBRoot *root)
+{
+    if (!parent) {
+        qatomic_set(&root->rb_node, new);
+    } else if (parent->rb_left == old) {
+        qatomic_set(&parent->rb_left, new);
+    } else {
+        qatomic_set(&parent->rb_right, new);
+    }
+}
+
+static inline void rb_rotate_set_parents(RBNode *old, RBNode *new,
+                                         RBRoot *root, RBColor color)
+{
+    RBNode *parent = rb_parent(old);
+
+    new->rb_parent_color = old->rb_parent_color;
+    rb_set_parent_color(old, new, color);
+    rb_change_child(old, new, parent, root);
+}
+
+static void rb_insert_augmented(RBNode *node, RBRoot *root,
+                                const RBAugmentCallbacks *augment)
+{
+    RBNode *parent = rb_red_parent(node), *gparent, *tmp;
+
+    while (true) {
+        /*
+         * Loop invariant: node is red.
+         */
+        if (unlikely(!parent)) {
+            /*
+             * The inserted node is root. Either this is the first node, or
+             * we recursed at Case 1 below and are no longer violating 4).
+             */
+            rb_set_parent_color(node, NULL, RB_BLACK);
+            break;
+        }
+
+        /*
+         * If there is a black parent, we are done.  Otherwise, take some
+         * corrective action as, per 4), we don't want a red root or two
+         * consecutive red nodes.
+         */
+        if (rb_is_black(parent)) {
+            break;
+        }
+
+        gparent = rb_red_parent(parent);
+
+        tmp = gparent->rb_right;
+        if (parent != tmp) {    /* parent == gparent->rb_left */
+            if (tmp && rb_is_red(tmp)) {
+                /*
+                 * Case 1 - node's uncle is red (color flips).
+                 *
+                 *       G            g
+                 *      / \          / \
+                 *     p   u  -->   P   U
+                 *    /            /
+                 *   n            n
+                 *
+                 * However, since g's parent might be red, and 4) does not
+                 * allow this, we need to recurse at g.
+                 */
+                rb_set_parent_color(tmp, gparent, RB_BLACK);
+                rb_set_parent_color(parent, gparent, RB_BLACK);
+                node = gparent;
+                parent = rb_parent(node);
+                rb_set_parent_color(node, parent, RB_RED);
+                continue;
+            }
+
+            tmp = parent->rb_right;
+            if (node == tmp) {
+                /*
+                 * Case 2 - node's uncle is black and node is
+                 * the parent's right child (left rotate at parent).
+                 *
+                 *      G             G
+                 *     / \           / \
+                 *    p   U  -->    n   U
+                 *     \           /
+                 *      n         p
+                 *
+                 * This still leaves us in violation of 4), the
+                 * continuation into Case 3 will fix that.
+                 */
+                tmp = node->rb_left;
+                qatomic_set(&parent->rb_right, tmp);
+                qatomic_set(&node->rb_left, parent);
+                if (tmp) {
+                    rb_set_parent_color(tmp, parent, RB_BLACK);
+                }
+                rb_set_parent_color(parent, node, RB_RED);
+                augment->rotate(parent, node);
+                parent = node;
+                tmp = node->rb_right;
+            }
+
+            /*
+             * Case 3 - node's uncle is black and node is
+             * the parent's left child (right rotate at gparent).
+             *
+             *        G           P
+             *       / \         / \
+             *      p   U  -->  n   g
+             *     /                 \
+             *    n                   U
+             */
+            qatomic_set(&gparent->rb_left, tmp); /* == parent->rb_right */
+            qatomic_set(&parent->rb_right, gparent);
+            if (tmp) {
+                rb_set_parent_color(tmp, gparent, RB_BLACK);
+            }
+            rb_rotate_set_parents(gparent, parent, root, RB_RED);
+            augment->rotate(gparent, parent);
+            break;
+        } else {
+            tmp = gparent->rb_left;
+            if (tmp && rb_is_red(tmp)) {
+                /* Case 1 - color flips */
+                rb_set_parent_color(tmp, gparent, RB_BLACK);
+                rb_set_parent_color(parent, gparent, RB_BLACK);
+                node = gparent;
+                parent = rb_parent(node);
+                rb_set_parent_color(node, parent, RB_RED);
+                continue;
+            }
+
+            tmp = parent->rb_left;
+            if (node == tmp) {
+                /* Case 2 - right rotate at parent */
+                tmp = node->rb_right;
+                qatomic_set(&parent->rb_left, tmp);
+                qatomic_set(&node->rb_right, parent);
+                if (tmp) {
+                    rb_set_parent_color(tmp, parent, RB_BLACK);
+                }
+                rb_set_parent_color(parent, node, RB_RED);
+                augment->rotate(parent, node);
+                parent = node;
+                tmp = node->rb_left;
+            }
+
+            /* Case 3 - left rotate at gparent */
+            qatomic_set(&gparent->rb_right, tmp); /* == parent->rb_left */
+            qatomic_set(&parent->rb_left, gparent);
+            if (tmp) {
+                rb_set_parent_color(tmp, gparent, RB_BLACK);
+            }
+            rb_rotate_set_parents(gparent, parent, root, RB_RED);
+            augment->rotate(gparent, parent);
+            break;
+        }
+    }
+}
+
+static void rb_insert_augmented_cached(RBNode *node,
+                                       RBRootLeftCached *root, bool newleft,
+                                       const RBAugmentCallbacks *augment)
+{
+    if (newleft) {
+        root->rb_leftmost = node;
+    }
+    rb_insert_augmented(node, &root->rb_root, augment);
+}
+
+static void rb_erase_color(RBNode *parent, RBRoot *root,
+                           const RBAugmentCallbacks *augment)
+{
+    RBNode *node = NULL, *sibling, *tmp1, *tmp2;
+
+    while (true) {
+        /*
+         * Loop invariants:
+         * - node is black (or NULL on first iteration)
+         * - node is not the root (parent is not NULL)
+         * - All leaf paths going through parent and node have a
+         *   black node count that is 1 lower than other leaf paths.
+         */
+        sibling = parent->rb_right;
+        if (node != sibling) {  /* node == parent->rb_left */
+            if (rb_is_red(sibling)) {
+                /*
+                 * Case 1 - left rotate at parent
+                 *
+                 *     P               S
+                 *    / \             / \ 
+                 *   N   s    -->    p   Sr
+                 *      / \         / \ 
+                 *     Sl  Sr      N   Sl
+                 */
+                tmp1 = sibling->rb_left;
+                qatomic_set(&parent->rb_right, tmp1);
+                qatomic_set(&sibling->rb_left, parent);
+                rb_set_parent_color(tmp1, parent, RB_BLACK);
+                rb_rotate_set_parents(parent, sibling, root, RB_RED);
+                augment->rotate(parent, sibling);
+                sibling = tmp1;
+            }
+            tmp1 = sibling->rb_right;
+            if (!tmp1 || rb_is_black(tmp1)) {
+                tmp2 = sibling->rb_left;
+                if (!tmp2 || rb_is_black(tmp2)) {
+                    /*
+                     * Case 2 - sibling color flip
+                     * (p could be either color here)
+                     *
+                     *    (p)           (p)
+                     *    / \           / \ 
+                     *   N   S    -->  N   s
+                     *      / \           / \ 
+                     *     Sl  Sr        Sl  Sr
+                     *
+                     * This leaves us violating 5) which
+                     * can be fixed by flipping p to black
+                     * if it was red, or by recursing at p.
+                     * p is red when coming from Case 1.
+                     */
+                    rb_set_parent_color(sibling, parent, RB_RED);
+                    if (rb_is_red(parent)) {
+                        rb_set_black(parent);
+                    } else {
+                        node = parent;
+                        parent = rb_parent(node);
+                        if (parent) {
+                            continue;
+                        }
+                    }
+                    break;
+                }
+                /*
+                 * Case 3 - right rotate at sibling
+                 * (p could be either color here)
+                 *
+                 *   (p)           (p)
+                 *   / \           / \
+                 *  N   S    -->  N   sl
+                 *     / \             \
+                 *    sl  Sr            S
+                 *                       \
+                 *                        Sr
+                 *
+                 * Note: p might be red, and then bot
+                 * p and sl are red after rotation (which
+                 * breaks property 4). This is fixed in
+                 * Case 4 (in rb_rotate_set_parents()
+                 *         which set sl the color of p
+                 *         and set p RB_BLACK)
+                 *
+                 *   (p)            (sl)
+                 *   / \            /  \
+                 *  N   sl   -->   P    S
+                 *       \        /      \
+                 *        S      N        Sr
+                 *         \
+                 *          Sr
+                 */
+                tmp1 = tmp2->rb_right;
+                qatomic_set(&sibling->rb_left, tmp1);
+                qatomic_set(&tmp2->rb_right, sibling);
+                qatomic_set(&parent->rb_right, tmp2);
+                if (tmp1) {
+                    rb_set_parent_color(tmp1, sibling, RB_BLACK);
+                }
+                augment->rotate(sibling, tmp2);
+                tmp1 = sibling;
+                sibling = tmp2;
+            }
+            /*
+             * Case 4 - left rotate at parent + color flips
+             * (p and sl could be either color here.
+             *  After rotation, p becomes black, s acquires
+             *  p's color, and sl keeps its color)
+             *
+             *      (p)             (s)
+             *      / \             / \
+             *     N   S     -->   P   Sr
+             *        / \         / \
+             *      (sl) sr      N  (sl)
+             */
+            tmp2 = sibling->rb_left;
+            qatomic_set(&parent->rb_right, tmp2);
+            qatomic_set(&sibling->rb_left, parent);
+            rb_set_parent_color(tmp1, sibling, RB_BLACK);
+            if (tmp2) {
+                rb_set_parent(tmp2, parent);
+            }
+            rb_rotate_set_parents(parent, sibling, root, RB_BLACK);
+            augment->rotate(parent, sibling);
+            break;
+        } else {
+            sibling = parent->rb_left;
+            if (rb_is_red(sibling)) {
+                /* Case 1 - right rotate at parent */
+                tmp1 = sibling->rb_right;
+                qatomic_set(&parent->rb_left, tmp1);
+                qatomic_set(&sibling->rb_right, parent);
+                rb_set_parent_color(tmp1, parent, RB_BLACK);
+                rb_rotate_set_parents(parent, sibling, root, RB_RED);
+                augment->rotate(parent, sibling);
+                sibling = tmp1;
+            }
+            tmp1 = sibling->rb_left;
+            if (!tmp1 || rb_is_black(tmp1)) {
+                tmp2 = sibling->rb_right;
+                if (!tmp2 || rb_is_black(tmp2)) {
+                    /* Case 2 - sibling color flip */
+                    rb_set_parent_color(sibling, parent, RB_RED);
+                    if (rb_is_red(parent)) {
+                        rb_set_black(parent);
+                    } else {
+                        node = parent;
+                        parent = rb_parent(node);
+                        if (parent) {
+                            continue;
+                        }
+                    }
+                    break;
+                }
+                /* Case 3 - left rotate at sibling */
+                tmp1 = tmp2->rb_left;
+                qatomic_set(&sibling->rb_right, tmp1);
+                qatomic_set(&tmp2->rb_left, sibling);
+                qatomic_set(&parent->rb_left, tmp2);
+                if (tmp1) {
+                    rb_set_parent_color(tmp1, sibling, RB_BLACK);
+                }
+                augment->rotate(sibling, tmp2);
+                tmp1 = sibling;
+                sibling = tmp2;
+            }
+            /* Case 4 - right rotate at parent + color flips */
+            tmp2 = sibling->rb_right;
+            qatomic_set(&parent->rb_left, tmp2);
+            qatomic_set(&sibling->rb_right, parent);
+            rb_set_parent_color(tmp1, sibling, RB_BLACK);
+            if (tmp2) {
+                rb_set_parent(tmp2, parent);
+            }
+            rb_rotate_set_parents(parent, sibling, root, RB_BLACK);
+            augment->rotate(parent, sibling);
+            break;
+        }
+    }
+}
+
+static void rb_erase_augmented(RBNode *node, RBRoot *root,
+                               const RBAugmentCallbacks *augment)
+{
+    RBNode *child = node->rb_right;
+    RBNode *tmp = node->rb_left;
+    RBNode *parent, *rebalance;
+    uintptr_t pc;
+
+    if (!tmp) {
+        /*
+         * Case 1: node to erase has no more than 1 child (easy!)
+         *
+         * Note that if there is one child it must be red due to 5)
+         * and node must be black due to 4). We adjust colors locally
+         * so as to bypass rb_erase_color() later on.
+         */
+        pc = node->rb_parent_color;
+        parent = rb_parent(node);
+        rb_change_child(node, child, parent, root);
+        if (child) {
+            child->rb_parent_color = pc;
+            rebalance = NULL;
+        } else {
+            rebalance = pc_is_black(pc) ? parent : NULL;
+        }
+        tmp = parent;
+    } else if (!child) {
+        /* Still case 1, but this time the child is node->rb_left */
+        pc = node->rb_parent_color;
+        parent = rb_parent(node);
+        tmp->rb_parent_color = pc;
+        rb_change_child(node, tmp, parent, root);
+        rebalance = NULL;
+        tmp = parent;
+    } else {
+        RBNode *successor = child, *child2;
+        tmp = child->rb_left;
+        if (!tmp) {
+            /*
+             * Case 2: node's successor is its right child
+             *
+             *    (n)          (s)
+             *    / \          / \
+             *  (x) (s)  ->  (x) (c)
+             *        \
+             *        (c)
+             */
+            parent = successor;
+            child2 = successor->rb_right;
+
+            augment->copy(node, successor);
+        } else {
+            /*
+             * Case 3: node's successor is leftmost under
+             * node's right child subtree
+             *
+             *    (n)          (s)
+             *    / \          / \
+             *  (x) (y)  ->  (x) (y)
+             *      /            /
+             *    (p)          (p)
+             *    /            /
+             *  (s)          (c)
+             *    \
+             *    (c)
+             */
+            do {
+                parent = successor;
+                successor = tmp;
+                tmp = tmp->rb_left;
+            } while (tmp);
+            child2 = successor->rb_right;
+            qatomic_set(&parent->rb_left, child2);
+            qatomic_set(&successor->rb_right, child);
+            rb_set_parent(child, successor);
+
+            augment->copy(node, successor);
+            augment->propagate(parent, successor);
+        }
+
+        tmp = node->rb_left;
+        qatomic_set(&successor->rb_left, tmp);
+        rb_set_parent(tmp, successor);
+
+        pc = node->rb_parent_color;
+        tmp = rb_parent(node);
+        rb_change_child(node, successor, tmp, root);
+
+        if (child2) {
+            rb_set_parent_color(child2, parent, RB_BLACK);
+            rebalance = NULL;
+        } else {
+            rebalance = rb_is_black(successor) ? parent : NULL;
+        }
+        successor->rb_parent_color = pc;
+        tmp = successor;
+    }
+
+    augment->propagate(tmp, NULL);
+
+    if (rebalance) {
+        rb_erase_color(rebalance, root, augment);
+    }
+}
+
+static void rb_erase_augmented_cached(RBNode *node, RBRootLeftCached *root,
+                                      const RBAugmentCallbacks *augment)
+{
+    if (root->rb_leftmost == node) {
+        root->rb_leftmost = rb_next(node);
+    }
+    rb_erase_augmented(node, &root->rb_root, augment);
+}
+
+
+/*
+ * Interval trees.
+ *
+ * Derived from lib/interval_tree.c and its dependencies,
+ * especially include/linux/interval_tree_generic.h.
+ */
+
+#define rb_to_itree(N)  container_of(N, IntervalTreeNode, rb)
+
+static bool interval_tree_compute_max(IntervalTreeNode *node, bool exit)
+{
+    IntervalTreeNode *child;
+    uint64_t max = node->last;
+
+    if (node->rb.rb_left) {
+        child = rb_to_itree(node->rb.rb_left);
+        if (child->subtree_last > max) {
+            max = child->subtree_last;
+        }
+    }
+    if (node->rb.rb_right) {
+        child = rb_to_itree(node->rb.rb_right);
+        if (child->subtree_last > max) {
+            max = child->subtree_last;
+        }
+    }
+    if (exit && node->subtree_last == max) {
+        return true;
+    }
+    node->subtree_last = max;
+    return false;
+}
+
+static void interval_tree_propagate(RBNode *rb, RBNode *stop)
+{
+    while (rb != stop) {
+        IntervalTreeNode *node = rb_to_itree(rb);
+        if (interval_tree_compute_max(node, true)) {
+            break;
+        }
+        rb = rb_parent(&node->rb);
+    }
+}
+
+static void interval_tree_copy(RBNode *rb_old, RBNode *rb_new)
+{
+    IntervalTreeNode *old = rb_to_itree(rb_old);
+    IntervalTreeNode *new = rb_to_itree(rb_new);
+
+    new->subtree_last = old->subtree_last;
+}
+
+static void interval_tree_rotate(RBNode *rb_old, RBNode *rb_new)
+{
+    IntervalTreeNode *old = rb_to_itree(rb_old);
+    IntervalTreeNode *new = rb_to_itree(rb_new);
+
+    new->subtree_last = old->subtree_last;
+    interval_tree_compute_max(old, false);
+}
+
+static const RBAugmentCallbacks interval_tree_augment = {
+    .propagate = interval_tree_propagate,
+    .copy = interval_tree_copy,
+    .rotate = interval_tree_rotate,
+};
+
+/* Insert / remove interval nodes from the tree */
+void interval_tree_insert(IntervalTreeNode *node, IntervalTreeRoot *root)
+{
+    RBNode **link = &root->rb_root.rb_node, *rb_parent = NULL;
+    uint64_t start = node->start, last = node->last;
+    IntervalTreeNode *parent;
+    bool leftmost = true;
+
+    while (*link) {
+        rb_parent = *link;
+        parent = rb_to_itree(rb_parent);
+
+        if (parent->subtree_last < last) {
+            parent->subtree_last = last;
+        }
+        if (start < parent->start) {
+            link = &parent->rb.rb_left;
+        } else {
+            link = &parent->rb.rb_right;
+            leftmost = false;
+        }
+    }
+
+    node->subtree_last = last;
+    rb_link_node(&node->rb, rb_parent, link);
+    rb_insert_augmented_cached(&node->rb, root, leftmost,
+                               &interval_tree_augment);
+}
+
+void interval_tree_remove(IntervalTreeNode *node, IntervalTreeRoot *root)
+{
+    rb_erase_augmented_cached(&node->rb, root, &interval_tree_augment);
+}
+
+/*
+ * Iterate over intervals intersecting [start;last]
+ *
+ * Note that a node's interval intersects [start;last] iff:
+ *   Cond1: node->start <= last
+ * and
+ *   Cond2: start <= node->last
+ */
+
+static IntervalTreeNode *interval_tree_subtree_search(IntervalTreeNode *node,
+                                                      uint64_t start,
+                                                      uint64_t last)
+{
+    while (true) {
+        /*
+         * Loop invariant: start <= node->subtree_last
+         * (Cond2 is satisfied by one of the subtree nodes)
+         */
+        if (node->rb.rb_left) {
+            IntervalTreeNode *left = rb_to_itree(node->rb.rb_left);
+
+            if (start <= left->subtree_last) {
+                /*
+                 * Some nodes in left subtree satisfy Cond2.
+                 * Iterate to find the leftmost such node N.
+                 * If it also satisfies Cond1, that's the
+                 * match we are looking for. Otherwise, there
+                 * is no matching interval as nodes to the
+                 * right of N can't satisfy Cond1 either.
+                 */
+                node = left;
+                continue;
+            }
+        }
+        if (node->start <= last) {         /* Cond1 */
+            if (start <= node->last) {     /* Cond2 */
+                return node; /* node is leftmost match */
+            }
+            if (node->rb.rb_right) {
+                node = rb_to_itree(node->rb.rb_right);
+                if (start <= node->subtree_last) {
+                    continue;
+                }
+            }
+        }
+        return NULL; /* no match */
+    }
+}
+
+IntervalTreeNode *interval_tree_iter_first(IntervalTreeRoot *root,
+                                           uint64_t start, uint64_t last)
+{
+    IntervalTreeNode *node, *leftmost;
+
+    if (!root->rb_root.rb_node) {
+        return NULL;
+    }
+
+    /*
+     * Fastpath range intersection/overlap between A: [a0, a1] and
+     * B: [b0, b1] is given by:
+     *
+     *         a0 <= b1 && b0 <= a1
+     *
+     *  ... where A holds the lock range and B holds the smallest
+     * 'start' and largest 'last' in the tree. For the later, we
+     * rely on the root node, which by augmented interval tree
+     * property, holds the largest value in its last-in-subtree.
+     * This allows mitigating some of the tree walk overhead for
+     * for non-intersecting ranges, maintained and consulted in O(1).
+     */
+    node = rb_to_itree(root->rb_root.rb_node);
+    if (node->subtree_last < start) {
+        return NULL;
+    }
+
+    leftmost = rb_to_itree(root->rb_leftmost);
+    if (leftmost->start > last) {
+        return NULL;
+    }
+
+    return interval_tree_subtree_search(node, start, last);
+}
+
+IntervalTreeNode *interval_tree_iter_next(IntervalTreeNode *node,
+                                          uint64_t start, uint64_t last)
+{
+    RBNode *rb = node->rb.rb_right, *prev;
+
+    while (true) {
+        /*
+         * Loop invariants:
+         *   Cond1: node->start <= last
+         *   rb == node->rb.rb_right
+         *
+         * First, search right subtree if suitable
+         */
+        if (rb) {
+            IntervalTreeNode *right = rb_to_itree(rb);
+
+            if (start <= right->subtree_last) {
+                return interval_tree_subtree_search(right, start, last);
+            }
+        }
+
+        /* Move up the tree until we come from a node's left child */
+        do {
+            rb = rb_parent(&node->rb);
+            if (!rb) {
+                return NULL;
+            }
+            prev = &node->rb;
+            node = rb_to_itree(rb);
+            rb = node->rb.rb_right;
+        } while (prev == rb);
+
+        /* Check if the node intersects [start;last] */
+        if (last < node->start) {  /* !Cond1 */
+            return NULL;
+        }
+        if (start <= node->last) { /* Cond2 */
+            return node;
+        }
+    }
+}
+
+#if 1
+static void debug_interval_tree_int(IntervalTreeNode *node,
+                                    const char *dir, int level)
+{
+    printf("%4d %*s %s [%" PRId64 ",%" PRId64 "] subtree_last:%" PRId64 "\n",
+           level, level + 1, dir, rb_is_red(&node->rb) ? "r" : "b",
+           node->start, node->last, node->subtree_last);
+
+    if (node->rb.rb_left) {
+        debug_interval_tree_int(rb_to_itree(node->rb.rb_left), "<", level + 1);
+    }
+    if (node->rb.rb_right) {
+        debug_interval_tree_int(rb_to_itree(node->rb.rb_right), ">", level + 1);
+    }
+}
+
+void debug_interval_tree(IntervalTreeNode *node);
+void debug_interval_tree(IntervalTreeNode *node)
+{
+    if (node) {
+        debug_interval_tree_int(node, "*", 0);
+    } else {
+        printf("null\n");
+    }
+}
+#endif
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index b497a41378..ffa444f432 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -47,6 +47,7 @@ tests = {
   'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
   'test-qapi-util': [],
   'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
+  'test-interval-tree': [],
 }
 
 if have_system or have_tools
diff --git a/util/meson.build b/util/meson.build
index 5e282130df..46a0d017a6 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -55,6 +55,7 @@ util_ss.add(files('guest-random.c'))
 util_ss.add(files('yank.c'))
 util_ss.add(files('int128.c'))
 util_ss.add(files('memalign.c'))
+util_ss.add(files('interval-tree.c'))
 
 if have_user
   util_ss.add(files('selfmap.c'))
-- 
2.34.1


