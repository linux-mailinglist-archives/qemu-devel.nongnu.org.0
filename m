Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A5C64BEA8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:42:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Czx-0000u7-J7; Tue, 13 Dec 2022 16:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5Czv-0000pB-3i
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:35 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5Czt-0007j1-8W
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:34 -0500
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BDLcaP9030603
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1670967567; bh=ZFqDgDpvqgvL67HbOiFhNpFqQ1ztb5o8G6x1h8Nifgg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=n5mayuXrLGwSSUlV2qkzECJQsiSUnFKWUWgy9vmdenfASpaah9zJagjVlyswuJ5eL
 aoja/5FtV7wBG2XGuqV5IAcz+asAWhcfDPNlHTXBnmTtxdoOg23LOQ+t5+wacquPfs
 kAPePV5Kjc4oKQnoR731PjjRWFAurjtTUWPj5N5K5pcgpPRZ33qT+EUErD2aXwrm16
 7Xiom0KALEItO/05enuqpm9ZQz7e97iuZcwthYG0nFQ/bMYzPO/iibqIbUXOnrei4D
 SOPAfF15Gt9GIoK6rcXPW16+ypSYyqBH6z1jGEKoawwu96dHix6xUgb3ndz6NMWX3F
 u1MOdXfufYd8g==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: elysia.witham@ll.mit.edu, alex.bennee@linaro.org, erdnaxe@crans.org,
 ma.mandourr@gmail.com, Andrew Fasano <fasano@mit.edu>
Subject: [PATCH 2/8] plugins: version 2, require unique plugin names
Date: Tue, 13 Dec 2022 16:37:51 -0500
Message-Id: <20221213213757.4123265-3-fasano@mit.edu>
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

In order for the QPP API to resolve interactions between plugins,
plugins must export their own names which cannot match any other
loaded plugins.

Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 include/qemu/qemu-plugin.h |  2 +-
 plugins/core.c             | 12 +++++++++
 plugins/loader.c           | 50 +++++++++++++++++++++++++++++++++-----
 plugins/plugin.h           |  7 ++++++
 tests/plugin/bb.c          |  1 +
 tests/plugin/empty.c       |  1 +
 tests/plugin/insn.c        |  1 +
 tests/plugin/mem.c         |  1 +
 tests/plugin/syscall.c     |  1 +
 9 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index d0e9d03adf..5326f33ce8 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -51,7 +51,7 @@ typedef uint64_t qemu_plugin_id_t;
 
 extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
 
-#define QEMU_PLUGIN_VERSION 1
+#define QEMU_PLUGIN_VERSION 2
 
 /**
  * struct qemu_info_t - system information for plugins
diff --git a/plugins/core.c b/plugins/core.c
index ccb770a485..5fbdcb5768 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -236,6 +236,18 @@ void qemu_plugin_vcpu_exit_hook(CPUState *cpu)
     qemu_rec_mutex_unlock(&plugin.lock);
 }
 
+int name_to_plugin_version(const char *name)
+{
+    struct qemu_plugin_ctx *ctx;
+    QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
+        if (strcmp(ctx->name, name) == 0) {
+            return ctx->version;
+        }
+    }
+    warn_report("Could not find any plugin named %s.", name);
+    return -1;
+}
+
 struct plugin_for_each_args {
     struct qemu_plugin_ctx *ctx;
     qemu_plugin_vcpu_simple_cb_t cb;
diff --git a/plugins/loader.c b/plugins/loader.c
index 88c30bde2d..12c0680e03 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -177,7 +177,7 @@ QEMU_DISABLE_CFI
 static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info, Error **errp)
 {
     qemu_plugin_install_func_t install;
-    struct qemu_plugin_ctx *ctx;
+    struct qemu_plugin_ctx *ctx, *ctx2;
     gpointer sym;
     int rc;
 
@@ -208,17 +208,55 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info, E
                    desc->path, g_module_error());
         goto err_symbol;
     } else {
-        int version = *(int *)sym;
-        if (version < QEMU_PLUGIN_MIN_VERSION) {
+        ctx->version = *(int *)sym;
+        if (ctx->version < QEMU_PLUGIN_MIN_VERSION) {
             error_setg(errp, "Could not load plugin %s: plugin requires API version %d, but "
                        "this QEMU supports only a minimum version of %d",
-                       desc->path, version, QEMU_PLUGIN_MIN_VERSION);
+                       desc->path, ctx->version, QEMU_PLUGIN_MIN_VERSION);
             goto err_symbol;
-        } else if (version > QEMU_PLUGIN_VERSION) {
+        } else if (ctx->version > QEMU_PLUGIN_VERSION) {
             error_setg(errp, "Could not load plugin %s: plugin requires API version %d, but "
                        "this QEMU supports only up to version %d",
-                       desc->path, version, QEMU_PLUGIN_VERSION);
+                       desc->path, ctx->version, QEMU_PLUGIN_VERSION);
             goto err_symbol;
+        } else if (ctx->version < QPP_MINIMUM_VERSION) {
+            ctx->name = NULL;
+        } else {
+            if (!g_module_symbol(ctx->handle, "qemu_plugin_name", &sym)) {
+                error_setg(errp, "Could not load plugin %s: plugin does not "
+                           "declare plugin name %s",
+                           desc->path, g_module_error());
+                goto err_symbol;
+            }
+            ctx->name = (const char *)strdup(*(const char **)sym);
+            QTAILQ_FOREACH(ctx2, &plugin.ctxs, entry) {
+                if (strcmp(ctx2->name, ctx->name) == 0) {
+                    error_setg(errp, "Could not load plugin %s as the name %s "
+                               "is already in use by plugin at %s",
+                               desc->path, ctx->name, ctx2->desc->path);
+                    goto err_symbol;
+                }
+            }
+            if (g_module_symbol(ctx->handle, "qemu_plugin_uses", &sym)) {
+                const char **dependencies = &(*(const char **)sym);
+                bool found = false;
+                while (*dependencies) {
+                    found = false;
+                    QTAILQ_FOREACH(ctx2, &plugin.ctxs, entry) {
+                        if (strcmp(ctx2->name, *dependencies) == 0) {
+                            dependencies++;
+                            found = true;
+                            break;
+                        }
+                    }
+                    if (!found) {
+                        error_setg(errp, "Could not load plugin %s as it is "
+                                   "dependent on %s which is not loaded",
+                                   ctx->name, *dependencies);
+                        goto err_symbol;
+                    }
+                }
+            }
         }
     }
 
diff --git a/plugins/plugin.h b/plugins/plugin.h
index 5eb2fdbc85..ce885bfa98 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -16,6 +16,7 @@
 #include "qemu/qht.h"
 
 #define QEMU_PLUGIN_MIN_VERSION 0
+#define QPP_MINIMUM_VERSION 2
 
 /* global state */
 struct qemu_plugin_state {
@@ -50,6 +51,8 @@ struct qemu_plugin_state {
 struct qemu_plugin_ctx {
     GModule *handle;
     qemu_plugin_id_t id;
+    const char *name;
+    int version;
     struct qemu_plugin_cb *callbacks[QEMU_PLUGIN_EV_MAX];
     QTAILQ_ENTRY(qemu_plugin_ctx) entry;
     /*
@@ -64,6 +67,8 @@ struct qemu_plugin_ctx {
 
 struct qemu_plugin_ctx *plugin_id_to_ctx_locked(qemu_plugin_id_t id);
 
+struct qemu_plugin_ctx *plugin_name_to_ctx_locked(const char* name);
+
 void plugin_register_inline_op(GArray **arr,
                                enum qemu_plugin_mem_rw rw,
                                enum qemu_plugin_op op, void *ptr,
@@ -97,4 +102,6 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
 
 void exec_inline_op(struct qemu_plugin_dyn_cb *cb);
 
+int name_to_plugin_version(const char *name);
+
 #endif /* PLUGIN_H */
diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
index 7d470a1011..c04e5aaf90 100644
--- a/tests/plugin/bb.c
+++ b/tests/plugin/bb.c
@@ -15,6 +15,7 @@
 #include <qemu-plugin.h>
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+QEMU_PLUGIN_EXPORT const char *qemu_plugin_name = "bb";
 
 typedef struct {
     GMutex lock;
diff --git a/tests/plugin/empty.c b/tests/plugin/empty.c
index 8fa6bacd93..0f3d2b92b9 100644
--- a/tests/plugin/empty.c
+++ b/tests/plugin/empty.c
@@ -14,6 +14,7 @@
 #include <qemu-plugin.h>
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+QEMU_PLUGIN_EXPORT const char *qemu_plugin_name = "empty";
 
 /*
  * Empty TB translation callback.
diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index cd5ea5d4ae..3f71138139 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -15,6 +15,7 @@
 #include <qemu-plugin.h>
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+QEMU_PLUGIN_EXPORT const char *qemu_plugin_name = "insn";
 
 #define MAX_CPUS 8 /* lets not go nuts */
 
diff --git a/tests/plugin/mem.c b/tests/plugin/mem.c
index 4570f7d815..35e5d7fe2a 100644
--- a/tests/plugin/mem.c
+++ b/tests/plugin/mem.c
@@ -15,6 +15,7 @@
 #include <qemu-plugin.h>
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+QEMU_PLUGIN_EXPORT const char *qemu_plugin_name = "mem";
 
 static uint64_t inline_mem_count;
 static uint64_t cb_mem_count;
diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 96040c578f..922bdbd2e6 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -15,6 +15,7 @@
 #include <qemu-plugin.h>
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+QEMU_PLUGIN_EXPORT const char *qemu_plugin_name = "syscall";
 
 typedef struct {
     int64_t num;
-- 
2.34.1


