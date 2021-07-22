Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49C93D1EC1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:15:02 +0200 (CEST)
Received: from localhost ([::1]:46756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Sv7-0000xe-PP
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6StD-0006YT-5r
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:13:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6StB-0005Wf-JP
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:13:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id c15so4770529wrs.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B+1M+aV9E2wGVHJ16Wx/w06MuQ5uraDMtjwhK3r80/w=;
 b=Sz4O8p6Yf4xGoWrc3x1rIdtjXG32PYlh/bDXf4mIX3YK753012yM48iisB73aeoXWb
 M9SvUnIApPAnGJxHWVYLhIWvY3ZEXTtq/1s2A2gA8xRvYXUnpHq34v1DsT22lkuVT5Ie
 O71jGQAU+eKOKY2DUeDvKdSMZ4gwea1Hd88YAC2Yxw20JDSXOlzto09jjhvkmOBhgAGL
 PWS6OjhzfbhHy/CCuO4vYNhkhXUUZLbAE3JIoPlRKkyGbXS9+ZkoDZFRxLyc6tr0FA/f
 h/bRUhmRi9eKrclAPGMcpSQoOmMi/6hpZtOZsNYfqQn1hzP1se+PG66U9B7B5obEMm5Q
 Q71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B+1M+aV9E2wGVHJ16Wx/w06MuQ5uraDMtjwhK3r80/w=;
 b=CRgLH2+DnuWHtcP9ewe3kcwh8D4TygIkhHrRPVc+r3vgFisLK3o0j3fenvBkeX9qpE
 rNFsWAFDV4EzpjcWqR23kUhHuihUuTKeKmeGZLGPnXUt1PKKjknbETkQKp2XbM5d2S06
 gwv+Wrh1rE8Wtp2LzStzDTobwr5OZoSh1lV3PbGoF15siYAuAwQC/hVMDyWT5iKxNqvz
 Dg+kCDdpYaawk1m6g0WRTfILTNkUflvwjvo9zU2V/jpkAmxlfCEgFqgL8XzFtgINuEbd
 Wx9aRZs7USV/gQfCSoBGWRUxiIBk2qkOO6gV1SUs3G/2yg1Y0HpDEdSz/iy0u0NxX9hq
 JuFQ==
X-Gm-Message-State: AOAM531o6hV8Q04TuY2sel6QzTHDrUNZPnmjlsVUziN2JVcieW3anIbT
 lcmr5Xq1eDGbvO/zF0oqBS5dSsXdPA8=
X-Google-Smtp-Source: ABdhPJxPicj3Om7NQbL26Tlm4ILH7VUSknXLN+AgcOAm1qYYhYProORMes1P/w2m7ydN0/ayp9G/Dg==
X-Received: by 2002:adf:ff85:: with SMTP id j5mr46913180wrr.49.1626937980068; 
 Thu, 22 Jul 2021 00:13:00 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:59 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/13] tests/plugins/mem: introduce "track" arg and make
 args not positional
Date: Thu, 22 Jul 2021 09:12:34 +0200
Message-Id: <20210722071236.139520-12-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x432.google.com
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
index afd1d27e5c..4570f7d815 100644
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
+        if (g_strcmp0(tokens[0], "haddr") == 0) {
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


