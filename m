Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089043C77C5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 22:20:00 +0200 (CEST)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Oso-0001rZ-VX
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 16:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m3Ooz-0001aP-Ge
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:16:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62788
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m3Oot-0004ys-ET
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:16:00 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DK8fTm044323
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RkYZzL71+HtHWYLHoB/nPWI3fB0Lk7dgrGDrSaTpBzs=;
 b=TG6TY2PM8gd0CXicvx8rf/R7f0rr49NgFMQ+e3ScKZIfirE7450j5t8BbboGho6oKbHo
 7/d1JzUcnUvyj0OCcM3MqCHHX0UmDlPlIqeQaTNvsbLM2JAxXGCbb0S68VyrhcdGMtgZ
 sgPj9Rwc8vpoSIhjrszKcYFSUngXufrccZAY1I5NRsYfHBWUELo01fHP8+NcwlesHfZx
 8W4odmDocxpoBGZ278IfjoECvWvvJhPWW/soqH5WqfORt1mbBv4C3QGnh9Oj8OLEt3g2
 mnu/nxPTnTbkU92H3Vcu7Gd9e/omIb3LNReN6rrdthSY8sD1ZVXnvmjd1TouetnKX8Zp sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs3chq14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:54 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16DKBP0n050994
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:54 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs3chq0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 16:15:54 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16DKCOnh007109;
 Tue, 13 Jul 2021 20:15:53 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 39q36bf0f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 20:15:53 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16DKFqMk18153772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 20:15:52 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B22578063;
 Tue, 13 Jul 2021 20:15:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2147578068;
 Tue, 13 Jul 2021 20:15:52 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 20:15:52 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v5 08/10] tests: Use QMP to check whether a TPM device model
 is available
Date: Tue, 13 Jul 2021 16:15:43 -0400
Message-Id: <20210713201545.903754-9-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
References: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eqgXMW9EAWfKYKtMpC8Kj2gXxQ1xKvGt
X-Proofpoint-ORIG-GUID: -LStvEh-MbubznikVuNpTk77b754MFHv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_12:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130124
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Use QMP to check whether a given TPM device model is available and if it
is not the case then do not register the tests that require it.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/qtest/bios-tables-test.c |  8 +++----
 tests/qtest/tpm-emu.c          | 38 ++++++++++++++++++++++++++++++++++
 tests/qtest/tpm-emu.h          |  2 ++
 3 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4ccbe56158..0a78ddb5d1 100644
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
@@ -1140,9 +1139,6 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
     g_free(tmp_dir_name);
     g_free(args);
     free_test_data(&data);
-#else
-    g_test_skip("TPM disabled");
-#endif
 }
 
 static void test_acpi_q35_tcg_tpm_tis(void)
@@ -1518,7 +1514,9 @@ int main(int argc, char *argv[])
             return ret;
         }
         qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
-        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
+        if (tpm_model_is_available("-machine q35", "tpm-tis")) {
+            qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
+        }
         qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
         qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
         qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 32c704194b..2994d1cf42 100644
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
@@ -192,3 +194,39 @@ void *tpm_emu_ctrl_thread(void *data)
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
+    if (!qts) {
+        return false;
+    }
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
+                    break;
+                }
+            }
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


