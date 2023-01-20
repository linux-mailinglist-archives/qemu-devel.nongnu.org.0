Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4FD674F65
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:25:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImhI-0004tm-EI; Fri, 20 Jan 2023 03:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhG-0004sL-Sl
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:26 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhF-0004er-By
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:26 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso5272144wmc.4
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lFLQeKMXh/hwQNy/OTcwcNWvQl29Jep2/8SFzcZ0GJ0=;
 b=IF5pz5EprsFwFttDnqA4mYpz1vqAulCqFdgm1415c/oQai+BOzDMRJ+lSz+uQSveBj
 GtzmEx/uiLWnAmp6lWJkD3OIWcKGplUAWSNz7WAs1r0Euw/ZNmRkIePLJybTW1YSvX5k
 AZhQbrcZ+lAxtUR372TG6VIZ9hwEJPWg0Apml16OxxQ1UDE5m0nZ6yyLR0aM6HOg1Yjw
 lEuzCwKmXxbPnKoQDE+LmtqJWR4KfOwV7QU9ePwYV71SqUCOLhVUNI8G/XpsgQAbmX9z
 CWrymwzf60FnSeRQP9q0Eg106RlosCXMD+KUmvsbeWwSaUveM3QwmR8LOIvzSBrSAPb3
 eeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFLQeKMXh/hwQNy/OTcwcNWvQl29Jep2/8SFzcZ0GJ0=;
 b=Wz8Kp/yK7ocbfJutF65Q+aKCz5erKLCDJMs9i3rtJuCpzGn2mMuCcMDtxM3I16T8LD
 LvYOIZXLmeX2UhPVLSFpK0P52ptvnG1l4UOY8Cp0E9FJ2Akne/cOG69ztJ2Xfq7l9cib
 7olD8JMYRPAu0/6aQfjCTDgLBXuah38w0329Upjz2WtQUj5twGjYndPzKpworOOg/Ctr
 ziC2MDnZ4RNtv7iZdViK3YTLPnYWsS61ue8bSRvmrtMfIRiRWkJ2fliL7k4DB+PP0M2D
 cvIvBSe1Rl/nI0xLs1bHPXVd3wOIHbADipbh9ogt/bwYpEJ+kjUB8Z2rEnjU9nct4Ash
 9qfw==
X-Gm-Message-State: AFqh2kpLWH2EZCfSpIsmQlhkoJOUUZun9NVqBp4hGwLEsyyRvDMbvy+W
 4Ra6ydTHwcXF1e29YtvFXfmKJEgipdC/s9MX
X-Google-Smtp-Source: AMrXdXs944Jv3bO15N6VZt03X5aD/nWKC0MLUjySKXp7gVgfeHzdr291x+xzscD2pcu4J0ddYuDt1Q==
X-Received: by 2002:a05:600c:1d05:b0:3d2:3be4:2d9a with SMTP id
 l5-20020a05600c1d0500b003d23be42d9amr12725435wms.20.1674203063879; 
 Fri, 20 Jan 2023 00:24:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c3baa00b003d96efd09b7sm1731671wms.19.2023.01.20.00.24.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 08/11] tests/qtest/migration-test: Build command line using
 GString API (2/4)
Date: Fri, 20 Jan 2023 09:23:38 +0100
Message-Id: <20230120082341.59913-9-philmd@linaro.org>
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

Part 2/4: Convert shmem option.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 9cdef4fa65..670097a956 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -588,7 +588,6 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     g_autofree gchar *cmd_target = NULL;
     const gchar *ignore_stderr;
     g_autofree char *bootpath = NULL;
-    g_autofree char *shmem_opts = NULL;
     g_autofree char *shmem_path = NULL;
     const char *arch = qtest_get_arch();
     const char *machine_opts = NULL;
@@ -670,13 +669,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
 
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
 
     if (!args->only_target) {
@@ -685,12 +681,12 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         cmd_source = g_strdup_printf("-accel kvm%s -accel tcg %s "
                                      "-name source,debug-threads=on "
                                      "-serial file:%s/src_serial "
-                                     "%s %s %s %s",
+                                     "%s %s %s",
                                      args->use_dirty_ring ?
                                      ",dirty-ring-size=4096" : "",
                                      cmd_common->str,
                                      tmpfs,
-                                     arch_source, shmem_opts,
+                                     arch_source,
                                      args->opts_source ? args->opts_source : "",
                                      ignore_stderr);
         *from = qtest_init(cmd_source);
@@ -700,12 +696,12 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                  "-name target,debug-threads=on "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
-                                 "%s %s %s %s",
+                                 "%s %s %s",
                                  args->use_dirty_ring ?
                                  ",dirty-ring-size=4096" : "",
                                  cmd_common->str,
                                  tmpfs, uri,
-                                 arch_target, shmem_opts,
+                                 arch_target,
                                  args->opts_target ? args->opts_target : "",
                                  ignore_stderr);
     *to = qtest_init(cmd_target);
-- 
2.38.1


