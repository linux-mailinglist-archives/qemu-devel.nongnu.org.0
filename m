Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9F24A187
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 16:18:03 +0200 (CEST)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Oug-0004On-Ue
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 10:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1k8Ot3-0003bT-Dq
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:16:21 -0400
Received: from mail-m975.mail.163.com ([123.126.97.5]:59168)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1k8Osv-0007Cb-4J
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=ok/hO3SbP+jaUNCSRn
 1mQzSYkyRJ4LXyqYAyM5lI3zY=; b=m4er1UioAt2XSprXluhFx1WUuG8satenW0
 68DLQWLPJ2JwyGmKfqacEA1tldivGe1tbkMdzfOcYfXCDzOUpU0JZo1haeN0HFc7
 RDqyrphxFSDsHhUYJdbjyE1o9kNrcMWYXOpmR0rJMeyYOrDSYvGadkk67Ip3emu6
 cNpnaZPZM=
Received: from localhost.localdomain (unknown [60.177.59.214])
 by smtp5 (Coremail) with SMTP id HdxpCgDXn7oKND1f775JEQ--.195S4;
 Wed, 19 Aug 2020 22:15:42 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com, alxndr@bu.edu
Subject: [PATCH] qtest: add fuzz test case
Date: Wed, 19 Aug 2020 07:15:33 -0700
Message-Id: <20200819141533.66354-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: HdxpCgDXn7oKND1f775JEQ--.195S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrWxGFyruF45Aw1ruw18Grg_yoW5tF4kpF
 yqkwnYkrn7A3W7XrWfGF12qr15Ar4fAF4DGFZ7Jr1UuF40kay7GFn7KrWjqrn3G3yIv3yj
 93WktF1agFyrtaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joyx_UUUUU=
X-Originating-IP: [60.177.59.214]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBoRKFbVQHLSCAygAAsP
Received-SPF: pass client-ip=123.126.97.5; envelope-from=liq3ea@163.com;
 helo=mail-m975.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 10:16:01
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the device fuzzer find a more and more issues.
For every fuzz case, we need not only the fixes but also
the coressponding test case. We can analysis the reproducer
for every case and find what happened in where and write
a beautiful test case. However the raw data of reproducer is not
friendly to analysis. It will take a very long time, even far more
than the fixes itself. So let's create a new file to hold all of
the fuzz test cases and just use the raw data to act as the test
case. This way nobody will be afraid of writing a test case for
the fuzz reproducer.

This patch adds the issue LP#1878263 test case.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 tests/qtest/Makefile.include |  2 ++
 tests/qtest/fuzz-test.c      | 45 ++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 tests/qtest/fuzz-test.c

diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index b0204e44f2..ff460179c5 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -7,6 +7,7 @@ check-qtest-generic-y += machine-none-test
 check-qtest-generic-y += qmp-test
 check-qtest-generic-y += qmp-cmd-test
 check-qtest-generic-y += qom-test
+check-qtest-generic-y += fuzz-test
 check-qtest-generic-$(CONFIG_MODULES) += modules-test
 check-qtest-generic-y += test-hmp
 
@@ -272,6 +273,7 @@ tests/qtest/m25p80-test$(EXESUF): tests/qtest/m25p80-test.o
 tests/qtest/i440fx-test$(EXESUF): tests/qtest/i440fx-test.o $(libqos-pc-obj-y)
 tests/qtest/q35-test$(EXESUF): tests/qtest/q35-test.o $(libqos-pc-obj-y)
 tests/qtest/fw_cfg-test$(EXESUF): tests/qtest/fw_cfg-test.o $(libqos-pc-obj-y)
+tests/qtest/fuzz-test$(EXESUF): tests/qtest/fuzz-test.o $(libqos-pc-obj-y)
 tests/qtest/rtl8139-test$(EXESUF): tests/qtest/rtl8139-test.o $(libqos-pc-obj-y)
 tests/qtest/pnv-xscom-test$(EXESUF): tests/qtest/pnv-xscom-test.o
 tests/qtest/wdt_ib700-test$(EXESUF): tests/qtest/wdt_ib700-test.o
diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
new file mode 100644
index 0000000000..695c6dffb9
--- /dev/null
+++ b/tests/qtest/fuzz-test.c
@@ -0,0 +1,45 @@
+/*
+ * QTest testcase for fuzz case
+ *
+ * Copyright (c) 2020 Li Qiang <liq3ea@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+
+#include "qemu/osdep.h"
+
+#include "libqtest.h"
+
+/*
+ * This used to trigger the assert in scsi_dma_complete
+ * https://bugs.launchpad.net/qemu/+bug/1878263
+ */
+static void test_megasas_zero_iov_cnt(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-nographic -monitor none -serial none "
+                   "-M q35 -device megasas -device scsi-cd,drive=null0 "
+                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
+    qtest_outl(s, 0xcf8, 0x80001818);
+    qtest_outl(s, 0xcfc, 0xc101);
+    qtest_outl(s, 0xcf8, 0x8000181c);
+    qtest_outl(s, 0xcf8, 0x80001804);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_outl(s, 0xcf8, 0x8000186a);
+    qtest_writeb(s, 0x14, 0xfe);
+    qtest_writeb(s, 0x0, 0x02);
+    qtest_outb(s, 0xc1c0, 0x17);
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("fuzz/megasas_zero_iov_cnt", test_megasas_zero_iov_cnt);
+
+    return g_test_run();
+}
-- 
2.17.1


