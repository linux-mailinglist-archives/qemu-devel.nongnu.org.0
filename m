Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105A2673CEF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:00:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWO0-0006jX-2u; Thu, 19 Jan 2023 09:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNp-0006UX-Nl
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:19 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNo-0003Z1-6w
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:17 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r9so2141233wrw.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=isWU99zMSOEnAE1RSfFCfmsXaFaInKvayEoBiTZj20E=;
 b=fosVB18TI+mAnXjLHz/fhtdfKY4YsG0SmPU5QXIdFxotLYfXM3HcPD/fhbFo+9ptHF
 JIqmgnTMsbrWyppROk0Ff+Ud3binXAj7VVnmfPrFvbNG0RUimTAbkgn7xqA9jFPzFhps
 +6fRoQcKU5K4nmGU6rvdyS/HatAAeVLmgfjdTrffV8BrbRj2UFOFegGQpuXdumSREyUa
 aYW98a0SdZ4pzU/FOK1ucAGgegKt6nvhiwJTF7BjSqU7hkoMoiZE7LfPH6qXFCOWhJdp
 rhWAYGj724QQcw56CzP57Pz5BUIGd1ozWb2G23IkQEDDZJWy9YiIVd2xNZ5MTHC47wL+
 27pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=isWU99zMSOEnAE1RSfFCfmsXaFaInKvayEoBiTZj20E=;
 b=qNa4kIQ6USjaHeC5akXJJlbSpqWeNQ7VtfdtstLSSMY0yd7kXmOIfMbmBM75h9nmiY
 P8aUIwvvnICDGaqD7Fdo0B6IxL46lzhZ/n26SP1Tvw5GfFNjqUSX+Z+R8bfPWv2oNshk
 u3IF5GnR0c8exhquAs8kgX/jNumDJiKsqvhDHSa4dc3wLL3+C9ENy+eFO0eYAfA0ow1W
 60EL7dkPKTP56L0JOQVihaWde70dPHDCTc3355KrTdPraryggRZzN08ccD6MvbllRj2u
 bW29p7UldG2MNkulxFHPcHJKkxrXSKm1ARFbww8erGsDaW6jXN+IfIjN5dK+EikGnQlX
 pvpQ==
X-Gm-Message-State: AFqh2krZkBTx5J4HVJW81FIuJHL+f1/H+nvy8TybwruYGQBW8mLchDjr
 xjmsnutSIIOxziFMyb68VLuVAJAGULtayRN5
X-Google-Smtp-Source: AMrXdXsZyfMt1/y4wc/Y6kyWeWcByIIAcruhhWKCl+j5eFAdHmFpytSMY79A43/l+pgwU6DLhaMHuA==
X-Received: by 2002:a5d:688b:0:b0:2b3:b393:181f with SMTP id
 h11-20020a5d688b000000b002b3b393181fmr9793185wru.56.1674140355207; 
 Thu, 19 Jan 2023 06:59:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l1-20020adfe9c1000000b00289bdda07b7sm33113573wrn.92.2023.01.19.06.59.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/11] tests/qtest/migration-test: Build command line using
 GString API (1/4)
Date: Thu, 19 Jan 2023 15:58:34 +0100
Message-Id: <20230119145838.41835-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 tests/qtest/migration-test.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 6c3db95113..7aa323a7a7 100644
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
@@ -674,33 +682,27 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     if (!args->only_target) {
         g_autofree gchar *cmd_source = NULL;
 
-        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
+        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s "
                                      "-name source,debug-threads=on "
-                                     "-m %s "
                                      "-serial file:%s/src_serial "
                                      "%s %s %s %s",
                                      args->use_dirty_ring ?
                                      ",dirty-ring-size=4096" : "",
-                                     machine_opts ? " -machine " : "",
-                                     machine_opts ? machine_opts : "",
-                                     memory_size, tmpfs,
+                                     cmd_common->str, tmpfs,
                                      arch_source, shmem_opts,
                                      args->opts_source ? args->opts_source : "",
                                      ignore_stderr);
         *from = qtest_init(cmd_source);
     }
 
-    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
+    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s "
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
+                                 cmd_common->str, tmpfs, uri,
                                  arch_target, shmem_opts,
                                  args->opts_target ? args->opts_target : "",
                                  ignore_stderr);
-- 
2.38.1


