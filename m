Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688533DB9EE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:02:47 +0200 (CEST)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9T66-0000oZ-G4
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2Y-0004FA-KE
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2W-0006ag-UF
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id m12so6661777wru.12
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zx7cRgd2qwvarLurhWwJmwoKYPf3+B1Nk2x+D7jVjeA=;
 b=kHz2Oo6zKtEUbF8Lnr1KgBC+HAWvzpS7gt6N+8M0ZlqcYeal5t3hNMgaNAIBUwDjeP
 fP2aT3Rk/wCC91maakcnlLu/2vdQD1EI5nbNE3qOT96bp3/IQox1J0iEYE/VKSxY25fM
 BW6K9WkB72Qw1T6DY5ZTnMPgwPknNfcUFI9QML4a60p5DyJpQ8ukeHmHPu+c2IvlubRu
 l+Ka9b1DDUCuaTpGmyvnqFy3jUt84AtyUQdWvo6m+OsTV1BKscYod+gO2kb2QuR8F45F
 a56bs9LSZXUfqrDOB6mMIWGDGYsCyGm70ip19Z6ZvnH1BH5dXY+UsfC1CoAaEj+s1Pdl
 NkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zx7cRgd2qwvarLurhWwJmwoKYPf3+B1Nk2x+D7jVjeA=;
 b=o00H8yUtMuk2JjUJ8mnZq4l1d+RQRzW0gmPG9Yiava2f9CdWLTyrwnN/hqZExt2BYV
 Qpb0QVGlSA4c4qz2FmMHD6KQDcxd+Z7dbvCSf9pFAYMc4b2nJQC69m55k2jS9IApHGS/
 F/Un7ssmFzXM7/Hye5wkex6KYMuRY2RMm1KI2egP3uRGUet9AFbbCZhlN6c1WXu8Vf1C
 TrRX264Qw0oNsDX5F8CJbY71rjmN8G/xDtdsTkNasrC4VbXb4d9CRUxS7UZc5D77QXHD
 qOaYJj4kDepHIgMFWpikenG7pl8hnA7837JTyJyuHuH84ypxJJeG1rU9XbDu4ndbf/wt
 uqpg==
X-Gm-Message-State: AOAM533graOhGj/1oGgzQq6kV+ptEu2O/N0cyzRPYxZzkJOaishY+45G
 0OHTBZpBm/8//dPAkT+ObpChNKD7RSU=
X-Google-Smtp-Source: ABdhPJw192pGLqwXjyXfXIw+WEhVjfprg3rQ7LWih/RwojTmGxA1mqyBosIPe6GXehbErKYBQNkdqQ==
X-Received: by 2002:adf:f485:: with SMTP id l5mr3153886wro.8.1627653543320;
 Fri, 30 Jul 2021 06:59:03 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:02 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/13] plugins/lockstep: make socket path not positional &
 parse bool arg
Date: Fri, 30 Jul 2021 15:58:09 +0200
Message-Id: <20210730135817.17816-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x435.google.com
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

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
index d09c349234..1cb8dee240 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -285,7 +285,7 @@ communicate over::
 
   ./sparc-softmmu/qemu-system-sparc -monitor none -parallel none \
     -net none -M SS-20 -m 256 -kernel day11/zImage.elf \
-    -plugin ./contrib/plugins/liblockstep.so,arg=lockstep-sparc.sock \
+    -plugin ./contrib/plugins/liblockstep.so,sockpath=lockstep-sparc.sock \
   -d plugin,nochain
 
 which will eventually report::
-- 
2.25.1


