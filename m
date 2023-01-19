Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB49A673CF0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:00:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWOJ-0008UJ-M0; Thu, 19 Jan 2023 09:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWOI-0008Rz-B7
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:46 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWOG-0003gq-Oz
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:46 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so3765045wmb.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDyw5jGUguYP19whij1cKtwFdUxKXvk9EDw1Rxg7JLU=;
 b=zx625sjetE/+G4xs3sYp9MwIfdMcxC1aARl39RwoEN/uciBhGKTKsV4TY2RJUDwmJD
 J5ON7BC6hSt7aZPX9qDrs2R+uCHOzGiSbourlj1maxlOE8iAdufYGeYAevZIauAuluRO
 7c4AlzQ1BDuQM+XAe9FY8wIqkcYFuQ92J5hBs7uP5+wiryzn2tkIc8BTeTnPClelUQ7Q
 /RsUkV0shJfRgwt7Cv90YT1WSTUWz+36/ZvdDsBQzueAU6PXwoutYk7DQ2D8kMwm3k93
 Y89th4YaXUKSr2jJ/eEpHwneNRbJgsfeiUoEDfNfXNVewzQM8EyqTwjnIAPI55876nlD
 W9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rDyw5jGUguYP19whij1cKtwFdUxKXvk9EDw1Rxg7JLU=;
 b=lPgGbt0AmRzuJmg2Q791y7C/ga+tLt/Ow5UDAzgy99wSgE4Y1u1LXCHIdWRrxKMxRI
 EXImdPUQnvMlb3HDfnvX1ddV2xCI+3khxTi+9IszlpM7Ps3gCV0vkCD+LqLIXcjTgVDi
 zVmbMsJGKyFYsSt4nzDXmMHVqRPWgNJKlMqQLFbZTTOv1z3hQtxz9a+Pojh2HJFFkkXE
 +2P9YD1YdRb2i6E564MVYXlWWy62KnokiYByorg8EqjnYTv9dEtruP6pSwHnMiwNjmaJ
 V54vH+fXH16/e1OP3DGK2SPnN2kmjbMMmvylG0fNVynTlBor3iedToNv3wvSD27x0rTH
 jNdQ==
X-Gm-Message-State: AFqh2koEeV6HKY4hBv77RZkXTd1C3pbcRj2Er8V1AmBnj4a5H8S6sSwx
 oD6wOfx3TDou/LAxXEyJI06WO0J6ymaEJBLE
X-Google-Smtp-Source: AMrXdXv0R3n3GgLn24lVMTNw7kWQuT5RfE68qXS34BAlrF1fYBAO6FImyNc3NpZ/4ACm5nmao7FE5A==
X-Received: by 2002:a05:600c:3b13:b0:3db:26b8:5023 with SMTP id
 m19-20020a05600c3b1300b003db26b85023mr1648284wms.10.1674140383093; 
 Thu, 19 Jan 2023 06:59:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003daf6e3bc2fsm7009111wmq.1.2023.01.19.06.59.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/11] tests/qtest/migration-test: Only use available
 accelerators
Date: Thu, 19 Jan 2023 15:58:38 +0100
Message-Id: <20230119145838.41835-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

For example, avoid when TCG is disabled:

  $ make check-qtest-aarch64
  ...
  20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
  qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index a930964268..17783d7334 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -45,6 +45,8 @@
 
 unsigned start_address;
 unsigned end_address;
+static bool has_tcg;
+static bool has_kvm;
 static bool uffd_feature_thread_id;
 
 /*
@@ -603,9 +605,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     got_stop = false;
 
     cmd_common = g_string_new("");
-    g_string_append_printf(cmd_common, "-accel kvm%s ",
-                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
-    g_string_append(cmd_common, "-accel tcg ");
+    if (has_kvm) { /* KVM first */
+        g_string_append_printf(cmd_common, "-accel kvm%s ",
+                               args->use_dirty_ring
+                               ? ",dirty-ring-size=4096" : "");
+    }
+    if (has_tcg) {
+        g_string_append(cmd_common, "-accel tcg ");
+    }
 
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -2457,12 +2464,14 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    const bool has_kvm = qtest_has_accel("kvm");
     const bool has_uffd = ufd_version_check();
     const char *arch = qtest_get_arch();
     g_autoptr(GError) err = NULL;
     int ret;
 
+    has_tcg = qtest_has_accel("tcg");
+    has_kvm = qtest_has_accel("kvm");
+
     g_test_init(&argc, &argv, NULL);
 
     /*
-- 
2.38.1


