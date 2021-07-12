Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4243C6531
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 22:54:29 +0200 (CEST)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m32wf-0007Bu-1F
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 16:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m32qJ-0004wM-8Y
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 16:47:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10968
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m32qG-0007Es-0E
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 16:47:54 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CKXSSu045889
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 16:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ysGLDF477EENF7jBU8VTcM5wHTgwkuOumR0gLIcjaU4=;
 b=DQN2uhzZKLKEt4sIEqOtxAbClteprAGeeBFI1NVLyyoq+Pv8SRyTSAND7xLLMZutPI8C
 Y0CcEgczIhkhCxhuxqnQU3Bi2pMUwJ2VX5bH25zS9Z0WJva4WobzjGy9pRISGa0v8t6c
 rh/NbZvAK1uOLMfLAEC/GSpxONirc0Dy3htfPPkDmPGcdSPQD1X3qax8VchylO8nuAmP
 1eOXq7Btnrx1PmVR9hfpdovoi47XDR9EfdTIGR0JzQW/Rcj2Y585WX8EF9XYIUX+aobu
 yywIFN+OyQ2Ui/CBJWpqFvwfJJ4s1Ju1YbkpDtFTcLwWx+NNAZi//4R6g6/09Mn1qrOj Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs65drbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 16:47:51 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CKk17J100101
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 16:47:50 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs65drb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 16:47:50 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CKgMP0024489;
 Mon, 12 Jul 2021 20:47:50 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 39q36afrvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 20:47:50 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CKlnl550987318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 20:47:49 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1777CBE056;
 Mon, 12 Jul 2021 20:47:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1CEABE04F;
 Mon, 12 Jul 2021 20:47:48 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 20:47:48 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v4 10/10] tests: Use QMP to check whether a TPM device model
 is available
Date: Mon, 12 Jul 2021 16:47:36 -0400
Message-Id: <20210712204736.365349-11-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712204736.365349-1-stefanb@linux.vnet.ibm.com>
References: <20210712204736.365349-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qVCx9oejuAXtbjEvTp5WGFOgtbo0jjQQ
X-Proofpoint-GUID: sIu0vMVp9ehUl2utNY-UmyjbEAJp1zE6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_11:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120142
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

Use QMP to check whether a given TPM device model is available
and if it is not the case then skip a test that requires it.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/qtest/bios-tables-test.c | 14 +++++++------
 tests/qtest/tpm-emu.c          | 37 ++++++++++++++++++++++++++++++++++
 tests/qtest/tpm-emu.h          |  2 ++
 3 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ddfd2d2b2a..64add7da72 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1094,7 +1094,6 @@ uint64_t tpm_tis_base_addr;
 static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
                               uint64_t base, enum TPMVersion tpm_version)
 {
-#ifdef CONFIG_TPM
     gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
                                           machine, tpm_if);
     char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
@@ -1140,19 +1139,22 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
     g_free(tmp_dir_name);
     g_free(args);
     free_test_data(&data);
-#else
-    g_test_skip("TPM disabled");
-#endif
 }
 
 static void test_acpi_q35_tcg_tpm2_tis(void)
 {
-    test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_2_0);
+    if (!tpm_model_is_available("-machine q35", "tpm-tis"))
+        g_test_skip("TPM disabled");
+    else
+        test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_2_0);
 }
 
 static void test_acpi_q35_tcg_tpm12_tis(void)
 {
-    test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_1_2);
+    if (!tpm_model_is_available("-machine q35", "tpm-tis"))
+        g_test_skip("TPM disabled");
+    else
+        test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_1_2);
 }
 
 static void test_acpi_tcg_dimm_pxm(const char *machine)
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 32c704194b..553f1ad4ee 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -16,6 +16,8 @@
 #include "backends/tpm/tpm_ioctl.h"
 #include "io/channel-socket.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qlist.h"
+#include "qapi/qmp/qstring.h"
 #include "tpm-emu.h"
 
 void tpm_emu_test_wait_cond(TPMTestState *s)
@@ -192,3 +194,38 @@ void *tpm_emu_ctrl_thread(void *data)
     object_unref(OBJECT(lioc));
     return NULL;
 }
+
+bool tpm_model_is_available(const char *args, const char *tpm_if)
+{
+    QTestState *qts;
+    QDict *rsp_tpm;
+    bool ret = false;
+
+    qts = qtest_init(args);
+    if (!qts)
+        return false;
+
+    rsp_tpm = qtest_qmp(qts, "{ 'execute': 'query-tpm'}");
+    if (!qdict_haskey(rsp_tpm, "error")) {
+        QDict *rsp_models = qtest_qmp(qts,
+                                      "{ 'execute': 'query-tpm-models'}");
+        if (qdict_haskey(rsp_models, "return")) {
+            QList *models = qdict_get_qlist(rsp_models, "return");
+            QListEntry *e;
+
+            QLIST_FOREACH_ENTRY(models, e) {
+                QString *s = qobject_to(QString, qlist_entry_obj(e));
+                const char *ename = qstring_get_str(s);
+                if (!strcmp(ename, tpm_if)) {
+                    ret = true;
+                }
+            }
+            qobject_unref(models);
+        }
+        qobject_unref(rsp_models);
+    }
+    qobject_unref(rsp_tpm);
+    qtest_quit(qts);
+
+    return ret;
+}
diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
index fcb5d7a1d6..c33d99af37 100644
--- a/tests/qtest/tpm-emu.h
+++ b/tests/qtest/tpm-emu.h
@@ -22,6 +22,7 @@
 #include "qemu/sockets.h"
 #include "io/channel.h"
 #include "sysemu/tpm.h"
+#include "libqos/libqtest.h"
 
 struct tpm_hdr {
     uint16_t tag;
@@ -50,5 +51,6 @@ typedef struct TPMTestState {
 
 void tpm_emu_test_wait_cond(TPMTestState *s);
 void *tpm_emu_ctrl_thread(void *data);
+bool tpm_model_is_available(const char *args, const char *tpm_if);
 
 #endif /* TESTS_TPM_EMU_H */
-- 
2.31.1


