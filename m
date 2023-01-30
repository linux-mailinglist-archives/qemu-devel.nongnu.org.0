Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9AA680B36
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 11:47:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMRfL-0006zK-KV; Mon, 30 Jan 2023 05:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMRen-0006wo-1C
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:45:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMRel-0001aP-KL
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675075498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJElCQr2nWuSL3iyN67l61u7vM5kM2BGZVBIaN/UN4I=;
 b=eFIukChBfwcDc71aJG4YQoD7WDEQlyz6mXdXOK5AbPhczJX0Geea5yBauzT8ypoDt0leBs
 imUEmts8XZoPDeUTUMlRXaukNC/FbbS4m0JL+eMdtazsciFXtVLc+rCwB+MtzHLt4Fg9Mj
 eQLpGQaaFAE7rTsGleOFx54Jvr/UbSs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-DHVYQjLgOXqtFKUSdTfhKw-1; Mon, 30 Jan 2023 05:44:54 -0500
X-MC-Unique: DHVYQjLgOXqtFKUSdTfhKw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F41021C07552;
 Mon, 30 Jan 2023 10:44:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C535D492B02;
 Mon, 30 Jan 2023 10:44:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 3/6] tests/qtest/display-vga-test: Add proper checks if a
 device is available
Date: Mon, 30 Jan 2023 11:44:43 +0100
Message-Id: <20230130104446.1286773-4-thuth@redhat.com>
In-Reply-To: <20230130104446.1286773-1-thuth@redhat.com>
References: <20230130104446.1286773-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

display-vga-test currently tries to guess the usable VGA devices
according to the target architecture that is used for the test.
This of course does not work if QEMU has been built with the
"--without-default-devices" configure switch. To fix this, use the
qtest_has_device() function for the decision instead. This way
we can also consolidate most of the test functions into one single
function (that takes a parameter with the device name now), except
for the multihead test that tries to instantiate two devices and
thus is a little bit different.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/display-vga-test.c | 65 +++++++++++++---------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/tests/qtest/display-vga-test.c b/tests/qtest/display-vga-test.c
index ace3bb28e0..1a26a66061 100644
--- a/tests/qtest/display-vga-test.c
+++ b/tests/qtest/display-vga-test.c
@@ -8,61 +8,46 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest-single.h"
-
-static void pci_cirrus(void)
-{
-    qtest_start("-vga none -device cirrus-vga");
-    qtest_end();
-}
-
-static void pci_stdvga(void)
-{
-    qtest_start("-vga none -device VGA");
-    qtest_end();
-}
-
-static void pci_secondary(void)
-{
-    qtest_start("-vga none -device secondary-vga");
-    qtest_end();
-}
+#include "libqtest.h"
 
 static void pci_multihead(void)
 {
-    qtest_start("-vga none -device VGA -device secondary-vga");
-    qtest_end();
-}
+    QTestState *qts;
 
-static void pci_virtio_gpu(void)
-{
-    qtest_start("-vga none -device virtio-gpu-pci");
-    qtest_end();
+    qts = qtest_init("-vga none -device VGA -device secondary-vga");
+    qtest_quit(qts);
 }
 
-static void pci_virtio_vga(void)
+static void test_vga(gconstpointer data)
 {
-    qtest_start("-vga none -device virtio-vga");
-    qtest_end();
+    QTestState *qts;
+
+    qts = qtest_initf("-vga none -device %s", (const char *)data);
+    qtest_quit(qts);
 }
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
+    const char *devices[] = {
+        "cirrus-vga",
+        "VGA",
+        "secondary-vga",
+        "virtio-gpu-pci",
+        "virtio-vga"
+    };
 
     g_test_init(&argc, &argv, NULL);
 
-    if (strcmp(arch, "alpha") == 0 || strcmp(arch, "i386") == 0 ||
-        strcmp(arch, "mips") == 0 || strcmp(arch, "x86_64") == 0) {
-        qtest_add_func("/display/pci/cirrus", pci_cirrus);
+    for (int i = 0; i < ARRAY_SIZE(devices); i++) {
+        if (qtest_has_device(devices[i])) {
+            char *testpath = g_strdup_printf("/display/pci/%s", devices[i]);
+            qtest_add_data_func(testpath, devices[i], test_vga);
+            g_free(testpath);
+        }
     }
-    qtest_add_func("/display/pci/stdvga", pci_stdvga);
-    qtest_add_func("/display/pci/secondary", pci_secondary);
-    qtest_add_func("/display/pci/multihead", pci_multihead);
-    qtest_add_func("/display/pci/virtio-gpu", pci_virtio_gpu);
-    if (g_str_equal(arch, "i386") || g_str_equal(arch, "x86_64") ||
-        g_str_equal(arch, "hppa") || g_str_equal(arch, "ppc64")) {
-        qtest_add_func("/display/pci/virtio-vga", pci_virtio_vga);
+
+    if (qtest_has_device("secondary-vga")) {
+        qtest_add_func("/display/pci/multihead", pci_multihead);
     }
 
     return g_test_run();
-- 
2.31.1


