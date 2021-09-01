Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BB63FD9C6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:29:27 +0200 (CEST)
Received: from localhost ([::1]:59580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPMs-0006iK-If
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mLPFw-0003ts-DY
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:22:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59728
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mLPFu-000301-H1
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:22:16 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181CEsQe019524; Wed, 1 Sep 2021 08:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bKmdhgdbamp8guL8X5oWinLQb27Dyv+D8MP/LXK28Vc=;
 b=UYKGFv3/MyxaTf87tVGW9pzTAkoeVk6wfhaUczcScq6kFnBE/tI/2hqy+Mr/VRpuVhP2
 IXE7XNaarnDQJ6hPhF0Gsi1hhwvEdMQgBiCFJS4Nb1NUkEbMnblpNTK0LLBEC6bVA5Xr
 e9UYACfkGT7yp8CrF6frbh6whXpmPsDtVF57IZMYaSinU+lgG3CQCOFKPrmM0cKyPtMX
 XlImnN9CU/FNu/Mp+Zp28crVS7hk3lCMTOMls5PMEyjKr+6p3rpNW1xnswZ75HuDHXoA
 qIHYt4UPE/VhRxQqTDmA07dJNvZWXFoV0zo2h3TyWG7NORlz6xNY0XYJut6/drkXn0UC Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3at9518mwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 08:22:11 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 181CFpih024131;
 Wed, 1 Sep 2021 08:22:11 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3at9518mvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 08:22:11 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181CCio2026440;
 Wed, 1 Sep 2021 12:22:10 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3aqcsdhced-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 12:22:10 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181CM9XZ51970376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 12:22:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DE37BE065;
 Wed,  1 Sep 2021 12:22:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7A6ABE051;
 Wed,  1 Sep 2021 12:22:08 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Sep 2021 12:22:08 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 01/10] tests: Rename TestState to TPMTestState
Date: Wed,  1 Sep 2021 08:21:34 -0400
Message-Id: <20210901122143.1867023-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901122143.1867023-1-stefanb@linux.ibm.com>
References: <20210901122143.1867023-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n2EeGNT-QlBZyEDgCDccOLJUdjDK0-sB
X-Proofpoint-ORIG-GUID: iAfI1XAxGIGoIPW61HdTKAtGJpyHxX79
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_04:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20210802215246.1433175-2-stefanb@linux.ibm.com
---
 tests/qtest/bios-tables-test.c    | 2 +-
 tests/qtest/tpm-crb-test.c        | 4 ++--
 tests/qtest/tpm-emu.c             | 6 +++---
 tests/qtest/tpm-emu.h             | 6 +++---
 tests/qtest/tpm-tis-device-test.c | 2 +-
 tests/qtest/tpm-tis-test.c        | 2 +-
 tests/qtest/tpm-tis-util.c        | 2 +-
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 51d3a4e239..a622f91a37 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1098,7 +1098,7 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
     gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
                                           machine, tpm_if);
     char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
-    TestState test;
+    TPMTestState test;
     test_data data;
     GThread *thread;
     char *args, *variant = g_strdup_printf(".%s", tpm_if);
diff --git a/tests/qtest/tpm-crb-test.c b/tests/qtest/tpm-crb-test.c
index ed533900d1..50936f1482 100644
--- a/tests/qtest/tpm-crb-test.c
+++ b/tests/qtest/tpm-crb-test.c
@@ -26,7 +26,7 @@ uint64_t tpm_tis_base_addr = TPM_TIS_ADDR_BASE;
 
 static void tpm_crb_test(const void *data)
 {
-    const TestState *s = data;
+    const TPMTestState *s = data;
     uint32_t intfid = readl(TPM_CRB_ADDR_BASE + A_CRB_INTF_ID);
     uint32_t csize = readl(TPM_CRB_ADDR_BASE + A_CRB_CTRL_CMD_SIZE);
     uint64_t caddr = readq(TPM_CRB_ADDR_BASE + A_CRB_CTRL_CMD_LADDR);
@@ -145,7 +145,7 @@ int main(int argc, char **argv)
     int ret;
     char *args, *tmp_path = g_dir_make_tmp("qemu-tpm-crb-test.XXXXXX", NULL);
     GThread *thread;
-    TestState test;
+    TPMTestState test;
 
     module_call_init(MODULE_INIT_QOM);
     g_test_init(&argc, &argv, NULL);
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 2e8eb7b94f..b9cddcc240 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -18,7 +18,7 @@
 #include "qapi/error.h"
 #include "tpm-emu.h"
 
-void tpm_emu_test_wait_cond(TestState *s)
+void tpm_emu_test_wait_cond(TPMTestState *s)
 {
     gint64 end_time = g_get_monotonic_time() + 5 * G_TIME_SPAN_SECOND;
 
@@ -36,7 +36,7 @@ void tpm_emu_test_wait_cond(TestState *s)
 
 static void *tpm_emu_tpm_thread(void *data)
 {
-    TestState *s = data;
+    TPMTestState *s = data;
     QIOChannel *ioc = s->tpm_ioc;
 
     s->tpm_msg = g_new(struct tpm_hdr, 1);
@@ -71,7 +71,7 @@ static void *tpm_emu_tpm_thread(void *data)
 
 void *tpm_emu_ctrl_thread(void *data)
 {
-    TestState *s = data;
+    TPMTestState *s = data;
     QIOChannelSocket *lioc = qio_channel_socket_new();
     QIOChannel *ioc;
 
diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
index 73f3bed0c4..b066ad63fb 100644
--- a/tests/qtest/tpm-emu.h
+++ b/tests/qtest/tpm-emu.h
@@ -26,7 +26,7 @@ struct tpm_hdr {
     char buffer[];
 } QEMU_PACKED;
 
-typedef struct TestState {
+typedef struct TPMTestState {
     GMutex data_mutex;
     GCond data_cond;
     bool data_cond_signal;
@@ -34,9 +34,9 @@ typedef struct TestState {
     QIOChannel *tpm_ioc;
     GThread *emu_tpm_thread;
     struct tpm_hdr *tpm_msg;
-} TestState;
+} TPMTestState;
 
-void tpm_emu_test_wait_cond(TestState *s);
+void tpm_emu_test_wait_cond(TPMTestState *s);
 void *tpm_emu_ctrl_thread(void *data);
 
 #endif /* TESTS_TPM_EMU_H */
diff --git a/tests/qtest/tpm-tis-device-test.c b/tests/qtest/tpm-tis-device-test.c
index 63ed36440f..d36ae20243 100644
--- a/tests/qtest/tpm-tis-device-test.c
+++ b/tests/qtest/tpm-tis-device-test.c
@@ -33,7 +33,7 @@ int main(int argc, char **argv)
 {
     char *tmp_path = g_dir_make_tmp("qemu-tpm-tis-device-test.XXXXXX", NULL);
     GThread *thread;
-    TestState test;
+    TPMTestState test;
     char *args;
     int ret;
 
diff --git a/tests/qtest/tpm-tis-test.c b/tests/qtest/tpm-tis-test.c
index 79ffbc943e..6fee4779ea 100644
--- a/tests/qtest/tpm-tis-test.c
+++ b/tests/qtest/tpm-tis-test.c
@@ -29,7 +29,7 @@ int main(int argc, char **argv)
     int ret;
     char *args, *tmp_path = g_dir_make_tmp("qemu-tpm-tis-test.XXXXXX", NULL);
     GThread *thread;
-    TestState test;
+    TPMTestState test;
 
     module_call_init(MODULE_INIT_QOM);
     g_test_init(&argc, &argv, NULL);
diff --git a/tests/qtest/tpm-tis-util.c b/tests/qtest/tpm-tis-util.c
index 9aff503fd8..939893bf01 100644
--- a/tests/qtest/tpm-tis-util.c
+++ b/tests/qtest/tpm-tis-util.c
@@ -373,7 +373,7 @@ void tpm_tis_test_check_access_reg_release(const void *data)
  */
 void tpm_tis_test_check_transmit(const void *data)
 {
-    const TestState *s = data;
+    const TPMTestState *s = data;
     uint8_t access;
     uint32_t sts;
     uint16_t bcount;
-- 
2.31.1


