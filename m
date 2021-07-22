Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C02A3D1ED3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:19:50 +0200 (CEST)
Received: from localhost ([::1]:34182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Szl-00030m-97
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St6-0006BG-NK
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:56 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St4-0005S9-Lq
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:56 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f9so4746973wrq.11
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YM9lSqkX/63SYJ35GkzH3H6NlxnAItXlDoJMddZrrag=;
 b=Tu5/0zCpPXggKABRh2lMhDPDVf7T7wuWxww7OzDBWh6UnX/zxcWBimLPWvlje/naNT
 ICo085fO0XMfzc0QDTdiWh8ceJsGbKFqVihvEFpUpz6e5flSxLgU2hQ10zmeY1d+gAmM
 noMsby1sY/Cz8hdbVb1bIGnMFLVbfPg2zScJpymJyUF1azmespmNK7yikFAGAAsyYXBN
 8l2KPCDaXpVp6UHE5d0GpDh2uqdkEXhOb7TrzcjhFPvG3UnBUNtVdrQ9vDNjzPLvkQQr
 xZWVPFO0yJ3BlTQwj3b1EOZH45thsSPsf8Fh84LwzLPMOiq99dyiX1QXzauwyPaCRhfu
 p2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YM9lSqkX/63SYJ35GkzH3H6NlxnAItXlDoJMddZrrag=;
 b=eJgDP/qFejPBXsRnmLbAKakTupuP7L+Kl90uMXuzkBOBk8LR+VQHxsLBUtQNMttjLh
 qyKty+PcfZGlzjMNUaV5elep2aIAhm9QJE7zLKwQWELq7up7PK1kVsa6fhyxTcyIZ0sa
 VxjwqT2hH3lEkVDX6kM2Uk8OXDlsZT8FoFY6id/TTTyM5xv6KRxVIKAyGR21z6WN3Cim
 +eW/qHvxST3ttr0NUw2e2gsJkaps4ECCaqXvupX46pYBMP6eO88oqB5kI8ihF2kSrJWC
 aSnrxnFBKHmrq7l9qAnxwRz3sGcZBusy4Z5CFrhMHCVNi2Ck3jELk2019sO0y1RsWRKn
 Hehg==
X-Gm-Message-State: AOAM530Wh0OgZh4mDA6qssExfPUflQj/XY6Fp69aaLaXtWz7Nb9FTiD7
 Tr6x/GXDpQOce/g/h0LlaaEgBN+aFp0=
X-Google-Smtp-Source: ABdhPJxhoPCKtQtULfnM4Wg5pCVz/Va4gvUevGc8yHAqOun97Xa0clOQPfw6uAjpqSg7y6ZeZcNxZg==
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr46355856wrz.227.1626937972857; 
 Thu, 22 Jul 2021 00:12:52 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:52 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/13] plugins/hwprofile: adapt to the new plugin arguments
 scheme
Date: Thu, 22 Jul 2021 09:12:29 +0200
Message-Id: <20210722071236.139520-7-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42a.google.com
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

Parsing boolean arguments correctly (e.g. pattern=on or source=false).
Introduced a new "track" argument that takes a [read|write] value. This
substitutes passing read or write to "arg=" that is deprecated.

Also, matches are now taken one by one through the "match" argument.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/hwprofile.c | 39 +++++++++++++++++++++++++------------
 docs/devel/tcg-plugins.rst  |  8 ++++----
 2 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
index faf216ac00..691d4edb0c 100644
--- a/contrib/plugins/hwprofile.c
+++ b/contrib/plugins/hwprofile.c
@@ -259,27 +259,42 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
 {
     int i;
+    g_autoptr(GString) matches_raw = g_string_new("");
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_strcmp0(opt, "read") == 0) {
-            rw = QEMU_PLUGIN_MEM_R;
-        } else if (g_strcmp0(opt, "write") == 0) {
-            rw = QEMU_PLUGIN_MEM_W;
-        } else if (g_strcmp0(opt, "pattern") == 0) {
-            pattern = true;
-        } else if (g_strcmp0(opt, "source") == 0) {
-            source = true;
-        } else if (g_str_has_prefix(opt, "match")) {
-            gchar **parts = g_strsplit(opt, "=", 2);
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+
+        if (g_strcmp0(tokens[0], "track") == 0) {
+            if (g_strcmp0(tokens[1], "read") == 0) {
+                rw = QEMU_PLUGIN_MEM_R;
+            } else if (g_strcmp0(tokens[1], "write") == 0) {
+                rw = QEMU_PLUGIN_MEM_W;
+            } else {
+                fprintf(stderr, "invalid value for track: %s\n", tokens[1]);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "pattern") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &pattern)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "source") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &source)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "match") == 0) {
             check_match = true;
-            matches = g_strsplit(parts[1], ",", -1);
-            g_strfreev(parts);
+            g_string_append_printf(matches_raw, "%s,", tokens[1]);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
         }
     }
+    if (check_match) {
+        matches = g_strsplit(matches_raw->str, ",", -1);
+    }
 
     if (source && pattern) {
         fprintf(stderr, "can only currently track either source or pattern.\n");
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 1cb8dee240..b7148abef5 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -305,22 +305,22 @@ which will eventually report::
 The hwprofile tool can only be used with system emulation and allows
 the user to see what hardware is accessed how often. It has a number of options:
 
- * arg=read or arg=write
+ * track=read or track=write
 
  By default the plugin tracks both reads and writes. You can use one
  of these options to limit the tracking to just one class of accesses.
 
- * arg=source
+ * source
 
  Will include a detailed break down of what the guest PC that made the
- access was. Not compatible with arg=pattern. Example output::
+ access was. Not compatible with the pattern option. Example output::
 
    cirrus-low-memory @ 0xfffffd00000a0000
     pc:fffffc0000005cdc, 1, 256
     pc:fffffc0000005ce8, 1, 256
     pc:fffffc0000005cec, 1, 256
 
- * arg=pattern
+ * pattern
 
  Instead break down the accesses based on the offset into the HW
  region. This can be useful for seeing the most used registers of a
-- 
2.25.1


