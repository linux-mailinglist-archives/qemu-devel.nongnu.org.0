Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D2A304D75
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 01:36:45 +0100 (CET)
Received: from localhost ([::1]:60872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4YpA-0002aV-Bp
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 19:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6bffb6e38589fb2c06a2c1b5deed33f3e710fed1@lizzy.crudebyte.com>)
 id 1l4YoP-0002B8-1O
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:35:57 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:36151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6bffb6e38589fb2c06a2c1b5deed33f3e710fed1@lizzy.crudebyte.com>)
 id 1l4YoM-00068p-Pl
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=BUVJ8zEuDaY9bM/dEoBtgD6L+KGLkJedtreai+3b6RQ=; b=T8if/
 hi8wcy7Zed6681C482voJ+zM8dpY1IIW/fz64YMKkvnFHltilXHv/qtqqsVoR4W9WM4Co+5tJKtMq
 P0NpBk+6d7uefDKBvMJRmbr5tQ1LtCKpKz75ZicLg704TpoTePmD6NgElTKUZDrDrdJbEuclA1gNd
 ODixH3YMYOOLumqLQ4qETnaveR8R0/yNpUUOJaQQJ5rwTwnK+6k6uJKaFfqyAQ5gCiK2ZoGm1E+UG
 bBpKxIAtVPi1skuRWcQilMhXAwwuV5IsX5EBhascifXnw9bpXIjfQ2kKit/TrdCxYQHL1Tl32ut+z
 I2hhvNDgkB9gePBl6/6puPrVL/5IA==;
Message-Id: <6bffb6e38589fb2c06a2c1b5deed33f3e710fed1.1611704181.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1611704181.git.qemu_oss@crudebyte.com>
References: <cover.1611704181.git.qemu_oss@crudebyte.com>
Date: Wed, 27 Jan 2021 00:08:03 +0100
Subject: [PATCH 3/5] tests/qtest/qos-test: dump qos graph if verbose
To: qemu-devel@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=6bffb6e38589fb2c06a2c1b5deed33f3e710fed1@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

If qtests were run in verbose mode (i.e. if --verbose CL argument was
provided) then dump the generated qos graph (all nodes and edges,
along with their current individual availability status) to stdout,
which allows to identify problems in the created qos graph e.g. when
writing new qos tests.

See API doc comment on function qos_dump_graph() for details.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/qgraph.c | 45 +++++++++++++++++++++++++++++++++++++
 tests/qtest/libqos/qgraph.h | 20 +++++++++++++++++
 tests/qtest/qos-test.c      |  3 +++
 3 files changed, 68 insertions(+)

diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index 61faf6b27d..b3b1a31f81 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -805,3 +805,48 @@ void qos_delete_cmd_line(const char *name)
         node->command_line = NULL;
     }
 }
+
+void qos_dump_graph(void)
+{
+    GList *keys;
+    GList *l;
+    QOSGraphEdgeList *list;
+    QOSGraphEdge *e, *next;
+    QOSGraphNode *dest_node, *node;
+
+    qos_printf("ALL QGRAPH EDGES: {\n");
+    keys = g_hash_table_get_keys(edge_table);
+    for (l = keys; l != NULL; l = l->next) {
+        const gchar *key = l->data;
+        qos_printf("\t src='%s'\n", key);
+        list = get_edgelist(key);
+        QSLIST_FOREACH_SAFE(e, list, edge_list, next) {
+            dest_node = g_hash_table_lookup(node_table, e->dest);
+            qos_printf("\t\t|-> dest='%s' type=%d (node=%p)",
+                       e->dest, e->type, dest_node);
+            if (!dest_node) {
+                qos_printf_literal(" <------- ERROR !");
+            }
+            qos_printf_literal("\n");
+        }
+    }
+    g_list_free(keys);
+    qos_printf("}\n");
+
+    qos_printf("ALL QGRAPH NODES: {\n");
+    keys = g_hash_table_get_keys(node_table);
+    for (l = keys; l != NULL; l = l->next) {
+        const gchar *key = l->data;
+        node = g_hash_table_lookup(node_table, key);
+        qos_printf("\t name='%s' ", key);
+        if (node->qemu_name) {
+            qos_printf_literal("qemu_name='%s' ", node->qemu_name);
+        }
+        qos_printf_literal("type=%d cmd_line='%s' [%s]\n",
+                           node->type, node->command_line,
+                           node->available ? "available" : "UNAVAILBLE"
+        );
+    }
+    g_list_free(keys);
+    qos_printf("}\n");
+}
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index f472949f68..07a32535f1 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -586,5 +586,25 @@ QOSGraphObject *qos_machine_new(QOSGraphNode *node, QTestState *qts);
 QOSGraphObject *qos_driver_new(QOSGraphNode *node, QOSGraphObject *parent,
                                QGuestAllocator *alloc, void *arg);
 
+/**
+ * Just for debugging purpose: prints all currently existing nodes and
+ * edges to stdout.
+ *
+ * All qtests add themselves to the overall qos graph by calling qgraph
+ * functions that add device nodes and edges between the individual graph
+ * nodes for tests. As the actual graph is assmbled at runtime by the qos
+ * subsystem, it is sometimes not obvious how the overall graph looks like.
+ * E.g. when writing new tests it may happen that those new tests are simply
+ * ignored by the qtest framework.
+ *
+ * This function allows to identify problems in the created qgraph. Keep in
+ * mind: only tests with a path down from the actual test case node (leaf) up
+ * to the graph's root node are actually executed by the qtest framework. And
+ * the qtest framework uses QMP to automatically check which QEMU drivers are
+ * actually currently available, and accordingly qos marks certain pathes as
+ * 'unavailable' in such cases (e.g. when QEMU was compiled without support for
+ * a certain feature).
+ */
+void qos_dump_graph(void);
 
 #endif
diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 8fdf87b183..d98ef78613 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -322,6 +322,9 @@ int main(int argc, char **argv)
     qos_set_machines_devices_available();
 
     qos_graph_foreach_test_path(walk_path);
+    if (g_test_verbose()) {
+        qos_dump_graph();
+    }
     g_test_run();
     qtest_end();
     qos_graph_destroy();
-- 
2.20.1


