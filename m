Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6C30CD8D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:05:05 +0100 (CET)
Received: from localhost ([::1]:42518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72rA-0007WC-S7
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lQ-0002BV-LQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lN-0006xk-S6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KikifyMD+kQLStcGOLcsV8rDvJsrpQTJUnw3tvpYxvk=;
 b=HY1h6TWHiON0GsRsahwEMTvLrHEivp87XVCKnEduj9Rd3w1gqeqQpxVCDnTYj0qHQULQsS
 zoxp5EElCmJoTKumPCEQfJq9Cmp+4HgOMt1PO6Me0vxp4noV58vsim8JBEWrIpaVHm2Upz
 eTJhZGzOERLrjz3JLrajvdPGUpoFYeA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-Sobwvz9zN4ONStHjL2GfrQ-1; Tue, 02 Feb 2021 15:59:03 -0500
X-MC-Unique: Sobwvz9zN4ONStHjL2GfrQ-1
Received: by mail-ej1-f69.google.com with SMTP id p1so10573674ejo.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KikifyMD+kQLStcGOLcsV8rDvJsrpQTJUnw3tvpYxvk=;
 b=FNYeO/XBi40FfUSIgr6b3nyDKL0/Sy0HlD6q5VWAKXLb5rTVN5q2KsYQ9bGsJYEO2H
 71G0616EVwrERGAQ9W9DJhS0Y0DqZqY1iwuLV+11hNkBkQORsM0rBliq0mbRmyMHaepz
 m2otfgIhwPrwWR2ytjPJyMEV9khKsqULxIhBxIV2J+X2A/V71V6f5rtC58taXPgmPVdx
 uLGx37FqX7GqKH/ob9F7xmspE6GoL3RutFqcOMyrcngYAjvyBWeoV26hnzQE5e8bdilw
 GhDwDqlhD6OnObpFZB05WF6R16zuJqTNpyoxzMBb/cNFS0hFVL/jNP9+++Og1aNHgerl
 RTBQ==
X-Gm-Message-State: AOAM533iKyKVo4LFUnPLVEhhOscntohV5YC/c2uJk3G2aPmedWpRjPNP
 fLhQYu60StjweAzIlb4S/+PshSqPCjnB0pFCm4txiAuRsfebU6OaRxtO15YCkJSAclju2ADJK4H
 kMkZZqCkRKa59B2GGj5gy+ypaminIDhk1CM8nTSb67MRaQCjBpfpSQqz3YBCP0tvH
X-Received: by 2002:aa7:cdc8:: with SMTP id h8mr749010edw.244.1612299542071;
 Tue, 02 Feb 2021 12:59:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIjaVmtpm/x/R+xleXJRRxdttHpz9X6lFS42uaEjDXUK/fg1Fxb7Ic8OsxZQC9bonU1hr1Lg==
X-Received: by 2002:aa7:cdc8:: with SMTP id h8mr748984edw.244.1612299541828;
 Tue, 02 Feb 2021 12:59:01 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id lf26sm14021ejb.4.2021.02.02.12.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:59:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/12] qga: Replace the word 'blacklist'
Date: Tue,  2 Feb 2021 21:58:16 +0100
Message-Id: <20210202205824.1085853-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qga/guest-agent-core.h |  2 +-
 qga/commands-posix.c   | 14 +++++------
 qga/commands-win32.c   | 10 ++++----
 qga/main.c             | 57 +++++++++++++++++++++---------------------
 4 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/qga/guest-agent-core.h b/qga/guest-agent-core.h
index 9d01ea9c82a..90ce6a91a0a 100644
--- a/qga/guest-agent-core.h
+++ b/qga/guest-agent-core.h
@@ -24,7 +24,7 @@ typedef struct GACommandState GACommandState;
 extern GAState *ga_state;
 extern QmpCommandList ga_commands;
 
-GList *ga_command_blacklist_init(GList *blacklist);
+GList *ga_command_denylist_init(GList *denylist);
 void ga_command_state_init(GAState *s, GACommandState *cs);
 void ga_command_state_add(GACommandState *cs,
                           void (*init)(void),
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 8dd94a33144..a23f11d9d20 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -3071,8 +3071,8 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
 }
 #endif
 
-/* add unsupported commands to the blacklist */
-GList *ga_command_blacklist_init(GList *blacklist)
+/* add unsupported commands to the denylist */
+GList *ga_command_denylist_init(GList *denylist)
 {
 #if !defined(__linux__)
     {
@@ -3086,7 +3086,7 @@ GList *ga_command_blacklist_init(GList *blacklist)
         char **p = (char **)list;
 
         while (*p) {
-            blacklist = g_list_append(blacklist, g_strdup(*p++));
+            denylist = g_list_append(denylist, g_strdup(*p++));
         }
     }
 #endif
@@ -3101,18 +3101,18 @@ GList *ga_command_blacklist_init(GList *blacklist)
         char **p = (char **)list;
 
         while (*p) {
-            blacklist = g_list_append(blacklist, g_strdup(*p++));
+            denylist = g_list_append(denylist, g_strdup(*p++));
         }
     }
 #endif
 
 #if !defined(CONFIG_FSTRIM)
-    blacklist = g_list_append(blacklist, g_strdup("guest-fstrim"));
+    denylist = g_list_append(denylist, g_strdup("guest-fstrim"));
 #endif
 
-    blacklist = g_list_append(blacklist, g_strdup("guest-get-devices"));
+    denylist = g_list_append(denylist, g_strdup("guest-get-devices"));
 
-    return blacklist;
+    return denylist;
 }
 
 /* register init/cleanup routines for stateful command groups */
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index a00e6cb1655..f7a1644a423 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2004,8 +2004,8 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
     return NULL;
 }
 
-/* add unsupported commands to the blacklist */
-GList *ga_command_blacklist_init(GList *blacklist)
+/* add unsupported commands to the denylist */
+GList *ga_command_denylist_init(GList *denylist)
 {
     const char *list_unsupported[] = {
         "guest-suspend-hybrid",
@@ -2016,7 +2016,7 @@ GList *ga_command_blacklist_init(GList *blacklist)
     char **p = (char **)list_unsupported;
 
     while (*p) {
-        blacklist = g_list_append(blacklist, g_strdup(*p++));
+        denylist = g_list_append(denylist, g_strdup(*p++));
     }
 
     if (!vss_init(true)) {
@@ -2027,11 +2027,11 @@ GList *ga_command_blacklist_init(GList *blacklist)
         p = (char **)list;
 
         while (*p) {
-            blacklist = g_list_append(blacklist, g_strdup(*p++));
+            denylist = g_list_append(denylist, g_strdup(*p++));
         }
     }
 
-    return blacklist;
+    return denylist;
 }
 
 /* register init/cleanup routines for stateful command groups */
diff --git a/qga/main.c b/qga/main.c
index 66177b9e93d..4dbcc62ac9d 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -88,7 +88,7 @@ struct GAState {
 #endif
     bool delimit_response;
     bool frozen;
-    GList *blacklist;
+    GList *denylist;
     char *state_filepath_isfrozen;
     struct {
         const char *log_filepath;
@@ -108,7 +108,7 @@ struct GAState *ga_state;
 QmpCommandList ga_commands;
 
 /* commands that are safe to issue while filesystems are frozen */
-static const char *ga_freeze_whitelist[] = {
+static const char *ga_freeze_allowlist[] = {
     "guest-ping",
     "guest-info",
     "guest-sync",
@@ -362,31 +362,31 @@ static gint ga_strcmp(gconstpointer str1, gconstpointer str2)
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
         qmp_disable_command(&ga_commands, name);
     }
 }
 
-/* [re-]enable all commands, except those explicitly blacklisted by user */
-static void ga_enable_non_blacklisted(const QmpCommand *cmd, void *opaque)
+/* [re-]enable all commands, except those explicitly denylisted by user */
+static void ga_enable_non_denylisted(const QmpCommand *cmd, void *opaque)
 {
-    GList *blacklist = opaque;
+    GList *denylist = opaque;
     const char *name = qmp_command_name(cmd);
 
-    if (g_list_find_custom(blacklist, name, ga_strcmp) == NULL &&
+    if (g_list_find_custom(denylist, name, ga_strcmp) == NULL &&
         !qmp_command_is_enabled(cmd)) {
         g_debug("enabling command: %s", name);
         qmp_enable_command(&ga_commands, name);
@@ -425,8 +425,8 @@ void ga_set_frozen(GAState *s)
     if (ga_is_frozen(s)) {
         return;
     }
-    /* disable all non-whitelisted (for frozen state) commands */
-    qmp_for_each_command(&ga_commands, ga_disable_non_whitelisted, NULL);
+    /* disable all commands not allowed (for frozen state) */
+    qmp_for_each_command(&ga_commands, ga_disable_not_allowed, NULL);
     g_warning("disabling logging due to filesystem freeze");
     ga_disable_logging(s);
     s->frozen = true;
@@ -464,8 +464,8 @@ void ga_unset_frozen(GAState *s)
         s->deferred_options.pid_filepath = NULL;
     }
 
-    /* enable all disabled, non-blacklisted commands */
-    qmp_for_each_command(&ga_commands, ga_enable_non_blacklisted, s->blacklist);
+    /* enable all disabled, non-denylisted commands */
+    qmp_for_each_command(&ga_commands, ga_enable_non_denylisted, s->denylist);
     s->frozen = false;
     if (!ga_delete_file(s->state_filepath_isfrozen)) {
         g_warning("unable to delete %s, fsfreeze may not function properly",
@@ -896,9 +896,10 @@ int64_t ga_get_fd_handle(GAState *s, Error **errp)
     int64_t handle;
 
     g_assert(s->pstate_filepath);
-    /* we blacklist commands and avoid operations that potentially require
-     * writing to disk when we're in a frozen state. this includes opening
-     * new files, so we should never get here in that situation
+    /*
+     * We have commands in a denylist and avoid operations that potentially
+     * require writing to disk when we're in a frozen state. this includes
+     * opening new files, so we should never get here in that situation
      */
     g_assert(!ga_is_frozen(s));
 
@@ -950,8 +951,8 @@ struct GAConfig {
 #ifdef _WIN32
     const char *service;
 #endif
-    gchar *bliststr; /* blacklist may point to this string */
-    GList *blacklist;
+    gchar *bliststr; /* denylist may point to this string */
+    GList *denylist;
     int daemonize;
     GLogLevelFlags log_level;
     int dumpconf;
@@ -1171,7 +1172,7 @@ static void config_parse(GAConfig *config, int argc, char **argv)
                 qmp_for_each_command(&ga_commands, ga_print_cmd, NULL);
                 exit(EXIT_SUCCESS);
             }
-            config->blacklist = g_list_concat(config->blacklist,
+            config->denylist = g_list_concat(config->denylist,
                                              split_list(optarg, ","));
             break;
         }
@@ -1226,7 +1227,7 @@ static void config_free(GAConfig *config)
 #ifdef CONFIG_FSFREEZE
     g_free(config->fsfreeze_hook);
 #endif
-    g_list_free_full(config->blacklist, g_free);
+    g_list_free_full(config->denylist, g_free);
     g_free(config);
 }
 
@@ -1308,7 +1309,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
             s->deferred_options.log_filepath = config->log_filepath;
         }
         ga_disable_logging(s);
-        qmp_for_each_command(&ga_commands, ga_disable_non_whitelisted, NULL);
+        qmp_for_each_command(&ga_commands, ga_disable_not_allowed, NULL);
     } else {
         if (config->daemonize) {
             become_daemon(config->pid_filepath);
@@ -1332,10 +1333,10 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
         return NULL;
     }
 
-    config->blacklist = ga_command_blacklist_init(config->blacklist);
-    if (config->blacklist) {
-        GList *l = config->blacklist;
-        s->blacklist = config->blacklist;
+    config->denylist = ga_command_denylist_init(config->denylist);
+    if (config->denylist) {
+        GList *l = config->denylist;
+        s->denylist = config->denylist;
         do {
             g_debug("disabling command: %s", (char *)l->data);
             qmp_disable_command(&ga_commands, l->data);
-- 
2.26.2


