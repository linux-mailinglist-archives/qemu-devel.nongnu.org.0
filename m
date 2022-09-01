Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA685AA168
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 23:16:24 +0200 (CEST)
Received: from localhost ([::1]:48220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrXz-0007JE-8H
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 17:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1oTp2j-0002eU-M2
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:35:57 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:50280
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1oTp2h-0002R9-BF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:35:57 -0400
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 281IRv2h010380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Sep 2022 14:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1662056907; bh=alqlzwQKfFpi3MAZrP2ZJcVCA33Noh+eVOID7rx3Pyo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CmqBg+N/Nv4dmMLiBjrWVwYloTz+foilhzF1xbobbDum1p3+k/9Zw3ZsGL2RVrqUu
 BqYISNlXEJPOSLac0xolOcpZNr0PHPsR5gQ7m5lYfF7tBooqMY9QzoVoZfSeGmBvIU
 mtqC6LfFzhbYt/3TVFKNZlOPIfj69Xi6p1p2eQv1IrSy9JTdTuCnFvztKRcQbxAGsb
 yLdAaM1P+rUqJFwMDIKZ6K0l9zirhCc79PYIi9tJ5yI9BpFG8Wf8/smAs59b0myZWm
 VBZgiEk98k0Mg0j2bnCQ6ThybDZqZ44vWM9GM/S3y0LHl4zi6wGZHnyU3QffhXVZSk
 il+PkiRGbAY9Q==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, erdnaxe@crans.org, ma.mandourr@gmail.com,
 Andrew Fasano <fasano@mit.edu>
Subject: [RFC 3/4] tcg/plugins: Support for inter-plugin interactions
Date: Thu,  1 Sep 2022 14:27:33 -0400
Message-Id: <20220901182734.2987337-4-fasano@mit.edu>
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

Expand tcg-plugin system to allow for plugins to export functions
and callbacks that can be used by other plugins. Exported functions
can be called at runtime by other loaded plugins. Loaded plugins
can register functions with exported callbacks and have these
functions run whenever the callback is triggered.

Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 include/qemu/plugin-qpp.h    | 252 +++++++++++++++++++++++++++++++++++
 plugins/core.c               |  11 ++
 plugins/loader.c             |  24 ++++
 plugins/plugin.h             |   5 +
 plugins/qemu-plugins.symbols |   1 +
 5 files changed, 293 insertions(+)
 create mode 100644 include/qemu/plugin-qpp.h

diff --git a/include/qemu/plugin-qpp.h b/include/qemu/plugin-qpp.h
new file mode 100644
index 0000000000..befa4f9b8b
--- /dev/null
+++ b/include/qemu/plugin-qpp.h
@@ -0,0 +1,252 @@
+#ifndef PLUGIN_QPP_H
+#define PLUGIN_QPP_H
+
+/*
+ * Facilities for "QEMU plugin to plugin" (QPP) interactions between tcg
+ * plugins.  These allow for an inter-plugin callback system as well
+ * as direct function calls between loaded plugins. For more details see
+ * docs/devel/plugin.rst.
+ */
+
+#include <dlfcn.h>
+#include <gmodule.h>
+#include <assert.h>
+extern GModule * qemu_plugin_name_to_handle(const char *);
+
+#define PLUGIN_CONCAT(x, y) _PLUGIN_CONCAT(x, y)
+#define _PLUGIN_CONCAT(x, y) x##y
+#define QPP_NAME(plugin, fn) PLUGIN_CONCAT(plugin, PLUGIN_CONCAT(_, fn))
+#define QPP_MAX_CB 256
+#define _QPP_SETUP_NAME(plugin, fn) PLUGIN_CONCAT(_qpp_setup_, \
+                                    QPP_NAME(plugin, fn))
+
+/*
+ **************************************************************************
+ * The QPP_CREATE_CB and QPP_RUN_CB macros are to be used by a plugin that
+ * wishs to create and later trigger QPP-based callback events. These are
+ * events that the plugin can detect (i.e., through analysis of guest state)
+ * that may be of interest to other plugins.
+ **************************************************************************
+ */
+
+/*
+ * QPP_CREATE_CB(name) will create a callback by defining necessary internal
+ * functions and variables based off the provided name. It must be run before
+ * triggering the callback event (with QPP_RUN_CB). This macro will create the
+ * following variables and functions, based off the provided name:
+ *
+ * 1) qpp_[name]_cb is an array of function pointers storing the
+ *    registered callbacks.
+ * 2) qpp_[name]_num_cb stores the number of functions stored with this
+ *    callback.
+ * 3) qpp_add_cb_[name] is a function to add a pointer into the qpp_[name]_cb
+ *    array and increment qpp_[name]_num_cb.
+ * 4) qpp_remove_cb_[name] finds a registered callback, deletes it, decrements
+ *    _num_cb and shifts the _cb array appropriately to fill the gap.
+ *
+ * Important notes:
+ *
+ * 1) Multiple callbacks can be registered for the same event, however consumers
+ *    can not control the order in which they are called and this order may
+ *    change in the future.
+ *
+ * 2) If this macro is incorrectly used multiple times in the same plugin with
+ *    the same callback name set, it will raise a compilation error since
+ *    these variables would then be defined multiple times. The same callback
+ *    name can, however, be created in distrinct plugins without issue.
+ */
+#define QPP_CREATE_CB(cb_name)                              \
+void qpp_add_cb_##cb_name(cb_name##_t fptr);                \
+bool qpp_remove_cb_##cb_name(cb_name##_t fptr);             \
+cb_name##_t * qpp_##cb_name##_cb[QPP_MAX_CB];               \
+int qpp_##cb_name##_num_cb;                                 \
+                                                            \
+void qpp_add_cb_##cb_name(cb_name##_t fptr)                 \
+{                                                           \
+  assert(qpp_##cb_name##_num_cb < QPP_MAX_CB);              \
+  qpp_##cb_name##_cb[qpp_##cb_name##_num_cb] = fptr;        \
+  qpp_##cb_name##_num_cb += 1;                              \
+}                                                           \
+                                                            \
+bool qpp_remove_cb_##cb_name(cb_name##_t fptr)              \
+{                                                           \
+  int i = 0;                                                \
+  bool found = false;                                       \
+  for (; i < MIN(QPP_MAX_CB, qpp_##cb_name##_num_cb); i++) {\
+    if (!found && fptr == qpp_##cb_name##_cb[i]) {          \
+        found = true;                                       \
+        qpp_##cb_name##_num_cb--;                           \
+    }                                                       \
+    if (found && i < QPP_MAX_CB - 2) {                      \
+        qpp_##cb_name##_cb[i] = qpp_##cb_name##_cb[i + 1];  \
+    }                                                       \
+  }                                                         \
+  return found;                                             \
+}
+
+
+/*
+ * QPP_RUN_CB(name, args...) should be run by the plugin that created
+ * a callback whenever it wishes to trigger the callback functions that
+ * have been registered with its previously-created callback of the provided
+ * name. If this macro is run with a callback name that was not previously
+ * created, a compile time error will be raised.
+ */
+#define QPP_RUN_CB(cb_name, ...) do {                           \
+  int cb_idx;                                                   \
+  for (cb_idx = 0; cb_idx < qpp_##cb_name##_num_cb; cb_idx++) { \
+    if (qpp_##cb_name##_cb[cb_idx] != NULL) {                   \
+      qpp_##cb_name##_cb[cb_idx](__VA_ARGS__);                  \
+    }                                                           \
+  }                                                             \
+} while (false)
+
+/*
+ * A header file that defines a callback function should use
+ * the QPP_CB_PROTOTYPE macro to create the necessary types.
+ */
+#define QPP_CB_PROTOTYPE(fn_ret, name, ...) \
+  typedef fn_ret(PLUGIN_CONCAT(name, _t))(__VA_ARGS__);
+
+/*
+ *****************************************************************************
+ * The QPP_REG_CB and QPP_REMOVE_CB macros are to be used by plugins that
+ * wish to run internal logic when another plugin determines that some event
+ * has occured. The plugin name, target callback name, and a local function
+ * are provided to these macros.
+ *****************************************************************************
+ */
+
+/*
+ * When a plugin wishes to register a function `cb_func` with a callback
+ * `cb_name` provided `other_plugin`, it must use the QPP_REG_CB.
+ */
+#define QPP_REG_CB(other_plugin, cb_name, cb_func)      \
+{                                                       \
+  dlerror();                                            \
+  void *h = qemu_plugin_name_to_handle(other_plugin);   \
+  if (!h) {                                             \
+    fprintf(stderr, "In trying to add plugin callback, "\
+                    "couldn't load %s plugin\n",        \
+                    other_plugin);                      \
+    assert(h);                                          \
+  }                                                     \
+  void (*add_cb)(cb_name##_t fptr);                     \
+  if (g_module_symbol(h, "qpp_add_cb_" #cb_name,        \
+                      (gpointer *) &add_cb)) {          \
+    add_cb(cb_func);                                    \
+  } else {                                              \
+    fprintf(stderr, "Could not find symbol " #cb_name   \
+            " in " #other_plugin "\n");                 \
+  }                                                     \
+}
+
+/*
+ * If a plugin wishes to disable a previously-registered `cb_func` it should
+ * use the QPP_REMOVE_CB macro.
+ */
+#define QPP_REMOVE_CB(other_plugin, cb_name, cb_func)            \
+{                                                                \
+  dlerror();                                                     \
+  void *op = panda_get_plugin_by_name(other_plugin);             \
+  if (!op) {                                                     \
+    fprintf(stderr, "In trying to remove plugin callback, "      \
+                    "couldn't load %s plugin\n", other_plugin);  \
+    assert(op);                                                  \
+  }                                                              \
+  void (*rm_cb)(cb_name##_t fptr) = (void (*)(cb_name##_t))      \
+                                    dlsym(op, "qpp_remove_cb_"   \
+                                              #cb_name);         \
+  assert(rm_cb != 0);                                            \
+  rm_cb(cb_func);                                                \
+}
+
+/*
+ *****************************************************************************
+ * The QPP_FUN_PROTOTYPE enables a plugin to expose a local function to other
+ * plugins. The macro should be used in a header file that is included
+ * by both the plugin that defines the function as well as other plugins
+ * that wish to call the function.
+ *****************************************************************************
+ */
+
+/*
+ * A header file that defines an exported function should use the
+ * QPP_FUN_PROTOTYPE to create the necessary types. When other plugins
+ * include this header, a function pointer named `[plugin_name]_[fn]` will
+ * be created and available for the plugin to call.
+ *
+ * Note that these functions are not callbacks, but instead regular
+ * functions that are exported by one plugin such that they can be called by
+ * others.
+ *
+ * In particular, this macro will create a function pointer by combining the
+ * `plugin_name` with an underscore and the name provided in `fn`. It will
+ * create a function to run on plugin load, that initializes this function
+ * pointer to the function named `fn` inside the plugin named `plugin_name`.
+ * If this fails, an error will be printed and the plugin will abort.
+ *
+ * There are three distinct cases this macro must handle:
+ * 1) When the header is loaded by the plugin that defines the function.
+ *    In this case, we do not need to find the symbol externally.
+ *    qemu_plugin_name_to_handle will return NULL, we see that the
+ *    target plugin matches CURRENT_PLUGIN and do nothing.
+ * 2) When the header is loaded by another plugin but the function
+ *    is not available (i.e., the target plugin isn't loaded or the
+ *    target plugin does not export the requested function). In this case we
+ *    raise a fatal error.
+ * 3) When the header is loaded by another plugin. In this case
+ *    we need to get a handle to the target plugin and then use
+ *    g_module_symbol to resolve the symbol and store it as the fn_name.
+ *    If we get the handle, but can't resolve the symbol, raise a fatal error.
+ *
+ * This plugin creates the following local variables and functions:
+ *
+ * 1) `fn`: A prototype for the provided function, with the specified arguments.
+ *    This is necessary for case 1 above and irrelevant for the others.
+ * 2) A function pointer typedef for `[fn]_t` set to a pointer of the type of
+ *    `fn`.
+ * 3) A function pointer (of type `[fn]_t`) named `[plugin_name]_[fn]`
+ * 4) A constructor function named "_qpp_setup_[plugin_name]_[fn]" that will
+ *    run when the plugin is loaded. In case 1 above, it will do nothing. In
+ *    case 2 it will print an error to stderr and abort. In case 3 it will
+ *    update the function pointer "[plugin_name]_[fn]" to point to the target
+ *    function.
+ *
+ * After this constructor runs, the plugin can directly call the target function
+ * using `[plugin_name]_[fn]()`.
+ *
+ * For example, consider a plugin named "my_plugin" that wishes to export a
+ * function  named "my_func" that returns void and takes a single integer arg.
+ * This would work as follows:
+ * 1) The header file for the plugin, my_plugin.h, should include
+ *    QPP_FUN_PROTOTYPE(my_plugin, void, my_func, int) which will define the
+ *    function prototype and necessary internal state.
+ * 2) This header should be included by my_plugin.c which should also include
+ *    QEMU_PLUGIN_EXPORT void my_func(int) {...} with the function definition.
+ * 3) Other plugins can get access to this function by including my_plugin.h
+ *    which will set up the function pointer `my_plugin_my_func` automatically
+ *    using the internal state here.
+ *
+ */
+#define QPP_FUN_PROTOTYPE(plugin_name, fn_ret, fn, args)                      \
+  fn_ret fn(args);                                                            \
+  typedef fn_ret(*PLUGIN_CONCAT(fn, _t))(args);                               \
+  fn##_t QPP_NAME(plugin_name, fn);                                           \
+  void _QPP_SETUP_NAME(plugin_name, fn) (void);                               \
+                                                                              \
+  void __attribute__ ((constructor)) _QPP_SETUP_NAME(plugin_name, fn) (void) {\
+    GModule *h = qemu_plugin_name_to_handle(#plugin_name);                    \
+    if (!h && strcmp(CURRENT_PLUGIN, #plugin_name) != 0) {        \
+      fprintf(stderr, "Error plugin %s cannot access %s. Is it loaded?\n",    \
+                       CURRENT_PLUGIN, #plugin_name);             \
+      abort();                                                                \
+    } else if (h && !g_module_symbol(h, #fn,                                  \
+                           (gpointer *)&QPP_NAME(plugin_name, fn))) {         \
+      fprintf(stderr, "Error loading symbol " # fn " from plugin "            \
+                      # plugin_name "\n");                                    \
+      abort();                                                                \
+    }                                                                         \
+  }
+
+#endif /* PLUGIN_QPP_H */
diff --git a/plugins/core.c b/plugins/core.c
index 792262da08..81c714bbf4 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -236,6 +236,17 @@ void qemu_plugin_vcpu_exit_hook(CPUState *cpu)
     qemu_rec_mutex_unlock(&plugin.lock);
 }
 
+GModule *qemu_plugin_name_to_handle(const char* name)
+{
+    struct qemu_plugin_ctx *ctx;
+    QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
+        if (is_plugin_named(*ctx, name)) {
+            return plugin_id_to_ctx_locked(ctx->id)->handle;
+        }
+    }
+    return NULL;
+}
+
 struct plugin_for_each_args {
     struct qemu_plugin_ctx *ctx;
     qemu_plugin_vcpu_simple_cb_t cb;
diff --git a/plugins/loader.c b/plugins/loader.c
index 88c30bde2d..26d3c14661 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -265,6 +265,30 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info, E
     return 1;
 }
 
+/**
+ * is_plugin_named - compare a plugins's name to a provided name
+ * @ctx: the ctx for the plugin in question
+ * @name: the name that should be used in the comparison
+ *
+ * Returns true if the names match.
+ */
+
+bool is_plugin_named(struct qemu_plugin_ctx ctx, const char *name)
+{
+  char *plugin_basename = basename(ctx.desc->path);
+  /*
+   * First resolve the name of the shared object for the current plugin,
+   * then check if it could possibly be of the form libNAME.so
+   * where NAME is the provided name. If so, compare the strings.
+   */
+  if (plugin_basename == NULL || strlen(plugin_basename) != strlen(name) + 6) {
+    return false;
+  }
+
+  return strncmp(plugin_basename + 3, name,
+                 strlen(plugin_basename) - 6) == 0;
+}
+
 /* call after having removed @desc from the list */
 static void plugin_desc_free(struct qemu_plugin_desc *desc)
 {
diff --git a/plugins/plugin.h b/plugins/plugin.h
index 5eb2fdbc85..69d9b09d4c 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -97,4 +97,9 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
 
 void exec_inline_op(struct qemu_plugin_dyn_cb *cb);
 
+GModule *qemu_plugin_name_to_handle(const char* name);
+
+/* loader.c */
+bool is_plugin_named(struct qemu_plugin_ctx ctx, const char *name);
+
 #endif /* PLUGIN_H */
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 71f6c90549..d98c0bc38a 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -18,6 +18,7 @@
   qemu_plugin_mem_size_shift;
   qemu_plugin_n_max_vcpus;
   qemu_plugin_n_vcpus;
+  qemu_plugin_name_to_handle;
   qemu_plugin_outs;
   qemu_plugin_path_to_binary;
   qemu_plugin_register_atexit_cb;
-- 
2.34.1


