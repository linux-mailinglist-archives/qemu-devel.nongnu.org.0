Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E05F47DDBA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 03:25:14 +0100 (CET)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Dn7-0001SA-Dc
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 21:25:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n0DlL-00005M-I3
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:23:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n0DlI-0007q5-Pt
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:23:23 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BN27eZY020277; 
 Thu, 23 Dec 2021 02:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=X8TI3ruZ/8hEmppxJuca6p0X1Lo4vbsIF88Jm4lLYL4=;
 b=U9YtQoUY+RdhSgY9syBEGR84GeEnrbCJkdB563imBGxkvRm/QsVMuxbU+YIMRk+K+Rcb
 P5XNuDRLANZCHdhV0Gdc8C2/xoUf+edN1iQ+64MzuVq4VFQqvaVEhmaXtEHdn0Q0pAYv
 9r3+d+WwPgCy5lGiNQcmr3+XwJzSt7/ExkXHmaIlkLFTl5rUt+wyFzuMjxomfP8zJsCf
 xU1jaCiwp6xY2MChtMVcVQOF8bg1+rNyq0VqPU8bgI8TG9p/J/1i/I4y5iOTl1mvc837
 DIOdekJGCMz/R3uvuChWLKWWgXhV2rgrN52hHFC3ly0hSD3NPV3qRA/5QhD9+myrAooA AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4d1kjv06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 02:23:18 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN29r39027692;
 Thu, 23 Dec 2021 02:23:17 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4d1kjv00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 02:23:17 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN2C8NM013138;
 Thu, 23 Dec 2021 02:23:17 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3d179c58d4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 02:23:17 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN2NGB633423690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 02:23:16 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3C766A047;
 Thu, 23 Dec 2021 02:23:15 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CE1D6A054;
 Thu, 23 Dec 2021 02:23:15 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 02:23:15 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] acpi: tpm: Add missing device identification objects
Date: Wed, 22 Dec 2021 21:23:09 -0500
Message-Id: <20211223022310.575496-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223022310.575496-1-stefanb@linux.ibm.com>
References: <20211223022310.575496-1-stefanb@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J4XTtd7VfZTGOMa4CPfco6G_J7908eDF
X-Proofpoint-GUID: x3ehNc2eIeb2u_iLnnfEmVFNpzwNmnph
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_09,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=857
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112230008
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-id: 20211110133559.3370990-3-stefanb@linux.ibm.com
---
 hw/arm/virt-acpi-build.c | 1 +
 hw/i386/acpi-build.c     | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d0f4867fdf..f2514ce77c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 
     Aml *dev = aml_device("TPM0");
     aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
 
     Aml *crs = aml_resource_template();
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8383b83ee3..2fb70847cb 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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
@@ -1844,6 +1848,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     if (TPM_IS_CRB(tpm)) {
         dev = aml_device("TPM");
         aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+        aml_append(dev, aml_name_decl("_STR",
+                                      aml_string("TPM 2.0 Device")));
         crs = aml_resource_template();
         aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
                                            TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
@@ -1851,6 +1857,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
 
+        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+
         tpm_build_ppi_acpi(tpm, dev);
 
         aml_append(sb_scope, dev);
-- 
2.31.1


