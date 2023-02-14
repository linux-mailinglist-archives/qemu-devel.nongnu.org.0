Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E1F696250
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtO9-0007HO-9Y; Tue, 14 Feb 2023 06:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtO7-0007Ft-6i
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtO5-0002MJ-An
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hlpwck2AwYqtk6GaGDu8iztb+wCjp8EvoXoXkn8JTRE=;
 b=Gc4LuX3WWxnIzf3eK85rXLloUebHoWaA/afOXidixyDZhuR9gZO+S0w+mrh/TgRa1rZXWO
 Wl/ddiobfVD5Ma+FjS5jI1dKwUf6P4zpcjDknI/6xn1E5zb9Ff3nGVYaICSaeJBNtoxNpf
 SkYbeAb8wy2a0mPafQ2cp0Puy7+wIm4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-JT4Bsq1cPvqzcenoqSm6CA-1; Tue, 14 Feb 2023 06:22:11 -0500
X-MC-Unique: JT4Bsq1cPvqzcenoqSm6CA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5894B29DD982;
 Tue, 14 Feb 2023 11:22:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34AB14010E85;
 Tue, 14 Feb 2023 11:22:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>
Subject: [PULL 15/22] tests/qtest: drive_del-test: Skip tests that require
 missing devices
Date: Tue, 14 Feb 2023 12:21:41 +0100
Message-Id: <20230214112148.646077-16-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Message-Id: <20230208194700.11035-9-farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/drive_del-test.c | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 9a750395a9..8a6f3ac963 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -16,6 +16,8 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 
+static const char *qvirtio_get_dev_type(void);
+
 static bool look_for_drive0(QTestState *qts, const char *command, const char *key)
 {
     QDict *response;
@@ -40,6 +42,19 @@ static bool look_for_drive0(QTestState *qts, const char *command, const char *ke
     return found;
 }
 
+/*
+ * This covers the possible absence of a device due to QEMU build
+ * options.
+ */
+static bool has_device_builtin(const char *dev)
+{
+    gchar *device = g_strdup_printf("%s-%s", dev, qvirtio_get_dev_type());
+    bool rc = qtest_has_device(device);
+
+    g_free(device);
+    return rc;
+}
+
 static bool has_drive(QTestState *qts)
 {
     return look_for_drive0(qts, "query-block", "device");
@@ -208,6 +223,11 @@ static void test_drive_del_device_del(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-scsi")) {
+        g_test_skip("Device virtio-scsi is not available");
+        return;
+    }
+
     /* Start with a drive used by a device that unplugs instantaneously */
     qts = qtest_initf("-drive if=none,id=drive0,file=null-co://,"
                       "file.read-zeroes=on,format=raw"
@@ -232,6 +252,11 @@ static void test_cli_device_del(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip("Device virtio-blk is not available");
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -256,6 +281,11 @@ static void test_cli_device_del_q35(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip("Device virtio-blk is not available");
+        return;
+    }
+
     /*
      * -drive/-device and device_del.  Start with a drive used by a
      * device that unplugs after reset.
@@ -277,6 +307,11 @@ static void test_empty_device_del(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-scsi")) {
+        g_test_skip("Device virtio-scsi is not available");
+        return;
+    }
+
     /* device_del with no drive plugged.  */
     qts = qtest_initf("-device virtio-scsi-%s -device scsi-cd,id=dev0",
                       qvirtio_get_dev_type());
@@ -291,6 +326,11 @@ static void test_device_add_and_del(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip("Device virtio-blk is not available");
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -330,6 +370,11 @@ static void test_device_add_and_del_q35(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip("Device virtio-blk is not available");
+        return;
+    }
+
     /*
      * -drive/device_add and device_del.  Start with a drive used by a
      * device that unplugs after reset.
@@ -352,6 +397,11 @@ static void test_drive_add_device_add_and_del(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip("Device virtio-blk is not available");
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -374,6 +424,11 @@ static void test_drive_add_device_add_and_del_q35(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip("Device virtio-blk is not available");
+        return;
+    }
+
     qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
                      "-device pcie-pci-bridge,bus=p1,id=b1");
 
@@ -395,6 +450,11 @@ static void test_blockdev_add_device_add_and_del(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip("Device virtio-blk is not available");
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -417,6 +477,11 @@ static void test_blockdev_add_device_add_and_del_q35(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip("Device virtio-blk is not available");
+        return;
+    }
+
     qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
                      "-device pcie-pci-bridge,bus=p1,id=b1");
 
-- 
2.31.1


