Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251C73DE203
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 23:56:08 +0200 (CEST)
Received: from localhost ([::1]:33616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAfup-0006lH-3m
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 17:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfrm-00024R-1G
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfrf-0000h5-Rl
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:57 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172LX9dC076083
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NC2FSp3mV4WdaG/EPS+xqLb/cF2eY+dtUFnCNBb95cg=;
 b=M2WA/QVmAN4qfsJmsARSxU9qEhPRZajGLrbNjYU6RAlJF8ev95qamy4P65E4q1/vQAqZ
 GKsee/339otE/AWi5pclqjgiS1EfjzWC58fRUJdZQ+SJrg2GDO2i1iU9xjlpwhXKa4bK
 sTK96lCQjcHtZUxBxwGl7MfJLNKXwYrze5BKxiZZO2qU1JWl1HZZQeHOSmHEyIooR+q+
 5LJBiPGO9HRN5jffLlQUaYHuSCfKGQQPs718f1b2ouefPi6rntY4jLJOG7bfVii57kEQ
 +ug6mo/M402+DkNnoCzHKx/DWYCC5z7WPTgPibSbudglLH89UAfr5tZcmP2FCheuz24y QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a5kkdg25p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 17:52:50 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 172LXk2C078727
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:49 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a5kkdg25a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 17:52:49 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172LqO9r028679;
 Mon, 2 Aug 2021 21:52:49 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 3a6j2dc5xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 21:52:48 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 172Lqme535062208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Aug 2021 21:52:48 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21EE2B2064;
 Mon,  2 Aug 2021 21:52:48 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13E88B206C;
 Mon,  2 Aug 2021 21:52:48 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Aug 2021 21:52:48 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH-for-6.2 v6 09/10] tests: acpi: Add test cases for TPM 1.2 with
 TCPA table
Date: Mon,  2 Aug 2021 17:52:45 -0400
Message-Id: <20210802215246.1433175-10-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802215246.1433175-1-stefanb@linux.ibm.com>
References: <20210802215246.1433175-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mMxWOeeqHkoJuJUsm-SHHrIonI6KYBBf
X-Proofpoint-ORIG-GUID: 7vOJplRFGjAq6AiLIaHKJmTP8wg8KOPp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_07:2021-08-02,
 2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 89bf55c838..4f11d03055 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1141,11 +1141,16 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
     free_test_data(&data);
 }
 
-static void test_acpi_q35_tcg_tpm_tis(void)
+static void test_acpi_q35_tcg_tpm2_tis(void)
 {
     test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_2_0);
 }
 
+static void test_acpi_q35_tcg_tpm12_tis(void)
+{
+    test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_1_2);
+}
+
 static void test_acpi_tcg_dimm_pxm(const char *machine)
 {
     test_data data;
@@ -1515,7 +1520,8 @@ int main(int argc, char *argv[])
         }
         qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
         if (tpm_model_is_available("-machine q35", "tpm-tis")) {
-            qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm_tis);
+            qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
+            qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
         }
         qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
         qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
-- 
2.31.1


