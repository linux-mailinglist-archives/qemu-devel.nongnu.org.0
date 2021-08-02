Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635503DE212
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 00:00:09 +0200 (CEST)
Received: from localhost ([::1]:46628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAfyi-0007Fl-FX
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 18:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfrn-00029U-1l
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfrf-0000g0-Rg
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:58 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172LYOOG109247
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=z/JPUZfVEkCPWyLWgIy258uJ2eVGHWRp5RNDeK/bmrU=;
 b=bXtAOW1knuj5mqi+he1F9HNvkDd8c/laoSBHTp+rku/CaORQYW1rLFGg5QURF87ASnNk
 t31mkA37DXHPpkWziUVd8iBJDJdeErUvnZQkndlxhKcHCkwHDtPTZcfqdEGZ+taeAuwP
 O0I2V3qyuyPyQmuldk9FrUdAQCmfjHgesTfI5rjvhIjZmgYljOqeK/AlyRHHoBosG9hF
 XVdykppIX0jmJh+gtHwk8dMNEb/jdDWt8+yh76GeopxkyRCiEKRhNEgH6ZKj0zAGoK+c
 tLpelZim1s8Hpv45/TiMkGBA+B8Llz5WwC4YrwV8AT59iZoQ5L8e32KWChaHnZmycGB4 Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a5pdmydre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 17:52:49 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 172Lecu5129036
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:49 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a5pdmydr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 17:52:49 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172LfnJt031216;
 Mon, 2 Aug 2021 21:52:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3a4x5b69ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 21:52:48 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 172LqlXA12452298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Aug 2021 21:52:47 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E427B205F;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 567FFB2067;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH-for-6.2 v6 01/10] tests: Rename TestState to TPMTestState
Date: Mon,  2 Aug 2021 17:52:37 -0400
Message-Id: <20210802215246.1433175-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802215246.1433175-1-stefanb@linux.ibm.com>
References: <20210802215246.1433175-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GfVkiTVaimIv8cTapSEROa-5kAKq2Kg8
X-Proofpoint-ORIG-GUID: HsdWgkDBRfee3PZcfRG0f0HgZP1FHsM1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_07:2021-08-02,
 2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020137
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: imammedo@redhat.com, Stefan Berger <stefanb@linux.ibm.com>,
 philmd@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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


