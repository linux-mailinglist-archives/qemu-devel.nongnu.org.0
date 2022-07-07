Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D285698AD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 05:14:49 +0200 (CEST)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Hya-0006L6-O1
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 23:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hvy-0004BB-4R; Wed, 06 Jul 2022 23:12:06 -0400
Received: from mout-u-204.mailbox.org ([2001:67c:2050:101:465::204]:41586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hvw-0007e4-DO; Wed, 06 Jul 2022 23:12:05 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4LdhJz5LDkz9sQV;
 Thu,  7 Jul 2022 05:11:47 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH v2 2/7] tests/qtest/ide-test.c: Create disk image for use as a
 secondary
Date: Thu,  7 Jul 2022 03:11:35 +0000
Message-Id: <20220707031140.158958-2-lkujaw@member.fsf.org>
In-Reply-To: <20220707031140.158958-1-lkujaw@member.fsf.org>
References: <20220707031140.158958-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2050:101:465::204;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-204.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Change 'tmp_path' into an array of two members to accommodate another
disk image of size TEST_IMAGE_SIZE.  This facilitates testing ATA
protocol aspects peculiar to secondary devices on the same controller.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 tests/qtest/ide-test.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 5bcb75a7e5..1ff707d2cd 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -121,7 +121,9 @@ enum {
 static QPCIBus *pcibus = NULL;
 static QGuestAllocator guest_malloc;
 
-static char tmp_path[] = "/tmp/qtest.XXXXXX";
+#define TMP_PATH_LEN 18
+
+static char tmp_path[2][TMP_PATH_LEN];
 static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
 
 static QTestState *ide_test_start(const char *cmdline_fmt, ...)
@@ -310,7 +312,7 @@ static QTestState *test_bmdma_setup(void)
     qts = ide_test_start(
         "-drive file=%s,if=ide,cache=writeback,format=raw "
         "-global ide-hd.serial=%s -global ide-hd.ver=%s",
-        tmp_path, "testdisk", "version");
+        tmp_path[0], "testdisk", "version");
     qtest_irq_intercept_in(qts, "ioapic");
 
     return qts;
@@ -574,7 +576,7 @@ static void test_identify(void)
     qts = ide_test_start(
         "-drive file=%s,if=ide,cache=writeback,format=raw "
         "-global ide-hd.serial=%s -global ide-hd.ver=%s",
-        tmp_path, "testdisk", "version");
+        tmp_path[0], "testdisk", "version");
 
     dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
 
@@ -662,7 +664,7 @@ static void test_flush(void)
 
     qts = ide_test_start(
         "-drive file=blkdebug::%s,if=ide,cache=writeback,format=raw",
-        tmp_path);
+        tmp_path[0]);
 
     dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
 
@@ -713,7 +715,7 @@ static void test_pci_retry_flush(void)
     qts = ide_test_start(
         "-drive file=blkdebug:%s:%s,if=ide,cache=writeback,format=raw,"
         "rerror=stop,werror=stop",
-        debug_path, tmp_path);
+        debug_path, tmp_path[0]);
 
     dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
 
@@ -892,14 +894,14 @@ static void cdrom_pio_impl(int nblocks)
 
     /* Prepopulate the CDROM with an interesting pattern */
     generate_pattern(pattern, patt_len, ATAPI_BLOCK_SIZE);
-    fh = fopen(tmp_path, "w+");
+    fh = fopen(tmp_path[0], "w+");
     ret = fwrite(pattern, ATAPI_BLOCK_SIZE, patt_blocks, fh);
     g_assert_cmpint(ret, ==, patt_blocks);
     fclose(fh);
 
     qts = ide_test_start(
             "-drive if=none,file=%s,media=cdrom,format=raw,id=sr0,index=0 "
-            "-device ide-cd,drive=sr0,bus=ide.0", tmp_path);
+            "-device ide-cd,drive=sr0,bus=ide.0", tmp_path[0]);
     dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
     qtest_irq_intercept_in(qts, "ioapic");
 
@@ -985,7 +987,7 @@ static void test_cdrom_dma(void)
 
     qts = ide_test_start(
             "-drive if=none,file=%s,media=cdrom,format=raw,id=sr0,index=0 "
-            "-device ide-cd,drive=sr0,bus=ide.0", tmp_path);
+            "-device ide-cd,drive=sr0,bus=ide.0", tmp_path[0]);
     qtest_irq_intercept_in(qts, "ioapic");
 
     guest_buf = guest_alloc(&guest_malloc, len);
@@ -993,7 +995,7 @@ static void test_cdrom_dma(void)
     prdt[0].size = cpu_to_le32(len | PRDT_EOT);
 
     generate_pattern(pattern, ATAPI_BLOCK_SIZE * 16, ATAPI_BLOCK_SIZE);
-    fh = fopen(tmp_path, "w+");
+    fh = fopen(tmp_path[0], "w+");
     ret = fwrite(pattern, ATAPI_BLOCK_SIZE, 16, fh);
     g_assert_cmpint(ret, ==, 16);
     fclose(fh);
@@ -1011,6 +1013,7 @@ static void test_cdrom_dma(void)
 
 int main(int argc, char **argv)
 {
+    int i;
     int fd;
     int ret;
 
@@ -1020,11 +1023,14 @@ int main(int argc, char **argv)
     close(fd);
 
     /* Create a temporary raw image */
-    fd = mkstemp(tmp_path);
-    g_assert(fd >= 0);
-    ret = ftruncate(fd, TEST_IMAGE_SIZE);
-    g_assert(ret == 0);
-    close(fd);
+    for (i = 0; i < 2; ++i) {
+        strncpy(tmp_path[i], "/tmp/qtest.XXXXXX", TMP_PATH_LEN);
+        fd = mkstemp(tmp_path[i]);
+        g_assert(fd >= 0);
+        ret = ftruncate(fd, TEST_IMAGE_SIZE);
+        g_assert(ret == 0);
+        close(fd);
+    }
 
     /* Run the tests */
     g_test_init(&argc, &argv, NULL);
@@ -1048,7 +1054,9 @@ int main(int argc, char **argv)
     ret = g_test_run();
 
     /* Cleanup */
-    unlink(tmp_path);
+    for (i = 0; i < 2; ++i) {
+        unlink(tmp_path[i]);
+    }
     unlink(debug_path);
 
     return ret;
-- 
2.34.1


