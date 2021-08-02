Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA23DE205
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 23:58:04 +0200 (CEST)
Received: from localhost ([::1]:39198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAfwh-00029L-40
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 17:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfri-000215-Nx
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfrf-0000ex-RF
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:54 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172LXhH6196222
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+xmSHx7cUzo44IUfCo82SO6YczXbyZH9+UzI4qUA6Ho=;
 b=F+PK2ema0uea3mvbawSdETQS9TQIEtVP58ZdJZQw3cnDeRc+zLeiehD+pzNoWxVGAWj9
 AI0GZdGD/9EhHo1nleQ0ltUW84+p7Q1osWR4zxJI0EMp3g/OlgR74WOqsH1ufqtwMm55
 988QeehR/7IgqZhi/57KBJ0NgcRfeR2sqpwaRYP6R06NwBkEt7hPo5UoctyCN3kITlb0
 dOzXh+ZIcD7nAoNQz0FKFn1+FCrRltW+heKZWALRDqV91rZbQiDN+qdKo8cfXBX3pxmf
 9W8q9bMRa3uH1zMJXyUNZD/zekgGT4M2OzOlJ3DOHruFd7uQFeJ/lCg//ngyqGo1jJCa OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a5s27mb10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 17:52:49 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 172LYJgn005958
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:48 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a5s27mb0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 17:52:48 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172Lqga6007241;
 Mon, 2 Aug 2021 21:52:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3a4x5bp9tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 21:52:48 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 172LqlgN41615662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Aug 2021 21:52:47 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E9D1B2067;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FCC0B2068;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH-for-6.2 v6 02/10] tests: Add tpm_version field to TPMTestState
 and fill it
Date: Mon,  2 Aug 2021 17:52:38 -0400
Message-Id: <20210802215246.1433175-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802215246.1433175-1-stefanb@linux.ibm.com>
References: <20210802215246.1433175-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _tP7YFmscHHY_0JhXaiEN9mPhTRfCNi6
X-Proofpoint-GUID: _d9F0t2s4l9SDXcNi87cfNEm6F7YVZtb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_07:2021-08-02,
 2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020137
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: imammedo@redhat.com, Stefan Berger <stefanb@linux.ibm.com>,
 philmd@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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


