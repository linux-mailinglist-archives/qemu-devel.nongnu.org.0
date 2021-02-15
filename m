Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662DE31BA43
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:24:56 +0100 (CET)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdrz-0002S1-E0
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjx-0005Yh-MU
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:37 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjv-0005WB-UX
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:37 -0500
Received: by mail-ej1-x62f.google.com with SMTP id jt13so11124004ejb.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xJQYENmqLP+bilTlpTv825EhHuvFtwMDrASktBaWBro=;
 b=GWo8Yzly+XQ80lKHdWM9qoqf5+4o5ZP/HOsr0fTM+dVjsFRRnJeOz5VrohZi3yNmcB
 KQDC1PyZkuhboIRIqlCgeQy6Mhfwmr4Hf2T2QAhGuEXyI8d4nkQD8K2jU/1+tj0hEX/B
 0dXD9HO/weoU7vnZ+L/BqOXYdLa3mMnPLHqu9zceouiEUDOxqwu6b5ysyURHT3pI/NuA
 rXhqYFOl5ygGx5eDXcERr9BxI8IzDdAFVtl1v/4st34y4n4Rc0CZG75OlecgNCE9emH4
 KenW5DJSlXc60GTKhGMVdwp7eu/Q8yLLFKNWqxTd9n9E7r2mJZf5Uopn8qrCI71ALLx1
 FcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xJQYENmqLP+bilTlpTv825EhHuvFtwMDrASktBaWBro=;
 b=Dd6q1XLkay4kp6rCn0tlmbVe8RLJziORpPjtm3b2rysg6LNxMMzqE2cHk+dZndAs1G
 jExADrD6CUUDYF3vx+tEgbGlucR0d6F+F1XRjOi8zicea+O9JCeMKbiwv/E6qP1QqO3k
 SwftIMHa4T9ZFB+OTl3NzwKJNWlVZFiulKQ9HKmAkZQ5KdCVuU2zpBVH5xDUZZKZV4ZS
 4dxB0UYWrWrXEQIrq3YmjWqHV6i5QWYXScFvjOF2SizOfDMXmh8VQwIDS/XaZhhPPkp7
 yCSi8mKpcfvPwPc4wzAyye4BpjwJSeP6ke93H9IoNuWD2rOZaVcy16kBWAHW+BZzOaNS
 eZJQ==
X-Gm-Message-State: AOAM530Kwz5EJ+HnLwFambI1Wx/c+Og7K5ojCuSGQLyLnucfmdxqo0Wq
 etsOCO2YVIn2tUjgF2lCD36pKMtwRqE=
X-Google-Smtp-Source: ABdhPJy0o0OAk5/gOmXllxyPTNIPybBv8mu1DdPxf8IoCes9HuXoeq74RVvgs93UUhpT+WnmNN3UaQ==
X-Received: by 2002:a17:906:268a:: with SMTP id
 t10mr13562818ejc.2.1613394994506; 
 Mon, 15 Feb 2021 05:16:34 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/19] libqos/qgraph: add qos_node_create_driver_named()
Date: Mon, 15 Feb 2021 14:16:16 +0100
Message-Id: <20210215131626.65640-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Message-Id: <3be962ff38f3396f8040deaa5ffdab525c4e0b16.1611704181.git.qemu_oss@crudebyte.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.29.2



