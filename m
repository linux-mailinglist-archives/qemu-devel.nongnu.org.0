Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA2567352A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:11:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRos-0004NB-J3; Thu, 19 Jan 2023 05:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRo3-0003x3-Dy
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRo0-0005FA-TG
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:02 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so851747wms.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9/wJsUKk8bQtxiGr+pYnou0gg/wwc/GqZGoP+Dlsik=;
 b=nmvG/a8rtLzjkSXcpCvX06nZSF+PTU0/z/yFIJu4iZS6dz6MT5Y37aKLaubQusm6lP
 J9tvyzRIeS+caSu4OPq2NyhomgvU2kyICCfwYdxMHiZ6vxTEYMj9aFg0r1QPdI4Ybkt6
 boNAnkNYcXEdmSk/QzwnVMID1TrLKM3oo/qYJygrG9fW+DTNfePCugsOhM/hWQSQidYG
 LySuqo+j54XiFYb8L3hABPIalUHsmE4LveQ++vlMtXh4TD6zdq5wnhE0SM6tV3uzEFHF
 xO9XTNuFS/KCDRr2JZSEkZ30n3p3j0aliS7+65SHA/3AnZr7lYrdlY0QrOIMhAG2kKNz
 E6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R9/wJsUKk8bQtxiGr+pYnou0gg/wwc/GqZGoP+Dlsik=;
 b=vXgyuGP/KNFa+qox76m/2zY2LhNCThYSRjJATb/OPA/m8MplqFeAEnHBLf+/MOioIn
 62dAe7jk2a3r0QI34UShtQXf/8O5AJD4hFViiizxH9iUz9ih7Qdg9Bnw/g/ppb4KLXu9
 8T9xtmGPBrZNUI7ZNd7EuBJqGyadBSehPj01ICmCsS3EIAwsjz6TdvWuVaJlLcHB9Fi9
 buPFx25EMnUcleLwDN4b1LKVgZ732Jv2x63uTFEAyQs60O2JiJ/+iSx1Dvk0rJMJ3RpX
 kKFHb18QbPNcGi1CoHt1xRwEs6mlTIQWZTm/B+7ZAV4L+qP2JFdH5AhPUXtAHryFG8oc
 Xsrw==
X-Gm-Message-State: AFqh2ko0oGYnMTW7XuPp6yq05sMD6+x2BTDd2IzGH4hAqos3IgTdF81i
 k37qflga76OerAocOXOFciDGObgsjf8UH/Gy
X-Google-Smtp-Source: AMrXdXtmkH2cP/89CnfhSRvTQg8DW3RWnshHKoBm/lVF7LlJ0VThiL6jw63upEkr3yaMJ6tPKDiE9Q==
X-Received: by 2002:a05:600c:4256:b0:3da:2a78:d7a3 with SMTP id
 r22-20020a05600c425600b003da2a78d7a3mr9320084wmm.33.1674122759309; 
 Thu, 19 Jan 2023 02:05:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c1d8400b003da286f8332sm4712165wms.18.2023.01.19.02.05.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:05:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/8] tests/qtest/migration-test: Build command line using
 GString API
Date: Thu, 19 Jan 2023 11:05:33 +0100
Message-Id: <20230119100537.5114-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119100537.5114-1-philmd@linaro.org>
References: <20230119100537.5114-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 85 ++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 43 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index dbde726adf..36e6074653 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -582,13 +582,13 @@ typedef struct {
 static int test_migrate_start(QTestState **from, QTestState **to,
                               const char *uri, MigrateStart *args)
 {
+    g_autoptr(GString) cmd_common = NULL;
     g_autofree gchar *arch_source = NULL;
+    g_autoptr(GString) cmd_source = NULL;
     g_autofree gchar *arch_target = NULL;
-    g_autofree gchar *cmd_source = NULL;
-    g_autofree gchar *cmd_target = NULL;
-    const gchar *ignore_stderr;
+    g_autoptr(GString) cmd_target = NULL;
+    const gchar *ignore_stderr = NULL;
     g_autofree char *bootpath = NULL;
-    g_autofree char *shmem_opts = NULL;
     g_autofree char *shmem_path = NULL;
     const char *arch = qtest_get_arch();
     const char *machine_opts = NULL;
@@ -602,6 +602,12 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     got_stop = false;
+
+    cmd_common = g_string_new("");
+    g_string_append(cmd_common, "-accel tcg ");
+    g_string_append_printf(cmd_common, "-accel kvm%s ",
+                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
+
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         /* the assembled x86 boot sector should be exactly one sector large */
@@ -645,65 +651,58 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     } else {
         g_assert_not_reached();
     }
+    if (machine_opts) {
+        g_string_append_printf(cmd_common, " -machine %s ", machine_opts);
+    }
+    g_string_append_printf(cmd_common, "-m %s ", memory_size);
 
     if (!getenv("QTEST_LOG") && args->hide_stderr) {
-#ifndef _WIN32
-        ignore_stderr = "2>/dev/null";
-#else
+#ifdef _WIN32
         /*
          * On Windows the QEMU executable is created via CreateProcess() and
          * IO redirection does not work, so don't bother adding IO redirection
          * to the command line.
          */
-        ignore_stderr = "";
+#else
+        ignore_stderr = "2>/dev/null";
 #endif
-    } else {
-        ignore_stderr = "";
     }
 
     if (args->use_shmem) {
         shmem_path = g_strdup_printf("/dev/shm/qemu-%d", getpid());
-        shmem_opts = g_strdup_printf(
+        g_string_append_printf(cmd_common,
             "-object memory-backend-file,id=mem0,size=%s"
             ",mem-path=%s,share=on -numa node,memdev=mem0",
             memory_size, shmem_path);
-    } else {
-        shmem_path = NULL;
-        shmem_opts = g_strdup("");
     }
 
-    cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
-                                 "-name source,debug-threads=on "
-                                 "-m %s "
-                                 "-serial file:%s/src_serial "
-                                 "%s %s %s %s",
-                                 args->use_dirty_ring ?
-                                 ",dirty-ring-size=4096" : "",
-                                 machine_opts ? " -machine " : "",
-                                 machine_opts ? machine_opts : "",
-                                 memory_size, tmpfs,
-                                 arch_source, shmem_opts,
-                                 args->opts_source ? args->opts_source : "",
-                                 ignore_stderr);
     if (!args->only_target) {
-        *from = qtest_init(cmd_source);
+        cmd_source = g_string_new(cmd_common->str);
+        g_string_append(cmd_source, "-name source,debug-threads=on ");
+        g_string_append_printf(cmd_source, "-serial file:%s/src_serial ",
+                               tmpfs);
+        g_string_append_printf(cmd_source, "%s ", arch_source);
+        if (args->opts_source) {
+            g_string_append_printf(cmd_source, "%s ", args->opts_source);
+        }
+        if (ignore_stderr) {
+            g_string_append(cmd_source, ignore_stderr);
+        }
+        *from = qtest_init(cmd_source->str);
     }
 
-    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
-                                 "-name target,debug-threads=on "
-                                 "-m %s "
-                                 "-serial file:%s/dest_serial "
-                                 "-incoming %s "
-                                 "%s %s %s %s",
-                                 args->use_dirty_ring ?
-                                 ",dirty-ring-size=4096" : "",
-                                 machine_opts ? " -machine " : "",
-                                 machine_opts ? machine_opts : "",
-                                 memory_size, tmpfs, uri,
-                                 arch_target, shmem_opts,
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
+        g_string_append(cmd_source, ignore_stderr);
+    }
+    *to = qtest_init(cmd_target->str);
 
     /*
      * Remove shmem file immediately to avoid memory leak in test failed case.
-- 
2.38.1


