Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744985AB7B1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 19:42:23 +0200 (CEST)
Received: from localhost ([::1]:54216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUAgQ-0002GO-DC
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 13:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1oUASS-0006rB-Pc; Fri, 02 Sep 2022 13:27:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1oUASR-0005fu-9c; Fri, 02 Sep 2022 13:27:56 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282GsYm2011428;
 Fri, 2 Sep 2022 17:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eVc88c1oVFdg3AuMVyTsE+Q8al24/YxWqqho3lpUAY0=;
 b=UiiGYJPy3LFFDOuETaZNB46vi4Ee/xvnbMWxBPevzj6FnXyGqTwSIID7l8Q55lOTCuAX
 wobXl7XbRobCiGWzDySYhAhP92kS64LICQwi88MxdAsxYLePt6pRFX7Tk40zsTCDwLIM
 +pJBwfVvZf8qnq/UrMDfvVXGvvZWGPb0fTze5UuHJHGKjoJ9MFhiuGfHxf1jdONPoeF4
 Vr/tnCUKaNC8fVndIw6ijPcqk5aft1u0WsDPHgXLw+ftoPD8tVPgKf+lys7SrHmskulC
 dSzYFTlmrkUcCLBzX6U1yYHP9uynGzvbfgTFeNGF54L1jEVc2nBIaipXUt2/zlUrC6g7 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jbns1rvp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 17:27:52 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 282Gsg76012071;
 Fri, 2 Sep 2022 17:27:52 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jbns1rvnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 17:27:52 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 282HL9Tg019242;
 Fri, 2 Sep 2022 17:27:51 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3j7awakkn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 17:27:51 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 282HRnMb13435520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Sep 2022 17:27:49 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBB516E050;
 Fri,  2 Sep 2022 17:27:49 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F90F6E04E;
 Fri,  2 Sep 2022 17:27:48 +0000 (GMT)
Received: from li-2311da4c-2e09-11b2-a85c-c003041e9174.ibm.com.com (unknown
 [9.160.86.252])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Sep 2022 17:27:48 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, mst@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v8 7/8] s390x/pci: reflect proper maxstbl for groups of
 interpreted devices
Date: Fri,  2 Sep 2022 13:27:36 -0400
Message-Id: <20220902172737.170349-8-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902172737.170349-1-mjrosato@linux.ibm.com>
References: <20220902172737.170349-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YHSEm32brxdM4IP_B5NA5apKyUZgXtkb
X-Proofpoint-ORIG-GUID: ZuSBGgXnMiAafah9FxhywvwBlutk-RRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209020080
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The maximum supported store block length might be different depending
on whether the instruction is interpretively executed (firmware-reported
maximum) or handled via userspace intercept (host kernel API maximum).
Choose the best available value during group creation.

Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-vfio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 985980f021..212dd053f7 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -213,7 +213,11 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
         resgrp->msia = cap->msi_addr;
         resgrp->mui = cap->mui;
         resgrp->i = cap->noi;
-        resgrp->maxstbl = cap->maxstbl;
+        if (pbdev->interp && hdr->version >= 2) {
+            resgrp->maxstbl = cap->imaxstbl;
+        } else {
+            resgrp->maxstbl = cap->maxstbl;
+        }
         resgrp->version = cap->version;
         resgrp->dtsm = ZPCI_DTSM;
     }
-- 
2.37.2


