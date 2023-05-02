Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B66F4390
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:18:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptouw-0003mS-90; Tue, 02 May 2023 08:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouX-0003l2-EO
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouT-00030j-Jb
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso23955305e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029705; x=1685621705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DXsR1UscxMtpZ570/A4fEMiZ/DLR+BgQkSbWAKfxNxg=;
 b=ogb/XK5fB9789FgVvXER0Fm3HuemjyYRfyV40h6rn+kvLQeTE7UxAQ2EuayYYja2ov
 WTvN/8DHiAUWHFmycRw6hAWMFbCS4AjkgkeOh8aHRmVhrQtDhqD15nt5Tw7ker7tizxv
 WbYKlBzK1SK0kFdr3g1f8BjeItq3Gahve9EK0whJcn+5vkYAueLd/WcTijtBJT8MR2eQ
 IJ/+UltJ5717/OAuTWuUkPsE6cQAgvkZZtvB87oe5jdYUDPAVTA34dlSmW2yUiYITLOM
 +t+DKI/qiF/+psxu30hfZjDfhNlRJgl3PzSLGOuZvrcS3k0tMHfa4MgMReKWXjxs8fcP
 IqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029705; x=1685621705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXsR1UscxMtpZ570/A4fEMiZ/DLR+BgQkSbWAKfxNxg=;
 b=Ws91GmAuMWjSmrq79QtJtgdRX5zMcADrW1nIWwxMQzun2cgGkzYsQVz4LVY/9mslmF
 FfW4ZERRs2ivl46K+ocWnnsmp99Gu3uNv1E9bPoh7LCnIeqayRPdem8NpoFF3e0sJKIF
 EgzEE6db4J/Ba+oX2SR1p3DqLYlw07zH838v4HAke66aNt9gIuDVNGYJdB10Nis1ksoi
 4NY5prI6UmzLtdXQRsqUgT58+9/nPVWb75WCbyKGh7pULYQ5pNkKe50V00sxiiUIQS8L
 aTIsuYaydzcvp0hd50lR6SZ9PxDFl2eNTxxbj2KZL18lAToqLFF9xYx6V6s818mWoWBT
 I9rw==
X-Gm-Message-State: AC+VfDxORN8vft4Zs6aZp7FGPgMaxIr7vq7Ytt3LIVEXS4ydpEskmxoj
 euNE4+Fm3ocLl/Fcs1uZUz7IJSitKwTuKglVogo=
X-Google-Smtp-Source: ACHHUZ64BqcgvP6ULMGqktULlcFQnO+LzWoNcn+AzHK6B+2UkbyODx6c4c8QtAdMNikPrxZhO2SZXA==
X-Received: by 2002:a05:600c:acf:b0:3ed:4b0f:5378 with SMTP id
 c15-20020a05600c0acf00b003ed4b0f5378mr12595628wmr.27.1683029704917; 
 Tue, 02 May 2023 05:15:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/35] tests/qtest: Fix tests when no KVM or TCG are present
Date: Tue,  2 May 2023 13:14:32 +0100
Message-Id: <20230502121459.2422303-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

It is possible to have a build with both TCG and KVM disabled due to
Xen requiring the i386 and x86_64 binaries to be present in an aarch64
host.

If we build with --disable-tcg on the aarch64 host, we will end-up
with a QEMU binary (x86) that does not support TCG nor KVM.

Skip tests that crash or hang in the above scenario. Do not include
any test cases if TCG and KVM are missing.

Make sure that calls to qtest_has_accel are placed after g_test_init
in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
printed before other messages") to avoid TAP parsing errors.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230426180013.14814-9-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test.c | 11 +++++++++--
 tests/qtest/boot-serial-test.c |  5 +++++
 tests/qtest/migration-test.c   |  9 ++++++++-
 tests/qtest/pxe-test.c         |  8 +++++++-
 tests/qtest/vmgenid-test.c     |  9 +++++++--
 5 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 464f87382e2..7fd88b0e9c7 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2045,8 +2045,7 @@ static void test_acpi_virt_oem_fields(void)
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
-    const bool has_kvm = qtest_has_accel("kvm");
-    const bool has_tcg = qtest_has_accel("tcg");
+    bool has_kvm, has_tcg;
     char *v_env = getenv("V");
     int ret;
 
@@ -2056,6 +2055,14 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         ret = boot_sector_init(disk);
         if (ret) {
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3aef3a97a99..6dd06aeaf47 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -287,6 +287,11 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     for (i = 0; tests[i].arch != NULL; i++) {
         if (g_str_equal(arch, tests[i].arch) &&
             qtest_has_machine(tests[i].machine)) {
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 60dd53d3ec6..be73ec3c06c 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2477,7 +2477,7 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    bool has_kvm;
+    bool has_kvm, has_tcg;
     bool has_uffd;
     const char *arch;
     g_autoptr(GError) err = NULL;
@@ -2486,6 +2486,13 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     has_uffd = ufd_version_check();
     arch = qtest_get_arch();
 
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index 62b6eef4649..e4b48225a5a 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -131,11 +131,17 @@ int main(int argc, char *argv[])
     int ret;
     const char *arch = qtest_get_arch();
 
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     ret = boot_sector_init(disk);
     if(ret)
         return ret;
 
-    g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         test_batch(x86_tests, false);
diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
index efba76e7164..324db08c7ab 100644
--- a/tests/qtest/vmgenid-test.c
+++ b/tests/qtest/vmgenid-test.c
@@ -165,13 +165,18 @@ int main(int argc, char **argv)
 {
     int ret;
 
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     ret = boot_sector_init(disk);
     if (ret) {
         return ret;
     }
 
-    g_test_init(&argc, &argv, NULL);
-
     qtest_add_func("/vmgenid/vmgenid/set-guid",
                    vmgenid_set_guid_test);
     qtest_add_func("/vmgenid/vmgenid/set-guid-auto",
-- 
2.34.1


