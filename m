Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BE93C77E7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 22:22:55 +0200 (CEST)
Received: from localhost ([::1]:48836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ove-0001cU-Mq
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 16:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m3Op2-0001bN-0E
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:16:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m3Oov-0004zS-0K
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:16:02 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DK7kYl003686
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Cx2CYNAFW/rUBEJKlaN69hC3VQ0bToFiK+bNtANZU04=;
 b=fPCEKq33IMJ21OrQehdXbIRyrngiG8itAXY+Wjg3c32I6RZhQu7w7o7sGLrOseFYS3pC
 CX4laQCaGrl7uXAeWH+HCfNFCDagKS75iQHJhM+sE6mOhKLDwgoqvaLgzYEdbpHNEmao
 5wxjtm33byLKbSQ7uDyVGdUE/d0JrlM8TvOXnaF3Tl0Kif4zEuqAXzef6i4YSRlRXLXF
 vZNswybT2WlovoisCzYVeSI0cge0d0h4Guda/dh2oAoHb+ygnDq8+iKd+5ENSvyo7BHT
 XXb+BzYVWz4EvhH4Pp+VEjjKyiLhO3rRadYJqLKiQIjoWg8h/z3YjOAp5F8SoJq/DS5B 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmd55rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:55 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16DKFtcn033342
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:55 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmd55r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 16:15:55 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16DKBloh000609;
 Tue, 13 Jul 2021 20:15:54 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 39rkgum56v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 20:15:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16DKFrCE16581186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 20:15:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FD2A78069;
 Tue, 13 Jul 2021 20:15:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9276D78067;
 Tue, 13 Jul 2021 20:15:52 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 20:15:52 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v5 09/10] tests: acpi: Add test cases for TPM 1.2 with TCPA
 table
Date: Tue, 13 Jul 2021 16:15:44 -0400
Message-Id: <20210713201545.903754-10-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
References: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ih_NH-i3ITP8FeFASCk_WqdU5qXa9bD4
X-Proofpoint-GUID: m0VmP0-X_odcBp1Hzw-M3_yoh-7KFLps
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_12:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130124
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 tests/qtest/bios-tables-test.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a78ddb5d1..4f11d03055 100644
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
@@ -1516,6 +1521,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
         if (tpm_model_is_available("-machine q35", "tpm-tis")) {
             qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
+            qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
         }
         qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
         qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
-- 
2.31.1


