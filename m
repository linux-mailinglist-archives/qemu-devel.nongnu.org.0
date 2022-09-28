Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E025ED871
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:07:39 +0200 (CEST)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odT2T-0001uO-C8
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLP-0000sP-8y
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:18:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLM-0008R7-Di
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icYOHzCKPT4tZ28xawFjkohy3v7aTvDH9bPp19lPMRo=;
 b=cSscallQO6K5pqJMQw9K0qzPjaqSxljhs9RRG7yRnW3cmTlucU1Sdheo29yKYiMMQQ6EEI
 JJzQu+xeuqFu5oB7jeyc9NwgieuMsQbgB0oZMO7RoEQzL+0J87ptEPz6r5Tkco6EObYJGL
 B2k+0iToE59YbasKJ6LFWBbtkD9zgp8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-rr37SpbYMoKwbflr3qwICw-1; Wed, 28 Sep 2022 03:18:52 -0400
X-MC-Unique: rr37SpbYMoKwbflr3qwICw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3826858F13;
 Wed, 28 Sep 2022 07:18:51 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AFC240C83BB;
 Wed, 28 Sep 2022 07:18:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 02/37] tests/qtest: ahci-test: Avoid using hardcoded /tmp
Date: Wed, 28 Sep 2022 09:18:08 +0200
Message-Id: <20220928071843.1468323-3-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220925113032.1949844-6-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/ahci-test.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index f1e510b0ac..1d5929d8c3 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -44,9 +44,9 @@
 #define TEST_IMAGE_SIZE_MB_SMALL 64
 
 /*** Globals ***/
-static char tmp_path[] = "/tmp/qtest.XXXXXX";
-static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
-static char mig_socket[] = "/tmp/qtest-migration.XXXXXX";
+static char *tmp_path;
+static char *debug_path;
+static char *mig_socket;
 static bool ahci_pedantic;
 static const char *imgfmt;
 static unsigned test_image_size_mb;
@@ -1437,10 +1437,10 @@ static void test_ncq_simple(void)
 
 static int prepare_iso(size_t size, unsigned char **buf, char **name)
 {
-    char cdrom_path[] = "/tmp/qtest.iso.XXXXXX";
+    g_autofree char *cdrom_path = NULL;
     unsigned char *patt;
     ssize_t ret;
-    int fd = mkstemp(cdrom_path);
+    int fd = g_file_open_tmp("qtest.iso.XXXXXX", &cdrom_path, NULL);
 
     g_assert(fd != -1);
     g_assert(buf);
@@ -1872,7 +1872,7 @@ int main(int argc, char **argv)
     }
 
     /* Create a temporary image */
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     if (have_qemu_img()) {
         imgfmt = "qcow2";
@@ -1889,12 +1889,12 @@ int main(int argc, char **argv)
     close(fd);
 
     /* Create temporary blkdebug instructions */
-    fd = mkstemp(debug_path);
+    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
     /* Reserve a hollow file to use as a socket for migration tests */
-    fd = mkstemp(mig_socket);
+    fd = g_file_open_tmp("qtest-migration.XXXXXX", &mig_socket, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -1947,8 +1947,11 @@ int main(int argc, char **argv)
 
     /* Cleanup */
     unlink(tmp_path);
+    g_free(tmp_path);
     unlink(debug_path);
+    g_free(debug_path);
     unlink(mig_socket);
+    g_free(mig_socket);
 
     return ret;
 }
-- 
2.31.1


