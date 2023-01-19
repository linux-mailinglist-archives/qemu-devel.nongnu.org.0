Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22D673CE7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:59:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWOA-0007so-N3; Thu, 19 Jan 2023 09:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWO7-0007pu-VG
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:35 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWO6-0003fo-DC
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:35 -0500
Received: by mail-wr1-x432.google.com with SMTP id r30so2125193wrr.10
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PHvSg/mQjdmpWjiVzZNybtfs6HzFLrJQQgtlLJ8QVaM=;
 b=grtJredguK6Odurr8v7Nd4MFu1fynCqzad4KflFqBvCOvKX+FXGkUunlfMNyIT4oFH
 z16/A0Uny8/UNv/i6+UzFR38ZVcxLJm+VQ744tmpB1GFODIms2l9/odSdjaEp6g1rCAT
 XmlumW/NeuNl9QFTab9UKA3c4fWgpiEGg5laOQCB2BQ129FW7fnLQbpZJwqpL69XK27j
 kltJG7DG+qeDQKxf0NRoS5iOzpw387teTPKoc9NApqEw6Zey5WHbi5qJDtNoTEGxaJJ3
 yLyrxYYRjrnWuRAoxG+T+eWlp40CeRadvvxp39lGkM+VWDOChkTJyYfKsROvpm+1jI0S
 iCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PHvSg/mQjdmpWjiVzZNybtfs6HzFLrJQQgtlLJ8QVaM=;
 b=DApxLANFUUEjqcRXrdXROuOFUCQKFSaOqfes28TPda9jTfDaDLdA9rlEDZszaFUYUa
 DKPEOb7A0+eLT9yPr5IBr00jLNV87qoKSxXH7AN58omrbZn3o87OBGfLYSFWhWc76KYL
 80qOXP2vKUeoS88rpW0EM73dMvPi953i7/lBzaQXka3ty3CvAcH7ua+n2JlVY5IHzmNS
 Clu6Jm4cry0YIPcIBuaf3q83CoC8eHbevHYEuRoDrLjqXgjZ8QPhDhS1wqLwpWb6lFH1
 SFf5vv6i3htSQfgQ0vxhdZfYxUDbw8LmmdVHX2G9M2JCTnWV3f/4adZYMNzguvDkBONd
 Nq6g==
X-Gm-Message-State: AFqh2komyA6wf5VCG0kSJj4Jk8cRygvElkGlU2L2XIf2we/jtY4vU8Hy
 kZGYm/u3qc+SyFepVmBLwB6jEifzjQui6yb6
X-Google-Smtp-Source: AMrXdXsCbJxv4Ynl0zgULdN2Wm5sfkHQuD77vtUoSPuJPMLDI98cZ9vUEBS/H546wZJnexUui0BXWQ==
X-Received: by 2002:adf:dbc6:0:b0:2be:12a8:9f75 with SMTP id
 e6-20020adfdbc6000000b002be12a89f75mr8304705wrj.55.1674140372843; 
 Thu, 19 Jan 2023 06:59:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m15-20020adffe4f000000b002bdd155ca4dsm19683640wrs.48.2023.01.19.06.59.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/11] tests/qtest/migration-test: Build command line using
 GString API (3/4)
Date: Thu, 19 Jan 2023 15:58:36 +0100
Message-Id: <20230119145838.41835-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Part 3/4: Convert accelerator options.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 8377b3976a..015b774a9e 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -603,6 +603,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     got_stop = false;
 
     cmd_common = g_string_new("");
+    g_string_append_printf(cmd_common, "-accel kvm%s ",
+                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
+    g_string_append(cmd_common, "-accel tcg ");
 
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -678,25 +681,21 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     if (!args->only_target) {
         g_autofree gchar *cmd_source = NULL;
 
-        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s "
+        cmd_source = g_strdup_printf("%s "
                                      "-name source,debug-threads=on "
                                      "-serial file:%s/src_serial "
                                      "%s %s %s",
-                                     args->use_dirty_ring ?
-                                     ",dirty-ring-size=4096" : "",
                                      cmd_common->str, tmpfs, arch_source,
                                      args->opts_source ? args->opts_source : "",
                                      ignore_stderr);
         *from = qtest_init(cmd_source);
     }
 
-    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s "
+    cmd_target = g_strdup_printf("%s "
                                  "-name target,debug-threads=on "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
                                  "%s %s %s",
-                                 args->use_dirty_ring ?
-                                 ",dirty-ring-size=4096" : "",
                                  cmd_common->str, tmpfs, uri, arch_target,
                                  args->opts_target ? args->opts_target : "",
                                  ignore_stderr);
-- 
2.38.1


