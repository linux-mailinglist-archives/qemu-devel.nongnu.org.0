Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE105AB7C5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 19:47:46 +0200 (CEST)
Received: from localhost ([::1]:36242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUAld-0007eS-E8
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 13:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1oUASQ-0006r5-Cy; Fri, 02 Sep 2022 13:27:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1oUASO-0005f4-F0; Fri, 02 Sep 2022 13:27:54 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282HDiPp005315;
 Fri, 2 Sep 2022 17:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pnALT//8stfMoEchFPLKjGSAPmY6cq3EGWEXTDkcJyU=;
 b=d3P+g88PtGt4jwZX/jYBWMjS9LT7dq/KMmUY41HLN1+ULCALZwSo3xS4FPrqNgwBHjqi
 bODykfGlb/csliLkaKdYCtsnyxmj9uCGM97MiYyOX6rMQL5HmgcLbud88DWHhFNL5Ydc
 aIlKZn5s0Vbdb2fb8wDsQdTfCvUg34zvhkPGXkBSbuuJhq7azRWysNw50p0iJSQTKRe7
 MczmtdpI93i/0EQUsFqZl6HajBubjnOoAmyhqZULO5zTuf+PRkT9R0omUvAbjrNmZyuM
 CBfcv7svK3e4i5Z7RGfjVc6nsOgGiSmWkjIi3LxwVtG9oLDQmYGTTq1ZarsBVNaIr3Av wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jbp218a9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 17:27:48 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 282HFbV9016779;
 Fri, 2 Sep 2022 17:27:48 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jbp218a8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 17:27:48 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 282HKB1k005724;
 Fri, 2 Sep 2022 17:27:46 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 3j7awa9bbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 17:27:46 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 282HRkDg44237236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Sep 2022 17:27:46 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 957316E052;
 Fri,  2 Sep 2022 17:27:45 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54F3D6E04E;
 Fri,  2 Sep 2022 17:27:44 +0000 (GMT)
Received: from li-2311da4c-2e09-11b2-a85c-c003041e9174.ibm.com.com (unknown
 [9.160.86.252])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Sep 2022 17:27:44 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, mst@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v8 4/8] s390x/pci: don't fence interpreted devices without
 MSI-X
Date: Fri,  2 Sep 2022 13:27:33 -0400
Message-Id: <20220902172737.170349-5-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902172737.170349-1-mjrosato@linux.ibm.com>
References: <20220902172737.170349-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i3ccNw3vcfYQfn0_GORl0IGZH5t_xqMr
X-Proofpoint-GUID: gX8Pi7nR-qWPsulc1NiHnlG3Dq2DL9kw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209020080
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

Lack of MSI-X support is not an issue for interpreted passthrough
devices, so let's let these in.  This will allow, for example, ISM
devices to be passed through -- but only when interpretation is
available and being used.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 156051e6e9..816d17af99 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -881,6 +881,10 @@ static int s390_pci_msix_init(S390PCIBusDevice *pbdev)
 
 static void s390_pci_msix_free(S390PCIBusDevice *pbdev)
 {
+    if (pbdev->msix.entries == 0) {
+        return;
+    }
+
     memory_region_del_subregion(&pbdev->iommu->mr, &pbdev->msix_notify_mr);
     object_unparent(OBJECT(&pbdev->msix_notify_mr));
 }
@@ -1093,7 +1097,7 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
             pbdev->interp = false;
         }
 
-        if (s390_pci_msix_init(pbdev)) {
+        if (s390_pci_msix_init(pbdev) && !pbdev->interp) {
             error_setg(errp, "MSI-X support is mandatory "
                        "in the S390 architecture");
             return;
-- 
2.37.2


