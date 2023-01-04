Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D968C65E045
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:54:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBro-0007Sk-Q0; Wed, 04 Jan 2023 17:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDBpx-0006J7-H2; Wed, 04 Jan 2023 17:02:21 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDBpp-0003IY-RP; Wed, 04 Jan 2023 17:02:14 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A97073F17A;
 Wed,  4 Jan 2023 22:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672869722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0zsUVLNnlB8or8gHrZOqCwKbl6RppYxTr0hODbbSNU=;
 b=gCljilCnnj99P4fzrDxwcyX3/qg9PYnLZZy+HirV1Y5DpE7NQesnoW4w6y/V7Y6vonN49y
 iqCKLEvfLkOIemHvwOUVYcvA4Erc9ynIJIdrEnq2S/eMrMiA6iEBcrTpTuoCyfITZkhCm0
 nMiM2ugL+sXXmNbVzueTYjqkxFH5s64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672869722;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0zsUVLNnlB8or8gHrZOqCwKbl6RppYxTr0hODbbSNU=;
 b=MB/bTdWNZBQXazEv3/MRrqbX/cYQ6l5E106lg76WqfLT9mWqHN7EaV6p8/xMq2Lr6BURl+
 7c2H8LYgKOssITCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 889D61342C;
 Wed,  4 Jan 2023 22:01:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6KMUFFf3tWPwJAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:59 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH 25/27] tests: device-introspect-test: cope with ARM
 TCG-only devices
Date: Wed,  4 Jan 2023 18:58:33 -0300
Message-Id: <20230104215835.24692-26-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Claudio Fontana <cfontana@suse.de>

Skip the test_device_intro_concrete for now for ARM KVM-only build,
as on ARM we currently build devices for ARM that are not
compatible with a KVM-only build.

We can remove this workaround when we fix this in KConfig etc,
and we only list and build machines that are compatible with KVM
for KVM-only builds.

Alternative implementation provided by Alex.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/device-introspect-test.c | 32 +++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
index 5b0ffe43f5..f89df87f74 100644
--- a/tests/qtest/device-introspect-test.c
+++ b/tests/qtest/device-introspect-test.c
@@ -304,6 +304,24 @@ static void test_abstract_interfaces(void)
     qtest_quit(qts);
 }
 
+/*
+ * XXX currently we build also boards for ARM that are incompatible with KVM.
+ * We therefore need to check this explicitly, and only test virt for kvm-only
+ * arm builds.
+ * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
+ * are built for the kvm-only build, we could remove this.
+ */
+static bool skip_machine_tests(void)
+{
+#ifndef CONFIG_TCG
+    const char *arch = qtest_get_arch();
+    if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
+        return true;
+    }
+#endif /* !CONFIG_TCG */
+    return false;
+}
+
 static void add_machine_test_case(const char *mname)
 {
     char *path, *args;
@@ -328,11 +346,15 @@ int main(int argc, char **argv)
     qtest_add_func("device/introspect/none", test_device_intro_none);
     qtest_add_func("device/introspect/abstract", test_device_intro_abstract);
     qtest_add_func("device/introspect/abstract-interfaces", test_abstract_interfaces);
-    if (g_test_quick()) {
-        qtest_add_data_func("device/introspect/concrete/defaults/none",
-                            g_strdup(common_args), test_device_intro_concrete);
-    } else {
-        qtest_cb_for_every_machine(add_machine_test_case, true);
+
+    if (!skip_machine_tests()) {
+        if (g_test_quick()) {
+            qtest_add_data_func("device/introspect/concrete/defaults/none",
+                                g_strdup(common_args),
+                                test_device_intro_concrete);
+        } else {
+            qtest_cb_for_every_machine(add_machine_test_case, true);
+        }
     }
 
     return g_test_run();
-- 
2.35.3


