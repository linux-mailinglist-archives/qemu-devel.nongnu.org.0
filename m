Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D351548619
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:55:34 +0200 (CEST)
Received: from localhost ([::1]:56892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mPd-0008Ip-HB
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFv-0000Tj-1j; Mon, 13 Jun 2022 11:45:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFt-00026T-AR; Mon, 13 Jun 2022 11:45:30 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DE3B1P023240;
 Mon, 13 Jun 2022 15:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1hY1NWxhKn5+t0Y9MmaymciyQeqUA8dnSoiLDFoJox4=;
 b=OKmo1uyXPruDEHJTTE0HhgmAV4h09ilAvQ5MqIVFYJGkOFGN67zCnTxNxHAulhEYuWEK
 jqoIIjJvC4sja3X87TJ5/ygcg2Q0SvfjZhQG/9f4YNX8isTsHqJ4Spm/NI0MFrcinO6v
 LQLo2xJEOU8JHf0Nc99NHPmRLFhAxrFN9nDgB5ZpwxKwp8n+Npjo7onOra2BPoY6P6Zq
 WsJQx3nkCF2jn/oi9g6sqBJ49Muak1oMcolK8uMcpvWCgy67VWytMaAwvI1676dWhN8i
 5Y+FJS3LPqnmAyZOkKp4TTCHlSu4MMe4+yP0eD2RflAcLyWa2sRKTodzaBNOERWLIZHh mg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gn4yhksrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:13 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFTaFK006256;
 Mon, 13 Jun 2022 15:45:12 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3gmjp9t1ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:12 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFjBrr33948098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:11 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5BC2AC060;
 Mon, 13 Jun 2022 15:45:11 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9423EAC05F;
 Mon, 13 Jun 2022 15:45:10 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:45:10 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 07/11] ppc/pnv: make pnv_chip_power8_pic_print_info() use
 chip8->phbs[]
Date: Mon, 13 Jun 2022 12:44:52 -0300
Message-Id: <20220613154456.359674-8-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613154456.359674-1-danielhb@linux.ibm.com>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QU_96p6JYbBuIDPi_GtEGpDHANecTpdh
X-Proofpoint-GUID: QU_96p6JYbBuIDPi_GtEGpDHANecTpdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_07,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=521 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130069
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

It's inneficient to scroll all child objects when we have all PHBs
available in chip8->phbs[].

pnv_chip_power8_pic_print_info_child() ended up folded into
pic_print_info() for simplicity.

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
---
 hw/ppc/pnv.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d70deffa1d..5e3323e950 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -652,25 +652,19 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
     return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
 }
 
-static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
-{
-    Monitor *mon = opaque;
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
-
-    if (phb3) {
-        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
-        ics_pic_print_info(&phb3->lsis, mon);
-    }
-    return 0;
-}
-
 static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
 {
     Pnv8Chip *chip8 = PNV8_CHIP(chip);
+    int i;
 
     ics_pic_print_info(&chip8->psi.ics, mon);
-    object_child_foreach(OBJECT(chip),
-                         pnv_chip_power8_pic_print_info_child, mon);
+
+    for (i = 0; i < chip8->num_phbs; i++) {
+        PnvPHB3 *phb3 = &chip8->phbs[i];
+
+        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
+        ics_pic_print_info(&phb3->lsis, mon);
+    }
 }
 
 static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
-- 
2.36.1


