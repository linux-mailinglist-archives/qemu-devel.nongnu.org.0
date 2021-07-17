Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB63CC274
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:17:19 +0200 (CEST)
Received: from localhost ([::1]:49962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hNi-0004yX-WA
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH8-0007yh-Ps
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH5-0007ZD-KE
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k4so14948578wrc.8
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rSm96D6r0gBJdnBHUTP1OLqekpphinSagmjmjNFJcIA=;
 b=ncsT5pJTc83+WkpzgYjTtafSfcIdxv5s+SA5CTUFqjpK95hy26a5rzCcupE8Tu1PyD
 shh3qmxge50Bg+FkWxTrWCSav07eExdhcnGi7p1+5PxIVG3I7b5tExBpGXOSW+bn/8I6
 +HT3AGFmW6U8Z2PfiHTB983RbAXlrbvLcvgtebZ6fZ16P7VyiQPtcbu04MfxMQHyMe6n
 D5Yeps2Zz8sM5tRgOprH8v3P60uMFcBss4zr5bF3504/3Ign1xTtYiQM0iUxqNB2LOhY
 OodVZHIDp89xBXAGTPGdSYLJ4nRl+4EjGintaoR/1M3ylWdZ/RWS+HgaxkWXXhu8rLRH
 LX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rSm96D6r0gBJdnBHUTP1OLqekpphinSagmjmjNFJcIA=;
 b=b4KRDDbo+OfyC66I1rFs9bK5Zo1VSqsiWc4kAdYBUp9n0FN4NUTkzlv1ebSsmjjRTH
 4sPweGRaIIov+ea8Lsq2arbeCERgpbx0VYcTUSSZUUF76Gy8tQMxmkmOkVFqImfB+KQH
 X1YtJuujEIzJL4/sxuPc3xF9BoDZiyW1xnRnKNdZppPQYkioxDFZ/y7/jzcdWBYCq7/D
 6dOmP7swII57YwIHlfp58c01nIdYzIOBjtD2X6qJMZua3QF5DDWt6ef2/tXnf3PUWUSe
 u9o/PXn9A23K2NRrRNrcbfjILNIYz2wUKeg59+7Hrl2+oNmWmvaeQB+xvVzQUj+ovcPN
 w0gA==
X-Gm-Message-State: AOAM530k1h2QRGomPEsyqQtEH4k6OwCPg3RX927NHtFR0b/UQFLMFubF
 eGNqZe6N7KmkyE2HE4/OaxmigjOnFGM=
X-Google-Smtp-Source: ABdhPJyILRSXH0/6KpLGOOpppULR1hwBf+lWQu4vd8FcjjasiK1EtSRpenp450nD/NM2HYX0sqkybg==
X-Received: by 2002:adf:a350:: with SMTP id d16mr18167655wrb.207.1626516621883; 
 Sat, 17 Jul 2021 03:10:21 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:21 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/13] tests/plugins/mem: introduce "track" arg and make args
 not positional
Date: Sat, 17 Jul 2021 12:09:18 +0200
Message-Id: <20210717100920.240793-12-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
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

This commit makes the plugin adhere to the new plugins arg-passing
scheme by expecting full-form boolean args instead of short-form
booleans. This necessitates that we introduce a new argument, here
"track", to accept "r", "w", or "rw".

Also, it makes arguments not positional and we only care about the last
value specified for a certain argument.

callback/inline args are now supplied separately as bool arguments so
that both can be enabled individually.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tests/plugin/mem.c | 47 ++++++++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/tests/plugin/mem.c b/tests/plugin/mem.c
index afd1d27e5c..3000f847b5 100644
--- a/tests/plugin/mem.c
+++ b/tests/plugin/mem.c
@@ -80,29 +80,40 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
-    if (argc) {
-        if (argc >= 3) {
-            if (!strcmp(argv[2], "haddr")) {
-                do_haddr = true;
-            }
-        }
-        if (argc >= 2) {
-            const char *str = argv[1];
 
-            if (!strcmp(str, "r")) {
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+
+        if (g_strcmp0(tokens[0], "hadrr") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_haddr)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "track") == 0) {
+            if (g_strcmp0(tokens[1], "r") == 0) {
                 rw = QEMU_PLUGIN_MEM_R;
-            } else if (!strcmp(str, "w")) {
+            } else if (g_strcmp0(tokens[1], "w") == 0) {
                 rw = QEMU_PLUGIN_MEM_W;
+            } else if (g_strcmp0(tokens[1], "rw") == 0) {
+                rw = QEMU_PLUGIN_MEM_RW;
+            } else {
+                fprintf(stderr, "invaild value for argument track: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "callback") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_callback)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
             }
-        }
-        if (!strcmp(argv[0], "inline")) {
-            do_inline = true;
-            do_callback = false;
-        } else if (!strcmp(argv[0], "both")) {
-            do_inline = true;
-            do_callback = true;
         } else {
-            do_callback = true;
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
         }
     }
 
-- 
2.25.1


