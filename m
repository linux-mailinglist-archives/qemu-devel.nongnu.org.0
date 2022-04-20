Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E0750861C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:39:49 +0200 (CEST)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7kS-0005g4-5V
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eQ-0001PQ-7t
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eJ-0006rM-Ee
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650450805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lL5and8kZUsfM8M6XbWjVP0wSC6Lu9hMEGeUDMTXHFs=;
 b=aG6QLGk3qKIBbpuNO6HYJnO8Ddtlr0NN01nOrjWgvQ//caq9DrCyvaPf5+LH8C9bxF6WZ/
 fsNinq6TcdI3drsegfJUTn9xpFPqpG1xrBSo6qE9DrXW5Txo0XR4kglKslwgc6DFwM8BAG
 0U2sYR/TaiYHKo/GuwLHvRF9amQRj3s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-9KgYBr7hMoqAYHsxTgpSdg-1; Wed, 20 Apr 2022 06:33:22 -0400
X-MC-Unique: 9KgYBr7hMoqAYHsxTgpSdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4B081014A60;
 Wed, 20 Apr 2022 10:33:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AED99C44AE1;
 Wed, 20 Apr 2022 10:33:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/7] tests/qtest: Move the fuzz tests to x86 only
Date: Wed, 20 Apr 2022 12:33:05 +0200
Message-Id: <20220420103309.264479-4-thuth@redhat.com>
In-Reply-To: <20220420103309.264479-1-thuth@redhat.com>
References: <20220420103309.264479-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fuzz tests are currently scheduled for all targets, but their setup
code limits the run to "i386", so that these tests always show "SKIP"
on other targets. Move it to the right x86 list in meson.build, then
we can drop the architecture check during runtime, too.

Message-Id: <20220414130127.719528-1-thuth@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz-lsi53c895a-test.c  |  8 ++------
 tests/qtest/fuzz-megasas-test.c     | 12 ++++--------
 tests/qtest/fuzz-sb16-test.c        | 12 ++++--------
 tests/qtest/fuzz-sdcard-test.c      | 12 ++++--------
 tests/qtest/fuzz-virtio-scsi-test.c |  8 ++------
 tests/qtest/meson.build             | 13 ++++++-------
 6 files changed, 22 insertions(+), 43 deletions(-)

diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index ba5d468970..031d9de241 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -39,14 +39,10 @@ static void test_lsi_do_dma_empty_queue(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
-
     g_test_init(&argc, &argv, NULL);
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
-                       test_lsi_do_dma_empty_queue);
-    }
+    qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
+                   test_lsi_do_dma_empty_queue);
 
     return g_test_run();
 }
diff --git a/tests/qtest/fuzz-megasas-test.c b/tests/qtest/fuzz-megasas-test.c
index e1141c58a4..129b182f83 100644
--- a/tests/qtest/fuzz-megasas-test.c
+++ b/tests/qtest/fuzz-megasas-test.c
@@ -64,16 +64,12 @@ static void test_gitlab_issue521_megasas_sgl_ovf(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
-
     g_test_init(&argc, &argv, NULL);
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
-                       test_lp1878263_megasas_zero_iov_cnt);
-        qtest_add_func("fuzz/gitlab_issue521_megasas_sgl_ovf",
-                       test_gitlab_issue521_megasas_sgl_ovf);
-    }
+    qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
+                   test_lp1878263_megasas_zero_iov_cnt);
+    qtest_add_func("fuzz/gitlab_issue521_megasas_sgl_ovf",
+                   test_gitlab_issue521_megasas_sgl_ovf);
 
     return g_test_run();
 }
diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
index f47a8bcdbd..91fdcd1e8a 100644
--- a/tests/qtest/fuzz-sb16-test.c
+++ b/tests/qtest/fuzz-sb16-test.c
@@ -55,15 +55,11 @@ static void test_fuzz_sb16_0xd4(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
-
     g_test_init(&argc, &argv, NULL);
 
-   if (strcmp(arch, "i386") == 0) {
-        qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c);
-        qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91);
-        qtest_add_func("fuzz/test_fuzz_sb16/d4", test_fuzz_sb16_0xd4);
-   }
+    qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c);
+    qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91);
+    qtest_add_func("fuzz/test_fuzz_sb16/d4", test_fuzz_sb16_0xd4);
 
-   return g_test_run();
+    return g_test_run();
 }
diff --git a/tests/qtest/fuzz-sdcard-test.c b/tests/qtest/fuzz-sdcard-test.c
index 0f94965a66..d0f4e0e93c 100644
--- a/tests/qtest/fuzz-sdcard-test.c
+++ b/tests/qtest/fuzz-sdcard-test.c
@@ -164,15 +164,11 @@ static void oss_fuzz_36391(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
-
     g_test_init(&argc, &argv, NULL);
 
-   if (strcmp(arch, "i386") == 0) {
-        qtest_add_func("fuzz/sdcard/oss_fuzz_29225", oss_fuzz_29225);
-        qtest_add_func("fuzz/sdcard/oss_fuzz_36217", oss_fuzz_36217);
-        qtest_add_func("fuzz/sdcard/oss_fuzz_36391", oss_fuzz_36391);
-   }
+    qtest_add_func("fuzz/sdcard/oss_fuzz_29225", oss_fuzz_29225);
+    qtest_add_func("fuzz/sdcard/oss_fuzz_36217", oss_fuzz_36217);
+    qtest_add_func("fuzz/sdcard/oss_fuzz_36391", oss_fuzz_36391);
 
-   return g_test_run();
+    return g_test_run();
 }
diff --git a/tests/qtest/fuzz-virtio-scsi-test.c b/tests/qtest/fuzz-virtio-scsi-test.c
index aaf6d10e18..c9b6fe2123 100644
--- a/tests/qtest/fuzz-virtio-scsi-test.c
+++ b/tests/qtest/fuzz-virtio-scsi-test.c
@@ -62,14 +62,10 @@ static void test_mmio_oob_from_memory_region_cache(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
-
     g_test_init(&argc, &argv, NULL);
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
-                       test_mmio_oob_from_memory_region_cache);
-    }
+    qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
+                   test_mmio_oob_from_memory_region_cache);
 
     return g_test_run();
 }
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 1709fc6ccb..22e1361210 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -17,13 +17,7 @@ slow_qtests = {
   'test-hmp' : 120,
 }
 
-qtests_generic = \
-  (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') ? ['fuzz-lsi53c895a-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) + \
-  [
+qtests_generic = [
   'cdrom-test',
   'device-introspect-test',
   'machine-none-test',
@@ -67,6 +61,11 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
+  (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) +    \
+  (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') ? ['fuzz-lsi53c895a-test'] : []) +     \
+  (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) +     \
+  (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) +                   \
+  (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
   (config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                        \
   (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
-- 
2.27.0


