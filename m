Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1372FC197
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:53:40 +0100 (CET)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1y0R-0001rY-IH
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrp-0002h3-Mx; Tue, 19 Jan 2021 15:44:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrn-0002R9-Ga; Tue, 19 Jan 2021 15:44:45 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JKVVLZ042475; Tue, 19 Jan 2021 15:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=UN4iGXiNFl5YtKdz36uIRyYgj8OuTqVvi59P1XeP7qE=;
 b=qahj7GB5g0JsgXT24FOa2WiSxSLOvu3Dqcbbqoz/Mp07VZnBpQVi5CDBXgvgYdWTcJ5S
 VLK6n/HQ1gkQfoYdQFpGYKrxuOR0edB2Q9PN5wTjkFxu/DUMr078hV3fzHRsmxPJkwdJ
 xQUhI6zXS5iTRzXLL8b0xrfMiJP1LwNknyp05ZNmGuUztuja39tRyaW2+siOfbSWYNhE
 BHBnyk+WUkn+dJr2CSF2GndKNluP4kXEAAjF1fpb1UtAVAU4x+13JRFA6XLmmkhjWglJ
 mKuuwrtXMCRQs/0QsUVS1k7122bbUiWkFczD7aNiwdv3mCQik0Tdq7KuGGwuPYNbXjU/ PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665eh1srh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:40 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10JKW3xW044134;
 Tue, 19 Jan 2021 15:44:37 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665eh1sn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:36 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JKaPvs030721;
 Tue, 19 Jan 2021 20:44:29 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 363qs974j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 20:44:28 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JKiR1L27918754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:44:27 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EB95136055;
 Tue, 19 Jan 2021 20:44:27 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76BDD136051;
 Tue, 19 Jan 2021 20:44:25 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.56.144])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 20:44:25 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH 2/8] s390x/pci: Keep track of the PCI Function type
Date: Tue, 19 Jan 2021 15:44:13 -0500
Message-Id: <1611089059-6468-3-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_09:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190110
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: pmorel@linux.ibm.com, david@redhat.com, schnelle@linux.ibm.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We now receive the hardware identification of the PCI Function type
through vfio.  While we can't yet forward that to a guest via CLP,
we can still use this to make device-type-dependent decisions in
QEMU.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-vfio.c        | 1 +
 include/hw/s390x/s390-pci-bus.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index ead4f22..cb59e98 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -125,6 +125,7 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
     /* The following values remain 0 until we support other FMB formats */
     pbdev->zpci_fn.fmbl = 0;
     pbdev->zpci_fn.pft = 0;
+    pbdev->pft = cap->pft;
 }
 
 static void s390_pci_read_group(S390PCIBusDevice *pbdev,
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 49ae9f0..0662e7b 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -342,6 +342,7 @@ struct S390PCIBusDevice {
     uint16_t noi;
     uint16_t maxstbl;
     uint8_t sum;
+    uint8_t pft;
     S390PCIGroup *pci_group;
     ClpRspQueryPci zpci_fn;
     S390MsixInfo msix;
-- 
1.8.3.1


