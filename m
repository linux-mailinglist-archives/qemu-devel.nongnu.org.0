Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3715C3CB3DB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:12:54 +0200 (CEST)
Received: from localhost ([::1]:38572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Ixp-0008G6-8G
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpW-0007VU-7Z
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:18 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpU-0005Ni-Fa
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso6544736wmc.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QYlZr4m7peS7MfzAJi+qX2Ml7ux6aBoPT20UJbED7TM=;
 b=Q8u/VzysVLumGelup2D3K6a5x+WbXLAn6FFXL5g/gHegRJx9y09RlZ6RMYitho8dU5
 ree/g51QL8oPoi543noBrnl67yvkQ7fwYJ65O+uH2gDgBQlm2WFqAdHMCUpAUfGERiIq
 +BFmrXmgoGi2/ctpF+SHx5EAFHTW3gcVp3APZdmWNHOAoKnSJQhAyWAwqXZylVYabK6D
 TQb75m6Tv62Vm+HQOpgHMx1v95e5hGmSlzBta7fAzwAu5/ZmoWqQFoZBjVcWukDBY/LT
 4PEn/HmFp4ZfRlkuHqxpQMu6/c2ypuIMeLxNi7bspc0XkertkvK7QGq7AWZ5UwWhHUX9
 tX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QYlZr4m7peS7MfzAJi+qX2Ml7ux6aBoPT20UJbED7TM=;
 b=dkwKcQqGbqbKPHfV/aXcp+8cGgu/XcHqiFkAA4FiQCr1ilcccJovS3agGkSbNZ3ANT
 bPvlDM+oAb/J1sIeG6f8fCy36n0b8Ppe/qkQZL/Z7lxAayzxXkZjGndDqcqfqt3xD3e1
 nhV8zeNjYsSqftjUguZoRnGXeWOmMOdM4xFd1uOivraRoYOvTSQMEoJI3aB8tVjTF6Mt
 hvUv0X1gfHoGi/mhjAva0pE/8P+yJt7P+7oV8Uunhc3kQQmiL//HOXjrkC5CdGeCr5bu
 mixLkJQqiVHtV5XtVlbjMAkoW8b2LJK0aStgAIqEC9OAr05asLbza0gMD6r6MY4iiajN
 +//w==
X-Gm-Message-State: AOAM530lHoaFZCvmUAu+4qJnbpOwx5GwQO1xK0LgMSI+mWpqnm0e9FTt
 tMJvvR0lCZtyRGPVgxqZWsNCdfa5QE/RoA==
X-Google-Smtp-Source: ABdhPJy6JUW9e7rxhg+13mM03Evb/Zo8n9ZHqpfSzhItTmefGN64WcdVODUGjnetTUHCTXnZ2XEWqQ==
X-Received: by 2002:a05:600c:649:: with SMTP id
 p9mr15269274wmm.151.1626422654877; 
 Fri, 16 Jul 2021 01:04:14 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id p12sm6558046wma.19.2021.07.16.01.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:04:14 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] plugins/howvec: Adapting to the new argument passing
 scheme.
Date: Fri, 16 Jul 2021 10:03:43 +0200
Message-Id: <20210716080345.136784-8-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716080345.136784-1-ma.mandourr@gmail.com>
References: <20210716080345.136784-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x333.google.com
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
 contrib/plugins/howvec.c   | 24 ++++++++++++++++--------
 docs/devel/tcg-plugins.rst | 10 +++++-----
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 600f7facc1..847baef214 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -333,19 +333,27 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
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
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 753f56ac42..4ab9dc4bb1 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -79,7 +79,7 @@ Once built a program can be run with multiple plugins loaded each with
 their own arguments::
 
   $QEMU $OTHER_QEMU_ARGS \
-      -plugin tests/plugin/libhowvec.so,arg=inline,arg=hint \
+      -plugin tests/plugin/libhowvec.so,inline=on,count=hint \
       -plugin tests/plugin/libhotblocks.so
 
 Arguments are plugin specific and can be used to modify their
@@ -196,13 +196,13 @@ Similar to hotblocks but this time tracks memory accesses::
 
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


