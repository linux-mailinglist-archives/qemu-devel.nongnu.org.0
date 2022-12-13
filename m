Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3CC64BEA1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:41:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5D0f-0001SS-2W; Tue, 13 Dec 2022 16:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D04-0001IX-KP
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:46 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D02-0007k0-UT
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:44 -0500
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BDLcaPB030603
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1670967577; bh=ZeqRkWTd2BT5/GKlC7ST3zyaMAEqj7qslbCZ6CRnJI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bFtvMAK8Nrfa6I+BLJ8G7VvNVO85Eaz/Ang7RP+PTLU0R6h97WzMLdg6f/sxsNB+9
 YDU2ca+RpwLrJbRDrhnCjlFGFa1kXGDfJgRzN2eQ3K7fvyldu0/6lwh4vqRRikxiNt
 UdgZ00VHhi1i56apMqsg3In3TE/e8Uy6d7iJL8ks5heS2rQhYlhCvq0iyauKdg1gBd
 TBJCw9GnZ6QbnDCKaW9Q5NgcmAC8dgu1DXiy2A+qEZFdb3DH48Z392yv93A9SviSJX
 joNFsnnZUDahgP5MJvhFBSkMghytLZbra+DcJOUWVPhaJTu0MJqz0foXtW24a3v+wB
 20fEw5hPnxHTA==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: elysia.witham@ll.mit.edu, alex.bennee@linaro.org, erdnaxe@crans.org,
 ma.mandourr@gmail.com, Andrew Fasano <fasano@mit.edu>
Subject: [PATCH 4/8] plugins: add core API functions for QPP callbacks
Date: Tue, 13 Dec 2022 16:37:53 -0500
Message-Id: <20221213213757.4123265-5-fasano@mit.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213213757.4123265-1-fasano@mit.edu>
References: <20221213213757.4123265-1-fasano@mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=fasano@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Elysia Witham <elysia.witham@ll.mit.edu>

Plugin callbacks and their registered functions are stored in a
separate struct which is accessible from the plugin's ctx.
In order for plugins to use another plugin's callbacks, we have
internal functions that resolve a plugin's name to its ctx and
find a target plugin.

Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 include/qemu/qemu-plugin.h | 10 ++++++++++
 plugins/core.c             | 23 +++++++++++++++++++++++
 plugins/loader.c           | 10 ++++++++++
 plugins/plugin.h           | 15 +++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 5326f33ce8..3ec82ce97f 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -14,6 +14,7 @@
 #include <inttypes.h>
 #include <stdbool.h>
 #include <stddef.h>
+#include <gmodule.h>
 
 /*
  * For best performance, build the plugin with -fvisibility=hidden so that
@@ -38,6 +39,15 @@
  */
 typedef uint64_t qemu_plugin_id_t;
 
+/**
+ * typedef cb_func_t - callback function pointer type
+ * @evdata: plugin callback defined event data
+ * @udata: plugin defined user data
+ *
+ * No return value.
+ */
+typedef void (*cb_func_t) (gpointer evdata, gpointer udata);
+
 /*
  * Versioning plugins:
  *
diff --git a/plugins/core.c b/plugins/core.c
index 6a50b4a6e6..0415a55ec5 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -236,6 +236,17 @@ void qemu_plugin_vcpu_exit_hook(CPUState *cpu)
     qemu_rec_mutex_unlock(&plugin.lock);
 }
 
+struct qemu_plugin_ctx *plugin_name_to_ctx_locked(const char* name)
+{
+    struct qemu_plugin_ctx *ctx;
+    QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
+        if (strcmp(ctx->name, name) == 0) {
+            return plugin_id_to_ctx_locked(ctx->id);
+        }
+    }
+    return NULL;
+}
+
 int name_to_plugin_version(const char *name)
 {
     struct qemu_plugin_ctx *ctx;
@@ -260,6 +271,18 @@ const char *id_to_plugin_name(qemu_plugin_id_t id)
     }
 }
 
+struct qemu_plugin_qpp_cb *plugin_find_qpp_cb(struct qemu_plugin_ctx *ctx,
+                                              const char *name)
+{
+    struct qemu_plugin_qpp_cb *cb;
+    QTAILQ_FOREACH(cb, &ctx->qpp_cbs, entry) {
+        if (strcmp(cb->name, name) == 0) {
+            return cb;
+        }
+    }
+    return NULL;
+}
+
 struct plugin_for_each_args {
     struct qemu_plugin_ctx *ctx;
     qemu_plugin_vcpu_simple_cb_t cb;
diff --git a/plugins/loader.c b/plugins/loader.c
index 12c0680e03..ab01d0753c 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -277,6 +277,7 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info, E
             break;
         }
     }
+    QTAILQ_INIT(&ctx->qpp_cbs);
     QTAILQ_INSERT_TAIL(&plugin.ctxs, ctx, entry);
     ctx->installing = true;
     rc = install(ctx->id, info, desc->argc, desc->argv);
@@ -303,6 +304,15 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info, E
     return 1;
 }
 
+void plugin_add_qpp_cb(struct qemu_plugin_ctx *ctx, const char *name)
+{
+    struct qemu_plugin_qpp_cb *new_cb;
+    new_cb = qemu_memalign(qemu_dcache_linesize, sizeof(*new_cb));
+    memset(new_cb, 0, sizeof(*new_cb));
+    new_cb->name = name;
+    QTAILQ_INSERT_TAIL(&ctx->qpp_cbs, new_cb, entry);
+}
+
 /* call after having removed @desc from the list */
 static void plugin_desc_free(struct qemu_plugin_desc *desc)
 {
diff --git a/plugins/plugin.h b/plugins/plugin.h
index 9e710c23a7..fee4741bc6 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -47,6 +47,14 @@ struct qemu_plugin_state {
     struct qht dyn_cb_arr_ht;
 };
 
+typedef void (*cb_func_t) (gpointer evdata, gpointer udata);
+
+struct qemu_plugin_qpp_cb {
+    const char *name;
+    cb_func_t registered_cb_funcs[QEMU_PLUGIN_EV_MAX];
+    int counter;
+    QTAILQ_ENTRY(qemu_plugin_qpp_cb) entry;
+};
 
 struct qemu_plugin_ctx {
     GModule *handle;
@@ -54,6 +62,7 @@ struct qemu_plugin_ctx {
     const char *name;
     int version;
     struct qemu_plugin_cb *callbacks[QEMU_PLUGIN_EV_MAX];
+    QTAILQ_HEAD(, qemu_plugin_qpp_cb) qpp_cbs;
     QTAILQ_ENTRY(qemu_plugin_ctx) entry;
     /*
      * keep a reference to @desc until uninstall, so that plugins do not have
@@ -106,4 +115,10 @@ int name_to_plugin_version(const char *name);
 
 const char *id_to_plugin_name(qemu_plugin_id_t id);
 
+struct qemu_plugin_qpp_cb *plugin_find_qpp_cb(struct qemu_plugin_ctx *plugin_ctx,
+                                              const char *cb_name);
+
+/* loader.c */
+void plugin_add_qpp_cb(struct qemu_plugin_ctx *ctx, const char *name);
+
 #endif /* PLUGIN_H */
-- 
2.34.1


