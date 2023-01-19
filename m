Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518DA673526
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:10:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRox-0004eY-2n; Thu, 19 Jan 2023 05:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoA-0003yQ-EB
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:14 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRo9-0005Ft-0Z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:06:10 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so3215689wmb.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/ZoZ3vSZS/no0sJwRkQRJxBLgmqJ91b3o5SbJuNG6I=;
 b=I/zNVKPICwtzwqbpDGV1B4kzWefhxbEpoCNtzxkIxA5cGDN2AcmJobMvQzFCeZ6d+S
 kqwlRbQml0WiFpSjoLbQw6UvT3H6Kjgq66hf06rREWwqYYfZJfag1umA7lnyVg61vADK
 nbWFT87y9LAr7TtDNYIWciw9wvu+uJ6/8ql1hKCBOOy27NbCFDArJxfs8So7HuOk5vWa
 Yz9oGef3yP3o7LQrITMDZGdFykSoizpBx84X9pBX1cfP3dPuWC8AACjw5ixsdFH4+zc5
 pX6jQa8yaz6qlgMDe1KN57vC1XSYML/0VadAnufqWV1bEIs3WhJihkNfgtr3x9ywWfyE
 vYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/ZoZ3vSZS/no0sJwRkQRJxBLgmqJ91b3o5SbJuNG6I=;
 b=ONqAiNBhwySxr/Zvjva3Pl50kguPbKOLYhr7AjuV79/fbvBA+DBycKaZI/FKRH/Cuu
 NekPKtgeTCn0pG9yLG34+bcc0TxNoztXK1Vy5jotnUuFpcxqyn4rEEfgl/7sqv8C1jKS
 nGvsT93IcezhY2IBsYL2Nvgn7AleMNp61ac2O98QoE2uITguqkfTj3zy5Xi9nsGX5q0B
 CwcMlU3a9S8rp2FYr/OTu8RBaRkK6lvyU80ohuIwQe2n5K3SGKf9z54LxVEF3aAjMFu2
 ax3QBQQnYM7fBGqlm2eAtiZ/XcudyX3ipwiP4KUjM+LA2E2fJihfSDwBK6k+MxxoGyw6
 bHSQ==
X-Gm-Message-State: AFqh2kolQOptuTuPdrgnVWQM+GEqcCcpjptFRuIL3SS9Q2sIGuf1XJyy
 SUhWQZma23wuOw/ocRtZNTLp0Y1GgofJON1V
X-Google-Smtp-Source: AMrXdXssCz5FsJW9W1KRztsJIfhT6t85usxbPDDPQtbCwJt9S3dPPCmnVTFXdIEi8H+Hpo6RQAFPJw==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:674a:aefe with SMTP id
 ay29-20020a05600c1e1d00b003cf674aaefemr9723896wmb.22.1674122764506; 
 Thu, 19 Jan 2023 02:06:04 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c511600b003d9780466b0sm4820762wms.31.2023.01.19.02.06.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:06:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/8] tests/qtest/migration-test: Only use available
 accelerators
Date: Thu, 19 Jan 2023 11:05:34 +0100
Message-Id: <20230119100537.5114-6-philmd@linaro.org>
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

For example, avoid when TCG is disabled:

  $ make check-qtest-aarch64
  ...
  20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
  qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 36e6074653..1e7f1ea162 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -45,6 +45,8 @@
 
 unsigned start_address;
 unsigned end_address;
+static bool has_tcg;
+static bool has_kvm;
 static bool uffd_feature_thread_id;
 
 /*
@@ -604,9 +606,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     got_stop = false;
 
     cmd_common = g_string_new("");
-    g_string_append(cmd_common, "-accel tcg ");
-    g_string_append_printf(cmd_common, "-accel kvm%s ",
-                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
+    if (has_tcg) {
+        g_string_append(cmd_common, "-accel tcg ");
+    }
+    if (has_kvm) {
+        g_string_append_printf(cmd_common, "-accel kvm%s ",
+                               args->use_dirty_ring
+                               ? ",dirty-ring-size=4096" : "");
+    }
 
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -2458,12 +2465,14 @@ static bool kvm_dirty_ring_supported(void)
 
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


