Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35195ED8B1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:18:07 +0200 (CEST)
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTCg-00031y-O8
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRME-0001Av-IY
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRMB-00007D-Fb
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C766JYsfMX7Nzr3hwAlukL4TK2ArgI7v4YmcFnFKGOA=;
 b=RAR/6G+oEKrVkuVg8E+9+Z67EyUZFiGAhFTbJuCcqIEsSEeD4qvF6aWLu7K6Bx4tswl0E5
 o5ZokcqspkDiQz/RO1R1IwZT/k4eYT/B1clB5ONRtAYvZzmO2Gu58/UFPsr/8izlrHCBDl
 2mLcxI3QY+DzFlZ85hcsU1CaVoIwyRE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-trs4QZTSMl64dZVfFx9llQ-1; Wed, 28 Sep 2022 03:19:44 -0400
X-MC-Unique: trs4QZTSMl64dZVfFx9llQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49101185A79C;
 Wed, 28 Sep 2022 07:19:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64F7D40C83BB;
 Wed, 28 Sep 2022 07:19:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 32/37] tests/qtest: hd-geo-test: Avoid using hardcoded /tmp
Date: Wed, 28 Sep 2022 09:18:38 +0200
Message-Id: <20220928071843.1468323-33-thuth@redhat.com>
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
Message-Id: <20220927110632.1973965-13-bmeng.cn@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/hd-geo-test.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 413cf964c0..ba772f4d7a 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -27,16 +27,16 @@
 
 static char *create_test_img(int secs)
 {
-    char *template = strdup("/tmp/qtest.XXXXXX");
+    char *template;
     int fd, ret;
 
-    fd = mkstemp(template);
+    fd = g_file_open_tmp("qtest.XXXXXX", &template, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, (off_t)secs * 512);
     close(fd);
 
     if (ret) {
-        free(template);
+        g_free(template);
         template = NULL;
     }
 
@@ -422,9 +422,8 @@ static MBRpartitions empty_mbr = { {false, 0, 0, 0, 0, 0, 0, 0, 0},
 
 static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
 {
-    const char *template = "/tmp/qtest.XXXXXX";
-    char *raw_path = strdup(template);
-    char *qcow2_path = strdup(template);
+    g_autofree char *raw_path = NULL;
+    char *qcow2_path;
     char cmd[100 + 2 * PATH_MAX];
     uint8_t buf[512] = {};
     int i, ret, fd, offset;
@@ -468,7 +467,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
         offset += 0x10;
     }
 
-    fd = mkstemp(raw_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &raw_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -478,7 +477,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     g_assert(ret == sizeof(buf));
     close(fd);
 
-    fd = mkstemp(qcow2_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &qcow2_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -506,7 +505,6 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     free(qemu_img_abs_path);
 
     unlink(raw_path);
-    free(raw_path);
 
     return qcow2_path;
 }
@@ -714,7 +712,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -867,7 +865,7 @@ static void test_override_scsi_hot_unplug(void)
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -927,7 +925,7 @@ static void test_override_virtio_hot_unplug(void)
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -987,7 +985,7 @@ test_add_done:
     for (i = 0; i < backend_last; i++) {
         if (img_file_name[i]) {
             unlink(img_file_name[i]);
-            free(img_file_name[i]);
+            g_free(img_file_name[i]);
         }
     }
 
-- 
2.31.1


