Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B033CB3CB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:09:16 +0200 (CEST)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4IuJ-0007Ae-5S
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpT-0007MG-FY
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpR-0005Ll-Qe
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:15 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g16so11033808wrw.5
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxSIlbrXoEWYH1V4OiwJbAMOptfvw4FTT6WZRqT5wuA=;
 b=cx06bNKYyYIp1CvvQwB+RIrVkVtpGwePpRXLkRmkmOBIKu/8D0Xg6fBOP6la1aGiM0
 J0ZIr9gLfZmAvCKYcKoonsngB3LD34UrzEwIl4rrA1BUFj/rDdvSohNqXFX15YW63Crc
 Lp8If3EcX6PwNuF7YDAIV8lBdJXoCxY0Y7wiAVhHFmlWgChIKYZB7k0naUVOrRMtVzQa
 8Aj5pcJggLyzL600Dn0aZnPk51j9MY7Vrk4g4EiloJsa+BM8BaSxjn3jobwrHx/N4d1/
 s80dcsnfepA31EboUrknT4g7b5KY8L596p4jJXWjqoAYuZe6UFm3TDV21g21GQd21gRO
 53HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxSIlbrXoEWYH1V4OiwJbAMOptfvw4FTT6WZRqT5wuA=;
 b=JoHfCjkRWYvCk9q5l/fbXzkZ7Iqo92CGYQNb0TuiHmCIZ91FrMLJLr9XtqPPYv16rK
 h8sV/W4rcLw0Blmt1uQ+Y04n5UgOjgjJsmErR5Agbt2lYk5AvcKdcnnBbs7w5Je41Fmc
 qH+zvCtZDN0fhJMggOODfs+nbYFoYC3vqsSyhWrd6uNxZ8ojFUEslU5RfufUwsFMngIy
 HZ1jNKxps9GlV5xmZIoab9liblAgBECjisIcrQtb17sO22Vz5ZlqzaKwpOoYFAcHmdLG
 yp/k5QUFD+FOYPpGxf2HjP1QHq7ifjJKRYm+8OYfp7E1XJxowgTI+eIbXjULEABxX6S6
 3UOg==
X-Gm-Message-State: AOAM5317bC8tFNR59hwYJ/XsTp2QuYHNCXQSuucgrBpvMuUPWsaD9D/m
 GKb1SWnOvqhU/kCidw0zIIotw0e9W2zeBg==
X-Google-Smtp-Source: ABdhPJy7mlmanLyFcOnQ1LYPwILB8MLAWZ2rZsZthE70i20f8UWIYaq1MEydHV+48pUXphwcNc1AnA==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr10778049wrq.99.1626422652354; 
 Fri, 16 Jul 2021 01:04:12 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id p12sm6558046wma.19.2021.07.16.01.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:04:11 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] plugins/lockstep: make socket path not positional & parse
 bool arg
Date: Fri, 16 Jul 2021 10:03:41 +0200
Message-Id: <20210716080345.136784-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716080345.136784-1-ma.mandourr@gmail.com>
References: <20210716080345.136784-1-ma.mandourr@gmail.com>
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

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/lockstep.c | 31 ++++++++++++++++++++++---------
 docs/devel/tcg-plugins.rst |  2 +-
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 7fd35eb669..a41ffe83fa 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -319,22 +319,35 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            int argc, char **argv)
 {
     int i;
-
-    if (!argc || !argv[0]) {
-        qemu_plugin_outs("Need a socket path to talk to other instance.");
-        return -1;
-    }
+    g_autofree char *sock_path = NULL;
 
     for (i = 0; i < argc; i++) {
         char *p = argv[i];
-        if (strcmp(p, "verbose") == 0) {
-            verbose = true;
-        } else if (!setup_unix_socket(argv[0])) {
-            qemu_plugin_outs("Failed to setup socket for communications.");
+        g_autofree char **tokens = g_strsplit(p, "=", 2);
+
+        if (g_strcmp0(tokens[0], "verbose") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &verbose)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", p);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "sockpath") == 0) {
+            sock_path = tokens[1];
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", p);
             return -1;
         }
     }
 
+    if (sock_path == NULL) {
+        fprintf(stderr, "Need a socket path to talk to other instance.\n");
+        return -1;
+    }
+
+    if (!setup_unix_socket(sock_path)) {
+        fprintf(stderr, "Failed to setup socket for communications.\n");
+        return -1;
+    }
+
     our_id = id;
 
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 370c11373f..6ddf9c28c0 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -270,7 +270,7 @@ communicate over::
 
   ./sparc-softmmu/qemu-system-sparc -monitor none -parallel none \
     -net none -M SS-20 -m 256 -kernel day11/zImage.elf \
-    -plugin ./contrib/plugins/liblockstep.so,arg=lockstep-sparc.sock \
+    -plugin ./contrib/plugins/liblockstep.so,sockpath=lockstep-sparc.sock \
   -d plugin,nochain
 
 which will eventually report::
-- 
2.25.1


