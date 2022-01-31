Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC00E4A456A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:42:05 +0100 (CET)
Received: from localhost ([::1]:39326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEV4O-0007NQ-RW
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ6-0006E6-90; Mon, 31 Jan 2022 06:09:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYy-00053Z-9L; Mon, 31 Jan 2022 06:09:42 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20V8ncFi011719; 
 Mon, 31 Jan 2022 11:08:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx98u69eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:23 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VAfbHa026519;
 Mon, 31 Jan 2022 11:08:22 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx98u69e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:22 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2G2N024746;
 Mon, 31 Jan 2022 11:08:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3dvvuhsygq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8I8C44040678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13B6D11C05C;
 Mon, 31 Jan 2022 11:08:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B34E611C050;
 Mon, 31 Jan 2022 11:08:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A6BAE220149;
 Mon, 31 Jan 2022 12:08:16 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 04/41] ppc/pnv: Fail DMA access if page permissions are not
 correct
Date: Mon, 31 Jan 2022 12:07:34 +0100
Message-Id: <20220131110811.619053-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: K_t2vxeyDVyM71mrsXRZPrSsnsA86b8f
X-Proofpoint-GUID: D0Yg2Oa_GhHfAne49tLAhSFsqPrx1Czi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 suspectscore=0
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=922 bulkscore=0
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frederic Barrat <fbarrat@linux.ibm.com>

If an iommu page has wrong permissions, an error message is displayed,
but the access is allowed, which is odd. This patch fixes it.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220121152350.381685-1-fbarrat@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb3.c | 11 ++++++-----
 hw/pci-host/pnv_phb4.c | 11 ++++++-----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 7fb35dc03147..a757f1a58ec8 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -816,18 +816,19 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace =
*ds, hwaddr addr,
         }
=20
         /* We exit the loop with TCE being the final TCE */
-        tce_mask =3D ~((1ull << tce_shift) - 1);
-        tlb->iova =3D addr & tce_mask;
-        tlb->translated_addr =3D tce & tce_mask;
-        tlb->addr_mask =3D ~tce_mask;
-        tlb->perm =3D tce & 3;
         if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
             phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);
             phb3_error(phb, " xlate %"PRIx64":%c TVE=3D%"PRIx64, addr,
                        is_write ? 'W' : 'R', tve);
             phb3_error(phb, " tta=3D%"PRIx64" lev=3D%d tts=3D%d tps=3D%d=
",
                        tta, lev, tts, tps);
+            return;
         }
+        tce_mask =3D ~((1ull << tce_shift) - 1);
+        tlb->iova =3D addr & tce_mask;
+        tlb->translated_addr =3D tce & tce_mask;
+        tlb->addr_mask =3D ~tce_mask;
+        tlb->perm =3D tce & 3;
     }
 }
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a78add75b043..ee56377c02be 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1291,18 +1291,19 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpac=
e *ds, hwaddr addr,
         }
=20
         /* We exit the loop with TCE being the final TCE */
-        tce_mask =3D ~((1ull << tce_shift) - 1);
-        tlb->iova =3D addr & tce_mask;
-        tlb->translated_addr =3D tce & tce_mask;
-        tlb->addr_mask =3D ~tce_mask;
-        tlb->perm =3D tce & 3;
         if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
             phb_error(ds->phb, "TCE access fault at 0x%"PRIx64, taddr);
             phb_error(ds->phb, " xlate %"PRIx64":%c TVE=3D%"PRIx64, addr=
,
                        is_write ? 'W' : 'R', tve);
             phb_error(ds->phb, " tta=3D%"PRIx64" lev=3D%d tts=3D%d tps=3D=
%d",
                        tta, lev, tts, tps);
+            return;
         }
+        tce_mask =3D ~((1ull << tce_shift) - 1);
+        tlb->iova =3D addr & tce_mask;
+        tlb->translated_addr =3D tce & tce_mask;
+        tlb->addr_mask =3D ~tce_mask;
+        tlb->perm =3D tce & 3;
     }
 }
=20
--=20
2.34.1


