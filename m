Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B07444AFC5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:53:13 +0100 (CET)
Received: from localhost ([::1]:47970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkSUp-0003VX-KW
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:53:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clombard@linux.vnet.ibm.com>)
 id 1mkSSr-0002ms-1C; Tue, 09 Nov 2021 09:51:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clombard@linux.vnet.ibm.com>)
 id 1mkSSm-0004sw-1v; Tue, 09 Nov 2021 09:51:07 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9CmQ9x024532; 
 Tue, 9 Nov 2021 14:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=clL/WfX9jo9fo9OEFQGWji7vYlvsxcFaEBnXtCIM+lg=;
 b=bEnT9exLmkJChasPUlK8sLTrZsaQNstsmWf75XCFBb9GRkdOncEQq5TUoDirRRR8NxqY
 7vW5zpnN8mGplB3Aj7VhK2EvlevtX0Kc61x59gCy+0TYa8UXaf3H4TeVbfslRUG6UAaJ
 MHIIr4HwRXjdojQ2x7zpQx6XGSXHXVu4+1hYBjRKT6LGv4dhtfYUykJ5f/syURgm/NaX
 0LUKkR/kmN15UZYUMtf71uY0bN8D35EqOdWH04azRmG3f2Gffop92bQ3l1oTBHPwqB8Y
 pokvMLhP0Ss1YHL0FDErFuCnedKn8Fh4aLV9HXOtgGykV4HLboTLT7JKOPcOM9rHrsMt oA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7san369h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:50:58 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9EhBBC031141;
 Tue, 9 Nov 2021 14:50:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3c5hb9qcbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:50:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A9Eormo65667440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 14:50:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B912AE068;
 Tue,  9 Nov 2021 14:50:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B016AE051;
 Tue,  9 Nov 2021 14:50:53 +0000 (GMT)
Received: from li-ed209401-43e8-11cb-8043-c0c0b85d70f7.biot.fr.ibm.com
 (unknown [9.144.57.114])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 14:50:53 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: clg@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clombard@linux.vnet.ibm.com
Subject: [PATCH] pci-host: Allow extended config space access for PowerNV PHB4
 model
Date: Tue,  9 Nov 2021 15:50:53 +0100
Message-Id: <20211109145053.43524-1-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1W5074XBpg-FpVms7DKYcgMVajjai32V
X-Proofpoint-GUID: 1W5074XBpg-FpVms7DKYcgMVajjai32V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090087
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=clombard@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PCIe extended configuration space on the device is not currently
accessible to the host. if by default,  it is still inaccessible for
conventional for PCIe buses, add the current flag
PCI_BUS_EXTENDED_CONFIG_SPACE on the root bus permits PCI-E extended
config space access.

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 hw/pci-host/pnv_phb4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 5c375a9f28..40b793201a 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1205,6 +1205,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB4_ROOT_BUS);
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
+    pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
     /* Add a single Root port */
     qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
-- 
2.33.1


