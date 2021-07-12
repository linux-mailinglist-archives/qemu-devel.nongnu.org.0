Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760363C5EEB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:14:47 +0200 (CEST)
Received: from localhost ([::1]:45998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xdu-0006VF-I4
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2xZH-0006TE-4T
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:09:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3384
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2xZE-0003d4-Ct
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:09:58 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CF3Rq8078155
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=i18rnZKDWLfvquNDmmDnuagjynsCInBUMoABA+cA58A=;
 b=BkmMwrLjV5YqrB2FEKn2cv4AkyilbTv1wiWolUGUMkVl9cyk6ud2FNxU+LfKbzSaxCZF
 W/6buI45cGa9m4qL6Os2g+MlkCRZYN+kLv6EdOUAigyK/wsypRaFFRjZL0wDZy0dcjXq
 CshPLJHU5KVsJE2PtVAW8S3OIehC7C+6s9ojV0ry+j+VLRPdpMr/y7cPrJC/98xKPOQG
 u0blrgfR/4AarjvwFIYo0xkyqqfltpL/CDM7YGgvekcKDGDgfEu8PH7ypS1Owabd4P7K
 prMw7XUP9Pv5jCEMX6ZUgjtL+SGu/hjQ8PMRqrotyCIj58bLx235NWQrQWLai7Llv7JM qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs654p62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:09:55 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CF3iBR079674
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:09:55 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs654p5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 11:09:55 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CF7fba018339;
 Mon, 12 Jul 2021 15:09:54 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 39rkgt2u76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 15:09:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CF9rA716122618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 15:09:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DAC97805E;
 Mon, 12 Jul 2021 15:09:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7FA078070;
 Mon, 12 Jul 2021 15:09:52 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 15:09:52 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v3 2/9] tests: Add tpm_version field to TPMTestState and fill
 it
Date: Mon, 12 Jul 2021 11:09:42 -0400
Message-Id: <20210712150949.165725-3-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qNikt-iZzU78JkHEmO5bL9gEnCwzpltM
X-Proofpoint-GUID: w7sodvALsiteLeHyVnLM-iYu_WQTFVha
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_09:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120118
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, philmd@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

---
v3:
 - Added enum TPMVersion for when CONFIG_TPM is not defined
---
 tests/qtest/bios-tables-test.c    |  5 +++--
 tests/qtest/tpm-crb-test.c        |  1 +
 tests/qtest/tpm-emu.c             | 13 ++++++++++---
 tests/qtest/tpm-emu.h             |  8 ++++++++
 tests/qtest/tpm-tis-device-test.c |  1 +
 tests/qtest/tpm-tis-test.c        |  1 +
 6 files changed, 24 insertions(+), 5 deletions(-)

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
index b066ad63fb..610519883a 100644
--- a/tests/qtest/tpm-emu.h
+++ b/tests/qtest/tpm-emu.h
@@ -18,6 +18,7 @@
 
 #include "qemu/sockets.h"
 #include "io/channel.h"
+#include "sysemu/tpm.h"
 
 struct tpm_hdr {
     uint16_t tag;
@@ -26,6 +27,12 @@ struct tpm_hdr {
     char buffer[];
 } QEMU_PACKED;
 
+#ifndef CONFIG_TPM
+enum TPMVersion {
+    TPM_VERSION_2_0 = 2,
+};
+#endif
+
 typedef struct TPMTestState {
     GMutex data_mutex;
     GCond data_cond;
@@ -34,6 +41,7 @@ typedef struct TPMTestState {
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


