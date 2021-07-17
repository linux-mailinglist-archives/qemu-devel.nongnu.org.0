Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC6B3CC26E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:14:23 +0200 (CEST)
Received: from localhost ([::1]:41222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hKw-0007bf-25
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH4-0007mC-Mb
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:22 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH0-0007T4-AM
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso8240913wmc.1
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHWdTeXytxUpcVqwmVfY5I5RkS0svkvZBXW0tynmbow=;
 b=N4RV91Q4WtDPU8nmLmh3PavxKgpfKwSO7MiTYWQlyDI+RjsMX9CCtWu3s6/xWWzvGc
 0WUzLnyIAMJLn11Dn9vDsJ4hDoADeiM01uD/MzW2ie3OIMM1ia3eU5ARFqOZpxiXa7NE
 4UEm2ROQTXeHLsmu0PmqHz3zVhxICsM4I6MATIX+QH1LwmR57e5h6r3B4+rNazvDZlbI
 soxsMHPxWnxMZyMzuWxPOxeqbyzSdVEqh2Gxcb+ZcQ+dgM49Wpaqk2RjOCOYeq/yH4Gd
 pKThUMi+P8s80EfyKBSekrnu/EvitfBiPD9My9AQqlv1PL4gvp+0EqYhBMr0tae24xkt
 IV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iHWdTeXytxUpcVqwmVfY5I5RkS0svkvZBXW0tynmbow=;
 b=BE65PkJyIbT0ngKSmu+O+pHUgo2aKU/qomL3ZYNkI0+bpeGb5kYJwJPBhCuHAnpEQg
 8hOq5E2j3QOnXlvygnjcC7HOPsb34Pu3JpLGSHkoNQuxQElZdvJfyL1YqUAF8r/A4UG7
 3Npx6Xip8Czw8XFS72Qmj6sxH6JiM0GrRgTP+ABf1RfykRjwjg/GTsWeEP8iv18GGIV/
 Z3jFp2Pq4SV9lgl218JmiGXUqainDj9msqI3XUWmL8JFWRRJsyI8L7KhBXOmZTr2D5jX
 ANzw8GjCVXmmAla/iUF0D1ORs8N/T8D/cPIIzzIU5RdA/PnA5oFw0SERYmnxZ7JNPNHp
 7qCA==
X-Gm-Message-State: AOAM530twelpuxK1ZUdbKIW3WRTuVzXfmUBX06pD4iRYCUWQLQhJROfh
 hCIfwR67H3cEeKXHhMrmVDw/Z9XkRsw=
X-Google-Smtp-Source: ABdhPJywWOuhkM5aSG3anlvjYRBOsT83lrjXO1o6WXMGaLDB3p9AxZrPX2EKf7xDb2fAboefEvpcjA==
X-Received: by 2002:a1c:1f8a:: with SMTP id f132mr15199592wmf.56.1626516612642; 
 Sat, 17 Jul 2021 03:10:12 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:12 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/13] plugins/hotpages: introduce sortby arg and parsed bool
 args correctly
Date: Sat, 17 Jul 2021 12:09:10 +0200
Message-Id: <20210717100920.240793-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Since plugin arguments now expect boolean arguments, a plugin argument
name "sortby" now expects a value of "read", "write", or "address".

"io" arg is now expected to be passed as a full-form boolean parameter,
i.e. "io=on|true|yes|off|false|no"

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/hotpages.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index bf53267532..0d12910af6 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -169,16 +169,26 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_strcmp0(opt, "reads") == 0) {
-            sort_by = SORT_R;
-        } else if (g_strcmp0(opt, "writes") == 0) {
-            sort_by = SORT_W;
-        } else if (g_strcmp0(opt, "address") == 0) {
-            sort_by = SORT_A;
-        } else if (g_strcmp0(opt, "io") == 0) {
-            track_io = true;
-        } else if (g_str_has_prefix(opt, "pagesize=")) {
-            page_size = g_ascii_strtoull(opt + 9, NULL, 10);
+        g_autofree char **tokens = g_strsplit(opt, "=", -1);
+
+        if (g_strcmp0(tokens[0], "sortby") == 0) {
+            if (g_strcmp0(tokens[1], "reads") == 0) {
+                sort_by = SORT_R;
+            } else if (g_strcmp0(tokens[1], "writes") == 0) {
+                sort_by = SORT_W;
+            } else if (g_strcmp0(tokens[1], "address") == 0) {
+                sort_by = SORT_A;
+            } else {
+                fprintf(stderr, "invalid value to sortby: %s\n", tokens[1]);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "io") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &track_io)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "pagesize") == 0) {
+            page_size = g_ascii_strtoull(tokens[1], NULL, 10);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.25.1


