Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2892B5AA165
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 23:16:18 +0200 (CEST)
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrXs-00074o-IS
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 17:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1oTp2h-0002bf-6b
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:35:56 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:50280
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1oTp2f-0002R9-Eq
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:35:54 -0400
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 281IRv2i010380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Sep 2022 14:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1662056910; bh=knzxQ+knlh1GCYMrF32LK9BHiAKUl5jfg5+Wc9gLQxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AYWpdFWaEIvPulHw7rxuSHvrQ9RTKy57x+KI8GTkC5nEPddg5ZyxPvH+9s7ls5ISI
 coRblqutkYDVlamSRAIQ/8N1MZSXKQNg7p/yRPbqXsMgV3gcRHGbfS69/22yFd9rWf
 0EU9Di1L9JQcNat+hIPuwwuHbxwR6EJ4Loq+K/yYVwiCD6teUt+kCFzcO5PBeiJzh5
 GVlfOzzdjn7Gzh7IFqE0jf5PBhhXHWbWP6uJWfMvsWkUL7EFC6kaT+KNQpiUlKZYBT
 qoievv0T/A/Axm3IwCie1WIACzUEZbV45BRSIzHwEDwG5Lr/iz61NzhomXhUnxg4aJ
 tTfc7ACpZj7fQ==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, erdnaxe@crans.org, ma.mandourr@gmail.com,
 Andrew Fasano <fasano@mit.edu>
Subject: [RFC 4/4] tcg/plugins: Add example pair of QPP plugins
Date: Thu,  1 Sep 2022 14:27:34 -0400
Message-Id: <20220901182734.2987337-5-fasano@mit.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901182734.2987337-1-fasano@mit.edu>
References: <20220901182734.2987337-1-fasano@mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=fasano@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Sep 2022 17:11:41 -0400
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

The first plugin, qpp_srv exposes two functions and one callback that other
plugins can leverage. These functions are described in the corresponding
header file.

The second plugin, qpp_client, imports this header file, registers its
own function to run on a qpp_srv-provided callback, and directly calls
into the two exposed functions in qpp_srv.

Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 contrib/plugins/Makefile     |  2 ++
 contrib/plugins/qpp_client.c | 42 ++++++++++++++++++++++++++++++++++++
 contrib/plugins/qpp_client.h |  1 +
 contrib/plugins/qpp_srv.c    | 33 ++++++++++++++++++++++++++++
 contrib/plugins/qpp_srv.h    | 17 +++++++++++++++
 5 files changed, 95 insertions(+)
 create mode 100644 contrib/plugins/qpp_client.c
 create mode 100644 contrib/plugins/qpp_client.h
 create mode 100644 contrib/plugins/qpp_srv.c
 create mode 100644 contrib/plugins/qpp_srv.h

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index b7720fea0f..b7510de89c 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -21,6 +21,8 @@ NAMES += lockstep
 NAMES += hwprofile
 NAMES += cache
 NAMES += drcov
+NAMES += qpp_srv
+NAMES += qpp_client
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
diff --git a/contrib/plugins/qpp_client.c b/contrib/plugins/qpp_client.c
new file mode 100644
index 0000000000..de3335e167
--- /dev/null
+++ b/contrib/plugins/qpp_client.c
@@ -0,0 +1,42 @@
+#include <stdio.h>
+#include <qemu-plugin.h>
+#include <plugin-qpp.h>
+#include <glib.h>
+#include "qpp_srv.h"
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+void my_on_exit(int x, bool b)
+{
+  g_autoptr(GString) report = g_string_new("Client: on_exit runs with args: ");
+  g_string_append_printf(report, "%d, %d\n", x, b);
+  qemu_plugin_outs(report->str);
+
+  g_string_printf(report, "Client: calls qpp_srv's do_add(1): %d\n",
+                          qpp_srv_do_add(1));
+  qemu_plugin_outs(report->str);
+
+  g_string_printf(report, "Client: calls qpp_srv's do_sub(1): %d\n",
+                           qpp_srv_do_sub(1));
+  qemu_plugin_outs(report->str);
+}
+
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                   const qemu_info_t *info, int argc, char **argv) {
+
+    /*
+     * Register our "my_on_exit" function to run on the on_exit QPP-callback
+     * exported by qpp_srv
+     */
+    QPP_REG_CB("qpp_srv", on_exit, my_on_exit);
+
+    g_autoptr(GString) report = g_string_new(CURRENT_PLUGIN ": Call "
+                                             "qpp_srv's do_add(0) => ");
+    g_string_append_printf(report, "%d\n", qpp_srv_do_add(0));
+    qemu_plugin_outs(report->str);
+
+    g_string_printf(report, "Client: registered on_exit callback\n");
+    return 0;
+}
+
diff --git a/contrib/plugins/qpp_client.h b/contrib/plugins/qpp_client.h
new file mode 100644
index 0000000000..573923f580
--- /dev/null
+++ b/contrib/plugins/qpp_client.h
@@ -0,0 +1 @@
+void my_on_exit(int, bool);
diff --git a/contrib/plugins/qpp_srv.c b/contrib/plugins/qpp_srv.c
new file mode 100644
index 0000000000..61a6ab38ed
--- /dev/null
+++ b/contrib/plugins/qpp_srv.c
@@ -0,0 +1,33 @@
+#include <stdio.h>
+#include <qemu-plugin.h>
+#include <plugin-qpp.h>
+#include <gmodule.h>
+#include "qpp_srv.h"
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+QPP_CREATE_CB(on_exit);
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+  qemu_plugin_outs(CURRENT_PLUGIN "exit triggered, running all registered"
+                  " QPP callbacks\n");
+  QPP_RUN_CB(on_exit, 0, true);
+}
+
+QEMU_PLUGIN_EXPORT int do_add(int x)
+{
+  return x + 1;
+}
+
+QEMU_PLUGIN_EXPORT int do_sub(int x)
+{
+  return x - 1;
+}
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                   const qemu_info_t *info, int argc, char **argv) {
+    qemu_plugin_outs("qpp_srv loaded\n");
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+    return 0;
+}
diff --git a/contrib/plugins/qpp_srv.h b/contrib/plugins/qpp_srv.h
new file mode 100644
index 0000000000..ceb26e3d2c
--- /dev/null
+++ b/contrib/plugins/qpp_srv.h
@@ -0,0 +1,17 @@
+#ifndef QPP_SRV_H
+#define QPP_SRV_H
+
+/*
+ * Prototype for the on_exit callback: callback functions should be
+ * of type `void f(int, bool)`
+ */
+QPP_CB_PROTOTYPE(void, on_exit, int, bool);
+
+/*
+ * Prototypes for the do_add and do_sub functions. Both return an int and
+ * take an int as an argument.
+ */
+QPP_FUN_PROTOTYPE(qpp_srv, int, do_add, int);
+QPP_FUN_PROTOTYPE(qpp_srv, int, do_sub, int);
+
+#endif /* QPP_SRV_H */
-- 
2.34.1


