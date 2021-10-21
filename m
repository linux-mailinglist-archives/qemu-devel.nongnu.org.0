Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829AC435A0E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:38:02 +0200 (CEST)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPq5-0005Kj-K7
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZU-0005WZ-9x; Thu, 21 Oct 2021 00:20:54 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZQ-0008EQ-6n; Thu, 21 Oct 2021 00:20:52 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p40n1z4xdG; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=XIFG7RTmGkrXR8UqPAoN716vrZqlFqwHCd/RBErCBBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PteX8SRl7JaSpHoj3NN9lXpOzEsAtiLY2+XjlaaEXiCZnOkh/GspnX63RPhhtvo6N
 OPUGuSUi2byQrtZPPET+MmSmtep7CWoS7QMTcCoAPjitGBeSaD42+nhFaRsE2aagW3
 T79BgzGaN50OWfi27CATFxZiwCGbM8bFUVAK14Yk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 08/25] tests/acceptance: Add tests for the ppc405 boards
Date: Thu, 21 Oct 2021 15:20:10 +1100
Message-Id: <20211021042027.345405-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Using the U-Boot firmware, we can check that at least the serial console
of the ppc405 boards is still usable.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211011125930.750217-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[dwg: Added an extra tag at Philippe's suggestion]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/acceptance/ppc_405.py | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 tests/acceptance/ppc_405.py

diff --git a/tests/acceptance/ppc_405.py b/tests/acceptance/ppc_405.py
new file mode 100644
index 0000000000..c534d5d32f
--- /dev/null
+++ b/tests/acceptance/ppc_405.py
@@ -0,0 +1,42 @@
+# Test that the U-Boot firmware boots on ppc 405 machines and check the console
+#
+# Copyright (c) 2021 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado.utils import archive
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+class Ppc405Machine(Test):
+
+    timeout = 90
+
+    def do_test_ppc405(self):
+        uboot_url = ('https://gitlab.com/huth/u-boot/-/raw/'
+                     'taihu-2021-10-09/u-boot-taihu.bin')
+        uboot_hash = ('3208940e908a5edc7c03eab072c60f0dcfadc2ab');
+        file_path = self.fetch_asset(uboot_url, asset_hash=uboot_hash)
+        self.vm.set_console(console_index=1)
+        self.vm.add_args('-bios', file_path)
+        self.vm.launch()
+        wait_for_console_pattern(self, 'AMCC PPC405EP Evaluation Board')
+        exec_command_and_wait_for_pattern(self, 'reset', 'AMCC PowerPC 405EP')
+
+    def test_ppc_taihu(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:taihu
+        :avocado: tags=cpu:405ep
+        """
+        self.do_test_ppc405()
+
+    def test_ppc_ref405ep(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:ref405ep
+        :avocado: tags=cpu:405ep
+        """
+        self.do_test_ppc405()
-- 
2.31.1


