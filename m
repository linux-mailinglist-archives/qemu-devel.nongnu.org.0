Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA16CC167
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:52:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9js-0008Lu-Dy; Tue, 28 Mar 2023 09:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ph9jq-0008LT-K1
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:51:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ph9jo-0000VV-Ih
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:51:50 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SDgBOe033787; Tue, 28 Mar 2023 13:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FdL+JQtgpIbcTvLquS+eEep/JoNRqQPNpWeSyuefBW4=;
 b=TG8QIkZYG3zEUe9BGqAXhQM6HcDXBdzVW23mdOv6HknQjCoF13ZecJd4kZ8CXva7EzII
 +Tp2JmD3fSGnsJxIVOFnQxL37M76FeYOdRJv6CstUSaA/kmG2JjxhkrCg0YbTpyAhwbo
 ZQommPwvYQ/8lmk1IAdqQ6L9ETG4h7q6Gsvgwa/7/ZaE26oTAgQi/pVyrgByCxmoKK/b
 /e2+s6vLs0SxBpH8Su9tWwBeLF9k+Ak0ZtSXEyYiLCLZ4Ccs6Ub6xxaz5JJP//YrlCvL
 ZHc9Am5YZMp7dl5iAeKuYuFI/eO9eobUQUXY8Qn4V2gUn2+bMajgSn1f/jo4+iuirKkx Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm1bnr8xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 13:51:27 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SDlEI3014681;
 Tue, 28 Mar 2023 13:51:27 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm1bnr8wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 13:51:27 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32SCZnOY003018;
 Tue, 28 Mar 2023 13:51:25 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3phrk7908a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 13:51:25 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SDpOan8258136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 13:51:24 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDDBD58057;
 Tue, 28 Mar 2023 13:51:24 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C96E5805D;
 Tue, 28 Mar 2023 13:51:24 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Mar 2023 13:51:24 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, clg@kaod.org, ninad@linux.ibm.com,
 joel@jms.id.au, andrew@aj.id.au, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v3 2/3] qtest: Move tpm_util_tis_transmit() into
 tpm-tis-utils.c and rename it
Date: Tue, 28 Mar 2023 09:51:20 -0400
Message-Id: <20230328135121.3661711-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328135121.3661711-1-stefanb@linux.ibm.com>
References: <20230328135121.3661711-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Hhd2O7Pu8VkA-lgIwH0z6S_LsKKp1Jkb
X-Proofpoint-GUID: lxEhPUax6bBjLEtR3meDsQUx_1CFiiX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280107
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

To be able to remove tpm_tis_base_addr from test cases that do not really
need it move the tpm_util_tis_transmit() function into tpm-tis-utils.c and
rename it to tpm_tis_transmit().

Fix a locality parameter in a test case on the way.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
---
 tests/qtest/tpm-crb-swtpm-test.c        |  3 --
 tests/qtest/tpm-crb-test.c              |  3 --
 tests/qtest/tpm-tis-device-swtpm-test.c |  5 +--
 tests/qtest/tpm-tis-swtpm-test.c        |  5 +--
 tests/qtest/tpm-tis-util.c              | 47 ++++++++++++++++++++++++-
 tests/qtest/tpm-tis-util.h              |  4 +++
 tests/qtest/tpm-util.c                  | 45 -----------------------
 tests/qtest/tpm-util.h                  |  3 --
 8 files changed, 56 insertions(+), 59 deletions(-)

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
-- 
2.39.2


