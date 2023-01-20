Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F54674F64
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:25:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImhZ-0005O9-9F; Fri, 20 Jan 2023 03:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhS-0005Ia-QX
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:38 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhP-0004gJ-HP
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:37 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so5273068wml.3
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eiWB2mgS5s8IODt1mSJBolF54HXrNWV0tPwSRIkLm8=;
 b=T9fNlr7qdkM84eEPuX5uCJ76nlAtPpVEul0xug1Pz08e652KrE84UQWICNDZMBTEp7
 If0+D41sb1wOoRWMMpmcG3Ab+JKEsBgY2q/ruawR0hNU3/U++QQc+uRklunMUUxHeyj1
 /o9FbNoE2iSiLlW2WdqfMOGYsNe/r9RYgTMwmBh8S6G3V+Ngr8M55U4jM+pIx5lDH2CC
 RopvZgZ0ERsE0Z4U7m3pZLlyclIxTFdwDKLavsoz1HyTOm5SN2gDgS09QOm8275Ze7Ux
 cMuOdMbkKTi9h7XrwddtIb3AOmk/0iUmW9B8ifWc45hqvc03zmkANKHf6RpUUyDRyP44
 CliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8eiWB2mgS5s8IODt1mSJBolF54HXrNWV0tPwSRIkLm8=;
 b=eXL7CCYF8lVLOdpMH4KYSP8uvSQd2AP6Kykuj1j2HuGwIxtjUwWfuvdpQCdl95kTd/
 oWF1jOa8DEjER1HI0TMuc+d428q2afXXfcxiBu2Df+LXuer3gkGrsv9ZDwiFquxrnoMo
 PU/WnjFig1V19dmVu9sr6saTuz3g6q/L1Gi1xckUHCzCfn2P5nEc+muPqiQlT2I/nwr8
 9CRS+AXr4ZAjTEyV5Dox45++lrJ9hZulT4lotNr19XPSKZfV2sUa2xkaFzm2UhIkzyIx
 OFyvxBL7SEb8oaVbY3zIJHvOOIxxdnEsiTwYKZ2o8aKB2yyzdGB6MDz9FrOaBOJxy5Bm
 AGdQ==
X-Gm-Message-State: AFqh2krUg5WypVB++OvqqraiNeZN3V5z6ho7Fg1Ocz7gWmCNE6haIbXh
 RyzHVATboTpAFIs8Nc3Pxo0XdmEkyboX/UUf
X-Google-Smtp-Source: AMrXdXtmC+HEvptR8nXq9UryNyg55l1bKzq96sDgtQebkqTaOxjpmybbYyq+wpG5lujY/PmZLwFzrw==
X-Received: by 2002:a05:600c:354e:b0:3db:331b:bd57 with SMTP id
 i14-20020a05600c354e00b003db331bbd57mr1073167wmq.23.1674203073952; 
 Fri, 20 Jan 2023 00:24:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 hg8-20020a05600c538800b003d974076f13sm1552992wmb.3.2023.01.20.00.24.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 10/11] tests/qtest/migration-test: Build command line using
 GString API (4/4)
Date: Fri, 20 Jan 2023 09:23:40 +0100
Message-Id: <20230120082341.59913-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Part 4/4: Convert rest of options.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 53 +++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1ed3505c91..e7786bcbc5 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -585,8 +585,8 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     g_autoptr(GString) cmd_common = NULL;
     g_autofree gchar *arch_source = NULL;
     g_autofree gchar *arch_target = NULL;
-    g_autofree gchar *cmd_target = NULL;
-    const gchar *ignore_stderr;
+    g_autoptr(GString) cmd_target = NULL;
+    const gchar *ignore_stderr = NULL;
     g_autofree char *bootpath = NULL;
     g_autofree char *shmem_path = NULL;
     const char *arch = qtest_get_arch();
@@ -666,12 +666,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
          * IO redirection does not work, so don't bother adding IO redirection
          * to the command line.
          */
-        ignore_stderr = "";
 #else
         ignore_stderr = "2>/dev/null";
 #endif
-    } else {
-        ignore_stderr = "";
     }
 
     if (args->use_shmem) {
@@ -683,31 +680,31 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     if (!args->only_target) {
-        g_autofree gchar *cmd_source = NULL;
-
-        cmd_source = g_strdup_printf("%s "
-                                     "-name source,debug-threads=on "
-                                     "-serial file:%s/src_serial "
-                                     "%s %s %s",
-                                     cmd_common->str,
-                                     tmpfs,
-                                     arch_source,
-                                     args->opts_source ? args->opts_source : "",
-                                     ignore_stderr);
-        *from = qtest_init(cmd_source);
+        g_autoptr(GString) cmd_source = g_string_new(cmd_common->str);
+        g_string_append(cmd_source, "-name source,debug-threads=on ");
+        g_string_append_printf(cmd_source, "-serial file:%s/src_serial ", tmpfs);
+        g_string_append_printf(cmd_source, "%s ", arch_source);
+        if (args->opts_source) {
+            g_string_append_printf(cmd_source, "%s ", args->opts_source);
+        }
+        if (ignore_stderr) {
+            g_string_append(cmd_source, ignore_stderr); /* last string */
+        }
+        *from = qtest_init(cmd_source->str);
     }
 
-    cmd_target = g_strdup_printf("%s "
-                                 "-name target,debug-threads=on "
-                                 "-serial file:%s/dest_serial "
-                                 "-incoming %s "
-                                 "%s %s %s",
-                                 cmd_common->str,
-                                 tmpfs, uri,
-                                 arch_target,
-                                 args->opts_target ? args->opts_target : "",
-                                 ignore_stderr);
-    *to = qtest_init(cmd_target);
+    cmd_target = g_string_new(cmd_common->str);
+    g_string_append(cmd_target, "-name target,debug-threads=on ");
+    g_string_append_printf(cmd_target, "-serial file:%s/dest_serial ", tmpfs);
+    g_string_append_printf(cmd_target, "-incoming %s ", uri);
+    g_string_append_printf(cmd_target, "%s ", arch_target);
+    if (args->opts_target) {
+        g_string_append_printf(cmd_target, "%s ", args->opts_target);
+    }
+    if (ignore_stderr) {
+        g_string_append(cmd_target, ignore_stderr); /* last string */
+    }
+    *to = qtest_init(cmd_target->str);
 
     /*
      * Remove shmem file immediately to avoid memory leak in test failed case.
-- 
2.38.1


