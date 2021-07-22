Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E853D1EC8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:17:29 +0200 (CEST)
Received: from localhost ([::1]:54216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6SxU-0005zO-QL
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St4-00065y-DR
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:47050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St2-0005RF-Tj
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so2331646wms.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WhizFxo4aiOW3Z39CzCqIEDI8mj9ApvcpvEv89MbsmY=;
 b=S8bFOL6+KVOnxC7crcoSFj1HT3JXrWNdNVEW/JJw271wF6rskvKyDfJTbwFck1mrXm
 YJamh9nwKCZjpTHJylNPjg4cffMzHlSE4EhAF6t4zElCKG9WnmuW6Y7YHQEKX1WVQH6c
 CZROAagx0gCgTrT4elZuG94lIBqEAqpSCqDnrC0aHLdNM8OJpmqdAr2rmUp/Vsx7szA0
 9ME+hmNRGBzZw1DftLKcWg/WBw6NyU9mhyAilpz/6t7uEG7+aRdokUssMzjuWxZzBSwI
 kbLGSk298Rg5orJySoamxKZKDBt+DdkvAynxKLJQFm6JQHGZkisedSGw+Y8H38bISe/U
 016Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhizFxo4aiOW3Z39CzCqIEDI8mj9ApvcpvEv89MbsmY=;
 b=F9Fq+SVOcFCR0+Q75OF/otZLp1HVYdXHLeOseKQ1SAgJXB2P0d706SHWTJXSQnWrwY
 qstKdHbhDZXiUgxlqq61CuPW+j2U0c+yHTGxcSe1W6Kn54rh/q0O2JZR/UkRpx6Orqof
 3a2cBnyrUgqnLml6nxHggfuaJ4NlQeMtJD6BagZZR0p+CxxCsBMNiK1kiBQD31aY49Wj
 rR5TgxjDNqCspcu6C2wP6QFcLcPTrvvI8YFyn64QQV+BJ1RR5fr/jUVtY5Ox8Lb6s56N
 +PGP4m0usLDKz/ggbHQM1PiJ6V/k2e+JeePMrckGlndRpVQUASS2udxRIK5fTVc5vtNd
 RSmw==
X-Gm-Message-State: AOAM5306zd1yl+oXakwwOZPMucIRyUcqnz8UNH/0SIcUPSK/QogszwkD
 PWfFqNJOkmbOR+O4p2i6GmPYNnOMPgE=
X-Google-Smtp-Source: ABdhPJzsvr655s3UtsF4oAFJt+NyB/3y72RySG4z0LPBsIug12AgmS3Mq0vWrxn8D00c8XJmgVDefA==
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr7580725wmh.120.1626937971442; 
 Thu, 22 Jul 2021 00:12:51 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:51 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/13] plugins/lockstep: make socket path not positional &
 parse bool arg
Date: Thu, 22 Jul 2021 09:12:28 +0200
Message-Id: <20210722071236.139520-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x334.google.com
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


