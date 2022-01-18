Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3BE492837
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:19:37 +0100 (CET)
Received: from localhost ([::1]:32912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pKi-0002CJ-T6
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:19:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDn-0004EK-1W; Tue, 18 Jan 2022 08:08:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10822
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDh-0000G2-Lq; Tue, 18 Jan 2022 08:08:21 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICh7xp016163; 
 Tue, 18 Jan 2022 13:07:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dngcqhb7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:49 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICgppn015644;
 Tue, 18 Jan 2022 13:07:49 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dngcqhb6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID25Fl007215;
 Tue, 18 Jan 2022 13:07:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3dknw9b9yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7iWD44892532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC448A405B;
 Tue, 18 Jan 2022 13:07:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 816B8A405F;
 Tue, 18 Jan 2022 13:07:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C992322016C;
 Tue, 18 Jan 2022 14:07:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 18/31] ppc/pnv: change pnv_pec_stk_update_map() to use PnvPHB4
Date: Tue, 18 Jan 2022 14:07:17 +0100
Message-Id: <20220118130730.1927983-19-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OfaWlTGq25k1DbEKhzl-t8mNMb71Xl_5
X-Proofpoint-ORIG-GUID: PtwEdkXwWOX2Rww1q3y9iqvqjMRrlEDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=768 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1034 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.322,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

stack->nest_regs_mr wasn't migrated to PnvPHB4 together with phb->nest_re=
gs[] in
the previous patch. We were unable to cleanly convert its write MemoryReg=
ionOps,
pnv_pec_stk_nest_xscom_write(), to use PnvPHB4 instead of PnvPhb4PecStack=
 due to
pnv_pec_stk_update_map() using a stack. Thing is, we're now able to conve=
rt
pnv_pec_stk_update_map() because of what the did in previous patch.

The need for this intermediate step is a good example of the interconnect=
ed
relationship between stack and phb that we aim to cleanup.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220113192952.911188-9-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 916a7a3cf0f4..0f4464ec67f4 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -893,10 +893,10 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
     pnv_phb4_check_all_mbt(phb);
 }
=20
-static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
+static void pnv_pec_stk_update_map(PnvPHB4 *phb)
 {
+    PnvPhb4PecStack *stack =3D phb->stack;
     PnvPhb4PecState *pec =3D stack->pec;
-    PnvPHB4 *phb =3D stack->phb;
     MemoryRegion *sysmem =3D get_system_memory();
     uint64_t bar_en =3D phb->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
@@ -1046,7 +1046,7 @@ static void pnv_pec_stk_nest_xscom_write(void *opaq=
ue, hwaddr addr,
         break;
     case PEC_NEST_STK_BAR_EN:
         phb->nest_regs[reg] =3D val & 0xf000000000000000ull;
-        pnv_pec_stk_update_map(stack);
+        pnv_pec_stk_update_map(phb);
         break;
     case PEC_NEST_STK_DATA_FRZ_TYPE:
     case PEC_NEST_STK_PBCQ_TUN_BAR:
--=20
2.31.1


