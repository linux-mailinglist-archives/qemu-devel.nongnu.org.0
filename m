Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13998548607
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:51:30 +0200 (CEST)
Received: from localhost ([::1]:45212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mLh-0000MY-5s
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFr-0000Nc-VB; Mon, 13 Jun 2022 11:45:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFp-00025t-Uo; Mon, 13 Jun 2022 11:45:27 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DEAU6v013537;
 Mon, 13 Jun 2022 15:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rJ1Xj+u91klfzwk81u+sl62M3REjlt32KHhnC7cYm/w=;
 b=PgSQc8Ofy2Et+7WFTmA+GaY5ZOofu2bLJ0NUzZMCcCXIbfoJEGk/ff5IRc3Mcm9SktZq
 oKDqdsLAtnHgnjTtWkPFoSSVFKcIlAzeyEeFJozN+08MHfrbzVt22937sTsnXYN1/l68
 kfS5HGPhWxfhAdj5/JzmQGeuiOEd+uwaLZZ3NYqEUNmp3fExkZHd5oBQ2rB1K3lGVxg6
 kjP8gON0as9PWEGtaiesQdRv9J6Co52abkltivkTsMiQF/ooAKUHnbifmwG9RRvkdULN
 2/UwNTkFNGskXmOrxW52n+waSI8y0/Y1e/nor2ob/a019dIPWmMFwA1pf4wd1ehfXIgS 4g== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gn53quacq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:18 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFN7uV032594;
 Mon, 13 Jun 2022 15:45:13 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3gmjp8pem1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFjDBu40108456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68F6CAC05B;
 Mon, 13 Jun 2022 15:45:13 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26041AC05F;
 Mon, 13 Jun 2022 15:45:12 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:45:11 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 08/11] ppc/pnv: turn chip8->phbs[] into a PnvPHB3* array
Date: Mon, 13 Jun 2022 12:44:53 -0300
Message-Id: <20220613154456.359674-9-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613154456.359674-1-danielhb@linux.ibm.com>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UiYQIxe_w9KI5XS0NpvNcqPObaIVgMi_
X-Proofpoint-ORIG-GUID: UiYQIxe_w9KI5XS0NpvNcqPObaIVgMi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_06,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0 mlxlogscore=798
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206130068
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

When enabling user created PHBs (a change reverted by commit 9c10d86fee)
we were handling PHBs created by default versus by the user in different
manners. The only difference between these PHBs is that one will have a
valid phb3->chip that is assigned during pnv_chip_power8_realize(),
while the user created needs to search which chip it belongs to.

Aside from that there shouldn't be any difference. Making the default
PHBs behave in line with the user created ones will make it easier to
re-introduce them later on. It will also make the code easier to follow
since we are dealing with them in equal manner.

The first step is to turn chip8->phbs[] into a PnvPHB3 pointer array.
This will allow us to assign user created PHBs into it later on. The way
we initilize the default case is now more in line with that would happen
with the user created case: the object is created, parented by the chip
because pnv_xscom_dt() relies on it, and then assigned to the array.

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
---
 hw/ppc/pnv.c         | 19 ++++++++++++++-----
 include/hw/ppc/pnv.h |  6 +++++-
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 5e3323e950..6ce9e94e05 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -660,7 +660,7 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
     ics_pic_print_info(&chip8->psi.ics, mon);
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB3 *phb3 = &chip8->phbs[i];
+        PnvPHB3 *phb3 = chip8->phbs[i];
 
         pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
         ics_pic_print_info(&phb3->lsis, mon);
@@ -1149,7 +1149,16 @@ static void pnv_chip_power8_instance_init(Object *obj)
     chip8->num_phbs = pcc->num_phbs;
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
+        PnvPHB3 *phb3 = PNV_PHB3(object_new(TYPE_PNV_PHB3));
+
+        /*
+         * We need the chip to parent the PHB to allow the DT
+         * to build correctly (via pnv_xscom_dt()).
+         *
+         * TODO: the PHB should be parented by a PEC device.
+         */
+        object_property_add_child(obj, "phb[*]", OBJECT(phb3));
+        chip8->phbs[i] = phb3;
     }
 
 }
@@ -1278,7 +1287,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
 
     /* PHB3 controllers */
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB3 *phb = &chip8->phbs[i];
+        PnvPHB3 *phb = chip8->phbs[i];
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
@@ -1963,7 +1972,7 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
         }
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            pnv_ics_get_phb_ics(&chip8->phbs[j], &args);
+            pnv_ics_get_phb_ics(chip8->phbs[j], &args);
 
             if (args.ics) {
                 return args.ics;
@@ -1996,7 +2005,7 @@ static void pnv_ics_resend(XICSFabric *xi)
         Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            PnvPHB3 *phb3 = &chip8->phbs[j];
+            PnvPHB3 *phb3 = chip8->phbs[j];
 
             ics_resend(&phb3->lsis);
             ics_resend(ICS(&phb3->msis));
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 033890a23f..11f1089289 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -80,7 +80,11 @@ struct Pnv8Chip {
     PnvHomer     homer;
 
 #define PNV8_CHIP_PHB3_MAX 4
-    PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
+    /*
+     * The array is used to allow quick access to the phbs by
+     * pnv_ics_get_child() and pnv_ics_resend_child().
+     */
+    PnvPHB3      *phbs[PNV8_CHIP_PHB3_MAX];
     uint32_t     num_phbs;
 
     XICSFabric    *xics;
-- 
2.36.1


