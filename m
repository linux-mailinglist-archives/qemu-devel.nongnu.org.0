Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C24344767
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:35:44 +0100 (CET)
Received: from localhost ([::1]:57328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLef-0008OO-Lr
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL93-0005U9-4k
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:03:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:44752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL8y-0005Jo-Rz
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:03:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1EB4ADE3;
 Mon, 22 Mar 2021 14:02:23 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v10 31/49] tests/qtest: skip bios-tables-test
 test_acpi_oem_fields_virt for KVM
Date: Mon, 22 Mar 2021 15:01:48 +0100
Message-Id: <20210322140206.9513-32-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322140206.9513-1-cfontana@suse.de>
References: <20210322140206.9513-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

test is TCG-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/bios-tables-test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e020c83d2a..bd7b85909c 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1488,6 +1488,13 @@ static void test_acpi_oem_fields_virt(void)
     };
     char *args;
 
+#ifndef CONFIG_TCG
+    if (data.tcg_only) {
+        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
+        return;
+    }
+#endif /* CONFIG_TCG */
+
     args = test_acpi_create_args(&data,
                                  "-cpu cortex-a57 "OEM_TEST_ARGS, true);
     data.qts = qtest_init(args);
-- 
2.26.2


