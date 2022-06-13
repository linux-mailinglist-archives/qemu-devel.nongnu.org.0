Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB111548648
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:56:17 +0200 (CEST)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mQK-000158-U1
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFu-0000SR-D5; Mon, 13 Jun 2022 11:45:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFs-000263-1o; Mon, 13 Jun 2022 11:45:30 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DFQcCu002633;
 Mon, 13 Jun 2022 15:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lvch5KfvJYRDyduLcL34GP/usqXPpCmGsQLDqdxhRqY=;
 b=jehUPph86i38yUerZZPhBv45koAdJs5+RPU3OtrMwXjXqY7enoH5a9d2w1nShv6kSO8Y
 4Potezjso2OJ3rvqUDxg3rE8XfICVIwd2DMKkxTibJV4UM+XY8FcNbJ6ziLEAwI9q9PS
 KWXwjPPyuMBHliIr1uJhLZ66D00leiHHUGvf1ypzSkaDqXg/q6nA9vEmoeqrtU+OfoLL
 qOkmp9XbD406zRiDSPV9svMs4x6WhojVdY5GEV7j3MsH0XvTbS+dLkjbOG2oNWPKSXaP
 YbfIxGO1xwIz9tvBI+3Bq/48fXaXW7R60/qtauAqZyXLdrkOnPAtW4+VeKF1nTjLcrXL fQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gp7vtgcrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:20 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFNHbA020532;
 Mon, 13 Jun 2022 15:45:19 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3gmjp9j0fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:19 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFjI7C30212476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:18 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D219AC06B;
 Mon, 13 Jun 2022 15:45:18 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B334AC05B;
 Mon, 13 Jun 2022 15:45:16 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:45:15 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 10/11] ppc/pnv: move PHB3 initialization to realize time
Date: Mon, 13 Jun 2022 12:44:55 -0300
Message-Id: <20220613154456.359674-11-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613154456.359674-1-danielhb@linux.ibm.com>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZZS5uYRvig3P83h3ve8zs7ha_tnmMuJG
X-Proofpoint-ORIG-GUID: ZZS5uYRvig3P83h3ve8zs7ha_tnmMuJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_07,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130068
Received-SPF: pass client-ip=148.163.156.1;
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

There's nothing special that is being done in
pnv_chip_power8_instance_init() that can't be done during
pnv_chip_power8_realize(). Move the PHB creating and phbs[] assignment
to power8_realize().

We also need to assign a proper phb->chip parent and bus. This is done
by the PHB itself, in pnv_phb3_realize(), in a similar fashion that user
created PHB3s are going to do.

After all this we're left with logic that, aside from phb chip
assignment that are still being done in power8_realize(), behaves the
same for default and user created PHB3s.

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
---
 hw/pci-host/pnv_phb3.c | 14 ++++++++++++++
 hw/ppc/pnv.c           | 24 +++++-------------------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index bda23fd20b..c1c73fb88d 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -998,6 +998,20 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /*
+     * We need the chip to parent the PHB to allow the DT
+     * to build correctly (via pnv_xscom_dt()).
+     *
+     * TODO: the PHB should be parented by a PHB3 PEC device.
+     */
+    pnv_parent_qom_fixup(OBJECT(phb->chip), OBJECT(phb), phb->phb_id);
+
+    /*
+     * pnv-phb3 buses are child of the main-system-bus, same as
+     * the chip.
+     */
+    pnv_parent_bus_fixup(DEVICE(phb->chip), dev);
+
     /* LSI sources */
     object_property_set_link(OBJECT(&phb->lsis), "xics", OBJECT(pnv),
                              &error_abort);
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d77c90d64a..e4080a98e1 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1130,8 +1130,6 @@ static void pnv_chip_power10_intc_print_info(PnvChip *chip, PowerPCCPU *cpu,
 static void pnv_chip_power8_instance_init(Object *obj)
 {
     Pnv8Chip *chip8 = PNV8_CHIP(obj);
-    PnvChipClass *pcc = PNV_CHIP_GET_CLASS(obj);
-    int i;
 
     object_property_add_link(obj, "xics", TYPE_XICS_FABRIC,
                              (Object **)&chip8->xics,
@@ -1145,22 +1143,6 @@ static void pnv_chip_power8_instance_init(Object *obj)
     object_initialize_child(obj, "occ", &chip8->occ, TYPE_PNV8_OCC);
 
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
-
-    chip8->num_phbs = pcc->num_phbs;
-
-    for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB3 *phb3 = PNV_PHB3(object_new(TYPE_PNV_PHB3));
-
-        /*
-         * We need the chip to parent the PHB to allow the DT
-         * to build correctly (via pnv_xscom_dt()).
-         *
-         * TODO: the PHB should be parented by a PEC device.
-         */
-        object_property_add_child(obj, "phb[*]", OBJECT(phb3));
-        chip8->phbs[i] = phb3;
-    }
-
 }
 
 static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
@@ -1286,8 +1268,12 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
                                 &chip8->homer.regs);
 
     /* PHB3 controllers */
+    chip8->num_phbs = pcc->num_phbs;
+
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB3 *phb = chip8->phbs[i];
+        PnvPHB3 *phb = PNV_PHB3(object_new(TYPE_PNV_PHB3));
+
+        chip8->phbs[i] = phb;
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
-- 
2.36.1


