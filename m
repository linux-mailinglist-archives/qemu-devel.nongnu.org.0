Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DEF673CEE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:00:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWNz-0006aQ-Me; Thu, 19 Jan 2023 09:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNk-0006K7-JD
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:13 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNj-0003Wh-4o
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:12 -0500
Received: by mail-wr1-x429.google.com with SMTP id q10so2152642wrs.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDdmGNe7wNRYvz5eLda5xFcX55ORUlYvsE0xP8qQXTc=;
 b=Zw4gwQNr5o6Kb1CTDQ2lJ/6L0sQSdoltMXeOQROzc/aazNjlkEAqvKsWcMnNpJYJ5m
 Q2noZCyj+jnrdU7FmX40hp2CwcDCpYjNXFPLuO/AqWWJ00rc9+JQJVAA1JMjB/MbaET9
 9CWFwCArBV3FF5gUGtva/tfQymhvpRzHopNe+ibfak+7OpG2nd7iY+pBCscDrdlXWCtn
 lKvZUwtCdOj30zgVwPJzS79zlzUJIxUVTlSKC716vtb9jQ46sUDkEK7wTAEtvzgr+8EQ
 t8pWA5fO7MOBla4mMdaJgPDKUFXR8Rt1rQ88lb6GlPkUM3e1ZhnuppiKngGXXJVlbwVZ
 575Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PDdmGNe7wNRYvz5eLda5xFcX55ORUlYvsE0xP8qQXTc=;
 b=BPZ6dbPV+TI1XcWGe/XyaoQenWwY24osvoSwq+C0Hke4kSH+41yOtnJUkgLZyuEsYv
 LzU05aXzC7c4/kS/pCNRvDRdozWMZDrtaN7dvH4GeJAIJ5pRbXrqIl1ssOXWOFQqrPBL
 /i6/8DidD/vZF7ls8ntESMxd+VA6nakJXCM9qr3oVhf0w5vVvN60r0XjsnHaFtOHJOdW
 w8IdpJJdZEXw+olWjwnRNFieDW+Etv3XGcuR4iaw0SRXoufeE9ehCAzzdQHE9aPpYS65
 MVetCwMM6+PHGmlwD4fxQwC5ndax55z5GubiA29ZS/gWKWEYfhH7NMmpP1JgCxRaLg3k
 Hmzg==
X-Gm-Message-State: AFqh2koIfrKft1FwaFXG1k3FXvS1hrm5tpWKKYpYZ4tRHBbZ1TvcMegk
 1cXYKt7V2QRMHnewHoZ7BOrukxt1iL5/k6an
X-Google-Smtp-Source: AMrXdXtNjtApO+ZR4bOfC7zMfdzkJCOHgbapNSCHcxzhrZ13d83/5Zc2YB16TEnk5/rYaxg//7pwUg==
X-Received: by 2002:a5d:5955:0:b0:2bd:e87c:e831 with SMTP id
 e21-20020a5d5955000000b002bde87ce831mr9074190wri.69.1674140350266; 
 Thu, 19 Jan 2023 06:59:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a5d4cc8000000b002bdeb0cf706sm14689922wrt.65.2023.01.19.06.59.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/11] tests/qtest/migration-test: Reduce 'cmd_source'
 string scope
Date: Thu, 19 Jan 2023 15:58:33 +0100
Message-Id: <20230119145838.41835-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
 tests/qtest/migration-test.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 8beeda4686..6c3db95113 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -584,7 +584,6 @@ static int test_migrate_start(QTestState **from, QTestState **to,
 {
     g_autofree gchar *arch_source = NULL;
     g_autofree gchar *arch_target = NULL;
-    g_autofree gchar *cmd_source = NULL;
     g_autofree gchar *cmd_target = NULL;
     const gchar *ignore_stderr;
     g_autofree char *bootpath = NULL;
@@ -672,20 +671,22 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         shmem_opts = g_strdup("");
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
+        g_autofree gchar *cmd_source = NULL;
+
+        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
+                                     "-name source,debug-threads=on "
+                                     "-m %s "
+                                     "-serial file:%s/src_serial "
+                                     "%s %s %s %s",
+                                     args->use_dirty_ring ?
+                                     ",dirty-ring-size=4096" : "",
+                                     machine_opts ? " -machine " : "",
+                                     machine_opts ? machine_opts : "",
+                                     memory_size, tmpfs,
+                                     arch_source, shmem_opts,
+                                     args->opts_source ? args->opts_source : "",
+                                     ignore_stderr);
         *from = qtest_init(cmd_source);
     }
 
-- 
2.38.1


