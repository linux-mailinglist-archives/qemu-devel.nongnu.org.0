Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9ED435A3B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 07:14:44 +0200 (CEST)
Received: from localhost ([::1]:44648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdQPb-0006VI-3C
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 01:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZZ-0005go-BA; Thu, 21 Oct 2021 00:20:57 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZW-0000Ld-On; Thu, 21 Oct 2021 00:20:57 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p5YtSz4xdT; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=5U4wFjBv8JJsuvs2bK3ktaoR98BIdxGtkG0+CCwAH4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HqnNZbMYxQX0mbh00KzDhO/gwGEfK3sQt3R08qMfJ7cvh0gnduHRXk+OiKB4tHLHG
 +kZpEkwQqsCav8SGT2lL58dtapP2zXk+AWY/rmR/xWqs35U7tdyTSa8hfZTlz7MNOT
 IW4Mvbfjff/lapoK2XHDqIIfj+VUBcZpNUa7XTkY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 19/25] tests/acceptance: Add a test for the bamboo ppc board
Date: Thu, 21 Oct 2021 15:20:21 +1100
Message-Id: <20211021042027.345405-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The kernel and initrd from the "Aboriginal Linux" project can be
used to run some tests on the bamboo ppc machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211015090008.1299609-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 MAINTAINERS                    |  1 +
 tests/acceptance/ppc_bamboo.py | 39 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 tests/acceptance/ppc_bamboo.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e9f489a41..4e77d03651 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1245,6 +1245,7 @@ Bamboo
 L: qemu-ppc@nongnu.org
 S: Orphan
 F: hw/ppc/ppc440_bamboo.c
+F: tests/acceptance/ppc_bamboo.py
 
 e500
 L: qemu-ppc@nongnu.org
diff --git a/tests/acceptance/ppc_bamboo.py b/tests/acceptance/ppc_bamboo.py
new file mode 100644
index 0000000000..dd33bf66f3
--- /dev/null
+++ b/tests/acceptance/ppc_bamboo.py
@@ -0,0 +1,39 @@
+# Test that Linux kernel boots on the ppc bamboo board and check the console
+#
+# Copyright (c) 2021 Red Hat
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado.utils import archive
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+class BambooMachine(Test):
+
+    timeout = 90
+
+    def test_ppc_bamboo(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:bamboo
+        :avocado: tags=cpu:440epb
+        :avocado: tags=device:rtl8139
+        """
+        tar_url = ('http://landley.net/aboriginal/downloads/binaries/'
+                   'system-image-powerpc-440fp.tar.gz')
+        tar_hash = '53e5f16414b195b82d2c70272f81c2eedb39bad9'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir +
+                                   '/system-image-powerpc-440fp/linux',
+                         '-initrd', self.workdir +
+                                   '/system-image-powerpc-440fp/rootfs.cpio.gz',
+                         '-nic', 'user,model=rtl8139,restrict=on')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Type exit when done')
+        exec_command_and_wait_for_pattern(self, 'ping 10.0.2.2',
+                                          '10.0.2.2 is alive!')
+        exec_command_and_wait_for_pattern(self, 'halt', 'System Halted')
-- 
2.31.1


