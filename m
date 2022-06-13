Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E165486F4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:58:05 +0200 (CEST)
Received: from localhost ([::1]:35168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mS4-0004Oh-Py
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFu-0000Sh-Fi; Mon, 13 Jun 2022 11:45:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFs-00026F-N5; Mon, 13 Jun 2022 11:45:30 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DEJaQC012196;
 Mon, 13 Jun 2022 15:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=B5I1BD3J8hIqmG0/1+YffLtVW28XApgWZ61xuzFB4AA=;
 b=CUxUEg+3FF5IZHUAH9CfAWW7QyQKP6jWmhjXhTgSQdCsVxhVxCJWFZm6CLvEsAeLro7x
 Ai9Y7R794cUk5ydftv4CpgwJzbBvAjmjDS9ofa+PQFN56ig/D6OK10Kn98dfwsa8xNO/
 V2npquWuiFkJwPPCm2vjliOJa4zJxGyzpk3bx1i0kzWxm/sCw6aryS8cPVsHdbgevGVu
 8ACxsS1CXWvlp6n4O0j5mLxKkI5mJxldkUTgzhmQN3Hh4sMfWpBoLWaNfnT46CwC1NUR
 0xZWv/bgFrcA+wWWi4abAcFIJ1u8jVGvZ5LLZDKD4Dt/3q1leq/hsXg8WCafVChofq5L 2A== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gn4qjuc57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:21 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFhZYb016477;
 Mon, 13 Jun 2022 15:45:21 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3gmjp9t02y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:20 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFjKUL35651972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:20 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39F2BAC059;
 Mon, 13 Jun 2022 15:45:20 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90EFBAC05B;
 Mon, 13 Jun 2022 15:45:18 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:45:18 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 11/11] ppc/pnv: move PHB4 parent fixup to phb4_realize()
Date: Mon, 13 Jun 2022 12:44:56 -0300
Message-Id: <20220613154456.359674-12-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613154456.359674-1-danielhb@linux.ibm.com>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ufSNAeO4JsCWU5emWmxAKT3W0YFBoQdX
X-Proofpoint-ORIG-GUID: ufSNAeO4JsCWU5emWmxAKT3W0YFBoQdX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_07,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=979 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206130069
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=danielhb@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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

After the code cleanups done in the past, default PHB4 code is already
fairly close to user created PHB4s. What we need to do to make it equal
is move the QOM and bus parenting changes from
pnv_pec_default_phb_realize() to pnv_phb4_realize().

Using the same logic for both cases (aside from PEC assigning) will make
our lives easier when re-enabling user created PHB4s.

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
---
 hw/pci-host/pnv_phb4.c     | 12 ++++++++++++
 hw/pci-host/pnv_phb4_pec.c |  1 -
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index bfec8b9f6d..fd6fac21ac 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1553,6 +1553,18 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     int nr_irqs;
     char name[32];
 
+    /*
+     * We need the PEC to parent the PHB to allow the DT
+     * to build correctly (via pnv_xscom_dt()).
+     */
+    pnv_parent_qom_fixup(OBJECT(phb->pec), OBJECT(phb), phb->phb_id);
+
+    /*
+     * pnv-phb4 buses are child of the main-system-bus, same as
+     * the chip.
+     */
+    pnv_parent_bus_fixup(DEVICE(phb->pec->chip), dev);
+
     /* Set the "big_phb" flag */
     phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
 
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index c9aaf1c28e..eb47b50737 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -119,7 +119,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
     PnvPHB4 *phb = PNV_PHB4(qdev_new(pecc->phb_type));
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
 
-    object_property_add_child(OBJECT(pec), "phb[*]", OBJECT(phb));
     object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
                              &error_abort);
     object_property_set_int(OBJECT(phb), "chip-id", pec->chip_id,
-- 
2.36.1


