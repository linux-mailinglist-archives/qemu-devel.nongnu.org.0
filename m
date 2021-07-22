Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263093D1ED2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:19:40 +0200 (CEST)
Received: from localhost ([::1]:33472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Szb-0002Xm-7W
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St1-0005zW-Ot
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:51 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St0-0005OK-5V
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id p9so609912wmq.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5VlBMv+1xhtN/dKoeUxrkNxne0z8P6rIAiCLzB64L0=;
 b=kyMQL+zUomt/XEMRm7oP9/ZUz26l6L+zCQ2SLl/eHcXrEd7O7W3IVLI6O7l+eSvz2s
 c0KXqXtH+rMXYEzttjmErxZv+Wn/Xyp+Pt+aT7S4KclSIMe4p4NqYIHA9u4C2aJ/nbq3
 1zlz/JBNv1JlXuue9MUG3R7p7axwXspaOrVrWno6aZXGjT2+ObJXT06eaBsGGIuV6Pq+
 GPWLU3ywJNqODVUKtmwJiKpcwJkylnBU2XHr7J4uwTKp5rmZQs0a9cgr5pE+74D8bunh
 o6jK++ECWq7rXM+DhOgEB4SzhD1FP5W+5yV+TAsadqA/hp3tZvLkhoSp0eam3FxxLOB4
 OL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5VlBMv+1xhtN/dKoeUxrkNxne0z8P6rIAiCLzB64L0=;
 b=bY6su6tPsfIlGRjlBM5196y7ix7hMfXE9XLBfA4Po9TJ2xhd6Uhf6DiBDUo+lRyhFO
 1VOeBkjQbn0Lp2xYRopBZqlD5uoTzPU5AdhW9DhA0TRzDE1vfkFZbbq7N1bBRSHi69sv
 +8BduFRj5arBNp7VEtG4jxT73l8BxaREzDCb1ANch7aRVtNO6nDAakP/Xy1n3WWs3awa
 9eFWVbcqrUJjyDaVJno9tMM9Hsl9bkqhdgGrrfkBAC95uEjErKXHgTvC0Kqo3G1QugAG
 EFPCqV+NXxKXvZiUNLwzs+7APAHOk9ZBup6o4z5eDfCPNAhoC9GzVm9JPfMxLsUKVRgM
 y1QQ==
X-Gm-Message-State: AOAM531ZMEX7e+Ou7S9WiHJuOOyu71mYo6GPG5ea8gm+Ue6CUO3AZOGO
 hKPjExcnhV2blR8r+sNpSv+m0zMmHMQ=
X-Google-Smtp-Source: ABdhPJyxPTNdRi3SC9lWQ6hXV1i7rDZyM/DBEtVeFR2wgnF+tLsUdt2dLFRqpPaa4xuQnCXsGgDRNA==
X-Received: by 2002:a1c:7e44:: with SMTP id z65mr7658395wmc.1.1626937968537;
 Thu, 22 Jul 2021 00:12:48 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:48 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/13] plugins/hotpages: introduce sortby arg and parsed
 bool args correctly
Date: Thu, 22 Jul 2021 09:12:26 +0200
Message-Id: <20210722071236.139520-4-ma.mandourr@gmail.com>
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

Since plugin arguments now expect boolean arguments, a plugin argument
name "sortby" now expects a value of "read", "write", or "address".

"io" arg is now expected to be passed as a full-form boolean parameter,
i.e. "io=on|true|yes|off|false|no"

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/hotpages.c | 30 ++++++++++++++++++++----------
 docs/devel/tcg-plugins.rst | 15 +++++++++++++++
 2 files changed, 35 insertions(+), 10 deletions(-)

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
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 370c11373f..d09c349234 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -192,6 +192,21 @@ Similar to hotblocks but this time tracks memory accesses::
   0x0000000048b000, 0x0001, 130594, 0x0001, 355
   0x0000000048a000, 0x0001, 1826, 0x0001, 11
 
+The hotpages plugin can be configured using the following arguments:
+
+  * sortby=reads|writes|address
+
+  Log the data sorted by either the number of reads, the number of writes, or
+  memory address. (Default: entries are sorted by the sum of reads and writes)
+
+  * io=on
+
+  Track IO addresses. Only relevant to full system emulation. (Default: off)
+
+  * pagesize=N
+
+  The page size used. (Default: N = 4096)
+
 - contrib/plugins/howvec.c
 
 This is an instruction classifier so can be used to count different
-- 
2.25.1


