Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9463CC26B
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:12:14 +0200 (CEST)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hIr-0002BU-P7
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH3-0007iw-B7
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH0-0007V3-A3
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:21 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso7331989wmj.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FX5v+BKehc6DaRJmhosDluKPZkJTepgwovTu+vU/T/Y=;
 b=uI3O9EGpvIUat1xfE3SJZXbWGTOUjp9gsVXUPK+vjQdwnN26hqQ3+cttc3JLYPZ/zg
 IUg1H1EvEx4BotY/VxWSr4dA1Py1Pzx5omWJ7rKZLc3doxuhBdEExTB+F36GMZLEf8n1
 M2OotL0/Hmpvxt32bvUOMQuXRpTVEDk5RUi+x3fZZ0MF3xKZ3WdpApLQJ5w2B9hSKnZk
 DssdbxAJe8sjgn6xErlZNt2TgoFRmNZVfmuOdafgZblg221RxEUmmhS6MTBEm8TCnMj4
 74OMo0kzg9JJ3wfPizvM/wET3frsoyYOjqGhPmiQpD2G7T3sRmh+FlYrndK9YT1ev+YE
 2m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FX5v+BKehc6DaRJmhosDluKPZkJTepgwovTu+vU/T/Y=;
 b=jucxTG3OtGAYVc7L4U8gK47GxG1QU+CFAYQiiLejzP8P9ZsTbyWUlNbgxXe7iSb/oy
 6EMHqwbdzLHHA5N2Z1r5MRwxHZDXBZE03/qCVOcuddMa34zrw7CpHSdl3FJNMwfdITif
 GkxjyhKkMM9d1+4RV6gE+0IcQFs8l40j+zCbgwshzxg3NuEfAb9lqAUCRHuE0swqJuge
 HHwDO93OIBx77UwsgUcKSHNTGigKZIGg8/h6hdTmUJsWuP03aD+vKfzpynCsBD2gEEh4
 t3XMBrOFnEwADwsmWsrkP5a90eKVoWcw189uEu5yd06rFuGXSytlQaIwRNlSF9MYPVPJ
 6fBQ==
X-Gm-Message-State: AOAM5318o0kieieWpI7vr7Ep35w0Y5XpCOThbXunImC0QtfvorblnYaW
 zkWgwB+XuoJyVivept4E/4XQohnosGI=
X-Google-Smtp-Source: ABdhPJzIE9vDEHS21n7MA2v/+Rqp54fXBXUuac1iK0c8NMzGsPEggGDkB8H/YnizRJGHiZigehj8TQ==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr21659136wmk.102.1626516616067; 
 Sat, 17 Jul 2021 03:10:16 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:15 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/13] plugins/hwprofile: adapt to the new plugin arguments
 scheme
Date: Sat, 17 Jul 2021 12:09:13 +0200
Message-Id: <20210717100920.240793-7-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x329.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Parsing boolean arguments correctly (e.g. pattern=on or source=false).
Introduced a new "track" argument that takes a [read|write] value. This
substitutes passing read or write to "arg=" that is deprecated.

Also, matches are now taken one by one through the "match" argument.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/hwprofile.c | 39 +++++++++++++++++++++++++------------
 docs/devel/tcg-plugins.rst  |  8 ++++----
 2 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
index faf216ac00..691d4edb0c 100644
--- a/contrib/plugins/hwprofile.c
+++ b/contrib/plugins/hwprofile.c
@@ -259,27 +259,42 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
 {
     int i;
+    g_autoptr(GString) matches_raw = g_string_new("");
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_strcmp0(opt, "read") == 0) {
-            rw = QEMU_PLUGIN_MEM_R;
-        } else if (g_strcmp0(opt, "write") == 0) {
-            rw = QEMU_PLUGIN_MEM_W;
-        } else if (g_strcmp0(opt, "pattern") == 0) {
-            pattern = true;
-        } else if (g_strcmp0(opt, "source") == 0) {
-            source = true;
-        } else if (g_str_has_prefix(opt, "match")) {
-            gchar **parts = g_strsplit(opt, "=", 2);
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+
+        if (g_strcmp0(tokens[0], "track") == 0) {
+            if (g_strcmp0(tokens[1], "read") == 0) {
+                rw = QEMU_PLUGIN_MEM_R;
+            } else if (g_strcmp0(tokens[1], "write") == 0) {
+                rw = QEMU_PLUGIN_MEM_W;
+            } else {
+                fprintf(stderr, "invalid value for track: %s\n", tokens[1]);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "pattern") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &pattern)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "source") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &source)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "match") == 0) {
             check_match = true;
-            matches = g_strsplit(parts[1], ",", -1);
-            g_strfreev(parts);
+            g_string_append_printf(matches_raw, "%s,", tokens[1]);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
         }
     }
+    if (check_match) {
+        matches = g_strsplit(matches_raw->str, ",", -1);
+    }
 
     if (source && pattern) {
         fprintf(stderr, "can only currently track either source or pattern.\n");
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 6ddf9c28c0..753f56ac42 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -290,22 +290,22 @@ which will eventually report::
 The hwprofile tool can only be used with system emulation and allows
 the user to see what hardware is accessed how often. It has a number of options:
 
- * arg=read or arg=write
+ * track=read or track=write
 
  By default the plugin tracks both reads and writes. You can use one
  of these options to limit the tracking to just one class of accesses.
 
- * arg=source
+ * source
 
  Will include a detailed break down of what the guest PC that made the
- access was. Not compatible with arg=pattern. Example output::
+ access was. Not compatible with the pattern option. Example output::
 
    cirrus-low-memory @ 0xfffffd00000a0000
     pc:fffffc0000005cdc, 1, 256
     pc:fffffc0000005ce8, 1, 256
     pc:fffffc0000005cec, 1, 256
 
- * arg=pattern
+ * pattern
 
  Instead break down the accesses based on the offset into the HW
  region. This can be useful for seeing the most used registers of a
-- 
2.25.1


