Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7209E477EB2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:23:49 +0100 (CET)
Received: from localhost ([::1]:51346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyE8-00085T-Jn
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:23:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLs-0003n6-Qz; Thu, 16 Dec 2021 15:27:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLo-0007Se-OA; Thu, 16 Dec 2021 15:27:44 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJTqoA014307; 
 Thu, 16 Dec 2021 20:27:10 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyqbjas1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:10 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKBlI8016039;
 Thu, 16 Dec 2021 20:27:08 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qwatd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BGKJ3ag36176252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:19:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D2FE4C046;
 Thu, 16 Dec 2021 20:27:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6424A4C040;
 Thu, 16 Dec 2021 20:27:05 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:27:05 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BA3392201A0;
 Thu, 16 Dec 2021 21:27:04 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 074/101] ppc/ppc405: Add update of bi_procfreq field
Date: Thu, 16 Dec 2021 21:25:47 +0100
Message-Id: <20211216202614.414266-75-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WoQKuRvBvtsaTO1Z3ertrB3QqKahRMDe
X-Proofpoint-ORIG-GUID: WoQKuRvBvtsaTO1Z3ertrB3QqKahRMDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=705 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1034 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adapt the fields offset in the board information for Linux. Since
Linux relies on the CPU frequency value, I wonder how it ever worked.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211206103712.1866296-15-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_uc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 2a1e2d71b08b..ec97b22bd019 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -102,12 +102,13 @@ static ram_addr_t __ppc405_set_bootinfo(CPUPPCState=
 *env, ppc4xx_bd_info_t *bd)
     for (i =3D 0; i < 32; i++) {
         stb_phys(cs->as, bdloc + 0x3C + i, bd->bi_r_version[i]);
     }
-    stl_be_phys(cs->as, bdloc + 0x5C, bd->bi_plb_busfreq);
-    stl_be_phys(cs->as, bdloc + 0x60, bd->bi_pci_busfreq);
+    stl_be_phys(cs->as, bdloc + 0x5C, bd->bi_procfreq);
+    stl_be_phys(cs->as, bdloc + 0x60, bd->bi_plb_busfreq);
+    stl_be_phys(cs->as, bdloc + 0x64, bd->bi_pci_busfreq);
     for (i =3D 0; i < 6; i++) {
-        stb_phys(cs->as, bdloc + 0x64 + i, bd->bi_pci_enetaddr[i]);
+        stb_phys(cs->as, bdloc + 0x68 + i, bd->bi_pci_enetaddr[i]);
     }
-    n =3D 0x6A;
+    n =3D 0x70; /* includes 2 bytes hole */
     for (i =3D 0; i < 6; i++) {
         stb_phys(cs->as, bdloc + n++, bd->bi_pci_enetaddr2[i]);
     }
--=20
2.31.1


