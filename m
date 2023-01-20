Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48A1674F66
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:25:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImhg-0005Yc-If; Fri, 20 Jan 2023 03:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhY-0005T0-85
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:45 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhV-0004h8-GH
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:43 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so3068174wms.2
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZIdBPotAEeCeaU6kILE+ldJwz4Si4KaekjZjTSfk694=;
 b=sHvxXtKKINDL5U6Fdhmg7M/qsjYAQGf7jqQBR9ve+9ggFVkRejHOhRUwvWa1s0Q5fx
 +g8BJsZ3n/aQOGSDk3KKxYaov7iqSrSb5nHxix93hueSgapMFY7RArUk2lMxlJQ+azAg
 nggVngL6RMipESmiyLR3BmJ7CYRz5qOZZiGcIE0DIPUvQUDHdIb9QyWPJdURibsk+hOI
 SJmGbuLeJTfg2gmxWxlnqiqd81UcfV3aFXKvHb6qA+/xgQHPoZTlW5JQ9pnNldiawUIL
 4fPBBInWldoqtoBuvL9DvmCgRTP4Pr+YXuymCBo8ls95IoW6MYwjDdgq2BG9nnSo+O4y
 SZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZIdBPotAEeCeaU6kILE+ldJwz4Si4KaekjZjTSfk694=;
 b=t802sdBiMr7MXHbYDaiTgCuhJPYg2ZB0e3oXHG5vEAK/xCUcrg+G8tvLpQ4fo4T7D3
 I6w4k8iO8+41cwgFezGhxJY+N/U7ln5P1PrvySMla1/1hF+qh6aYoZjK9HoRHIH+DURt
 Fu4Fd9BWAVwOWxYPz4GWMXbn+txSvSSBhT7OkYn7SxJI1OJWtLXJ13nhp8QmleynuJyI
 QbRaCp9SMip8ICLBbs9EHTFg7o2vGxPk5Tu6+DGubNPYmK3dY7rb0XN57G3PpL3FC1O3
 MuUAu465l97/KnOXcOrXthBv2YKIatlYQwXHkrsg2ZR7VB9WFAKiUVITvUaiR2ZrZcsv
 b65A==
X-Gm-Message-State: AFqh2krwqc1Pf7Bhr9scimFPXouVjzqaLqg6WT9by9D9rloVEM2H0YZK
 mzCIQHAmhLydoPTUz8ICjauOXO5fpwerp0cx
X-Google-Smtp-Source: AMrXdXutn9acx2Abb9jKlleMzX/a7PqpWRWGDL6NBeEQvyMICa5w6TtgvWFAZ/57QMT2yWaZXOy6sA==
X-Received: by 2002:a05:600c:a29e:b0:3d9:ee01:ae5b with SMTP id
 hu30-20020a05600ca29e00b003d9ee01ae5bmr13156308wmb.12.1674203078971; 
 Fri, 20 Jan 2023 00:24:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o28-20020a05600c511c00b003dab40f9eafsm1611013wms.35.2023.01.20.00.24.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 11/11] tests/qtest/migration-test: Only use available
 accelerators
Date: Fri, 20 Jan 2023 09:23:41 +0100
Message-Id: <20230120082341.59913-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/migration-test.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index e7786bcbc5..b0eaddbf5a 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -45,6 +45,8 @@
 
 unsigned start_address;
 unsigned end_address;
+static bool has_tcg;
+static bool has_kvm;
 static bool uffd_feature_thread_id;
 
 /*
@@ -603,13 +605,16 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     got_stop = false;
 
     cmd_common = g_string_new("");
-    /* KVM first */
-    if (args->use_dirty_ring) {
-        g_string_append(cmd_common, "-accel kvm,dirty-ring-size=4096 ");
-    } else {
-        g_string_append(cmd_common, "-accel kvm ");
+    if (has_kvm) { /* KVM first */
+        if (args->use_dirty_ring) {
+            g_string_append(cmd_common, "-accel kvm,dirty-ring-size=4096 ");
+        } else {
+            g_string_append(cmd_common, "-accel kvm ");
+        }
+    }
+    if (has_tcg) {
+        g_string_append(cmd_common, "-accel tcg ");
     }
-    g_string_append(cmd_common, "-accel tcg ");
 
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -2460,12 +2465,14 @@ static bool kvm_dirty_ring_supported(void)
 
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


