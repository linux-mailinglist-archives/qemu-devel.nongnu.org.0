Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5B43C1962
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:49:14 +0200 (CEST)
Received: from localhost ([::1]:56206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Z5F-0000Lx-J4
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m1Yur-00077n-PF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:38:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32738
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m1Yup-0003bU-4t
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:38:29 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168IYC9j173373
 for <qemu-devel@nongnu.org>; Thu, 8 Jul 2021 14:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uCsGLiwlr4qMYyVFDTU0qB3x2saL94ZdAvN11ellKRo=;
 b=apToVBV9Mf0Mdr8Kp4PHnU3E+gYmKeDbZoAMa8TAhlgHfTYKLxQzPRrCLX3Xs/6Gimkk
 hhRqvPnBJ3hBDX0JqYlxzm75ZWiOcmhjiixPIyrR91Q5vgFnSBuVKpJN4zPktxlPSVVf
 dN0g7RtyhhNxkJpn4vig2HbbHyxYnejsxuKx/+Om20FRgx8uIRY6fx0MuShHgxDaouvY
 tYhz2cK2NUXCIwH0tsxL7z+dqZ6TsPe387OSIU5FXtk1VB8xxyFWoWuiI/nEDl+WiMAj
 9FETP6gTcX2Rl7Ad2EIYUBG+eemkArZ1eOVh77f6HJzUC84Nbei9CU7uU8bMAA9g6NZr 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39nrfhfm3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 14:38:24 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 168IYBbe173296
 for <qemu-devel@nongnu.org>; Thu, 8 Jul 2021 14:38:24 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39nrfhfm3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 14:38:24 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 168IJOrV003425;
 Thu, 8 Jul 2021 18:38:23 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 39jfhd2n04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 18:38:23 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 168IcMG118088288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 18:38:23 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5E5C6E052;
 Thu,  8 Jul 2021 18:38:22 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 749C26E050;
 Thu,  8 Jul 2021 18:38:22 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  8 Jul 2021 18:38:22 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v2 2/9] tests: Add tpm_version field to TPMTestState and fill
 it
Date: Thu,  8 Jul 2021 14:38:07 -0400
Message-Id: <20210708183814.925960-3-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708183814.925960-1-stefanb@linux.vnet.ibm.com>
References: <20210708183814.925960-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BVnJEX9FP_WSSCrQW8tvfuK5jqzSLiZZ
X-Proofpoint-ORIG-GUID: kR1cQWGE0E8MzAxXFfH55iBsnhdWt9dS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_10:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080095
Received-SPF: none client-ip=148.163.158.5;
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
Cc: Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 philmd@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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


