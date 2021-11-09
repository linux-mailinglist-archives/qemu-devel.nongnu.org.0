Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A84E44AF26
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:05:19 +0100 (CET)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkRkU-0006r1-Mx
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:05:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mkRhM-0002uY-9I
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:02:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35736
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mkRhF-00057x-QC
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:02:03 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9D0Fcb020394; 
 Tue, 9 Nov 2021 14:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=Ne1b1jdLTS18gORaoOUPuqZ/SKHEoMXZpWZKZatmjP8=;
 b=eFbYNAaCIgpPStgvuukqjWqGXUEt4babFA+WLMhzZUvt6X51zF0UH5qmgcBXaQSBz/AH
 c1p9evPRQaaufmDDjwy/B081yNJeIqLEPJsANH6CkWCRbiNMja3LtgJZ//23LgtcyQkz
 NUFabtQjSf4eEt7Tq7gX7jAq2ZeCHT6opPR/1NZ0rEhJ2UAkcbwNDTndthKi2qgX64f1
 6e+Z9EgLA6haiY85pNAcdddzlqGpi18BQOw7+SEHRBVEtgUBiCvhCYtYSUe+kTOhgH7c
 mXUkmS/N0u9IDna7PuHrtJ28ov5+9W+0zvbsN2XRORSn4J5CCbEhTd5XkIoKEhxVAeLG CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7nc1f79a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:01:55 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A9DlFdL014239;
 Tue, 9 Nov 2021 14:01:55 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7nc1f78c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:01:55 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9Dr03O015892;
 Tue, 9 Nov 2021 14:01:54 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3c5hbaxwxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:01:54 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A9E1smD51249518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 14:01:54 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDF9A28084;
 Tue,  9 Nov 2021 14:01:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC0BE28073;
 Tue,  9 Nov 2021 14:01:53 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 14:01:53 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] acpi: tpm: Add missing device identification objects
Date: Tue,  9 Nov 2021 09:01:51 -0500
Message-Id: <20211109140152.3310657-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109140152.3310657-1-stefanb@linux.ibm.com>
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p23cPq_LkCVk2VrGLqhxo_uu7k72mwR6
X-Proofpoint-GUID: AD22D9-c8g4umP8qy9CsEZEBmxtZ7ciG
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 mlxlogscore=914 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add missing device identification objects _STR and _UID. They will appear
as files 'description' and 'uid' under Linux sysfs.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/708
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 hw/arm/virt-acpi-build.c | 1 +
 hw/i386/acpi-build.c     | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 674f902652..09456424aa 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 
     Aml *dev = aml_device("TPM0");
     aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
 
     Aml *crs = aml_resource_template();
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a3ad6abd33..5bd2160a89 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1808,11 +1808,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                     dev = aml_device("TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_string("MSFT0101")));
+                    aml_append(dev,
+                               aml_name_decl("_STR",
+                                             aml_string("TPM 2.0 Device")));
                 } else {
                     dev = aml_device("ISA.TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_eisaid("PNP0C31")));
                 }
+                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
 
                 aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
                 crs = aml_resource_template();
@@ -1840,6 +1844,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     if (TPM_IS_CRB(tpm)) {
         dev = aml_device("TPM");
         aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+        aml_append(dev, aml_name_decl("_STR",
+                                      aml_string("TPM 2.0 Device")));
         crs = aml_resource_template();
         aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
                                            TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
@@ -1847,6 +1853,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
 
+        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+
         tpm_build_ppi_acpi(tpm, dev);
 
         aml_append(sb_scope, dev);
-- 
2.31.1


