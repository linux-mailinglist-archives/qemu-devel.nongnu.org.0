Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CEC673CED
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:00:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWO1-00075K-W0; Thu, 19 Jan 2023 09:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNx-0006gn-BL
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:25 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNu-0003bJ-Fg
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:24 -0500
Received: by mail-wm1-x330.google.com with SMTP id j17so1784130wms.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVTTnz/8fSE8XqVbO+igHiEnEik6rCIbqSZyBrV0w2w=;
 b=Uejqy444UqX7cdhXNIAv9Z+kvBZfLPRiY1oZLhzkEiCBh9JSZqO38sThLjAsSsfCRS
 6DOvBfEQVslvU4J/3tdNNfeSsNR1K8wQhopccQbmumHQ6HXr8P3CLYDM/vMX/3aKL7lk
 7wCjjLMEbrSsvxqFSYVOavtuo7YvK/CDI4kK/Z7Ia628bPPVqf/Z4bdV5epBoXiKrtaB
 lV4XaHtx2nGJ9US5keRbkaPKY3WUuYqtExFg84eOqnJuf8w9Wes2IDmZxsfEZHYmio6N
 sH/0SMl6GrEmWqlEpoP+mzPIyS9Z+a9xWxekUKM8m+uCPR12wKhK1SFnsbBKATzIPE60
 IK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aVTTnz/8fSE8XqVbO+igHiEnEik6rCIbqSZyBrV0w2w=;
 b=VSOrGurmz/CM5NudhVynNgDCbQ8YdNpu4Hz+1vb7Q/uAb1N7HAwaguN4WcPwAEM0s5
 sIDXP+f/rmxAYf0XthSYm6x9J/Kgn4LeGEtsK0NP8O/L77yBi06xuMIZFSF3ct4MdXsR
 MA9oFIhU8aWPam96bnYo8sXl1wmA+IDqBUwZc6e22fN7fOucEEBmctsk4HvewJIbiRR2
 Lqeeym08CFiNso/+nW2QI21NJM3HLdAI1rRCjXfQGqSfhyUE+IqfDLUworkgCHJGPZYQ
 L0h4eMvHFAFZy3FU1NOtgvuf3OKLrNqplPa/8Pyb5NHJQ31hl1bWy3wUNUczKDvqtMTd
 SHyw==
X-Gm-Message-State: AFqh2kooGKHJGjUiG+ByLmrNyi6hiBmXVMUDBJeHWdOgi+VubGOVLdMA
 QP0WjFURdEw9mrSFuWOKMtoKySuuqTovL+NP
X-Google-Smtp-Source: AMrXdXvyhdvQYorH2c1wShLPjFnC2Pcm02/N/bAyRYwx8MDkkrq+oJrxAZLEC5BwahY2jH7EsdNPaQ==
X-Received: by 2002:a05:600c:1c23:b0:3db:b9f:f2e with SMTP id
 j35-20020a05600c1c2300b003db0b9f0f2emr8947227wms.14.1674140360169; 
 Thu, 19 Jan 2023 06:59:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m15-20020adffe4f000000b002bdd155ca4dsm19683454wrs.48.2023.01.19.06.59.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/11] tests/qtest/migration-test: Build command line using
 GString API (2/4)
Date: Thu, 19 Jan 2023 15:58:35 +0100
Message-Id: <20230119145838.41835-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Part 2/4: Convert shmem option.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7aa323a7a7..8377b3976a 100644
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
@@ -685,11 +681,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s "
                                      "-name source,debug-threads=on "
                                      "-serial file:%s/src_serial "
-                                     "%s %s %s %s",
+                                     "%s %s %s",
                                      args->use_dirty_ring ?
                                      ",dirty-ring-size=4096" : "",
-                                     cmd_common->str, tmpfs,
-                                     arch_source, shmem_opts,
+                                     cmd_common->str, tmpfs, arch_source,
                                      args->opts_source ? args->opts_source : "",
                                      ignore_stderr);
         *from = qtest_init(cmd_source);
@@ -699,11 +694,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                  "-name target,debug-threads=on "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
-                                 "%s %s %s %s",
+                                 "%s %s %s",
                                  args->use_dirty_ring ?
                                  ",dirty-ring-size=4096" : "",
-                                 cmd_common->str, tmpfs, uri,
-                                 arch_target, shmem_opts,
+                                 cmd_common->str, tmpfs, uri, arch_target,
                                  args->opts_target ? args->opts_target : "",
                                  ignore_stderr);
     *to = qtest_init(cmd_target);
-- 
2.38.1


