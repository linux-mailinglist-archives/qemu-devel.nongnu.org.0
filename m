Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1886A5FC786
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:38:14 +0200 (CEST)
Received: from localhost ([::1]:44956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oics8-0002JH-QO
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicna-00054R-E1
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnX-0006k3-IT
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXxLdExdrIsQYQCjHc+PuZG7XWRORaCdMFxrBy0CRn0=;
 b=AG4B4/K/gQt8YM31FU/U3z5OsZ7gYXljub3EbQmbC/RAH0Tm/bPZa06RIn/BOEATj4Y0+J
 Mf2ZUXe4AqJcGHo5hGqHfNX+5VqlwtPoimkBfb6byz6cgNIpEmtZlHiFCdIYHgzOTl8R0P
 sLSx1o76erjmkJcTpCZeuF/Nn+mG52c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-YCYeuqkQPQKu34B9te-o5Q-1; Wed, 12 Oct 2022 10:33:25 -0400
X-MC-Unique: YCYeuqkQPQKu34B9te-o5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49180299E751;
 Wed, 12 Oct 2022 14:33:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89AA72144B20;
 Wed, 12 Oct 2022 14:33:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: [PULL 05/16] tests/x86: Refactor hot unplug hd-geo-test
Date: Wed, 12 Oct 2022 16:33:05 +0200
Message-Id: <20221012143316.988561-6-thuth@redhat.com>
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Michael Labiuk <michael.labiuk@virtuozzo.com>

Moving common code to function.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
Message-Id: <20220929223547.1429580-4-michael.labiuk@virtuozzo.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/hd-geo-test.c | 110 ++++++++++++++------------------------
 1 file changed, 40 insertions(+), 70 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index ba772f4d7a..61f4c24b81 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -691,7 +691,8 @@ static void add_virtio_disk(TestArgs *args,
     args->n_virtio_disks++;
 }
 
-static void test_override(TestArgs *args, CHSResult expected[])
+static void test_override(TestArgs *args, const char *arch,
+                          CHSResult expected[])
 {
     QTestState *qts;
     char *joined_args;
@@ -700,7 +701,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
 
     joined_args = g_strjoinv(" ", args->argv);
 
-    qts = qtest_initf("-machine pc %s", joined_args);
+    qts = qtest_initf("-machine %s %s", arch, joined_args);
     fw_cfg = pc_fw_cfg_init(qts);
 
     read_bootdevices(fw_cfg, expected);
@@ -737,7 +738,7 @@ static void test_override_ide(void)
     add_ide_disk(args, 1, 0, 1, 9000, 120, 30);
     add_ide_disk(args, 2, 1, 0, 0, 1, 1);
     add_ide_disk(args, 3, 1, 1, 1, 0, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
 }
 
 static void test_override_scsi(void)
@@ -759,7 +760,7 @@ static void test_override_scsi(void)
     add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
     add_scsi_disk(args, 2, 0, 0, 2, 0, 1, 0, 0);
     add_scsi_disk(args, 3, 0, 0, 3, 0, 0, 1, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
 }
 
 static void test_override_scsi_2_controllers(void)
@@ -782,7 +783,7 @@ static void test_override_scsi_2_controllers(void)
     add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
     add_scsi_disk(args, 2, 1, 0, 0, 1, 1, 0, 0);
     add_scsi_disk(args, 3, 1, 0, 1, 2, 0, 1, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
 }
 
 static void test_override_virtio_blk(void)
@@ -797,7 +798,7 @@ static void test_override_virtio_blk(void)
     add_drive_with_mbr(args, empty_mbr, 1);
     add_virtio_disk(args, 0, "pci.0", 3, 10000, 120, 30);
     add_virtio_disk(args, 1, "pci.0", 4, 9000, 120, 30);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
 }
 
 static void test_override_zero_chs(void)
@@ -808,46 +809,28 @@ static void test_override_zero_chs(void)
     };
     add_drive_with_mbr(args, empty_mbr, 1);
     add_ide_disk(args, 0, 1, 1, 0, 0, 0);
-    test_override(args, expected);
+    test_override(args, "pc", expected);
 }
 
-static void test_override_scsi_hot_unplug(void)
+static void test_override_hot_unplug(TestArgs *args, const char *devid,
+                                     CHSResult expected[], CHSResult expected2[])
 {
     QTestState *qts;
     char *joined_args;
     QFWCFG *fw_cfg;
     QDict *response;
     int i;
-    TestArgs *args = create_args();
-    CHSResult expected[] = {
-        {"/pci@i0cf8/scsi@2/channel@0/disk@0,0", {10000, 120, 30} },
-        {"/pci@i0cf8/scsi@2/channel@0/disk@1,0", {20, 20, 20} },
-        {NULL, {0, 0, 0} }
-    };
-    CHSResult expected2[] = {
-        {"/pci@i0cf8/scsi@2/channel@0/disk@1,0", {20, 20, 20} },
-        {NULL, {0, 0, 0} }
-    };
-    add_drive_with_mbr(args, empty_mbr, 1);
-    add_drive_with_mbr(args, empty_mbr, 1);
-    add_scsi_controller(args, "virtio-scsi-pci", "pci.0", 2);
-    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
-    add_scsi_disk(args, 1, 0, 0, 1, 0, 20, 20, 20);
 
     joined_args = g_strjoinv(" ", args->argv);
 
-    qts = qtest_initf("-machine pc %s", joined_args);
+    qts = qtest_initf("%s", joined_args);
     fw_cfg = pc_fw_cfg_init(qts);
 
     read_bootdevices(fw_cfg, expected);
 
     /* unplug device an restart */
-    response = qtest_qmp(qts,
-                         "{ 'execute': 'device_del',"
-                         "  'arguments': {'id': 'scsi-disk0' }}");
-    g_assert(response);
-    g_assert(!qdict_haskey(response, "error"));
-    qobject_unref(response);
+    qtest_qmp_device_del_send(qts, devid);
+
     response = qtest_qmp(qts,
                          "{ 'execute': 'system_reset', 'arguments': { }}");
     g_assert(response);
@@ -872,13 +855,32 @@ static void test_override_scsi_hot_unplug(void)
     g_free(args);
 }
 
+static void test_override_scsi_hot_unplug(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/scsi@2/channel@0/disk@0,0", {10000, 120, 30} },
+        {"/pci@i0cf8/scsi@2/channel@0/disk@1,0", {20, 20, 20} },
+        {NULL, {0, 0, 0} }
+    };
+    CHSResult expected2[] = {
+        {"/pci@i0cf8/scsi@2/channel@0/disk@1,0", {20, 20, 20} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_scsi_controller(args, "virtio-scsi-pci", "pci.0", 2);
+    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
+    add_scsi_disk(args, 1, 0, 0, 1, 0, 20, 20, 20);
+
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE,
+                            g_strdup("-machine pc"));
+
+    test_override_hot_unplug(args, "scsi-disk0", expected, expected2);
+}
+
 static void test_override_virtio_hot_unplug(void)
 {
-    QTestState *qts;
-    char *joined_args;
-    QFWCFG *fw_cfg;
-    QDict *response;
-    int i;
     TestArgs *args = create_args();
     CHSResult expected[] = {
         {"/pci@i0cf8/scsi@2/disk@0,0", {10000, 120, 30} },
@@ -894,42 +896,10 @@ static void test_override_virtio_hot_unplug(void)
     add_virtio_disk(args, 0, "pci.0", 2, 10000, 120, 30);
     add_virtio_disk(args, 1, "pci.0", 3, 20, 20, 20);
 
-    joined_args = g_strjoinv(" ", args->argv);
-
-    qts = qtest_initf("-machine pc %s", joined_args);
-    fw_cfg = pc_fw_cfg_init(qts);
-
-    read_bootdevices(fw_cfg, expected);
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE,
+                            g_strdup("-machine pc"));
 
-    /* unplug device an restart */
-    response = qtest_qmp(qts,
-                         "{ 'execute': 'device_del',"
-                         "  'arguments': {'id': 'virtio-disk0' }}");
-    g_assert(response);
-    g_assert(!qdict_haskey(response, "error"));
-    qobject_unref(response);
-    response = qtest_qmp(qts,
-                         "{ 'execute': 'system_reset', 'arguments': { }}");
-    g_assert(response);
-    g_assert(!qdict_haskey(response, "error"));
-    qobject_unref(response);
-
-    qtest_qmp_eventwait(qts, "RESET");
-
-    read_bootdevices(fw_cfg, expected2);
-
-    g_free(joined_args);
-    qtest_quit(qts);
-
-    g_free(fw_cfg);
-
-    for (i = 0; i < args->n_drives; i++) {
-        unlink(args->drives[i]);
-        g_free(args->drives[i]);
-    }
-    g_free(args->drives);
-    g_strfreev(args->argv);
-    g_free(args);
+    test_override_hot_unplug(args, "virtio-disk0", expected, expected2);
 }
 
 int main(int argc, char **argv)
-- 
2.31.1


