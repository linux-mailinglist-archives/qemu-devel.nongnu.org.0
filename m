Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB568C0ED
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:07:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP34p-0003rk-HA; Mon, 06 Feb 2023 10:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34m-0003r8-Su
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:36 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34k-0008PI-Ve
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:36 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D45943F458;
 Mon,  6 Feb 2023 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675695993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gThNfP6Ml2oVg/SfCswVI8P1z1B+P2O76UmDUlqm5UY=;
 b=m1r3o71KMDsD2xaEhSEmU0kTe5wmQRuga+GmI/waA06KjTExBSp8PjxbkdtGhJelT0syBe
 6M8sfvXgXwrxJOht9bUVoOLLOIPuLuFi4lCeMuCPsWJTwMiy0C92VSyAYG5TDwe4z7WxTU
 ewqdrWm6ys2Kg4qJUwUKYkZ0eStSU5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675695993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gThNfP6Ml2oVg/SfCswVI8P1z1B+P2O76UmDUlqm5UY=;
 b=nAmbg7G95xSQjHDjxcHlSH1818JVoyIXcMoHHcfVY0Y8GDZtjb2/co1x6gEtffMJzSGQtP
 SEWsd6o8VLwkKVBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8754E138E8;
 Mon,  6 Feb 2023 15:06:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8GsrFHgX4WPSXwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 15:06:32 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 07/12] tests/qtest: drive_del-test: Skip tests that require
 missing devices
Date: Mon,  6 Feb 2023 12:04:11 -0300
Message-Id: <20230206150416.4604-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206150416.4604-1-farosas@suse.de>
References: <20230206150416.4604-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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
---
 tests/qtest/drive_del-test.c | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 9a750395a9..6fa96fa94a 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -16,6 +16,21 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 
+static const char *qvirtio_get_dev_type(void);
+
+/*
+ * This covers the possible absence of a device due to QEMU build
+ * options.
+ */
+static bool look_for_device_builtin(const char *prefix, const char *suffix)
+{
+    gchar *device = g_strdup_printf("%s-%s", prefix, suffix);
+    bool rc = qtest_has_device(device);
+
+    g_free(device);
+    return rc;
+}
+
 static bool look_for_drive0(QTestState *qts, const char *command, const char *key)
 {
     QDict *response;
@@ -40,6 +55,11 @@ static bool look_for_drive0(QTestState *qts, const char *command, const char *ke
     return found;
 }
 
+static bool has_device_builtin(const char *dev)
+{
+    return look_for_device_builtin(dev, qvirtio_get_dev_type());
+}
+
 static bool has_drive(QTestState *qts)
 {
     return look_for_drive0(qts, "query-block", "device");
@@ -208,6 +228,11 @@ static void test_drive_del_device_del(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-scsi")) {
+        g_test_skip(NULL);
+        return;
+    }
+
     /* Start with a drive used by a device that unplugs instantaneously */
     qts = qtest_initf("-drive if=none,id=drive0,file=null-co://,"
                       "file.read-zeroes=on,format=raw"
@@ -232,6 +257,11 @@ static void test_cli_device_del(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip(NULL);
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -256,6 +286,11 @@ static void test_cli_device_del_q35(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip(NULL);
+        return;
+    }
+
     /*
      * -drive/-device and device_del.  Start with a drive used by a
      * device that unplugs after reset.
@@ -277,6 +312,11 @@ static void test_empty_device_del(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-scsi")) {
+        g_test_skip(NULL);
+        return;
+    }
+
     /* device_del with no drive plugged.  */
     qts = qtest_initf("-device virtio-scsi-%s -device scsi-cd,id=dev0",
                       qvirtio_get_dev_type());
@@ -291,6 +331,11 @@ static void test_device_add_and_del(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip(NULL);
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -330,6 +375,11 @@ static void test_device_add_and_del_q35(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip(NULL);
+        return;
+    }
+
     /*
      * -drive/device_add and device_del.  Start with a drive used by a
      * device that unplugs after reset.
@@ -352,6 +402,11 @@ static void test_drive_add_device_add_and_del(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip(NULL);
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -374,6 +429,11 @@ static void test_drive_add_device_add_and_del_q35(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip(NULL);
+        return;
+    }
+
     qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
                      "-device pcie-pci-bridge,bus=p1,id=b1");
 
@@ -395,6 +455,11 @@ static void test_blockdev_add_device_add_and_del(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip(NULL);
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -417,6 +482,11 @@ static void test_blockdev_add_device_add_and_del_q35(void)
 {
     QTestState *qts;
 
+    if (!has_device_builtin("virtio-blk")) {
+        g_test_skip(NULL);
+        return;
+    }
+
     qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
                      "-device pcie-pci-bridge,bus=p1,id=b1");
 
-- 
2.35.3


