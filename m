Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549CC69906B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:48:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSaqP-0003DJ-NY; Thu, 16 Feb 2023 04:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSapD-0000Jw-BM
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:11 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSap8-0006LO-EI
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PbKLZxaTZ5hEwltWRkgYbdXu+V2RxVtTO0dpvaEF5jI=; b=c2JbHyDu7cAdAHjwLGGXcvmNY+
 T00ydKRP06dkfYM7Zej2/Q/VSC/Y8bl0eJ6+ecHsINj6Q4LNGjGrkYcs2nzzGJZxZGM/n+cW5rTia
 t8JSzUXcmdI/kHfGA0ecHhzzg4+luMn4nGfN41Mx7YvzeNaiPqQtsBptmBJajsfn7MqAug0jnSnNY
 M9aI/qSeyR9aMS/Go03DR8G74LmcIC7nBbzBDTI+y7g+W1OgO5zzyEO5TToAjI5lFtPhRjwGZwx2S
 mnndjuAxA+SFk1Ue8alxaxReSWYzAlKg47zruD66wbTah01ONr9LgYUh2nCkCvTVGpmRIPzcepwys
 qnTmJv6w==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pSao2-00AEEz-2E; Thu, 16 Feb 2023 09:44:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSaoi-0090Bd-2k; Thu, 16 Feb 2023 09:44:40 +0000
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
Subject: [RFC PATCH v11bis 07/26] hw/xen: Implement core serialize/deserialize
 methods for xenstore_impl
Date: Thu, 16 Feb 2023 09:44:17 +0000
Message-Id: <20230216094436.2144978-8-dwmw2@infradead.org>
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

In fact I think we want to only serialize the contents of the domain's
path in /local/domain/${domid} and leave the rest to be recreated? Will
defer to Paul for that.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c  |  25 +-
 hw/i386/kvm/xenstore_impl.c | 530 ++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xenstore_impl.h |   5 +
 tests/unit/test-xs-node.c   | 213 ++++++++++++++-
 4 files changed, 767 insertions(+), 6 deletions(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 90f3bb8946..d15eea76c4 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -66,6 +66,9 @@ struct XenXenstoreState {
     evtchn_port_t guest_port;
     evtchn_port_t be_port;
     struct xenevtchn_handle *eh;
+
+    uint8_t *impl_state;
+    uint32_t impl_state_size;
 };
 
 struct XenXenstoreState *xen_xenstore_singleton;
@@ -109,16 +112,26 @@ static bool xen_xenstore_is_needed(void *opaque)
 static int xen_xenstore_pre_save(void *opaque)
 {
     XenXenstoreState *s = opaque;
+    GByteArray *save;
 
     if (s->eh) {
         s->guest_port = xen_be_evtchn_get_guest_port(s->eh);
     }
+
+    g_free(s->impl_state);
+    save = xs_impl_serialize(s->impl);
+    s->impl_state = save->data;
+    s->impl_state_size = save->len;
+    g_byte_array_free(save, false);
+
     return 0;
 }
 
 static int xen_xenstore_post_load(void *opaque, int ver)
 {
     XenXenstoreState *s = opaque;
+    GByteArray *save;
+    int ret;
 
     /*
      * As qemu/dom0, rebind to the guest's port. The Windows drivers may
@@ -134,7 +147,13 @@ static int xen_xenstore_post_load(void *opaque, int ver)
         }
         s->be_port = be_port;
     }
-    return 0;
+
+    save = g_byte_array_new_take(s->impl_state, s->impl_state_size);
+    s->impl_state = NULL;
+    s->impl_state_size = 0;
+
+    ret = xs_impl_deserialize(s->impl, save, xen_domid, fire_watch_cb, s);
+    return ret;
 }
 
 static const VMStateDescription xen_xenstore_vmstate = {
@@ -152,6 +171,10 @@ static const VMStateDescription xen_xenstore_vmstate = {
         VMSTATE_BOOL(rsp_pending, XenXenstoreState),
         VMSTATE_UINT32(guest_port, XenXenstoreState),
         VMSTATE_BOOL(fatal_error, XenXenstoreState),
+        VMSTATE_UINT32(impl_state_size, XenXenstoreState),
+        VMSTATE_VARRAY_UINT32_ALLOC(impl_state, XenXenstoreState,
+                                    impl_state_size, 0,
+                                    vmstate_info_uint8, uint8_t),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
index e6c6a2200e..6744e99e4e 100644
--- a/hw/i386/kvm/xenstore_impl.c
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -35,6 +35,7 @@ typedef struct XsNode {
     uint64_t gencnt;
     bool deleted_in_tx;
     bool modified_in_tx;
+    unsigned int serialized_tx;
 #ifdef XS_NODE_UNIT_TEST
     gchar *name; /* debug only */
 #endif
@@ -62,6 +63,7 @@ struct XenstoreImplState {
     GHashTable *transactions;
     unsigned int root_tx;
     unsigned int last_tx;
+    bool serialized;
 };
 
 static inline XsNode *xs_node_new(void)
@@ -1220,5 +1222,533 @@ XenstoreImplState *xs_impl_create(unsigned int dom_id)
     s->root = xs_node_create("/", perms);
     g_list_free_full(perms, g_free);
 
+    s->root_tx = s->last_tx = 1;
     return s;
 }
+
+
+static void clear_serialized_tx(gpointer key, gpointer value, gpointer opaque)
+{
+    XsNode *n = value;
+
+    n->serialized_tx = XBT_NULL;
+    if (n->children) {
+        g_hash_table_foreach(n->children, clear_serialized_tx, NULL);
+    }
+}
+
+static void clear_tx_serialized_tx(gpointer key, gpointer value,
+                                   gpointer opaque)
+{
+    XsTransaction *t = value;
+
+    clear_serialized_tx(NULL, t->root, NULL);
+}
+
+static void write_be32(GByteArray *save, uint32_t val)
+{
+    uint32_t be = htonl(val);
+    g_byte_array_append(save, (void *)&be, sizeof(be));
+}
+
+
+struct save_state {
+    GByteArray *bytes;
+    unsigned int tx_id;
+};
+
+#define MODIFIED_IN_TX  (1U << 0)
+#define DELETED_IN_TX   (1U << 1)
+#define NODE_REF        (1U << 2)
+
+static void save_node(gpointer key, gpointer value, gpointer opaque)
+{
+    struct save_state *ss = opaque;
+    XsNode *n = value;
+    char *name = key;
+    uint8_t flag = 0;
+
+    /* Child nodes (i.e. anything but the root) have a name */
+    if (name) {
+        g_byte_array_append(ss->bytes, key, strlen(key) + 1);
+    }
+
+    /*
+     * If we already wrote this node, refer to the previous copy.
+     * There's no rename/move in XenStore, so all we need to find
+     * it is the tx_id of the transation in which it exists. Which
+     * may be the root tx.
+     */
+    if (n->serialized_tx != XBT_NULL) {
+        flag = NODE_REF;
+        g_byte_array_append(ss->bytes, &flag, 1);
+        write_be32(ss->bytes, n->serialized_tx);
+    } else {
+        GList *l;
+        n->serialized_tx = ss->tx_id;
+
+        if (n->modified_in_tx) {
+            flag |= MODIFIED_IN_TX;
+        }
+        if (n->deleted_in_tx) {
+            flag |= DELETED_IN_TX;
+        }
+        g_byte_array_append(ss->bytes, &flag, 1);
+
+        if (n->content) {
+            write_be32(ss->bytes, n->content->len);
+            g_byte_array_append(ss->bytes, n->content->data, n->content->len);
+        } else {
+            write_be32(ss->bytes, 0);
+        }
+
+        for (l = n->perms; l; l = l->next) {
+            g_byte_array_append(ss->bytes, l->data, strlen(l->data) + 1);
+        }
+        /* NUL termination after perms */
+        g_byte_array_append(ss->bytes, (void *)"", 1);
+
+        if (n->children) {
+            g_hash_table_foreach(n->children, save_node, ss);
+        }
+        /* NUL termination after children (child name is NUL) */
+        g_byte_array_append(ss->bytes, (void *)"", 1);
+    }
+}
+
+static void save_tree(struct save_state *ss, uint32_t tx_id, XsNode *root)
+{
+    write_be32(ss->bytes, tx_id);
+    ss->tx_id = tx_id;
+    save_node(NULL, root, ss);
+}
+
+static void save_tx(gpointer key, gpointer value, gpointer opaque)
+{
+    uint32_t tx_id = GPOINTER_TO_INT(key);
+    struct save_state *ss = opaque;
+    XsTransaction *n = value;
+
+    write_be32(ss->bytes, n->base_tx);
+    write_be32(ss->bytes, n->dom_id);
+
+    save_tree(ss, tx_id, n->root);
+}
+
+static void save_watch(gpointer key, gpointer value, gpointer opaque)
+{
+    struct save_state *ss = opaque;
+    XsWatch *w = value;
+
+    /* We only save the *guest* watches. */
+    if (w->dom_id) {
+        g_byte_array_append(ss->bytes, key, strlen(key) + 1);
+        g_byte_array_append(ss->bytes, (void *)w->token, strlen(w->token) + 1);
+    }
+}
+
+GByteArray *xs_impl_serialize(XenstoreImplState *s)
+{
+    struct save_state ss;
+
+    ss.bytes = g_byte_array_new();
+
+    /*
+     * node = flags [ real_node / node_ref ]
+     *   flags = uint8_t (MODIFIED_IN_TX | DELETED_IN_TX | NODE_REF)
+     *   node_ref = tx_id (in which the original version of this node exists)
+     *   real_node = content perms child* NUL
+     *     content = len data
+     *       len = uint32_t
+     *       data = uint8_t{len}
+     *     perms = perm* NUL
+     *       perm = asciiz
+     *   child = name node
+     *     name = asciiz
+     *
+     * tree = tx_id node
+     *   tx_id = uint32_t
+     *
+     * transaction = base_tx_id dom_id tree
+     *   base_tx_id = uint32_t
+     *   dom_id = uint32_t
+     *
+     * tx_list = tree transaction* XBT_NULL
+     *
+     * watch = path token
+     *   path = asciiz
+     *   token = asciiz
+     *
+     * watch_list = watch* NUL
+     *
+     * xs_serialize_stream = last_tx tx_list watch_list
+     *   last_tx = uint32_t
+     */
+
+    /* Clear serialized_tx in every node. */
+    if (s->serialized) {
+        clear_serialized_tx(NULL, s->root, NULL);
+        g_hash_table_foreach(s->transactions, clear_tx_serialized_tx, NULL);
+    }
+
+    s->serialized = true;
+
+    write_be32(ss.bytes, s->last_tx);
+    save_tree(&ss, s->root_tx, s->root);
+    g_hash_table_foreach(s->transactions, save_tx, &ss);
+
+    write_be32(ss.bytes, XBT_NULL);
+
+    g_hash_table_foreach(s->watches, save_watch, &ss);
+    g_byte_array_append(ss.bytes, (void *)"", 1);
+
+    return ss.bytes;
+}
+
+struct unsave_state {
+    char path[XENSTORE_ABS_PATH_MAX + 1];
+    XenstoreImplState *s;
+    GByteArray *bytes;
+    uint8_t *d;
+    size_t l;
+    bool root_walk;
+};
+
+static int consume_be32(struct unsave_state *us, unsigned int *val)
+{
+    uint32_t d;
+
+    if (us->l < sizeof(d)) {
+        return -EINVAL;
+    }
+    memcpy(&d, us->d, sizeof(d));
+    *val = ntohl(d);
+    us->d += sizeof(d);
+    us->l -= sizeof(d);
+    return 0;
+}
+
+static int consume_string(struct unsave_state *us, char **str, size_t *len)
+{
+    size_t l;
+
+    if (!us->l) {
+        return -EINVAL;
+    }
+
+    l = strnlen((void *)us->d, us->l);
+    if (l == us->l) {
+        return -EINVAL;
+    }
+
+    if (str) {
+        *str = (void *)us->d;
+    }
+    if (len) {
+        *len = l;
+    }
+
+    us->d += l + 1;
+    us->l -= l + 1;
+    return 0;
+}
+
+static XsNode *lookup_node(XsNode *n, char *path)
+{
+    char *slash = strchr(path, '/');
+    XsNode *child;
+
+    if (path[0] == '\0') {
+        return n;
+    }
+
+    if (slash) {
+        *slash = '\0';
+    }
+
+    if (!n->children) {
+        return NULL;
+    }
+    child = g_hash_table_lookup(n->children, path);
+    if (!slash) {
+        return child;
+    }
+
+    *slash = '/';
+    if (!child) {
+        return NULL;
+    }
+    return lookup_node(child, slash + 1);
+}
+
+static XsNode *lookup_tx_node(struct unsave_state *us, unsigned int tx_id)
+{
+    XsTransaction *t;
+    if (tx_id == us->s->root_tx) {
+        return lookup_node(us->s->root, us->path + 1);
+    }
+
+    t = g_hash_table_lookup(us->s->transactions, GINT_TO_POINTER(tx_id));
+    if (!t) {
+        return NULL;
+    }
+    g_assert(t->root);
+    return lookup_node(t->root, us->path + 1);
+}
+
+static int consume_node(struct unsave_state *us, XsNode **nodep)
+{
+    XsNode *n = NULL;
+    uint8_t flags;
+    int ret;
+
+    if (us->l < 1) {
+        return -EINVAL;
+    }
+    flags = us->d[0];
+    us->d++;
+    us->l--;
+
+    if (flags == NODE_REF) {
+        unsigned int tx;
+
+        ret = consume_be32(us, &tx);
+        if (ret) {
+            return ret;
+        }
+
+        n = lookup_tx_node(us, tx);
+        if (!n) {
+            return -EINVAL;
+        }
+        n->ref++;
+    } else {
+        uint32_t datalen;
+
+        if (flags & ~(DELETED_IN_TX | MODIFIED_IN_TX)) {
+            return -EINVAL;
+        }
+        n = xs_node_new();
+
+        if (flags & DELETED_IN_TX) {
+            n->deleted_in_tx = true;
+        }
+        if (flags & MODIFIED_IN_TX) {
+            n->modified_in_tx = true;
+        }
+        ret = consume_be32(us, &datalen);
+        if (ret) {
+            xs_node_unref(n);
+            return -EINVAL;
+        }
+        if (datalen) {
+            if (datalen > us->l) {
+                xs_node_unref(n);
+                return -EINVAL;
+            }
+
+            GByteArray *node_data = g_byte_array_new();
+            g_byte_array_append(node_data, us->d, datalen);
+            us->d += datalen;
+            us->l -= datalen;
+            n->content = node_data;
+
+            if (us->root_walk) {
+                n->modified_in_tx = true;
+            }
+        }
+        while (1) {
+            char *perm = NULL;
+            size_t permlen = 0;
+
+            ret = consume_string(us, &perm, &permlen);
+            if (ret) {
+                xs_node_unref(n);
+                return ret;
+            }
+
+            if (!permlen) {
+                break;
+            }
+
+            n->perms = g_list_append(n->perms, g_strdup(perm));
+        }
+
+        /* Now children */
+        while (1) {
+            size_t childlen;
+            char *childname;
+            char *pathend;
+            XsNode *child = NULL;
+
+            ret = consume_string(us, &childname, &childlen);
+            if (ret) {
+                xs_node_unref(n);
+                return ret;
+            }
+
+            if (!childlen) {
+                break;
+            }
+
+            pathend = us->path + strlen(us->path);
+            strncat(us->path, "/", sizeof(us->path) - 1);
+            strncat(us->path, childname, sizeof(us->path) - 1);
+
+            ret = consume_node(us, &child);
+            *pathend = '\0';
+            if (ret) {
+                xs_node_unref(n);
+                return ret;
+            }
+            g_assert(child);
+            xs_node_add_child(n, childname, child);
+        }
+
+        /*
+         * If the node has no data and no children we still want to fire
+         * a watch on it.
+         */
+        if (us->root_walk && !n->children) {
+            n->modified_in_tx = true;
+        }
+    }
+
+    *nodep = n;
+    return 0;
+}
+
+static int consume_tree(struct unsave_state *us, unsigned int *tx_id,
+                        XsNode **root)
+{
+    int ret;
+
+    ret = consume_be32(us, tx_id);
+    if (ret) {
+        return ret;
+    }
+
+    if (*tx_id > us->s->last_tx) {
+        return -EINVAL;
+    }
+
+    us->path[0] = '\0';
+
+    return consume_node(us, root);
+}
+
+int xs_impl_deserialize(XenstoreImplState *s, GByteArray *bytes,
+                        unsigned int dom_id, xs_impl_watch_fn watch_fn,
+                        void *watch_opaque)
+{
+    struct unsave_state us;
+    XsTransaction base_t = { 0 };
+    int ret;
+
+    us.s = s;
+    us.bytes = bytes;
+    us.d = bytes->data;
+    us.l = bytes->len;
+
+    xs_impl_reset_watches(s, dom_id);
+    g_hash_table_remove_all(s->transactions);
+
+    xs_node_unref(s->root);
+    s->root = NULL;
+    s->root_tx = s->last_tx = XBT_NULL;
+
+    ret = consume_be32(&us, &s->last_tx);
+    if (ret) {
+        return ret;
+    }
+
+    /*
+     * Consume the base tree into a transaction so that watches can be
+     * fired as we commit it. By setting us.root_walk we cause the nodes
+     * to be marked as 'modified_in_tx' as they are created, so that the
+     * watches are triggered on them.
+     */
+    base_t.dom_id = dom_id;
+    base_t.base_tx = XBT_NULL;
+    us.root_walk = true;
+    ret = consume_tree(&us, &base_t.tx_id, &base_t.root);
+    if (ret) {
+        return ret;
+    }
+    us.root_walk = false;
+
+    /*
+     * Commit the transaction now while the refcount on all nodes is 1.
+     * Note that we haven't yet reinstated the *guest* watches but that's
+     * OK because we don't want the guest to see any changes. Even any
+     * backend nodes which get recreated should be *precisely* as they
+     * were before the migration. Back ends may have been instantiated
+     * already, and will see the frontend magically blink into existence
+     * now (well, from the aio_bh which fires the watches). It's their
+     * responsibility to rebuild everything precisely as it was before.
+     */
+    ret = transaction_commit(s, &base_t);
+    if (ret) {
+        return ret;
+    }
+
+    while (1) {
+        unsigned int base_tx;
+        XsTransaction *t;
+
+        ret = consume_be32(&us, &base_tx);
+        if (ret) {
+            return ret;
+        }
+        if (base_tx == XBT_NULL) {
+            break;
+        }
+
+        t = g_new0(XsTransaction, 1);
+        t->base_tx = base_tx;
+
+        ret = consume_be32(&us, &t->dom_id);
+        if (!ret) {
+            ret = consume_tree(&us, &t->tx_id, &t->root);
+        }
+        if (ret) {
+            g_free(t);
+            return ret;
+        }
+        g_assert(t->root);
+        g_hash_table_insert(s->transactions, GINT_TO_POINTER(t->tx_id), t);
+    }
+
+    while (1) {
+        char *path, *token;
+        size_t pathlen, toklen;
+
+        ret = consume_string(&us, &path, &pathlen);
+        if (ret) {
+            return ret;
+        }
+        if (!pathlen) {
+            break;
+        }
+
+        ret = consume_string(&us, &token, &toklen);
+        if (ret) {
+            return ret;
+        }
+
+        if (!watch_fn) {
+            continue;
+        }
+
+        ret = xs_impl_watch(s, dom_id, path, token, watch_fn, watch_opaque);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    if (us.l) {
+        return -EINVAL;
+    }
+
+    return 0;
+}
diff --git a/hw/i386/kvm/xenstore_impl.h b/hw/i386/kvm/xenstore_impl.h
index 2f81251b5e..bbe2391e2e 100644
--- a/hw/i386/kvm/xenstore_impl.h
+++ b/hw/i386/kvm/xenstore_impl.h
@@ -61,4 +61,9 @@ int xs_impl_unwatch(XenstoreImplState *s, unsigned int dom_id,
                     void *opaque);
 int xs_impl_reset_watches(XenstoreImplState *s, unsigned int dom_id);
 
+GByteArray *xs_impl_serialize(XenstoreImplState *s);
+int xs_impl_deserialize(XenstoreImplState *s, GByteArray *bytes,
+                        unsigned int dom_id, xs_impl_watch_fn watch_fn,
+                        void *watch_opaque);
+
 #endif /* QEMU_XENSTORE_IMPL_H */
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index 55f07aa217..c845d4ecd9 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -20,14 +20,42 @@ static GList *xs_node_list;
 #define DOMID_QEMU 0
 #define DOMID_GUEST 1
 
+static void dump_ref(const char *name, XsNode *n, int indent)
+{
+    int i;
+
+    if (!indent && name) {
+        printf("%s:\n", name);
+    }
+
+    for (i = 0; i < indent; i++) {
+        printf(" ");
+    }
+
+    printf("->%p(%d, '%s'): '%.*s'%s%s\n", n, n->ref, n->name,
+           (int)(n->content ? n->content->len : strlen("<empty>")),
+           n->content ? (char *)n->content->data : "<empty>",
+           n->modified_in_tx ? " MODIFIED" : "",
+           n->deleted_in_tx ? " DELETED" : "");
+
+    if (n->children) {
+        g_hash_table_foreach(n->children, (void *)dump_ref,
+                             GINT_TO_POINTER(indent + 2));
+    }
+}
+
 /* This doesn't happen in qemu but we want to make valgrind happy */
-static void xs_impl_delete(XenstoreImplState *s)
+static void xs_impl_delete(XenstoreImplState *s, bool last)
 {
     g_hash_table_unref(s->transactions);
     g_hash_table_unref(s->watches);
     xs_node_unref(s->root);
     g_free(s);
 
+    if (!last) {
+        return;
+    }
+
     if (xs_node_list) {
         GList *l;
         for (l = xs_node_list; l; l = l->next) {
@@ -39,6 +67,167 @@ static void xs_impl_delete(XenstoreImplState *s)
     g_assert(!nr_xs_nodes);
 }
 
+struct compare_walk {
+    char path[XENSTORE_ABS_PATH_MAX + 1];
+    XsNode *parent_2;
+    bool compare_ok;
+};
+
+
+static bool compare_perms(GList *p1, GList *p2)
+{
+    while (p1) {
+        if (!p2 || g_strcmp0(p1->data, p2->data)) {
+            return false;
+        }
+        p1 = p1->next;
+        p2 = p2->next;
+    }
+    return (p2 == NULL);
+}
+
+static bool compare_content(GByteArray *c1, GByteArray *c2)
+{
+    size_t len1 = 0, len2 = 0;
+
+    if (c1) {
+        len1 = c1->len;
+    }
+    if (c2) {
+        len2 = c2->len;
+    }
+    if (len1 != len2) {
+        return false;
+    }
+
+    if (!len1) {
+        return true;
+    }
+
+    return !memcmp(c1->data, c2->data, len1);
+}
+
+static void compare_child(gpointer, gpointer, gpointer);
+
+static void compare_nodes(struct compare_walk *cw, XsNode *n1, XsNode *n2)
+{
+    int nr_children1 = 0, nr_children2 = 0;
+
+    if (n1->children) {
+        nr_children1 = g_hash_table_size(n1->children);
+    }
+    if (n2->children) {
+        nr_children2 = g_hash_table_size(n2->children);
+    }
+
+    if (n1->ref != n2->ref ||
+        n1->deleted_in_tx != n2->deleted_in_tx ||
+        n1->modified_in_tx != n2->modified_in_tx ||
+        !compare_perms(n1->perms, n2->perms) ||
+        !compare_content(n1->content, n2->content) ||
+        nr_children1 != nr_children2) {
+        cw->compare_ok = false;
+        printf("Compare failure on '%s'\n", cw->path);
+    }
+
+    if (nr_children1) {
+        XsNode *oldparent = cw->parent_2;
+        cw->parent_2 = n2;
+        g_hash_table_foreach(n1->children, compare_child, cw);
+
+        cw->parent_2 = oldparent;
+    }
+}
+
+static void compare_child(gpointer key, gpointer val, gpointer opaque)
+{
+    struct compare_walk *cw = opaque;
+    char *childname = key;
+    XsNode *child1 = val;
+    XsNode *child2 = g_hash_table_lookup(cw->parent_2->children, childname);
+    int pathlen = strlen(cw->path);
+
+    if (!child2) {
+        cw->compare_ok = false;
+        printf("Child '%s' does not exist under '%s'\n", childname, cw->path);
+        return;
+    }
+
+    strncat(cw->path, "/", sizeof(cw->path) - 1);
+    strncat(cw->path, childname, sizeof(cw->path) - 1);
+
+    compare_nodes(cw, child1, child2);
+    cw->path[pathlen] = '\0';
+}
+
+static bool compare_trees(XsNode *n1, XsNode *n2)
+{
+    struct compare_walk cw;
+
+    cw.path[0] = '\0';
+    cw.parent_2 = n2;
+    cw.compare_ok = true;
+
+    if (!n1 || !n2) {
+        return false;
+    }
+
+    compare_nodes(&cw, n1, n2);
+    return cw.compare_ok;
+}
+
+static void compare_tx(gpointer key, gpointer val, gpointer opaque)
+{
+    XenstoreImplState *s2 = opaque;
+    XsTransaction *t1 = val, *t2;
+    unsigned int tx_id = GPOINTER_TO_INT(key);
+
+    t2 = g_hash_table_lookup(s2->transactions, key);
+    g_assert(t2);
+
+    g_assert(t1->tx_id == tx_id);
+    g_assert(t2->tx_id == tx_id);
+    g_assert(t1->base_tx == t2->base_tx);
+    g_assert(t1->dom_id == t2->dom_id);
+    if (!compare_trees(t1->root, t2->root)) {
+        printf("Comparison failure in TX %u after serdes:\n", tx_id);
+        dump_ref("Original", t1->root, 0);
+        dump_ref("Deserialised", t2->root, 0);
+        g_assert(0);
+    }
+}
+
+static void check_serdes(XenstoreImplState *s)
+{
+    XenstoreImplState *s2 = xs_impl_create(DOMID_GUEST);
+    GByteArray *bytes = xs_impl_serialize(s);
+    int nr_transactions1, nr_transactions2;
+    int ret;
+
+    ret = xs_impl_deserialize(s2, bytes, DOMID_GUEST, NULL, NULL);
+    g_assert(!ret);
+
+    g_byte_array_unref(bytes);
+
+    g_assert(s->last_tx == s2->last_tx);
+    g_assert(s->root_tx == s2->root_tx);
+
+    if (!compare_trees(s->root, s2->root)) {
+        printf("Comparison failure in main tree after serdes:\n");
+        dump_ref("Original", s->root, 0);
+        dump_ref("Deserialised", s2->root, 0);
+        g_assert(0);
+    }
+
+    nr_transactions1 = g_hash_table_size(s->transactions);
+    nr_transactions2 = g_hash_table_size(s2->transactions);
+    g_assert(nr_transactions1 == nr_transactions2);
+
+    g_hash_table_foreach(s->transactions, compare_tx, s2);
+
+    xs_impl_delete(s2, false);
+}
+
 static int write_str(XenstoreImplState *s, unsigned int dom_id,
                           unsigned int tx_id, const char *path,
                           const char *content)
@@ -265,7 +454,7 @@ static void test_xs_node_simple(void)
     g_string_free(qemu_watches, true);
     g_string_free(guest_watches, true);
     xs_node_unref(old_root);
-    xs_impl_delete(s);
+    xs_impl_delete(s, true);
 }
 
 
@@ -317,6 +506,8 @@ static void do_test_xs_node_tx(bool fail, bool commit)
     g_assert(!err);
     g_assert(!watches->len);
 
+    check_serdes(s);
+
     /* Attempt to commit the transaction */
     err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, commit);
     if (commit && fail) {
@@ -333,6 +524,8 @@ static void do_test_xs_node_tx(bool fail, bool commit)
        g_assert(!watches->len);
     }
 
+    check_serdes(s);
+
     err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
                         watch_cb, watches);
     g_assert(!err);
@@ -351,7 +544,7 @@ static void do_test_xs_node_tx(bool fail, bool commit)
     }
     g_byte_array_unref(data);
     g_string_free(watches, true);
-    xs_impl_delete(s);
+    xs_impl_delete(s, true);
 }
 
 static void test_xs_node_tx_fail(void)
@@ -411,6 +604,8 @@ static void test_xs_node_tx_rm(void)
     g_assert(!memcmp(data->data, "something", data->len));
     g_byte_array_set_size(data, 0);
 
+    check_serdes(s);
+
     /* Commit the transaction */
     err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, true);
     g_assert(!err);
@@ -429,7 +624,7 @@ static void test_xs_node_tx_rm(void)
     g_assert(!err);
 
     g_string_free(watches, true);
-    xs_impl_delete(s);
+    xs_impl_delete(s, true);
 }
 
 static void test_xs_node_tx_resurrect(void)
@@ -447,6 +642,10 @@ static void test_xs_node_tx_resurrect(void)
                     "something");
     g_assert(!err);
 
+    /* Another node to remain shared */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/place/safe", "keepme");
+    g_assert(!err);
+
     /* This node will be wiped and resurrected */
     err = write_str(s, DOMID_GUEST, XBT_NULL, "some/deep/dark",
                     "foo");
@@ -474,6 +673,8 @@ static void test_xs_node_tx_resurrect(void)
                     "something");
     g_assert(!err);
 
+    check_serdes(s);
+
     /* Commit the transaction */
     err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, true);
     g_assert(!err);
@@ -490,12 +691,14 @@ static void test_xs_node_tx_resurrect(void)
     g_assert(err == ENOENT);
     g_byte_array_unref(data);
 
+    check_serdes(s);
+
     err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
                         watch_cb, watches);
     g_assert(!err);
 
     g_string_free(watches, true);
-    xs_impl_delete(s);
+    xs_impl_delete(s, true);
 }
 
 int main(int argc, char **argv)
-- 
2.39.0


