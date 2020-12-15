Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4C2DB331
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:02:53 +0100 (CET)
Received: from localhost ([::1]:36384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEey-0003s0-JC
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXJ-00031w-NO
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXF-0001Sk-T0
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sSR6Wc6GZJDarWX+t5lDmMGBU/nkesGjNvcxmQqTw9A=;
 b=aYfh6MQLtPbRwiIfG4jN9kv3SaAVhnyr3ypzUiLrEeynvgSuHQ97sUo0DhkPPvDDaeWRtc
 Ubp3NRpklV5m6Xrrg2wk6bouqd0QYfjCc82qQm4Q+EFU6D04vVcBXtnxI9sTi1ApVNCHf3
 gCrc7glRexeWZ+ABe3oa6UdSzuY9IzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-fmhoILV7OjClCotWRQmvpQ-1; Tue, 15 Dec 2020 12:54:51 -0500
X-MC-Unique: fmhoILV7OjClCotWRQmvpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 909D3100C604
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40FA5100AE2C;
 Tue, 15 Dec 2020 17:54:50 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/45] plugin: propagate errors
Date: Tue, 15 Dec 2020 12:54:11 -0500
Message-Id: <20201215175445.1272776-12-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_finish_machine_init currently can only exit QEMU if it fails.
Prepare for giving it proper error propagation, and possibly for
adding a plugin_add monitor command that calls an accelerator
method.

While at it, make all errors from plugin_load look the same.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/plugin.h |  4 ++--
 linux-user/main.c     |  4 +---
 plugins/loader.c      | 34 +++++++++++++++++-----------------
 softmmu/vl.c          |  4 +---
 4 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index ab790ad105..841deed79c 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -45,7 +45,7 @@ static inline void qemu_plugin_add_opts(void)
 }
 
 void qemu_plugin_opt_parse(const char *optarg, QemuPluginList *head);
-int qemu_plugin_load_list(QemuPluginList *head);
+int qemu_plugin_load_list(QemuPluginList *head, Error **errp);
 
 union qemu_plugin_cb_sig {
     qemu_plugin_simple_cb_t          simple;
@@ -199,7 +199,7 @@ static inline void qemu_plugin_opt_parse(const char *optarg,
     exit(1);
 }
 
-static inline int qemu_plugin_load_list(QemuPluginList *head)
+static inline int qemu_plugin_load_list(QemuPluginList *head, Error **errp)
 {
     return 0;
 }
diff --git a/linux-user/main.c b/linux-user/main.c
index 24d1eb73ad..750a01118f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -671,9 +671,7 @@ int main(int argc, char **argv, char **envp)
         exit(1);
     }
     trace_init_file();
-    if (qemu_plugin_load_list(&plugins)) {
-        exit(1);
-    }
+    qemu_plugin_load_list(&plugins, &error_fatal);
 
     /* Zero out regs */
     memset(regs, 0, sizeof(struct target_pt_regs));
diff --git a/plugins/loader.c b/plugins/loader.c
index 8ac5dbc20f..5cb9794fda 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -150,7 +150,7 @@ static uint64_t xorshift64star(uint64_t x)
     return x * UINT64_C(2685821657736338717);
 }
 
-static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
+static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info, Error **errp)
 {
     qemu_plugin_install_func_t install;
     struct qemu_plugin_ctx *ctx;
@@ -163,37 +163,37 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
 
     ctx->handle = g_module_open(desc->path, G_MODULE_BIND_LOCAL);
     if (ctx->handle == NULL) {
-        error_report("%s: %s", __func__, g_module_error());
+        error_setg(errp, "Could not load plugin %s: %s", desc->path, g_module_error());
         goto err_dlopen;
     }
 
     if (!g_module_symbol(ctx->handle, "qemu_plugin_install", &sym)) {
-        error_report("%s: %s", __func__, g_module_error());
+        error_setg(errp, "Could not load plugin %s: %s", desc->path, g_module_error());
         goto err_symbol;
     }
     install = (qemu_plugin_install_func_t) sym;
     /* symbol was found; it could be NULL though */
     if (install == NULL) {
-        error_report("%s: %s: qemu_plugin_install is NULL",
-                     __func__, desc->path);
+        error_setg(errp, "Could not load plugin %s: qemu_plugin_install is NULL",
+                   desc->path);
         goto err_symbol;
     }
 
     if (!g_module_symbol(ctx->handle, "qemu_plugin_version", &sym)) {
-        error_report("TCG plugin %s does not declare API version %s",
-                     desc->path, g_module_error());
+        error_setg(errp, "Could not load plugin %s: plugin does not declare API version %s",
+                   desc->path, g_module_error());
         goto err_symbol;
     } else {
         int version = *(int *)sym;
         if (version < QEMU_PLUGIN_MIN_VERSION) {
-            error_report("TCG plugin %s requires API version %d, but "
-                         "this QEMU supports only a minimum version of %d",
-                         desc->path, version, QEMU_PLUGIN_MIN_VERSION);
+            error_setg(errp, "Could not load plugin %s: plugin requires API version %d, but "
+                       "this QEMU supports only a minimum version of %d",
+                       desc->path, version, QEMU_PLUGIN_MIN_VERSION);
             goto err_symbol;
         } else if (version > QEMU_PLUGIN_VERSION) {
-            error_report("TCG plugin %s requires API version %d, but "
-                         "this QEMU supports only up to version %d",
-                         desc->path, version, QEMU_PLUGIN_VERSION);
+            error_setg(errp, "Could not load plugin %s: plugin requires API version %d, but "
+                       "this QEMU supports only up to version %d",
+                       desc->path, version, QEMU_PLUGIN_VERSION);
             goto err_symbol;
         }
     }
@@ -220,8 +220,8 @@ static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
     rc = install(ctx->id, info, desc->argc, desc->argv);
     ctx->installing = false;
     if (rc) {
-        error_report("%s: qemu_plugin_install returned error code %d",
-                     __func__, rc);
+        error_setg(errp, "Could not load plugin %s: qemu_plugin_install returned error code %d",
+                   desc->path, rc);
         /*
          * we cannot rely on the plugin doing its own cleanup, so
          * call a full uninstall if the plugin did not yet call it.
@@ -263,7 +263,7 @@ static void plugin_desc_free(struct qemu_plugin_desc *desc)
  * Note: the descriptor of each successfully installed plugin is removed
  * from the list given by @head.
  */
-int qemu_plugin_load_list(QemuPluginList *head)
+int qemu_plugin_load_list(QemuPluginList *head, Error **errp)
 {
     struct qemu_plugin_desc *desc, *next;
     g_autofree qemu_info_t *info = g_new0(qemu_info_t, 1);
@@ -283,7 +283,7 @@ int qemu_plugin_load_list(QemuPluginList *head)
     QTAILQ_FOREACH_SAFE(desc, head, entry, next) {
         int err;
 
-        err = plugin_load(desc, info);
+        err = plugin_load(desc, info, errp);
         if (err) {
             return err;
         }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0f7222af31..553482ec02 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2416,9 +2416,7 @@ static void qemu_init_board(void)
     }
 
     /* process plugin before CPUs are created, but once -smp has been parsed */
-    if (qemu_plugin_load_list(&plugin_list)) {
-        exit(1);
-    }
+    qemu_plugin_load_list(&plugin_list, &error_fatal);
 
     /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
     machine_run_board_init(current_machine);
-- 
2.26.2



