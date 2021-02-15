Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC3B31BA50
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:28:16 +0100 (CET)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdvD-0005kQ-UJ
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjy-0005az-Ux
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:38 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:41551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjx-0005XZ-6H
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:38 -0500
Received: by mail-ed1-x52f.google.com with SMTP id v9so3592545edw.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jQUH6VObd8u7+fDQH28VbFEYWbLdj3MMsViIPnVyQ0g=;
 b=k3EWQ7ExgRoYspRezvtdEqSrOLE74sE+HtAWZJXemv0PfwLg8LfEcMbOD7k2L8XWN+
 6mMOVZQJ2EhzwPBNiah5cabOKmkshWF8ZSn22YC1B2OmNVdqHRFaRAtcXHGWhz5hhY3+
 M7EEBlrETQg6N/OMjz7C7A0wLo2j0ce/jU/3alZXKaFRv87yj8XQaagEh+VYPIKx/lnQ
 3YMrHnVUeWrIIzkdQjtlKkiCmEuBJOFZr9EwC8Rc9qPpVhcovalqF1jd5aCCdjBgpwvv
 HlZwcs1RNqjoj5wIRQR7+hv9Sp6kzTpVBbcY60TUBId5o8ZHoYnOD1/7bmKUi5K+bkJT
 F0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jQUH6VObd8u7+fDQH28VbFEYWbLdj3MMsViIPnVyQ0g=;
 b=m0RrqTu4yj0y+kax04tp+r6QgWEnkoY8Jx/eR3fwLM7f8c/VCW2Aaja5DsYVvOsp+m
 LmEGnSQ8k9xgGc2ZdfB8CuEKJT3K/9nF0++dityA3fF/1itW6WrkuvuX/k3lzztD6A0E
 EfSGgrppgPwhgN9uYkqJ+EPghrO5WoX4eUi4l8A0A/idL7NfPM78717/I0yjJzMEXP86
 Rf5Y7G63/PadFO1ZOcdLmgdNcrXKpwoKoBnv96A74w53aOABdAg3e/GAZk8DNPkvHJQN
 +x6waPq60247eW6JDmIGW9mAeVZVnJxjCfgxxEGPCyyr+ax/RHyRecjml6XZpzfu+iVP
 3Mkg==
X-Gm-Message-State: AOAM532dLJdGSd3cK1RcazoSDQyxvUlRqYUtHarCB5I6EeaRn0AOWdkM
 r1mJ5Jd/gWIuP/yVeT/AymJj0bXkWXU=
X-Google-Smtp-Source: ABdhPJzah0VkayTg2LB3L+9WmeamxU8aZFBxOwg1wI9gZShiK5nUOKmWOJCH8Rx93gyqVTkQHwYWZg==
X-Received: by 2002:aa7:c555:: with SMTP id s21mr332652edr.43.1613394995859;
 Mon, 15 Feb 2021 05:16:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/19] tests/qtest/qos-test: dump qos graph if verbose
Date: Mon, 15 Feb 2021 14:16:18 +0100
Message-Id: <20210215131626.65640-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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

If qtests were run in verbose mode (i.e. if --verbose CL argument was
provided) then dump the generated qos graph (all nodes and edges,
along with their current individual availability status) to stdout,
which allows to identify problems in the created qos graph e.g. when
writing new qos tests.

See API doc comment on function qos_dump_graph() for details.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <6bffb6e38589fb2c06a2c1b5deed33f3e710fed1.1611704181.git.qemu_oss@crudebyte.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.29.2



