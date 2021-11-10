Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700AE44C23F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:39:27 +0100 (CET)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknp0-0008KR-Je
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:39:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mknlq-0005Pq-F0
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:36:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20438
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mknlo-0002cx-Ih
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:36:10 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AACjbQI028177; 
 Wed, 10 Nov 2021 13:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=Ne1b1jdLTS18gORaoOUPuqZ/SKHEoMXZpWZKZatmjP8=;
 b=KP+4kTFQNBf0OtgNMeF8HsPzB+SAlPDtm0UYO+UwZM+3kQhyE5qvLlnxmemfvCMQj1Dk
 +TuuT74bbhVDh1EJ0fFowyLuuMRFSaOqd4LyfHnvaEpq29f5thudz8lLswGM+ORHG3+d
 9UqlxopUCT8J6CKnONSflNRLMIDykMz2L3rGFIk45pAy0q0lmMnIFbsejZzl1dczhncJ
 rXFrCpuLPWNcbAbzehrfEYVF94Hi5YYgt63pfepTjGluidg4dqOPOIEoPf6qr2SsNx+4
 6AxvaIdFRCiAq4IqEbUaBBoFU9JHGsJ0rAFXCv0c668cJoZTtZpcHPcvRG/WL5jkkeqs aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8ecc17x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 13:36:06 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AADElTg008954;
 Wed, 10 Nov 2021 13:36:06 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8ecc17wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 13:36:06 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AADXvxb020960;
 Wed, 10 Nov 2021 13:36:05 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3c5hbc5fvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 13:36:05 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AADa4eW19399128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 13:36:04 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F23AB112065;
 Wed, 10 Nov 2021 13:36:03 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9266112069;
 Wed, 10 Nov 2021 13:36:03 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Nov 2021 13:36:03 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] acpi: tpm: Add missing device identification objects
Date: Wed, 10 Nov 2021 08:35:58 -0500
Message-Id: <20211110133559.3370990-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110133559.3370990-1-stefanb@linux.ibm.com>
References: <20211110133559.3370990-1-stefanb@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sugVR_i0S98ekC3qp1f1G33mlgB_3dJG
X-Proofpoint-ORIG-GUID: Cl6rr6SX2DBZ7ruj1s0nwlUR_az6OYkA
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_04,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=895 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111100071
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


