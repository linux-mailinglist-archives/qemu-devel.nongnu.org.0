Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10C26868F0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNENa-0004B1-Td; Wed, 01 Feb 2023 09:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c61c7683afee22e62f8e+7101+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pNELN-0001X0-Qf
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:44:19 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c61c7683afee22e62f8e+7101+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pNELJ-0005aM-3D
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xXeyNDds8xpKcK6zzuGCt9kfXJZs77YrSKy9r+74X3o=; b=oPGgtqOPGi9QMaoB19iUoA/sm9
 uK22Nta4Uuf3knQF/0jGRx9T43+R5ibZdAIBrV0Lae0rG3ME9ksYLcPUBsoFxd7sPBcbzePlqzgSm
 CxyWuiwFgS7gLS6s3qUiYA9qii1uoPdkGrTduXwdBFrUO8mK5Li2nXSkhkNZvSC5bKYd+M3G5G7df
 iQIpaJ+79sW8/VwfGOsE84vHz8+TkjDMk1ku7jNr42Qz77Ls6znaI8sLG6WEF9vf4GrwGcQ0bm1Aj
 8k5JXHr2ge1FLKvTjg8IGGfjnx8YaKG0MVvxNVKTAORyZhm21edrPfqGgsWRhQIR6zqBEmTu3KmOd
 oihike6Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pNEKb-004oCm-2u; Wed, 01 Feb 2023 14:43:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pNELA-007JwJ-1Z; Wed, 01 Feb 2023 14:44:00 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [RFC PATCH v1 4/8] hw/xen: Implement XenStore transactions
Date: Wed,  1 Feb 2023 14:43:54 +0000
Message-Id: <20230201144358.1744876-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201144358.1744876-1-dwmw2@infradead.org>
References: <20230201144358.1744876-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+c61c7683afee22e62f8e+7101+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Given that the whole thing supported copy on write from the beginning,
transactions end up being fairly simple. On starting a transaction, just
take a ref of the existing root; swap it back in on a successful commit.

The main tree has a transaction ID too, and we keep a record of the last
transaction ID given out. if the main tree is ever modified when it isn't
the latest, it gets a new transaction ID.

A commit can only succeed if the main tree hasn't moved on since it was
forked. Strictly speaking, the XenStore protocol allows a transaction to
succeed as long as nothing *it* read or wrote has changed in the interim,
but no implementations do that; *any* change is sufficient to abort a
transaction.

This does not yet fire watches on the changed nodes on a commit. That bit
is more fun and will come in a follow-on commit.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xenstore_impl.c | 99 +++++++++++++++++++++++++++++++++++--
 tests/unit/test-xs-node.c   | 97 ++++++++++++++++++++++++++++++++++++
 2 files changed, 192 insertions(+), 4 deletions(-)

diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
index 7b2d2ddc57..c07b807d13 100644
--- a/hw/i386/kvm/xenstore_impl.c
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -39,9 +39,19 @@ typedef struct XsWatch {
     int rel_prefix;
 } XsWatch;
 
+typedef struct XsTransaction {
+    XsNode *root;
+    unsigned int base_tx;
+    unsigned int tx_id;
+    unsigned int dom_id;
+} XsTransaction;
+
 struct XenstoreImplState {
     XsNode *root;
     GHashTable *watches;
+    GHashTable *transactions;
+    unsigned int root_tx;
+    unsigned int last_tx;
 };
 
 static void xs_node_init(Object *obj)
@@ -163,6 +173,7 @@ struct walk_op {
     bool inplace;
     bool mutating;
     bool create_dirs;
+    bool in_transaction;
 };
 
 static void fire_watches(struct walk_op *op, bool parents)
@@ -170,7 +181,7 @@ static void fire_watches(struct walk_op *op, bool parents)
     GList *l = NULL;
     XsWatch *w;
 
-    if (!op->mutating) {
+    if (!op->mutating || op->in_transaction) {
         return;
     }
 
@@ -402,6 +413,16 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
     op->path[namelen] = '\0';
     if (!namelen) {
         assert(!op->watches);
+        /*
+         * If the main tree was changed, bump its tx ID so that outstanding
+         * transactions correctly fail. But don't bump it every time; only
+         * if it makes a difference.
+         */
+        if (op->mutating && !op->in_transaction) {
+            if (op->s->root_tx != op->s->last_tx) {
+                op->s->root_tx = ++op->s->last_tx;
+            }
+        }
     }
     return 0;
 }
@@ -456,13 +477,20 @@ static int init_walk_op(XenstoreImplState *s, struct walk_op *op,
     op->inplace = true;
     op->mutating = false;
     op->create_dirs = false;
+    op->in_transaction = false;
     op->dom_id = dom_id;
     op->s = s;
 
     if (tx_id == XBT_NULL) {
         *rootp = &s->root;
     } else {
-        return ENOENT;
+        XsTransaction *tx = g_hash_table_lookup(s->transactions,
+                                                GINT_TO_POINTER(tx_id));
+        if (!tx) {
+            return ENOENT;
+        }
+        *rootp = &tx->root;
+        op->in_transaction = true;
     }
 
     return 0;
@@ -534,13 +562,65 @@ int xs_impl_directory(XenstoreImplState *s, unsigned int dom_id,
 int xs_impl_transaction_start(XenstoreImplState *s, unsigned int dom_id,
                               unsigned int *tx_id)
 {
-    return ENOSYS;
+    XsTransaction *tx;
+
+    if (*tx_id != XBT_NULL) {
+        return EINVAL;
+    }
+
+    tx = g_new0(XsTransaction, 1);
+
+    tx->tx_id = ++s->last_tx;
+    tx->base_tx = s->root_tx;
+    tx->root = xs_node_ref(s->root);
+    tx->dom_id = dom_id;
+
+    g_hash_table_insert(s->transactions, GINT_TO_POINTER(tx->tx_id), tx);
+    *tx_id = tx->tx_id;
+    return 0;
+}
+
+static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
+{
+    if (s->root_tx != tx->base_tx) {
+        return EAGAIN;
+    }
+    xs_node_unref(s->root);
+    s->root = tx->root;
+    tx->root = NULL;
+    s->root_tx = tx->tx_id;
+
+    /*
+     * XX: Walk the new root and fire watches on any node which has a
+     * refcount of one (which is therefore unique to this transaction).
+     */
+    return 0;
 }
 
 int xs_impl_transaction_end(XenstoreImplState *s, unsigned int dom_id,
                             xs_transaction_t tx_id, bool commit)
 {
-    return ENOSYS;
+    int ret = 0;
+
+    if (commit) {
+        XsTransaction *tx = g_hash_table_lookup(s->transactions,
+                                                GINT_TO_POINTER(tx_id));
+        if (!tx || tx->dom_id != dom_id) {
+            return ENOENT;
+        }
+
+        ret = transaction_commit(s, tx);
+        /*
+         * It *is* in the hash table still, so g_hash_table_remove() will
+         * return true and we'll return ret;
+         */
+    }
+
+    if (g_hash_table_remove(s->transactions, GINT_TO_POINTER(tx_id))) {
+        return ret;
+    } else {
+        return ENOENT;
+    }
 }
 
 int xs_impl_rm(XenstoreImplState *s, unsigned int dom_id,
@@ -761,11 +841,22 @@ int xs_impl_reset_watches(XenstoreImplState *s, unsigned int dom_id)
     return 0;
 }
 
+static void xs_tx_free(void *_tx)
+{
+    XsTransaction *tx = _tx;
+    if (tx->root) {
+        xs_node_unref(tx->root);
+    }
+    g_free(tx);
+}
+
 XenstoreImplState *xs_impl_create(void)
 {
     XenstoreImplState *s = g_new0(XenstoreImplState, 1);
 
     s->watches = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
+    s->transactions = g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                                            NULL, xs_tx_free);
     s->root = xs_node_new();
 #ifdef XS_NODE_UNIT_TEST
     s->root->name = g_strdup("/");
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index 3bea23d106..88ac71e83f 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -23,6 +23,7 @@ static GList *xs_node_list;
 /* This doesn't happen in qemu but we want to make valgrind happy */
 static void xs_impl_delete(XenstoreImplState *s)
 {
+    g_hash_table_unref(s->transactions);
     g_hash_table_unref(s->watches);
     xs_node_unref(s->root);
     g_free(s);
@@ -243,12 +244,108 @@ static void test_xs_node_simple(void)
 }
 
 
+static void do_test_xs_node_tx(bool fail, bool commit)
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
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative/path",
+                    "something");
+    g_assert(!err);
+    g_assert(!strcmp(watches->str,
+                     "some/relative/pathwatch"));
+    g_string_truncate(watches, 0);
+
+    /* Create a transaction */
+    err = xs_impl_transaction_start(s, DOMID_GUEST, &tx_id);
+    g_assert(!err);
+
+    if (fail) {
+        /* Write something else in the root */
+        err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative/path",
+                        "another thing");
+        g_assert(!err);
+        g_assert(!strcmp(watches->str,
+                         "some/relative/pathwatch"));
+        g_string_truncate(watches, 0);
+    }
+
+    g_assert(!watches->len);
+
+    /* Perform a write in the transaction */
+    err = write_str(s, DOMID_GUEST, tx_id, "some/relative/path",
+                    "something else");
+    g_assert(!err);
+    g_assert(!watches->len);
+
+    /* The transaction should fail */
+    err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, commit);
+    if (commit && fail) {
+        g_assert(err == EAGAIN);
+    } else {
+        g_assert(!err);
+    }
+    g_assert(!watches->len);
+
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative/path", data);
+    g_assert(!err);
+    if (fail) {
+        g_assert(data->len == strlen("another thing"));
+        g_assert(!memcmp(data->data, "another thing", data->len));
+    } else if (commit) {
+        g_assert(data->len == strlen("something else"));
+        g_assert(!memcmp(data->data, "something else", data->len));
+    } else {
+        g_assert(data->len == strlen("something"));
+        g_assert(!memcmp(data->data, "something", data->len));
+    }
+    g_byte_array_unref(data);
+    g_string_free(watches, true);
+    xs_impl_delete(s);
+}
+
+static void test_xs_node_tx_fail(void)
+{
+    do_test_xs_node_tx(true, true);
+}
+
+static void test_xs_node_tx_abort(void)
+{
+    do_test_xs_node_tx(false, false);
+    do_test_xs_node_tx(true, false);
+}
+static void test_xs_node_tx_succeed(void)
+{
+    do_test_xs_node_tx(false, true);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
     module_call_init(MODULE_INIT_QOM);
 
     g_test_add_func("/xs_node/simple", test_xs_node_simple);
+    g_test_add_func("/xs_node/tx_abort", test_xs_node_tx_abort);
+    g_test_add_func("/xs_node/tx_fail", test_xs_node_tx_fail);
+    g_test_add_func("/xs_node/tx_succeed", test_xs_node_tx_succeed);
 
     return g_test_run();
 }
-- 
2.39.0


