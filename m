Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D453C3E47
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 19:21:16 +0200 (CEST)
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2d8l-0007Te-Qn
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 13:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2d33-0006oq-CM
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:15:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2d2w-0006xy-1g
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:15:21 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16BH5Igj127220; Sun, 11 Jul 2021 13:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6pGdJRnOJILLZc0Wl6q/G6fJOcR/8P2vjR2ENZ1ubQs=;
 b=mr2Zta7B14euCYV2jotncwbB0jd6vFlgwMxqxg+5tB9SaTc5xghMTpFhsSRyUGpxeJkU
 RmSz96O/Wu9U4WYDyKD56Y7wJGkFeI7c8SOsJSIdRxwII5djTb7RvnCLg6q3We4vmtcv
 7yOMszta/ps47YT2pSNl4PEWnA9zMM9jynXnzhZ2mQ8tp5TJOiWaF5caxSlGYk6af6Xq
 tAokMZDQZnPJz+kkiLeTrPHQbIgUA4vegCXzXjD97EKNE7AH3OTu4kYK4S5yqPGHr/1h
 2VtcdQpQ1fiai7u4dA0TDoFjy/DqgKdSM79rHqfZQJbakdRdIhybz78KxPOHrBk3QXeS QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmb3bqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Jul 2021 13:15:11 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16BH5JqS127309;
 Sun, 11 Jul 2021 13:15:10 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmb3bqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Jul 2021 13:15:10 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16BHCA3W013188;
 Sun, 11 Jul 2021 17:15:09 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 39qt391mee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Jul 2021 17:15:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16BHF82O14942652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Jul 2021 17:15:08 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF6FA112065;
 Sun, 11 Jul 2021 17:15:08 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97485112061;
 Sun, 11 Jul 2021 17:15:08 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 11 Jul 2021 17:15:08 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] tests: Add tpm_version field to TPMTestState and fill it
Date: Sun, 11 Jul 2021 13:14:59 -0400
Message-Id: <20210711171506.39375-3-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711171506.39375-1-stefanb@linux.vnet.ibm.com>
References: <20210711171506.39375-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BwtnxYy4A8_u-iulu5X7fIHPnWDqY0OL
X-Proofpoint-GUID: yoR0gjSvJKrvGKYGGPHeuMyz2FfiDZEc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-11_10:2021-07-09,
 2021-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107110141
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20210708183814.925960-3-stefanb@linux.vnet.ibm.com
---
 tests/qtest/bios-tables-test.c    |  5 +++--
 tests/qtest/tpm-crb-test.c        |  1 +
 tests/qtest/tpm-emu.c             | 13 ++++++++++---
 tests/qtest/tpm-emu.h             |  2 ++
 tests/qtest/tpm-tis-device-test.c |  1 +
 tests/qtest/tpm-tis-test.c        |  1 +
 6 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a622f91a37..93c9d306b5 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1092,7 +1092,7 @@ static void test_acpi_piix4_tcg_numamem(void)
 uint64_t tpm_tis_base_addr;
 
 static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
-                              uint64_t base)
+                              uint64_t base, enum TPMVersion tpm_version)
 {
 #ifdef CONFIG_TPM
     gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
@@ -1113,6 +1113,7 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
     g_mutex_init(&test.data_mutex);
     g_cond_init(&test.data_cond);
     test.data_cond_signal = false;
+    test.tpm_version = tpm_version;
 
     thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
     tpm_emu_test_wait_cond(&test);
@@ -1145,7 +1146,7 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
 
 static void test_acpi_q35_tcg_tpm_tis(void)
 {
-    test_acpi_tcg_tpm("q35", "tis", 0xFED40000);
+    test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_2_0);
 }
 
 static void test_acpi_tcg_dimm_pxm(const char *machine)
diff --git a/tests/qtest/tpm-crb-test.c b/tests/qtest/tpm-crb-test.c
index 50936f1482..7b94453390 100644
--- a/tests/qtest/tpm-crb-test.c
+++ b/tests/qtest/tpm-crb-test.c
@@ -156,6 +156,7 @@ int main(int argc, char **argv)
     g_mutex_init(&test.data_mutex);
     g_cond_init(&test.data_cond);
     test.data_cond_signal = false;
+    test.tpm_version = TPM_VERSION_2_0;
 
     thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
     tpm_emu_test_wait_cond(&test);
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index b9cddcc240..8baf49eafd 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -56,9 +56,16 @@ static void *tpm_emu_tpm_thread(void *data)
         s->tpm_msg->code = be32_to_cpu(s->tpm_msg->code);
 
         /* reply error */
-        s->tpm_msg->tag = cpu_to_be16(TPM2_ST_NO_SESSIONS);
-        s->tpm_msg->len = cpu_to_be32(sizeof(struct tpm_hdr));
-        s->tpm_msg->code = cpu_to_be32(TPM_RC_FAILURE);
+        switch (s->tpm_version) {
+        case TPM_VERSION_2_0:
+            s->tpm_msg->tag = cpu_to_be16(TPM2_ST_NO_SESSIONS);
+            s->tpm_msg->len = cpu_to_be32(sizeof(struct tpm_hdr));
+            s->tpm_msg->code = cpu_to_be32(TPM_RC_FAILURE);
+            break;
+        default:
+            g_debug("unsupport TPM version %u", s->tpm_version);
+            g_assert_not_reached();
+        }
         qio_channel_write(ioc, (char *)s->tpm_msg, be32_to_cpu(s->tpm_msg->len),
                           &error_abort);
     }
diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
index b066ad63fb..f7b1e3c6ab 100644
--- a/tests/qtest/tpm-emu.h
+++ b/tests/qtest/tpm-emu.h
@@ -18,6 +18,7 @@
 
 #include "qemu/sockets.h"
 #include "io/channel.h"
+#include "sysemu/tpm.h"
 
 struct tpm_hdr {
     uint16_t tag;
@@ -34,6 +35,7 @@ typedef struct TPMTestState {
     QIOChannel *tpm_ioc;
     GThread *emu_tpm_thread;
     struct tpm_hdr *tpm_msg;
+    enum TPMVersion tpm_version;
 } TPMTestState;
 
 void tpm_emu_test_wait_cond(TPMTestState *s);
diff --git a/tests/qtest/tpm-tis-device-test.c b/tests/qtest/tpm-tis-device-test.c
index d36ae20243..3ddefb51ec 100644
--- a/tests/qtest/tpm-tis-device-test.c
+++ b/tests/qtest/tpm-tis-device-test.c
@@ -46,6 +46,7 @@ int main(int argc, char **argv)
     g_mutex_init(&test.data_mutex);
     g_cond_init(&test.data_cond);
     test.data_cond_signal = false;
+    test.tpm_version = TPM_VERSION_2_0;
 
     thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
     tpm_emu_test_wait_cond(&test);
diff --git a/tests/qtest/tpm-tis-test.c b/tests/qtest/tpm-tis-test.c
index 6fee4779ea..a4a25ba745 100644
--- a/tests/qtest/tpm-tis-test.c
+++ b/tests/qtest/tpm-tis-test.c
@@ -40,6 +40,7 @@ int main(int argc, char **argv)
     g_mutex_init(&test.data_mutex);
     g_cond_init(&test.data_cond);
     test.data_cond_signal = false;
+    test.tpm_version = TPM_VERSION_2_0;
 
     thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
     tpm_emu_test_wait_cond(&test);
-- 
2.31.1


