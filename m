Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ADF3B8662
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:40:15 +0200 (CEST)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycJy-0008EX-8y
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1lycHT-0005PR-Cs
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:37:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1lycHL-0008CG-C0
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:37:39 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UFYNxX062962
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CRBEd09ryVWU+vybpieBShRxMAsBMtz2wtmvqll4vqk=;
 b=dyoHtHYg/mUmdHDeoiidpV+BR1Py8KIhF+OFLwSaQcCo19spWwzXCBIETchLjr2Nvdzt
 EGiBwM7SPccr1ywK2zB7IL5vAX4nZ8o0OfGAVkX5U8Md797Yy/ogKPqCSrBLzHbllAUK
 oco9pTKYAqA2oLwUMFpPx0Kf9smIUHDyUQK7etiECFp7ps++BLUAzypNpcJUv+Ql22Om
 XGu4mPL6jEmtp0ZKfzfer39Buj8dQ7/bwUPCajvrMis7NT7z54wSpBnvD1kNUxvAbg2d
 UnraBVj+xgIw2r2yasGn0B3nJCCai9BpCKWI/xxAN2hYOcfUigpUvoOTRq1vizz1vME6 Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gr1syhtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:28 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UFYRJk063319
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:27 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gr1syht3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 11:37:27 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UFTRtl019673;
 Wed, 30 Jun 2021 15:37:26 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 39duvd28aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 15:37:26 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UFbPub36635058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 15:37:26 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEA0DAE0A5;
 Wed, 30 Jun 2021 15:37:24 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C006CAE0A1;
 Wed, 30 Jun 2021 15:37:24 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 15:37:24 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH 1/7] tests: Rename TestState to TPMTestState
Date: Wed, 30 Jun 2021 11:37:17 -0400
Message-Id: <20210630153723.672473-2-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FfOgKHyBAhw2_YeFisW7smrr5Njmtog7
X-Proofpoint-ORIG-GUID: 0L0sDY36H34ZopuR8-xeAeycKx2_VRNZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_06:2021-06-30,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300092
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, philmd@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
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


