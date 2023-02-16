Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6529969906F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:48:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSapA-00009p-9M; Thu, 16 Feb 2023 04:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSap2-00006l-DX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:00 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSaoy-0006LC-8I
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9UsvJgIz8DVqSezPGGR/YvCsP+Pc4Gsb73K7iHYZp9s=; b=oNVw33DP7RK+dodExGvN0KycMx
 1YD9hu2kLxHYCpo5THVBtozCTPsHJFl9wFdQP8rKW2W3S/wDnczDLsslOaCO9YERQOflEjUKq024u
 VIPFyeA7oO1Wy/wypD73m0vBZJDevfgJXQjHqrjZfHeX94S1/fh2QbIruO8XrQVKOsBNMB35atd+x
 BUWo2BX5PCTJBjk9LcEQnl8JBK3Vj66r2TgbXVMkHWjIzH2du1wWtzooktZADSrsFYwh3PWUjJQ7v
 5cE8R3QsuxdUgiTkhs/GMEj8NOUUqdPUIIM/gX1GfxjnojAaWPHt0znN/LRGgNec1tRj8p073Svoj
 ShXYfmug==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pSao2-00AEEy-1y; Thu, 16 Feb 2023 09:44:43 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSaoi-0090BZ-2X; Thu, 16 Feb 2023 09:44:40 +0000
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
Subject: [RFC PATCH v11bis 06/26] xenstore perms WIP
Date: Thu, 16 Feb 2023 09:44:16 +0000
Message-Id: <20230216094436.2144978-7-dwmw2@infradead.org>
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

From: Paul Durrant <pdurrant@amazon.com>

Store perms as a GList of strings, check permissions. No unit tests yet.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: David Woodhoues <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c  |   2 +-
 hw/i386/kvm/xenstore_impl.c | 239 +++++++++++++++++++++++++++++++++---
 hw/i386/kvm/xenstore_impl.h |   8 +-
 tests/unit/test-xs-node.c   |  24 +++-
 4 files changed, 252 insertions(+), 21 deletions(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 78c887ab29..90f3bb8946 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -98,7 +98,7 @@ static void xen_xenstore_realize(DeviceState *dev, Error **errp)
     aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh), true,
                        xen_xenstore_event, NULL, NULL, NULL, s);
 
-    s->impl = xs_impl_create();
+    s->impl = xs_impl_create(xen_domid);
 }
 
 static bool xen_xenstore_is_needed(void *opaque)
diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
index 2f9e1ff51b..e6c6a2200e 100644
--- a/hw/i386/kvm/xenstore_impl.c
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -12,6 +12,8 @@
 #include "qemu/osdep.h"
 #include "qom/object.h"
 
+#include "hw/xen/xen.h"
+
 #include "xen_xenstore.h"
 #include "xenstore_impl.h"
 
@@ -28,6 +30,7 @@
 typedef struct XsNode {
     uint32_t ref;
     GByteArray *content;
+    GList *perms;
     GHashTable *children;
     uint64_t gencnt;
     bool deleted_in_tx;
@@ -96,6 +99,9 @@ static inline void xs_node_unref(XsNode *n)
     if (n->content) {
         g_byte_array_unref(n->content);
     }
+    if (n->perms) {
+        g_list_free_full(n->perms, g_free);
+    }
     if (n->children) {
         g_hash_table_unref(n->children);
     }
@@ -107,8 +113,51 @@ static inline void xs_node_unref(XsNode *n)
     g_free(n);
 }
 
+char *xs_perm_as_string(unsigned int perm, unsigned int domid)
+{
+    char letter;
+
+    switch (perm) {
+    case XS_PERM_READ | XS_PERM_WRITE:
+        letter = 'b';
+        break;
+    case XS_PERM_READ:
+        letter = 'r';
+        break;
+    case XS_PERM_WRITE:
+        letter = 'w';
+        break;
+    case XS_PERM_NONE:
+    default:
+        letter = 'n';
+        break;
+    }
+
+    return g_strdup_printf("%c%u", letter, domid);
+}
+
+static gpointer do_perm_copy(gconstpointer src, gpointer user_data)
+{
+    return g_strdup(src);
+}
+
+static XsNode *xs_node_create(const char *name, GList *perms)
+{
+    XsNode *n = xs_node_new();
+
+#ifdef XS_NODE_UNIT_TEST
+    if (name) {
+        n->name = g_strdup(name);
+    }
+#endif
+
+    n->perms = g_list_copy_deep(perms, do_perm_copy, NULL);
+
+    return n;
+}
+
 /* For copying from one hash table to another using g_hash_table_foreach() */
-static void do_insert(gpointer key, gpointer value, gpointer user_data)
+static void do_child_insert(gpointer key, gpointer value, gpointer user_data)
 {
     g_hash_table_insert(user_data, g_strdup(key), xs_node_ref(value));
 }
@@ -125,12 +174,16 @@ static XsNode *xs_node_copy(XsNode *old)
     }
 #endif
 
+    assert(old);
     if (old->children) {
         n->children = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
                                             (GDestroyNotify)xs_node_unref);
-        g_hash_table_foreach(old->children, do_insert, n->children);
+        g_hash_table_foreach(old->children, do_child_insert, n->children);
+    }
+    if (old->perms) {
+        n->perms = g_list_copy_deep(old->perms, do_perm_copy, NULL);
     }
-    if (old && old->content) {
+    if (old->content) {
         n->content = g_byte_array_ref(old->content);
     }
     return n;
@@ -320,6 +373,9 @@ static XsNode *xs_node_copy_deleted(XsNode *old)
                                             (GDestroyNotify)xs_node_unref);
         g_hash_table_foreach(old->children, copy_deleted_recurse, n->children);
     }
+    if (old->perms) {
+        n->perms = g_list_copy_deep(old->perms, do_perm_copy, NULL);
+    }
     n->deleted_in_tx = true;
     /* If it gets resurrected we only fire a watch if it lost its content */
     if (old->content) {
@@ -352,6 +408,84 @@ static int xs_node_rm(XsNode **n, struct walk_op *op)
     return 0;
 }
 
+static int xs_node_get_perms(XsNode **n, struct walk_op *op)
+{
+    GList **perms = op->op_opaque;
+
+    assert(op->inplace);
+    assert(*n);
+
+    *perms = g_list_copy_deep((*n)->perms, do_perm_copy, NULL);
+    return 0;
+}
+
+static int xs_node_set_perms(XsNode **n, struct walk_op *op)
+{
+    GList *perms = op->op_opaque;
+
+    /* We *are* the node to be written. Either this or a copy. */
+    if (!op->inplace) {
+        XsNode *old = *n;
+        *n = xs_node_copy(old);
+        xs_node_unref(old);
+    }
+
+    if ((*n)->perms) {
+        g_list_free_full((*n)->perms, g_free);
+    }
+    (*n)->perms = g_list_copy_deep(perms, do_perm_copy, NULL);
+    if (op->tx_id != XBT_NULL) {
+        (*n)->modified_in_tx = true;
+    }
+    return 0;
+}
+
+static void parse_perm(const char *perm, char *letter, unsigned int *dom_id)
+{
+    unsigned int n = sscanf(perm, "%c%u", letter, dom_id);
+
+    assert(n == 2);
+}
+
+static bool can_access(unsigned int dom_id, GList *perms, const char *letters)
+{
+    unsigned int i, n;
+    char perm_letter;
+    unsigned int perm_dom_id;
+    bool access;
+
+    if (dom_id == 0) {
+        return true;
+    }
+
+    n = g_list_length(perms);
+    assert(n >= 1);
+
+    /*
+     * The dom_id of the first perm is the owner, and the owner always has
+     * read-write access.
+     */
+    parse_perm(g_list_nth_data(perms, 0), &perm_letter, &perm_dom_id);
+    if (dom_id == perm_dom_id) {
+        return true;
+    }
+
+    /*
+     * The letter of the first perm specified the default access for all other
+     * domains.
+     */
+    access = !!strchr(letters, perm_letter);
+    for (i = 1; i < n; i++) {
+        parse_perm(g_list_nth_data(perms, i), &perm_letter, &perm_dom_id);
+        if (dom_id != perm_dom_id) {
+            continue;
+        }
+        access = !!strchr(letters, perm_letter);
+    }
+
+    return access;
+}
+
 /*
  * Passed a full reference in *n which it may free if it needs to COW.
  *
@@ -393,6 +527,13 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
     }
 
     if (!child_name) {
+        const char *letters = op->mutating ? "wb" : "rb";
+
+        if (!can_access(op->dom_id, old->perms, letters)) {
+            err = EACCES;
+            goto out;
+        }
+
         /* This is the actual node on which the operation shall be performed */
         err = op->op_fn(n, op);
         if (!err) {
@@ -426,7 +567,14 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
             stole_child = true;
         }
     } else if (op->create_dirs) {
-        child = xs_node_new();
+        assert(op->mutating);
+
+        if (!can_access(op->dom_id, old->perms, "wb")) {
+            err = EACCES;
+            goto out;
+        }
+
+        child = xs_node_create(child_name, old->perms);
         /*
          * If we're creating a new child, we can clearly modify it (and its
          * children) in place from here on down.
@@ -798,20 +946,73 @@ int xs_impl_rm(XenstoreImplState *s, unsigned int dom_id,
 int xs_impl_get_perms(XenstoreImplState *s, unsigned int dom_id,
                       xs_transaction_t tx_id, const char *path, GList **perms)
 {
-    /*
-     * The perms are (char *) in the <perm-as-string> wire format to be
-     * freed by the caller.
-     */
-    return ENOSYS;
+    struct walk_op op;
+    XsNode **n;
+    int ret;
+
+    ret = init_walk_op(s, &op, tx_id, dom_id, path, &n);
+    if (ret) {
+        return ret;
+    }
+    op.op_fn = xs_node_get_perms;
+    op.op_opaque = perms;
+    return xs_node_walk(n, &op);
+}
+
+static void is_valid_perm(gpointer data, gpointer user_data)
+{
+    char *perm = data;
+    bool *valid = user_data;
+    char letter;
+    unsigned int dom_id;
+
+    if (!*valid) {
+        return;
+    }
+
+    if (sscanf(perm, "%c%u", &letter, &dom_id) != 2) {
+        *valid = false;
+        return;
+    }
+
+    switch (letter) {
+    case 'n':
+    case 'r':
+    case 'w':
+    case 'b':
+        break;
+
+    default:
+        *valid = false;
+        break;
+    }
 }
 
 int xs_impl_set_perms(XenstoreImplState *s, unsigned int dom_id,
                       xs_transaction_t tx_id, const char *path, GList *perms)
 {
-    /*
-     * The perms are (const char *) in the <perm-as-string> wire format.
-     */
-    return ENOSYS;
+    struct walk_op op;
+    XsNode **n;
+    bool valid = true;
+    int ret;
+
+    if (!g_list_length(perms)) {
+        return EINVAL;
+    }
+
+    g_list_foreach(perms, is_valid_perm, &valid);
+    if (!valid) {
+        return EINVAL;
+    }
+
+    ret = init_walk_op(s, &op, tx_id, dom_id, path, &n);
+    if (ret) {
+        return ret;
+    }
+    op.op_fn = xs_node_set_perms;
+    op.op_opaque = perms;
+    op.mutating = true;
+    return xs_node_walk(n, &op);
 }
 
 int xs_impl_watch(XenstoreImplState *s, unsigned int dom_id, const char *path,
@@ -1006,16 +1207,18 @@ static void xs_tx_free(void *_tx)
     g_free(tx);
 }
 
-XenstoreImplState *xs_impl_create(void)
+XenstoreImplState *xs_impl_create(unsigned int dom_id)
 {
     XenstoreImplState *s = g_new0(XenstoreImplState, 1);
+    GList *perms;
 
     s->watches = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
     s->transactions = g_hash_table_new_full(g_direct_hash, g_direct_equal,
                                             NULL, xs_tx_free);
-    s->root = xs_node_new();
-#ifdef XS_NODE_UNIT_TEST
-    s->root->name = g_strdup("/");
-#endif
+
+    perms = g_list_append(NULL, xs_perm_as_string(XS_PERM_NONE, 0));
+    s->root = xs_node_create("/", perms);
+    g_list_free_full(perms, g_free);
+
     return s;
 }
diff --git a/hw/i386/kvm/xenstore_impl.h b/hw/i386/kvm/xenstore_impl.h
index beb7b29ab8..2f81251b5e 100644
--- a/hw/i386/kvm/xenstore_impl.h
+++ b/hw/i386/kvm/xenstore_impl.h
@@ -16,9 +16,15 @@ typedef uint32_t xs_transaction_t;
 
 #define XBT_NULL 0
 
+#define XS_PERM_NONE  0x00
+#define XS_PERM_READ  0x01
+#define XS_PERM_WRITE 0x02
+
 typedef struct XenstoreImplState XenstoreImplState;
 
-XenstoreImplState *xs_impl_create(void);
+XenstoreImplState *xs_impl_create(unsigned int dom_id);
+
+char *xs_perm_as_string(unsigned int perm, unsigned int domid);
 
 /*
  * These functions return *positive* error numbers. This is a little
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index 307855e014..55f07aa217 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -62,8 +62,9 @@ static void watch_cb(void *_str, const char *path, const char *token)
 
 static XenstoreImplState *setup(void)
 {
-   XenstoreImplState *s = xs_impl_create();
+   XenstoreImplState *s = xs_impl_create(DOMID_GUEST);
    char *abspath;
+   GList *perms;
    int err;
 
    abspath = g_strdup_printf("/local/domain/%u", DOMID_GUEST);
@@ -71,6 +72,13 @@ static XenstoreImplState *setup(void)
    err = write_str(s, DOMID_QEMU, XBT_NULL, abspath, "");
    g_assert(!err);
 
+   perms = g_list_append(NULL, g_strdup_printf("n%u", DOMID_QEMU));
+   perms = g_list_append(perms, g_strdup_printf("r%u", DOMID_GUEST));
+
+   err = xs_impl_set_perms(s, DOMID_QEMU, XBT_NULL, abspath, perms);
+   g_assert(!err);
+
+   g_list_free_full(perms, g_free);
    g_free(abspath);
 
    abspath = g_strdup_printf("/local/domain/%u/some", DOMID_GUEST);
@@ -78,6 +86,12 @@ static XenstoreImplState *setup(void)
    err = write_str(s, DOMID_QEMU, XBT_NULL, abspath, "");
    g_assert(!err);
 
+   perms = g_list_append(NULL, g_strdup_printf("n%u", DOMID_GUEST));
+
+   err = xs_impl_set_perms(s, DOMID_QEMU, XBT_NULL, abspath, perms);
+   g_assert(!err);
+
+   g_list_free_full(perms, g_free);
    g_free(abspath);
 
    return s;
@@ -145,6 +159,10 @@ static void test_xs_node_simple(void)
     /* Keep a copy, to force COW mode */
     old_root = xs_node_ref(s->root);
 
+    /* Write somewhere we aren't allowed, in COW mode */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "/local/domain/badplace", "moredata");
+    g_assert(err == EACCES);
+
     /* Write works again */
     err = write_str(s, DOMID_GUEST, XBT_NULL,
                     "/local/domain/1/some/relative/path2",
@@ -202,6 +220,10 @@ static void test_xs_node_simple(void)
     err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative", "moredata");
     g_assert(!err);
 
+    /* Write somewhere we aren't allowed */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "/local/domain/badplace", "moredata");
+    g_assert(err == EACCES);
+
     g_assert(!strcmp(guest_watches->str,
                      "/local/domain/1/some/relativewatchrel"));
     g_string_truncate(guest_watches, 0);
-- 
2.39.0


