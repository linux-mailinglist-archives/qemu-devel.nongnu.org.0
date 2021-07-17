Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9913CC272
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:17:04 +0200 (CEST)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hNX-0004kq-Eg
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH3-0007jd-Me
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH0-0007Vj-Ox
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so7321828wms.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L3uilAactmUVXaG+kWGEGWQRYTQSIn+v/+hdU9qLmVY=;
 b=cINzWvNXFW83yRV6d+ZWKPGJAxGBm7tpE2XrgUvX2sDXcdoLxyXHYK7lX3AHbryiY6
 4cVQ59Z5CDvJRFdompMMzv9K2e6qM5EjitJxDcUb7zCORbFSrFTvjNRbGS6xr/BxvaLv
 It/g8MDHMmdj0LEy8oXyD1ufjLl23znQdCeeLE5sZma6k74J7UCZ7SkbCF2perHiwqre
 atFmlMTL5rDrHPdwLYcifhjJApc0ddxVAQsTj/bm8/36SXcs7cWxtcFD+1GdP/aI6WBq
 9GXSs+LkOYybXTtsNVDYPQJBamMnK487fFRcQMOdOLJI2X8tC248/sJpH/cQr0EDq/8s
 6njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L3uilAactmUVXaG+kWGEGWQRYTQSIn+v/+hdU9qLmVY=;
 b=XEF6JwdaLuyxxgeiSRgk4Eu19uM72rvPzlEQqqX0JkQEcWD1vs9MOYVvju3j2DvID2
 3ohZ5VzMqQxk90aKzVkOsWfPcZrc1rGu7bDgRn1unfAml7h1IiHSpr7L6GwntoFSnEAA
 +3iwRkBEjnHB5ggWMvNgSwRtHyKtEgTjadUTF1S1K3T7FZSppUAUQP5LjE5zmV8aeU0d
 osQ+slAlXNgLp/sQgHINPgomMbEZesOx5pAEu3nM+sFF/0sCT8iuGr0ox/HFFRH8ai6Y
 +i//Qmv9v2mK7QVbON0qmTlqDsbM12Xguyyuh96HF3IyFBs9OhDcKWJvRK4JvT5nnaZO
 wrWg==
X-Gm-Message-State: AOAM530ydK0WDLngNiPZBztH0Sf67TAVYBBrSADS9ofba+qCXqflmGEm
 wh0ZTf1QJmtydt4/qGlgYcIi/TUuyM0=
X-Google-Smtp-Source: ABdhPJyVRSBa/xzeLjDubpWfD+ZT38KnkEIRD1zWnB+2+j6+eisr03FM5xvwIHhaJJNMMtCT3CASbg==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr15686605wmh.186.1626516617248; 
 Sat, 17 Jul 2021 03:10:17 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:16 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/13] plugins/howvec: Adapting to the new argument passing
 scheme.
Date: Sat, 17 Jul 2021 12:09:14 +0200
Message-Id: <20210717100920.240793-8-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32a.google.com
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


