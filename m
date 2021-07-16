Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C83CB3BC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:06:32 +0200 (CEST)
Received: from localhost ([::1]:43946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Irf-0001P0-7h
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpO-00078M-Ft
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpM-0005IA-KQ
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so7627194wms.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ZfUY8t6QSU0kfRmcUlho99+o9wSl9O3sA2ot3i6FlQ=;
 b=Aae4PyAsdbABL7pcXNVqHYnwexdU3XdXGPQCEinbnt43qczlj6eRHr8R58VtpJ39pn
 diLJc4WHN1m404ch/9Uej/qe6AJUgKa4ELbFC53VMRB/VPsl4suHdnMTSh7H8wuakaoh
 uGZ/VWojO5UsIDRQc5dCMsWciKzt0gX+kBp/t0Nu7RefDP9EmOuEPbJ6q7cFzxY+NrpU
 cu+MWilhmB7WAipwdAUpocOw3+5lFrGuIfgcH2fG4q57xCScUoH4pno8R0R+kbE467GF
 f4cAFluIiOV88JMdUmDtenEYXd9m+V0pfV1ydEbt1s82gKJsQhETdZd0+lGi8GUOpEtP
 Inyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ZfUY8t6QSU0kfRmcUlho99+o9wSl9O3sA2ot3i6FlQ=;
 b=ei+JIu7rUoOR5DJ41b3tB8X7d8Pme0gxR7OpvUWUkihAhws0nB/G9PEvwDfhxZ+6x1
 YY/59NBXNf0v5UxVpIppaQNcdYot148UEWYVv/LfAJSMV18eh/ir7lqW0Zx1b2WdvTS6
 2RDuznvhfMxyarHDrp7VNh2yHBuPJoRCgL+UiNuMv54nMPPusE8mMt2Y7vc3oMyzU/w6
 n8eQCew0jnPAunMvBE4GuhP+3bslHSI6xfnKWP1m25JnKMMQHB1Mzl/Zc6rIiSA3XGGq
 e8dQAFrOXw69sKxy8mk6lIylubwK0RgPDN56NnJICpzB55dTz50YtdKDg7LZRvdGEL4P
 5zVA==
X-Gm-Message-State: AOAM5311m1ilq96b2TzpJ/+k/cirQloSCOggdyADdjnoeEeFcB50IxXt
 fIHsg6WWOtZosFAPdnWveTgQ2qU0gQ5Oqw==
X-Google-Smtp-Source: ABdhPJzz3NNVhMoDuky/yBC274InUneCQ9umR696QYH7ILpOe6JLKn/pqG3m7Yppgk+z+EuvBngAww==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr14788634wmq.109.1626422647059; 
 Fri, 16 Jul 2021 01:04:07 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id p12sm6558046wma.19.2021.07.16.01.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:04:06 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] plugins: allow plugin arguments to be passed directly
Date: Fri, 16 Jul 2021 10:03:37 +0200
Message-Id: <20210716080345.136784-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716080345.136784-1-ma.mandourr@gmail.com>
References: <20210716080345.136784-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x336.google.com
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


