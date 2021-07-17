Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03713CC29F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:21:22 +0200 (CEST)
Received: from localhost ([::1]:35672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hRh-0005xw-Ob
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH5-0007ps-PC
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH0-0007UL-Ok
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:23 -0400
Received: by mail-wm1-x32a.google.com with SMTP id w13so7272706wmc.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxSIlbrXoEWYH1V4OiwJbAMOptfvw4FTT6WZRqT5wuA=;
 b=HYCwDRjw8QXrPz/Trps87tznw7igo5cNd3bwXc5ggm8IzG35ARJ1+Yx2jFDssGSOt6
 4DLoohzMBUQwDTo47yT94wtAGgsk6MgvcIPtqTxtE+wygBGQcoSkgyBseVnMDrdNmNxI
 0hQCie01+0OCfkmvCJks8scOWUitZumYpXm7BU0stXv6pNEjmwQj7nSh9ERqaxlTE5Qk
 FXNOTlZS/JBcWQAsxsU38hBYoGlcI4vYcqwxWihLDZtLcRo+fko83/PQr2aiZ9XIVKQt
 an96IXaEVSma2U/siX8aNwEWuicGjEk4YGIQ1JoImW7gWEdgZZa+p8lFS1bS+qnW514j
 8XgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxSIlbrXoEWYH1V4OiwJbAMOptfvw4FTT6WZRqT5wuA=;
 b=GlyfAA0Liyov0VFWmkdMZHOeZu0bt6u4W7olrIOcN57aC/mFEJ3T+AvXwf/PTJ3Q89
 tz09ZFJbEQNjedwCphy9891+62NvDBgYaNAiwBPrJtJ+CUGH57uKqzRSiowM4DiE7cuZ
 hkqtiiXkczBOC8/2Dftn21avZRlICjI4+aGCQwkp+qM094oniCpOQoZQWLFpTADMEuGg
 mKHqPmwko88m5FKaAj9MjMfDVkwgc9xD59hSoN6Q+qM9iTTKu6H9YdDaVnGVPVO932Iw
 M9ysc0EpspMro8GUc1rrHGr/0wHxeyXj+w1t160SPSnaVlnStH+UKvpjlIpn4ykmxofb
 Qv0A==
X-Gm-Message-State: AOAM5306yyYODP0xMiba1lXGgzcH6QPDWJfmL5sXWxiLnSRpHC4j0e1f
 EZ67w5IcghKsR5hf5/hKBxyOFYcanE8=
X-Google-Smtp-Source: ABdhPJymQ/Xx57UDIBPtkkqkDDQKH1B+yGgjW9X1CkJLzCAXfTj7P2Y1CRd5Fzy08mTOInimD1wTgA==
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr15528769wmb.27.1626516614871; 
 Sat, 17 Jul 2021 03:10:14 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:14 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/13] plugins/lockstep: make socket path not positional &
 parse bool arg
Date: Sat, 17 Jul 2021 12:09:12 +0200
Message-Id: <20210717100920.240793-6-ma.mandourr@gmail.com>
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


