Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B220764BEB5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5D0o-0001WH-49; Tue, 13 Dec 2022 16:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D0A-0001Jw-7Z
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:51 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D07-0007oW-NO
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:50 -0500
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BDLcaPD030603
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1670967582; bh=tHc5D/gEd+UlFFhOqMfSMnRWShH86mwYdoibrKxpBTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ezx+ujGURbwvVVBtdGxwjlP13BETBFaKcKVkmdvcQnmlizhxN+mteDHg/wXRbY0IZ
 CLIOLMYqhrWf9DiWQSWGZ5jzxIdsKJSxsalp83Tl6E4gJoCTbxwfasRcPPpUFn0ZWK
 xrJ4vVV9QIJc2aqcK9htNLvhY6ZLimN6cKrBlAfEVXAeLaclwjlZ2+5FiD9rK/DiEf
 Q0KbRClRR09scgV4BXDWzpveI3zsF3dkFM00FEUOd73x6Hgt1SkeQQG4xilIbX+TPA
 ALV55fkS+6cns8jNKlTRIzSmLZGag4OZgZRDw4/ESOboaWhWVP0NvtmhWTGfmXiBV8
 UwC6S64vnOhmw==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: elysia.witham@ll.mit.edu, alex.bennee@linaro.org, erdnaxe@crans.org,
 ma.mandourr@gmail.com, Andrew Fasano <fasano@mit.edu>
Subject: [PATCH 6/8] plugins: implement QPP import function
Date: Tue, 13 Dec 2022 16:37:55 -0500
Message-Id: <20221213213757.4123265-7-fasano@mit.edu>
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

Plugins can export functions or import functions from other
plugins using their name and the function name. This is also
described in <qemu-plugin.h>.

Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 include/qemu/qemu-plugin.h   | 10 ++++++++++
 plugins/api.c                | 21 +++++++++++++++++++++
 plugins/qemu-plugins.symbols |  1 +
 3 files changed, 32 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 4221545015..a0516e9a0e 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -354,6 +354,16 @@ size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
  */
 uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
 
+/**
+ * qemu_plugin_import_function() - return pointer to a function in another
+ * plugin
+ * @plugin: plugin name
+ * @function: function name
+ *
+ * Returns: NULL on failure, function pointer on success
+ */
+gpointer qemu_plugin_import_function(const char *plugin, const char *function);
+
 /**
  * qemu_plugin_create_callback() - create a new cb with given name
  * @id: unique plugin id
diff --git a/plugins/api.c b/plugins/api.c
index 1f7ea718dc..a998df6942 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -400,6 +400,27 @@ bool qemu_plugin_bool_parse(const char *name, const char *value, bool *ret)
     return name && value && qapi_bool_parse(name, value, ret, NULL);
 }
 
+/*
+ * QPP: inter-plugin function resolution and callbacks
+ */
+
+gpointer qemu_plugin_import_function(const char *target_plugin,
+                                     const char *function) {
+    gpointer function_pointer = NULL;
+    struct qemu_plugin_ctx *ctx = plugin_name_to_ctx_locked(target_plugin);
+    if (ctx == NULL) {
+        error_report("Unable to load plugin %s by name", target_plugin);
+    } else if (g_module_symbol(ctx->handle, function,
+               (gpointer *)&function_pointer)) {
+        return function_pointer;
+    } else {
+      error_report("function: %s not found in plugin: %s", function,
+                   target_plugin);
+    }
+    abort();
+    return NULL;
+}
+
 bool qemu_plugin_create_callback(qemu_plugin_id_t id, const char *cb_name)
 {
     struct qemu_plugin_ctx *ctx = plugin_id_to_ctx_locked(id);
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index b7013980cf..70a518839d 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -3,6 +3,7 @@
   qemu_plugin_end_code;
   qemu_plugin_entry_code;
   qemu_plugin_get_hwaddr;
+  qemu_plugin_import_function;
   qemu_plugin_create_callback;
   qemu_plugin_run_callback;
   qemu_plugin_reg_callback;
-- 
2.34.1


