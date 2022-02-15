Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A2D4B7029
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:32:47 +0100 (CET)
Received: from localhost ([::1]:38102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0kw-0002Io-Ry
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:32:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK0f8-0003fC-I4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:26:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK0f6-0001a8-0O
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644942403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCecIkSfLDbD9L4WU/0h5uVxpUqPhLXRetd8WA8JqGw=;
 b=Pj56V35LM0eOtXVuqjUbSh3slhEQTKhX0ecou04SuVTLuShEbEhiiPp6mn6+x6LrmcCQku
 PxnejvmaeCEcV5Uno43czDn7xVf91mOEogtWRPwDqSUgnU3C92khbkZtbAAuW0JbQO38Dx
 RIwayhQsJIJYCfcuCvRYubeC7S34X+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-M73fEd_qOlOgwcs1i3uHrA-1; Tue, 15 Feb 2022 11:26:40 -0500
X-MC-Unique: M73fEd_qOlOgwcs1i3uHrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41EDB1091DA0;
 Tue, 15 Feb 2022 16:26:39 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B338910A48D2;
 Tue, 15 Feb 2022 16:26:37 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 mst@redhat.com, thuth@redhat.com, berrange@redhat.com, quintela@redhat.com
Subject: [PATCH 2/3] tests/x86: Use 'pc' machine type for hotplug tests
Date: Tue, 15 Feb 2022 16:25:32 +0000
Message-Id: <20220215162537.605030-3-dgilbert@redhat.com>
In-Reply-To: <20220215162537.605030-1-dgilbert@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hotplug tests need a bridge setting up on q35, for now
keep them on 'pc'.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/device-plug-test.c | 20 +++++++++++++++++--
 tests/qtest/drive_del-test.c   | 35 +++++++++++++++++++++++++++++-----
 tests/qtest/hd-geo-test.c      |  4 ++--
 tests/qtest/ivshmem-test.c     |  7 ++++++-
 4 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index ad79bd4c14..404a92e132 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -63,7 +63,15 @@ static void wait_device_deleted_event(QTestState *qtest, const char *id)
 
 static void test_pci_unplug_request(void)
 {
-    QTestState *qtest = qtest_initf("-device virtio-mouse-pci,id=dev0");
+    const char *arch = qtest_get_arch();
+    const char *machine_addition = "";
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        machine_addition = "-machine pc";
+    }
+
+    QTestState *qtest = qtest_initf("%s -device virtio-mouse-pci,id=dev0",
+                                    machine_addition);
 
     /*
      * Request device removal. As the guest is not running, the request won't
@@ -79,8 +87,16 @@ static void test_pci_unplug_request(void)
 
 static void test_pci_unplug_json_request(void)
 {
+    const char *arch = qtest_get_arch();
+    const char *machine_addition = "";
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        machine_addition = "-machine pc";
+    }
+
     QTestState *qtest = qtest_initf(
-        "-device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'");
+        "%s -device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'",
+        machine_addition);
 
     /*
      * Request device removal. As the guest is not running, the request won't
diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 8d08ee9995..0cc18dfa4a 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -235,14 +235,21 @@ static void test_drive_del_device_del(void)
 static void test_cli_device_del(void)
 {
     QTestState *qts;
+    const char *arch = qtest_get_arch();
+    const char *machine_addition = "";
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        machine_addition = "-machine pc";
+    }
 
     /*
      * -drive/-device and device_del.  Start with a drive used by a
      * device that unplugs after reset.
      */
-    qts = qtest_initf("-drive if=none,id=drive0,file=null-co://,"
+    qts = qtest_initf("%s -drive if=none,id=drive0,file=null-co://,"
                       "file.read-zeroes=on,format=raw"
                       " -device virtio-blk-%s,drive=drive0,id=dev0",
+                      machine_addition,
                       qvirtio_get_dev_type());
 
     device_del(qts, true);
@@ -266,13 +273,19 @@ static void test_empty_device_del(void)
 static void test_device_add_and_del(void)
 {
     QTestState *qts;
+    const char *arch = qtest_get_arch();
+    const char *machine_addition = "";
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        machine_addition = "-machine pc";
+    }
 
     /*
      * -drive/device_add and device_del.  Start with a drive used by a
      * device that unplugs after reset.
      */
-    qts = qtest_init("-drive if=none,id=drive0,file=null-co://,"
-                     "file.read-zeroes=on,format=raw");
+    qts = qtest_initf("%s -drive if=none,id=drive0,file=null-co://,"
+                     "file.read-zeroes=on,format=raw", machine_addition);
 
     device_add(qts);
     device_del(qts, true);
@@ -284,8 +297,14 @@ static void test_device_add_and_del(void)
 static void test_drive_add_device_add_and_del(void)
 {
     QTestState *qts;
+    const char *arch = qtest_get_arch();
+    const char *machine_addition = "";
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        machine_addition = "-machine pc";
+    }
 
-    qts = qtest_init("");
+    qts = qtest_init(machine_addition);
 
     /*
      * drive_add/device_add and device_del.  The drive is used by a
@@ -302,8 +321,14 @@ static void test_drive_add_device_add_and_del(void)
 static void test_blockdev_add_device_add_and_del(void)
 {
     QTestState *qts;
+    const char *arch = qtest_get_arch();
+    const char *machine_addition = "";
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        machine_addition = "-machine pc";
+    }
 
-    qts = qtest_init("");
+    qts = qtest_init(machine_addition);
 
     /*
      * blockdev_add/device_add and device_del.  The it drive is used by a
diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 3554b5d500..64023c0574 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -839,7 +839,7 @@ static void test_override_scsi_hot_unplug(void)
 
     joined_args = g_strjoinv(" ", args->argv);
 
-    qts = qtest_init(joined_args);
+    qts = qtest_initf("-machine pc %s", joined_args);
     fw_cfg = pc_fw_cfg_init(qts);
 
     read_bootdevices(fw_cfg, expected);
@@ -899,7 +899,7 @@ static void test_override_virtio_hot_unplug(void)
 
     joined_args = g_strjoinv(" ", args->argv);
 
-    qts = qtest_init(joined_args);
+    qts = qtest_initf("-machine pc %s", joined_args);
     fw_cfg = pc_fw_cfg_init(qts);
 
     read_bootdevices(fw_cfg, expected);
diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index fe94dd3b96..4e8af42a9d 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -385,7 +385,12 @@ static void test_ivshmem_hotplug(void)
     QTestState *qts;
     const char *arch = qtest_get_arch();
 
-    qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1");
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1"
+                         " -machine pc");
+    } else {
+        qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1");
+    }
 
     qtest_qmp_device_add(qts, "ivshmem-plain", "iv1",
                          "{'addr': %s, 'memdev': 'mb1'}",
-- 
2.35.1


