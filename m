Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45C3DB9E3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:00:45 +0200 (CEST)
Received: from localhost ([::1]:39778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9T48-0006hx-Nd
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2R-00041E-0o
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:58:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2P-0006VW-C0
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:58:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c16so11418367wrp.13
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WV1gi48x+pyBlG/FO6knEEZWqKZDLecl8orWg4GV4os=;
 b=eGNjU3mxkTChiA/MZLzKbwz4n5NBxDewZHLmBObcypoV5FwUI3ZOqcqwDnE0p9nchA
 4kVnN2IiRcdZO0alQ5cTzr3yolJYSnqLHRWj3beJBBKMCetFKD8n+/tEO298uugWx3BQ
 HvN3OLVCD+5L0J0mrQTo7p2iRCC6ME9tQMB56084OwqcQr4oPRjGfryZVyXyDhBw0dBp
 nw3Fc34WvT1oMTRRLh4cHCaKI+uYQdom546aKF7BY1ks7/SS9h5sWUhgrE2GqrniniYA
 rS5myI1cYI1RmhIUpJaR/y/bsn38Ekc1m/JooDP0lNYGLgbkZJ7R/JvndRhPAI3vJn1V
 lb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WV1gi48x+pyBlG/FO6knEEZWqKZDLecl8orWg4GV4os=;
 b=j3g+ehO39746Z6uJoTTpt3TQmpMZiFqOanlp4TdJw/p7YzT2VKCq8ZCS9Kwh0topYE
 DFrYhMUmD2GV88kHWjaOy8PTMfvWrv6FktNU5QCBUHywd8U7YiaAsuKsWB+kMcvg2I6d
 nU5aCyzbnFb0ZB7NaFKjI3WA3b3hJ5ybbTn1VkY6fCmq0cnrXCL7A0fKBNOCsvvfHS/C
 dyd/odBca//mXbyDKPk+AayviLpUrouc1mNXYdiYwCDADb80IqTmceouKsczUhk96cKa
 8mA1lHf04s4tmzTp14sWXhztg4Gcj/mYriOXRoU+//gioLrKKPx7FOdoZdqCbFvuXAOk
 6alQ==
X-Gm-Message-State: AOAM531d152utCJM9aJg5lq61D+zVPI16fd2js1NXEeNOeoK6GG9MBOu
 oAlI+ygZnieMl3eNJ3gaoiR6T120JtE=
X-Google-Smtp-Source: ABdhPJw2xnygJxIzW507Rvb+h5QX3Si2WRvJVmMeAm+V70IEhPQ61sdaaypSVg9VmB3Q6bE7YXktmw==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr3297957wrw.364.1627653535404; 
 Fri, 30 Jul 2021 06:58:55 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:58:55 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/13] plugins: allow plugin arguments to be passed directly
Date: Fri, 30 Jul 2021 15:58:05 +0200
Message-Id: <20210730135817.17816-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Passing arguments to plugins had to be done through "arg=<argname>".
This is redundant and introduces confusion especially when the argument
has a name and value (e.g. `-plugin plugin_name,arg="argname=argvalue"`).

This allows passing plugin arguments directly e.g:

    `-plugin plugin_name,argname=argvalue`

For now, passing arguments through "arg=" is still supports but outputs
a deprecation warning.

Also, this commit makes boolean arguments passed to plugins in the
`argname=on|off` form instead of the deprecated short-boolean form.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/main.c |  2 +-
 plugins/loader.c  | 24 ++++++++++++++++++++----
 qemu-options.hx   |  9 ++++-----
 3 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4dfc47ad3b..d47f78132c 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -462,7 +462,7 @@ static const struct qemu_argument arg_table[] = {
      "",           "[[enable=]<pattern>][,events=<file>][,file=<file>]"},
 #ifdef CONFIG_PLUGIN
     {"plugin",     "QEMU_PLUGIN",      true,  handle_arg_plugin,
-     "",           "[file=]<file>[,arg=<string>]"},
+     "",           "[file=]<file>[,<argname>=<argvalue>]"},
 #endif
     {"version",    "QEMU_VERSION",     false, handle_arg_version,
      "",           "display version information and exit"},
diff --git a/plugins/loader.c b/plugins/loader.c
index 05df40398d..a4ec281692 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -94,6 +94,8 @@ static int plugin_add(void *opaque, const char *name, const char *value,
 {
     struct qemu_plugin_parse_arg *arg = opaque;
     struct qemu_plugin_desc *p;
+    bool is_on;
+    char *fullarg;
 
     if (strcmp(name, "file") == 0) {
         if (strcmp(value, "") == 0) {
@@ -107,18 +109,32 @@ static int plugin_add(void *opaque, const char *name, const char *value,
             QTAILQ_INSERT_TAIL(arg->head, p, entry);
         }
         arg->curr = p;
-    } else if (strcmp(name, "arg") == 0) {
+    } else {
         if (arg->curr == NULL) {
             error_setg(errp, "missing earlier '-plugin file=' option");
             return 1;
         }
+
+        if (g_strcmp0(name, "arg") == 0 &&
+                !qapi_bool_parse(name, value, &is_on, NULL)) {
+            if (strchr(value, '=') == NULL) {
+                /* Will treat arg="argname" as "argname=on" */
+                fullarg = g_strdup_printf("%s=%s", value, "on");
+            } else {
+                fullarg = g_strdup_printf("%s", value);
+            }
+            warn_report("using 'arg=%s' is deprecated", value);
+            error_printf("Please use '%s' directly\n", fullarg);
+        } else {
+            fullarg = g_strdup_printf("%s=%s", name, value);
+        }
+
         p = arg->curr;
         p->argc++;
         p->argv = g_realloc_n(p->argv, p->argc, sizeof(char *));
-        p->argv[p->argc - 1] = g_strdup(value);
-    } else {
-        error_setg(errp, "-plugin: unexpected parameter '%s'; ignored", name);
+        p->argv[p->argc - 1] = fullarg;
     }
+
     return 0;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 14258784b3..36b6cb9a2f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4459,19 +4459,18 @@ SRST
 
 ERST
 DEF("plugin", HAS_ARG, QEMU_OPTION_plugin,
-    "-plugin [file=]<file>[,arg=<string>]\n"
+    "-plugin [file=]<file>[,<argname>=<argvalue>]\n"
     "                load a plugin\n",
     QEMU_ARCH_ALL)
 SRST
-``-plugin file=file[,arg=string]``
+``-plugin file=file[,argname=argvalue]``
     Load a plugin.
 
     ``file=file``
         Load the given plugin from a shared library file.
 
-    ``arg=string``
-        Argument string passed to the plugin. (Can be given multiple
-        times.)
+    ``argname=argvalue``
+        Argument passed to the plugin. (Can be given multiple times.)
 ERST
 
 HXCOMM Internal use
-- 
2.25.1


