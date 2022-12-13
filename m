Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54264BEAA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:43:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5D0j-0001Uf-BT; Tue, 13 Dec 2022 16:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D0E-0001Oj-Jc
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:58 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D0B-0007vA-1E
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:52 -0500
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BDLcaPE030603
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1670967585; bh=7noylMOefmKqet5bCgbsxpsvO0xxjBERKsJphKKHIj4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OUTJE2uhLQiDrzoJ4UTUMMiZw9eWUYWdkAm9KYbguwCIqCUExPZwzDA+I7dGx8IVj
 NVC32jzmnFia/8zw2zfMOlxjWE8nYykeirECQWIYhqq5p1hRRmrX3lN3I0VErFEwlS
 nkz/1tx7pAh4Fg8RGLTqibo385LiUwt6rx0dciV4gN+oVw8Np4ME8/TKURLAuQSlp9
 qaZFQWwwVqsCT4tquXN6yEhLBKBRz/hJgri8fDE5evmSGBMmEr1sbRN2op16dyFXZQ
 RHIgiQX5qbHamJz7/giJGrG+1k4lzFEcDEZcVb1EIB+x5FARTgLSDyeNolBnUUuW8R
 3VNjAij9+2O+w==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: elysia.witham@ll.mit.edu, alex.bennee@linaro.org, erdnaxe@crans.org,
 ma.mandourr@gmail.com, Andrew Fasano <fasano@mit.edu>
Subject: [PATCH 7/8] include/qemu: added macro for QPP import function
Date: Tue, 13 Dec 2022 16:37:56 -0500
Message-Id: <20221213213757.4123265-8-fasano@mit.edu>
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

Plugins can use this macro in a header file which can be included
by both the exporting and importing plugins. The macro will
either use qemu_plugin_import_function to import the function
or just define it if the plugin is the same one that exports it.
If importing a function, "_qpp" will be appended to the end of the
function name.

Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 include/qemu/plugin-qpp.h | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 include/qemu/plugin-qpp.h

diff --git a/include/qemu/plugin-qpp.h b/include/qemu/plugin-qpp.h
new file mode 100644
index 0000000000..7aea98a14d
--- /dev/null
+++ b/include/qemu/plugin-qpp.h
@@ -0,0 +1,54 @@
+#ifndef PLUGIN_QPP_H
+#define PLUGIN_QPP_H
+
+/*
+ * Facilities for "Plugin to plugin" (QPP) interactions between tcg plugins.
+ * These allows for direct function calls between loaded plugins. For more
+ * details see docs/devel/plugin.rst.
+ */
+
+
+/*
+ * Internal macros
+ */
+#define _PLUGIN_STR(s) #s
+#define PLUGIN_STR(s) _PLUGIN_STR(s)
+#define _PLUGIN_CONCAT(x, y) x##y
+#define PLUGIN_CONCAT(x, y) _PLUGIN_CONCAT(x, y)
+#define _QPP_SETUP_NAME(fn) PLUGIN_CONCAT(_qpp_setup_, fn)
+
+/*
+ * A header file that defines an exported function should use
+ * the QPP_FUN_PROTOTYPE macro to create the necessary types.
+ *
+ * The generated function named after the output of QPP_SETUP_NAME should
+ * dynamically resolve a target function in another plugin or raise a fatal
+ * error on failure. This function has the constructor attribute so it will
+ * run immediately when the plugin shared object object is loaded.
+ *
+ * Note that the variable qemu_plugin_name must be set before this macro is
+ * used. In other words the plugin that includes a header file with these
+ * macros should set qemu_plugin_name before including such headers. When the
+ * generated function is run it compares the current plugin name to the name
+ * of the plugin that provides the target function.
+ *
+ * If the target plugin is not the current plugin it will resolve the function
+ * pointer from qemu_plugin_import_function, correctly cast it, and assign the
+ * function pointer "[function_name]_qpp" which can then be used by the plugin
+ * that imported it.
+ */
+
+#define QPP_FUN_PROTOTYPE(plugin_name, fn_ret, fn, args)                      \
+  fn_ret fn(args);                                                            \
+  typedef fn_ret(*PLUGIN_CONCAT(fn, _t))(args);                               \
+  fn##_t fn##_qpp;                                                            \
+  void _QPP_SETUP_NAME(fn) (void);                                            \
+                                                                              \
+  void __attribute__ ((constructor)) _QPP_SETUP_NAME(fn) (void) {             \
+    if (strcmp(qemu_plugin_name, #plugin_name) != 0) {                        \
+        fn##_qpp = (fn##_t)qemu_plugin_import_function(                       \
+                                                      PLUGIN_STR(plugin_name),\
+                                                      PLUGIN_STR(fn));        \
+    }                                                                         \
+  }
+#endif /* PLUGIN_QPP_H */
-- 
2.34.1


