Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116D7548606
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:50:27 +0200 (CEST)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mKg-0007So-68
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFj-00006N-HP; Mon, 13 Jun 2022 11:45:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42806
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1o0mFh-00021w-S3; Mon, 13 Jun 2022 11:45:19 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DDmxF2011951;
 Mon, 13 Jun 2022 15:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=T8pirkMotAaRXXZo2tN/39Q7qE+iB/wZrLp1rlahh2c=;
 b=bwAP6vlHl60nX+RpZ77kenTsOjnzlag6t62uOhmnDcFzBYIGrGjYl3mGCx1cyo1qfesM
 GAgcjH4QQ2en9msE+JcCXkmo/dVlyc/vCU4pDWqfs8NtXwR4AJCOUGtUNTsOLUaa5ldL
 7MnMIjiWKF1bioC0yxNhjC3jY8w/tTpZ/H2ugVrD5mH90/scO5q9wJu5VcBl8xUl1zX5
 GSnmCAO2Akb5sVyhiNaBgmiRPF3nYMkiD3aJ25eFvmr0NNN6zdHDlsGYFFkgqkwnOoMf
 C0oC1D1RZUvR689TUhoYM2+jq+ZpC7jBeJk+EDQOz2+ehWZk05jrlHeFJdx5iKnFOLL3 vg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gp3jtpcmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:11 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DFOkcr013004;
 Mon, 13 Jun 2022 15:45:10 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3gmjp96dr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 15:45:10 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25DFjAYP14811396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 15:45:10 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41956AC065;
 Mon, 13 Jun 2022 15:45:10 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06F44AC05B;
 Mon, 13 Jun 2022 15:45:09 +0000 (GMT)
Received: from balboa.COMFAST (unknown [9.77.153.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jun 2022 15:45:08 +0000 (GMT)
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH 06/11] ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
Date: Mon, 13 Jun 2022 12:44:51 -0300
Message-Id: <20220613154456.359674-7-danielhb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613154456.359674-1-danielhb@linux.ibm.com>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wstq8fpyxhIXnwczwDO4DeuvVD-lx0Po
X-Proofpoint-ORIG-GUID: wstq8fpyxhIXnwczwDO4DeuvVD-lx0Po
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_07,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxlogscore=488 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206130069
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

pnv_ics_resend() is scrolling through all the child objects of the chip
to search for the PHBs. It's faster and simpler to just use the phbs[]
array.

pnv_ics_resend_child() was folded into pnv_ics_resend() since it's too
simple to justify its own function.

Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
---
 hw/ppc/pnv.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 05a8d5034f..d70deffa1d 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1993,28 +1993,20 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
     return NULL;
 }
 
-static int pnv_ics_resend_child(Object *child, void *opaque)
-{
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
-
-    if (phb3) {
-        ics_resend(&phb3->lsis);
-        ics_resend(ICS(&phb3->msis));
-    }
-    return 0;
-}
-
 static void pnv_ics_resend(XICSFabric *xi)
 {
     PnvMachineState *pnv = PNV_MACHINE(xi);
-    int i;
+    int i, j;
 
     for (i = 0; i < pnv->num_chips; i++) {
-        PnvChip *chip = pnv->chips[i];
         Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
 
-        ics_resend(&chip8->psi.ics);
-        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
+        for (j = 0; j < chip8->num_phbs; j++) {
+            PnvPHB3 *phb3 = &chip8->phbs[j];
+
+            ics_resend(&phb3->lsis);
+            ics_resend(ICS(&phb3->msis));
+        }
     }
 }
 
-- 
2.36.1


