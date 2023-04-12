Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62A56DF4EE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:20:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZRw-0003TR-Fx; Wed, 12 Apr 2023 08:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pmZRL-0002nG-7T; Wed, 12 Apr 2023 08:19:08 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pmZRI-0001ES-59; Wed, 12 Apr 2023 08:19:06 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A00C1F891;
 Wed, 12 Apr 2023 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681301942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fd8TZ6HWDdVDQ805ayW8GaMGbGtR9iHco7DFaEXSKjw=;
 b=Y+sNUDcsv8xBnF/31A+EGRdMLsDxQcH1fY54O0Ietvxzu38OnRor6ahcMxiwLZ4adTQCGL
 IKufUikTEMZHwTlT2CYZSYbJ2Pkn7mbeFGo2G5lqgtkNbsoncxGv+cBZZcv3ckrYX0lq/o
 DZ0Tg7nISCVWg/gJuaJh53BVW1paq4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681301942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fd8TZ6HWDdVDQ805ayW8GaMGbGtR9iHco7DFaEXSKjw=;
 b=4lrXhHQjf88mHU4ioeJusQIjjR1kuif6ZL6HPE7oRpRh1cDbp0a+CAvcwdsjWOry8vJES0
 4wSI8nt9MSVJB2Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 294E3132C7;
 Wed, 12 Apr 2023 12:18:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EDv6N7GhNmSMUgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:18:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v10 07/11] tests/qtest: Fix tests when no KVM or TCG are
 present
Date: Wed, 12 Apr 2023 09:18:25 -0300
Message-Id: <20230412121829.14452-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230412121829.14452-1-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/bios-tables-test.c | 11 +++++++++--
 tests/qtest/boot-serial-test.c |  5 +++++
 tests/qtest/migration-test.c   |  9 ++++++++-
 tests/qtest/pxe-test.c         |  8 +++++++-
 tests/qtest/vmgenid-test.c     |  9 +++++++--
 5 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 8733589437..9c3642717d 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2082,8 +2082,7 @@ static void test_acpi_virt_oem_fields(void)
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
-    const bool has_kvm = qtest_has_accel("kvm");
-    const bool has_tcg = qtest_has_accel("tcg");
+    bool has_kvm, has_tcg;
     char *v_env = getenv("V");
     int ret;
 
@@ -2093,6 +2092,14 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        g_test_skip("No accelerator available");
+        return 0;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         ret = boot_sector_init(disk);
         if (ret) {
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3aef3a97a9..28bab3d5e4 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -287,6 +287,11 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No accelerator available");
+        return 0;
+    }
+
     for (i = 0; tests[i].arch != NULL; i++) {
         if (g_str_equal(arch, tests[i].arch) &&
             qtest_has_machine(tests[i].machine)) {
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3b615b0da9..24deb2d432 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2462,7 +2462,7 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    bool has_kvm;
+    bool has_kvm, has_tcg;
     bool has_uffd;
     const char *arch;
     g_autoptr(GError) err = NULL;
@@ -2471,6 +2471,13 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        g_test_skip("No accelerator available");
+        return 0;
+    }
+
     has_uffd = ufd_version_check();
     arch = qtest_get_arch();
 
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index 62b6eef464..5813adcf56 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -131,11 +131,17 @@ int main(int argc, char *argv[])
     int ret;
     const char *arch = qtest_get_arch();
 
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No accelerator available");
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
index efba76e716..a597cde707 100644
--- a/tests/qtest/vmgenid-test.c
+++ b/tests/qtest/vmgenid-test.c
@@ -165,13 +165,18 @@ int main(int argc, char **argv)
 {
     int ret;
 
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No accelerator available");
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
2.35.3


