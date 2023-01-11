Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999A66528D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 04:58:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFSDx-0006vk-LQ; Tue, 10 Jan 2023 22:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFSDt-0006vE-9J
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 22:56:21 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFSDp-0003wO-1A
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 22:56:20 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id o17so9912692qvn.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 19:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2yIM+Uemj2qVl27NxfgmDNwsg+DoDS5Uynu8goLNqpc=;
 b=0QNkKcjiAPP+lIMoIign82OurRMWhXUq6YSWgMSnEBY5dBQkjUr49csJs+9ubVqLBt
 tALmIwSZeVU4ABtIUyezUqA2L3B2d3idxyBPQjRPQxlkcC8d/w72tCeUJ6X74CmEqoVY
 dBkK+s4SH0xvnwNCudnjqXgPc45l3+kWxFbe8kekAiq7fJSXHhvWbMA90R3FvNT6rQ0L
 c1WjBygEGPAzKFzwIpWBMHU09PhwMkPekDRpKs1+FAf3DMEMN2A4r4WX+2aVCFiDouZX
 9TC/9TjfDD5dNIwPHCSyQRgG3QsD3WZxnwy9TVnyHHJIX+2RXX/4ptcgRU0wuImaOI3E
 c/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2yIM+Uemj2qVl27NxfgmDNwsg+DoDS5Uynu8goLNqpc=;
 b=pat5PzXv7mOMyNOBNn9c6YTwHgEWcnv+8OB/Nu3DatC4HcDrHYbeF91Fjd7dcZQ3Yt
 0sgx829YnydDHvzgX59pOrMNqAovUwOQCpCXhmUf/kcCizEHtOBqQRiYjGxRu6rrOOyC
 ixiGPJO+xsnUt0B81ZU/+djjxTPGNDuB5j7ohqGkNgtTeLAAATMs/Jcbr7ugZjd6aO82
 EwCt1drFUv7skc5bokfHa31fB1WtI/7glqSosh6nHy0ywn3o7KKOlbNcFnR5Rir1d8V/
 /HCs2pUMcZXBkpCKMvnXa49/8MCnlqqG8+dUxIXcfzsGi0OfF18c+/aNGcIF2H260kGl
 RGag==
X-Gm-Message-State: AFqh2kqslWV/wNUo8LcGbgaxPr8+cdAwab7jO1BhuDNyDfyNCeZot6gB
 a1G6xsg4wR5LL8Oq+QgvOfUUbTAwApzRot+hE5c=
X-Google-Smtp-Source: AMrXdXvPUPUJZNPcubqzNY5HEJBxe8h2XKMIEM9b54iem/JksK61ND8i+5qzZGgrwvmCyRgv8YYndw==
X-Received: by 2002:a05:6214:5e07:b0:500:8c65:c221 with SMTP id
 li7-20020a0562145e0700b005008c65c221mr99146756qvb.26.1673409374294; 
 Tue, 10 Jan 2023 19:56:14 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 br31-20020a05620a461f00b006fa2cc1b0fbsm8286621qkb.11.2023.01.10.19.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 19:56:13 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH 1/2] util: import GTree as QTree
Date: Tue, 10 Jan 2023 22:55:35 -0500
Message-Id: <20230111035536.309885-2-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111035536.309885-1-cota@braap.org>
References: <20230111035536.309885-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=cota@braap.org; helo=mail-qv1-xf2a.google.com
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

The only reason to add this tree is to control the memory allocator
used. Some users (e.g. TCG) cannot work reliably in multi-threaded
environments (e.g. forking in user-mode) with GTree's allocator, GSlice.
See https://gitlab.com/qemu-project/qemu/-/issues/285 for details.

Importing GTree is a temporary workaround until GTree migrates away
from GSlice.

This implementation is identical to that in glib v2.75.0.
I've imported tests from glib and added a benchmark just to
make sure that performance is similar (Note: it cannot be identical
because we are not using GSlice).

$ taskset -c 2 tests/bench/qtree-bench

- With libc's allocator:

 Tree         Op      32            1024            4096          131072         1048576
------------------------------------------------------------------------------------------------
GTree     Lookup   14.01           15.17           24.93           18.99           15.28
QTree     Lookup   22.50 (1.61x)   32.49 (2.14x)   29.84 (1.20x)   16.77 (0.88x)   12.21 (0.80x)
GTree     Insert   19.24           15.72           25.24           17.87           16.55
QTree     Insert   15.07 (0.78x)   26.70 (1.70x)   25.68 (1.02x)   17.20 (0.96x)   12.49 (0.75x)
GTree     Remove   11.57           31.44           29.77           20.88           16.60
QTree     Remove   14.01 (1.21x)   34.54 (1.10x)   33.52 (1.13x)   26.64 (1.28x)   14.95 (0.90x)
GTree  RemoveAll   57.97          119.13          118.16          112.82           61.63
QTree  RemoveAll   46.31 (0.80x)  108.04 (0.91x)  113.85 (0.96x)   77.88 (0.69x)   41.69 (0.68x)
GTree   Traverse   72.56          232.83          243.20          254.22           97.44
QTree   Traverse   66.53 (0.92x)  394.76 (1.70x)  357.07 (1.47x)  289.09 (1.14x)   45.64 (0.47x)
------------------------------------------------------------------------------------------------

- With tcmalloc:

 Tree         Op      32            1024            4096          131072         1048576
------------------------------------------------------------------------------------------------
GTree     Lookup   24.56           27.69           25.78           17.14           15.90
QTree     Lookup   40.92 (1.67x)   34.04 (1.23x)   30.15 (1.17x)   22.93 (1.34x)   20.31 (1.28x)
GTree     Insert   33.97           28.22           25.66           17.37           16.07
QTree     Insert   34.01 (1.00x)   36.35 (1.29x)   32.29 (1.26x)   22.32 (1.28x)   17.62 (1.10x)
GTree     Remove   20.61           32.42           30.80           16.96           15.93
QTree     Remove   20.61 (1.00x)   43.60 (1.35x)   41.71 (1.35x)   25.04 (1.48x)   16.33 (1.03x)
GTree  RemoveAll  106.31          125.72          126.49           70.89           54.60
QTree  RemoveAll   83.99 (0.79x)  207.75 (1.65x)  206.17 (1.63x)   53.35 (0.75x)   46.38 (0.85x)
GTree   Traverse  128.00          243.93          255.20          140.39           90.94
QTree   Traverse  110.34 (0.86x)  325.49 (1.33x)  376.82 (1.48x)  118.22 (0.84x)   62.25 (0.68x)
------------------------------------------------------------------------------------------------

Signed-off-by: Emilio Cota <cota@braap.org>
---
 include/qemu/qtree.h      |  119 +++
 tests/bench/meson.build   |    4 +
 tests/bench/qtree-bench.c |  273 ++++++
 tests/unit/meson.build    |    1 +
 tests/unit/test-qtree.c   |  701 +++++++++++++++
 util/meson.build          |    1 +
 util/qtree.c              | 1776 +++++++++++++++++++++++++++++++++++++
 7 files changed, 2875 insertions(+)
 create mode 100644 include/qemu/qtree.h
 create mode 100644 tests/bench/qtree-bench.c
 create mode 100644 tests/unit/test-qtree.c
 create mode 100644 util/qtree.c

diff --git a/include/qemu/qtree.h b/include/qemu/qtree.h
new file mode 100644
index 0000000000..4679457758
--- /dev/null
+++ b/include/qemu/qtree.h
@@ -0,0 +1,119 @@
+/*
+ * GLIB - Library of useful routines for C programming
+ * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
+ * file for a list of people on the GLib Team.  See the ChangeLog
+ * files for a list of changes.  These files are distributed with
+ * GLib at ftp://ftp.gtk.org/pub/gtk/.
+ */
+
+#ifndef QEMU_QTREE_H
+#define QEMU_QTREE_H
+
+typedef struct _QTree  QTree;
+
+typedef struct _QTreeNode QTreeNode;
+
+typedef gboolean (*QTraverseNodeFunc)(QTreeNode *node,
+                                      gpointer user_data);
+
+/*
+ * Balanced binary trees
+ */
+QTree *q_tree_new(GCompareFunc key_compare_func);
+QTree *q_tree_new_with_data(GCompareDataFunc key_compare_func,
+                            gpointer key_compare_data);
+QTree *q_tree_new_full(GCompareDataFunc key_compare_func,
+                       gpointer key_compare_data,
+                       GDestroyNotify key_destroy_func,
+                       GDestroyNotify value_destroy_func);
+QTreeNode *q_tree_node_first(QTree *tree);
+
+QTreeNode *q_tree_node_last(QTree *tree);
+
+QTreeNode *q_tree_node_previous(QTreeNode *node);
+
+QTreeNode *q_tree_node_next(QTreeNode *node);
+
+QTree *q_tree_ref(QTree *tree);
+
+void q_tree_unref(QTree *tree);
+
+void q_tree_destroy(QTree *tree);
+
+QTreeNode *q_tree_insert_node(QTree *tree,
+                              gpointer key,
+                              gpointer value);
+
+void q_tree_insert(QTree *tree,
+                   gpointer key,
+                   gpointer value);
+
+QTreeNode *q_tree_replace_node(QTree *tree,
+                               gpointer key,
+                               gpointer value);
+
+void q_tree_replace(QTree *tree,
+                    gpointer key,
+                    gpointer value);
+gboolean q_tree_remove(QTree *tree,
+                       gconstpointer key);
+
+void q_tree_remove_all(QTree *tree);
+
+gboolean q_tree_steal(QTree *tree,
+                      gconstpointer key);
+gpointer q_tree_node_key(QTreeNode *node);
+gpointer q_tree_node_value(QTreeNode *node);
+QTreeNode *q_tree_lookup_node(QTree *tree,
+                              gconstpointer key);
+gpointer q_tree_lookup(QTree *tree,
+                       gconstpointer key);
+gboolean q_tree_lookup_extended(QTree *tree,
+                                gconstpointer lookup_key,
+                                gpointer *orig_key,
+                                gpointer *value);
+void q_tree_foreach(QTree *tree,
+                    GTraverseFunc func,
+                    gpointer user_data);
+void q_tree_foreach_node(QTree *tree,
+                         QTraverseNodeFunc func,
+                         gpointer user_data);
+
+void q_tree_traverse(QTree *tree,
+                     GTraverseFunc traverse_func,
+                     GTraverseType traverse_type,
+                     gpointer user_data);
+
+QTreeNode *q_tree_search_node(QTree *tree,
+                              GCompareFunc search_func,
+                              gconstpointer user_data);
+gpointer q_tree_search(QTree *tree,
+                       GCompareFunc search_func,
+                       gconstpointer user_data);
+QTreeNode *q_tree_lower_bound(QTree *tree,
+                              gconstpointer key);
+QTreeNode *q_tree_upper_bound(QTree *tree,
+                              gconstpointer key);
+gint q_tree_height(QTree *tree);
+gint q_tree_nnodes(QTree *tree);
+
+#endif /* QEMU_QTREE_H */
diff --git a/tests/bench/meson.build b/tests/bench/meson.build
index 279a8fcc33..3c799dbd98 100644
--- a/tests/bench/meson.build
+++ b/tests/bench/meson.build
@@ -3,6 +3,10 @@ qht_bench = executable('qht-bench',
                        sources: 'qht-bench.c',
                        dependencies: [qemuutil])
 
+qtree_bench = executable('qtree-bench',
+                         sources: 'qtree-bench.c',
+                         dependencies: [qemuutil])
+
 executable('atomic_add-bench',
            sources: files('atomic_add-bench.c'),
            dependencies: [qemuutil],
diff --git a/tests/bench/qtree-bench.c b/tests/bench/qtree-bench.c
new file mode 100644
index 0000000000..9cfaf8820e
--- /dev/null
+++ b/tests/bench/qtree-bench.c
@@ -0,0 +1,273 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include "qemu/osdep.h"
+#include "qemu/qtree.h"
+#include "qemu/timer.h"
+
+enum tree_op {
+    OP_LOOKUP,
+    OP_INSERT,
+    OP_REMOVE,
+    OP_REMOVE_ALL,
+    OP_TRAVERSE,
+};
+
+struct benchmark {
+    const char * const name;
+    enum tree_op op;
+    bool fill_on_init;
+};
+
+enum impl_type {
+    IMPL_GTREE,
+    IMPL_QTREE,
+};
+
+struct tree_implementation {
+    const char * const name;
+    enum impl_type type;
+};
+
+static const struct benchmark benchmarks[] = {
+    {
+        .name = "Lookup",
+        .op = OP_LOOKUP,
+        .fill_on_init = true,
+    },
+    {
+        .name = "Insert",
+        .op = OP_INSERT,
+        .fill_on_init = false,
+    },
+    {
+        .name = "Remove",
+        .op = OP_REMOVE,
+        .fill_on_init = true,
+    },
+    {
+        .name = "RemoveAll",
+        .op = OP_REMOVE_ALL,
+        .fill_on_init = true,
+    },
+    {
+        .name = "Traverse",
+        .op = OP_TRAVERSE,
+        .fill_on_init = true,
+    },
+};
+
+static const struct tree_implementation impls[] = {
+    {
+        .name = "GTree",
+        .type = IMPL_GTREE,
+    },
+    {
+        .name = "QTree",
+        .type = IMPL_QTREE,
+    },
+};
+
+static int compare_func(const void *ap, const void *bp)
+{
+    const size_t *a = ap;
+    const size_t *b = bp;
+
+    return *a - *b;
+}
+
+static void init_empty_tree_and_keys(enum impl_type impl,
+                                     void **ret_tree, size_t **ret_keys,
+                                     size_t n_elems)
+{
+    size_t *keys = g_malloc_n(n_elems, sizeof(*keys));
+    for (size_t i = 0; i < n_elems; i++) {
+        keys[i] = i;
+    }
+
+    void *tree;
+    switch (impl) {
+    case IMPL_GTREE:
+        tree = g_tree_new(compare_func);
+        break;
+    case IMPL_QTREE:
+        tree = q_tree_new(compare_func);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    *ret_tree = tree;
+    *ret_keys = keys;
+}
+
+static gboolean traverse_func(gpointer key, gpointer value, gpointer data)
+{
+    return FALSE;
+}
+
+static inline void remove_all(void *tree, enum impl_type impl)
+{
+    switch (impl) {
+    case IMPL_GTREE:
+        g_tree_destroy(tree);
+        break;
+    case IMPL_QTREE:
+        q_tree_destroy(tree);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static double run_benchmark(const struct benchmark *bench,
+                            enum impl_type impl,
+                            size_t n_elems)
+{
+    void *tree;
+    size_t *keys;
+
+    init_empty_tree_and_keys(impl, &tree, &keys, n_elems);
+    if (bench->fill_on_init) {
+        for (size_t i = 0; i < n_elems; i++) {
+            switch (impl) {
+            case IMPL_GTREE:
+                g_tree_insert(tree, &keys[i], &keys[i]);
+                break;
+            case IMPL_QTREE:
+                q_tree_insert(tree, &keys[i], &keys[i]);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+        }
+    }
+
+    int64_t start_ns = get_clock();
+    switch (bench->op) {
+    case OP_LOOKUP:
+        for (size_t i = 0; i < n_elems; i++) {
+            void *value;
+            switch (impl) {
+            case IMPL_GTREE:
+                value = g_tree_lookup(tree, &keys[i]);
+                break;
+            case IMPL_QTREE:
+                value = q_tree_lookup(tree, &keys[i]);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            (void)value;
+        }
+        break;
+    case OP_INSERT:
+        for (size_t i = 0; i < n_elems; i++) {
+            switch (impl) {
+            case IMPL_GTREE:
+                g_tree_insert(tree, &keys[i], &keys[i]);
+                break;
+            case IMPL_QTREE:
+                q_tree_insert(tree, &keys[i], &keys[i]);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+        }
+        break;
+    case OP_REMOVE:
+        for (size_t i = 0; i < n_elems; i++) {
+            switch (impl) {
+            case IMPL_GTREE:
+                g_tree_remove(tree, &keys[i]);
+                break;
+            case IMPL_QTREE:
+                q_tree_remove(tree, &keys[i]);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+        }
+        break;
+    case OP_REMOVE_ALL:
+        remove_all(tree, impl);
+        break;
+    case OP_TRAVERSE:
+        switch (impl) {
+        case IMPL_GTREE:
+            g_tree_foreach(tree, traverse_func, NULL);
+            break;
+        case IMPL_QTREE:
+            q_tree_foreach(tree, traverse_func, NULL);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    int64_t ns = get_clock() - start_ns;
+
+    if (bench->op != OP_REMOVE_ALL) {
+        remove_all(tree, impl);
+    }
+    g_free(keys);
+
+    return (double)n_elems / ns * 1e3;
+}
+
+int main(int argc, char *argv[])
+{
+    size_t sizes[] = {
+        32,
+        1024,
+        1024 * 4,
+        1024 * 128,
+        1024 * 1024,
+    };
+
+    double res[ARRAY_SIZE(benchmarks)][ARRAY_SIZE(impls)][ARRAY_SIZE(sizes)];
+    for (int i = 0; i < ARRAY_SIZE(sizes); i++) {
+        size_t size = sizes[i];
+        for (int j = 0; j < ARRAY_SIZE(impls); j++) {
+            const struct tree_implementation *impl = &impls[j];
+            for (int k = 0; k < ARRAY_SIZE(benchmarks); k++) {
+                const struct benchmark *bench = &benchmarks[k];
+                res[k][j][i] = run_benchmark(bench, impl->type, size);
+            }
+        }
+    }
+
+    printf("# Results' breakdown: Tree, Op and #Elements. Units: Mops/s\n");
+    printf("%5s %10s ", "Tree", "Op");
+    for (int i = 0; i < ARRAY_SIZE(sizes); i++) {
+        printf("%7zu         ", sizes[i]);
+    }
+    printf("\n");
+    char separator[97];
+    for (int i = 0; i < ARRAY_SIZE(separator) - 1; i++) {
+        separator[i] = '-';
+    }
+    separator[ARRAY_SIZE(separator) - 1] = '\0';
+    printf("%s\n", separator);
+    for (int i = 0; i < ARRAY_SIZE(benchmarks); i++) {
+        for (int j = 0; j < ARRAY_SIZE(impls); j++) {
+            printf("%5s %10s ", impls[j].name, benchmarks[i].name);
+            for (int k = 0; k < ARRAY_SIZE(sizes); k++) {
+                printf("%7.2f ", res[i][j][k]);
+                if (j == 0) {
+                    printf("        ");
+                } else {
+                    if (res[i][0][k] != 0) {
+                        double speedup = res[i][j][k] / res[i][0][k];
+                        printf("(%4.2fx) ", speedup);
+                    } else {
+                        printf("(     ) ");
+                    }
+                }
+            }
+            printf("\n");
+        }
+    }
+    printf("%s\n", separator);
+    return 0;
+}
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index ffa444f432..a723ab757e 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -35,6 +35,7 @@ tests = {
   'test-rcu-slist': [],
   'test-qdist': [],
   'test-qht': [],
+  'test-qtree': [],
   'test-bitops': [],
   'test-bitcnt': [],
   'test-qgraph': ['../qtest/libqos/qgraph.c'],
diff --git a/tests/unit/test-qtree.c b/tests/unit/test-qtree.c
new file mode 100644
index 0000000000..0f12236298
--- /dev/null
+++ b/tests/unit/test-qtree.c
@@ -0,0 +1,701 @@
+/*
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ *
+ * Tests for QTree.
+ * Original source: glib
+ *   https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/tests/tree.c
+ *   LGPL license.
+ *   Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/qtree.h"
+
+static gint my_compare(gconstpointer a, gconstpointer b)
+{
+    const char *cha = a;
+    const char *chb = b;
+
+    return *cha - *chb;
+}
+
+static gint my_compare_with_data(gconstpointer a,
+                                 gconstpointer b,
+                                 gpointer user_data)
+{
+    const char *cha = a;
+    const char *chb = b;
+
+    /* just check that we got the right data */
+    g_assert(GPOINTER_TO_INT(user_data) == 123);
+
+    return *cha - *chb;
+}
+
+static gint my_search(gconstpointer a, gconstpointer b)
+{
+    return my_compare(b, a);
+}
+
+static gpointer destroyed_key;
+static gpointer destroyed_value;
+static guint destroyed_key_count;
+static guint destroyed_value_count;
+
+static void my_key_destroy(gpointer key)
+{
+    destroyed_key = key;
+    destroyed_key_count++;
+}
+
+static void my_value_destroy(gpointer value)
+{
+    destroyed_value = value;
+    destroyed_value_count++;
+}
+
+static gint my_traverse(gpointer key, gpointer value, gpointer data)
+{
+    char *ch = key;
+
+    g_assert((*ch) > 0);
+
+    if (*ch == 'd') {
+        return TRUE;
+    }
+
+    return FALSE;
+}
+
+char chars[] =
+    "0123456789"
+    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
+    "abcdefghijklmnopqrstuvwxyz";
+
+char chars2[] =
+    "0123456789"
+    "abcdefghijklmnopqrstuvwxyz";
+
+static gint
+check_order(gpointer key,
+            gpointer value,
+            gpointer data)
+{
+    char **p = data;
+    char *ch = key;
+
+    g_assert(**p == *ch);
+
+    (*p)++;
+
+    return FALSE;
+}
+
+static void
+test_tree_search(void)
+{
+    gint i;
+    QTree *tree;
+    gboolean removed;
+    gchar c;
+    gchar *p, *d;
+
+    tree = q_tree_new_with_data(my_compare_with_data, GINT_TO_POINTER(123));
+
+    for (i = 0; chars[i]; i++) {
+        q_tree_insert(tree, &chars[i], &chars[i]);
+    }
+
+    q_tree_foreach(tree, my_traverse, NULL);
+
+    g_assert(q_tree_nnodes(tree) == strlen(chars));
+    g_assert(q_tree_height(tree) == 6);
+
+    p = chars;
+    q_tree_foreach(tree, check_order, &p);
+
+    for (i = 0; i < 26; i++) {
+        removed = q_tree_remove(tree, &chars[i + 10]);
+        g_assert(removed);
+    }
+
+    c = '\0';
+    removed = q_tree_remove(tree, &c);
+    g_assert(!removed);
+
+    q_tree_foreach(tree, my_traverse, NULL);
+
+    g_assert(q_tree_nnodes(tree) == strlen(chars2));
+    g_assert(q_tree_height(tree) == 6);
+
+    p = chars2;
+    q_tree_foreach(tree, check_order, &p);
+
+    for (i = 25; i >= 0; i--) {
+        q_tree_insert(tree, &chars[i + 10], &chars[i + 10]);
+    }
+
+    p = chars;
+    q_tree_foreach(tree, check_order, &p);
+
+    c = '0';
+    p = q_tree_lookup(tree, &c);
+    g_assert(p && *p == c);
+    g_assert(q_tree_lookup_extended(tree, &c, (gpointer *)&d, (gpointer *)&p));
+    g_assert(c == *d && c == *p);
+
+    c = 'A';
+    p = q_tree_lookup(tree, &c);
+    g_assert(p && *p == c);
+
+    c = 'a';
+    p = q_tree_lookup(tree, &c);
+    g_assert(p && *p == c);
+
+    c = 'z';
+    p = q_tree_lookup(tree, &c);
+    g_assert(p && *p == c);
+
+    c = '!';
+    p = q_tree_lookup(tree, &c);
+    g_assert(p == NULL);
+
+    c = '=';
+    p = q_tree_lookup(tree, &c);
+    g_assert(p == NULL);
+
+    c = '|';
+    p = q_tree_lookup(tree, &c);
+    g_assert(p == NULL);
+
+    c = '0';
+    p = q_tree_search(tree, my_search, &c);
+    g_assert(p && *p == c);
+
+    c = 'A';
+    p = q_tree_search(tree, my_search, &c);
+    g_assert(p && *p == c);
+
+    c = 'a';
+    p = q_tree_search(tree, my_search, &c);
+    g_assert(p && *p == c);
+
+    c = 'z';
+    p = q_tree_search(tree, my_search, &c);
+    g_assert(p && *p == c);
+
+    c = '!';
+    p = q_tree_search(tree, my_search, &c);
+    g_assert(p == NULL);
+
+    c = '=';
+    p = q_tree_search(tree, my_search, &c);
+    g_assert(p == NULL);
+
+    c = '|';
+    p = q_tree_search(tree, my_search, &c);
+    g_assert(p == NULL);
+
+    q_tree_destroy(tree);
+}
+
+static void
+test_tree_remove(void)
+{
+    QTree *tree;
+    char c, d;
+    gint i;
+    gboolean removed;
+
+    tree = q_tree_new_full((GCompareDataFunc)my_compare, NULL,
+                           my_key_destroy,
+                           my_value_destroy);
+
+    for (i = 0; chars[i]; i++) {
+        q_tree_insert(tree, &chars[i], &chars[i]);
+    }
+
+    c = '0';
+    q_tree_insert(tree, &c, &c);
+    g_assert(destroyed_key == &c);
+    g_assert(destroyed_value == &chars[0]);
+    destroyed_key = NULL;
+    destroyed_value = NULL;
+
+    d = '1';
+    q_tree_replace(tree, &d, &d);
+    g_assert(destroyed_key == &chars[1]);
+    g_assert(destroyed_value == &chars[1]);
+    destroyed_key = NULL;
+    destroyed_value = NULL;
+
+    c = '2';
+    removed = q_tree_remove(tree, &c);
+    g_assert(removed);
+    g_assert(destroyed_key == &chars[2]);
+    g_assert(destroyed_value == &chars[2]);
+    destroyed_key = NULL;
+    destroyed_value = NULL;
+
+    c = '3';
+    removed = q_tree_steal(tree, &c);
+    g_assert(removed);
+    g_assert(destroyed_key == NULL);
+    g_assert(destroyed_value == NULL);
+
+    const gchar *remove = "omkjigfedba";
+    for (i = 0; remove[i]; i++) {
+        removed = q_tree_remove(tree, &remove[i]);
+        g_assert(removed);
+    }
+
+    q_tree_destroy(tree);
+}
+
+static void
+test_tree_remove_all(void)
+{
+    QTree *tree;
+    gsize i;
+
+    tree = q_tree_new_full((GCompareDataFunc)my_compare, NULL,
+                           my_key_destroy,
+                           my_value_destroy);
+
+    for (i = 0; chars[i]; i++) {
+        q_tree_insert(tree, &chars[i], &chars[i]);
+    }
+
+    destroyed_key_count = 0;
+    destroyed_value_count = 0;
+
+    q_tree_remove_all(tree);
+
+    g_assert(destroyed_key_count == strlen(chars));
+    g_assert(destroyed_value_count == strlen(chars));
+    g_assert(q_tree_height(tree) == 0);
+    g_assert(q_tree_nnodes(tree) == 0);
+
+    q_tree_unref(tree);
+}
+
+static void
+test_tree_destroy(void)
+{
+    QTree *tree;
+    gint i;
+
+    tree = q_tree_new(my_compare);
+
+    for (i = 0; chars[i]; i++) {
+        q_tree_insert(tree, &chars[i], &chars[i]);
+    }
+
+    g_assert(q_tree_nnodes(tree) == strlen(chars));
+
+    g_test_message("nnodes: %d", q_tree_nnodes(tree));
+    q_tree_ref(tree);
+    q_tree_destroy(tree);
+
+    g_test_message("nnodes: %d", q_tree_nnodes(tree));
+    g_assert(q_tree_nnodes(tree) == 0);
+
+    q_tree_unref(tree);
+}
+
+typedef struct {
+    GString *s;
+    gint count;
+} CallbackData;
+
+static gboolean
+traverse_func(gpointer key, gpointer value, gpointer data)
+{
+    CallbackData *d = data;
+
+    gchar *c = value;
+    g_string_append_c(d->s, *c);
+
+    d->count--;
+
+    if (d->count == 0) {
+        return TRUE;
+    }
+
+    return FALSE;
+}
+
+typedef struct {
+    GTraverseType  traverse;
+    gint           limit;
+    const gchar   *expected;
+} TraverseData;
+
+static void
+test_tree_traverse(void)
+{
+    QTree *tree;
+    gsize i;
+    TraverseData orders[] = {
+        { G_IN_ORDER,   -1,
+          "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" },
+        { G_IN_ORDER,    1, "0" },
+        { G_IN_ORDER,    2, "01" },
+        { G_IN_ORDER,    3, "012" },
+        { G_IN_ORDER,    4, "0123" },
+        { G_IN_ORDER,    5, "01234" },
+        { G_IN_ORDER,    6, "012345" },
+        { G_IN_ORDER,    7, "0123456" },
+        { G_IN_ORDER,    8, "01234567" },
+        { G_IN_ORDER,    9, "012345678" },
+        { G_IN_ORDER,   10, "0123456789" },
+        { G_IN_ORDER,   11, "0123456789A" },
+        { G_IN_ORDER,   12, "0123456789AB" },
+        { G_IN_ORDER,   13, "0123456789ABC" },
+        { G_IN_ORDER,   14, "0123456789ABCD" },
+
+        { G_PRE_ORDER,  -1,
+          "VF73102546B98ADCENJHGILKMRPOQTSUldZXWYbachfegjiktpnmorqsxvuwyz" },
+        { G_PRE_ORDER,   1, "V" },
+        { G_PRE_ORDER,   2, "VF" },
+        { G_PRE_ORDER,   3, "VF7" },
+        { G_PRE_ORDER,   4, "VF73" },
+        { G_PRE_ORDER,   5, "VF731" },
+        { G_PRE_ORDER,   6, "VF7310" },
+        { G_PRE_ORDER,   7, "VF73102" },
+        { G_PRE_ORDER,   8, "VF731025" },
+        { G_PRE_ORDER,   9, "VF7310254" },
+        { G_PRE_ORDER,  10, "VF73102546" },
+        { G_PRE_ORDER,  11, "VF73102546B" },
+        { G_PRE_ORDER,  12, "VF73102546B9" },
+        { G_PRE_ORDER,  13, "VF73102546B98" },
+        { G_PRE_ORDER,  14, "VF73102546B98A" },
+
+        { G_POST_ORDER, -1,
+          "02146538A9CEDB7GIHKMLJOQPSUTRNFWYXacbZegfikjhdmonqsrpuwvzyxtlV" },
+        { G_POST_ORDER,  1, "0" },
+        { G_POST_ORDER,  2, "02" },
+        { G_POST_ORDER,  3, "021" },
+        { G_POST_ORDER,  4, "0214" },
+        { G_POST_ORDER,  5, "02146" },
+        { G_POST_ORDER,  6, "021465" },
+        { G_POST_ORDER,  7, "0214653" },
+        { G_POST_ORDER,  8, "02146538" },
+        { G_POST_ORDER,  9, "02146538A" },
+        { G_POST_ORDER, 10, "02146538A9" },
+        { G_POST_ORDER, 11, "02146538A9C" },
+        { G_POST_ORDER, 12, "02146538A9CE" },
+        { G_POST_ORDER, 13, "02146538A9CED" },
+        { G_POST_ORDER, 14, "02146538A9CEDB" }
+    };
+    CallbackData data;
+
+    tree = q_tree_new(my_compare);
+
+    for (i = 0; chars[i]; i++) {
+        q_tree_insert(tree, &chars[i], &chars[i]);
+    }
+
+    data.s = g_string_new("");
+    for (i = 0; i < G_N_ELEMENTS(orders); i++) {
+        g_string_set_size(data.s, 0);
+        data.count = orders[i].limit;
+        q_tree_traverse(tree, traverse_func, orders[i].traverse, &data);
+        g_assert(!strcmp(data.s->str, orders[i].expected));
+    }
+
+    q_tree_unref(tree);
+    g_string_free(data.s, TRUE);
+}
+
+static void
+test_tree_insert(void)
+{
+    QTree *tree;
+    gchar *p;
+    gint i;
+    gchar *scrambled;
+
+    tree = q_tree_new(my_compare);
+
+    for (i = 0; chars[i]; i++) {
+        q_tree_insert(tree, &chars[i], &chars[i]);
+    }
+    p = chars;
+    q_tree_foreach(tree, check_order, &p);
+
+    q_tree_unref(tree);
+    tree = q_tree_new(my_compare);
+
+    for (i = strlen(chars) - 1; i >= 0; i--) {
+        q_tree_insert(tree, &chars[i], &chars[i]);
+    }
+    p = chars;
+    q_tree_foreach(tree, check_order, &p);
+
+    q_tree_unref(tree);
+    tree = q_tree_new(my_compare);
+
+    scrambled = g_strdup(chars);
+
+    for (i = 0; i < 30; i++) {
+        gchar tmp;
+        gint a, b;
+
+        a = g_random_int_range(0, strlen(scrambled));
+        b = g_random_int_range(0, strlen(scrambled));
+        tmp = scrambled[a];
+        scrambled[a] = scrambled[b];
+        scrambled[b] = tmp;
+    }
+
+    for (i = 0; scrambled[i]; i++) {
+        q_tree_insert(tree, &scrambled[i], &scrambled[i]);
+    }
+    p = chars;
+    q_tree_foreach(tree, check_order, &p);
+
+    g_free(scrambled);
+    q_tree_unref(tree);
+}
+
+static void
+binary_tree_bound(QTree *tree,
+                  char   c,
+                  char   expected,
+                  int    lower)
+{
+    QTreeNode *node;
+
+    if (lower) {
+        node = q_tree_lower_bound(tree, &c);
+    } else {
+        node = q_tree_upper_bound(tree, &c);
+    }
+
+    if (g_test_verbose()) {
+        g_test_message("%c %s: ", c, lower ? "lower" : "upper");
+    }
+
+    if (!node) {
+        if (!q_tree_nnodes(tree)) {
+            if (g_test_verbose()) {
+                g_test_message("empty tree");
+            }
+        } else {
+            QTreeNode *last = q_tree_node_last(tree);
+
+            g_assert(last);
+            if (g_test_verbose())
+                g_test_message("past end last %c",
+                               *(char *) q_tree_node_key(last));
+        }
+        g_assert(expected == '\x00');
+    } else {
+        QTreeNode *begin = q_tree_node_first(tree);
+        QTreeNode *last = q_tree_node_last(tree);
+        QTreeNode *prev = q_tree_node_previous(node);
+        QTreeNode *next = q_tree_node_next(node);
+
+        g_assert(expected != '\x00');
+        g_assert(expected == *(char *) q_tree_node_key(node));
+
+        if (g_test_verbose()) {
+            g_test_message("%c", *(char *) q_tree_node_key(node));
+        }
+
+        if (node != begin) {
+            g_assert(prev);
+            if (g_test_verbose()) {
+                g_test_message(" prev %c", *(char *) q_tree_node_key(prev));
+            }
+        } else {
+            g_assert(!prev);
+            if (g_test_verbose()) {
+                g_test_message(" no prev, it's the first one");
+            }
+        }
+
+        if (node != last) {
+            g_assert(next);
+            if (g_test_verbose()) {
+                g_test_message(" next %c", *(char *) q_tree_node_key(next));
+            }
+        } else {
+            g_assert(!next);
+            if (g_test_verbose()) {
+                g_test_message(" no next, it's the last one");
+            }
+        }
+    }
+
+    if (g_test_verbose()) {
+        g_test_message(" ");
+    }
+}
+
+static void
+binary_tree_bounds(QTree *tree,
+                   char   c,
+                   int    mode)
+{
+    char expectedl, expectedu;
+    char first = mode == 0 ? '0' : mode == 1 ? 'A' : 'z';
+
+    g_assert(mode >= 0 && mode <= 3);
+
+    if (c < first) {
+        expectedl = first;
+    } else if (c > 'z') {
+        expectedl = '\x00';
+    } else {
+        expectedl = c;
+    }
+
+    if (c < first) {
+        expectedu = first;
+    } else if (c >= 'z') {
+        expectedu = '\x00';
+    } else {
+        expectedu = c == '9' ? 'A' : c == 'Z' ? 'a' : c + 1;
+    }
+
+    if (mode == 3) {
+        expectedl = '\x00';
+        expectedu = '\x00';
+    }
+
+    binary_tree_bound(tree, c, expectedl, 1);
+    binary_tree_bound(tree, c, expectedu, 0);
+}
+
+static void
+binary_tree_bounds_test(QTree *tree,
+                        int    mode)
+{
+    binary_tree_bounds(tree, 'a', mode);
+    binary_tree_bounds(tree, 'A', mode);
+    binary_tree_bounds(tree, 'z', mode);
+    binary_tree_bounds(tree, 'Z', mode);
+    binary_tree_bounds(tree, 'Y', mode);
+    binary_tree_bounds(tree, '0', mode);
+    binary_tree_bounds(tree, '9', mode);
+    binary_tree_bounds(tree, '0' - 1, mode);
+    binary_tree_bounds(tree, 'z' + 1, mode);
+    binary_tree_bounds(tree, '0' - 2, mode);
+    binary_tree_bounds(tree, 'z' + 2, mode);
+}
+
+static void
+test_tree_bounds(void)
+{
+    GQueue queue = G_QUEUE_INIT;
+    QTree *tree;
+    char chars[62];
+    guint i, j;
+
+    tree = q_tree_new(my_compare);
+
+    i = 0;
+    for (j = 0; j < 10; j++, i++) {
+        chars[i] = '0' + j;
+        g_queue_push_tail(&queue, &chars[i]);
+    }
+
+    for (j = 0; j < 26; j++, i++) {
+        chars[i] = 'A' + j;
+        g_queue_push_tail(&queue, &chars[i]);
+    }
+
+    for (j = 0; j < 26; j++, i++) {
+        chars[i] = 'a' + j;
+        g_queue_push_tail(&queue, &chars[i]);
+    }
+
+    if (g_test_verbose()) {
+        g_test_message("tree insert: ");
+    }
+
+    while (!g_queue_is_empty(&queue)) {
+        gint32 which = g_random_int_range(0, g_queue_get_length(&queue));
+        gpointer elem = g_queue_pop_nth(&queue, which);
+        QTreeNode *node;
+
+        if (g_test_verbose()) {
+            g_test_message("%c ", *(char *) elem);
+        }
+
+        node = q_tree_insert_node(tree, elem, elem);
+        g_assert(q_tree_node_key(node) == elem);
+        g_assert(q_tree_node_value(node) == elem);
+    }
+
+    if (g_test_verbose()) {
+        g_test_message(" ");
+    }
+
+    g_assert(q_tree_nnodes(tree) == 10 + 26 + 26);
+    g_assert(q_tree_height(tree) >= 6);
+    g_assert(q_tree_height(tree) <= 8);
+
+    if (g_test_verbose()) {
+        g_test_message("tree: ");
+        q_tree_foreach(tree, my_traverse, NULL);
+        g_test_message(" ");
+    }
+
+    binary_tree_bounds_test(tree, 0);
+
+    for (i = 0; i < 10; i++) {
+        q_tree_remove(tree, &chars[i]);
+    }
+
+    g_assert(q_tree_nnodes(tree) == 26 + 26);
+    g_assert(q_tree_height(tree) >= 6);
+    g_assert(q_tree_height(tree) <= 8);
+
+    if (g_test_verbose()) {
+        g_test_message("tree: ");
+        q_tree_foreach(tree, my_traverse, NULL);
+        g_test_message(" ");
+    }
+
+    binary_tree_bounds_test(tree, 1);
+
+    for (i = 10; i < 10 + 26 + 26 - 1; i++) {
+        q_tree_remove(tree, &chars[i]);
+    }
+
+    if (g_test_verbose()) {
+        g_test_message("tree: ");
+        q_tree_foreach(tree, my_traverse, NULL);
+        g_test_message(" ");
+    }
+
+    binary_tree_bounds_test(tree, 2);
+
+    q_tree_remove(tree, &chars[10 + 26 + 26 - 1]);
+
+    if (g_test_verbose()) {
+        g_test_message("empty tree");
+    }
+
+    binary_tree_bounds_test(tree, 3);
+
+    q_tree_unref(tree);
+}
+
+int main(int argc, char *argv[])
+{
+    g_test_init(&argc, &argv, NULL);
+
+    g_test_add_func("/qtree/search", test_tree_search);
+    g_test_add_func("/qtree/remove", test_tree_remove);
+    g_test_add_func("/qtree/destroy", test_tree_destroy);
+    g_test_add_func("/qtree/traverse", test_tree_traverse);
+    g_test_add_func("/qtree/insert", test_tree_insert);
+    g_test_add_func("/qtree/bounds", test_tree_bounds);
+    g_test_add_func("/qtree/remove-all", test_tree_remove_all);
+
+    return g_test_run();
+}
diff --git a/util/meson.build b/util/meson.build
index d8d109ff84..3c6f159d8a 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -26,6 +26,7 @@ util_ss.add(when: 'CONFIG_WIN32', if_true: files('oslib-win32.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: files('qemu-thread-win32.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: winmm)
 util_ss.add(when: 'CONFIG_WIN32', if_true: pathcch)
+util_ss.add(files('qtree.c'))
 util_ss.add(files('envlist.c', 'path.c', 'module.c'))
 util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
diff --git a/util/qtree.c b/util/qtree.c
new file mode 100644
index 0000000000..b35c68ae10
--- /dev/null
+++ b/util/qtree.c
@@ -0,0 +1,1776 @@
+/*
+ * GLIB - Library of useful routines for C programming
+ * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
+ * file for a list of people on the GLib Team.  See the ChangeLog
+ * files for a list of changes.  These files are distributed with
+ * GLib at ftp://ftp.gtk.org/pub/gtk/.
+ */
+
+/*
+ * MT safe
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/qtree.h"
+
+/**
+ * SECTION:trees-binary
+ * @title: Balanced Binary Trees
+ * @short_description: a sorted collection of key/value pairs optimized
+ *                     for searching and traversing in order
+ *
+ * The #QTree structure and its associated functions provide a sorted
+ * collection of key/value pairs optimized for searching and traversing
+ * in order. This means that most of the operations  (access, search,
+ * insertion, deletion, ...) on #QTree are O(log(n)) in average and O(n)
+ * in worst case for time complexity. But, note that maintaining a
+ * balanced sorted #QTree of n elements is done in time O(n log(n)).
+ *
+ * To create a new #QTree use q_tree_new().
+ *
+ * To insert a key/value pair into a #QTree use q_tree_insert()
+ * (O(n log(n))).
+ *
+ * To remove a key/value pair use q_tree_remove() (O(n log(n))).
+ *
+ * To look up the value corresponding to a given key, use
+ * q_tree_lookup() and q_tree_lookup_extended().
+ *
+ * To find out the number of nodes in a #QTree, use q_tree_nnodes(). To
+ * get the height of a #QTree, use q_tree_height().
+ *
+ * To traverse a #QTree, calling a function for each node visited in
+ * the traversal, use q_tree_foreach().
+ *
+ * To destroy a #QTree, use q_tree_destroy().
+ **/
+
+#define MAX_GTREE_HEIGHT 40
+
+/**
+ * QTree:
+ *
+ * The QTree struct is an opaque data structure representing a
+ * [balanced binary tree][glib-Balanced-Binary-Trees]. It should be
+ * accessed only by using the following functions.
+ */
+struct _QTree {
+    QTreeNode        *root;
+    GCompareDataFunc  key_compare;
+    GDestroyNotify    key_destroy_func;
+    GDestroyNotify    value_destroy_func;
+    gpointer          key_compare_data;
+    guint             nnodes;
+    gint              ref_count;
+};
+
+struct _QTreeNode {
+    gpointer   key;         /* key for this node */
+    gpointer   value;       /* value stored at this node */
+    QTreeNode *left;        /* left subtree */
+    QTreeNode *right;       /* right subtree */
+    gint8      balance;     /* height (right) - height (left) */
+    guint8     left_child;
+    guint8     right_child;
+};
+
+
+static QTreeNode *q_tree_node_new(gpointer       key,
+                                  gpointer       value);
+static QTreeNode *q_tree_insert_internal(QTree *tree,
+                                         gpointer key,
+                                         gpointer value,
+                                         gboolean replace);
+static gboolean   q_tree_remove_internal(QTree         *tree,
+                                         gconstpointer  key,
+                                         gboolean       steal);
+static QTreeNode *q_tree_node_balance(QTreeNode     *node);
+static QTreeNode *q_tree_find_node(QTree         *tree,
+                                   gconstpointer  key);
+static gint       q_tree_node_pre_order(QTreeNode     *node,
+                                        GTraverseFunc  traverse_func,
+                                        gpointer       data);
+static gint       q_tree_node_in_order(QTreeNode     *node,
+                                       GTraverseFunc  traverse_func,
+                                       gpointer       data);
+static gint       q_tree_node_post_order(QTreeNode     *node,
+                                         GTraverseFunc  traverse_func,
+                                         gpointer       data);
+static QTreeNode *q_tree_node_search(QTreeNode *node,
+                                     GCompareFunc search_func,
+                                     gconstpointer data);
+static QTreeNode *q_tree_node_rotate_left(QTreeNode     *node);
+static QTreeNode *q_tree_node_rotate_right(QTreeNode     *node);
+#ifdef Q_TREE_DEBUG
+static void       q_tree_node_check(QTreeNode     *node);
+#endif
+
+
+static QTreeNode*
+q_tree_node_new(gpointer key,
+                gpointer value)
+{
+    QTreeNode *node = g_new(QTreeNode, 1);
+
+    node->balance = 0;
+    node->left = NULL;
+    node->right = NULL;
+    node->left_child = FALSE;
+    node->right_child = FALSE;
+    node->key = key;
+    node->value = value;
+
+    return node;
+}
+
+/**
+ * q_tree_new:
+ * @key_compare_func: the function used to order the nodes in the #QTree.
+ *   It should return values similar to the standard strcmp() function -
+ *   0 if the two arguments are equal, a negative value if the first argument
+ *   comes before the second, or a positive value if the first argument comes
+ *   after the second.
+ *
+ * Creates a new #QTree.
+ *
+ * Returns: a newly allocated #QTree
+ */
+QTree *
+q_tree_new(GCompareFunc key_compare_func)
+{
+    g_return_val_if_fail(key_compare_func != NULL, NULL);
+
+    return q_tree_new_full((GCompareDataFunc) key_compare_func, NULL,
+                           NULL, NULL);
+}
+
+/**
+ * q_tree_new_with_data:
+ * @key_compare_func: qsort()-style comparison function
+ * @key_compare_data: data to pass to comparison function
+ *
+ * Creates a new #QTree with a comparison function that accepts user data.
+ * See q_tree_new() for more details.
+ *
+ * Returns: a newly allocated #QTree
+ */
+QTree *
+q_tree_new_with_data(GCompareDataFunc key_compare_func,
+                     gpointer         key_compare_data)
+{
+    g_return_val_if_fail(key_compare_func != NULL, NULL);
+
+    return q_tree_new_full(key_compare_func, key_compare_data,
+                           NULL, NULL);
+}
+
+/**
+ * q_tree_new_full:
+ * @key_compare_func: qsort()-style comparison function
+ * @key_compare_data: data to pass to comparison function
+ * @key_destroy_func: a function to free the memory allocated for the key
+ *   used when removing the entry from the #QTree or %NULL if you don't
+ *   want to supply such a function
+ * @value_destroy_func: a function to free the memory allocated for the
+ *   value used when removing the entry from the #QTree or %NULL if you
+ *   don't want to supply such a function
+ *
+ * Creates a new #QTree like q_tree_new() and allows to specify functions
+ * to free the memory allocated for the key and value that get called when
+ * removing the entry from the #QTree.
+ *
+ * Returns: a newly allocated #QTree
+ */
+QTree *
+q_tree_new_full(GCompareDataFunc key_compare_func,
+                gpointer         key_compare_data,
+                GDestroyNotify   key_destroy_func,
+                GDestroyNotify   value_destroy_func)
+{
+    QTree *tree;
+
+    g_return_val_if_fail(key_compare_func != NULL, NULL);
+
+    tree = g_new(QTree, 1);
+    tree->root               = NULL;
+    tree->key_compare        = key_compare_func;
+    tree->key_destroy_func   = key_destroy_func;
+    tree->value_destroy_func = value_destroy_func;
+    tree->key_compare_data   = key_compare_data;
+    tree->nnodes             = 0;
+    tree->ref_count          = 1;
+
+    return tree;
+}
+
+/**
+ * q_tree_node_first:
+ * @tree: a #QTree
+ *
+ * Returns the first in-order node of the tree, or %NULL
+ * for an empty tree.
+ *
+ * Returns: (nullable) (transfer none): the first node in the tree
+ *
+ * Since: 2.68
+ */
+QTreeNode *
+q_tree_node_first(QTree *tree)
+{
+    QTreeNode *tmp;
+
+    g_return_val_if_fail(tree != NULL, NULL);
+
+    if (!tree->root) {
+        return NULL;
+    }
+
+    tmp = tree->root;
+
+    while (tmp->left_child) {
+        tmp = tmp->left;
+    }
+
+    return tmp;
+}
+
+/**
+ * q_tree_node_last:
+ * @tree: a #QTree
+ *
+ * Returns the last in-order node of the tree, or %NULL
+ * for an empty tree.
+ *
+ * Returns: (nullable) (transfer none): the last node in the tree
+ *
+ * Since: 2.68
+ */
+QTreeNode *
+q_tree_node_last(QTree *tree)
+{
+    QTreeNode *tmp;
+
+    g_return_val_if_fail(tree != NULL, NULL);
+
+    if (!tree->root) {
+        return NULL;
+    }
+
+    tmp = tree->root;
+
+    while (tmp->right_child) {
+        tmp = tmp->right;
+    }
+
+    return tmp;
+}
+
+/**
+ * q_tree_node_previous
+ * @node: a #QTree node
+ *
+ * Returns the previous in-order node of the tree, or %NULL
+ * if the passed node was already the first one.
+ *
+ * Returns: (nullable) (transfer none): the previous node in the tree
+ *
+ * Since: 2.68
+ */
+QTreeNode *
+q_tree_node_previous(QTreeNode *node)
+{
+    QTreeNode *tmp;
+
+    g_return_val_if_fail(node != NULL, NULL);
+
+    tmp = node->left;
+
+    if (node->left_child) {
+        while (tmp->right_child) {
+            tmp = tmp->right;
+        }
+    }
+
+    return tmp;
+}
+
+/**
+ * q_tree_node_next
+ * @node: a #QTree node
+ *
+ * Returns the next in-order node of the tree, or %NULL
+ * if the passed node was already the last one.
+ *
+ * Returns: (nullable) (transfer none): the next node in the tree
+ *
+ * Since: 2.68
+ */
+QTreeNode *
+q_tree_node_next(QTreeNode *node)
+{
+    QTreeNode *tmp;
+
+    g_return_val_if_fail(node != NULL, NULL);
+
+    tmp = node->right;
+
+    if (node->right_child) {
+        while (tmp->left_child) {
+            tmp = tmp->left;
+        }
+    }
+
+    return tmp;
+}
+
+/**
+ * q_tree_remove_all:
+ * @tree: a #QTree
+ *
+ * Removes all nodes from a #QTree and destroys their keys and values,
+ * then resets the #QTree’s root to %NULL.
+ *
+ * Since: 2.70
+ */
+void
+q_tree_remove_all(QTree *tree)
+{
+    QTreeNode *node;
+    QTreeNode *next;
+
+    g_return_if_fail(tree != NULL);
+
+    node = q_tree_node_first(tree);
+
+    while (node) {
+        next = q_tree_node_next(node);
+
+        if (tree->key_destroy_func) {
+            tree->key_destroy_func(node->key);
+        }
+        if (tree->value_destroy_func) {
+            tree->value_destroy_func(node->value);
+        }
+        g_free(node);
+
+#ifdef Q_TREE_DEBUG
+        g_assert(tree->nnodes > 0);
+        tree->nnodes--;
+#endif
+
+        node = next;
+    }
+
+#ifdef Q_TREE_DEBUG
+    g_assert(tree->nnodes == 0);
+#endif
+
+    tree->root = NULL;
+#ifndef Q_TREE_DEBUG
+    tree->nnodes = 0;
+#endif
+}
+
+/**
+ * q_tree_ref:
+ * @tree: a #QTree
+ *
+ * Increments the reference count of @tree by one.
+ *
+ * It is safe to call this function from any thread.
+ *
+ * Returns: the passed in #QTree
+ *
+ * Since: 2.22
+ */
+QTree *
+q_tree_ref(QTree *tree)
+{
+    g_return_val_if_fail(tree != NULL, NULL);
+
+    g_atomic_int_inc(&tree->ref_count);
+
+    return tree;
+}
+
+/**
+ * q_tree_unref:
+ * @tree: a #QTree
+ *
+ * Decrements the reference count of @tree by one.
+ * If the reference count drops to 0, all keys and values will
+ * be destroyed (if destroy functions were specified) and all
+ * memory allocated by @tree will be released.
+ *
+ * It is safe to call this function from any thread.
+ *
+ * Since: 2.22
+ */
+void
+q_tree_unref(QTree *tree)
+{
+    g_return_if_fail(tree != NULL);
+
+    if (g_atomic_int_dec_and_test(&tree->ref_count)) {
+        q_tree_remove_all(tree);
+        g_free(tree);
+    }
+}
+
+/**
+ * q_tree_destroy:
+ * @tree: a #QTree
+ *
+ * Removes all keys and values from the #QTree and decreases its
+ * reference count by one. If keys and/or values are dynamically
+ * allocated, you should either free them first or create the #QTree
+ * using q_tree_new_full(). In the latter case the destroy functions
+ * you supplied will be called on all keys and values before destroying
+ * the #QTree.
+ */
+void
+q_tree_destroy(QTree *tree)
+{
+    g_return_if_fail(tree != NULL);
+
+    q_tree_remove_all(tree);
+    q_tree_unref(tree);
+}
+
+/**
+ * q_tree_insert_node:
+ * @tree: a #QTree
+ * @key: the key to insert
+ * @value: the value corresponding to the key
+ *
+ * Inserts a key/value pair into a #QTree.
+ *
+ * If the given key already exists in the #QTree its corresponding value
+ * is set to the new value. If you supplied a @value_destroy_func when
+ * creating the #QTree, the old value is freed using that function. If
+ * you supplied a @key_destroy_func when creating the #QTree, the passed
+ * key is freed using that function.
+ *
+ * The tree is automatically 'balanced' as new key/value pairs are added,
+ * so that the distance from the root to every leaf is as small as possible.
+ * The cost of maintaining a balanced tree while inserting new key/value
+ * result in a O(n log(n)) operation where most of the other operations
+ * are O(log(n)).
+ *
+ * Returns: (transfer none): the inserted (or set) node.
+ *
+ * Since: 2.68
+ */
+QTreeNode *
+q_tree_insert_node(QTree    *tree,
+                   gpointer  key,
+                   gpointer  value)
+{
+    QTreeNode *node;
+
+    g_return_val_if_fail(tree != NULL, NULL);
+
+    node = q_tree_insert_internal(tree, key, value, FALSE);
+
+#ifdef Q_TREE_DEBUG
+    q_tree_node_check(tree->root);
+#endif
+
+    return node;
+}
+
+/**
+ * q_tree_insert:
+ * @tree: a #QTree
+ * @key: the key to insert
+ * @value: the value corresponding to the key
+ *
+ * Inserts a key/value pair into a #QTree.
+ *
+ * Inserts a new key and value into a #QTree as q_tree_insert_node() does,
+ * only this function does not return the inserted or set node.
+ */
+void
+q_tree_insert(QTree    *tree,
+              gpointer  key,
+              gpointer  value)
+{
+    q_tree_insert_node(tree, key, value);
+}
+
+/**
+ * q_tree_replace_node:
+ * @tree: a #QTree
+ * @key: the key to insert
+ * @value: the value corresponding to the key
+ *
+ * Inserts a new key and value into a #QTree similar to q_tree_insert_node().
+ * The difference is that if the key already exists in the #QTree, it gets
+ * replaced by the new key. If you supplied a @value_destroy_func when
+ * creating the #QTree, the old value is freed using that function. If you
+ * supplied a @key_destroy_func when creating the #QTree, the old key is
+ * freed using that function.
+ *
+ * The tree is automatically 'balanced' as new key/value pairs are added,
+ * so that the distance from the root to every leaf is as small as possible.
+ *
+ * Returns: (transfer none): the inserted (or set) node.
+ *
+ * Since: 2.68
+ */
+QTreeNode *
+q_tree_replace_node(QTree    *tree,
+                    gpointer  key,
+                    gpointer  value)
+{
+    QTreeNode *node;
+
+    g_return_val_if_fail(tree != NULL, NULL);
+
+    node = q_tree_insert_internal(tree, key, value, TRUE);
+
+#ifdef Q_TREE_DEBUG
+    q_tree_node_check(tree->root);
+#endif
+
+    return node;
+}
+
+/**
+ * q_tree_replace:
+ * @tree: a #QTree
+ * @key: the key to insert
+ * @value: the value corresponding to the key
+ *
+ * Inserts a new key and value into a #QTree as q_tree_replace_node() does,
+ * only this function does not return the inserted or set node.
+ */
+void
+q_tree_replace(QTree    *tree,
+               gpointer  key,
+               gpointer  value)
+{
+    q_tree_replace_node(tree, key, value);
+}
+
+/* internal insert routine */
+static QTreeNode *
+q_tree_insert_internal(QTree    *tree,
+                       gpointer  key,
+                       gpointer  value,
+                       gboolean  replace)
+{
+    QTreeNode *node, *retnode;
+    QTreeNode *path[MAX_GTREE_HEIGHT];
+    int idx;
+
+    g_return_val_if_fail(tree != NULL, NULL);
+
+    if (!tree->root) {
+        tree->root = q_tree_node_new(key, value);
+        tree->nnodes++;
+        return tree->root;
+    }
+
+    idx = 0;
+    path[idx++] = NULL;
+    node = tree->root;
+
+    while (1) {
+        int cmp = tree->key_compare(key, node->key, tree->key_compare_data);
+
+        if (cmp == 0) {
+            if (tree->value_destroy_func) {
+                tree->value_destroy_func(node->value);
+            }
+
+            node->value = value;
+
+            if (replace) {
+                if (tree->key_destroy_func) {
+                    tree->key_destroy_func(node->key);
+                }
+
+                node->key = key;
+            } else {
+                /* free the passed key */
+                if (tree->key_destroy_func) {
+                    tree->key_destroy_func(key);
+                }
+            }
+
+            return node;
+        } else if (cmp < 0) {
+            if (node->left_child) {
+                path[idx++] = node;
+                node = node->left;
+            } else {
+                QTreeNode *child = q_tree_node_new(key, value);
+
+                child->left = node->left;
+                child->right = node;
+                node->left = child;
+                node->left_child = TRUE;
+                node->balance -= 1;
+
+                tree->nnodes++;
+
+                retnode = child;
+                break;
+            }
+        } else {
+            if (node->right_child) {
+                path[idx++] = node;
+                node = node->right;
+            } else {
+                QTreeNode *child = q_tree_node_new(key, value);
+
+                child->right = node->right;
+                child->left = node;
+                node->right = child;
+                node->right_child = TRUE;
+                node->balance += 1;
+
+                tree->nnodes++;
+
+                retnode = child;
+                break;
+            }
+        }
+    }
+
+    /*
+     * Restore balance. This is the goodness of a non-recursive
+     * implementation, when we are done with balancing we 'break'
+     * the loop and we are done.
+     */
+    while (1) {
+        QTreeNode *bparent = path[--idx];
+        gboolean left_node = (bparent && node == bparent->left);
+        g_assert(!bparent || bparent->left == node || bparent->right == node);
+
+        if (node->balance < -1 || node->balance > 1) {
+            node = q_tree_node_balance(node);
+            if (bparent == NULL) {
+                tree->root = node;
+            } else if (left_node) {
+                bparent->left = node;
+            } else {
+                bparent->right = node;
+            }
+        }
+
+        if (node->balance == 0 || bparent == NULL) {
+            break;
+        }
+
+        if (left_node) {
+            bparent->balance -= 1;
+        } else {
+            bparent->balance += 1;
+        }
+
+        node = bparent;
+    }
+
+    return retnode;
+}
+
+/**
+ * q_tree_remove:
+ * @tree: a #QTree
+ * @key: the key to remove
+ *
+ * Removes a key/value pair from a #QTree.
+ *
+ * If the #QTree was created using q_tree_new_full(), the key and value
+ * are freed using the supplied destroy functions, otherwise you have to
+ * make sure that any dynamically allocated values are freed yourself.
+ * If the key does not exist in the #QTree, the function does nothing.
+ *
+ * The cost of maintaining a balanced tree while removing a key/value
+ * result in a O(n log(n)) operation where most of the other operations
+ * are O(log(n)).
+ *
+ * Returns: %TRUE if the key was found (prior to 2.8, this function
+ *     returned nothing)
+ */
+gboolean
+q_tree_remove(QTree         *tree,
+              gconstpointer  key)
+{
+    gboolean removed;
+
+    g_return_val_if_fail(tree != NULL, FALSE);
+
+    removed = q_tree_remove_internal(tree, key, FALSE);
+
+#ifdef Q_TREE_DEBUG
+    q_tree_node_check(tree->root);
+#endif
+
+    return removed;
+}
+
+/**
+ * q_tree_steal:
+ * @tree: a #QTree
+ * @key: the key to remove
+ *
+ * Removes a key and its associated value from a #QTree without calling
+ * the key and value destroy functions.
+ *
+ * If the key does not exist in the #QTree, the function does nothing.
+ *
+ * Returns: %TRUE if the key was found (prior to 2.8, this function
+ *     returned nothing)
+ */
+gboolean
+q_tree_steal(QTree         *tree,
+             gconstpointer  key)
+{
+    gboolean removed;
+
+    g_return_val_if_fail(tree != NULL, FALSE);
+
+    removed = q_tree_remove_internal(tree, key, TRUE);
+
+#ifdef Q_TREE_DEBUG
+    q_tree_node_check(tree->root);
+#endif
+
+    return removed;
+}
+
+/* internal remove routine */
+static gboolean
+q_tree_remove_internal(QTree         *tree,
+                       gconstpointer  key,
+                       gboolean       steal)
+{
+    QTreeNode *node, *parent, *balance;
+    QTreeNode *path[MAX_GTREE_HEIGHT];
+    int idx;
+    gboolean left_node;
+
+    g_return_val_if_fail(tree != NULL, FALSE);
+
+    if (!tree->root) {
+        return FALSE;
+    }
+
+    idx = 0;
+    path[idx++] = NULL;
+    node = tree->root;
+
+    while (1) {
+        int cmp = tree->key_compare(key, node->key, tree->key_compare_data);
+
+        if (cmp == 0) {
+            break;
+        } else if (cmp < 0) {
+            if (!node->left_child) {
+                return FALSE;
+            }
+
+            path[idx++] = node;
+            node = node->left;
+        } else {
+            if (!node->right_child) {
+                return FALSE;
+            }
+
+            path[idx++] = node;
+            node = node->right;
+        }
+    }
+
+    /*
+     * The following code is almost equal to q_tree_remove_node,
+     * except that we do not have to call q_tree_node_parent.
+     */
+    balance = parent = path[--idx];
+    g_assert(!parent || parent->left == node || parent->right == node);
+    left_node = (parent && node == parent->left);
+
+    if (!node->left_child) {
+        if (!node->right_child) {
+            if (!parent) {
+                tree->root = NULL;
+            } else if (left_node) {
+                parent->left_child = FALSE;
+                parent->left = node->left;
+                parent->balance += 1;
+            } else {
+                parent->right_child = FALSE;
+                parent->right = node->right;
+                parent->balance -= 1;
+            }
+        } else {
+            /* node has a right child */
+            QTreeNode *tmp = q_tree_node_next(node);
+            tmp->left = node->left;
+
+            if (!parent) {
+                tree->root = node->right;
+            } else if (left_node) {
+                parent->left = node->right;
+                parent->balance += 1;
+            } else {
+                parent->right = node->right;
+                parent->balance -= 1;
+            }
+        }
+    } else {
+        /* node has a left child */
+        if (!node->right_child) {
+            QTreeNode *tmp = q_tree_node_previous(node);
+            tmp->right = node->right;
+
+            if (parent == NULL) {
+                tree->root = node->left;
+            } else if (left_node) {
+                parent->left = node->left;
+                parent->balance += 1;
+            } else {
+                parent->right = node->left;
+                parent->balance -= 1;
+            }
+        } else {
+            /* node has a both children (pant, pant!) */
+            QTreeNode *prev = node->left;
+            QTreeNode *next = node->right;
+            QTreeNode *nextp = node;
+            int old_idx = idx + 1;
+            idx++;
+
+            /* path[idx] == parent */
+            /* find the immediately next node (and its parent) */
+            while (next->left_child) {
+                path[++idx] = nextp = next;
+                next = next->left;
+            }
+
+            path[old_idx] = next;
+            balance = path[idx];
+
+            /* remove 'next' from the tree */
+            if (nextp != node) {
+                if (next->right_child) {
+                    nextp->left = next->right;
+                } else {
+                    nextp->left_child = FALSE;
+                }
+                nextp->balance += 1;
+
+                next->right_child = TRUE;
+                next->right = node->right;
+            } else {
+                node->balance -= 1;
+            }
+
+            /* set the prev to point to the right place */
+            while (prev->right_child) {
+                prev = prev->right;
+            }
+            prev->right = next;
+
+            /* prepare 'next' to replace 'node' */
+            next->left_child = TRUE;
+            next->left = node->left;
+            next->balance = node->balance;
+
+            if (!parent) {
+                tree->root = next;
+            } else if (left_node) {
+                parent->left = next;
+            } else {
+                parent->right = next;
+            }
+        }
+    }
+
+    /* restore balance */
+    if (balance) {
+        while (1) {
+            QTreeNode *bparent = path[--idx];
+            g_assert(!bparent ||
+                     bparent->left == balance ||
+                     bparent->right == balance);
+            left_node = (bparent && balance == bparent->left);
+
+            if (balance->balance < -1 || balance->balance > 1) {
+                balance = q_tree_node_balance(balance);
+                if (!bparent) {
+                    tree->root = balance;
+                } else if (left_node) {
+                    bparent->left = balance;
+                } else {
+                    bparent->right = balance;
+                }
+            }
+
+            if (balance->balance != 0 || !bparent) {
+                break;
+            }
+
+            if (left_node) {
+                bparent->balance += 1;
+            } else {
+                bparent->balance -= 1;
+            }
+
+            balance = bparent;
+        }
+    }
+
+    if (!steal) {
+        if (tree->key_destroy_func) {
+            tree->key_destroy_func(node->key);
+        }
+        if (tree->value_destroy_func) {
+            tree->value_destroy_func(node->value);
+        }
+    }
+
+    g_free(node);
+
+    tree->nnodes--;
+
+    return TRUE;
+}
+
+/**
+ * q_tree_node_key:
+ * @node: a #QTree node
+ *
+ * Gets the key stored at a particular tree node.
+ *
+ * Returns: (nullable) (transfer none): the key at the node.
+ *
+ * Since: 2.68
+ */
+gpointer
+q_tree_node_key(QTreeNode *node)
+{
+    g_return_val_if_fail(node != NULL, NULL);
+
+    return node->key;
+}
+
+/**
+ * q_tree_node_value:
+ * @node: a #QTree node
+ *
+ * Gets the value stored at a particular tree node.
+ *
+ * Returns: (nullable) (transfer none): the value at the node.
+ *
+ * Since: 2.68
+ */
+gpointer
+q_tree_node_value(QTreeNode *node)
+{
+    g_return_val_if_fail(node != NULL, NULL);
+
+    return node->value;
+}
+
+/**
+ * q_tree_lookup_node:
+ * @tree: a #QTree
+ * @key: the key to look up
+ *
+ * Gets the tree node corresponding to the given key. Since a #QTree is
+ * automatically balanced as key/value pairs are added, key lookup
+ * is O(log n) (where n is the number of key/value pairs in the tree).
+ *
+ * Returns: (nullable) (transfer none): the tree node corresponding to
+ *          the key, or %NULL if the key was not found
+ *
+ * Since: 2.68
+ */
+QTreeNode *
+q_tree_lookup_node(QTree         *tree,
+                   gconstpointer  key)
+{
+    g_return_val_if_fail(tree != NULL, NULL);
+
+    return q_tree_find_node(tree, key);
+}
+
+/**
+ * q_tree_lookup:
+ * @tree: a #QTree
+ * @key: the key to look up
+ *
+ * Gets the value corresponding to the given key. Since a #QTree is
+ * automatically balanced as key/value pairs are added, key lookup
+ * is O(log n) (where n is the number of key/value pairs in the tree).
+ *
+ * Returns: the value corresponding to the key, or %NULL
+ *     if the key was not found
+ */
+gpointer
+q_tree_lookup(QTree         *tree,
+              gconstpointer  key)
+{
+    QTreeNode *node;
+
+    node = q_tree_lookup_node(tree, key);
+
+    return node ? node->value : NULL;
+}
+
+/**
+ * q_tree_lookup_extended:
+ * @tree: a #QTree
+ * @lookup_key: the key to look up
+ * @orig_key: (out) (optional) (nullable): returns the original key
+ * @value: (out) (optional) (nullable): returns the value associated with
+ *         the key
+ *
+ * Looks up a key in the #QTree, returning the original key and the
+ * associated value. This is useful if you need to free the memory
+ * allocated for the original key, for example before calling
+ * q_tree_remove().
+ *
+ * Returns: %TRUE if the key was found in the #QTree
+ */
+gboolean
+q_tree_lookup_extended(QTree         *tree,
+                       gconstpointer  lookup_key,
+                       gpointer      *orig_key,
+                       gpointer      *value)
+{
+    QTreeNode *node;
+
+    g_return_val_if_fail(tree != NULL, FALSE);
+
+    node = q_tree_find_node(tree, lookup_key);
+
+    if (node) {
+        if (orig_key) {
+            *orig_key = node->key;
+        }
+        if (value) {
+            *value = node->value;
+        }
+        return TRUE;
+    } else {
+        return FALSE;
+    }
+}
+
+/**
+ * q_tree_foreach:
+ * @tree: a #QTree
+ * @func: the function to call for each node visited.
+ *     If this function returns %TRUE, the traversal is stopped.
+ * @user_data: user data to pass to the function
+ *
+ * Calls the given function for each of the key/value pairs in the #QTree.
+ * The function is passed the key and value of each pair, and the given
+ * @data parameter. The tree is traversed in sorted order.
+ *
+ * The tree may not be modified while iterating over it (you can't
+ * add/remove items). To remove all items matching a predicate, you need
+ * to add each item to a list in your #GTraverseFunc as you walk over
+ * the tree, then walk the list and remove each item.
+ */
+void
+q_tree_foreach(QTree         *tree,
+               GTraverseFunc  func,
+               gpointer       user_data)
+{
+    QTreeNode *node;
+
+    g_return_if_fail(tree != NULL);
+
+    if (!tree->root) {
+        return;
+    }
+
+    node = q_tree_node_first(tree);
+
+    while (node) {
+        if ((*func)(node->key, node->value, user_data)) {
+            break;
+        }
+
+        node = q_tree_node_next(node);
+    }
+}
+
+/**
+ * q_tree_foreach_node:
+ * @tree: a #QTree
+ * @func: the function to call for each node visited.
+ *     If this function returns %TRUE, the traversal is stopped.
+ * @user_data: user data to pass to the function
+ *
+ * Calls the given function for each of the nodes in the #QTree.
+ * The function is passed the pointer to the particular node, and the given
+ * @data parameter. The tree traversal happens in-order.
+ *
+ * The tree may not be modified while iterating over it (you can't
+ * add/remove items). To remove all items matching a predicate, you need
+ * to add each item to a list in your #GTraverseFunc as you walk over
+ * the tree, then walk the list and remove each item.
+ *
+ * Since: 2.68
+ */
+void
+q_tree_foreach_node(QTree             *tree,
+                    QTraverseNodeFunc  func,
+                    gpointer           user_data)
+{
+    QTreeNode *node;
+
+    g_return_if_fail(tree != NULL);
+
+    if (!tree->root) {
+        return;
+    }
+
+    node = q_tree_node_first(tree);
+
+    while (node) {
+        if ((*func)(node, user_data)) {
+            break;
+        }
+
+        node = q_tree_node_next(node);
+    }
+}
+
+/**
+ * q_tree_traverse:
+ * @tree: a #QTree
+ * @traverse_func: the function to call for each node visited. If this
+ *   function returns %TRUE, the traversal is stopped.
+ * @traverse_type: the order in which nodes are visited, one of %G_IN_ORDER,
+ *   %G_PRE_ORDER and %G_POST_ORDER
+ * @user_data: user data to pass to the function
+ *
+ * Calls the given function for each node in the #QTree.
+ *
+ * Deprecated:2.2: The order of a balanced tree is somewhat arbitrary.
+ *     If you just want to visit all nodes in sorted order, use
+ *     q_tree_foreach() instead. If you really need to visit nodes in
+ *     a different order, consider using an [n-ary tree][glib-N-ary-Trees].
+ */
+/**
+ * GTraverseFunc:
+ * @key: a key of a #QTree node
+ * @value: the value corresponding to the key
+ * @user_data: user data passed to q_tree_traverse()
+ *
+ * Specifies the type of function passed to q_tree_traverse(). It is
+ * passed the key and value of each node, together with the @user_data
+ * parameter passed to q_tree_traverse(). If the function returns
+ * %TRUE, the traversal is stopped.
+ *
+ * Returns: %TRUE to stop the traversal
+ */
+void
+q_tree_traverse(QTree         *tree,
+                GTraverseFunc  traverse_func,
+                GTraverseType  traverse_type,
+                gpointer       user_data)
+{
+    g_return_if_fail(tree != NULL);
+
+    if (!tree->root) {
+        return;
+    }
+
+    switch (traverse_type) {
+    case G_PRE_ORDER:
+        q_tree_node_pre_order(tree->root, traverse_func, user_data);
+        break;
+
+    case G_IN_ORDER:
+        q_tree_node_in_order(tree->root, traverse_func, user_data);
+        break;
+
+    case G_POST_ORDER:
+        q_tree_node_post_order(tree->root, traverse_func, user_data);
+        break;
+
+    case G_LEVEL_ORDER:
+        g_warning("q_tree_traverse(): traverse type G_LEVEL_ORDER "
+                  "isn't implemented.");
+        break;
+    }
+}
+
+/**
+ * q_tree_search_node:
+ * @tree: a #QTree
+ * @search_func: a function used to search the #QTree
+ * @user_data: the data passed as the second argument to @search_func
+ *
+ * Searches a #QTree using @search_func.
+ *
+ * The @search_func is called with a pointer to the key of a key/value
+ * pair in the tree, and the passed in @user_data. If @search_func returns
+ * 0 for a key/value pair, then the corresponding node is returned as
+ * the result of q_tree_search(). If @search_func returns -1, searching
+ * will proceed among the key/value pairs that have a smaller key; if
+ * @search_func returns 1, searching will proceed among the key/value
+ * pairs that have a larger key.
+ *
+ * Returns: (nullable) (transfer none): the node corresponding to the
+ *          found key, or %NULL if the key was not found
+ *
+ * Since: 2.68
+ */
+QTreeNode *
+q_tree_search_node(QTree         *tree,
+                   GCompareFunc   search_func,
+                   gconstpointer  user_data)
+{
+    g_return_val_if_fail(tree != NULL, NULL);
+
+    if (!tree->root) {
+        return NULL;
+    }
+
+    return q_tree_node_search(tree->root, search_func, user_data);
+}
+
+/**
+ * q_tree_search:
+ * @tree: a #QTree
+ * @search_func: a function used to search the #QTree
+ * @user_data: the data passed as the second argument to @search_func
+ *
+ * Searches a #QTree using @search_func.
+ *
+ * The @search_func is called with a pointer to the key of a key/value
+ * pair in the tree, and the passed in @user_data. If @search_func returns
+ * 0 for a key/value pair, then the corresponding value is returned as
+ * the result of q_tree_search(). If @search_func returns -1, searching
+ * will proceed among the key/value pairs that have a smaller key; if
+ * @search_func returns 1, searching will proceed among the key/value
+ * pairs that have a larger key.
+ *
+ * Returns: the value corresponding to the found key, or %NULL
+ *     if the key was not found
+ */
+gpointer
+q_tree_search(QTree         *tree,
+              GCompareFunc   search_func,
+              gconstpointer  user_data)
+{
+    QTreeNode *node;
+
+    node = q_tree_search_node(tree, search_func, user_data);
+
+    return node ? node->value : NULL;
+}
+
+/**
+ * q_tree_lower_bound:
+ * @tree: a #QTree
+ * @key: the key to calculate the lower bound for
+ *
+ * Gets the lower bound node corresponding to the given key,
+ * or %NULL if the tree is empty or all the nodes in the tree
+ * have keys that are strictly lower than the searched key.
+ *
+ * The lower bound is the first node that has its key greater
+ * than or equal to the searched key.
+ *
+ * Returns: (nullable) (transfer none): the tree node corresponding to
+ *          the lower bound, or %NULL if the tree is empty or has only
+ *          keys strictly lower than the searched key.
+ *
+ * Since: 2.68
+ */
+QTreeNode *
+q_tree_lower_bound(QTree         *tree,
+                   gconstpointer  key)
+{
+    QTreeNode *node, *result;
+    gint cmp;
+
+    g_return_val_if_fail(tree != NULL, NULL);
+
+    node = tree->root;
+    if (!node) {
+        return NULL;
+    }
+
+    result = NULL;
+    while (1) {
+        cmp = tree->key_compare(key, node->key, tree->key_compare_data);
+        if (cmp <= 0) {
+            result = node;
+
+            if (!node->left_child) {
+                return result;
+            }
+
+            node = node->left;
+        } else {
+            if (!node->right_child) {
+                return result;
+            }
+
+            node = node->right;
+        }
+    }
+}
+
+/**
+ * q_tree_upper_bound:
+ * @tree: a #QTree
+ * @key: the key to calculate the upper bound for
+ *
+ * Gets the upper bound node corresponding to the given key,
+ * or %NULL if the tree is empty or all the nodes in the tree
+ * have keys that are lower than or equal to the searched key.
+ *
+ * The upper bound is the first node that has its key strictly greater
+ * than the searched key.
+ *
+ * Returns: (nullable) (transfer none): the tree node corresponding to the
+ *          upper bound, or %NULL if the tree is empty or has only keys
+ *          lower than or equal to the searched key.
+ *
+ * Since: 2.68
+ */
+QTreeNode *
+q_tree_upper_bound(QTree         *tree,
+                   gconstpointer  key)
+{
+    QTreeNode *node, *result;
+    gint cmp;
+
+    g_return_val_if_fail(tree != NULL, NULL);
+
+    node = tree->root;
+    if (!node) {
+        return NULL;
+    }
+
+    result = NULL;
+    while (1) {
+        cmp = tree->key_compare(key, node->key, tree->key_compare_data);
+        if (cmp < 0) {
+            result = node;
+
+            if (!node->left_child) {
+                return result;
+            }
+
+            node = node->left;
+        } else {
+            if (!node->right_child) {
+                return result;
+            }
+
+            node = node->right;
+        }
+    }
+}
+
+/**
+ * q_tree_height:
+ * @tree: a #QTree
+ *
+ * Gets the height of a #QTree.
+ *
+ * If the #QTree contains no nodes, the height is 0.
+ * If the #QTree contains only one root node the height is 1.
+ * If the root node has children the height is 2, etc.
+ *
+ * Returns: the height of @tree
+ */
+gint
+q_tree_height(QTree *tree)
+{
+    QTreeNode *node;
+    gint height;
+
+    g_return_val_if_fail(tree != NULL, 0);
+
+    if (!tree->root) {
+        return 0;
+    }
+
+    height = 0;
+    node = tree->root;
+
+    while (1) {
+        height += 1 + MAX(node->balance, 0);
+
+        if (!node->left_child) {
+            return height;
+        }
+
+        node = node->left;
+    }
+}
+
+/**
+ * q_tree_nnodes:
+ * @tree: a #QTree
+ *
+ * Gets the number of nodes in a #QTree.
+ *
+ * Returns: the number of nodes in @tree
+ */
+gint
+q_tree_nnodes(QTree *tree)
+{
+    g_return_val_if_fail(tree != NULL, 0);
+
+    return tree->nnodes;
+}
+
+static QTreeNode *
+q_tree_node_balance(QTreeNode *node)
+{
+    if (node->balance < -1) {
+        if (node->left->balance > 0) {
+            node->left = q_tree_node_rotate_left(node->left);
+        }
+        node = q_tree_node_rotate_right(node);
+    } else if (node->balance > 1) {
+        if (node->right->balance < 0) {
+            node->right = q_tree_node_rotate_right(node->right);
+        }
+        node = q_tree_node_rotate_left(node);
+    }
+
+    return node;
+}
+
+static QTreeNode *
+q_tree_find_node(QTree        *tree,
+                 gconstpointer key)
+{
+    QTreeNode *node;
+    gint cmp;
+
+    node = tree->root;
+    if (!node) {
+        return NULL;
+    }
+
+    while (1) {
+        cmp = tree->key_compare(key, node->key, tree->key_compare_data);
+        if (cmp == 0) {
+            return node;
+        } else if (cmp < 0) {
+            if (!node->left_child) {
+                return NULL;
+            }
+
+            node = node->left;
+        } else {
+            if (!node->right_child) {
+                return NULL;
+            }
+
+            node = node->right;
+        }
+    }
+}
+
+static gint
+q_tree_node_pre_order(QTreeNode     *node,
+                      GTraverseFunc  traverse_func,
+                      gpointer       data)
+{
+    if ((*traverse_func)(node->key, node->value, data)) {
+        return TRUE;
+    }
+
+    if (node->left_child) {
+        if (q_tree_node_pre_order(node->left, traverse_func, data)) {
+            return TRUE;
+        }
+    }
+
+    if (node->right_child) {
+        if (q_tree_node_pre_order(node->right, traverse_func, data)) {
+            return TRUE;
+        }
+    }
+
+    return FALSE;
+}
+
+static gint
+q_tree_node_in_order(QTreeNode     *node,
+                     GTraverseFunc  traverse_func,
+                     gpointer       data)
+{
+    if (node->left_child) {
+        if (q_tree_node_in_order(node->left, traverse_func, data)) {
+            return TRUE;
+        }
+    }
+
+    if ((*traverse_func)(node->key, node->value, data)) {
+        return TRUE;
+    }
+
+    if (node->right_child) {
+        if (q_tree_node_in_order(node->right, traverse_func, data)) {
+            return TRUE;
+        }
+    }
+
+    return FALSE;
+}
+
+static gint
+q_tree_node_post_order(QTreeNode     *node,
+                       GTraverseFunc  traverse_func,
+                       gpointer       data)
+{
+    if (node->left_child) {
+        if (q_tree_node_post_order(node->left, traverse_func, data)) {
+            return TRUE;
+        }
+    }
+
+    if (node->right_child) {
+        if (q_tree_node_post_order(node->right, traverse_func, data)) {
+            return TRUE;
+        }
+    }
+
+    if ((*traverse_func)(node->key, node->value, data)) {
+        return TRUE;
+    }
+
+    return FALSE;
+}
+
+static QTreeNode *
+q_tree_node_search(QTreeNode     *node,
+                   GCompareFunc   search_func,
+                   gconstpointer  data)
+{
+    gint dir;
+
+    if (!node) {
+        return NULL;
+    }
+
+    while (1) {
+        dir = (*search_func)(node->key, data);
+        if (dir == 0) {
+            return node;
+        } else if (dir < 0) {
+            if (!node->left_child) {
+                return NULL;
+            }
+
+            node = node->left;
+        } else {
+            if (!node->right_child) {
+                return NULL;
+            }
+
+            node = node->right;
+        }
+    }
+}
+
+static QTreeNode *
+q_tree_node_rotate_left(QTreeNode *node)
+{
+    QTreeNode *right;
+    gint a_bal;
+    gint b_bal;
+
+    right = node->right;
+
+    if (right->left_child) {
+        node->right = right->left;
+    } else {
+        node->right_child = FALSE;
+        right->left_child = TRUE;
+    }
+    right->left = node;
+
+    a_bal = node->balance;
+    b_bal = right->balance;
+
+    if (b_bal <= 0) {
+        if (a_bal >= 1) {
+            right->balance = b_bal - 1;
+        } else {
+            right->balance = a_bal + b_bal - 2;
+        }
+        node->balance = a_bal - 1;
+    } else {
+        if (a_bal <= b_bal) {
+            right->balance = a_bal - 2;
+        } else {
+            right->balance = b_bal - 1;
+        }
+        node->balance = a_bal - b_bal - 1;
+    }
+
+    return right;
+}
+
+static QTreeNode *
+q_tree_node_rotate_right(QTreeNode *node)
+{
+    QTreeNode *left;
+    gint a_bal;
+    gint b_bal;
+
+    left = node->left;
+
+    if (left->right_child) {
+        node->left = left->right;
+    } else {
+        node->left_child = FALSE;
+        left->right_child = TRUE;
+    }
+    left->right = node;
+
+    a_bal = node->balance;
+    b_bal = left->balance;
+
+    if (b_bal <= 0) {
+        if (b_bal > a_bal) {
+            left->balance = b_bal + 1;
+        } else {
+            left->balance = a_bal + 2;
+        }
+        node->balance = a_bal - b_bal + 1;
+    } else {
+        if (a_bal <= -1) {
+            left->balance = b_bal + 1;
+        } else {
+            left->balance = a_bal + b_bal + 2;
+        }
+        node->balance = a_bal + 1;
+    }
+
+    return left;
+}
+
+#ifdef Q_TREE_DEBUG
+static gint
+q_tree_node_height(QTreeNode *node)
+{
+    gint left_height;
+    gint right_height;
+
+    if (node) {
+        left_height = 0;
+        right_height = 0;
+
+        if (node->left_child) {
+            left_height = q_tree_node_height(node->left);
+        }
+
+        if (node->right_child) {
+            right_height = q_tree_node_height(node->right);
+        }
+
+        return MAX(left_height, right_height) + 1;
+    }
+
+    return 0;
+}
+
+static void q_tree_node_check(QTreeNode *node)
+{
+    gint left_height;
+    gint right_height;
+    gint balance;
+    QTreeNode *tmp;
+
+    if (node) {
+        if (node->left_child) {
+            tmp = q_tree_node_previous(node);
+            g_assert(tmp->right == node);
+        }
+
+        if (node->right_child) {
+            tmp = q_tree_node_next(node);
+            g_assert(tmp->left == node);
+        }
+
+        left_height = 0;
+        right_height = 0;
+
+        if (node->left_child) {
+            left_height = q_tree_node_height(node->left);
+        }
+        if (node->right_child) {
+            right_height = q_tree_node_height(node->right);
+        }
+
+        balance = right_height - left_height;
+        g_assert(balance == node->balance);
+
+        if (node->left_child) {
+            q_tree_node_check(node->left);
+        }
+        if (node->right_child) {
+            q_tree_node_check(node->right);
+        }
+    }
+}
+
+static void
+q_tree_node_dump(QTreeNode *node,
+                 gint       indent)
+{
+    g_print("%*s%c\n", indent, "", *(char *)node->key);
+
+    if (node->left_child) {
+        g_print("%*sLEFT\n", indent, "");
+        q_tree_node_dump(node->left, indent + 2);
+    } else if (node->left) {
+        g_print("%*s<%c\n", indent + 2, "", *(char *)node->left->key);
+    }
+
+    if (node->right_child) {
+        g_print("%*sRIGHT\n", indent, "");
+        q_tree_node_dump(node->right, indent + 2);
+    } else if (node->right) {
+        g_print("%*s>%c\n", indent + 2, "", *(char *)node->right->key);
+    }
+}
+
+void q_tree_dump(QTree *tree)
+{
+    if (tree->root) {
+        q_tree_node_dump(tree->root, 0);
+    }
+}
+#endif
-- 
2.34.1


