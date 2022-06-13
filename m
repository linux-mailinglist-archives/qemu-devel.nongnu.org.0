Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A57548609
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:52:45 +0200 (CEST)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mMu-0003RQ-Sl
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFo-0000IQ-1h; Mon, 13 Jun 2022 11:45:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7942
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFm-00025U-DH; Mon, 13 Jun 2022 11:45:23 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DFPUFo002418;
 Mon, 13 Jun 2022 15:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OF0N9YmlLSoEtcbD9T0Ly93Hrelnj2QQ3DLd5ZRnfcU=;
 b=KkpVLOpRnRF66B3QGHeLNikvdvpk78mCoy+Lbp0yDWbtiqe+nkFT1uBcyR1H32IpJ0E7
 WCOmUxWbPhn1H5JYnIGi4NciwXlObLbL5tg/JH/DxNMHft1W3mlBk6qDw6PPY2gtlsJ0
 EFRFCbkKcAH+Jg4tNsm6Q3S7xMxUmBshOgT7zKHEyLvArY2GG/LO5eegB7iBSSFghoiO
 6sufyczAcENfQUmE9/Hehm9CzOOdq1f4VqqOnC1LPVeanIoASOLe8UhczPuGkEweTG+E
 /zWie63dHzYz2yszSOyAzq2fe5km3oMyKuRSq7le1uGHue84MIVqp6zFvSf5ZiNDDZ1D sQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gp5wgue1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:08 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFOWWi006546;
 Mon, 13 Jun 2022 15:45:07 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3gmjp9xegh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFj7eS30540284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16EA1AC062;
 Mon, 13 Jun 2022 15:45:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D67E5AC059;
 Mon, 13 Jun 2022 15:45:05 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:45:05 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 04/11] ppc/pnv: use dev instead of pci->qdev in
 root_port_realize()
Date: Mon, 13 Jun 2022 12:44:49 -0300
Message-Id: <20220613154456.359674-5-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613154456.359674-1-danielhb@linux.ibm.com>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7Ekd6opAF6XZBfrVxD1X1uFaq4xGLHmV
X-Proofpoint-ORIG-GUID: 7Ekd6opAF6XZBfrVxD1X1uFaq4xGLHmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_06,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=971 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130068
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

We already have access to the 'dev' object.

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
---
 hw/pci-host/pnv_phb3.c | 4 ++--
 hw/pci-host/pnv_phb4.c | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 7901d8172c..bda23fd20b 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1157,8 +1157,8 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
     }
 
     /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
-    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
+    qdev_prop_set_uint8(dev, "chassis", phb->chip_id);
+    qdev_prop_set_uint16(dev, "slot", phb->phb_id);
 
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index bae9398d86..bfec8b9f6d 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1781,7 +1781,6 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
 static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
-    PCIDevice *pci = PCI_DEVICE(dev);
     PnvPHB4 *phb = NULL;
     Error *local_err = NULL;
 
@@ -1799,8 +1798,8 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
     }
 
     /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
-    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
+    qdev_prop_set_uint8(dev, "chassis", phb->chip_id);
+    qdev_prop_set_uint16(dev, "slot", phb->phb_id);
 
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
-- 
2.36.1


