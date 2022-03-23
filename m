Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4114E4D5D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:32:08 +0100 (CET)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvTT-0002th-Gx
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:32:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQd-0008Qm-AF; Wed, 23 Mar 2022 03:29:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63930
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQb-0001Mi-N6; Wed, 23 Mar 2022 03:29:11 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22N6Bqpm032742; 
 Wed, 23 Mar 2022 07:28:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eyx2jh777-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:53 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22N6eV9S029788;
 Wed, 23 Mar 2022 07:28:53 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eyx2jh76s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:53 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22N7Rqrn018252;
 Wed, 23 Mar 2022 07:28:51 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3ew6t9eskr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22N7Sn6j43843882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 07:28:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40743A405B;
 Wed, 23 Mar 2022 07:28:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 043CBA4054;
 Wed, 23 Mar 2022 07:28:49 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 23 Mar 2022 07:28:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.50.222])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 500E9220294;
 Wed, 23 Mar 2022 08:28:48 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/5] ppc/pnv: Fix PSI IRQ definition
Date: Wed, 23 Mar 2022 08:28:42 +0100
Message-Id: <20220323072846.1780212-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323072846.1780212-1-clg@kaod.org>
References: <20220323072846.1780212-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gGgmr7f_ixm273O2KniXPx9PbEoEgfiJ
X-Proofpoint-ORIG-GUID: yOWNnWFD1SsXEiQwkGBY7yjmfcu46c2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_08,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=551 impostorscore=0 clxscore=1034 lowpriorityscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230040
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On HW, the PSI and FSP interrupt levels are muxed under the same
interrupt number. For coding reasons, an extra IRQ number was
introduced to index register values in an array. It increased the
count of IRQs which do not fit in the PSI IRQ range anymore.

The PSI and FSP interrupts should be modeled with an extra level of
GPIO lines but since QEMU does not support them, simply drop the extra
number to stay within the IRQ range.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv_psi.h | 3 +--
 hw/ppc/pnv_psi.c         | 9 +++------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
index eb841b34a1f7..6d9f8ce7c031 100644
--- a/include/hw/ppc/pnv_psi.h
+++ b/include/hw/ppc/pnv_psi.h
@@ -1,7 +1,7 @@
 /*
  * QEMU PowerPC PowerNV Processor Service Interface (PSI) model
  *
- * Copyright (c) 2015-2017, IBM Corporation.
+ * Copyright (c) 2015-2022, IBM Corporation.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -85,7 +85,6 @@ struct PnvPsiClass {
=20
 /* The PSI and FSP interrupts are muxed on the same IRQ number */
 typedef enum PnvPsiIrq {
-    PSIHB_IRQ_PSI, /* internal use only */
     PSIHB_IRQ_FSP, /* internal use only */
     PSIHB_IRQ_OCC,
     PSIHB_IRQ_FSI,
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 466fb7979887..c588a506c7cc 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -184,8 +184,7 @@ static void pnv_psi_set_irsn(PnvPsi *psi, uint64_t va=
l)
 /*
  * FSP and PSI interrupts are muxed under the same number.
  */
-static const uint32_t xivr_regs[] =3D {
-    [PSIHB_IRQ_PSI]       =3D PSIHB_XSCOM_XIVR_FSP,
+static const uint32_t xivr_regs[PSI_NUM_INTERRUPTS] =3D {
     [PSIHB_IRQ_FSP]       =3D PSIHB_XSCOM_XIVR_FSP,
     [PSIHB_IRQ_OCC]       =3D PSIHB_XSCOM_XIVR_OCC,
     [PSIHB_IRQ_FSI]       =3D PSIHB_XSCOM_XIVR_FSI,
@@ -194,8 +193,7 @@ static const uint32_t xivr_regs[] =3D {
     [PSIHB_IRQ_EXTERNAL]  =3D PSIHB_XSCOM_XIVR_EXT,
 };
=20
-static const uint32_t stat_regs[] =3D {
-    [PSIHB_IRQ_PSI]       =3D PSIHB_XSCOM_CR,
+static const uint32_t stat_regs[PSI_NUM_INTERRUPTS] =3D {
     [PSIHB_IRQ_FSP]       =3D PSIHB_XSCOM_CR,
     [PSIHB_IRQ_OCC]       =3D PSIHB_XSCOM_IRQ_STAT,
     [PSIHB_IRQ_FSI]       =3D PSIHB_XSCOM_IRQ_STAT,
@@ -204,8 +202,7 @@ static const uint32_t stat_regs[] =3D {
     [PSIHB_IRQ_EXTERNAL]  =3D PSIHB_XSCOM_IRQ_STAT,
 };
=20
-static const uint64_t stat_bits[] =3D {
-    [PSIHB_IRQ_PSI]       =3D PSIHB_CR_PSI_IRQ,
+static const uint64_t stat_bits[PSI_NUM_INTERRUPTS] =3D {
     [PSIHB_IRQ_FSP]       =3D PSIHB_CR_FSP_IRQ,
     [PSIHB_IRQ_OCC]       =3D PSIHB_IRQ_STAT_OCC,
     [PSIHB_IRQ_FSI]       =3D PSIHB_IRQ_STAT_FSI,
--=20
2.34.1


