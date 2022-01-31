Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0943E4A43C3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:24:28 +0100 (CET)
Received: from localhost ([::1]:33424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUnL-0008LJ-4A
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:24:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYe-00060w-29; Mon, 31 Jan 2022 06:09:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYb-00053j-4H; Mon, 31 Jan 2022 06:09:15 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20V8mrYp011704; 
 Mon, 31 Jan 2022 11:08:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx98u69f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:24 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VAw8xm014785;
 Mon, 31 Jan 2022 11:08:23 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx98u69eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2PY1019504;
 Mon, 31 Jan 2022 11:08:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3dvw791udh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:21 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20VAwWc341353654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 10:58:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E89FBAE051;
 Mon, 31 Jan 2022 11:08:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A7C9AE045;
 Mon, 31 Jan 2022 11:08:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9D9B82201C1;
 Mon, 31 Jan 2022 12:08:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 05/41] ppc/pnv: use a do-while() loop in
 pnv_phb3_translate_tve()
Date: Mon, 31 Jan 2022 12:07:35 +0100
Message-Id: <20220131110811.619053-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TAx0p68UvMm9hZzCj-wykyJEO9CEVIbY
X-Proofpoint-GUID: PDoRibSI5nXzHICQFJLtO0-hXjpjrmDw
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 suspectscore=0
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=892 bulkscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310074
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 "Matheus K . Ferst" <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The 'taddr' variable is left unintialized, being set only inside the
"while ((lev--) >=3D 0)" loop where we get the TCE address. The 'lev' var
is an int32_t that is being initiliazed by the GETFIELD() macro, which
returns an uint64_t.

For a human reader this means that 'lev' will always be positive or zero.
But some compilers may beg to differ. 'lev' being an int32_t can in theory
be set as negative, and the "while ((lev--) >=3D 0)" loop might never be
reached, and 'taddr' will be left unitialized. This can cause phb3_error()
to use 'taddr' uninitialized down below:

if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
    phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);

A quick way of fixing it is to use a do/while() loop. This will keep the
same semanting as the existing while() loop does and the compiler will
understand that 'taddr' will be initialized at least once.

Suggested-by: Matheus K. Ferst <matheus.ferst@eldorado.org.br>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/573
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220127122234.842145-2-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index a757f1a58ec8..aafd46b635e8 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -792,7 +792,9 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds,=
 hwaddr addr,
         sh =3D tbl_shift * lev + tce_shift;
=20
         /* TODO: Multi-level untested */
-        while ((lev--) >=3D 0) {
+        do {
+            lev--;
+
             /* Grab the TCE address */
             taddr =3D base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) <<=
 3);
             if (dma_memory_read(&address_space_memory, taddr, &tce,
@@ -813,7 +815,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds,=
 hwaddr addr,
             }
             sh -=3D tbl_shift;
             base =3D tce & ~0xfffull;
-        }
+        } while (lev >=3D 0);
=20
         /* We exit the loop with TCE being the final TCE */
         if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
--=20
2.34.1


