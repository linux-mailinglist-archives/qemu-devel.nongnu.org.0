Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3523A6EB8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:17:43 +0200 (CEST)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lss5e-0001jn-FP
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lss1r-0003gY-CU
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:13:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50432
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lss1n-0001Ki-9e
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:13:47 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EJ5HxX083923
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7WCfICfjA6cU2BCbvpxu40nCzfaoT5hsc+cAcELQvIA=;
 b=WHt/iXo7VM15AMP6FN8DUWj9qmVW6J55ZJ4H1gu4k08LNX2AU8Egx97Pd6i6Cr02H0Ij
 lkyV4a21Nv9F0j5QmXUmexo5iziGcg4rRBX/ubYVHbavMxxO6sE6a14ykJFJtN1lZjTe
 aVQSeubhvHn88muE6Ctf8N7LEt8NhYF087ev3q3WBfsBLz5KbWkr6eVAdrD75wPHp44a
 jIy567019RS1ELEn42cBxJvjGjnMiALwDNmj/88qkD7d33tWSQzx9kIWJkl3T6QA/GS0
 Quw1zX9JVRx0N9aYjV/xMOy0M4tZ1wtaAxQSnUiuwoW4jfbrfXre8eoYla7sWQ3LNpTq sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396cr2rhtp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:42 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15EJ5hH1085182
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:41 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396cr2rhtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 15:13:41 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15EJ7XxP021911;
 Mon, 14 Jun 2021 19:13:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 394mj9een6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 19:13:40 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15EJDdUI29163804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 19:13:39 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85988136055;
 Mon, 14 Jun 2021 19:13:39 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EDFD136060;
 Mon, 14 Jun 2021 19:13:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.47.158.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 19:13:39 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] acpi: Eliminate all TPM related code if CONFIG_TPM is
 not set
Date: Mon, 14 Jun 2021 15:13:34 -0400
Message-Id: <20210614191335.1968807-4-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614191335.1968807-1-stefanb@linux.ibm.com>
References: <20210614191335.1968807-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CTXmU_uR9UaNQuajcLwyoDcLEcvqEuOY
X-Proofpoint-ORIG-GUID: AO_VnZz06t8XvZEcU4PJnvrkwbhieQxI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_13:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140121
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "M : Michael S . Tsirkin" <mst@redhat.com>, philmd@redhat.com,
 armbru@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: M: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 hw/acpi/aml-build.c   | 2 ++
 include/hw/acpi/tpm.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index f0035d2b4a..d5103e6d7b 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2044,6 +2044,7 @@ build_hdr:
                  "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
 }
 
+#ifdef CONFIG_TPM
 /*
  * build_tpm2 - Build the TPM2 table as specified in
  * table 7: TCG Hardware Interface Description Table Format for TPM 2.0
@@ -2101,6 +2102,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                  (void *)(table_data->data + tpm2_start),
                  "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
 }
+#endif
 
 Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
                uint32_t mmio32_offset, uint64_t mmio64_offset,
diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
index 1a2a57a21f..559ba6906c 100644
--- a/include/hw/acpi/tpm.h
+++ b/include/hw/acpi/tpm.h
@@ -21,6 +21,8 @@
 #include "hw/acpi/aml-build.h"
 #include "sysemu/tpm.h"
 
+#ifdef CONFIG_TPM
+
 #define TPM_TIS_ADDR_BASE           0xFED40000
 #define TPM_TIS_ADDR_SIZE           0x5000
 
@@ -209,4 +211,6 @@ REG32(CRB_DATA_BUFFER, 0x80)
 
 void tpm_build_ppi_acpi(TPMIf *tpm, Aml *dev);
 
+#endif /* CONFIG_TPM */
+
 #endif /* HW_ACPI_TPM_H */
-- 
2.31.1


