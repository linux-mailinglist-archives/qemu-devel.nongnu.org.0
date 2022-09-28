Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BC95ED8B0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:17:46 +0200 (CEST)
Received: from localhost ([::1]:38700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTCL-0002Uh-RQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRME-0001B5-Js
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRMB-00007L-Fg
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8AxJNbrXnXM74YtdDwjHtrcpQnMCAsAxLyt81poLNuY=;
 b=F+Re9L3/mYHFCWIn1vdkRd6ge5dBNo758hsnSbOLF6J4zV/0ZJ0DaygkMj8cFfvVxVrVvL
 VXianItJ8wxgxAWyJJ8RO7VoiMVkmWFXkf9TDlBfXIMlA7mU1qMfrqHYi3zJaEZzon7RVJ
 VBIaYmAslRUU8lILpqrtgdwlWJvInJw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-EWKPv9FzOHu8VfGKMXVKUQ-1; Wed, 28 Sep 2022 03:19:43 -0400
X-MC-Unique: EWKPv9FzOHu8VfGKMXVKUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A42B857FAB;
 Wed, 28 Sep 2022 07:19:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21E3340C83BB;
 Wed, 28 Sep 2022 07:19:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: [PULL 31/37] tests/x86: Move common code to function in
 device-plug-test
Date: Wed, 28 Sep 2022 09:18:37 +0200
Message-Id: <20220928071843.1468323-32-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
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

From: Michael Labiuk <michael.labiuk@virtuozzo.com>

Move common code for device removing to function.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
Message-Id: <20220920104842.605530-2-michael.labiuk@virtuozzo.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/device-plug-test.c | 42 ++++++++++++++--------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index a1fb99c8ff..e595b45b66 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -61,6 +61,18 @@ static void wait_device_deleted_event(QTestState *qtest, const char *id)
     }
 }
 
+static void process_device_remove(QTestState *qtest, const char *id)
+{
+    /*
+     * Request device removal. As the guest is not running, the request won't
+     * be processed. However during system reset, the removal will be
+     * handled, removing the device.
+     */
+    device_del(qtest, id);
+    system_reset(qtest);
+    wait_device_deleted_event(qtest, id);
+}
+
 static void test_pci_unplug_request(void)
 {
     const char *arch = qtest_get_arch();
@@ -73,14 +85,7 @@ static void test_pci_unplug_request(void)
     QTestState *qtest = qtest_initf("%s -device virtio-mouse-pci,id=dev0",
                                     machine_addition);
 
-    /*
-     * Request device removal. As the guest is not running, the request won't
-     * be processed. However during system reset, the removal will be
-     * handled, removing the device.
-     */
-    device_del(qtest, "dev0");
-    system_reset(qtest);
-    wait_device_deleted_event(qtest, "dev0");
+    process_device_remove(qtest, "dev0");
 
     qtest_quit(qtest);
 }
@@ -98,14 +103,7 @@ static void test_pci_unplug_json_request(void)
         "%s -device \"{'driver': 'virtio-mouse-pci', 'id': 'dev0'}\"",
         machine_addition);
 
-    /*
-     * Request device removal. As the guest is not running, the request won't
-     * be processed. However during system reset, the removal will be
-     * handled, removing the device.
-     */
-    device_del(qtest, "dev0");
-    system_reset(qtest);
-    wait_device_deleted_event(qtest, "dev0");
+    process_device_remove(qtest, "dev0");
 
     qtest_quit(qtest);
 }
@@ -128,9 +126,7 @@ static void test_spapr_cpu_unplug_request(void)
                         "-device power9_v2.0-spapr-cpu-core,core-id=1,id=dev0");
 
     /* similar to test_pci_unplug_request */
-    device_del(qtest, "dev0");
-    system_reset(qtest);
-    wait_device_deleted_event(qtest, "dev0");
+    process_device_remove(qtest, "dev0");
 
     qtest_quit(qtest);
 }
@@ -144,9 +140,7 @@ static void test_spapr_memory_unplug_request(void)
                         "-device pc-dimm,id=dev0,memdev=mem0");
 
     /* similar to test_pci_unplug_request */
-    device_del(qtest, "dev0");
-    system_reset(qtest);
-    wait_device_deleted_event(qtest, "dev0");
+    process_device_remove(qtest, "dev0");
 
     qtest_quit(qtest);
 }
@@ -158,9 +152,7 @@ static void test_spapr_phb_unplug_request(void)
     qtest = qtest_initf("-device spapr-pci-host-bridge,index=1,id=dev0");
 
     /* similar to test_pci_unplug_request */
-    device_del(qtest, "dev0");
-    system_reset(qtest);
-    wait_device_deleted_event(qtest, "dev0");
+    process_device_remove(qtest, "dev0");
 
     qtest_quit(qtest);
 }
-- 
2.31.1


