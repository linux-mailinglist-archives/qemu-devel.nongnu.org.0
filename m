Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961E328C441
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 23:47:04 +0200 (CEST)
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS5ep-00028N-6d
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 17:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kS5dP-0001KS-8J
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 17:45:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:47946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kS5dN-0003J3-4T
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 17:45:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 269ABAC8C;
 Mon, 12 Oct 2020 21:45:31 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 2/3] qtest: unbreak non-TCG builds in bios-tables-test
Date: Mon, 12 Oct 2020 23:45:26 +0200
Message-Id: <20201012214527.1780-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012214527.1780-1-cfontana@suse.de>
References: <20201012214527.1780-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 01:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the tests assume TCG is available, thus breaking
for TCG-only tests, where only the TCG accelerator option
is passed to the QEMU binary.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 tests/qtest/bios-tables-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e15f36c8c7..e783da54ba 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -122,6 +122,9 @@ static void free_test_data(test_data *data)
 {
     int i;
 
+    if (!data->tables) {
+        return;
+    }
     for (i = 0; i < data->tables->len; ++i) {
         cleanup_table_descriptor(&g_array_index(data->tables, AcpiSdtTable, i));
     }
@@ -651,6 +654,13 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
+#ifndef CONFIG_TCG
+    if (data->tcg_only) {
+        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
+        return;
+    }
+#endif /* CONFIG_TCG */
+
     if (use_uefi) {
         /*
          * TODO: convert '-drive if=pflash' to new syntax (see e33763be7cd3)
-- 
2.26.2


