Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3314548608
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:52:37 +0200 (CEST)
Received: from localhost ([::1]:49188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mMm-00037k-RR
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFl-0000DR-HC; Mon, 13 Jun 2022 11:45:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFj-00022e-SX; Mon, 13 Jun 2022 11:45:21 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DDV4TE001633;
 Mon, 13 Jun 2022 15:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hX10O00sgZSa+/DLHphttqNXQEss5mkyCdzClRd7uRo=;
 b=R5qvPAd3rZuRZbDjog1m/6xF39UEXq4ZSjwRWfM2HrZVVyTNbuzf47sYqOcoFRh5wPkT
 akNKxal2Dqhq04eXevCRii5eYf6J3oqKm1uZHsWNl5500hR3zmy1czhMDVobonnLt8Lt
 5Vd3krBHjNl3GaA7i0lTywpzA9VfW/oxF9OoEZ/DD2ZzCQ6w7N+8LDk8VTnaifdyslIV
 heHDpQvNgEEzCdm5cX6lARv0iNCUaD+lCAvQHgjQq12thuYSzN2zImlM3QtnocsRvnSw
 lPPyAbffZRr1PZ5mwMPPxxtAhQRE5JTrJ28TKGDaJFTGJhjpX4PMp9mvJJFk4VOkLcjy Xw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gp66db217-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:10 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFhoh0010233;
 Mon, 13 Jun 2022 15:45:09 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 3gmjp9eebj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:09 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFj8A910617178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:08 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A753CAC059;
 Mon, 13 Jun 2022 15:45:08 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6955AAC05E;
 Mon, 13 Jun 2022 15:45:07 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:45:07 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/11] ppc/pnv: make pnv_ics_get() use the chip8->phbs[] array
Date: Mon, 13 Jun 2022 12:44:50 -0300
Message-Id: <20220613154456.359674-6-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613154456.359674-1-danielhb@linux.ibm.com>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N-AgAdHUySseyZkdR1DmJfAiq1st0iNo
X-Proofpoint-ORIG-GUID: N-AgAdHUySseyZkdR1DmJfAiq1st0iNo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_06,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 mlxlogscore=613 classifier=spam adjust=0 reason=mlx scancount=1
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

The function is working today by getting all the child objects of the
chip, interacting with each of them to check whether the child is a PHB,
and then doing what needs to be done.

We have all the chip PHBs in the phbs[] array so interacting with all
child objects is unneeded.

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
---
 hw/ppc/pnv.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 40e0cbd84d..05a8d5034f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1944,41 +1944,39 @@ typedef struct ForeachPhb3Args {
     ICSState *ics;
 } ForeachPhb3Args;
 
-static int pnv_ics_get_child(Object *child, void *opaque)
+static void pnv_ics_get_phb_ics(PnvPHB3 *phb3, ForeachPhb3Args *args)
 {
-    ForeachPhb3Args *args = opaque;
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
+    if (ics_valid_irq(&phb3->lsis, args->irq)) {
+        args->ics = &phb3->lsis;
+    }
 
-    if (phb3) {
-        if (ics_valid_irq(&phb3->lsis, args->irq)) {
-            args->ics = &phb3->lsis;
-        }
-        if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
-            args->ics = ICS(&phb3->msis);
-        }
+    if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
+        args->ics = ICS(&phb3->msis);
     }
-    return args->ics ? 1 : 0;
 }
 
 static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
 {
     PnvMachineState *pnv = PNV_MACHINE(xi);
     ForeachPhb3Args args = { irq, NULL };
-    int i;
+    int i, j;
 
     for (i = 0; i < pnv->num_chips; i++) {
-        PnvChip *chip = pnv->chips[i];
         Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
 
         if (ics_valid_irq(&chip8->psi.ics, irq)) {
             return &chip8->psi.ics;
         }
 
-        object_child_foreach(OBJECT(chip), pnv_ics_get_child, &args);
-        if (args.ics) {
-            return args.ics;
+        for (j = 0; j < chip8->num_phbs; j++) {
+            pnv_ics_get_phb_ics(&chip8->phbs[j], &args);
+
+            if (args.ics) {
+                return args.ics;
+            }
         }
     }
+
     return NULL;
 }
 
-- 
2.36.1


