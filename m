Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F9304D77
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 01:38:03 +0100 (CET)
Received: from localhost ([::1]:34936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4YqQ-0003YD-J1
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 19:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3be962ff38f3396f8040deaa5ffdab525c4e0b16@lizzy.crudebyte.com>)
 id 1l4YpP-00037z-Gk
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:36:59 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:52279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3be962ff38f3396f8040deaa5ffdab525c4e0b16@lizzy.crudebyte.com>)
 id 1l4YpN-0006bT-R1
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=WvVhQGQ1SCY3KFTTIsaCf80vUTbNa1hTBVbenWIbNlI=; b=k4dn+
 9Wxmz6FXYNW20S00rNIdc1oU9Pfy1hw9UZL1+NLKqpYnCpCepxsyJfU3mK6k3VadfUWNUBYAAQ60P
 /KJpGpMdkmu89mt2dzGQo/PA4lxKgq8BdYoBCCb9aZucnz8Af4zLIl6Brl9KFlbKTBIu9imz4dtD5
 tQ2CnJ244xOr7cMpC2aIM9TUS+xb5uEqsdVgMVWbK8alksrPZdF753wtwUEPooXfytNr2ZWmJlZCb
 Anr8AazBqsZGHVYgzu1R77P75mBZ2qGkV7siBlFs8XxFpdHuudqzfswtbAO8O8njbmb/S1GQbbl0U
 1dHBcYZn6baLv3UFcAYfVmvA1J99A==;
Message-Id: <3be962ff38f3396f8040deaa5ffdab525c4e0b16.1611704181.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1611704181.git.qemu_oss@crudebyte.com>
References: <cover.1611704181.git.qemu_oss@crudebyte.com>
Date: Wed, 27 Jan 2021 00:00:34 +0100
Subject: [PATCH 1/5] libqos/qgraph: add qos_node_create_driver_named()
To: qemu-devel@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=3be962ff38f3396f8040deaa5ffdab525c4e0b16@lizzy.crudebyte.com;
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

So far the qos subsystem of the qtest framework had the limitation
that only one instance of the same official QEMU (QMP) driver name
could be created for qtests. That's because a) the created qos
node names must always be unique, b) the node name must match the
official QEMU driver name being instantiated and c) all nodes are
in a global space shared by all tests.

This patch removes this limitation by introducing a new function
qos_node_create_driver_named() which allows test case authors to
specify a node name being different from the actual associated
QEMU driver name. It fills the new 'qemu_name' field of
QOSGraphNode for that purpose.

Adjust build_driver_cmd_line() and qos_graph_node_set_availability()
to correctly deal with either accessing node name vs. node's
qemu_name correctly.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/qgraph.c          | 54 ++++++++++++++++++++++++++--
 tests/qtest/libqos/qgraph.h          | 16 +++++++++
 tests/qtest/libqos/qgraph_internal.h |  1 +
 3 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index fc49cfa879..61faf6b27d 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -153,6 +153,7 @@ static QOSGraphNode *create_node(const char *name, QOSNodeType type)
 static void destroy_node(void *val)
 {
     QOSGraphNode *node = val;
+    g_free(node->qemu_name);
     g_free(node->command_line);
     g_free(node);
 }
@@ -286,7 +287,8 @@ static void build_machine_cmd_line(QOSGraphNode *node, const char *args)
  */
 static void build_driver_cmd_line(QOSGraphNode *node)
 {
-    node->command_line = g_strconcat(" -device ", node->name, NULL);
+    const char *name = node->qemu_name ?: node->name;
+    node->command_line = g_strconcat(" -device ", name, NULL);
 }
 
 /* qos_print_cb(): callback prints all path found by the DFS algorithm. */
@@ -631,6 +633,15 @@ void qos_node_create_driver(const char *name, QOSCreateDriverFunc function)
     node->u.driver.constructor = function;
 }
 
+void qos_node_create_driver_named(const char *name, const char *qemu_name,
+                                  QOSCreateDriverFunc function)
+{
+    QOSGraphNode *node = create_node(name, QNODE_DRIVER);
+    node->qemu_name = g_strdup(qemu_name);
+    build_driver_cmd_line(node);
+    node->u.driver.constructor = function;
+}
+
 void qos_node_contains(const char *container, const char *contained,
                        QOSGraphEdgeOptions *opts, ...)
 {
@@ -663,7 +674,7 @@ void qos_node_consumes(const char *consumer, const char *interface,
     add_edge(interface, consumer, QEDGE_CONSUMED_BY, opts);
 }
 
-void qos_graph_node_set_availability(const char *node, bool av)
+static void qos_graph_node_set_availability_explicit(const char *node, bool av)
 {
     QOSGraphEdgeList *elist;
     QOSGraphNode *n = search_node(node);
@@ -678,9 +689,46 @@ void qos_graph_node_set_availability(const char *node, bool av)
     }
     QSLIST_FOREACH_SAFE(e, elist, edge_list, next) {
         if (e->type == QEDGE_CONTAINS || e->type == QEDGE_PRODUCES) {
-            qos_graph_node_set_availability(e->dest, av);
+            qos_graph_node_set_availability_explicit(e->dest, av);
+        }
+    }
+}
+
+/*
+ * Behaves as qos_graph_node_set_availability_explicit(), except that the
+ * former always matches by node name only, whereas this function matches both
+ * by node name and node's optional 'qemu_name' field.
+ */
+void qos_graph_node_set_availability(const char *node, bool av)
+{
+    GList *l;
+    QOSGraphEdgeList *elist;
+    QOSGraphEdge *e, *next;
+    QOSGraphNode *n;
+    GList *keys = g_hash_table_get_keys(node_table);
+
+    for (l = keys; l != NULL; l = l->next) {
+        const gchar *key = l->data;
+        n = g_hash_table_lookup(node_table, key);
+        /*
+         * node's 'qemu_name' is set if there is more than one device with
+         * the same QEMU (QMP) device name
+         */
+        const char *node_name = n->qemu_name ?: n->name;
+        if (g_strcmp0(node_name, node) == 0) {
+            n->available = av;
+            elist = get_edgelist(n->name);
+            if (elist) {
+                QSLIST_FOREACH_SAFE(e, elist, edge_list, next) {
+                    if (e->type == QEDGE_CONTAINS || e->type == QEDGE_PRODUCES)
+                    {
+                        qos_graph_node_set_availability_explicit(e->dest, av);
+                    }
+                }
+            }
         }
     }
+    g_list_free(keys);
 }
 
 void qos_graph_foreach_test_path(QOSTestCallback fn)
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 5f63d352ca..f472949f68 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -452,6 +452,22 @@ void qos_node_create_machine_args(const char *name,
  */
 void qos_node_create_driver(const char *name, QOSCreateDriverFunc function);
 
+/**
+ * Behaves as qos_node_create_driver() with the extension of allowing to
+ * specify a different node name vs. associated QEMU device name.
+ *
+ * Use this function instead of qos_node_create_driver() if you need to create
+ * several instances of the same QEMU device. You are free to choose a custom
+ * node name, however the chosen node name must always be unique.
+ *
+ * @param name: custom, unique name of the node to be created
+ * @param qemu_name: actual (official) QEMU driver name the node shall be
+ *                   associated with
+ * @param function: driver constructor
+ */
+void qos_node_create_driver_named(const char *name, const char *qemu_name,
+                                  QOSCreateDriverFunc function);
+
 /**
  * qos_node_contains(): creates one or more edges of type QEDGE_CONTAINS
  * and adds them to the edge list mapped to @container in the
diff --git a/tests/qtest/libqos/qgraph_internal.h b/tests/qtest/libqos/qgraph_internal.h
index 968fa69450..974985dce9 100644
--- a/tests/qtest/libqos/qgraph_internal.h
+++ b/tests/qtest/libqos/qgraph_internal.h
@@ -56,6 +56,7 @@ struct QOSGraphNode {
     bool available;     /* set by QEMU via QMP, used during graph walk */
     bool visited;       /* used during graph walk */
     char *name;         /* used to identify the node */
+    char *qemu_name;    /* optional: see qos_node_create_driver_named() */
     char *command_line; /* used to start QEMU at test execution */
     union {
         struct {
-- 
2.20.1


