Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7246797F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:34:49 +0100 (CET)
Received: from localhost ([::1]:41248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9eD-0006hf-1g
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt9X2-00068k-Iz; Fri, 03 Dec 2021 09:27:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14858
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt9X1-0004qz-1X; Fri, 03 Dec 2021 09:27:24 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3EGLf2021587; 
 Fri, 3 Dec 2021 14:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=684a3KanxbWDJYheW5Pw1bIDa5nuw/P/CognOD2zpAY=;
 b=GX3DqAzuLLzQTV1QxBSlhDbAPxkF7QGxLjrblMKKJ4PkcbtIpOsq+1lHzUKutkBzX78v
 Vw28YureElvjPsoj2gBJlPuIopfOz09ypnfpW+HTziMwJOK62zPlsPkvQ93oyrZ8fefP
 ha1Ko1HPqPFybVRfY/t9gdgxcn01iBRV46ik+BRvVnyOsCyYaynCPPh+f3SV4JOu4X4C
 S8f4DbrbdAQwLkYT+o9IkruB3KziLAtYveknSUDgSlroLI6xWmkSghRR1VI6ZwOSp/Ll
 I8qa8rgtAbiaPIef1DXLLZfJVUdxu3GXHWTrzDxKbrh7cJzZMoB9h8SNR8N91RmDHHyd jA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqmuu88ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:20 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3EHPsx025031;
 Fri, 3 Dec 2021 14:27:20 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqmuu88nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:20 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3EMAPn014699;
 Fri, 3 Dec 2021 14:27:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3cn3k3vxrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:19 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3ERHm755640334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 14:27:17 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C70FC6E05D;
 Fri,  3 Dec 2021 14:27:17 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D12BA6E04E;
 Fri,  3 Dec 2021 14:27:16 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.96.25])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 14:27:16 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] s390x/pci: add supported DT information to clp response
Date: Fri,  3 Dec 2021 09:27:06 -0500
Message-Id: <20211203142706.427279-5-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211203142706.427279-1-mjrosato@linux.ibm.com>
References: <20211203142706.427279-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oOcSAShK-L_uU9xPylPW337kSvINKRAr
X-Proofpoint-GUID: OlCobfbqjlsJh_N3B6Prd-ZaG6exGwMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_07,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030088
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The DTSM is a mask that specifies which I/O Address Translation designation
types are supported.  Today QEMU only supports DT=1.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c         | 1 +
 hw/s390x/s390-pci-inst.c        | 1 +
 hw/s390x/s390-pci-vfio.c        | 1 +
 include/hw/s390x/s390-pci-bus.h | 1 +
 include/hw/s390x/s390-pci-clp.h | 3 ++-
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 1b51a72838..01b58ebc70 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -782,6 +782,7 @@ static void s390_pci_init_default_group(void)
     resgrp->i = 128;
     resgrp->maxstbl = 128;
     resgrp->version = 0;
+    resgrp->dtsm = ZPCI_DTSM;
 }
 
 static void set_pbdev_info(S390PCIBusDevice *pbdev)
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 07bab85ce5..6d400d4147 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -329,6 +329,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
         stw_p(&resgrp->i, group->zpci_group.i);
         stw_p(&resgrp->maxstbl, group->zpci_group.maxstbl);
         resgrp->version = group->zpci_group.version;
+        resgrp->dtsm = group->zpci_group.dtsm;
         stw_p(&resgrp->hdr.rsp, CLP_RC_OK);
         break;
     }
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 2a153fa8c9..6f80a47e29 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -160,6 +160,7 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
         resgrp->i = cap->noi;
         resgrp->maxstbl = cap->maxstbl;
         resgrp->version = cap->version;
+        resgrp->dtsm = ZPCI_DTSM;
     }
 }
 
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 2727e7bdef..da3cde2bb4 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -37,6 +37,7 @@
 #define ZPCI_MAX_UID 0xffff
 #define UID_UNDEFINED 0
 #define UID_CHECKING_ENABLED 0x01
+#define ZPCI_DTSM 0x40
 
 OBJECT_DECLARE_SIMPLE_TYPE(S390pciState, S390_PCI_HOST_BRIDGE)
 OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBus, S390_PCI_BUS)
diff --git a/include/hw/s390x/s390-pci-clp.h b/include/hw/s390x/s390-pci-clp.h
index 96b8e3f133..cc8c8662b8 100644
--- a/include/hw/s390x/s390-pci-clp.h
+++ b/include/hw/s390x/s390-pci-clp.h
@@ -163,7 +163,8 @@ typedef struct ClpRspQueryPciGrp {
     uint8_t fr;
     uint16_t maxstbl;
     uint16_t mui;
-    uint64_t reserved3;
+    uint8_t dtsm;
+    uint8_t reserved3[7];
     uint64_t dasm; /* dma address space mask */
     uint64_t msia; /* MSI address */
     uint64_t reserved4;
-- 
2.27.0


