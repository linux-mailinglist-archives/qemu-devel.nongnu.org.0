Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3A455897
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:06:28 +0100 (CET)
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mneJH-0000Ku-2K
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:06:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mneGo-0006yN-IO
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:03:54 -0500
Received: from [2001:41c9:1:41f::167] (port=44596
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mneGm-0000uC-Ln
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:03:54 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mneGX-000CXb-C1; Thu, 18 Nov 2021 10:03:41 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, fam@euphon.net, thuth@redhat.com, lvivier@redhat.com,
 qemu-devel@nongnu.org
Date: Thu, 18 Nov 2021 10:03:27 +0000
Message-Id: <20211118100327.29061-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211118100327.29061-1-mark.cave-ayland@ilande.co.uk>
References: <20211118100327.29061-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-6.2 2/2] qtest/am53c974-test: add test for reset before
 transfer
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Based upon the qtest reproducer posted to Gitlab issue #724 at
https://gitlab.com/qemu-project/qemu/-/issues/724.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 tests/qtest/am53c974-test.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
index 9b1e4211bd..d214a912b3 100644
--- a/tests/qtest/am53c974-test.c
+++ b/tests/qtest/am53c974-test.c
@@ -223,6 +223,34 @@ static void test_inflight_cancel_ok(void)
     qtest_quit(s);
 }
 
+static void test_reset_before_transfer_ok(void)
+{
+    QTestState *s = qtest_init(
+        "-device am53c974,id=scsi "
+        "-device scsi-hd,drive=disk0 -drive "
+        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc007, 0x2500);
+    qtest_outl(s, 0xc00a, 0x410000);
+    qtest_outl(s, 0xc00a, 0x410000);
+    qtest_outw(s, 0xc00b, 0x0200);
+    qtest_outw(s, 0xc040, 0x03);
+    qtest_outw(s, 0xc009, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc009, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc009, 0x00);
+    qtest_outw(s, 0xc003, 0x1000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_outl(s, 0xc00b, 0x9000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -248,6 +276,8 @@ int main(int argc, char **argv)
                        test_cancelled_request_ok);
         qtest_add_func("am53c974/test_inflight_cancel_ok",
                        test_inflight_cancel_ok);
+        qtest_add_func("am53c974/test_reset_before_transfer_ok",
+                       test_reset_before_transfer_ok);
     }
 
     return g_test_run();
-- 
2.20.1


