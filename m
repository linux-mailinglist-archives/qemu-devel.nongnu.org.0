Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9F32B53EB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 22:45:00 +0100 (CET)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kemJ0-0005qI-Eb
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 16:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kemGx-0005Dg-LW; Mon, 16 Nov 2020 16:42:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kemGt-0001Xs-MZ; Mon, 16 Nov 2020 16:42:51 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AGLXVsU167975; Mon, 16 Nov 2020 16:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=sFKCnlveLEECgaZ7Er717TwZvtOJCIUg4aMmMCOuHsw=;
 b=La7qAOvPFyv0Y92iJEhxsI/MV9JHAIC3/u3q6w0xVFQd2mhyYgd3aqx97d3JEa1afOi3
 Ew2wd31ajnrX7dw+aBafHrtqFlojfefeuVQrt4fvOdri3tECDLbpqdzitpNhQZdXHoKm
 hmZ2bRHNxfwm28EsiwQi+j65Z8efVL0KNny7cGwkXdH2oW33Os/dH9OIZnaGQJ75AZmM
 UmPHxAo7zRrpmlrOLi88hwVIFFSWiEa/2A2UOzUo4vv1WPHDt62DRJtSC/4ivLC8kg+H
 9J2+cVFK2CUK517KoWKtrwi08QCFFvlATpuPzCNdYRBUGMj2IzRSyv2Bq91cIJLfHP9W nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ux64n1fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 16:42:43 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AGLXkA2168978;
 Mon, 16 Nov 2020 16:42:43 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ux64n1f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 16:42:43 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AGLS6nm027509;
 Mon, 16 Nov 2020 21:42:42 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 34t6v966s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 21:42:42 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AGLgf4x62128388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 21:42:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92012AC05B;
 Mon, 16 Nov 2020 21:42:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B224AC059;
 Mon, 16 Nov 2020 21:42:39 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.48.2])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Nov 2020 21:42:38 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com
Subject: [PATCH for-5.2] s390x/pci: Unregister listeners before destroying
 IOMMU address space
Date: Mon, 16 Nov 2020 16:42:35 -0500
Message-Id: <1605562955-21152-1-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-16_11:2020-11-13,
 2020-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=3 mlxscore=0 priorityscore=1501 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1011 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160127
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 15:04:57
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, schnelle@linux.ibm.com, richard.henderson@linaro.org,
 groug@kaod.org, mlevitsk@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hot-unplugging a vfio-pci device on s390x causes a QEMU crash:

qemu-system-s390x: ../softmmu/memory.c:2772:
 do_address_space_destroy: Assertion `QTAILQ_EMPTY(&as->listeners)' failed.

In s390, the IOMMU address space is freed during device unplug but the
associated vfio-pci device may not yet be finalized and therefore may
still have a listener registered to the IOMMU address space.

Commit a2166410ad74 ("spapr_pci: Unregister listeners before destroying
the IOMMU address space") previously resolved this issue for spapr_pci.
We are now seeing this in s390x; it would seem the possibility for this
issue was already present but based on a bisect commit 2d24a6466154
("device-core: use RCU for list of children of a bus") has now changed
the timing such that it is now readily reproducible.

Add logic to ensure listeners are removed before destroying the address
space.

Reported-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 48a3be8..e0dc20c 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -732,6 +732,13 @@ static void s390_pci_iommu_free(S390pciState *s, PCIBus *bus, int32_t devfn)
 
     table->iommu[PCI_SLOT(devfn)] = NULL;
     g_hash_table_destroy(iommu->iotlb);
+    /*
+     * An attached PCI device may have memory listeners, eg. VFIO PCI.
+     * The associated subregion will already have been unmapped in
+     * s390_pci_iommu_disable in response to the guest deconfigure request.
+     * Remove the listeners now before destroying the address space.
+     */
+    address_space_remove_listeners(&iommu->as);
     address_space_destroy(&iommu->as);
     object_unparent(OBJECT(&iommu->mr));
     object_unparent(OBJECT(iommu));
-- 
1.8.3.1


