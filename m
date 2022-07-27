Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1900582309
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:25:14 +0200 (CEST)
Received: from localhost ([::1]:47910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdI1-0000qs-NH
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGdEr-000570-7N
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:21:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGdEl-0002LC-5H
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658913710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o5I0SevDO12E2oHsF17QadEpWSZOQGdfROrC/PH4sQQ=;
 b=COtd4ByHezwcpibUbRFJeOtG85m6u5h6uguvAXEEWNJcQkBmyPDQBo1G2hdIfcXWuTWSW6
 U2DdJsnesrJ2gq18Q8YfzhpLiIye97pjM43ut4ng2qYYpRl9ZafwKxW1AdRltwQRfrwJay
 EzQ/ymX7+xxB8EzvIOyUsVOR+s8syMs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-2dyczD-xNX6gCKG-XZ8uyg-1; Wed, 27 Jul 2022 05:21:45 -0400
X-MC-Unique: 2dyczD-xNX6gCKG-XZ8uyg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 842168057DF;
 Wed, 27 Jul 2022 09:21:45 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3773492C3B;
 Wed, 27 Jul 2022 09:21:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/3] qga: Replace 'blacklist' and 'whitelist' in the guest
 agent sources
Date: Wed, 27 Jul 2022 11:21:34 +0200
Message-Id: <20220727092135.302915-3-thuth@redhat.com>
In-Reply-To: <20220727092135.302915-1-thuth@redhat.com>
References: <20220727092135.302915-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Let's use better, more inclusive wording here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qga/qapi-schema.json   |  4 +--
 qga/guest-agent-core.h |  2 +-
 qga/commands-posix.c   | 16 ++++++------
 qga/commands-win32.c   | 10 +++----
 qga/main.c             | 59 +++++++++++++++++++++---------------------
 5 files changed, 46 insertions(+), 45 deletions(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 869399ea1a..026a56f76c 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -16,8 +16,8 @@
 
 { 'pragma': { 'doc-required': true } }
 
-# Whitelists to permit QAPI rule violations; think twice before you
-# add to them!
+# Lists with items allowed to permit QAPI rule violations; think twice
+# before you add to them!
 { 'pragma': {
     # Types whose member names may use '_'
     'member-name-exceptions': [
diff --git a/qga/guest-agent-core.h b/qga/guest-agent-core.h
index 29cd50402f..b4e7c52c61 100644
--- a/qga/guest-agent-core.h
+++ b/qga/guest-agent-core.h
@@ -24,7 +24,7 @@ typedef struct GACommandState GACommandState;
 extern GAState *ga_state;
 extern QmpCommandList ga_commands;
 
-GList *ga_command_blacklist_init(GList *blacklist);
+GList *ga_command_init_blockedrpcs(GList *blockedrpcs);
 void ga_command_state_init(GAState *s, GACommandState *cs);
 void ga_command_state_add(GACommandState *cs,
                           void (*init)(void),
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 954efed01b..eea819cff0 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -3356,8 +3356,8 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
 }
 #endif
 
-/* add unsupported commands to the blacklist */
-GList *ga_command_blacklist_init(GList *blacklist)
+/* add unsupported commands to the list of blocked RPCs */
+GList *ga_command_init_blockedrpcs(GList *blockedrpcs)
 {
 #if !defined(__linux__)
     {
@@ -3370,13 +3370,13 @@ GList *ga_command_blacklist_init(GList *blacklist)
         char **p = (char **)list;
 
         while (*p) {
-            blacklist = g_list_append(blacklist, g_strdup(*p++));
+            blockedrpcs = g_list_append(blockedrpcs, g_strdup(*p++));
         }
     }
 #endif
 
 #if !defined(HAVE_GETIFADDRS)
-    blacklist = g_list_append(blacklist,
+    blockedrpcs = g_list_append(blockedrpcs,
                               g_strdup("guest-network-get-interfaces"));
 #endif
 
@@ -3390,18 +3390,18 @@ GList *ga_command_blacklist_init(GList *blacklist)
         char **p = (char **)list;
 
         while (*p) {
-            blacklist = g_list_append(blacklist, g_strdup(*p++));
+            blockedrpcs = g_list_append(blockedrpcs, g_strdup(*p++));
         }
     }
 #endif
 
 #if !defined(CONFIG_FSTRIM)
-    blacklist = g_list_append(blacklist, g_strdup("guest-fstrim"));
+    blockedrpcs = g_list_append(blockedrpcs, g_strdup("guest-fstrim"));
 #endif
 
-    blacklist = g_list_append(blacklist, g_strdup("guest-get-devices"));
+    blockedrpcs = g_list_append(blockedrpcs, g_strdup("guest-get-devices"));
 
-    return blacklist;
+    return blockedrpcs;
 }
 
 /* register init/cleanup routines for stateful command groups */
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 7ed7664715..ec9f55b453 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2005,8 +2005,8 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
     return NULL;
 }
 
-/* add unsupported commands to the blacklist */
-GList *ga_command_blacklist_init(GList *blacklist)
+/* add unsupported commands to the list of blocked RPCs */
+GList *ga_command_init_blockedrpcs(GList *blockedrpcs)
 {
     const char *list_unsupported[] = {
         "guest-suspend-hybrid",
@@ -2017,7 +2017,7 @@ GList *ga_command_blacklist_init(GList *blacklist)
     char **p = (char **)list_unsupported;
 
     while (*p) {
-        blacklist = g_list_append(blacklist, g_strdup(*p++));
+        blockedrpcs = g_list_append(blockedrpcs, g_strdup(*p++));
     }
 
     if (!vss_init(true)) {
@@ -2028,11 +2028,11 @@ GList *ga_command_blacklist_init(GList *blacklist)
         p = (char **)list;
 
         while (*p) {
-            blacklist = g_list_append(blacklist, g_strdup(*p++));
+            blockedrpcs = g_list_append(blockedrpcs, g_strdup(*p++));
         }
     }
 
-    return blacklist;
+    return blockedrpcs;
 }
 
 /* register init/cleanup routines for stateful command groups */
diff --git a/qga/main.c b/qga/main.c
index 74e5c9b10c..5a9d8252e0 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -87,7 +87,7 @@ struct GAState {
 #endif
     bool delimit_response;
     bool frozen;
-    GList *blacklist;
+    GList *blockedrpcs;
     char *state_filepath_isfrozen;
     struct {
         const char *log_filepath;
@@ -107,7 +107,7 @@ struct GAState *ga_state;
 QmpCommandList ga_commands;
 
 /* commands that are safe to issue while filesystems are frozen */
-static const char *ga_freeze_whitelist[] = {
+static const char *ga_freeze_allowlist[] = {
     "guest-ping",
     "guest-info",
     "guest-sync",
@@ -363,31 +363,31 @@ static gint ga_strcmp(gconstpointer str1, gconstpointer str2)
 }
 
 /* disable commands that aren't safe for fsfreeze */
-static void ga_disable_non_whitelisted(const QmpCommand *cmd, void *opaque)
+static void ga_disable_not_allowed(const QmpCommand *cmd, void *opaque)
 {
-    bool whitelisted = false;
+    bool allowed = false;
     int i = 0;
     const char *name = qmp_command_name(cmd);
 
-    while (ga_freeze_whitelist[i] != NULL) {
-        if (strcmp(name, ga_freeze_whitelist[i]) == 0) {
-            whitelisted = true;
+    while (ga_freeze_allowlist[i] != NULL) {
+        if (strcmp(name, ga_freeze_allowlist[i]) == 0) {
+            allowed = true;
         }
         i++;
     }
-    if (!whitelisted) {
+    if (!allowed) {
         g_debug("disabling command: %s", name);
         qmp_disable_command(&ga_commands, name, "the agent is in frozen state");
     }
 }
 
-/* [re-]enable all commands, except those explicitly blacklisted by user */
-static void ga_enable_non_blacklisted(const QmpCommand *cmd, void *opaque)
+/* [re-]enable all commands, except those explicitly blocked by user */
+static void ga_enable_non_blocked(const QmpCommand *cmd, void *opaque)
 {
-    GList *blacklist = opaque;
+    GList *blockedrpcs = opaque;
     const char *name = qmp_command_name(cmd);
 
-    if (g_list_find_custom(blacklist, name, ga_strcmp) == NULL &&
+    if (g_list_find_custom(blockedrpcs, name, ga_strcmp) == NULL &&
         !qmp_command_is_enabled(cmd)) {
         g_debug("enabling command: %s", name);
         qmp_enable_command(&ga_commands, name);
@@ -426,8 +426,8 @@ void ga_set_frozen(GAState *s)
     if (ga_is_frozen(s)) {
         return;
     }
-    /* disable all non-whitelisted (for frozen state) commands */
-    qmp_for_each_command(&ga_commands, ga_disable_non_whitelisted, NULL);
+    /* disable all forbidden (for frozen state) commands */
+    qmp_for_each_command(&ga_commands, ga_disable_not_allowed, NULL);
     g_warning("disabling logging due to filesystem freeze");
     ga_disable_logging(s);
     s->frozen = true;
@@ -465,8 +465,8 @@ void ga_unset_frozen(GAState *s)
         s->deferred_options.pid_filepath = NULL;
     }
 
-    /* enable all disabled, non-blacklisted commands */
-    qmp_for_each_command(&ga_commands, ga_enable_non_blacklisted, s->blacklist);
+    /* enable all disabled, non-blocked commands */
+    qmp_for_each_command(&ga_commands, ga_enable_non_blocked, s->blockedrpcs);
     s->frozen = false;
     if (!ga_delete_file(s->state_filepath_isfrozen)) {
         g_warning("unable to delete %s, fsfreeze may not function properly",
@@ -896,7 +896,8 @@ int64_t ga_get_fd_handle(GAState *s, Error **errp)
     int64_t handle;
 
     g_assert(s->pstate_filepath);
-    /* we blacklist commands and avoid operations that potentially require
+    /*
+     * We block commands and avoid operations that potentially require
      * writing to disk when we're in a frozen state. this includes opening
      * new files, so we should never get here in that situation
      */
@@ -950,8 +951,8 @@ struct GAConfig {
 #ifdef _WIN32
     const char *service;
 #endif
-    gchar *bliststr; /* blacklist may point to this string */
-    GList *blacklist;
+    gchar *bliststr; /* blockedrpcs may point to this string */
+    GList *blockedrpcs;
     int daemonize;
     GLogLevelFlags log_level;
     int dumpconf;
@@ -1019,7 +1020,7 @@ static void config_load(GAConfig *config)
     if (g_key_file_has_key(keyfile, "general", blockrpcs_key, NULL)) {
         config->bliststr =
             g_key_file_get_string(keyfile, "general", blockrpcs_key, &gerr);
-        config->blacklist = g_list_concat(config->blacklist,
+        config->blockedrpcs = g_list_concat(config->blockedrpcs,
                                           split_list(config->bliststr, ","));
     }
 
@@ -1079,7 +1080,7 @@ static void config_dump(GAConfig *config)
                            config->log_level == G_LOG_LEVEL_MASK);
     g_key_file_set_boolean(keyfile, "general", "retry-path",
                            config->retry_path);
-    tmp = list_join(config->blacklist, ',');
+    tmp = list_join(config->blockedrpcs, ',');
     g_key_file_set_string(keyfile, "general", "block-rpcs", tmp);
     g_free(tmp);
 
@@ -1171,8 +1172,8 @@ static void config_parse(GAConfig *config, int argc, char **argv)
                 qmp_for_each_command(&ga_commands, ga_print_cmd, NULL);
                 exit(EXIT_SUCCESS);
             }
-            config->blacklist = g_list_concat(config->blacklist,
-                                             split_list(optarg, ","));
+            config->blockedrpcs = g_list_concat(config->blockedrpcs,
+                                                split_list(optarg, ","));
             break;
         }
 #ifdef _WIN32
@@ -1226,7 +1227,7 @@ static void config_free(GAConfig *config)
 #ifdef CONFIG_FSFREEZE
     g_free(config->fsfreeze_hook);
 #endif
-    g_list_free_full(config->blacklist, g_free);
+    g_list_free_full(config->blockedrpcs, g_free);
     g_free(config);
 }
 
@@ -1310,7 +1311,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
             s->deferred_options.log_filepath = config->log_filepath;
         }
         ga_disable_logging(s);
-        qmp_for_each_command(&ga_commands, ga_disable_non_whitelisted, NULL);
+        qmp_for_each_command(&ga_commands, ga_disable_not_allowed, NULL);
     } else {
         if (config->daemonize) {
             become_daemon(config->pid_filepath);
@@ -1334,10 +1335,10 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
         return NULL;
     }
 
-    config->blacklist = ga_command_blacklist_init(config->blacklist);
-    if (config->blacklist) {
-        GList *l = config->blacklist;
-        s->blacklist = config->blacklist;
+    config->blockedrpcs = ga_command_init_blockedrpcs(config->blockedrpcs);
+    if (config->blockedrpcs) {
+        GList *l = config->blockedrpcs;
+        s->blockedrpcs = config->blockedrpcs;
         do {
             g_debug("disabling command: %s", (char *)l->data);
             qmp_disable_command(&ga_commands, l->data, NULL);
-- 
2.31.1


