Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB19E387882
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:13:14 +0200 (CEST)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liyb1-0005I3-Rx
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1liyRp-0003UJ-9E; Tue, 18 May 2021 08:03:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1liyRm-00006A-2B; Tue, 18 May 2021 08:03:40 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IBYEiK104389; Tue, 18 May 2021 08:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=iSut7xRvZfAlQOJAA+XZUTJUgJQg/f/h+8z4WoIk6o0=;
 b=YHBjpBkKg6yFeksdlRGzq1G/on1shfFZDxkkMMfQLaQb/eE1lBJK1PBDsfLSKLjgQhDX
 JjCG9tdBdp7m5UDwhgIsoctYzNoA/VHVkYuRyTdLZ8dnoeAUMXN2wNLDoK+qQRYdhLyt
 n1Br97W7BoqlqQNo/tVEmRVFjcx2z/Xx9xt/XIVdhuhBxt5VrLCNL9MHNRZBEuvqtrq8
 +EWx7yst2A92O/1uwYlgfOjd/+L+6ZLCDMOXULn8Fiarzy45W8kos6YLF76+VIKTKr/n
 MafvYL7LGd8HH9PbxhtiFs/s9IwSroXEA65CcI0XECtdPYf8qy8I4oqjNF95Xl5zJBIt WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38mc3nhxvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 08:03:25 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14IBYI4B104617;
 Tue, 18 May 2021 08:03:24 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38mc3nhxug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 08:03:24 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14IC21Ra027399;
 Tue, 18 May 2021 12:03:22 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 38j5x7sd9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 12:03:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14IC3J3O34275754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 12:03:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADD0D11C05C;
 Tue, 18 May 2021 12:03:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69FAB11C05B;
 Tue, 18 May 2021 12:03:18 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.40.192.207])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 May 2021 12:03:18 +0000 (GMT)
Subject: [PATCH v5 1/3] spapr: nvdimm: Forward declare and move the definitions
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: david@gibson.dropbear.id.au, groug@kaod.org, qemu-ppc@nongnu.org
Date: Tue, 18 May 2021 08:03:17 -0400
Message-ID: <162133925415.610.11584121797866216417.stgit@4f1e6f2bd33e>
In-Reply-To: <162133924680.610.15121309741756314238.stgit@4f1e6f2bd33e>
References: <162133924680.610.15121309741756314238.stgit@4f1e6f2bd33e>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nURJiGFtWx-SUv85OPPVr5mM34Y0Snz1
X-Proofpoint-GUID: 05m0VebSloDSZmxGHl_7u3Juqh8TlDdb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105180082
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: nvdimm@lists.linux.dev, aneesh.kumar@linux.ibm.com, qemu-devel@nongnu.org,
 kvm-ppc@vger.kernel.org, shivaprasadbhat@gmail.com, bharata@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The subsequent patches add definitions which tend to get
the compilation to cyclic dependency. So, prepare with
forward declarations, move the definitions and clean up.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 hw/ppc/spapr_nvdimm.c         |   12 ++++++++++++
 include/hw/ppc/spapr_nvdimm.h |   14 ++------------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 252204e25f..3f57a8b6fa 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -35,6 +35,18 @@
 /* SCM device is unable to persist memory contents */
 #define PAPR_PMEM_UNARMED PPC_BIT(0)
 
+/*
+ * The nvdimm size should be aligned to SCM block size.
+ * The SCM block size should be aligned to SPAPR_MEMORY_BLOCK_SIZE
+ * in order to have SCM regions not to overlap with dimm memory regions.
+ * The SCM devices can have variable block sizes. For now, fixing the
+ * block size to the minimum value.
+ */
+#define SPAPR_MINIMUM_SCM_BLOCK_SIZE SPAPR_MEMORY_BLOCK_SIZE
+
+/* Have an explicit check for alignment */
+QEMU_BUILD_BUG_ON(SPAPR_MINIMUM_SCM_BLOCK_SIZE % SPAPR_MEMORY_BLOCK_SIZE);
+
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
                            uint64_t size, Error **errp)
 {
diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
index 73be250e2a..764f999f54 100644
--- a/include/hw/ppc/spapr_nvdimm.h
+++ b/include/hw/ppc/spapr_nvdimm.h
@@ -11,19 +11,9 @@
 #define HW_SPAPR_NVDIMM_H
 
 #include "hw/mem/nvdimm.h"
-#include "hw/ppc/spapr.h"
 
-/*
- * The nvdimm size should be aligned to SCM block size.
- * The SCM block size should be aligned to SPAPR_MEMORY_BLOCK_SIZE
- * inorder to have SCM regions not to overlap with dimm memory regions.
- * The SCM devices can have variable block sizes. For now, fixing the
- * block size to the minimum value.
- */
-#define SPAPR_MINIMUM_SCM_BLOCK_SIZE SPAPR_MEMORY_BLOCK_SIZE
-
-/* Have an explicit check for alignment */
-QEMU_BUILD_BUG_ON(SPAPR_MINIMUM_SCM_BLOCK_SIZE % SPAPR_MEMORY_BLOCK_SIZE);
+typedef struct SpaprDrc SpaprDrc;
+typedef struct SpaprMachineState SpaprMachineState;
 
 int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
                            void *fdt, int *fdt_start_offset, Error **errp);



