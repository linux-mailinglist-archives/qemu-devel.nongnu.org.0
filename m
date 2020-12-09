Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D42D4C10
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:40:07 +0100 (CET)
Received: from localhost ([::1]:36920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6Fq-0005Vu-Fe
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:40:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6At-0000EK-8W; Wed, 09 Dec 2020 15:34:59 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25934
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Ap-0005ro-JF; Wed, 09 Dec 2020 15:34:58 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9KWXpA148027; Wed, 9 Dec 2020 15:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=/NsgMwaSt0gd7MGEoAG/B0qEbfeohH1qg5XJV9rC2Pw=;
 b=aFokOL+Hvc/XDzwwPXn0v1c5fI5Irj+25AyUUf2POOkR6lQEqmH0/XA/eNYErQQh5szO
 UOb6aLDZxaCg49NQzjsMIJOCjk/vEf6KaI8ddkIdJUWwXGaTwQrcr7hLUJdb6JwykK42
 dyt7hA1g/e2KnkFgWjbUiRt7u/aiUav2D3nSDErSdwxsBxx41KjmPnbxfm/7msdyKtZt
 5Brbs00eE8lXP/WsJIsp58Svsy+IfQj86ZOOSfvN3U/x/OrL2TOmRABEu/RKz4wPHsYO
 rjzpYkm42XMVY8+NA3uot1mg4FCS0yevPWUI7rfXtBJcchF1ZSqyQsxrZlmT5jXpCaNj ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35awxt7c66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:50 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9KX9Hn151978;
 Wed, 9 Dec 2020 15:34:49 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35awxt7c5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:49 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9KWAv6029279;
 Wed, 9 Dec 2020 20:34:48 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3581u9gf1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 20:34:48 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9KYmu823003674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 20:34:48 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 177F1124054;
 Wed,  9 Dec 2020 20:34:48 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB682124052;
 Wed,  9 Dec 2020 20:34:45 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.37.122])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 20:34:45 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [RFC 6/8] s390x/pci: Handle devices that support relaxed alignment
Date: Wed,  9 Dec 2020 15:34:24 -0500
Message-Id: <1607546066-2240-7-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_16:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090140
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: pmorel@linux.ibm.com, david@redhat.com, schnelle@linux.ibm.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Certain zPCI device types (e.g. ISM) allow for a different set of address
alignment rules for PCISTB instructions.  Recognize this distinction and
perform only a subset of alignment checks for intercepted PCISTB
instructions.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c        | 34 ++++++++++++++++++++--------------
 hw/s390x/s390-pci-vfio.c        |  3 +++
 include/hw/s390x/s390-pci-clp.h |  1 +
 3 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index a5270d0..30698e5 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -868,25 +868,31 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
         return 0;
     }
 
-    /* Verify the address, offset and length */
-    /* offset must be a multiple of 8 */
-    if (offset % 8) {
-        goto specification_error;
-    }
-    /* Length must be greater than 8, a multiple of 8 */
-    /* and not greater than maxstbl */
-    if ((len <= 8) || (len % 8) ||
-        (len > pbdev->pci_group->zpci_group.maxstbl)) {
-        goto specification_error;
+    /*
+     * If the specified device supports relaxed alignment, some checks can
+     * be skipped.
+     */
+    if (!(pbdev->pci_group->zpci_group.fr & CLP_RSP_QPCIG_MASK_RELAXED)) {
+        /* Verify the address, offset and length */
+        /* offset must be a multiple of 8 */
+        if (offset % 8) {
+            goto specification_error;
+        }
+        /* Length must be greater than 8, a multiple of 8 */
+        /* and not greater than maxstbl */
+        if ((len <= 8) || (len % 8) ||
+            (len > pbdev->pci_group->zpci_group.maxstbl)) {
+            goto specification_error;
+        }
+        /* Guest address must be double word aligned */
+        if (gaddr & 0x07UL) {
+            goto specification_error;
+        }
     }
     /* Do not cross a 4K-byte boundary */
     if (((offset & 0xfff) + len) > 0x1000) {
         goto specification_error;
     }
-    /* Guest address must be double word aligned */
-    if (gaddr & 0x07UL) {
-        goto specification_error;
-    }
 
     ret = pbdev->ops.pcistb(pbdev, cpu, gaddr, ar, pcias, len, offset);
 
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 9296e1b..9439fe1 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -156,6 +156,9 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
         if (cap->flags & VFIO_DEVICE_INFO_ZPCI_FLAG_REFRESH) {
             resgrp->fr = 1;
         }
+        if (cap->flags & VFIO_DEVICE_INFO_ZPCI_FLAG_RELAXED) {
+            resgrp->fr |= CLP_RSP_QPCIG_MASK_RELAXED;
+        }
         resgrp->dasm = cap->dasm;
         resgrp->msia = cap->msi_addr;
         resgrp->mui = cap->mui;
diff --git a/include/hw/s390x/s390-pci-clp.h b/include/hw/s390x/s390-pci-clp.h
index 96b8e3f..73a28a0 100644
--- a/include/hw/s390x/s390-pci-clp.h
+++ b/include/hw/s390x/s390-pci-clp.h
@@ -158,6 +158,7 @@ typedef struct ClpRspQueryPciGrp {
 #define CLP_RSP_QPCIG_MASK_NOI 0xfff
     uint16_t i;
     uint8_t version;
+#define CLP_RSP_QPCIG_MASK_RELAXED 0x8
 #define CLP_RSP_QPCIG_MASK_FRAME   0x2
 #define CLP_RSP_QPCIG_MASK_REFRESH 0x1
     uint8_t fr;
-- 
1.8.3.1


