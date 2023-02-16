Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB2699070
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:48:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSapu-0001OU-Rd; Thu, 16 Feb 2023 04:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSap6-0000AI-Lx
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:06 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSaoy-0006LN-C6
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/sHKcuBGlgmdgFz2DkCWF7DBipYEByc+6pq3YnO5EyY=; b=W9tXG7ml3MdKDa6lcjcgB3W05Q
 6csXv4w3VkhsPgfg8rlbPbydBQv+VNs74pCe+oMPSVYSZvwEEPZMXO/n9Jgunrkzc3uu53gfrwdkW
 TR5wcPNBtHnmipZp0w85SPb6M87eh2j5kiQB5RTNhobZCeNL4zOLBaGWHFNHhkBiNkvEfqHSQiGVC
 bFT72XO43cbd6YjPjYBnvayBAi+RqC4BTJvnYH3tpS+oFBvsM3EF+YLl/jYSNCki/zedOWBBZiqGw
 kahWbuX9fIaH6bYI4Wg34JJBpJR7MJlVNHWyFq7gzNNKmNjkjUSfw6P19Ro0u4eSDQ7VzTe6H5Pdy
 j9FUQnew==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pSao2-00AEEx-1m; Thu, 16 Feb 2023 09:44:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSaoi-0090BV-2K; Thu, 16 Feb 2023 09:44:40 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [RFC PATCH v11bis 05/26] hw/xen: Watches on XenStore transactions
Date: Thu, 16 Feb 2023 09:44:15 +0000
Message-Id: <20230216094436.2144978-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216094436.2144978-1-dwmw2@infradead.org>
References: <20230216094436.2144978-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: David Woodhouse <dwmw@amazon.co.uk>

Firing watches on the nodes that still exist is relatively easy; just
walk the tree and look at the nodes with refcount of one.

Firing watches on *deleted* nodes is more fun. We add 'modified_in_tx'
and 'deleted_in_tx' flags to each node. Nodes with those flags cannot
be shared, as they will always be unique to the transaction in which
they were created.

When xs_node_walk would need to *create* a node as scaffolding and it
encounters a deleted_in_tx node, it can resurrect it simply by clearing
its deleted_in_tx flag. If that node originally had any *data*, they're
gone, and the modified_in_tx flag will have been set when it was first
deleted.

We then attempt to send appropriate watches when the transaction is
committed, properly delete the deleted_in_tx nodes, and remove the
modified_in_tx flag from the others.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xenstore_impl.c | 133 ++++++++++++++++++++++++++++++++-
 tests/unit/test-xs-node.c   | 142 +++++++++++++++++++++++++++++++++++-
 2 files changed, 272 insertions(+), 3 deletions(-)

diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
index 692622f706..2f9e1ff51b 100644
--- a/hw/i386/kvm/xenstore_impl.c
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -30,6 +30,8 @@ typedef struct XsNode {
     GByteArray *content;
     GHashTable *children;
     uint64_t gencnt;
+    bool deleted_in_tx;
+    bool modified_in_tx;
 #ifdef XS_NODE_UNIT_TEST
     gchar *name; /* debug only */
 #endif
@@ -116,6 +118,13 @@ static XsNode *xs_node_copy(XsNode *old)
     XsNode *n = xs_node_new();
 
     n->gencnt = old->gencnt;
+
+#ifdef XS_NODE_UNIT_TEST
+    if (n->name) {
+        n->name = g_strdup(old->name);
+    }
+#endif
+
     if (old->children) {
         n->children = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
                                             (GDestroyNotify)xs_node_unref);
@@ -165,6 +174,7 @@ struct walk_op {
 
     GList *watches;
     unsigned int dom_id;
+    unsigned int tx_id;
 
     /*
      * This is maintained on the way *down* the walk to indicate
@@ -180,6 +190,9 @@ struct walk_op {
     bool mutating;
     bool create_dirs;
     bool in_transaction;
+
+    /* Tracking during recursion so we know which is first. */
+    bool deleted_in_tx;
 };
 
 static void fire_watches(struct walk_op *op, bool parents)
@@ -224,6 +237,9 @@ static int xs_node_add_content(XsNode **n, struct walk_op *op)
         g_byte_array_unref((*n)->content);
     }
     (*n)->content = g_byte_array_ref(op->op_opaque);
+    if (op->tx_id != XBT_NULL) {
+        (*n)->modified_in_tx = true;
+    }
     return 0;
 }
 
@@ -279,10 +295,51 @@ static int node_rm_recurse(gpointer key, gpointer value, gpointer user_data)
     return this_inplace;
 }
 
+static XsNode *xs_node_copy_deleted(XsNode *old);
+static void copy_deleted_recurse(gpointer key, gpointer value,
+                                 gpointer user_data)
+{
+    XsNode *n = xs_node_copy_deleted(value);
+    g_hash_table_insert(user_data, g_strdup(key), n);
+}
+
+static XsNode *xs_node_copy_deleted(XsNode *old)
+{
+    XsNode *n = xs_node_new();
+
+    n->gencnt = old->gencnt;
+
+#ifdef XS_NODE_UNIT_TEST
+    if (old->name) {
+        n->name = g_strdup(old->name);
+    }
+#endif
+
+    if (old->children) {
+        n->children = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+                                            (GDestroyNotify)xs_node_unref);
+        g_hash_table_foreach(old->children, copy_deleted_recurse, n->children);
+    }
+    n->deleted_in_tx = true;
+    /* If it gets resurrected we only fire a watch if it lost its content */
+    if (old->content) {
+        n->modified_in_tx = true;
+    }
+    return n;
+}
+
 static int xs_node_rm(XsNode **n, struct walk_op *op)
 {
     bool this_inplace = op->inplace;
 
+    if (op->tx_id != XBT_NULL) {
+        /* It's not trivial to do inplace handling for this one */
+        XsNode *old = *n;
+        *n = xs_node_copy_deleted(old);
+        xs_node_unref(old);
+        return 0;
+    }
+
     /* Fire watches for any node in the subtree which gets deleted. */
     if ((*n)->children) {
         g_hash_table_foreach_remove((*n)->children, node_rm_recurse, op);
@@ -353,6 +410,10 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
     }
 
     if (child) {
+        if (child->deleted_in_tx) {
+            assert(child->ref == 1);
+            child->deleted_in_tx = false;
+        }
         xs_node_ref(child);
         /*
          * Now we own it too. But if we can modify inplace, that's going to
@@ -502,6 +563,7 @@ static int init_walk_op(XenstoreImplState *s, struct walk_op *op,
     op->create_dirs = false;
     op->in_transaction = false;
     op->dom_id = dom_id;
+    op->tx_id = tx_id;
     op->s = s;
 
     if (tx_id == XBT_NULL) {
@@ -605,8 +667,69 @@ int xs_impl_transaction_start(XenstoreImplState *s, unsigned int dom_id,
     return 0;
 }
 
+static gboolean tx_commit_walk(gpointer key, gpointer value,
+                               gpointer user_data)
+{
+    struct walk_op *op = user_data;
+    int path_len = strlen(op->path);
+    int key_len = strlen(key);
+    bool fire_parents = true;
+    XsWatch *watch;
+    XsNode *n = value;
+
+    if (n->ref != 1) {
+        return false;
+    }
+
+    if (n->deleted_in_tx) {
+        /*
+         * We first watches on our parents if we are the *first* node
+         * to be deleted (the topmost one). This matches the behaviour
+         * when deleting in the live tree.
+         */
+        fire_parents = !op->deleted_in_tx;
+
+        /* Only used on the way down so no need to clear it later */
+        op->deleted_in_tx = true;
+    }
+
+    assert(key_len + path_len + 2 <= sizeof(op->path));
+    op->path[path_len] = '/';
+    memcpy(op->path + path_len + 1, key, key_len + 1);
+
+    watch = g_hash_table_lookup(op->s->watches, op->path);
+    if (watch) {
+        op->watches = g_list_append(op->watches, watch);
+    }
+
+    if (n->children) {
+        g_hash_table_foreach_remove(n->children, tx_commit_walk, op);
+    }
+
+    if (watch) {
+        op->watches = g_list_remove(op->watches, watch);
+    }
+
+    /*
+     * Don't fire watches if this node was only copied because a
+     * descendent was changed. The modifieD_in_tx flag indicates the
+     * ones which were really changed.
+     */
+    if (n->modified_in_tx || n->deleted_in_tx) {
+        fire_watches(op, fire_parents);
+        n->modified_in_tx = false;
+    }
+    op->path[path_len] = '\0';
+
+    /* Deleted nodes really do get expunged when we commit */
+    return n->deleted_in_tx;
+}
+
 static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
 {
+    struct walk_op op;
+    XsNode **n;
+
     if (s->root_tx != tx->base_tx) {
         return EAGAIN;
     }
@@ -615,10 +738,18 @@ static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
     tx->root = NULL;
     s->root_tx = tx->tx_id;
 
+    init_walk_op(s, &op, XBT_NULL, tx->dom_id, "/", &n);
+    op.deleted_in_tx = false;
+    op.mutating = true;
+
     /*
-     * XX: Walk the new root and fire watches on any node which has a
+     * Walk the new root and fire watches on any node which has a
      * refcount of one (which is therefore unique to this transaction).
      */
+    if (s->root->children) {
+        g_hash_table_foreach_remove(s->root->children, tx_commit_walk, &op);
+    }
+
     return 0;
 }
 
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index d51677584f..307855e014 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -295,14 +295,21 @@ static void do_test_xs_node_tx(bool fail, bool commit)
     g_assert(!err);
     g_assert(!watches->len);
 
-    /* The transaction should fail */
+    /* Attempt to commit the transaction */
     err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, commit);
     if (commit && fail) {
         g_assert(err == EAGAIN);
     } else {
         g_assert(!err);
     }
-    g_assert(!watches->len);
+
+    if (commit && !fail) {
+        g_assert(!strcmp(watches->str,
+                         "some/relative/pathwatch"));
+        g_string_truncate(watches, 0);
+    } else {
+       g_assert(!watches->len);
+    }
 
     err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
                         watch_cb, watches);
@@ -340,6 +347,135 @@ static void test_xs_node_tx_succeed(void)
     do_test_xs_node_tx(false, true);
 }
 
+static void test_xs_node_tx_rm(void)
+{
+    XenstoreImplState *s = setup();
+    GString *watches = g_string_new(NULL);
+    GByteArray *data = g_byte_array_new();
+    unsigned int tx_id = XBT_NULL;
+    int err;
+
+    g_assert(s);
+
+    /* Set a watch */
+    err = xs_impl_watch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+    g_assert(watches->len == strlen("somewatch"));
+    g_assert(!strcmp(watches->str, "somewatch"));
+    g_string_truncate(watches, 0);
+
+    /* Write something */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                    "something");
+    g_assert(!err);
+    g_assert(!strcmp(watches->str,
+                     "some/deep/dark/relative/pathwatch"));
+    g_string_truncate(watches, 0);
+
+    /* Create a transaction */
+    err = xs_impl_transaction_start(s, DOMID_GUEST, &tx_id);
+    g_assert(!err);
+
+    /* Delete the tree in the transaction */
+    err = xs_impl_rm(s, DOMID_GUEST, tx_id, "some/deep/dark");
+    g_assert(!err);
+    g_assert(!watches->len);
+
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                       data);
+    g_assert(!err);
+    g_assert(data->len == strlen("something"));
+    g_assert(!memcmp(data->data, "something", data->len));
+    g_byte_array_set_size(data, 0);
+
+    /* Commit the transaction */
+    err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, true);
+    g_assert(!err);
+
+    g_assert(!strcmp(watches->str, "some/deep/darkwatch"));
+    g_string_truncate(watches, 0);
+
+    /* Now the node is gone */
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                       data);
+    g_assert(err == ENOENT);
+    g_byte_array_unref(data);
+
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+
+    g_string_free(watches, true);
+    xs_impl_delete(s);
+}
+
+static void test_xs_node_tx_resurrect(void)
+{
+    XenstoreImplState *s = setup();
+    GString *watches = g_string_new(NULL);
+    GByteArray *data = g_byte_array_new();
+    unsigned int tx_id = XBT_NULL;
+    int err;
+
+    g_assert(s);
+
+    /* Write something */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                    "something");
+    g_assert(!err);
+
+    /* This node will be wiped and resurrected */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/deep/dark",
+                    "foo");
+    g_assert(!err);
+
+    /* Set a watch */
+    err = xs_impl_watch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+    g_assert(watches->len == strlen("somewatch"));
+    g_assert(!strcmp(watches->str, "somewatch"));
+    g_string_truncate(watches, 0);
+
+    /* Create a transaction */
+    err = xs_impl_transaction_start(s, DOMID_GUEST, &tx_id);
+    g_assert(!err);
+
+    /* Delete the tree in the transaction */
+    err = xs_impl_rm(s, DOMID_GUEST, tx_id, "some/deep");
+    g_assert(!err);
+    g_assert(!watches->len);
+
+    /* Resurrect part of it */
+    err = write_str(s, DOMID_GUEST, tx_id, "some/deep/dark/different/path",
+                    "something");
+    g_assert(!err);
+
+    /* Commit the transaction */
+    err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, true);
+    g_assert(!err);
+
+    g_assert(!strcmp(watches->str,
+                     "some/deep/dark/different/pathwatch" /* lost data */
+                     "some/deep/dark/relativewatch" /* topmost deleted */
+                     "some/deep/darkwatch" /* lost data */));
+    g_string_truncate(watches, 0);
+
+    /* Now the node is gone */
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                       data);
+    g_assert(err == ENOENT);
+    g_byte_array_unref(data);
+
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+
+    g_string_free(watches, true);
+    xs_impl_delete(s);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -349,6 +485,8 @@ int main(int argc, char **argv)
     g_test_add_func("/xs_node/tx_abort", test_xs_node_tx_abort);
     g_test_add_func("/xs_node/tx_fail", test_xs_node_tx_fail);
     g_test_add_func("/xs_node/tx_succeed", test_xs_node_tx_succeed);
+    g_test_add_func("/xs_node/tx_rm", test_xs_node_tx_rm);
+    g_test_add_func("/xs_node/tx_resurrect", test_xs_node_tx_resurrect);
 
     return g_test_run();
 }
-- 
2.39.0


