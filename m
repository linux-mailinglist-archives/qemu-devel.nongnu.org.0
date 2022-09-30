Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B145F1086
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:08:30 +0200 (CEST)
Received: from localhost ([::1]:55042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJUz-0000Lz-8k
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFv-0006lT-Tv
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFu-0006hp-3f
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pFwjcaI0F4VIP1QtiTFozGdGUPbdW+CMJkISUquQgdI=;
 b=doBdOUi8q8dmDrjLMxXaMrMOnwuPdshrWTY+nTLGm5nhNOpMmYnKwX52XKRng18PvqKdZI
 ZnttugCX2Bkn+9cdd5NkwxvZ+KC8Qb5rtqt+7nQ0Q9wQsrSWMyBgY5WHKufkbJcROD2U89
 FW2aGVONvqXA2rOOTJ01Rz81baNrv6U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-5yjY2rfuPNaWAISTUaNXDA-1; Fri, 30 Sep 2022 12:52:51 -0400
X-MC-Unique: 5yjY2rfuPNaWAISTUaNXDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D73093C10224;
 Fri, 30 Sep 2022 16:52:50 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2370617582;
 Fri, 30 Sep 2022 16:52:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 17/18] tests/qtest/ide-test: Verify that DIAGNOSTIC clears DEV
 to zero
Date: Fri, 30 Sep 2022 18:52:21 +0200
Message-Id: <20220930165222.249716-18-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Lev Kujawski <lkujaw@member.fsf.org>

Verify correction of EXECUTE DEVICE DIAGNOSTIC introduced in commit
72423831c3 (hw/ide/core: Clear LBA and drive bits for EXECUTE DEVICE
DIAGNOSTIC, 2022-05-28).

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
Message-Id: <20220707031140.158958-4-lkujaw@member.fsf.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qtest/ide-test.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 93b4416023..dbe1563b23 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -90,6 +90,7 @@ enum {
 
 enum {
     CMD_DSM         = 0x06,
+    CMD_DIAGNOSE    = 0x90,
     CMD_READ_DMA    = 0xc8,
     CMD_WRITE_DMA   = 0xca,
     CMD_FLUSH_CACHE = 0xe7,
@@ -614,6 +615,36 @@ static void test_identify(void)
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
@@ -1050,6 +1081,8 @@ int main(int argc, char **argv)
 
     qtest_add_func("/ide/identify", test_identify);
 
+    qtest_add_func("/ide/diagnostic", test_diagnostic);
+
     qtest_add_func("/ide/bmdma/simple_rw", test_bmdma_simple_rw);
     qtest_add_func("/ide/bmdma/trim", test_bmdma_trim);
     qtest_add_func("/ide/bmdma/various_prdts", test_bmdma_various_prdts);
-- 
2.37.3


