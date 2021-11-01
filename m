Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E8F442108
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:45:29 +0100 (CET)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdFI-0005hf-1u
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhc9w-0004rz-0z
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:35:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43256
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhc9t-0007KD-JV
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:35:51 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhc9Q-0002So-81; Mon, 01 Nov 2021 18:35:23 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, fam@euphon.net, thuth@redhat.com, lvivier@redhat.com,
 qemu-devel@nongnu.org
Date: Mon,  1 Nov 2021 18:35:16 +0000
Message-Id: <20211101183516.8455-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211101183516.8455-1-mark.cave-ayland@ilande.co.uk>
References: <20211101183516.8455-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/2] qtest/am53c974-test: add test for cancelling in-flight
 requests
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Based upon the qtest reproducer posted to Gitlab issue #663 at
https://gitlab.com/qemu-project/qemu/-/issues/663.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 tests/qtest/am53c974-test.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
index d996866cd4..9b1e4211bd 100644
--- a/tests/qtest/am53c974-test.c
+++ b/tests/qtest/am53c974-test.c
@@ -189,6 +189,40 @@ static void test_cancelled_request_ok(void)
     qtest_quit(s);
 }
 
+static void test_inflight_cancel_ok(void)
+{
+    QTestState *s = qtest_init(
+        "-device am53c974,id=scsi "
+        "-device scsi-hd,drive=disk0 -drive "
+        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001000);
+    qtest_inw(s, 0xcfc);
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xffffffff);
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_inl(s, 0xcfc);
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc001);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_inw(s, 0xcfc);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_inw(s, 0xcfc);
+    qtest_inb(s, 0xc000);
+    qtest_outb(s, 0xc008, 0x8);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outb(s, 0xc009, 0x0);
+    qtest_outb(s, 0xc009, 0x0);
+    qtest_outw(s, 0xc00b, 0xc212);
+    qtest_outl(s, 0xc042, 0x2c2c5a88);
+    qtest_outw(s, 0xc00b, 0xc212);
+    qtest_outw(s, 0xc00b, 0x415a);
+    qtest_outl(s, 0xc03f, 0x3060303);
+    qtest_outl(s, 0xc00b, 0x5afa9054);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -212,6 +246,8 @@ int main(int argc, char **argv)
                        test_fifo_underflow_on_write_ok);
         qtest_add_func("am53c974/test_cancelled_request_ok",
                        test_cancelled_request_ok);
+        qtest_add_func("am53c974/test_inflight_cancel_ok",
+                       test_inflight_cancel_ok);
     }
 
     return g_test_run();
-- 
2.20.1


