Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7330607404
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:26:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloIj-0002ac-0H
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:26:49 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo2r-00053y-Py
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2R-0003UW-AD
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:59 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2A-0001QL-K8
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:58 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MZCOl-1oYnKk0xZB-00VB6P; Fri, 21 Oct 2022 11:09:31 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v14 04/17] qapi: net: introduce a way to bypass
 qemu_opts_parse_noisily()
Date: Fri, 21 Oct 2022 11:09:09 +0200
Message-Id: <20221021090922.170074-5-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021090922.170074-1-lvivier@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zbG1JYCFOKqctxtEiVdg+gddOmVeMfSH+Cb/QzJlwc7bIvDVcvo
 B81fAqeBKxRhjvrzjUzb1lB4siNjb+IX0+t/6QBQuexzGjpuSLRIncmd3vTCbJt4N15uiOs
 5RiWC7dGi06ZBg6LX8jXbhZNWpF7OOUhGAEKpeOe/Ad5oJRggNcx4SOh3onniF213lr7ZIX
 1A8bm8wEpT4O55KutZL/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6I6MKr2rA3E=:8iZAY7kw5shZUVvyNwuXXM
 zv3SyJvx9Mx8olYxmrJ427vyu3FHkqeRLM50HNsobbjYlzJ9C3TnHnAU7wazy50u7if9YtB2o
 usbeotygGXA0Dbh/LLQKsBpUEB71kOeuLzi74lbrybwY74DFn0BsmJrSCO768z79I8wRs51Xg
 ZE2fueJm/KQx/JPRjjOQqo0kTHnJloK+ILgeTnSSagWuXqeA0d1Bb9Eva1BXfL9cIa6VFH7jQ
 WlW/Ry0VIF/ANSPLvGRcEp9mnqKA6JPtg3+m8IhRbWvLwG1OSJVz4jAXbbvLLHP4mAnN92Y9s
 0VmuPXb+IoeVkpRduZE1ykjFXT6c4ZsfL6Up2UCUpuamIDa0L6xNpIwvYh+rHrKaZlFb9e03F
 qPeKg4rDwSVuGfD+ZPXXy2BEtftjm4shJ4E5f2l3ognuipMD2nSVuym6d0kv1mQDdD2n+Qo61
 700ggZK+fOtb4qxw6BOSUdqblOUpNTa4XA5xanepW5iuAcwSCUGRe9jSZ4GfxGbQJrtPxTLlX
 gSmO37gQRZoo+jUWJnSrwHlX0ztk9chUrN0bDF2dF/rKM9gw7VJNI2U3HH1tZy0waa145wuq1
 KjO7g847umQY+H5jdw7Z0yX88yvFM3CnDP5wviyJPMo1DaReDyBC2rIcLAUhMjgykLBouWx0l
 M+JaMjarGd8t+fdykKzQicYt5MJqSGXlQVuMP3WzSAB7llUNavQ8E/MAnsTYyqLzN/X4MBN38
 rzeD5dzjn359r8uUF3G2CmHl5vRyoYo+cG7HDdzBB+35Om7GyN+/ai0DTuzecP4Spv6zhkuTY
 EaHmpmS
Received-SPF: permerror client-ip=217.72.192.75;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 include/net/net.h |  2 ++
 net/net.c         | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c      |  6 ++++-
 3 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/include/net/net.h b/include/net/net.h
index 55023e7e9fa9..025dbf1e143b 100644
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
index f056e8aebfb2..ffe3e5a2cf1d 100644
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
 
@@ -1562,6 +1573,20 @@ out:
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
@@ -1569,6 +1594,8 @@ void net_init_clients(void)
 
     QTAILQ_INIT(&net_clients);
 
+    netdev_init_modern();
+
     qemu_opts_foreach(qemu_find_opts("netdev"), net_init_netdev, NULL,
                       &error_fatal);
 
@@ -1579,6 +1606,36 @@ void net_init_clients(void)
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
index e69aa43de469..99fb49c7b0ee 100644
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
2.37.3


