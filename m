Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D375D3CC26A
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:12:13 +0200 (CEST)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hIq-00027n-Sf
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH2-0007hZ-2U
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hGv-0007RD-Kf
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so9682274wmi.2
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ZfUY8t6QSU0kfRmcUlho99+o9wSl9O3sA2ot3i6FlQ=;
 b=BDC75xFqVLbm1ZNS0yXOtjaAD6cX5yLccljd0WtXAKKoy+NQgKJdlhZsI219WuQddw
 3GT4ghCjBew74dlaS+PmgrV8n7GMShngX1vzU+ARU3oMg2x8SErPgpHP8nFl5tRv9EeF
 +xWCAnqVndns08h0nVG3s8VPR/9Kalb0DVbnCMDz9qVE1GwjnGz0jnpu9aq1HVozdhZW
 Y7JRUZsOvF/2kggHmF0UoVbAgdNGwYMaYUAmwGmL0DPdU9TC2U5q/e1jsC54sc5fk2jz
 wSMrXC70gW4V+A0HEqCNwB1QVLWZIVTjFztQ8mvB75vAPlhK3hU7lZaO8qQ1eoZbSHZr
 jkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ZfUY8t6QSU0kfRmcUlho99+o9wSl9O3sA2ot3i6FlQ=;
 b=RNI3hvoeDnBlCjFtCOMK3Oj4tndePaHTXbwLnDIWLca3N1OdK8SOPSzg1AvWFEBJf9
 XzngASAP9+WJzsMUUU13ZMJ4D+RS08xVKPESgNRI668Yyr6bq98jKHaCYa30QZizxwXS
 JE8JuS7aRBaB41at3hyKuhH49zevkWZrmpeh//4G3iS7npASTFTAVL9aRZ26QeITD8JX
 qm31ljRkL0T585VzCVkriKLWXLSiTq1gQdQIBLqguPYsWFZqDHfSJu6nZfaNxGjjPOJa
 JAsCVwRrH71L8f5lmnBE3f8DcsLlEEr6smsy/gTmpLmjK4nqpx+VzcMnZ/8Ce3Gn0jwS
 vaaA==
X-Gm-Message-State: AOAM532/87H7FizeMJEtGWLwe4AzUrlLAeHbBkpaXhdHIdpar235W3FH
 AxB6BJ7C+X92LieEi/A4WIXKy2IJoGA=
X-Google-Smtp-Source: ABdhPJzWmAqyjlQzMukTfKEhnSUO5KEVZ4YPngPpVUScz59fCbga+sAyJdau/FT88sASqNnoOCePoA==
X-Received: by 2002:a05:600c:b47:: with SMTP id
 k7mr16017437wmr.155.1626516610362; 
 Sat, 17 Jul 2021 03:10:10 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:10 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/13] plugins: allow plugin arguments to be passed directly
Date: Sat, 17 Jul 2021 12:09:08 +0200
Message-Id: <20210717100920.240793-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32c.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
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


