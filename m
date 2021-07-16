Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38443CB3CA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:09:12 +0200 (CEST)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4IuG-0006zR-0Q
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpQ-0007DF-Gw
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:12 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpP-0005Ja-2A
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:12 -0400
Received: by mail-wr1-x433.google.com with SMTP id i94so11027459wri.4
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHWdTeXytxUpcVqwmVfY5I5RkS0svkvZBXW0tynmbow=;
 b=SfAhQUAM+LvWkf1MSIcch3KC34oBgSNa9P0sl4gSNdZfYX/UziH99n+1tA5/gRuu1P
 PD3UgQqVwkJJ5LkK1UrotGrQE7Xi6166yTHMP3XJOdmVjve0Xx/y6nRKd78znD/d+PQs
 pl7SwQjwl5l8eaWM1iqwugvHlaHW4s7WQrAC0Z9uWONrpMN76TJ/dtG19m13m8EqcTwj
 0XWcfPOPtRcjr65KHNjq5wNGYdQbYNdlWOG+Ei2yuOfX9xq/f9qIVg/EBOCyp6+q3eNV
 vHGQMhLoAbeL65ZdNggmKmPnfEhz+sGotUFnT7w8z502RvKUmdBzNtNXVHwlZ3/NSrua
 g8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iHWdTeXytxUpcVqwmVfY5I5RkS0svkvZBXW0tynmbow=;
 b=UWUiMlIVuwGGgIHY/gUZt7g1P5zkEW6rf90kMaWG0ZmDy0ce6L5fTnaNNetxnyw3mO
 aZabR9P/m+q1dVwepEvNN4Y/5YueqJKTYCxA3UpnAjSaLbr92ncGAgr0GN0KR7KT1Tle
 rDhq/lBWZ24dKIo06y6yMAvw7Rocj4UYtWpOYvYwPx5gHrsvLq95FzqKEg/2i2LDmo8v
 /bf6CAzKGC7Bwzl6tPPU38I3vK9f1MENvZMNWOr2aZaQU6NXBvtc4/z1x8uCW9xJ/YRX
 0sVYEihInc5KM8mdVeLIGyn2HSjA+Jk2L/PEM4RNETGlob0fCkwSPgtAu46Nl+HAcvkG
 pHkw==
X-Gm-Message-State: AOAM531vBvUefE5yVfOHk8fkJgFQve9zbl0SMQ/0JFqMwIwQgafMtfNM
 Sy5Sinu/5oNEZWTz8m3VI3L2rxlS+CuZrA==
X-Google-Smtp-Source: ABdhPJwZwiMZywH9aHoTgEhbdJOCJ/VexFLfpPz9Y2AUuzz2D3I+dBryPbmeF1TCD4cSQPGd2g8nxw==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr10889736wrh.29.1626422649495; 
 Fri, 16 Jul 2021 01:04:09 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id p12sm6558046wma.19.2021.07.16.01.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:04:09 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] plugins/hotpages: introduce sortby arg and parsed bool
 args correctly
Date: Fri, 16 Jul 2021 10:03:39 +0200
Message-Id: <20210716080345.136784-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716080345.136784-1-ma.mandourr@gmail.com>
References: <20210716080345.136784-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x433.google.com
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


