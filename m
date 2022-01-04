Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F5484762
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:02:24 +0100 (CET)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4o8d-0002Sz-FO
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:02:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n4o4m-0005Xw-HP
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:58:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n4o4i-0002ZX-BZ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:58:24 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 204GHGZ5010809; 
 Tue, 4 Jan 2022 17:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=WgFrvgfuRWOPxLLbBsBFhDn0pOo4IrX5u6ZkoslaMpQ=;
 b=GfqX/jflaMu9mYv+okIGf81Abz8crE6RHMutRFdt675p0xmlIOO3AjG22eNdMOg+axos
 MHKxhV+StTs+v29nrd5x/YYxQYJPMo5CWnmmZo2wzZC7/LyIO3oenZGZqQPqYjiyRtIQ
 /PLC19xfhWRov+svrHOG7TIIZaSdGI2Ss93wkP56g6mfTgQZdi0McwQCaCcBT52rgdUS
 6GyO7oqu6wXY9zP1JwLWQoG8XLEgTDKzP7tGDJtZb4/Ft73MTq1mwDRW/KKjqtc6ULZV
 RQQtPDAss77GV6QOvTvImzcHfrHtBVrVEpfJ/sxciw8L/lCiFRexr/rPEfnPBFUNt8n5 Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcq0rde6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 17:58:18 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 204HqCA2003288;
 Tue, 4 Jan 2022 17:58:17 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcq0rde69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 17:58:17 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 204HvuIf030709;
 Tue, 4 Jan 2022 17:58:16 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3daekafwgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 17:58:16 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 204HwF6C9503520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 17:58:15 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2418B124055;
 Tue,  4 Jan 2022 17:58:15 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C431124054;
 Tue,  4 Jan 2022 17:58:15 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jan 2022 17:58:15 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/3] acpi: tpm: Add missing device identification objects
Date: Tue,  4 Jan 2022 12:58:05 -0500
Message-Id: <20220104175806.872996-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104175806.872996-1-stefanb@linux.ibm.com>
References: <20220104175806.872996-1-stefanb@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wXQsExf7eh5tZixLl3Fy09XZyaV0bmZI
X-Proofpoint-ORIG-GUID: 9dEEgT94EcBgFCa74R1jVmWv71w55P9D
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040117
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add missing TPM device identification objects _STR and _UID. They will
appear as files 'description' and 'uid' under Linux sysfs.

Following inspection of sysfs entries for hardware TPMs we chose
uid '1'.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/708
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-id: 20211223022310.575496-3-stefanb@linux.ibm.com
---
 hw/arm/virt-acpi-build.c | 1 +
 hw/i386/acpi-build.c     | 7 +++++++
 2 files changed, 8 insertions(+)

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
index 8383b83ee3..05740b7f15 100644
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
@@ -1844,12 +1848,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     if (TPM_IS_CRB(tpm)) {
         dev = aml_device("TPM");
         aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+        aml_append(dev, aml_name_decl("_STR",
+                                      aml_string("TPM 2.0 Device")));
         crs = aml_resource_template();
         aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
                                            TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
         aml_append(dev, aml_name_decl("_CRS", crs));
 
         aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
 
         tpm_build_ppi_acpi(tpm, dev);
 
-- 
2.31.1


