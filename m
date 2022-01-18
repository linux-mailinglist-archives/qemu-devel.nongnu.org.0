Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF3E49283C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:20:55 +0100 (CET)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pLy-0004hm-Gr
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:20:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDP-0003rY-M0; Tue, 18 Jan 2022 08:08:00 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDN-0000G4-Up; Tue, 18 Jan 2022 08:07:59 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICkw14016148; 
 Tue, 18 Jan 2022 13:07:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnr9ssaan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:48 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICbxrj011935;
 Tue, 18 Jan 2022 13:07:47 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnr9ssa93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:47 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7QII011280;
 Tue, 18 Jan 2022 13:07:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3dknhj3d3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7gCu44368340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBEDF42045;
 Tue, 18 Jan 2022 13:07:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 982164203F;
 Tue, 18 Jan 2022 13:07:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:42 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DEF352201EB;
 Tue, 18 Jan 2022 14:07:41 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 15/31] ppc/pnv: change pnv_phb4_update_regions() to use PnvPHB4
Date: Tue, 18 Jan 2022 14:07:14 +0100
Message-Id: <20220118130730.1927983-16-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ft_eC93YkskCOKYX7eeM6WHCRGGpTAJc
X-Proofpoint-ORIG-GUID: iC1E3WbQV62tlQ1u5RJA1XsI8lfT5rgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=812 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1034
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

The function does not rely on stack for anything it does anymore. This
is also one less instance of 'stack->phb' that we need to worry about.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220113192952.911188-6-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index fbc475f27abd..034721f15915 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -868,10 +868,8 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *op=
aque, hwaddr addr,
     return stack->nest_regs[reg];
 }
=20
-static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
+static void pnv_phb4_update_regions(PnvPHB4 *phb)
 {
-    PnvPHB4 *phb =3D stack->phb;
-
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
         memory_region_del_subregion(&phb->phbbar, &phb->mr_regs);
@@ -930,7 +928,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *s=
tack)
     }
=20
     /* Update PHB */
-    pnv_phb4_update_regions(stack);
+    pnv_phb4_update_regions(phb);
=20
     /* Handle maps */
     if (!memory_region_is_mapped(&stack->mmbar0) &&
@@ -977,7 +975,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *s=
tack)
     }
=20
     /* Update PHB */
-    pnv_phb4_update_regions(stack);
+    pnv_phb4_update_regions(phb);
 }
=20
 static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
--=20
2.31.1


