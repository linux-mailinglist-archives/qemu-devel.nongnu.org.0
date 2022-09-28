Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18D05ED695
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 09:43:59 +0200 (CEST)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odRjY-0007S4-SM
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 03:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLQ-0000tI-4U
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLO-0008RE-8K
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2Ui2OpeTwQj51CzteIj3lNBFTymyVVDOfEP7OQNEXk=;
 b=fjr3HpR0ARMOa9EZO3W7HFrwTNJ7mZdBkdlfk4KsIZN/ork3VlRTrMN8JZmEzAgOZQlNOs
 kDfAKodpIOHEkijhnytN7vet0LYl7Lff/TV6ZsCUaMnDS6WiyYgMtoDYuXtECoScPMgXdy
 MSoXKjsw8z4Ktj/H0Py9jZ0LVn6fe/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-D8hEf2YiPoyzaHvSW3ok7Q-1; Wed, 28 Sep 2022 03:18:50 -0400
X-MC-Unique: D8hEf2YiPoyzaHvSW3ok7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37A53101A528;
 Wed, 28 Sep 2022 07:18:50 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03AC240C83BB;
 Wed, 28 Sep 2022 07:18:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 01/37] tests/qtest: i440fx-test: Rewrite create_blob_file() to
 be portable
Date: Wed, 28 Sep 2022 09:18:07 +0200
Message-Id: <20220928071843.1468323-2-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Bin Meng <bin.meng@windriver.com>

Previously request_{bios, pflash} cases were skipped on win32, mainly
due to create_blob_file() calling mmap() which does not exist on win32.
This rewirtes create_blob_file() to be portable, so that we can enable
these cases on Windows.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220925113032.1949844-2-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/i440fx-test.c | 54 ++++++++++-----------------------------
 1 file changed, 14 insertions(+), 40 deletions(-)

diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
index 3890f1237c..795fd85343 100644
--- a/tests/qtest/i440fx-test.c
+++ b/tests/qtest/i440fx-test.c
@@ -278,56 +278,34 @@ static void test_i440fx_pam(gconstpointer opaque)
     qtest_end();
 }
 
-#ifndef _WIN32
-
 #define BLOB_SIZE ((size_t)65536)
 #define ISA_BIOS_MAXSZ ((size_t)(128 * 1024))
 
-/* Create a blob file, and return its absolute pathname as a dynamically
+/*
+ * Create a blob file, and return its absolute pathname as a dynamically
  * allocated string.
  * The file is closed before the function returns.
- * In case of error, NULL is returned. The function prints the error message.
+ * In case of error, the function aborts and prints the error message.
  */
 static char *create_blob_file(void)
 {
-    int ret, fd;
+    int i, fd;
     char *pathname;
     GError *error = NULL;
+    g_autofree uint8_t *buf = g_malloc(BLOB_SIZE);
 
-    ret = -1;
     fd = g_file_open_tmp("blob_XXXXXX", &pathname, &error);
-    if (fd == -1) {
-        fprintf(stderr, "unable to create blob file: %s\n", error->message);
-        g_error_free(error);
-    } else {
-        if (ftruncate(fd, BLOB_SIZE) == -1) {
-            fprintf(stderr, "ftruncate(\"%s\", %zu): %s\n", pathname,
-                    BLOB_SIZE, strerror(errno));
-        } else {
-            void *buf;
-
-            buf = mmap(NULL, BLOB_SIZE, PROT_WRITE, MAP_SHARED, fd, 0);
-            if (buf == MAP_FAILED) {
-                fprintf(stderr, "mmap(\"%s\", %zu): %s\n", pathname, BLOB_SIZE,
-                        strerror(errno));
-            } else {
-                size_t i;
-
-                for (i = 0; i < BLOB_SIZE; ++i) {
-                    ((uint8_t *)buf)[i] = i;
-                }
-                munmap(buf, BLOB_SIZE);
-                ret = 0;
-            }
-        }
-        close(fd);
-        if (ret == -1) {
-            unlink(pathname);
-            g_free(pathname);
-        }
+    g_assert_no_error(error);
+    close(fd);
+
+    for (i = 0; i < BLOB_SIZE; i++) {
+        buf[i] = i;
     }
 
-    return ret == -1 ? NULL : pathname;
+    g_file_set_contents(pathname, (char *)buf, BLOB_SIZE, &error);
+    g_assert_no_error(error);
+
+    return pathname;
 }
 
 static void test_i440fx_firmware(FirmwareTestFixture *fixture,
@@ -398,8 +376,6 @@ static void request_pflash(FirmwareTestFixture *fixture,
     fixture->is_bios = false;
 }
 
-#endif /* _WIN32 */
-
 int main(int argc, char **argv)
 {
     TestData data;
@@ -410,10 +386,8 @@ int main(int argc, char **argv)
 
     qtest_add_data_func("i440fx/defaults", &data, test_i440fx_defaults);
     qtest_add_data_func("i440fx/pam", &data, test_i440fx_pam);
-#ifndef _WIN32
     add_firmware_test("i440fx/firmware/bios", request_bios);
     add_firmware_test("i440fx/firmware/pflash", request_pflash);
-#endif
 
     return g_test_run();
 }
-- 
2.31.1


