Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC03699060
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:47:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSapD-0000Ac-83; Thu, 16 Feb 2023 04:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSap2-00007P-PJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:00 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSaoy-0006LA-6I
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=w3VV1AeqTmNEzpD2Gof9YjiIkZBpbVHvGh10w/AT8BU=; b=jkBC/B4GrRQG+f8OgqH5Sk/Tkv
 lPoR6N4Zkpg6xP813ShEkGk9C1jH5iVoyUULLHlXok+JvxFdMe5ul4Knn65xtwdNQg4Idcg6YfWp+
 Z3A6eFTnjkwnLV0u9uOWUzYk2dJrR5UoeBNKp7hJtlLDBJNuzo8MiNuyHofEXjQkpvPhIcgiQ+bpq
 CVX346zboUaqhQTQl91SFeEMARaIPqS4+F7Qfc7KxzmcTR23RjuWzyYZzmhgsbgI6ow0SWmtTNbFO
 2YlY9/dUC2M6vAaR9/Ov7NdmwHcQ5liUROsy3OPltwgsxuUN+a0s3iYcQ4ftPVE65KWXtYp0tYRGU
 O7CkQFNw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pSao2-00AEEw-1N; Thu, 16 Feb 2023 09:44:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSaoi-0090BM-1v; Thu, 16 Feb 2023 09:44:40 +0000
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
Subject: [RFC PATCH v11bis 03/26] hw/xen: Implement XenStore watches
Date: Thu, 16 Feb 2023 09:44:13 +0000
Message-Id: <20230216094436.2144978-4-dwmw2@infradead.org>
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

Starts out fairly simple: a hash table of watches based on the path.

Except there can be multiple watches on the same path, so the watch ends
up being a simple linked list, and the head of that list is in the hash
table. Which makes removal a bit of a PITA but it's not so bad; we just
special-case "I had to remove the head of the list and now I have to
replace it in / remove it from the hash table". And if we don't remove
the head, it's a simple linked-list operation.

We do need to fire watches on *deleted* nodes, so instead of just a simple
xs_node_unref() on the topmost victim, we need to recurse down and fire
watches on them all.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xenstore_impl.c | 294 +++++++++++++++++++++++++++++++++---
 tests/unit/test-xs-node.c   |  80 ++++++++++
 2 files changed, 355 insertions(+), 19 deletions(-)

diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
index 520883d172..e7bbe3deee 100644
--- a/hw/i386/kvm/xenstore_impl.c
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -19,6 +19,12 @@
 
 #define TYPE_XS_NODE "xs-node"
 
+#define XS_MAX_WATCHES          128
+#define XS_MAX_DOMAIN_NODES     1000
+#define XS_MAX_NODE_SIZE        2048
+#define XS_MAX_TRANSACTIONS     10
+#define XS_MAX_PERMS_PER_NODE   5
+
 typedef struct XsNode {
     uint32_t ref;
     GByteArray *content;
@@ -29,14 +35,18 @@ typedef struct XsNode {
 #endif
 } XsNode;
 
-#define XS_MAX_WATCHES          128
-#define XS_MAX_DOMAIN_NODES     1000
-#define XS_MAX_NODE_SIZE        2048
-#define XS_MAX_TRANSACTIONS     10
-#define XS_MAX_PERMS_PER_NODE   5
+typedef struct XsWatch {
+    struct XsWatch *next;
+    xs_impl_watch_fn *cb;
+    void *cb_opaque;
+    char *token;
+    unsigned int dom_id;
+    int rel_prefix;
+} XsWatch;
 
 struct XenstoreImplState {
     XsNode *root;
+    GHashTable *watches;
 };
 
 static inline XsNode *xs_node_new(void)
@@ -143,6 +153,7 @@ struct walk_op {
     void *op_opaque;
     void *op_opaque2;
 
+    GList *watches;
     unsigned int dom_id;
 
     /*
@@ -160,6 +171,35 @@ struct walk_op {
     bool create_dirs;
 };
 
+static void fire_watches(struct walk_op *op, bool parents)
+{
+    GList *l = NULL;
+    XsWatch *w;
+
+    if (!op->mutating) {
+        return;
+    }
+
+    if (parents) {
+        l = op->watches;
+    }
+
+    w = g_hash_table_lookup(op->s->watches, op->path);
+    while (w || l) {
+        if (!w) {
+            /* Fire the parent nodes from 'op' if asked to */
+            w = l->data;
+            l = l->next;
+            continue;
+        }
+
+        assert(strlen(op->path) > w->rel_prefix);
+        w->cb(w->cb_opaque, op->path + w->rel_prefix, w->token);
+
+        w = w->next;
+    }
+}
+
 static int xs_node_add_content(XsNode **n, struct walk_op *op)
 {
     /* We *are* the node to be written. Either this or a copy. */
@@ -192,10 +232,51 @@ static int xs_node_get_content(XsNode **n, struct walk_op *op)
     return 0;
 }
 
+static int node_rm_recurse(gpointer key, gpointer value, gpointer user_data)
+{
+    struct walk_op *op = user_data;
+    int path_len = strlen(op->path);
+    int key_len = strlen(key);
+    XsNode *n = value;
+    bool this_inplace = op->inplace;
+
+    if (n->ref != 1) {
+        op->inplace = 0;
+    }
+
+    assert(key_len + path_len + 2 <= sizeof(op->path));
+    op->path[path_len] = '/';
+    memcpy(op->path + path_len + 1, key, key_len + 1);
+
+    if (n->children) {
+        g_hash_table_foreach_remove(n->children, node_rm_recurse, op);
+    }
+    /*
+     * Fire watches on *this* node but not the parents because they are
+     * going to be deleted too, so the watch will fire for them anyway.
+     */
+    fire_watches(op, false);
+    op->path[path_len] = '\0';
+
+
+    /*
+     * Actually deleting the child here is just an optimisation; if we
+     * don't then the final unref on the topmost victim will just have
+     * to cascade down again repeating all the g_hash_table_foreach()
+     * calls.
+     */
+    return this_inplace;
+}
+
 static int xs_node_rm(XsNode **n, struct walk_op *op)
 {
     bool this_inplace = op->inplace;
 
+    /* Fire watches for any node in the subtree which gets deleted. */
+    if ((*n)->children) {
+        g_hash_table_foreach_remove((*n)->children, node_rm_recurse, op);
+    }
+
     if (this_inplace) {
         xs_node_unref(*n);
     }
@@ -221,9 +302,11 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
     XsNode *old = *n, *child = NULL;
     bool stole_child = false;
     bool this_inplace;
+    XsWatch *watch;
     int err;
 
     namelen = strlen(op->path);
+    watch = g_hash_table_lookup(op->s->watches, op->path);
 
     /* Is there a child, or do we hit the double-NUL termination? */
     if (op->path[namelen + 1]) {
@@ -244,6 +327,9 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
     if (!child_name) {
         /* This is the actual node on which the operation shall be performed */
         err = op->op_fn(n, op);
+        if (!err) {
+            fire_watches(op, true);
+        }
         goto out;
     }
 
@@ -279,11 +365,24 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
         goto out;
     }
 
+    /*
+     * If there's a watch on this node, add it to the list to be fired
+     * (with the correct full pathname for the modified node) at the end.
+     */
+    if (watch) {
+        op->watches = g_list_append(op->watches, watch);
+    }
+
     /*
      * Except for the temporary child-stealing as noted, our node has not
      * changed yet. We don't yet know the overall operation will complete.
      */
     err = xs_node_walk(&child, op);
+
+    if (watch) {
+        op->watches = g_list_remove(op->watches, watch);
+    }
+
     if (err || !op->mutating) {
         if (stole_child) {
             /* Put it back as it was. */
@@ -320,6 +419,9 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
 
  out:
     op->path[namelen] = '\0';
+    if (!namelen) {
+        assert(!op->watches);
+    }
     return err;
 }
 
@@ -372,6 +474,7 @@ static int init_walk_op(XenstoreImplState *s, struct walk_op *op,
      * path element for the lookup.
      */
     op->path[strlen(op->path) + 1] = '\0';
+    op->watches = NULL;
     op->path[0] = '\0';
     op->inplace = true;
     op->mutating = false;
@@ -503,38 +606,191 @@ int xs_impl_set_perms(XenstoreImplState *s, unsigned int dom_id,
 int xs_impl_watch(XenstoreImplState *s, unsigned int dom_id, const char *path,
                   const char *token, xs_impl_watch_fn fn, void *opaque)
 {
-    /*
-     * When calling the callback @fn, note that the path should
-     * precisely match the relative path that the guest provided, even
-     * if it was a relative path which needed to be prefixed with
-     * /local/domain/${domid}/
-     */
-    return ENOSYS;
+    const char *effective_path;
+    char *fullpath = NULL; /* Allocated copy */
+    XsWatch *w, *l;
+
+    if (path[0] == '/') {
+        if (strlen(path) > XENSTORE_ABS_PATH_MAX) {
+            return E2BIG;
+        }
+        effective_path = path;
+    } else {
+        if (strlen(path) > XENSTORE_REL_PATH_MAX) {
+            return E2BIG;
+        }
+        effective_path = fullpath = g_strdup_printf("/local/domain/%u/%s",
+                                                    dom_id, path);
+    }
+
+    w = g_new0(XsWatch, 1);
+    w->token = g_strdup(token);
+    w->cb = fn;
+    w->cb_opaque = opaque;
+    w->dom_id = dom_id;
+    w->rel_prefix = strlen(effective_path) - strlen(path);
+
+    l = g_hash_table_lookup(s->watches, effective_path);
+    if (l) {
+        w->next = l->next;
+        l->next = w;
+    } else {
+        if (!fullpath) {
+            fullpath = g_strdup(path);
+        }
+        g_hash_table_insert(s->watches, fullpath, w);
+        fullpath = NULL; /* Don't free; hash owns it */
+    }
+    g_free(fullpath);
+    fn(opaque, path, token);
+    return 0;
+}
+
+static XsWatch *free_watch(XsWatch *w)
+{
+    XsWatch *next = w->next;
+
+    g_free(w->token);
+    g_free(w);
+
+    return next;
 }
 
 int xs_impl_unwatch(XenstoreImplState *s, unsigned int dom_id,
                     const char *path, const char *token,
                     xs_impl_watch_fn fn, void *opaque)
 {
+    const char *effective_path;
+    char *fullpath = NULL; /* Allocated copy */
+    XsWatch *w, **l;
+
+    if (path[0] == '/') {
+        if (strlen(path) > XENSTORE_ABS_PATH_MAX) {
+            return E2BIG;
+        }
+        effective_path = path;
+    } else {
+        if (strlen(path) > XENSTORE_REL_PATH_MAX) {
+            return E2BIG;
+        }
+        effective_path = fullpath = g_strdup_printf("/local/domain/%u/%s",
+                                                    dom_id, path);
+    }
+
+    w = g_hash_table_lookup(s->watches, effective_path);
+    if (!w) {
+        g_free(fullpath);
+        return ENOENT;
+    }
+
     /*
-     * When calling the callback @fn, note that the path should
-     * precisely match the relative path that the guest provided, even
-     * if it was a relative path which needed to be prefixed with
-     * /local/domain/${domid}/
+     * The hash table contains the first element of a list of
+     * watches. Removing the first element in the list is a
+     * special case because we have to update the hash table to
+     * point to the next (or remove it if there's nothing left).
      */
-    return ENOSYS;
+    if (!g_strcmp0(token, w->token) && fn == w->cb && opaque == w->cb_opaque &&
+        dom_id == w->dom_id) {
+        if (w->next) {
+            /* Insert the previous 'next' into the hash table */
+            if (!fullpath) {
+                fullpath = g_strdup(path);
+            }
+            g_hash_table_insert(s->watches, fullpath, w->next);
+            fullpath = NULL;
+        } else {
+            /* Nothing left; remove from hash table */
+            g_hash_table_remove(s->watches, effective_path);
+            g_free(fullpath);
+        }
+        free_watch(w);
+        return 0;
+    }
+
+    /*
+     * We're all done messing with the hash table because the element
+     * it points to has survived the cull. Now it's just a simple
+     * linked list removal operation.
+     */
+    g_free(fullpath);
+
+    for (l = &w->next; *l; l = &w->next) {
+        w = *l;
+
+        if (!g_strcmp0(token, w->token) && fn == w->cb &&
+            opaque != w->cb_opaque && dom_id == w->dom_id) {
+            *l = free_watch(w);
+            return 0;
+        }
+    }
+
+    return ENOENT;
 }
 
 int xs_impl_reset_watches(XenstoreImplState *s, unsigned int dom_id)
 {
-    /* Remove the watch that matches all four criteria */
-    return ENOSYS;
+    char **watch_paths;
+    guint nr_watch_paths;
+    guint i;
+
+    watch_paths = (char **)g_hash_table_get_keys_as_array(s->watches,
+                                                          &nr_watch_paths);
+
+    for (i = 0; i < nr_watch_paths; i++) {
+        XsWatch *w1 = g_hash_table_lookup(s->watches, watch_paths[i]);
+        XsWatch *w2, *w, **l;
+
+        /*
+         * w1 is the original list. The hash table has this pointer.
+         * w2 is the head of our newly-filtered list.
+         * w and l are temporary for processing. w is somewhat redundant
+         * with *l but makes my eyes bleed less.
+         */
+
+        w = w2 = w1;
+        l = &w;
+        while (w) {
+            if (w->dom_id == dom_id) {
+                /* If we're freeing the head of the list, bump w2 */
+                if (w2 == w) {
+                    w2 = w->next;
+                }
+                *l = free_watch(w);
+            } else {
+                l = &w->next;
+            }
+            w = *l;
+        }
+        /*
+         * If the head of the list survived the cull, we don't need to
+         * touch the hash table and we're done with this path. Else...
+         */
+        if (w1 != w2) {
+            g_hash_table_steal(s->watches, watch_paths[i]);
+
+            /*
+             * It was already freed. (Don't worry, this whole thing is
+             * single-threaded and nobody saw it in the meantime). And
+             * having *stolen* it, we now own the watch_paths[i] string
+             * so if we don't give it back to the hash table, we need
+             * to free it.
+             */
+            if (w2) {
+                g_hash_table_insert(s->watches, watch_paths[i], w2);
+            } else {
+                g_free(watch_paths[i]);
+            }
+        }
+    }
+    g_free(watch_paths);
+    return 0;
 }
 
 XenstoreImplState *xs_impl_create(void)
 {
     XenstoreImplState *s = g_new0(XenstoreImplState, 1);
 
+    s->watches = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
     s->root = xs_node_new();
 #ifdef XS_NODE_UNIT_TEST
     s->root->name = g_strdup("/");
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index 07b8f0ba51..fb7f12aaa1 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -23,6 +23,7 @@ static GList *xs_node_list;
 /* This doesn't happen in qemu but we want to make valgrind happy */
 static void xs_impl_delete(XenstoreImplState *s)
 {
+    g_hash_table_unref(s->watches);
     xs_node_unref(s->root);
     g_free(s);
 
@@ -50,6 +51,14 @@ static int write_str(XenstoreImplState *s, unsigned int dom_id,
     return err;
 }
 
+static void watch_cb(void *_str, const char *path, const char *token)
+{
+    GString *str = _str;
+
+    g_string_append(str, path);
+    g_string_append(str, token);
+}
+
 static XenstoreImplState *setup(void)
 {
    XenstoreImplState *s = xs_impl_create();
@@ -77,6 +86,8 @@ static void test_xs_node_simple(void)
 {
     GByteArray *data = g_byte_array_new();
     XenstoreImplState *s = setup();
+    GString *guest_watches = g_string_new(NULL);
+    GString *qemu_watches = g_string_new(NULL);
     GList *items = NULL;
     XsNode *old_root;
     uint64_t gencnt;
@@ -84,6 +95,20 @@ static void test_xs_node_simple(void)
 
     g_assert(s);
 
+    err = xs_impl_watch(s, DOMID_GUEST, "some", "guestwatch",
+                        watch_cb, guest_watches);
+    g_assert(!err);
+    g_assert(guest_watches->len == strlen("someguestwatch"));
+    g_assert(!strcmp(guest_watches->str, "someguestwatch"));
+    g_string_truncate(guest_watches, 0);
+
+    err = xs_impl_watch(s, 0, "/local/domain/1/some", "qemuwatch",
+                        watch_cb, qemu_watches);
+    g_assert(!err);
+    g_assert(qemu_watches->len == strlen("/local/domain/1/someqemuwatch"));
+    g_assert(!strcmp(qemu_watches->str, "/local/domain/1/someqemuwatch"));
+    g_string_truncate(qemu_watches, 0);
+
     /* Read gives ENOENT when it should */
     err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "foo", data);
     g_assert(err == ENOENT);
@@ -92,6 +117,14 @@ static void test_xs_node_simple(void)
     err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative/path",
                     "something");
     g_assert(!err);
+    g_assert(!strcmp(guest_watches->str,
+                     "some/relative/pathguestwatch"));
+    g_assert(!strcmp(qemu_watches->str,
+                     "/local/domain/1/some/relative/pathqemuwatch"));
+
+    g_string_truncate(qemu_watches, 0);
+    g_string_truncate(guest_watches, 0);
+    xs_impl_reset_watches(s, 0);
 
     /* Read gives back what we wrote */
     err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative/path", data);
@@ -106,6 +139,8 @@ static void test_xs_node_simple(void)
     g_assert(!err);
     g_assert(data->len == strlen("something"));
 
+    g_assert(!qemu_watches->len);
+    g_assert(!guest_watches->len);
     /* Keep a copy, to force COW mode */
     old_root = xs_node_ref(s->root);
 
@@ -114,11 +149,17 @@ static void test_xs_node_simple(void)
                     "/local/domain/1/some/relative/path2",
                     "something else");
     g_assert(!err);
+    g_assert(!qemu_watches->len);
+    g_assert(!strcmp(guest_watches->str, "some/relative/path2guestwatch"));
+    g_string_truncate(guest_watches, 0);
 
     /* Overwrite an existing node */
     err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative/path",
                     "another thing");
     g_assert(!err);
+    g_assert(!qemu_watches->len);
+    g_assert(!strcmp(guest_watches->str, "some/relative/pathguestwatch"));
+    g_string_truncate(guest_watches, 0);
 
     /* We can list the two files we wrote */
     err = xs_impl_directory(s, DOMID_GUEST, XBT_NULL, "some/relative", &gencnt,
@@ -132,10 +173,38 @@ static void test_xs_node_simple(void)
     g_assert(!items->next->next);
     g_list_free_full(items, g_free);
 
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "guestwatch",
+                          watch_cb, guest_watches);
+    g_assert(!err);
+
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "guestwatch",
+                          watch_cb, guest_watches);
+    g_assert(err == ENOENT);
+
+    err = xs_impl_watch(s, DOMID_GUEST, "some/relative/path2", "watchp2",
+                        watch_cb, guest_watches);
+    g_assert(!err);
+    g_assert(guest_watches->len == strlen("some/relative/path2watchp2"));
+    g_assert(!strcmp(guest_watches->str, "some/relative/path2watchp2"));
+    g_string_truncate(guest_watches, 0);
+
+    err = xs_impl_watch(s, DOMID_GUEST, "/local/domain/1/some/relative",
+                        "watchrel", watch_cb, guest_watches);
+    g_assert(!err);
+    g_assert(guest_watches->len ==
+             strlen("/local/domain/1/some/relativewatchrel"));
+    g_assert(!strcmp(guest_watches->str,
+                     "/local/domain/1/some/relativewatchrel"));
+    g_string_truncate(guest_watches, 0);
+
     /* Write somewhere else which already existed */
     err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative", "moredata");
     g_assert(!err);
 
+    g_assert(!strcmp(guest_watches->str,
+                     "/local/domain/1/some/relativewatchrel"));
+    g_string_truncate(guest_watches, 0);
+
     g_byte_array_set_size(data, 0);
     err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative", data);
     g_assert(!err);
@@ -145,6 +214,7 @@ static void test_xs_node_simple(void)
     /* Overwrite existing data */
     err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative", "otherdata");
     g_assert(!err);
+    g_string_truncate(guest_watches, 0);
 
     g_byte_array_set_size(data, 0);
     err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative", data);
@@ -156,11 +226,21 @@ static void test_xs_node_simple(void)
     err = xs_impl_rm(s, DOMID_GUEST, XBT_NULL, "some/relative");
     g_assert(!err);
 
+    /* Each watch fires with the least specific relevant path */
+    g_assert(strstr(guest_watches->str,
+                    "some/relative/path2watchp2"));
+    g_assert(strstr(guest_watches->str,
+                    "/local/domain/1/some/relativewatchrel"));
+    g_string_truncate(guest_watches, 0);
+
     g_byte_array_set_size(data, 0);
     err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative", data);
     g_assert(err == ENOENT);
     g_byte_array_unref(data);
 
+    xs_impl_reset_watches(s, DOMID_GUEST);
+    g_string_free(qemu_watches, true);
+    g_string_free(guest_watches, true);
     xs_node_unref(old_root);
     xs_impl_delete(s);
 }
-- 
2.39.0


