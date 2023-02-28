Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43396A5FA6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:30:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5f0-0002b0-RM; Tue, 28 Feb 2023 14:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pX5ew-0002Tn-GW; Tue, 28 Feb 2023 14:29:10 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pX5eu-0007Zk-Nh; Tue, 28 Feb 2023 14:29:10 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4EBB91FDEF;
 Tue, 28 Feb 2023 19:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677612547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
 b=MmI+AY9VDxZ6HRaquiMo1c9BiUqGUyX1/xOVubGxdfpXHbTbfPtzstZhpT8ozG5oUAJMYa
 nNU/epdC9iKrqbZraQnd1rODT+Rue3PDFWwzC0ksyYOmXvMTb8JZ7HjBCKdEwwYQsk8W16
 whYcIN/dZoNHtkJKU8Zi1w0tWYv8xAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677612547;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
 b=4jsoDVNmNAhzQlQoGcwt/2F5hTZQGNsn505ZYYON9ASM9x6HF5L75J+fLso5TJSCFcaety
 kUhamn91KDUJHUBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7C661333C;
 Tue, 28 Feb 2023 19:29:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GGeQJ/5V/mNBagAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 28 Feb 2023 19:29:02 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG are
 present
Date: Tue, 28 Feb 2023 16:26:28 -0300
Message-Id: <20230228192628.26140-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230228192628.26140-1-farosas@suse.de>
References: <20230228192628.26140-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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

Fix tests that crash or hang in the above scenario. Do not include any
test cases if TCG and KVM are missing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
This currently affects Arm, but will also affect x86 after the xenpvh
series gets merged. This patch fixes both scenarios.
---
 tests/qtest/bios-tables-test.c |  4 ++++
 tests/qtest/boot-serial-test.c | 10 ++++++++++
 tests/qtest/migration-test.c   |  5 +++++
 tests/qtest/pxe-test.c         |  6 ++++++
 tests/qtest/vmgenid-test.c     |  6 ++++++
 5 files changed, 31 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d29a4e47af..f6c2a010d2 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2114,6 +2114,10 @@ int main(int argc, char *argv[])
     char *v_env = getenv("V");
     int ret;
 
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
+
     if (v_env) {
         verbosity_level = atoi(v_env);
     }
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3aef3a97a9..45490f5931 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -17,6 +17,9 @@
 #include "libqtest.h"
 #include "libqos/libqos-spapr.h"
 
+static bool has_tcg;
+static bool has_kvm;
+
 static const uint8_t bios_avr[] = {
     0x88, 0xe0,             /* ldi r24, 0x08   */
     0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
@@ -285,6 +288,13 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     int i;
 
+    has_tcg = qtest_has_accel("tcg");
+    has_kvm = qtest_has_accel("kvm");
+
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     for (i = 0; tests[i].arch != NULL; i++) {
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 109bc8e7b1..a6e3ca9f7d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2460,11 +2460,16 @@ static bool kvm_dirty_ring_supported(void)
 int main(int argc, char **argv)
 {
     const bool has_kvm = qtest_has_accel("kvm");
+    const bool has_tcg = qtest_has_accel("tcg");
     const bool has_uffd = ufd_version_check();
     const char *arch = qtest_get_arch();
     g_autoptr(GError) err = NULL;
     int ret;
 
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     /*
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index 62b6eef464..05575f7687 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -130,6 +130,12 @@ int main(int argc, char *argv[])
 {
     int ret;
     const char *arch = qtest_get_arch();
+    bool has_tcg = qtest_has_accel("tcg");
+    bool has_kvm = qtest_has_accel("kvm");
+
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
 
     ret = boot_sector_init(disk);
     if(ret)
diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
index efba76e716..8045d3d706 100644
--- a/tests/qtest/vmgenid-test.c
+++ b/tests/qtest/vmgenid-test.c
@@ -164,6 +164,12 @@ static void vmgenid_query_monitor_test(void)
 int main(int argc, char **argv)
 {
     int ret;
+    bool has_tcg = qtest_has_accel("tcg");
+    bool has_kvm = qtest_has_accel("kvm");
+
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
 
     ret = boot_sector_init(disk);
     if (ret) {
-- 
2.35.3


