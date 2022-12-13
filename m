Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9064BED4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5D0m-0001VK-5S; Tue, 13 Dec 2022 16:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D09-0001JR-9C
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:49 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D07-0007km-60
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:48 -0500
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BDLcaPC030603
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1670967579; bh=MO+yNbqxssUgwRZwoPiy6Wwl9yYxJ9O7XdO8prt82i0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GmJyqnvRAfg0n/L/0te6z+/H0Z2wBXpkOhCTzrZEmNzeow3pSjcX68+RUc8BqoLeP
 by1fmGGoJX2ohUbwkfPGZ1hMkTZKCaAgd4N3t5R0sdTe2e5DdlIlWekwVFTHoraSt3
 zYy3eELi3R/nL+7j0MQj7XZS7QlqSjLL3bdHisdGbT2Z6PIrZoDhzh8ZgHdD/0vfF5
 gNoW2+h/gZb4gY5xRdlSjgz7mUQA96VtJI9WHByteSpWdKjp16rdCVEflatx7xTccJ
 orGdYCh2hWbJYi1fjh8eIavGwa9+pP0ogz5WH/8ExnLRiPQClIRDLbvdAaMl5aiDmu
 N5y8nDtxLfzlQ==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: elysia.witham@ll.mit.edu, alex.bennee@linaro.org, erdnaxe@crans.org,
 ma.mandourr@gmail.com, Andrew Fasano <fasano@mit.edu>
Subject: [PATCH 5/8] plugins: implement QPP callbacks
Date: Tue, 13 Dec 2022 16:37:54 -0500
Message-Id: <20221213213757.4123265-6-fasano@mit.edu>
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

Plugins are able to use API functions which are explained in
<qemu-plugin.h> to create and run their own callbacks and register
functions on another plugin's callbacks.

Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 include/qemu/qemu-plugin.h   |  46 +++++++++++++++
 plugins/api.c                | 111 +++++++++++++++++++++++++++++++++++
 plugins/loader.c             |   1 +
 plugins/qemu-plugins.symbols |   4 ++
 4 files changed, 162 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 3ec82ce97f..4221545015 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -354,6 +354,52 @@ size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
  */
 uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
 
+/**
+ * qemu_plugin_create_callback() - create a new cb with given name
+ * @id: unique plugin id
+ * @name: name of cb
+ *
+ * Returns: true on success, false otherwise
+ */
+bool qemu_plugin_create_callback(qemu_plugin_id_t id, const char *name);
+
+/**
+ * qemu_plugin_run_callback() - run all functions registered to cb with given
+ * name using given args
+ * @id: unique plugin id
+ * @name: name of cb
+ * @evdata: pointer to evdata struct
+ * @udata: pointer to udata struct
+ *
+ * Returns: true if any registerd functions were run, false otherwise
+ */
+bool qemu_plugin_run_callback(qemu_plugin_id_t id, const char *name,
+                              gpointer evdata, gpointer udata);
+
+/**
+ * qemu_plugin_reg_callback() - register a function to be called on cb with
+ * given name
+ * @target_plugin: name of plugin that provides the callback
+ * @cb_name: name of the callback
+ * @function_pointer: pointer to function being registered
+ *
+ * Returns: true if function was registered successfully, false otherwise
+ */
+bool qemu_plugin_reg_callback(const char *target_plugin, const char *cb_name,
+                              cb_func_t function_pointer);
+
+/**
+ * qemu_plugin_unreg_callback() - unregister a function to be called on cb
+ * with given name
+ * @target_plugin: name of plugin that provides the callback
+ * @cb_name: name of the callback
+ * @function_pointer: pointer to function being unregistered
+ *
+ * Returns: true if function was unregistered successfully, false otherwise
+ */
+bool qemu_plugin_unreg_callback(const char *target_plugin, const char *cb_name,
+                                cb_func_t function_pointer);
+
 /**
  * qemu_plugin_tb_get_insn() - retrieve handle for instruction
  * @tb: opaque handle to TB passed to callback
diff --git a/plugins/api.c b/plugins/api.c
index 2078b16edb..1f7ea718dc 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -400,6 +400,117 @@ bool qemu_plugin_bool_parse(const char *name, const char *value, bool *ret)
     return name && value && qapi_bool_parse(name, value, ret, NULL);
 }
 
+bool qemu_plugin_create_callback(qemu_plugin_id_t id, const char *cb_name)
+{
+    struct qemu_plugin_ctx *ctx = plugin_id_to_ctx_locked(id);
+    if (ctx == NULL) {
+        error_report("Cannot create callback with invalid plugin ID");
+        return false;
+    }
+
+    if (ctx->version < QPP_MINIMUM_VERSION) {
+        error_report("Plugin %s cannot create callbacks as its PLUGIN_VERSION"
+                     " %d is below QPP_MINIMUM_VERSION (%d).",
+                     ctx->name, ctx->version, QPP_MINIMUM_VERSION);
+        return false;
+    }
+
+    if (plugin_find_qpp_cb(ctx, cb_name)) {
+        error_report("Plugin %s already created callback %s", ctx->name,
+                     cb_name);
+        return false;
+    }
+
+    plugin_add_qpp_cb(ctx, cb_name);
+    return true;
+}
+
+bool qemu_plugin_run_callback(qemu_plugin_id_t id, const char *cb_name,
+                              gpointer evdata, gpointer udata) {
+    struct qemu_plugin_ctx *ctx = plugin_id_to_ctx_locked(id);
+    if (ctx == NULL) {
+        error_report("Cannot run callback with invalid plugin ID");
+        return false;
+    }
+
+    struct qemu_plugin_qpp_cb *cb = plugin_find_qpp_cb(ctx, cb_name);
+    if (!cb) {
+        error_report("Can not run previously-unregistered callback %s in "
+                     "plugin %s", cb_name, ctx->name);
+        return false;
+    }
+
+    for (int i = 0; i < cb->counter; i++) {
+        cb_func_t qpp_cb_func = cb->registered_cb_funcs[i];
+        qpp_cb_func(evdata, udata);
+    }
+
+    return (cb->registered_cb_funcs[0] != NULL);
+}
+
+bool qemu_plugin_reg_callback(const char *target_plugin, const char *cb_name,
+                              cb_func_t function_pointer) {
+    struct qemu_plugin_ctx *ctx = plugin_name_to_ctx_locked(target_plugin);
+    if (ctx == NULL) {
+        error_report("Cannot register callback with unknown plugin %s",
+                     target_plugin);
+      return false;
+    }
+
+    struct qemu_plugin_qpp_cb *cb = plugin_find_qpp_cb(ctx, cb_name);
+    if (!cb) {
+        error_report("Cannot register a function to run on callback %s in "
+                     "plugin %s as that callback does not exist",
+                     cb_name, target_plugin);
+        return false;
+    }
+
+    if (cb->counter == QEMU_PLUGIN_EV_MAX) {
+        error_report("The maximum number of allowed callbacks are already "
+                     "registered for callback %s in plugin %s",
+                     cb_name, target_plugin);
+        return false;
+    }
+
+    cb->registered_cb_funcs[cb->counter] = function_pointer;
+    cb->counter++;
+    return true;
+}
+
+bool qemu_plugin_unreg_callback(const char *target_plugin, const char *cb_name,
+                              cb_func_t function_pointer) {
+    struct qemu_plugin_ctx *ctx = plugin_name_to_ctx_locked(target_plugin);
+    if (ctx == NULL) {
+        error_report("Cannot remove callback function from unknown plugin %s",
+                     target_plugin);
+        return false;
+    }
+
+    struct qemu_plugin_qpp_cb *cb = plugin_find_qpp_cb(ctx, cb_name);
+    if (!cb) {
+        error_report("Cannot remove a function to run on callback %s in "
+                     "plugin %s as that callback does not exist",
+                     cb_name, target_plugin);
+        return false;
+    }
+
+    for (int i = 0; i < cb->counter; i++) {
+        if (cb->registered_cb_funcs[i] == function_pointer) {
+            for (int j = i + 1; j < cb->counter; j++) {
+                cb->registered_cb_funcs[i] = cb->registered_cb_funcs[j];
+                i++;
+            }
+            cb->registered_cb_funcs[i] = NULL;
+            cb->counter--;
+            return true;
+        }
+    }
+    error_report("Function to remove not found in registered functions "
+                 "for callback %s in plugin %s",
+                 cb_name, target_plugin);
+    return false;
+}
+
 /*
  * Binary path, start and end locations
  */
diff --git a/plugins/loader.c b/plugins/loader.c
index ab01d0753c..7f047ebc99 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -310,6 +310,7 @@ void plugin_add_qpp_cb(struct qemu_plugin_ctx *ctx, const char *name)
     new_cb = qemu_memalign(qemu_dcache_linesize, sizeof(*new_cb));
     memset(new_cb, 0, sizeof(*new_cb));
     new_cb->name = name;
+    new_cb->counter = 0;
     QTAILQ_INSERT_TAIL(&ctx->qpp_cbs, new_cb, entry);
 }
 
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 71f6c90549..b7013980cf 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -3,6 +3,10 @@
   qemu_plugin_end_code;
   qemu_plugin_entry_code;
   qemu_plugin_get_hwaddr;
+  qemu_plugin_create_callback;
+  qemu_plugin_run_callback;
+  qemu_plugin_reg_callback;
+  qemu_plugin_unreg_callback;
   qemu_plugin_hwaddr_device_name;
   qemu_plugin_hwaddr_is_io;
   qemu_plugin_hwaddr_phys_addr;
-- 
2.34.1


