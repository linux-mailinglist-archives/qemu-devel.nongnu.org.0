Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD03A3464D1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:20:07 +0100 (CET)
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjlG-0001PL-QI
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjGB-0007Oa-NE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:47:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:54850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOjFj-0000uZ-Tr
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:47:59 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00EE2AF4E;
 Tue, 23 Mar 2021 15:47:01 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v11 38/55] tests: device-introspect-test: cope with ARM TCG-only
 devices
Date: Tue, 23 Mar 2021 16:46:22 +0100
Message-Id: <20210323154639.23477-31-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323151749.21299-1-cfontana@suse.de>
References: <20210323151749.21299-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Skip the test_device_intro_concrete for now for ARM KVM-only build,
as on ARM we currently build devices for ARM that are not
compatible with a KVM-only build.

We can remove this workaround when we fix this in KConfig etc,
and we only list and build machines that are compatible with KVM
for KVM-only builds.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/device-introspect-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
index bbec166dbc..1ff15e2247 100644
--- a/tests/qtest/device-introspect-test.c
+++ b/tests/qtest/device-introspect-test.c
@@ -329,12 +329,30 @@ int main(int argc, char **argv)
     qtest_add_func("device/introspect/none", test_device_intro_none);
     qtest_add_func("device/introspect/abstract", test_device_intro_abstract);
     qtest_add_func("device/introspect/abstract-interfaces", test_abstract_interfaces);
+
+    /*
+     * XXX currently we build also boards for ARM that are incompatible with KVM.
+     * We therefore need to check this explicitly, and only test virt for kvm-only
+     * arm builds.
+     * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
+     * are built for the kvm-only build, we could remove this.
+     */
+#ifndef CONFIG_TCG
+    {
+        const char *arch = qtest_get_arch();
+        if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
+            goto add_machine_test_done;
+        }
+    }
+#endif /* !CONFIG_TCG */
     if (g_test_quick()) {
         qtest_add_data_func("device/introspect/concrete/defaults/none",
                             g_strdup(common_args), test_device_intro_concrete);
     } else {
         qtest_cb_for_every_machine(add_machine_test_case, true);
     }
+    goto add_machine_test_done;
 
+ add_machine_test_done:
     return g_test_run();
 }
-- 
2.26.2


