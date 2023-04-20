Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6346E8FD0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:16:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHo-00013K-2b; Thu, 20 Apr 2023 06:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHg-0000y5-26
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:13:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHZ-00083u-0s
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zplY9Mqt4y0eqW3HKI6vBQ/AHzAMZVbgtYUPQClrVEA=;
 b=IGt1PiLrjSGs2liNDHAyM9EUhpnOqzzYMfBvgaNwy8Y53oxxnBrAIVcQ0KGMQ9Pq/GzVHi
 xL/+GVsriit1YHobwKscEQgBu2U/2zM0bTPPB0F+CJENG4vhT8Rz4e8H8HpDj1yKrRWUDA
 3mw0A8yQIRPnElXB3pO4/FpFfyOYH/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-lL-Cl4khMXmZIDYfe67zrw-1; Thu, 20 Apr 2023 06:12:47 -0400
X-MC-Unique: lL-Cl4khMXmZIDYfe67zrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC17385A5A3;
 Thu, 20 Apr 2023 10:12:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3EFC440BC;
 Thu, 20 Apr 2023 10:12:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Subject: [PULL 21/23] qtest: Move tpm_util_tis_transmit() into tpm-tis-utils.c
 and rename it
Date: Thu, 20 Apr 2023 12:12:14 +0200
Message-Id: <20230420101216.786304-22-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Stefan Berger <stefanb@linux.ibm.com>

To be able to remove tpm_tis_base_addr from test cases that do not really
need it move the tpm_util_tis_transmit() function into tpm-tis-utils.c and
rename it to tpm_tis_transmit().

Fix a locality parameter in a test case on the way.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230331173051.3857801-3-stefanb@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/tpm-tis-util.h              |  4 +++
 tests/qtest/tpm-util.h                  |  3 --
 tests/qtest/tpm-crb-swtpm-test.c        |  3 --
 tests/qtest/tpm-crb-test.c              |  3 --
 tests/qtest/tpm-tis-device-swtpm-test.c |  5 +--
 tests/qtest/tpm-tis-swtpm-test.c        |  5 +--
 tests/qtest/tpm-tis-util.c              | 47 ++++++++++++++++++++++++-
 tests/qtest/tpm-util.c                  | 45 -----------------------
 8 files changed, 56 insertions(+), 59 deletions(-)

diff --git a/tests/qtest/tpm-tis-util.h b/tests/qtest/tpm-tis-util.h
index d10efe86ae..03910a7ba7 100644
--- a/tests/qtest/tpm-tis-util.h
+++ b/tests/qtest/tpm-tis-util.h
@@ -20,4 +20,8 @@ void tpm_tis_test_check_access_reg_seize(const void *data);
 void tpm_tis_test_check_access_reg_release(const void *data);
 void tpm_tis_test_check_transmit(const void *data);
 
+void tpm_tis_transfer(QTestState *s,
+                      const unsigned char *req, size_t req_size,
+                      unsigned char *rsp, size_t rsp_size);
+
 #endif /* TESTS_TPM_TIS_UTIL_H */
diff --git a/tests/qtest/tpm-util.h b/tests/qtest/tpm-util.h
index 80720afac0..0cb28dd6e5 100644
--- a/tests/qtest/tpm-util.h
+++ b/tests/qtest/tpm-util.h
@@ -27,9 +27,6 @@ typedef void (tx_func)(QTestState *s,
 void tpm_util_crb_transfer(QTestState *s,
                            const unsigned char *req, size_t req_size,
                            unsigned char *rsp, size_t rsp_size);
-void tpm_util_tis_transfer(QTestState *s,
-                           const unsigned char *req, size_t req_size,
-                           unsigned char *rsp, size_t rsp_size);
 
 void tpm_util_startup(QTestState *s, tx_func *tx);
 void tpm_util_pcrextend(QTestState *s, tx_func *tx);
diff --git a/tests/qtest/tpm-crb-swtpm-test.c b/tests/qtest/tpm-crb-swtpm-test.c
index 40254f762f..ffeb1c396b 100644
--- a/tests/qtest/tpm-crb-swtpm-test.c
+++ b/tests/qtest/tpm-crb-swtpm-test.c
@@ -19,9 +19,6 @@
 #include "tpm-tests.h"
 #include "hw/acpi/tpm.h"
 
-/* Not used but needed for linking */
-uint64_t tpm_tis_base_addr = TPM_TIS_ADDR_BASE;
-
 typedef struct TestState {
     char *src_tpm_path;
     char *dst_tpm_path;
diff --git a/tests/qtest/tpm-crb-test.c b/tests/qtest/tpm-crb-test.c
index 7b94453390..396ae3f91c 100644
--- a/tests/qtest/tpm-crb-test.c
+++ b/tests/qtest/tpm-crb-test.c
@@ -19,9 +19,6 @@
 #include "qemu/module.h"
 #include "tpm-emu.h"
 
-/* Not used but needed for linking */
-uint64_t tpm_tis_base_addr = TPM_TIS_ADDR_BASE;
-
 #define TPM_CMD "\x80\x01\x00\x00\x00\x0c\x00\x00\x01\x44\x00\x00"
 
 static void tpm_crb_test(const void *data)
diff --git a/tests/qtest/tpm-tis-device-swtpm-test.c b/tests/qtest/tpm-tis-device-swtpm-test.c
index 8c067fddd4..517a077005 100644
--- a/tests/qtest/tpm-tis-device-swtpm-test.c
+++ b/tests/qtest/tpm-tis-device-swtpm-test.c
@@ -18,6 +18,7 @@
 #include "libqtest.h"
 #include "qemu/module.h"
 #include "tpm-tests.h"
+#include "tpm-tis-util.h"
 #include "hw/acpi/tpm.h"
 
 uint64_t tpm_tis_base_addr = 0xc000000;
@@ -33,7 +34,7 @@ static void tpm_tis_swtpm_test(const void *data)
 {
     const TestState *ts = data;
 
-    tpm_test_swtpm_test(ts->src_tpm_path, tpm_util_tis_transfer,
+    tpm_test_swtpm_test(ts->src_tpm_path, tpm_tis_transfer,
                         "tpm-tis-device", MACHINE_OPTIONS);
 }
 
@@ -42,7 +43,7 @@ static void tpm_tis_swtpm_migration_test(const void *data)
     const TestState *ts = data;
 
     tpm_test_swtpm_migration_test(ts->src_tpm_path, ts->dst_tpm_path, ts->uri,
-                                  tpm_util_tis_transfer, "tpm-tis-device",
+                                  tpm_tis_transfer, "tpm-tis-device",
                                   MACHINE_OPTIONS);
 }
 
diff --git a/tests/qtest/tpm-tis-swtpm-test.c b/tests/qtest/tpm-tis-swtpm-test.c
index 11539c0a52..105e42e21d 100644
--- a/tests/qtest/tpm-tis-swtpm-test.c
+++ b/tests/qtest/tpm-tis-swtpm-test.c
@@ -17,6 +17,7 @@
 #include "libqtest.h"
 #include "qemu/module.h"
 #include "tpm-tests.h"
+#include "tpm-tis-util.h"
 #include "hw/acpi/tpm.h"
 
 uint64_t tpm_tis_base_addr = TPM_TIS_ADDR_BASE;
@@ -31,7 +32,7 @@ static void tpm_tis_swtpm_test(const void *data)
 {
     const TestState *ts = data;
 
-    tpm_test_swtpm_test(ts->src_tpm_path, tpm_util_tis_transfer,
+    tpm_test_swtpm_test(ts->src_tpm_path, tpm_tis_transfer,
                         "tpm-tis", NULL);
 }
 
@@ -40,7 +41,7 @@ static void tpm_tis_swtpm_migration_test(const void *data)
     const TestState *ts = data;
 
     tpm_test_swtpm_migration_test(ts->src_tpm_path, ts->dst_tpm_path, ts->uri,
-                                  tpm_util_tis_transfer, "tpm-tis", NULL);
+                                  tpm_tis_transfer, "tpm-tis", NULL);
 }
 
 int main(int argc, char **argv)
diff --git a/tests/qtest/tpm-tis-util.c b/tests/qtest/tpm-tis-util.c
index 939893bf01..728cd3e065 100644
--- a/tests/qtest/tpm-tis-util.c
+++ b/tests/qtest/tpm-tis-util.c
@@ -52,7 +52,7 @@ void tpm_tis_test_check_localities(const void *data)
     uint32_t rid;
 
     for (locty = 0; locty < TPM_TIS_NUM_LOCALITIES; locty++) {
-        access = readb(TIS_REG(0, TPM_TIS_REG_ACCESS));
+        access = readb(TIS_REG(locty, TPM_TIS_REG_ACCESS));
         g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
                                     TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
 
@@ -449,3 +449,48 @@ void tpm_tis_test_check_transmit(const void *data)
     writeb(TIS_REG(0, TPM_TIS_REG_ACCESS), TPM_TIS_ACCESS_ACTIVE_LOCALITY);
     access = readb(TIS_REG(0, TPM_TIS_REG_ACCESS));
 }
+
+void tpm_tis_transfer(QTestState *s,
+                      const unsigned char *req, size_t req_size,
+                      unsigned char *rsp, size_t rsp_size)
+{
+    uint32_t sts;
+    uint16_t bcount;
+    size_t i;
+
+    /* request use of locality 0 */
+    qtest_writeb(s, TIS_REG(0, TPM_TIS_REG_ACCESS), TPM_TIS_ACCESS_REQUEST_USE);
+    qtest_writel(s, TIS_REG(0, TPM_TIS_REG_STS), TPM_TIS_STS_COMMAND_READY);
+
+    sts = qtest_readl(s, TIS_REG(0, TPM_TIS_REG_STS));
+    bcount = (sts >> 8) & 0xffff;
+    g_assert_cmpint(bcount, >=, req_size);
+
+    /* transmit command */
+    for (i = 0; i < req_size; i++) {
+        qtest_writeb(s, TIS_REG(0, TPM_TIS_REG_DATA_FIFO), req[i]);
+    }
+
+    /* start processing */
+    qtest_writeb(s, TIS_REG(0, TPM_TIS_REG_STS), TPM_TIS_STS_TPM_GO);
+
+    uint64_t end_time = g_get_monotonic_time() + 50 * G_TIME_SPAN_SECOND;
+    do {
+        sts = qtest_readl(s, TIS_REG(0, TPM_TIS_REG_STS));
+        if ((sts & TPM_TIS_STS_DATA_AVAILABLE) != 0) {
+            break;
+        }
+    } while (g_get_monotonic_time() < end_time);
+
+    sts = qtest_readl(s, TIS_REG(0, TPM_TIS_REG_STS));
+    bcount = (sts >> 8) & 0xffff;
+
+    memset(rsp, 0, rsp_size);
+    for (i = 0; i < bcount; i++) {
+        rsp[i] = qtest_readb(s, TIS_REG(0, TPM_TIS_REG_DATA_FIFO));
+    }
+
+    /* relinquish use of locality 0 */
+    qtest_writeb(s, TIS_REG(0, TPM_TIS_REG_ACCESS),
+                 TPM_TIS_ACCESS_ACTIVE_LOCALITY);
+}
diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
index a7efe2d0d2..1c0319e6e7 100644
--- a/tests/qtest/tpm-util.c
+++ b/tests/qtest/tpm-util.c
@@ -51,51 +51,6 @@ void tpm_util_crb_transfer(QTestState *s,
     qtest_memread(s, raddr, rsp, rsp_size);
 }
 
-void tpm_util_tis_transfer(QTestState *s,
-                           const unsigned char *req, size_t req_size,
-                           unsigned char *rsp, size_t rsp_size)
-{
-    uint32_t sts;
-    uint16_t bcount;
-    size_t i;
-
-    /* request use of locality 0 */
-    qtest_writeb(s, TIS_REG(0, TPM_TIS_REG_ACCESS), TPM_TIS_ACCESS_REQUEST_USE);
-    qtest_writel(s, TIS_REG(0, TPM_TIS_REG_STS), TPM_TIS_STS_COMMAND_READY);
-
-    sts = qtest_readl(s, TIS_REG(0, TPM_TIS_REG_STS));
-    bcount = (sts >> 8) & 0xffff;
-    g_assert_cmpint(bcount, >=, req_size);
-
-    /* transmit command */
-    for (i = 0; i < req_size; i++) {
-        qtest_writeb(s, TIS_REG(0, TPM_TIS_REG_DATA_FIFO), req[i]);
-    }
-
-    /* start processing */
-    qtest_writeb(s, TIS_REG(0, TPM_TIS_REG_STS), TPM_TIS_STS_TPM_GO);
-
-    uint64_t end_time = g_get_monotonic_time() + 50 * G_TIME_SPAN_SECOND;
-    do {
-        sts = qtest_readl(s, TIS_REG(0, TPM_TIS_REG_STS));
-        if ((sts & TPM_TIS_STS_DATA_AVAILABLE) != 0) {
-            break;
-        }
-    } while (g_get_monotonic_time() < end_time);
-
-    sts = qtest_readl(s, TIS_REG(0, TPM_TIS_REG_STS));
-    bcount = (sts >> 8) & 0xffff;
-
-    memset(rsp, 0, rsp_size);
-    for (i = 0; i < bcount; i++) {
-        rsp[i] = qtest_readb(s, TIS_REG(0, TPM_TIS_REG_DATA_FIFO));
-    }
-
-    /* relinquish use of locality 0 */
-    qtest_writeb(s, TIS_REG(0, TPM_TIS_REG_ACCESS),
-                 TPM_TIS_ACCESS_ACTIVE_LOCALITY);
-}
-
 void tpm_util_startup(QTestState *s, tx_func *tx)
 {
     unsigned char buffer[1024];
-- 
2.31.1


