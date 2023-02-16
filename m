Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4866E69905F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:47:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSapq-0000UL-0J; Thu, 16 Feb 2023 04:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSap1-00005X-MT
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:44:59 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSaoy-0006LD-84
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=datHZGJ32TDzWmhHHrb4QFGfIsfT6P4qRH8j9cl1hbk=; b=bnAPoYQcODey+5Vcg1a9o4z8xN
 Vk952em5bmnfg5GiXsKIBWjY/v0qQXg5Xy/gr8yDxoGFRD1Vq6txj3DE2QD8CGgTBbnyuKr+tA43d
 x7wAyW8yruhbRIbf/B5OFLyw+2XnWYvGlyjjaMrRC7Mjx6g0Wi83C+CWgT+L/mk/LmV2DLO0etoDs
 kO5yPFBRN1vTTpv9U5x5FxnESMBgvfHTMmN9z6K1uiB71PRGl4cK82SsE/s7olIU36fKsvZmpZg5i
 ox8Ive9ydBFPIMBs4Dai8H6dA2RO1GZPAWpbaI+bOkyFQjjLJ/l5cohMa2uEYUCh8WDX7z8jD3Gw1
 IZAApgbw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pSao2-00AEEv-1A; Thu, 16 Feb 2023 09:44:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSaoi-0090BH-1i; Thu, 16 Feb 2023 09:44:40 +0000
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
Subject: [RFC PATCH v11bis 02/26] hw/xen: Add basic XenStore tree walk and
 write/read/directory support
Date: Thu, 16 Feb 2023 09:44:12 +0000
Message-Id: <20230216094436.2144978-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216094436.2144978-1-dwmw2@infradead.org>
References: <20230216094436.2144978-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This is a fairly simple implementation of a copy-on-write tree.

The node walk function starts off at the root, with 'inplace == true'.
If it ever encounters a node with a refcount greater than one (including
the root node), then that node is shared with other trees, and cannot
be modified in place, so the inplace flag is cleared and we copy on
write from there on down.

Xenstore write has 'mkdir -p' semantics and will create the intermediate
nodes if they don't already exist, so in that case we flip the inplace
flag back to true as as populated the newly-created nodes.

We put a copy of the absolute path into the buffer in the struct walk_op,
with *two* NUL terminators at the end. As xs_node_walk() goes down the
tree, it replaces the next '/' separator with a NUL so that it can use
the 'child name' in place. The next recursion down then puts the '/'
back and repeats the exercise for the next path element... if it doesn't
hit that *second* NUL termination which indicates the true end of the
path.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xenstore_impl.c | 440 +++++++++++++++++++++++++++++++++++-
 tests/unit/meson.build      |   1 +
 tests/unit/test-xs-node.c   | 177 +++++++++++++++
 3 files changed, 611 insertions(+), 7 deletions(-)
 create mode 100644 tests/unit/test-xs-node.c

diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
index 31dbc98fe0..520883d172 100644
--- a/hw/i386/kvm/xenstore_impl.c
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -10,13 +10,384 @@
  */
 
 #include "qemu/osdep.h"
+#include "qom/object.h"
 
 #include "xen_xenstore.h"
 #include "xenstore_impl.h"
 
+#include "hw/xen/interface/io/xs_wire.h"
+
+#define TYPE_XS_NODE "xs-node"
+
+typedef struct XsNode {
+    uint32_t ref;
+    GByteArray *content;
+    GHashTable *children;
+    uint64_t gencnt;
+#ifdef XS_NODE_UNIT_TEST
+    gchar *name; /* debug only */
+#endif
+} XsNode;
+
+#define XS_MAX_WATCHES          128
+#define XS_MAX_DOMAIN_NODES     1000
+#define XS_MAX_NODE_SIZE        2048
+#define XS_MAX_TRANSACTIONS     10
+#define XS_MAX_PERMS_PER_NODE   5
+
 struct XenstoreImplState {
+    XsNode *root;
+};
+
+static inline XsNode *xs_node_new(void)
+{
+    XsNode *n = g_new0(XsNode, 1);
+    n->ref = 1;
+
+#ifdef XS_NODE_UNIT_TEST
+    nr_xs_nodes++;
+    xs_node_list = g_list_prepend(xs_node_list, n);
+#endif
+    return n;
+}
+
+static inline XsNode *xs_node_ref(XsNode *n)
+{
+    /* With just 10 transactions, it can never get anywhere near this. */
+    g_assert(n->ref < INT_MAX);
+
+    g_assert(n->ref);
+    n->ref++;
+    return n;
+}
+
+static inline void xs_node_unref(XsNode *n)
+{
+    if (!n) {
+        return;
+    }
+    g_assert(n->ref);
+    if (--n->ref) {
+        return;
+    }
+
+    if (n->content) {
+        g_byte_array_unref(n->content);
+    }
+    if (n->children) {
+        g_hash_table_unref(n->children);
+    }
+#ifdef XS_NODE_UNIT_TEST
+    g_free(n->name);
+    nr_xs_nodes--;
+    xs_node_list = g_list_remove(xs_node_list, n);
+#endif
+    g_free(n);
+}
+
+/* For copying from one hash table to another using g_hash_table_foreach() */
+static void do_insert(gpointer key, gpointer value, gpointer user_data)
+{
+    g_hash_table_insert(user_data, g_strdup(key), xs_node_ref(value));
+}
+
+static XsNode *xs_node_copy(XsNode *old)
+{
+    XsNode *n = xs_node_new();
+
+    n->gencnt = old->gencnt;
+    if (old->children) {
+        n->children = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+                                            (GDestroyNotify)xs_node_unref);
+        g_hash_table_foreach(old->children, do_insert, n->children);
+    }
+    if (old && old->content) {
+        n->content = g_byte_array_ref(old->content);
+    }
+    return n;
+}
+
+/* Returns true if it made a change to the hash table */
+static bool xs_node_add_child(XsNode *n, const char *path_elem, XsNode *child)
+{
+    assert(!strchr(path_elem, '/'));
+
+    if (!child) {
+        assert(n->children);
+        return g_hash_table_remove(n->children, path_elem);
+    }
+
+#ifdef XS_NODE_UNIT_TEST
+    g_free(child->name);
+    child->name = g_strdup(path_elem);
+#endif
+    if (!n->children) {
+        n->children = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+                                            (GDestroyNotify)xs_node_unref);
+    }
+
+    /*
+     * The documentation for g_hash_table_insert() says that it "returns a
+     * boolean value to indicate whether the newly added value was already
+     * in the hash table or not."
+     *
+     * It could perhaps be clearer that returning TRUE means it wasn't,
+     */
+    return g_hash_table_insert(n->children, g_strdup(path_elem), child);
+}
+
+struct walk_op {
+    struct XenstoreImplState *s;
+    char path[XENSTORE_ABS_PATH_MAX + 2]; /* Two NUL terminators */
+    int (*op_fn)(XsNode **n, struct walk_op *op);
+    void *op_opaque;
+    void *op_opaque2;
+
+    unsigned int dom_id;
+
+    /*
+     * This is maintained on the way *down* the walk to indicate
+     * whether nodes can be modified in place or whether COW is
+     * required. It starts off being true, as we're always going to
+     * replace the root node. If we walk into a shared subtree it
+     * becomes false. If we start *creating* new nodes for a write,
+     * it becomes true again.
+     *
+     * Do not use it on the way back up.
+     */
+    bool inplace;
+    bool mutating;
+    bool create_dirs;
 };
 
+static int xs_node_add_content(XsNode **n, struct walk_op *op)
+{
+    /* We *are* the node to be written. Either this or a copy. */
+    if (!op->inplace) {
+        XsNode *old = *n;
+        *n = xs_node_copy(old);
+        xs_node_unref(old);
+    }
+
+    if ((*n)->content) {
+        g_byte_array_unref((*n)->content);
+    }
+    (*n)->content = g_byte_array_ref(op->op_opaque);
+    return 0;
+}
+
+static int xs_node_get_content(XsNode **n, struct walk_op *op)
+{
+    GByteArray *data = op->op_opaque;
+    GByteArray *node_data;
+
+    assert(op->inplace);
+    assert(*n);
+
+    node_data = (*n)->content;
+    if (node_data) {
+        g_byte_array_append(data, node_data->data, node_data->len);
+    }
+
+    return 0;
+}
+
+static int xs_node_rm(XsNode **n, struct walk_op *op)
+{
+    bool this_inplace = op->inplace;
+
+    if (this_inplace) {
+        xs_node_unref(*n);
+    }
+    *n = NULL;
+    return 0;
+}
+
+/*
+ * Passed a full reference in *n which it may free if it needs to COW.
+ *
+ * When changing the tree, the op->inplace flag indicates whether this
+ * node may be modified in place (i.e. it and all its parents had a
+ * refcount of one). If walking down the tree we find a node whose
+ * refcount is higher, we must clear op->inplace and COW from there
+ * down. Unless we are creating new nodes as scaffolding for a write
+ * (which works like 'mkdir -p' does). In which case those newly
+ * created nodes can (and must) be modified in place again.
+ */
+static int xs_node_walk(XsNode **n, struct walk_op *op)
+{
+    char *child_name = NULL;
+    size_t namelen;
+    XsNode *old = *n, *child = NULL;
+    bool stole_child = false;
+    bool this_inplace;
+    int err;
+
+    namelen = strlen(op->path);
+
+    /* Is there a child, or do we hit the double-NUL termination? */
+    if (op->path[namelen + 1]) {
+        char *slash;
+        child_name = op->path + namelen + 1;
+        slash = strchr(child_name, '/');
+        if (slash) {
+            *slash = '\0';
+        }
+        op->path[namelen] = '/';
+    }
+
+    /* If we walk into a subtree which is shared, we must COW */
+    if (op->mutating && old->ref != 1) {
+        op->inplace = false;
+    }
+
+    if (!child_name) {
+        /* This is the actual node on which the operation shall be performed */
+        err = op->op_fn(n, op);
+        goto out;
+    }
+
+    /* op->inplace will be further modified during the recursion */
+    this_inplace = op->inplace;
+
+    if (old && old->children) {
+        child = g_hash_table_lookup(old->children, child_name);
+        /* This is a *weak* reference to 'child', owned by the hash table */
+    }
+
+    if (child) {
+        xs_node_ref(child);
+        /*
+         * Now we own it too. But if we can modify inplace, that's going to
+         * foil the check and force it to COW. We want to be the *only* owner
+         * so that it can be modified in place, so remove it from the hash
+         * table in that case. We'll add it (or its replacement) back later.
+         */
+        if (op->mutating && this_inplace) {
+            g_hash_table_remove(old->children, child_name);
+            stole_child = true;
+        }
+    } else if (op->create_dirs) {
+        child = xs_node_new();
+        /*
+         * If we're creating a new child, we can clearly modify it (and its
+         * children) in place from here on down.
+         */
+        op->inplace = true;
+    } else {
+        err = ENOENT;
+        goto out;
+    }
+
+    /*
+     * Except for the temporary child-stealing as noted, our node has not
+     * changed yet. We don't yet know the overall operation will complete.
+     */
+    err = xs_node_walk(&child, op);
+    if (err || !op->mutating) {
+        if (stole_child) {
+            /* Put it back as it was. */
+            g_hash_table_replace(old->children, g_strdup(child_name), child);
+        } else {
+            xs_node_unref(child);
+        }
+        goto out;
+    }
+
+    /*
+     * Now we know the operation has completed successfully and we're on
+     * the way back up. Make the change, substituting 'child' in the
+     * node at our level.
+     */
+    if (!this_inplace) {
+        *n = xs_node_copy(old);
+        xs_node_unref(old);
+    }
+
+    /*
+     * The child may be NULL here, for a remove operation. Either way,
+     * xs_node_add_child() will do the right thing and return a value
+     * indicating whether it changed the parent's hash table or not.
+     *
+     * We bump the parent gencnt if it adds a child that we *didn't*
+     * steal from it in the first place, or if child==NULL and was
+     * thus removed (whether we stole it earlier and didn't put it
+     * back, or xs_node_add_child() actually removed it now).
+     */
+    if ((xs_node_add_child(*n, child_name, child) && !stole_child) || !child) {
+        (*n)->gencnt++;
+    }
+
+ out:
+    op->path[namelen] = '\0';
+    return err;
+}
+
+static void append_directory_item(gpointer key, gpointer value,
+                                  gpointer user_data)
+{
+    GList **items = user_data;
+
+    *items = g_list_insert_sorted(*items, g_strdup(key), (GCompareFunc)strcmp);
+}
+
+/* Populates items with char * names which caller must free. */
+static int xs_node_directory(XsNode **n, struct walk_op *op)
+{
+    GList **items = op->op_opaque;
+
+    assert(op->inplace);
+    assert(*n);
+
+    if ((*n)->children) {
+        g_hash_table_foreach((*n)->children, append_directory_item, items);
+    }
+
+    if (op->op_opaque2) {
+        *(uint64_t *)op->op_opaque2 = (*n)->gencnt;
+    }
+
+    return 0;
+}
+
+static int init_walk_op(XenstoreImplState *s, struct walk_op *op,
+                        xs_transaction_t tx_id, unsigned int dom_id,
+                        const char *path, XsNode ***rootp)
+{
+    if (path[0] == '/') {
+        if (strlen(path) > XENSTORE_ABS_PATH_MAX) {
+            return E2BIG;
+        }
+        snprintf(op->path, sizeof(op->path), "%s", path);
+    } else {
+        if (strlen(path) > XENSTORE_REL_PATH_MAX) {
+            return E2BIG;
+        }
+        snprintf(op->path, sizeof(op->path), "/local/domain/%u/%s", dom_id,
+                 path);
+    }
+    /*
+     * We use *two* NUL terminators at the end of the path, as during the walk
+     * we will temporarily turn each '/' into a NUL to allow us to use that
+     * path element for the lookup.
+     */
+    op->path[strlen(op->path) + 1] = '\0';
+    op->path[0] = '\0';
+    op->inplace = true;
+    op->mutating = false;
+    op->create_dirs = false;
+    op->dom_id = dom_id;
+    op->s = s;
+
+    if (tx_id == XBT_NULL) {
+        *rootp = &s->root;
+    } else {
+        return ENOENT;
+    }
+
+    return 0;
+}
+
 int xs_impl_read(XenstoreImplState *s, unsigned int dom_id,
                  xs_transaction_t tx_id, const char *path, GByteArray *data)
 {
@@ -24,7 +395,17 @@ int xs_impl_read(XenstoreImplState *s, unsigned int dom_id,
      * The data GByteArray shall exist, and will be freed by caller.
      * Just g_byte_array_append() to it.
      */
-    return ENOENT;
+    struct walk_op op;
+    XsNode **n;
+    int ret;
+
+    ret = init_walk_op(s, &op, tx_id, dom_id, path, &n);
+    if (ret) {
+        return ret;
+    }
+    op.op_fn = xs_node_get_content;
+    op.op_opaque = data;
+    return xs_node_walk(n, &op);
 }
 
 int xs_impl_write(XenstoreImplState *s, unsigned int dom_id,
@@ -32,9 +413,21 @@ int xs_impl_write(XenstoreImplState *s, unsigned int dom_id,
 {
     /*
      * The data GByteArray shall exist, will be freed by caller. You are
-     * free to use g_byte_array_steal() and keep the data.
+     * free to use g_byte_array_steal() and keep the data. Or just ref it.
      */
-    return ENOSYS;
+    struct walk_op op;
+    XsNode **n;
+    int ret;
+
+    ret = init_walk_op(s, &op, tx_id, dom_id, path, &n);
+    if (ret) {
+        return ret;
+    }
+    op.op_fn = xs_node_add_content;
+    op.op_opaque = data;
+    op.mutating = true;
+    op.create_dirs = true;
+    return xs_node_walk(n, &op);
 }
 
 int xs_impl_directory(XenstoreImplState *s, unsigned int dom_id,
@@ -46,7 +439,18 @@ int xs_impl_directory(XenstoreImplState *s, unsigned int dom_id,
      * immediately so if you want to change it to (const char *) and keep
      * them, go ahead and change the caller.
      */
-    return ENOENT;
+    struct walk_op op;
+    XsNode **n;
+    int ret;
+
+    ret = init_walk_op(s, &op, tx_id, dom_id, path, &n);
+    if (ret) {
+        return ret;
+    }
+    op.op_fn = xs_node_directory;
+    op.op_opaque = items;
+    op.op_opaque2 = gencnt;
+    return xs_node_walk(n, &op);
 }
 
 int xs_impl_transaction_start(XenstoreImplState *s, unsigned int dom_id,
@@ -64,7 +468,17 @@ int xs_impl_transaction_end(XenstoreImplState *s, unsigned int dom_id,
 int xs_impl_rm(XenstoreImplState *s, unsigned int dom_id,
                xs_transaction_t tx_id, const char *path)
 {
-    return ENOSYS;
+    struct walk_op op;
+    XsNode **n;
+    int ret;
+
+    ret = init_walk_op(s, &op, tx_id, dom_id, path, &n);
+    if (ret) {
+        return ret;
+    }
+    op.op_fn = xs_node_rm;
+    op.mutating = true;
+    return xs_node_walk(n, &op);
 }
 
 int xs_impl_get_perms(XenstoreImplState *s, unsigned int dom_id,
@@ -102,16 +516,28 @@ int xs_impl_unwatch(XenstoreImplState *s, unsigned int dom_id,
                     const char *path, const char *token,
                     xs_impl_watch_fn fn, void *opaque)
 {
-    /* Remove the watch that matches all four criteria */
+    /*
+     * When calling the callback @fn, note that the path should
+     * precisely match the relative path that the guest provided, even
+     * if it was a relative path which needed to be prefixed with
+     * /local/domain/${domid}/
+     */
     return ENOSYS;
 }
 
 int xs_impl_reset_watches(XenstoreImplState *s, unsigned int dom_id)
 {
+    /* Remove the watch that matches all four criteria */
     return ENOSYS;
 }
 
 XenstoreImplState *xs_impl_create(void)
 {
-    return g_new0(XenstoreImplState, 1);
+    XenstoreImplState *s = g_new0(XenstoreImplState, 1);
+
+    s->root = xs_node_new();
+#ifdef XS_NODE_UNIT_TEST
+    s->root->name = g_strdup("/");
+#endif
+    return s;
 }
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index ffa444f432..ee54b3c3eb 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -48,6 +48,7 @@ tests = {
   'test-qapi-util': [],
   'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
   'test-interval-tree': [],
+  'test-xs-node': [qom],
 }
 
 if have_system or have_tools
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
new file mode 100644
index 0000000000..07b8f0ba51
--- /dev/null
+++ b/tests/unit/test-xs-node.c
@@ -0,0 +1,177 @@
+/*
+ * QEMU XenStore XsNode testing
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+
+static int nr_xs_nodes;
+static GList *xs_node_list;
+
+#define XS_NODE_UNIT_TEST
+#include "hw/i386/kvm/xenstore_impl.c"
+
+#define DOMID_QEMU 0
+#define DOMID_GUEST 1
+
+/* This doesn't happen in qemu but we want to make valgrind happy */
+static void xs_impl_delete(XenstoreImplState *s)
+{
+    xs_node_unref(s->root);
+    g_free(s);
+
+    if (xs_node_list) {
+        GList *l;
+        for (l = xs_node_list; l; l = l->next) {
+            XsNode *n = l->data;
+            printf("Remaining node at %p name %s ref %u\n", n, n->name,
+                   n->ref);
+        }
+    }
+    g_assert(!nr_xs_nodes);
+}
+
+static int write_str(XenstoreImplState *s, unsigned int dom_id,
+                          unsigned int tx_id, const char *path,
+                          const char *content)
+{
+    GByteArray *d = g_byte_array_new();
+    int err;
+
+    g_byte_array_append(d, (void *)content, strlen(content));
+    err = xs_impl_write(s, dom_id, tx_id, path, d);
+    g_byte_array_unref(d);
+    return err;
+}
+
+static XenstoreImplState *setup(void)
+{
+   XenstoreImplState *s = xs_impl_create();
+   char *abspath;
+   int err;
+
+   abspath = g_strdup_printf("/local/domain/%u", DOMID_GUEST);
+
+   err = write_str(s, DOMID_QEMU, XBT_NULL, abspath, "");
+   g_assert(!err);
+
+   g_free(abspath);
+
+   abspath = g_strdup_printf("/local/domain/%u/some", DOMID_GUEST);
+
+   err = write_str(s, DOMID_QEMU, XBT_NULL, abspath, "");
+   g_assert(!err);
+
+   g_free(abspath);
+
+   return s;
+}
+
+static void test_xs_node_simple(void)
+{
+    GByteArray *data = g_byte_array_new();
+    XenstoreImplState *s = setup();
+    GList *items = NULL;
+    XsNode *old_root;
+    uint64_t gencnt;
+    int err;
+
+    g_assert(s);
+
+    /* Read gives ENOENT when it should */
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "foo", data);
+    g_assert(err == ENOENT);
+
+    /* Write works */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative/path",
+                    "something");
+    g_assert(!err);
+
+    /* Read gives back what we wrote */
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative/path", data);
+    g_assert(!err);
+    g_assert(data->len == strlen("something"));
+    g_assert(!memcmp(data->data, "something", data->len));
+
+    /* Even if we use an abolute path */
+    g_byte_array_set_size(data, 0);
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL,
+                       "/local/domain/1/some/relative/path", data);
+    g_assert(!err);
+    g_assert(data->len == strlen("something"));
+
+    /* Keep a copy, to force COW mode */
+    old_root = xs_node_ref(s->root);
+
+    /* Write works again */
+    err = write_str(s, DOMID_GUEST, XBT_NULL,
+                    "/local/domain/1/some/relative/path2",
+                    "something else");
+    g_assert(!err);
+
+    /* Overwrite an existing node */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative/path",
+                    "another thing");
+    g_assert(!err);
+
+    /* We can list the two files we wrote */
+    err = xs_impl_directory(s, DOMID_GUEST, XBT_NULL, "some/relative", &gencnt,
+                            &items);
+    g_assert(!err);
+    g_assert(items);
+    g_assert(gencnt == 2);
+    g_assert(!strcmp(items->data, "path"));
+    g_assert(items->next);
+    g_assert(!strcmp(items->next->data, "path2"));
+    g_assert(!items->next->next);
+    g_list_free_full(items, g_free);
+
+    /* Write somewhere else which already existed */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative", "moredata");
+    g_assert(!err);
+
+    g_byte_array_set_size(data, 0);
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative", data);
+    g_assert(!err);
+    g_assert(data->len == strlen("moredata"));
+    g_assert(!memcmp(data->data, "moredata", data->len));
+
+    /* Overwrite existing data */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative", "otherdata");
+    g_assert(!err);
+
+    g_byte_array_set_size(data, 0);
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative", data);
+    g_assert(!err);
+    g_assert(data->len == strlen("otherdata"));
+    g_assert(!memcmp(data->data, "otherdata", data->len));
+
+    /* Remove the subtree */
+    err = xs_impl_rm(s, DOMID_GUEST, XBT_NULL, "some/relative");
+    g_assert(!err);
+
+    g_byte_array_set_size(data, 0);
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative", data);
+    g_assert(err == ENOENT);
+    g_byte_array_unref(data);
+
+    xs_node_unref(old_root);
+    xs_impl_delete(s);
+}
+
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    module_call_init(MODULE_INIT_QOM);
+
+    g_test_add_func("/xs_node/simple", test_xs_node_simple);
+
+    return g_test_run();
+}
-- 
2.39.0


