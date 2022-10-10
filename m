Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658B5F9B86
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:59:42 +0200 (CEST)
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohodR-0001PJ-Ay
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1ohoWl-00030c-N4; Mon, 10 Oct 2022 04:52:51 -0400
Received: from mout-p-201.mailbox.org ([80.241.56.171]:36258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1ohoWj-0006DX-Hg; Mon, 10 Oct 2022 04:52:47 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4MmCNQ5fBfz9sQr;
 Mon, 10 Oct 2022 10:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1665391958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TndfG5ZLHuG7kaSjvXs28bs8nV6vF1WJXNxtA+qxG5w=;
 b=GTa1DoTA8D7Ha9iYr8UKh3zG+ZcrCy7Xim+eRW1Q2uCyhPbrsBQfPK62/1f/d9bRwiTqol
 9AHUbnCmk2U4IJ3XXdN7HAgfIacdDTAqqXmnjtLi8EX/bRxHZMX+OuZX1C7t1BglLLiK2h
 C3ZK+iEbkpvChtj3umJ7lzszUliRFwS4RArJeLYOHF11MZTBZH6XeF6Dz1L9JBAyyurNvv
 gUNFX0FfX4ULfjElI6uLnZ5URuF1fX4TrnVlg6YZLcIfBzjG/zhoU0UmfcVcchU6zZE7k3
 GJP2vFY+HzFT8UYi3M88bcDXxyBZA6C9XXmZqsV+TdwJjJQtSrMN6iIHFFu82g==
From: Lev Kujawski <lkujaw@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1665391956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TndfG5ZLHuG7kaSjvXs28bs8nV6vF1WJXNxtA+qxG5w=;
 b=vgPB3Qt7/xSb1v227VirmFReJf6zkvDHnjGpFUUtaNpHKKgGnML4IWFaEbm05toUmEbytb
 pGueee0kz7NXdR85CVmjFZrSn4WZ18R1mosXFrU5D6aWqXR3yYswNE9jYlLShFRdLMAfN/
 pVRUMJ2kXrSIx6cIo1Ts/zDUj15zZza1f9XKK1cKllQ4LYI9y2zNTwX1i0ZGiEej+MfWNV
 id4MzV75srfigxaj9Hz9y9gJbjheNCXijboioyJZJy3u6PmuWsk8IF/YF9aAIgLW1jAsMy
 XqTeeB+1hFiaS1bvdKaG1Uus3HbhWpBZ3VRXWpZH4QyMgITAShlfAkm3ibhuAQ==
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Lev Kujawski <lkujaw@mailbox.org>
Subject: [PATCH 2/2] tests/qtest/ide-test: Verify READ NATIVE MAX ADDRESS is
 not limited
Date: Mon, 10 Oct 2022 08:52:29 +0000
Message-Id: <20221010085229.2431276-2-lkujaw@mailbox.org>
In-Reply-To: <20221010085229.2431276-1-lkujaw@mailbox.org>
References: <20221010085229.2431276-1-lkujaw@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bbcbf016e9e1ddb75f5
X-MBO-RS-META: m3zzy1nous44qwebfffz4jxrj1p69wgn
X-Rspamd-Queue-Id: 4MmCNQ5fBfz9sQr
Received-SPF: pass client-ip=80.241.56.171; envelope-from=lkujaw@mailbox.org;
 helo=mout-p-201.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that the ATA command READ NATIVE MAX ADDRESS returns the last
valid CHS tuple for the native device rather than any limit
established by INITIALIZE DEVICE PARAMETERS.

Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
---
 tests/qtest/ide-test.c | 47 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index dbe1563b23..c406e6752a 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -37,7 +37,8 @@
 /* TODO actually test the results and get rid of this */
 #define qmp_discard_response(q, ...) qobject_unref(qtest_qmp(q, __VA_ARGS__))
 
-#define TEST_IMAGE_SIZE 64 * 1024 * 1024
+/* Specified by ATA (physical) CHS geometry for ~64 MiB device.  */
+#define TEST_IMAGE_SIZE ((130 * 16 * 63) * 512)
 
 #define IDE_PCI_DEV     1
 #define IDE_PCI_FUNC    1
@@ -91,11 +92,13 @@ enum {
 enum {
     CMD_DSM         = 0x06,
     CMD_DIAGNOSE    = 0x90,
+    CMD_INIT_DP     = 0x91,  /* INITIALIZE DEVICE PARAMETERS */
     CMD_READ_DMA    = 0xc8,
     CMD_WRITE_DMA   = 0xca,
     CMD_FLUSH_CACHE = 0xe7,
     CMD_IDENTIFY    = 0xec,
     CMD_PACKET      = 0xa0,
+    CMD_READ_NATIVE = 0xf8,  /* READ NATIVE MAX ADDRESS */
 
     CMDF_ABORT      = 0x100,
     CMDF_NO_BM      = 0x200,
@@ -562,6 +565,46 @@ static void string_cpu_to_be16(uint16_t *s, size_t bytes)
     }
 }
 
+static void test_specify(void)
+{
+    QTestState *qts;
+    QPCIDevice *dev;
+    QPCIBar bmdma_bar, ide_bar;
+    uint16_t cyls;
+    uint8_t heads, spt;
+
+    qts = ide_test_start(
+        "-blockdev driver=file,node-name=hda,filename=%s "
+        "-device ide-hd,drive=hda,bus=ide.0,unit=0 ",
+        tmp_path[0]);
+
+    dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
+
+    /* Initialize drive with zero sectors per track and one head.  */
+    qpci_io_writeb(dev, ide_bar, reg_nsectors, 0);
+    qpci_io_writeb(dev, ide_bar, reg_device, 0);
+    qpci_io_writeb(dev, ide_bar, reg_command, CMD_INIT_DP);
+
+    /* READ NATIVE MAX ADDRESS (CHS mode).  */
+    qpci_io_writeb(dev, ide_bar, reg_device, 0xa0);
+    qpci_io_writeb(dev, ide_bar, reg_command, CMD_READ_NATIVE);
+
+    heads = qpci_io_readb(dev, ide_bar, reg_device) & 0xf;
+    ++heads;
+    g_assert_cmpint(heads, ==, 16);
+
+    cyls = qpci_io_readb(dev, ide_bar, reg_lba_high) << 8;
+    cyls |= qpci_io_readb(dev, ide_bar, reg_lba_middle);
+    ++cyls;
+    g_assert_cmpint(cyls, ==, 130);
+
+    spt = qpci_io_readb(dev, ide_bar, reg_lba_low);
+    g_assert_cmpint(spt, ==, 63);
+
+    ide_test_quit(qts);
+    free_pci_device(dev);
+}
+
 static void test_identify(void)
 {
     QTestState *qts;
@@ -1079,6 +1122,8 @@ int main(int argc, char **argv)
     /* Run the tests */
     g_test_init(&argc, &argv, NULL);
 
+    qtest_add_func("/ide/read_native", test_specify);
+
     qtest_add_func("/ide/identify", test_identify);
 
     qtest_add_func("/ide/diagnostic", test_diagnostic);
-- 
2.34.1


