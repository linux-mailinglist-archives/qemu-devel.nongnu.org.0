Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C44610A01
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:58:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIFN-0007LF-AR; Fri, 28 Oct 2022 01:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFG-0007JL-Cc
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFE-0007WH-K2
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cWAxd2GNnkH21BqgmRddZy7VVoTUck+flip3k/LV9k=;
 b=Ct5Tuj+RYuBEWtD3Ldbl65BkYGN59/G0FP1HHbuPeuBvjpHBPKG59F0FMJJp7lqKUTlV+b
 iMZ24jbM9Zn43j5Xi083OUcAiRE3ZBpnHysnYGK8DzDy9WP/gHyDep3RNVy+v6ULT+x0eo
 c4jrEejR/ORx9aqD63sYtQBLffxn3zg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-KgOOmDzvNIqStfFRpFne_Q-1; Fri, 28 Oct 2022 01:49:26 -0400
X-MC-Unique: KgOOmDzvNIqStfFRpFne_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9AFC3802B9E
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:49:25 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22A8DC15BA8;
 Fri, 28 Oct 2022 05:49:22 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 14/26] qapi: net: introduce a way to bypass
 qemu_opts_parse_noisily()
Date: Fri, 28 Oct 2022 13:48:23 +0800
Message-Id: <20221028054835.29674-15-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Laurent Vivier <lvivier@redhat.com>

As qemu_opts_parse_noisily() flattens the QAPI structures ("type" field
of Netdev structure can collides with "type" field of SocketAddress),
we introduce a way to bypass qemu_opts_parse_noisily() and use directly
visit_type_Netdev() to parse the backend parameters.

More details from Markus:

qemu_init() passes the argument of -netdev, -nic, and -net to
net_client_parse().

net_client_parse() parses with qemu_opts_parse_noisily(), passing
QemuOptsList qemu_netdev_opts for -netdev, qemu_nic_opts for -nic, and
qemu_net_opts for -net.  Their desc[] are all empty, which means any
keys are accepted.  The result of the parse (a QemuOpts) is stored in
the QemuOptsList.

Note that QemuOpts is flat by design.  In some places, we layer non-flat
on top using dotted keys convention, but not here.

net_init_clients() iterates over the stored QemuOpts, and passes them to
net_init_netdev(), net_param_nic(), or net_init_client(), respectively.

These functions pass the QemuOpts to net_client_init().  They also do
other things with the QemuOpts, which we can ignore here.

net_client_init() uses the opts visitor to convert the (flat) QemOpts to
a (non-flat) QAPI object Netdev.  Netdev is also the argument of QMP
command netdev_add.

The opts visitor was an early attempt to support QAPI in
(QemuOpts-based) CLI.  It restricts QAPI types to a certain shape; see
commit eb7ee2cbeb "qapi: introduce OptsVisitor".

A more modern way to support QAPI is qobject_input_visitor_new_str().
It uses keyval_parse() instead of QemuOpts for KEY=VALUE,... syntax, and
it also supports JSON syntax.  The former isn't quite as expressive as
JSON, but it's a lot closer than QemuOpts + opts visitor.

This commit paves the way to use of the modern way instead.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/net.h |  2 ++
 net/net.c         | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c      |  6 +++++-
 3 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/include/net/net.h b/include/net/net.h
index 55023e7..025dbf1 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -220,6 +220,8 @@ extern NICInfo nd_table[MAX_NICS];
 extern const char *host_net_devices[];
 
 /* from net.c */
+bool netdev_is_modern(const char *optarg);
+void netdev_parse_modern(const char *optarg);
 void net_client_parse(QemuOptsList *opts_list, const char *str);
 void show_netdevs(void);
 void net_init_clients(void);
diff --git a/net/net.c b/net/net.c
index 178257a..128a90f 100644
--- a/net/net.c
+++ b/net/net.c
@@ -54,6 +54,7 @@
 #include "net/colo-compare.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
+#include "qapi/qobject-input-visitor.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -63,6 +64,16 @@
 static VMChangeStateEntry *net_change_state_entry;
 static QTAILQ_HEAD(, NetClientState) net_clients;
 
+typedef struct NetdevQueueEntry {
+    Netdev *nd;
+    Location loc;
+    QSIMPLEQ_ENTRY(NetdevQueueEntry) entry;
+} NetdevQueueEntry;
+
+typedef QSIMPLEQ_HEAD(, NetdevQueueEntry) NetdevQueue;
+
+static NetdevQueue nd_queue = QSIMPLEQ_HEAD_INITIALIZER(nd_queue);
+
 /***********************************************************/
 /* network device redirectors */
 
@@ -1566,6 +1577,20 @@ out:
     return ret;
 }
 
+static void netdev_init_modern(void)
+{
+    while (!QSIMPLEQ_EMPTY(&nd_queue)) {
+        NetdevQueueEntry *nd = QSIMPLEQ_FIRST(&nd_queue);
+
+        QSIMPLEQ_REMOVE_HEAD(&nd_queue, entry);
+        loc_push_restore(&nd->loc);
+        net_client_init1(nd->nd, true, &error_fatal);
+        loc_pop(&nd->loc);
+        qapi_free_Netdev(nd->nd);
+        g_free(nd);
+    }
+}
+
 void net_init_clients(void)
 {
     net_change_state_entry =
@@ -1573,6 +1598,8 @@ void net_init_clients(void)
 
     QTAILQ_INIT(&net_clients);
 
+    netdev_init_modern();
+
     qemu_opts_foreach(qemu_find_opts("netdev"), net_init_netdev, NULL,
                       &error_fatal);
 
@@ -1583,6 +1610,36 @@ void net_init_clients(void)
                       &error_fatal);
 }
 
+/*
+ * Does this -netdev argument use modern rather than traditional syntax?
+ * Modern syntax is to be parsed with netdev_parse_modern().
+ * Traditional syntax is to be parsed with net_client_parse().
+ */
+bool netdev_is_modern(const char *optarg)
+{
+    return false;
+}
+
+/*
+ * netdev_parse_modern() uses modern, more expressive syntax than
+ * net_client_parse(), but supports only the -netdev option.
+ * netdev_parse_modern() appends to @nd_queue, whereas net_client_parse()
+ * appends to @qemu_netdev_opts.
+ */
+void netdev_parse_modern(const char *optarg)
+{
+    Visitor *v;
+    NetdevQueueEntry *nd;
+
+    v = qobject_input_visitor_new_str(optarg, "type", &error_fatal);
+    nd = g_new(NetdevQueueEntry, 1);
+    visit_type_Netdev(v, NULL, &nd->nd, &error_fatal);
+    visit_free(v);
+    loc_save(&nd->loc);
+
+    QSIMPLEQ_INSERT_TAIL(&nd_queue, nd, entry);
+}
+
 void net_client_parse(QemuOptsList *opts_list, const char *optarg)
 {
     if (!qemu_opts_parse_noisily(opts_list, optarg, true)) {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e69aa43..99fb49c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2801,7 +2801,11 @@ void qemu_init(int argc, char **argv)
                 break;
             case QEMU_OPTION_netdev:
                 default_net = 0;
-                net_client_parse(qemu_find_opts("netdev"), optarg);
+                if (netdev_is_modern(optarg)) {
+                    netdev_parse_modern(optarg);
+                } else {
+                    net_client_parse(qemu_find_opts("netdev"), optarg);
+                }
                 break;
             case QEMU_OPTION_nic:
                 default_net = 0;
-- 
2.7.4


