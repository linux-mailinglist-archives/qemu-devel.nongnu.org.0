Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1418D29913F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 16:40:25 +0100 (CET)
Received: from localhost ([::1]:35894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX4bf-0003XH-Vx
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 11:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kX4Wp-0006AY-IC; Mon, 26 Oct 2020 11:35:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kX4Wm-0000x3-Oa; Mon, 26 Oct 2020 11:35:23 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09QFXm2r170237; Mon, 26 Oct 2020 11:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=Vg7HxteOPDouvZdhNs3VLcRPs5DiOuYTU5xsameyPoQ=;
 b=TvGl6YLc6optQUlFFFKtpZarfcDHfHhx465vgvaH4qd5GY05TAPIx1fHS8MB3QysRszh
 3I4dix/Y56dk0vPm9A3/jC6VHAZsHdRAs3pxw0piuKl20Hg8D6e5WSH0iT/hpzeDGmyA
 dLyHI9389UFD8M06nFY527wmuYN+dpPTK/Uske/KY2+hvD8AoesGXRGQvcpPTaaA0Cjo
 EMxforvz2cGe3Fn3nQOV13PRiyuAVBPmDFmHk1UFVMOh3AifvwSG+ntqdU3WAchBSd9E
 vwMD0Mdb5IHU0QtL7Kzd1Q2DAKeI927PodSDTBEAq0gcEVHKP269xJVUom6+/J1MVl8B aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34dw518c27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 11:35:19 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09QFZ11R175872;
 Mon, 26 Oct 2020 11:35:18 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34dw518c1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 11:35:18 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09QFICvA028146;
 Mon, 26 Oct 2020 15:35:17 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 34cbw8vrub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 15:35:17 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09QFZH4n14615090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2020 15:35:17 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19E6E112065;
 Mon, 26 Oct 2020 15:35:17 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62F8B112061;
 Mon, 26 Oct 2020 15:35:14 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.49.29])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 26 Oct 2020 15:35:14 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH 08/13] s390x/pci: create a header dedicated to PCI CLP
Date: Mon, 26 Oct 2020 11:34:36 -0400
Message-Id: <1603726481-31824-9-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603726481-31824-1-git-send-email-mjrosato@linux.ibm.com>
References: <1603726481-31824-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_08:2020-10-26,
 2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260107
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 11:03:39
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org, pmorel@linux.ibm.com, david@redhat.com,
 schnelle@linux.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pierre Morel <pmorel@linux.ibm.com>

To have a clean separation between s390-pci-bus.h and s390-pci-inst.h
headers we export the PCI CLP instructions in a dedicated header.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 include/hw/s390x/s390-pci-bus.h  |   1 +
 include/hw/s390x/s390-pci-clp.h  | 211 +++++++++++++++++++++++++++++++++++++++
 include/hw/s390x/s390-pci-inst.h | 196 ------------------------------------
 3 files changed, 212 insertions(+), 196 deletions(-)
 create mode 100644 include/hw/s390x/s390-pci-clp.h

diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 6a35f13..5f339e5 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -19,6 +19,7 @@
 #include "hw/s390x/sclp.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/s390x/css.h"
+#include "hw/s390x/s390-pci-clp.h"
 #include "qom/object.h"
 
 #define TYPE_S390_PCI_HOST_BRIDGE "s390-pcihost"
diff --git a/include/hw/s390x/s390-pci-clp.h b/include/hw/s390x/s390-pci-clp.h
new file mode 100644
index 0000000..3708acd
--- /dev/null
+++ b/include/hw/s390x/s390-pci-clp.h
@@ -0,0 +1,211 @@
+/*
+ * s390 CLP instruction definitions
+ *
+ * Copyright 2019 IBM Corp.
+ * Author(s): Pierre Morel <pmorel@de.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#ifndef HW_S390_PCI_CLP
+#define HW_S390_PCI_CLP
+
+/* CLP common request & response block size */
+#define CLP_BLK_SIZE 4096
+#define PCI_BAR_COUNT 6
+#define PCI_MAX_FUNCTIONS 4096
+
+typedef struct ClpReqHdr {
+    uint16_t len;
+    uint16_t cmd;
+} QEMU_PACKED ClpReqHdr;
+
+typedef struct ClpRspHdr {
+    uint16_t len;
+    uint16_t rsp;
+} QEMU_PACKED ClpRspHdr;
+
+/* CLP Response Codes */
+#define CLP_RC_OK         0x0010  /* Command request successfully */
+#define CLP_RC_CMD        0x0020  /* Command code not recognized */
+#define CLP_RC_PERM       0x0030  /* Command not authorized */
+#define CLP_RC_FMT        0x0040  /* Invalid command request format */
+#define CLP_RC_LEN        0x0050  /* Invalid command request length */
+#define CLP_RC_8K         0x0060  /* Command requires 8K LPCB */
+#define CLP_RC_RESNOT0    0x0070  /* Reserved field not zero */
+#define CLP_RC_NODATA     0x0080  /* No data available */
+#define CLP_RC_FC_UNKNOWN 0x0100  /* Function code not recognized */
+
+/*
+ * Call Logical Processor - Command Codes
+ */
+#define CLP_LIST_PCI            0x0002
+#define CLP_QUERY_PCI_FN        0x0003
+#define CLP_QUERY_PCI_FNGRP     0x0004
+#define CLP_SET_PCI_FN          0x0005
+
+/* PCI function handle list entry */
+typedef struct ClpFhListEntry {
+    uint16_t device_id;
+    uint16_t vendor_id;
+#define CLP_FHLIST_MASK_CONFIG 0x80000000
+    uint32_t config;
+    uint32_t fid;
+    uint32_t fh;
+} QEMU_PACKED ClpFhListEntry;
+
+#define CLP_RC_SETPCIFN_FH      0x0101 /* Invalid PCI fn handle */
+#define CLP_RC_SETPCIFN_FHOP    0x0102 /* Fn handle not valid for op */
+#define CLP_RC_SETPCIFN_DMAAS   0x0103 /* Invalid DMA addr space */
+#define CLP_RC_SETPCIFN_RES     0x0104 /* Insufficient resources */
+#define CLP_RC_SETPCIFN_ALRDY   0x0105 /* Fn already in requested state */
+#define CLP_RC_SETPCIFN_ERR     0x0106 /* Fn in permanent error state */
+#define CLP_RC_SETPCIFN_RECPND  0x0107 /* Error recovery pending */
+#define CLP_RC_SETPCIFN_BUSY    0x0108 /* Fn busy */
+#define CLP_RC_LISTPCI_BADRT    0x010a /* Resume token not recognized */
+#define CLP_RC_QUERYPCIFG_PFGID 0x010b /* Unrecognized PFGID */
+
+/* request or response block header length */
+#define LIST_PCI_HDR_LEN 32
+
+/* Number of function handles fitting in response block */
+#define CLP_FH_LIST_NR_ENTRIES \
+    ((CLP_BLK_SIZE - 2 * LIST_PCI_HDR_LEN) \
+        / sizeof(ClpFhListEntry))
+
+#define CLP_SET_ENABLE_PCI_FN  0 /* Yes, 0 enables it */
+#define CLP_SET_DISABLE_PCI_FN 1 /* Yes, 1 disables it */
+
+#define CLP_UTIL_STR_LEN 64
+
+#define CLP_MASK_FMT 0xf0000000
+
+/* List PCI functions request */
+typedef struct ClpReqListPci {
+    ClpReqHdr hdr;
+    uint32_t fmt;
+    uint64_t reserved1;
+    uint64_t resume_token;
+    uint64_t reserved2;
+} QEMU_PACKED ClpReqListPci;
+
+/* List PCI functions response */
+typedef struct ClpRspListPci {
+    ClpRspHdr hdr;
+    uint32_t fmt;
+    uint64_t reserved1;
+    uint64_t resume_token;
+    uint32_t mdd;
+    uint16_t max_fn;
+    uint8_t flags;
+    uint8_t entry_size;
+    ClpFhListEntry fh_list[CLP_FH_LIST_NR_ENTRIES];
+} QEMU_PACKED ClpRspListPci;
+
+/* Query PCI function request */
+typedef struct ClpReqQueryPci {
+    ClpReqHdr hdr;
+    uint32_t fmt;
+    uint64_t reserved1;
+    uint32_t fh; /* function handle */
+    uint32_t reserved2;
+    uint64_t reserved3;
+} QEMU_PACKED ClpReqQueryPci;
+
+/* Query PCI function response */
+typedef struct ClpRspQueryPci {
+    ClpRspHdr hdr;
+    uint32_t fmt;
+    uint64_t reserved1;
+    uint16_t vfn; /* virtual fn number */
+#define CLP_RSP_QPCI_MASK_UTIL  0x100
+#define CLP_RSP_QPCI_MASK_PFGID 0xff
+    uint16_t ug;
+    uint32_t fid; /* pci function id */
+    uint8_t bar_size[PCI_BAR_COUNT];
+    uint16_t pchid;
+    uint32_t bar[PCI_BAR_COUNT];
+    uint64_t reserved2;
+    uint64_t sdma; /* start dma as */
+    uint64_t edma; /* end dma as */
+    uint32_t reserved3[11];
+    uint32_t uid;
+    uint8_t util_str[CLP_UTIL_STR_LEN]; /* utility string */
+} QEMU_PACKED ClpRspQueryPci;
+
+/* Query PCI function group request */
+typedef struct ClpReqQueryPciGrp {
+    ClpReqHdr hdr;
+    uint32_t fmt;
+    uint64_t reserved1;
+#define CLP_REQ_QPCIG_MASK_PFGID 0xff
+    uint32_t g;
+    uint32_t reserved2;
+    uint64_t reserved3;
+} QEMU_PACKED ClpReqQueryPciGrp;
+
+/* Query PCI function group response */
+typedef struct ClpRspQueryPciGrp {
+    ClpRspHdr hdr;
+    uint32_t fmt;
+    uint64_t reserved1;
+#define CLP_RSP_QPCIG_MASK_NOI 0xfff
+    uint16_t i;
+    uint8_t version;
+#define CLP_RSP_QPCIG_MASK_FRAME   0x2
+#define CLP_RSP_QPCIG_MASK_REFRESH 0x1
+    uint8_t fr;
+    uint16_t maxstbl;
+    uint16_t mui;
+    uint64_t reserved3;
+    uint64_t dasm; /* dma address space mask */
+    uint64_t msia; /* MSI address */
+    uint64_t reserved4;
+    uint64_t reserved5;
+} QEMU_PACKED ClpRspQueryPciGrp;
+
+/* Set PCI function request */
+typedef struct ClpReqSetPci {
+    ClpReqHdr hdr;
+    uint32_t fmt;
+    uint64_t reserved1;
+    uint32_t fh; /* function handle */
+    uint16_t reserved2;
+    uint8_t oc; /* operation controls */
+    uint8_t ndas; /* number of dma spaces */
+    uint64_t reserved3;
+} QEMU_PACKED ClpReqSetPci;
+
+/* Set PCI function response */
+typedef struct ClpRspSetPci {
+    ClpRspHdr hdr;
+    uint32_t fmt;
+    uint64_t reserved1;
+    uint32_t fh; /* function handle */
+    uint32_t reserved3;
+    uint64_t reserved4;
+} QEMU_PACKED ClpRspSetPci;
+
+typedef struct ClpReqRspListPci {
+    ClpReqListPci request;
+    ClpRspListPci response;
+} QEMU_PACKED ClpReqRspListPci;
+
+typedef struct ClpReqRspSetPci {
+    ClpReqSetPci request;
+    ClpRspSetPci response;
+} QEMU_PACKED ClpReqRspSetPci;
+
+typedef struct ClpReqRspQueryPci {
+    ClpReqQueryPci request;
+    ClpRspQueryPci response;
+} QEMU_PACKED ClpReqRspQueryPci;
+
+typedef struct ClpReqRspQueryPciGrp {
+    ClpReqQueryPciGrp request;
+    ClpRspQueryPciGrp response;
+} QEMU_PACKED ClpReqRspQueryPciGrp;
+
+#endif
diff --git a/include/hw/s390x/s390-pci-inst.h b/include/hw/s390x/s390-pci-inst.h
index 8ee3a3c..a55c448 100644
--- a/include/hw/s390x/s390-pci-inst.h
+++ b/include/hw/s390x/s390-pci-inst.h
@@ -17,202 +17,6 @@
 #include "s390-pci-bus.h"
 #include "sysemu/dma.h"
 
-/* CLP common request & response block size */
-#define CLP_BLK_SIZE 4096
-#define PCI_BAR_COUNT 6
-#define PCI_MAX_FUNCTIONS 4096
-
-typedef struct ClpReqHdr {
-    uint16_t len;
-    uint16_t cmd;
-} QEMU_PACKED ClpReqHdr;
-
-typedef struct ClpRspHdr {
-    uint16_t len;
-    uint16_t rsp;
-} QEMU_PACKED ClpRspHdr;
-
-/* CLP Response Codes */
-#define CLP_RC_OK         0x0010  /* Command request successfully */
-#define CLP_RC_CMD        0x0020  /* Command code not recognized */
-#define CLP_RC_PERM       0x0030  /* Command not authorized */
-#define CLP_RC_FMT        0x0040  /* Invalid command request format */
-#define CLP_RC_LEN        0x0050  /* Invalid command request length */
-#define CLP_RC_8K         0x0060  /* Command requires 8K LPCB */
-#define CLP_RC_RESNOT0    0x0070  /* Reserved field not zero */
-#define CLP_RC_NODATA     0x0080  /* No data available */
-#define CLP_RC_FC_UNKNOWN 0x0100  /* Function code not recognized */
-
-/*
- * Call Logical Processor - Command Codes
- */
-#define CLP_LIST_PCI            0x0002
-#define CLP_QUERY_PCI_FN        0x0003
-#define CLP_QUERY_PCI_FNGRP     0x0004
-#define CLP_SET_PCI_FN          0x0005
-
-/* PCI function handle list entry */
-typedef struct ClpFhListEntry {
-    uint16_t device_id;
-    uint16_t vendor_id;
-#define CLP_FHLIST_MASK_CONFIG 0x80000000
-    uint32_t config;
-    uint32_t fid;
-    uint32_t fh;
-} QEMU_PACKED ClpFhListEntry;
-
-#define CLP_RC_SETPCIFN_FH      0x0101 /* Invalid PCI fn handle */
-#define CLP_RC_SETPCIFN_FHOP    0x0102 /* Fn handle not valid for op */
-#define CLP_RC_SETPCIFN_DMAAS   0x0103 /* Invalid DMA addr space */
-#define CLP_RC_SETPCIFN_RES     0x0104 /* Insufficient resources */
-#define CLP_RC_SETPCIFN_ALRDY   0x0105 /* Fn already in requested state */
-#define CLP_RC_SETPCIFN_ERR     0x0106 /* Fn in permanent error state */
-#define CLP_RC_SETPCIFN_RECPND  0x0107 /* Error recovery pending */
-#define CLP_RC_SETPCIFN_BUSY    0x0108 /* Fn busy */
-#define CLP_RC_LISTPCI_BADRT    0x010a /* Resume token not recognized */
-#define CLP_RC_QUERYPCIFG_PFGID 0x010b /* Unrecognized PFGID */
-
-/* request or response block header length */
-#define LIST_PCI_HDR_LEN 32
-
-/* Number of function handles fitting in response block */
-#define CLP_FH_LIST_NR_ENTRIES \
-    ((CLP_BLK_SIZE - 2 * LIST_PCI_HDR_LEN) \
-        / sizeof(ClpFhListEntry))
-
-#define CLP_SET_ENABLE_PCI_FN  0 /* Yes, 0 enables it */
-#define CLP_SET_DISABLE_PCI_FN 1 /* Yes, 1 disables it */
-
-#define CLP_UTIL_STR_LEN 64
-
-#define CLP_MASK_FMT 0xf0000000
-
-/* List PCI functions request */
-typedef struct ClpReqListPci {
-    ClpReqHdr hdr;
-    uint32_t fmt;
-    uint64_t reserved1;
-    uint64_t resume_token;
-    uint64_t reserved2;
-} QEMU_PACKED ClpReqListPci;
-
-/* List PCI functions response */
-typedef struct ClpRspListPci {
-    ClpRspHdr hdr;
-    uint32_t fmt;
-    uint64_t reserved1;
-    uint64_t resume_token;
-    uint32_t mdd;
-    uint16_t max_fn;
-    uint8_t flags;
-    uint8_t entry_size;
-    ClpFhListEntry fh_list[CLP_FH_LIST_NR_ENTRIES];
-} QEMU_PACKED ClpRspListPci;
-
-/* Query PCI function request */
-typedef struct ClpReqQueryPci {
-    ClpReqHdr hdr;
-    uint32_t fmt;
-    uint64_t reserved1;
-    uint32_t fh; /* function handle */
-    uint32_t reserved2;
-    uint64_t reserved3;
-} QEMU_PACKED ClpReqQueryPci;
-
-/* Query PCI function response */
-typedef struct ClpRspQueryPci {
-    ClpRspHdr hdr;
-    uint32_t fmt;
-    uint64_t reserved1;
-    uint16_t vfn; /* virtual fn number */
-#define CLP_RSP_QPCI_MASK_UTIL  0x100
-#define CLP_RSP_QPCI_MASK_PFGID 0xff
-    uint16_t ug;
-    uint32_t fid; /* pci function id */
-    uint8_t bar_size[PCI_BAR_COUNT];
-    uint16_t pchid;
-    uint32_t bar[PCI_BAR_COUNT];
-    uint64_t reserved2;
-    uint64_t sdma; /* start dma as */
-    uint64_t edma; /* end dma as */
-    uint32_t reserved3[11];
-    uint32_t uid;
-    uint8_t util_str[CLP_UTIL_STR_LEN]; /* utility string */
-} QEMU_PACKED ClpRspQueryPci;
-
-/* Query PCI function group request */
-typedef struct ClpReqQueryPciGrp {
-    ClpReqHdr hdr;
-    uint32_t fmt;
-    uint64_t reserved1;
-#define CLP_REQ_QPCIG_MASK_PFGID 0xff
-    uint32_t g;
-    uint32_t reserved2;
-    uint64_t reserved3;
-} QEMU_PACKED ClpReqQueryPciGrp;
-
-/* Query PCI function group response */
-typedef struct ClpRspQueryPciGrp {
-    ClpRspHdr hdr;
-    uint32_t fmt;
-    uint64_t reserved1;
-#define CLP_RSP_QPCIG_MASK_NOI 0xfff
-    uint16_t i;
-    uint8_t version;
-#define CLP_RSP_QPCIG_MASK_FRAME   0x2
-#define CLP_RSP_QPCIG_MASK_REFRESH 0x1
-    uint8_t fr;
-    uint16_t maxstbl;
-    uint16_t mui;
-    uint64_t reserved3;
-    uint64_t dasm; /* dma address space mask */
-    uint64_t msia; /* MSI address */
-    uint64_t reserved4;
-    uint64_t reserved5;
-} QEMU_PACKED ClpRspQueryPciGrp;
-
-/* Set PCI function request */
-typedef struct ClpReqSetPci {
-    ClpReqHdr hdr;
-    uint32_t fmt;
-    uint64_t reserved1;
-    uint32_t fh; /* function handle */
-    uint16_t reserved2;
-    uint8_t oc; /* operation controls */
-    uint8_t ndas; /* number of dma spaces */
-    uint64_t reserved3;
-} QEMU_PACKED ClpReqSetPci;
-
-/* Set PCI function response */
-typedef struct ClpRspSetPci {
-    ClpRspHdr hdr;
-    uint32_t fmt;
-    uint64_t reserved1;
-    uint32_t fh; /* function handle */
-    uint32_t reserved3;
-    uint64_t reserved4;
-} QEMU_PACKED ClpRspSetPci;
-
-typedef struct ClpReqRspListPci {
-    ClpReqListPci request;
-    ClpRspListPci response;
-} QEMU_PACKED ClpReqRspListPci;
-
-typedef struct ClpReqRspSetPci {
-    ClpReqSetPci request;
-    ClpRspSetPci response;
-} QEMU_PACKED ClpReqRspSetPci;
-
-typedef struct ClpReqRspQueryPci {
-    ClpReqQueryPci request;
-    ClpRspQueryPci response;
-} QEMU_PACKED ClpReqRspQueryPci;
-
-typedef struct ClpReqRspQueryPciGrp {
-    ClpReqQueryPciGrp request;
-    ClpRspQueryPciGrp response;
-} QEMU_PACKED ClpReqRspQueryPciGrp;
-
 /* Load/Store status codes */
 #define ZPCI_PCI_ST_FUNC_NOT_ENABLED        4
 #define ZPCI_PCI_ST_FUNC_IN_ERR             8
-- 
1.8.3.1


