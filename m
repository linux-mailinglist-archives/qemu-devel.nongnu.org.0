Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217F35ED7B5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:28:18 +0200 (CEST)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSQS-00082Y-UH
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLx-00015R-6g
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLv-0008Vz-IG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KzE561aL0CLDS1WEU8W/QraRdzWpPvLgwlDfs/9CCGI=;
 b=dViwxZqUJ/WRDLdDFkPdT9rpmWbkmsdXZ7wkCjhCHKqlc/i3WkzHAPNzGcffMNKwbjLlRH
 vo6sHDFJT6HGPrIOm4XO70udtAyuU98D/Uc2BP/EuQYpYJ/bhYu2I6+1mOSnTC2T5xGyPK
 HSNRX0PmVCRKlC5K0uJWJzc2/4wfJ6A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-58mFwwBGO0m4AeCS-ZjjLw-1; Wed, 28 Sep 2022 03:19:27 -0400
X-MC-Unique: 58mFwwBGO0m4AeCS-ZjjLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7D6F811E81;
 Wed, 28 Sep 2022 07:19:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F96240C83BB;
 Wed, 28 Sep 2022 07:19:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 22/37] tests/qtest: {ahci,
 ide}-test: Use relative path for temporary files for win32
Date: Wed, 28 Sep 2022 09:18:28 +0200
Message-Id: <20220928071843.1468323-23-thuth@redhat.com>
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

These test cases uses "blkdebug:path/to/config:path/to/image" for
testing. On Windows, absolute file paths contain the delimiter ':'
which causes the blkdebug filename parser fail to parse filenames.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220925113032.1949844-38-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/ahci-test.c | 21 ++++++++++++++++++---
 tests/qtest/ide-test.c  | 20 ++++++++++++++++++--
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 1d5929d8c3..66652fed04 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -1833,7 +1833,7 @@ static void create_ahci_io_test(enum IOMode type, enum AddrMode addr,
 
 int main(int argc, char **argv)
 {
-    const char *arch;
+    const char *arch, *base;
     int ret;
     int fd;
     int c;
@@ -1871,8 +1871,22 @@ int main(int argc, char **argv)
         return 0;
     }
 
+    /*
+     * "base" stores the starting point where we create temporary files.
+     *
+     * On Windows, this is set to the relative path of current working
+     * directory, because the absolute path causes the blkdebug filename
+     * parser fail to parse "blkdebug:path/to/config:path/to/image".
+     */
+#ifndef _WIN32
+    base = g_get_tmp_dir();
+#else
+    base = ".";
+#endif
+
     /* Create a temporary image */
-    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
+    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", base);
+    fd = g_mkstemp(tmp_path);
     g_assert(fd >= 0);
     if (have_qemu_img()) {
         imgfmt = "qcow2";
@@ -1889,7 +1903,8 @@ int main(int argc, char **argv)
     close(fd);
 
     /* Create temporary blkdebug instructions */
-    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
+    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
+    fd = g_mkstemp(debug_path);
     g_assert(fd >= 0);
     close(fd);
 
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 25302be6dc..5e3e28aea2 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -1011,16 +1011,32 @@ static void test_cdrom_dma(void)
 
 int main(int argc, char **argv)
 {
+    const char *base;
     int fd;
     int ret;
 
+    /*
+     * "base" stores the starting point where we create temporary files.
+     *
+     * On Windows, this is set to the relative path of current working
+     * directory, because the absolute path causes the blkdebug filename
+     * parser fail to parse "blkdebug:path/to/config:path/to/image".
+     */
+#ifndef _WIN32
+    base = g_get_tmp_dir();
+#else
+    base = ".";
+#endif
+
     /* Create temporary blkdebug instructions */
-    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
+    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
+    fd = g_mkstemp(debug_path);
     g_assert(fd >= 0);
     close(fd);
 
     /* Create a temporary raw image */
-    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
+    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", base);
+    fd = g_mkstemp(tmp_path);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
-- 
2.31.1


