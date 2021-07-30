Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CF63DB9FB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:04:33 +0200 (CEST)
Received: from localhost ([::1]:50134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9T7o-0005SR-J9
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2d-0004XN-5a
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:11 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2b-0006do-DA
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:10 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b13so587997wrs.3
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWUqr/cDoSvVuOfI9ktQQ3wXRuH6l69RWUr3q0ufGYc=;
 b=N/WU5RrISn62GQp41IqMt4iBsCk0j3usSmwRsOzKl6bUXsyWDBA6qgPCa8Qi2z6OZI
 f6tu9OpxFApv5F13nrh322/f9wWOTrshAx5GFOnGMqfZDQDz2Ti/9svbX/vrTmQnzSNo
 +cPdNKI28DIjzBO0k6Pygyg7e+00jqIe/XJEaSa9LfIeayuH/5k9S6LboSeZHQ+VhtmX
 aYjmYsUos5dbM5oP98ZMvwGiptmrJZ0Qx0U0r1lT+k6d4NxS9qQmkbpjjVm0zj52PtqJ
 B6+/7zBWnBx1Wg2jwS3SwMeHlzQDDNDB7XhCqwl3WPBJZEJaqAbnwDUvwqymvB3XdbY9
 4txA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWUqr/cDoSvVuOfI9ktQQ3wXRuH6l69RWUr3q0ufGYc=;
 b=QvULYu2viHpy39HUc2CFBt82UFRE1MoE23AGStTvrSK/1CQuYLHc2P271lS6iZJVxO
 o1eYUbUahanFSeerI6Pgq7po4mVljnI8TbsN0blWOYU3sDrkpFGo6A4snSafy63mKvkG
 uoUcyaOLpTmTm1zNYg52cYyzSFH9z7QOjUwh/RVnELlNTmETcsf3K536UVbg95mtqvdR
 88amgIh5LzKcTRpBptDQPtQTf0Ra4Ji3z1PXAj7PSETARxnChleYoKGZ3ZUz4KeuLCVT
 fZsc93HLX0Jqe7OsQWuFoMyxGwIHhhjK1ES89s+/NBdLR6NunErH74zvkTZSjlzVO1En
 Nnog==
X-Gm-Message-State: AOAM531eHCUrVYyCqAx46JaoLev/qeXO7fot51F1u23//C1LCQfLjqbN
 6SS3oG9izAp81AP7+GuW+9rew9VbibA=
X-Google-Smtp-Source: ABdhPJyk8GMvMblWj35D6tcu4yOX1jgTUgCbQfW4ImHyDNKv2J6KGxsxKUB8biqeQL/IC0Kzf/Uaug==
X-Received: by 2002:adf:e9ca:: with SMTP id l10mr3291630wrn.37.1627653547874; 
 Fri, 30 Jul 2021 06:59:07 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:07 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/13] plugins/howvec: adapting to the new argument passing
 scheme
Date: Fri, 30 Jul 2021 15:58:11 +0200
Message-Id: <20210730135817.17816-8-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42b.google.com
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
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correctly parsing plugin argument since they now must be provided as
full-form boolean parameters, e.g.:
    -plugin ./contrib/plugins/libhowvec.so,verbose=on,inline=on

Also, introduced the argument "count" that accepts one opt to count
individually at a time.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/howvec.c   | 27 +++++++++++++++++++--------
 docs/devel/tcg-plugins.rst | 10 +++++-----
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 600f7facc1..4a5ec3d936 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -333,23 +333,34 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (i = 0; i < argc; i++) {
         char *p = argv[i];
-        if (strcmp(p, "inline") == 0) {
-            do_inline = true;
-        } else if (strcmp(p, "verbose") == 0) {
-            verbose = true;
-        } else {
+        g_autofree char **tokens = g_strsplit(p, "=", -1);
+        if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", p);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "verbose") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &verbose)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", p);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "count") == 0) {
+            char *value = tokens[1];
             int j;
             CountType type = COUNT_INDIVIDUAL;
-            if (*p == '!') {
+            if (*value == '!') {
                 type = COUNT_NONE;
-                p++;
+                value++;
             }
             for (j = 0; j < class_table_sz; j++) {
-                if (strcmp(p, class_table[j].opt) == 0) {
+                if (strcmp(value, class_table[j].opt) == 0) {
                     class_table[j].what = type;
                     break;
                 }
             }
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", p);
+            return -1;
         }
     }
 
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index b7148abef5..9377bc51d8 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -79,7 +79,7 @@ Once built a program can be run with multiple plugins loaded each with
 their own arguments::
 
   $QEMU $OTHER_QEMU_ARGS \
-      -plugin tests/plugin/libhowvec.so,arg=inline,arg=hint \
+      -plugin tests/plugin/libhowvec.so,inline=on,count=hint \
       -plugin tests/plugin/libhotblocks.so
 
 Arguments are plugin specific and can be used to modify their
@@ -211,13 +211,13 @@ The hotpages plugin can be configured using the following arguments:
 
 This is an instruction classifier so can be used to count different
 types of instructions. It has a number of options to refine which get
-counted. You can give an argument for a class of instructions to break
-it down fully, so for example to see all the system registers
-accesses::
+counted. You can give a value to the `count` argument for a class of
+instructions to break it down fully, so for example to see all the system
+registers accesses::
 
   ./aarch64-softmmu/qemu-system-aarch64 $(QEMU_ARGS) \
     -append "root=/dev/sda2 systemd.unit=benchmark.service" \
-    -smp 4 -plugin ./contrib/plugins/libhowvec.so,arg=sreg -d plugin
+    -smp 4 -plugin ./contrib/plugins/libhowvec.so,count=sreg -d plugin
 
 which will lead to a sorted list after the class breakdown::
 
-- 
2.25.1


