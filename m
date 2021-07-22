Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DDA3D1EDB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:21:28 +0200 (CEST)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6T1L-0008Dn-RX
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St8-0006Gp-87
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:58 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St6-0005TH-46
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i94so4764909wri.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n3SI7N3Ch+OuHorYlLp6xG6roUvzBNOvr6zAzTv7Az0=;
 b=VMroZWjB2WuEThzwMedGEiqo5wu4uEmH4hwtF5vv0TC9NneqMr+71dnLPN7cGcP1vX
 7RL9dR/WTXt9QD1SiJsZxbUVc0V9AFpgPbon10XIYqQH5mUW4yMM2YW7mNsHz5hj/TNY
 uoBEyNup+qbntIZK6gWwadu/YtwyRGC2cN3SaicvDIjJKhXWK0P9FP0L+8LyBUGJgJa3
 GvMw+Kf8Qkg9wege5FQqEeS6lJO342k7nuvufxSZVTxv5LPyLISNQbgjC3iZBu9RTLhV
 F+qhpCUnmh77iH/03/bsPjUmlvRSVMOm4qn5rK8Np1ejh6qFj8RCdP/bPDnNJZphjuh9
 fnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n3SI7N3Ch+OuHorYlLp6xG6roUvzBNOvr6zAzTv7Az0=;
 b=ppZvSB9Zlkmn0N+cw1dAPQVpBS/d0lNms2DZBL8iSZEUqjo/Esc3lk1o3IR8yRtssq
 WoeVbEkibz5NDbZxgIQrHb1Fs3bcZFfdeWHhmp8CV4R2Q3hqeW3/U9Jjx5rA7sn3cpGx
 E4HzRFxpbXbr/1CDN21M4ntPdC4/li1HTGf0DjRKLzkuqmI30ItuYA1uBu0GFWVOPiMp
 P+hJ5oazuYvBDz6WpV4wN4fbQGTFO1uaE5d7M30PBz1tU0cSYQWTHVcmxVo46QTIySef
 GJYnh0e6yCHCHXQe16Mcb/1hlNwSAH+Gzz5ldzS/fRT+0YcqWaM/AWejoxvTY6121+0F
 lIfw==
X-Gm-Message-State: AOAM530ZElsv0VC8R6NCeu2XO5klkeBlWC/xMz5JKFgkAMXw3kVooUN8
 jd8qsIxT/Tsi4cLnmVXdYMX/oVzUJBI=
X-Google-Smtp-Source: ABdhPJy6wmeqYVVQTJr0wQmfgYxPvhImzqkqwCe+ls/pk9oOWAUE3XYIk6oNYTULZyUZHSfGsK90ig==
X-Received: by 2002:adf:f9c9:: with SMTP id w9mr45815498wrr.107.1626937974325; 
 Thu, 22 Jul 2021 00:12:54 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:53 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/13] plugins/howvec: Adapting to the new argument passing
 scheme.
Date: Thu, 22 Jul 2021 09:12:30 +0200
Message-Id: <20210722071236.139520-8-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correctly parsing plugin argument since they now must be provided as
full-form boolean parameters, e.g.:
    -plugin ./contrib/plugins/libhowvec.so,verbose=on,inline=on

Also, introduced the argument "count" that accepts one opt to count
individually at a time.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
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


