Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183B35F1092
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:13:39 +0200 (CEST)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJZy-0007jO-48
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFt-0006j5-Ok
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFr-0006gb-VR
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqkz9ZPlpiqOwV9F+Psy0Egg+4p1ynVgyKGQOKyrsFs=;
 b=Zor/cS3wjPH8Tg4700XGSoePvquBhYcdxzQJHKSB/A0GDH8r64kxxsSfcfppBGal/Oza7L
 x5AgyxPiBQaQeLgSNgKwHFWPXcLcTj7uIzMNbcAhYeJKZjEAacfF7hBUat5vMa8YNyTsYG
 df4cGvZc0aePL7qUOM79iGmhfhC7nww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-J1T6keBANaieCaaeHq77aQ-1; Fri, 30 Sep 2022 12:52:49 -0400
X-MC-Unique: J1T6keBANaieCaaeHq77aQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E141E811E81;
 Fri, 30 Sep 2022 16:52:48 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CB1818EB4;
 Fri, 30 Sep 2022 16:52:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 15/18] tests/qtest/ide-test.c: Create disk image for use as a
 secondary
Date: Fri, 30 Sep 2022 18:52:19 +0200
Message-Id: <20220930165222.249716-16-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Lev Kujawski <lkujaw@member.fsf.org>

Change 'tmp_path' into an array of two members to accommodate another
disk image of size TEST_IMAGE_SIZE.  This facilitates testing ATA
protocol aspects peculiar to secondary devices on the same controller.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
Message-Id: <20220707031140.158958-2-lkujaw@member.fsf.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qtest/ide-test.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 4ea89c26c9..93b4416023 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -121,7 +121,7 @@ enum {
 static QPCIBus *pcibus = NULL;
 static QGuestAllocator guest_malloc;
 
-static char *tmp_path;
+static char *tmp_path[2];
 static char *debug_path;
 
 static QTestState *ide_test_start(const char *cmdline_fmt, ...)
@@ -310,7 +310,7 @@ static QTestState *test_bmdma_setup(void)
     qts = ide_test_start(
         "-drive file=%s,if=ide,cache=writeback,format=raw "
         "-global ide-hd.serial=%s -global ide-hd.ver=%s",
-        tmp_path, "testdisk", "version");
+        tmp_path[0], "testdisk", "version");
     qtest_irq_intercept_in(qts, "ioapic");
 
     return qts;
@@ -574,7 +574,7 @@ static void test_identify(void)
     qts = ide_test_start(
         "-drive file=%s,if=ide,cache=writeback,format=raw "
         "-global ide-hd.serial=%s -global ide-hd.ver=%s",
-        tmp_path, "testdisk", "version");
+        tmp_path[0], "testdisk", "version");
 
     dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
 
@@ -662,7 +662,7 @@ static void test_flush(void)
 
     qts = ide_test_start(
         "-drive file=blkdebug::%s,if=ide,cache=writeback,format=raw",
-        tmp_path);
+        tmp_path[0]);
 
     dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
 
@@ -713,7 +713,7 @@ static void test_pci_retry_flush(void)
     qts = ide_test_start(
         "-drive file=blkdebug:%s:%s,if=ide,cache=writeback,format=raw,"
         "rerror=stop,werror=stop",
-        debug_path, tmp_path);
+        debug_path, tmp_path[0]);
 
     dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
 
@@ -892,14 +892,14 @@ static void cdrom_pio_impl(int nblocks)
 
     /* Prepopulate the CDROM with an interesting pattern */
     generate_pattern(pattern, patt_len, ATAPI_BLOCK_SIZE);
-    fh = fopen(tmp_path, "wb+");
+    fh = fopen(tmp_path[0], "wb+");
     ret = fwrite(pattern, ATAPI_BLOCK_SIZE, patt_blocks, fh);
     g_assert_cmpint(ret, ==, patt_blocks);
     fclose(fh);
 
     qts = ide_test_start(
             "-drive if=none,file=%s,media=cdrom,format=raw,id=sr0,index=0 "
-            "-device ide-cd,drive=sr0,bus=ide.0", tmp_path);
+            "-device ide-cd,drive=sr0,bus=ide.0", tmp_path[0]);
     dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
     qtest_irq_intercept_in(qts, "ioapic");
 
@@ -985,7 +985,7 @@ static void test_cdrom_dma(void)
 
     qts = ide_test_start(
             "-drive if=none,file=%s,media=cdrom,format=raw,id=sr0,index=0 "
-            "-device ide-cd,drive=sr0,bus=ide.0", tmp_path);
+            "-device ide-cd,drive=sr0,bus=ide.0", tmp_path[0]);
     qtest_irq_intercept_in(qts, "ioapic");
 
     guest_buf = guest_alloc(&guest_malloc, len);
@@ -993,7 +993,7 @@ static void test_cdrom_dma(void)
     prdt[0].size = cpu_to_le32(len | PRDT_EOT);
 
     generate_pattern(pattern, ATAPI_BLOCK_SIZE * 16, ATAPI_BLOCK_SIZE);
-    fh = fopen(tmp_path, "wb+");
+    fh = fopen(tmp_path[0], "wb+");
     ret = fwrite(pattern, ATAPI_BLOCK_SIZE, 16, fh);
     g_assert_cmpint(ret, ==, 16);
     fclose(fh);
@@ -1012,6 +1012,7 @@ static void test_cdrom_dma(void)
 int main(int argc, char **argv)
 {
     const char *base;
+    int i;
     int fd;
     int ret;
 
@@ -1035,12 +1036,14 @@ int main(int argc, char **argv)
     close(fd);
 
     /* Create a temporary raw image */
-    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", base);
-    fd = g_mkstemp(tmp_path);
-    g_assert(fd >= 0);
-    ret = ftruncate(fd, TEST_IMAGE_SIZE);
-    g_assert(ret == 0);
-    close(fd);
+    for (i = 0; i < 2; ++i) {
+        tmp_path[i] = g_strdup_printf("%s/qtest.XXXXXX", base);
+        fd = g_mkstemp(tmp_path[i]);
+        g_assert(fd >= 0);
+        ret = ftruncate(fd, TEST_IMAGE_SIZE);
+        g_assert(ret == 0);
+        close(fd);
+    }
 
     /* Run the tests */
     g_test_init(&argc, &argv, NULL);
@@ -1064,8 +1067,10 @@ int main(int argc, char **argv)
     ret = g_test_run();
 
     /* Cleanup */
-    unlink(tmp_path);
-    g_free(tmp_path);
+    for (i = 0; i < 2; ++i) {
+        unlink(tmp_path[i]);
+        g_free(tmp_path[i]);
+    }
     unlink(debug_path);
     g_free(debug_path);
 
-- 
2.37.3


