Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E9C696256
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:23:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtO5-0007FE-B8; Tue, 14 Feb 2023 06:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtO3-0007Ee-Fk
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtO1-0002LV-Ti
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXC5uUKH3sRKisV5CEfIbm8aKEjeO6mLbuG7HjDpjn0=;
 b=NzvklE8bnYVQer60ViEFy81RTkmRSI340ten5KnPPEnNaTmiY0oUDnQ1pyElSOm2yt5Khh
 rrK4OaKNDKxCBtpzrUQOPcv3z8blTMaEzjTLd0RlmJ0ShdBrqBZvy6jPZBKMnbzxTS73DN
 I01XRRmFlpzcB5G66d1K8yxaoW2S06s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-aIGRpst1PAe59qQTzmjebw-1; Tue, 14 Feb 2023 06:22:10 -0500
X-MC-Unique: aIGRpst1PAe59qQTzmjebw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D02EF1C06EC8;
 Tue, 14 Feb 2023 11:22:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E541E40B40C9;
 Tue, 14 Feb 2023 11:22:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>
Subject: [PULL 14/22] tests/qtest: Skip unplug tests that use missing devices
Date: Tue, 14 Feb 2023 12:21:40 +0100
Message-Id: <20230214112148.646077-15-thuth@redhat.com>
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
Message-Id: <20230208194700.11035-8-farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/device-plug-test.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 4f92617335..01cecd6e20 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -68,6 +68,11 @@ static void test_pci_unplug_request(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!qtest_has_device("virtio-mouse-pci")) {
+        g_test_skip("Device virtio-mouse-pci not available");
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -82,11 +87,17 @@ static void test_pci_unplug_request(void)
 
 static void test_q35_pci_unplug_request(void)
 {
+    QTestState *qtest;
+
+    if (!qtest_has_device("virtio-mouse-pci")) {
+        g_test_skip("Device virtio-mouse-pci not available");
+        return;
+    }
 
-    QTestState *qtest = qtest_initf("-machine q35 "
-                                    "-device pcie-root-port,id=p1 "
-                                    "-device pcie-pci-bridge,bus=p1,id=b1 "
-                                    "-device virtio-mouse-pci,bus=b1,id=dev0");
+    qtest = qtest_initf("-machine q35 "
+                        "-device pcie-root-port,id=p1 "
+                        "-device pcie-pci-bridge,bus=p1,id=b1 "
+                        "-device virtio-mouse-pci,bus=b1,id=dev0");
 
     process_device_remove(qtest, "dev0");
 
@@ -99,6 +110,11 @@ static void test_pci_unplug_json_request(void)
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
+    if (!qtest_has_device("virtio-mouse-pci")) {
+        g_test_skip("Device virtio-mouse-pci not available");
+        return;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         machine_addition = "-machine pc";
     }
@@ -114,6 +130,7 @@ static void test_pci_unplug_json_request(void)
 
 static void test_q35_pci_unplug_json_request(void)
 {
+    QTestState *qtest;
     const char *port = "-device \"{'driver': 'pcie-root-port', "
                                   "'id': 'p1'}\"";
 
@@ -125,8 +142,12 @@ static void test_q35_pci_unplug_json_request(void)
                                     "'bus': 'b1', "
                                     "'id': 'dev0'}\"";
 
-    QTestState *qtest = qtest_initf("-machine q35 %s %s %s",
-                                    port, bridge, device);
+    if (!qtest_has_device("virtio-mouse-pci")) {
+        g_test_skip("Device virtio-mouse-pci not available");
+        return;
+    }
+
+    qtest = qtest_initf("-machine q35 %s %s %s", port, bridge, device);
 
     process_device_remove(qtest, "dev0");
 
-- 
2.31.1


