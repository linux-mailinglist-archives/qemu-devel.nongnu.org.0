Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343F1548601
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:48:05 +0200 (CEST)
Received: from localhost ([::1]:36298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mIN-0002mU-Rc
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFf-0008PI-8j; Mon, 13 Jun 2022 11:45:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10002
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFd-0001yh-JF; Mon, 13 Jun 2022 11:45:15 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DE9E1N020118;
 Mon, 13 Jun 2022 15:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=q8qsUXrBfgdMMV5TJTGUCMFTwzWF6HCem2b7eATsFtI=;
 b=nyadC5qvq1HUrr/2Lvr47dtT1LWlTg56PXxgBLM+TrBAKRDcePDQpSoDWsy8Dswh6N8y
 yyDdPyxjn+Jjn/69ASWovA8S5IzpppHDmPS4xRsmwln79ooRKK0xaPcO3i819pTf5pzb
 V3iwGGmIJRY1SDqKNmCRPyH3pAviTYwazXfP5L9XeQTSB8mpycerjc7Osylj1L71aZGp
 xkTfxmeP1kEzl59H/aGDz6kEtTtjb5K/1vTPELo0TMfpmWxp6TXF7ObNn8Tv+bCMBBEx
 yLfXXu9iPTgJ/ZGx2v3yEa+m6I7warlbBQN6K9WKLN2Gz4NjnlrqIT8iRCWgYND+anV/ Dg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gn548bfrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:03 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFheCm010150;
 Mon, 13 Jun 2022 15:45:02 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3gmjp9eeab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:02 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFj2Xr5112666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:02 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64642AC059;
 Mon, 13 Jun 2022 15:45:02 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28E01AC05B;
 Mon, 13 Jun 2022 15:45:01 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:45:00 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 01/11] ppc/pnv: move root port attach to pnv_phb4_realize()
Date: Mon, 13 Jun 2022 12:44:46 -0300
Message-Id: <20220613154456.359674-2-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613154456.359674-1-danielhb@linux.ibm.com>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -5AvZYV1nXLTNhKdRW7BSLKKyvcCI-0-
X-Proofpoint-ORIG-GUID: -5AvZYV1nXLTNhKdRW7BSLKKyvcCI-0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_07,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130069
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=danielhb@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

Creating a root port is something related to the PHB, not the PEC. It
also makes the logic more in line with what pnv-phb3 does.

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
---
 hw/pci-host/pnv_phb4.c     | 4 ++++
 hw/pci-host/pnv_phb4_pec.c | 3 ---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 6594016121..23ad8de7ee 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1547,6 +1547,7 @@ static void pnv_phb4_instance_init(Object *obj)
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb = PNV_PHB4(dev);
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc = &phb->xsrc;
     int nr_irqs;
@@ -1583,6 +1584,9 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
+    /* Add a single Root port if running with defaults */
+    pnv_phb_attach_root_port(pci, pecc->rp_model);
+
     /* Setup XIVE Source */
     if (phb->big_phb) {
         nr_irqs = PNV_PHB4_MAX_INTs;
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 8b7e823fa5..c9aaf1c28e 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -130,9 +130,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
     if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
         return;
     }
-
-    /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
 }
 
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
-- 
2.36.1


