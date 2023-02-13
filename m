Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A756952C6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 22:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRg5R-0007F3-6A; Mon, 13 Feb 2023 16:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pRg5M-0007EQ-QX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 16:10:04 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pRg5J-00011z-Qo
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 16:10:04 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C3DE320357;
 Mon, 13 Feb 2023 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676322598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fhrv9KAWG4tYYMfFMlQHvhWFeL/ATKiHt/+TeK+VO9c=;
 b=jqKFluKa18ZotHqAJ8fYKcrqNzhAduteMTDfPs+Dhekpwh1kkBclMK3pi1cDJurDvleRAM
 UxbR0/bAxv4+XNVRcngjBWN6UxT1drg+U0Gedz+WUbpsaxN5AkOGAJygfwaGPrpdtxAGcc
 SG2F7YZ6aSFDO6hH7BwGbTw8l8evdfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676322598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fhrv9KAWG4tYYMfFMlQHvhWFeL/ATKiHt/+TeK+VO9c=;
 b=2Db0TcmOgD9wniQCEkUh6Bm1pxz0POYJ1UBlfFfUQHo/RHDFs2L3WSIfQOvHYHrigSJZAX
 sL4l539sRxA9i7Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F53E138E6;
 Mon, 13 Feb 2023 21:09:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aEmuCSWn6mPoRAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 21:09:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 08/12] tests/qtest: drive_del-test: Skip tests that require
 missing devices
Date: Mon, 13 Feb 2023 18:07:34 -0300
Message-Id: <20230213210738.9719-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213210738.9719-1-farosas@suse.de>
References: <20230213210738.9719-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
2.35.3


