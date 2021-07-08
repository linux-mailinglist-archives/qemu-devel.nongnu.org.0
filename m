Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9223C1981
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:00:16 +0200 (CEST)
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZFv-0006Nz-0f
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m1Yuz-0007KR-16
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:38:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m1Yur-0003cf-Fv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:38:36 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168IWxPY136559
 for <qemu-devel@nongnu.org>; Thu, 8 Jul 2021 14:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4AxgS4ZnVbQTCmyDu7sFX9OGUf1GYl+eVmpDTf4g6Kw=;
 b=biHoW+gLinJ4JLkSWFHMQj77M7ynQqncJ/2+C6W7z4Q3kuj4Ijjyx7xS+2HgmBU5K4Wh
 9dMz+IY63m/6TR9eq1KJGfZH9yUMJ4ULWpviZCCeDTmphyAhKW+QdHHO1RcLG4HppD4B
 2hME8hZUkfHQHpgiotZZhXxUs1JnD4kyjm/uBnup2hLKh38z4Xyv73Suvuhs3HqVPqVx
 hKfghMw3dizh4XOMBH0q8ZY7VhFw8dFYg7E2VASHXxMgGtKLpkW9vKVTrb6SSFLbH/YK
 9jc/PxEMPJe6VGfqKeF50tm2LcnpdxgLS2kOucxXfdfgMVlsXChayj5nwthcBcdqOD/U eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39p0hqp9vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 14:38:28 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 168IX04F136613
 for <qemu-devel@nongnu.org>; Thu, 8 Jul 2021 14:38:27 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39p0hqp9v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 14:38:27 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 168IJNP3003401;
 Thu, 8 Jul 2021 18:38:27 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 39jfhd2n0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 18:38:27 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 168IcQeS38011142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 18:38:26 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24B096E04E;
 Thu,  8 Jul 2021 18:38:26 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC0886E050;
 Thu,  8 Jul 2021 18:38:25 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  8 Jul 2021 18:38:25 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v2 8/9] tests: acpi: Add test cases for TPM 1.2 with TCPA table
Date: Thu,  8 Jul 2021 14:38:13 -0400
Message-Id: <20210708183814.925960-9-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708183814.925960-1-stefanb@linux.vnet.ibm.com>
References: <20210708183814.925960-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M3RwpPYSA2KfW4sMY0MdYSRaQxu0G0Oz
X-Proofpoint-ORIG-GUID: 5ESU6Bd-z6n00tJidcY_VxE-fUu9uUX9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_11:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080095
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
 "Michael S . Tsirkin" <mst@redhat.com>, philmd@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
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
index 4ccbe56158..ddfd2d2b2a 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1145,11 +1145,16 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
 #endif
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
@@ -1518,7 +1523,8 @@ int main(int argc, char *argv[])
             return ret;
         }
         qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
-        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
+        qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
+        qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
         qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
         qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
         qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
-- 
2.31.1


