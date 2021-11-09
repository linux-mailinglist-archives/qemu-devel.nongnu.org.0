Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E0E449FE0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:42:47 +0100 (CET)
Received: from localhost ([::1]:42976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFDq-000650-8c
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:42:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1mkF92-0004ot-9U; Mon, 08 Nov 2021 19:37:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1mkF90-0003xC-64; Mon, 08 Nov 2021 19:37:47 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A90OGL1005885; 
 Tue, 9 Nov 2021 00:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=0+DDYuk7CjXFOYstfS374XrjeLmRrwX7pdEKd+GhHOw=;
 b=g1C7k4Dj+m83Fo/9ircRwXy9GXHF331CYV5pnRSxnuRTOpSSSQi4BLXxcpAPZUHnGQ0w
 eAuP1hPfVbiz4JKQGjJjJ/YE8rzy4MNs7sV7KOok2dC8WG/LdKuOYe9GoOIUABDmNpqS
 oFIRUptsP+YvWafcHcnNtFtk37vO38gNZSeE4PItMzf8K0NLR44KxjUahW3ea8lfpFhz
 8hxpN2ZkgPVRbYdGcpO7smsh6ooNWcZ3C1mw4y1+s/OVkxl9VbFAJuTSjXG37K4zGkKk
 OtdEr2DH4ooNvl7QTcoUXpvJhOb5p4ZoZLVtNPfc0dVdCBKDa42jsyzP+QVfFWjW4S7S yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7edp07ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 00:37:41 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A90U8fQ000562;
 Tue, 9 Nov 2021 00:37:40 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7edp07u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 00:37:40 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A90TpfI015850;
 Tue, 9 Nov 2021 00:37:39 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3c5hbasphv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 00:37:39 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A90bcY144368358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 00:37:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EDC3BE051;
 Tue,  9 Nov 2021 00:37:38 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEFD4BE04F;
 Tue,  9 Nov 2021 00:37:37 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 00:37:37 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: [PATCH] acpi: tpm: Add missing device identification objects
Date: Mon,  8 Nov 2021 19:37:33 -0500
Message-Id: <20211109003733.3177378-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rJBG7l52s7eodIiDiIdG46Z8mv8SJXpa
X-Proofpoint-ORIG-GUID: larlfBZU2zx-WCMVuuq_mqXZeeum-thF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_07,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=987 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
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
Fixes: #708
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 hw/arm/virt-acpi-build.c | 1 +
 hw/i386/acpi-build.c     | 4 ++++
 2 files changed, 5 insertions(+)

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
index a3ad6abd33..d6d3541407 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1808,6 +1808,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                     dev = aml_device("TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_string("MSFT0101")));
+                    aml_append(dev,
+                               aml_name_decl("_STR",
+                                             aml_string("TPM 2.0 Device")));
+                    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
                 } else {
                     dev = aml_device("ISA.TPM");
                     aml_append(dev, aml_name_decl("_HID",
-- 
2.31.1


