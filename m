Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F71674F6A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:26:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImhD-0004qg-NU; Fri, 20 Jan 2023 03:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhB-0004pc-PC
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhA-0004eL-7s
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso3791430wmn.5
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V49wRNxwVefl714Mn2UmK/YcN8/tnExcJzoF8D3gX0Y=;
 b=o0vr145+gFbKvwUSR9+CpLM+GMLsJSuJbsC54vIZlk+ggA6K0uqDBjISQlaLvLV1j8
 9k6gO5YfKHXmnXBKPLKW0RXSuILVsngZTvi+EXZMKc4+ZD2OAGqwbo8CaOaESJ7HZzs4
 w2fcXU0VDjXsy1g1Q/lg4PkACpRu384iKN9JilIQbOQUFDvTT594/YiPU3861zLwsYvW
 yvt9oH+Tv8VCsZH7vjwFdN+5/mX0vkEjIqDS7s4zpGlQB+WQ6XnQNV0KpCzfoUSMZfD7
 cncvB/DznVuqUICow5wb3yHe/YfpWmfDBcwYG/2tA1RtSLzmt7wD6YoZ/UL7FZU3EIt9
 iIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V49wRNxwVefl714Mn2UmK/YcN8/tnExcJzoF8D3gX0Y=;
 b=vZzaMY8YzaP+FFT5lwaXPT9f5CDqScP81rBQ6gq9bkvRfieIW4Q8PY/U30nZO4EzdD
 2Cq/k63ul3ZK8QxZWx7XIhhMJI6+f9PvxkK8OzH9HnuiR0iVptTiVVQSiDJt7SPE6e1W
 ZKNAbO9/lWbogUkemlK1AGTA5kPPZ3dD12UTPqtZOPN3m418BIIf6hefyi6SKn1AQ0xt
 xUgzTl+s2KC58k9LWvKMKzkjZfBV1TIFlmFU+vyG6Me5hQNU/Kj5ag1HvPk/usCWewrI
 gx13Xfn3u4aGeAwvuqhVIbFnBaOpGuyD9Btig48ULxVrvejvc9B57sFk+J7mIdiLBrVi
 R0wA==
X-Gm-Message-State: AFqh2krWuOc3IL8aYXh3mhaKHOxTutb3wC0z15JKUrbV4OuNKqfU8e46
 GED+9u/lo9EtNPisnHrGE7+NQPNyIM0bYVRg
X-Google-Smtp-Source: AMrXdXtLqdgPjTcCFIf7EWzokIkDV3lEeJqfjO01MsXfjyVHawfPp38JUEfGAXi5ZnX3Ls9K2UWXSQ==
X-Received: by 2002:a05:600c:2255:b0:3da:f950:8168 with SMTP id
 a21-20020a05600c225500b003daf9508168mr12617985wmm.35.1674203058641; 
 Fri, 20 Jan 2023 00:24:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a05600c4e0a00b003db0cab0844sm1507471wmq.40.2023.01.20.00.24.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 07/11] tests/qtest/migration-test: Build command line using
 GString API (1/4)
Date: Fri, 20 Jan 2023 09:23:37 +0100
Message-Id: <20230120082341.59913-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Part 1/4: Convert memory & machine options.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f96c73f552..9cdef4fa65 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -582,6 +582,7 @@ typedef struct {
 static int test_migrate_start(QTestState **from, QTestState **to,
                               const char *uri, MigrateStart *args)
 {
+    g_autoptr(GString) cmd_common = NULL;
     g_autofree gchar *arch_source = NULL;
     g_autofree gchar *arch_target = NULL;
     g_autofree gchar *cmd_target = NULL;
@@ -601,6 +602,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     got_stop = false;
+
+    cmd_common = g_string_new("");
+
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         /* the assembled x86 boot sector should be exactly one sector large */
@@ -644,6 +648,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     } else {
         g_assert_not_reached();
     }
+    if (machine_opts) {
+        g_string_append_printf(cmd_common, " -machine %s ", machine_opts);
+    }
+    g_string_append_printf(cmd_common, "-m %s ", memory_size);
 
     if (!getenv("QTEST_LOG") && args->hide_stderr) {
 #ifdef _WIN32
@@ -674,33 +682,29 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     if (!args->only_target) {
         g_autofree gchar *cmd_source = NULL;
 
-        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
+        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg %s "
                                      "-name source,debug-threads=on "
-                                     "-m %s "
                                      "-serial file:%s/src_serial "
                                      "%s %s %s %s",
                                      args->use_dirty_ring ?
                                      ",dirty-ring-size=4096" : "",
-                                     machine_opts ? " -machine " : "",
-                                     machine_opts ? machine_opts : "",
-                                     memory_size, tmpfs,
+                                     cmd_common->str,
+                                     tmpfs,
                                      arch_source, shmem_opts,
                                      args->opts_source ? args->opts_source : "",
                                      ignore_stderr);
         *from = qtest_init(cmd_source);
     }
 
-    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
+    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg %s "
                                  "-name target,debug-threads=on "
-                                 "-m %s "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
                                  "%s %s %s %s",
                                  args->use_dirty_ring ?
                                  ",dirty-ring-size=4096" : "",
-                                 machine_opts ? " -machine " : "",
-                                 machine_opts ? machine_opts : "",
-                                 memory_size, tmpfs, uri,
+                                 cmd_common->str,
+                                 tmpfs, uri,
                                  arch_target, shmem_opts,
                                  args->opts_target ? args->opts_target : "",
                                  ignore_stderr);
-- 
2.38.1


