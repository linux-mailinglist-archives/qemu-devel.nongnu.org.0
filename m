Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2F85698B5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 05:17:35 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9I1H-0002Gu-07
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 23:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hw4-0004TR-J8; Wed, 06 Jul 2022 23:12:12 -0400
Received: from mout-u-107.mailbox.org ([80.241.59.207]:35578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hw2-0007hr-1o; Wed, 06 Jul 2022 23:12:12 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4LdhK52svpz9sTR;
 Thu,  7 Jul 2022 05:11:53 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH v2 4/7] tests/qtest/ide-test: Verify that DIAGNOSTIC clears
 DEV to zero
Date: Thu,  7 Jul 2022 03:11:37 +0000
Message-Id: <20220707031140.158958-4-lkujaw@member.fsf.org>
In-Reply-To: <20220707031140.158958-1-lkujaw@member.fsf.org>
References: <20220707031140.158958-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=80.241.59.207; envelope-from=lkujaw@member.fsf.org;
 helo=mout-u-107.mailbox.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify correction of EXECUTE DEVICE DIAGNOSTIC introduced in commit
72423831c3 (hw/ide/core: Clear LBA and drive bits for EXECUTE DEVICE
DIAGNOSTIC, 2022-05-28).

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 tests/qtest/ide-test.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 1ff707d2cd..dfcf59cee8 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -90,6 +90,7 @@ enum {
 
 enum {
     CMD_DSM         = 0x06,
+    CMD_DIAGNOSE    = 0x90,
     CMD_READ_DMA    = 0xc8,
     CMD_WRITE_DMA   = 0xca,
     CMD_FLUSH_CACHE = 0xe7,
@@ -616,6 +617,36 @@ static void test_identify(void)
     free_pci_device(dev);
 }
 
+static void test_diagnostic(void)
+{
+    QTestState *qts;
+    QPCIDevice *dev;
+    QPCIBar bmdma_bar, ide_bar;
+    uint8_t data;
+
+    qts = ide_test_start(
+        "-blockdev driver=file,node-name=hda,filename=%s "
+        "-blockdev driver=file,node-name=hdb,filename=%s "
+        "-device ide-hd,drive=hda,bus=ide.0,unit=0 "
+        "-device ide-hd,drive=hdb,bus=ide.0,unit=1 ",
+        tmp_path[0], tmp_path[1]);
+
+    dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
+
+    /* DIAGNOSE command on device 1 */
+    qpci_io_writeb(dev, ide_bar, reg_device, DEV);
+    data = qpci_io_readb(dev, ide_bar, reg_device);
+    g_assert_cmphex(data & DEV, ==, DEV);
+    qpci_io_writeb(dev, ide_bar, reg_command, CMD_DIAGNOSE);
+
+    /* Verify that DEVICE is now 0 */
+    data = qpci_io_readb(dev, ide_bar, reg_device);
+    g_assert_cmphex(data & DEV, ==, 0);
+
+    ide_test_quit(qts);
+    free_pci_device(dev);
+}
+
 /*
  * Write sector 1 with random data to make IDE storage dirty
  * Needed for flush tests so that flushes actually go though the block layer
@@ -1037,6 +1068,8 @@ int main(int argc, char **argv)
 
     qtest_add_func("/ide/identify", test_identify);
 
+    qtest_add_func("/ide/diagnostic", test_diagnostic);
+
     qtest_add_func("/ide/bmdma/simple_rw", test_bmdma_simple_rw);
     qtest_add_func("/ide/bmdma/trim", test_bmdma_trim);
     qtest_add_func("/ide/bmdma/various_prdts", test_bmdma_various_prdts);
-- 
2.34.1


