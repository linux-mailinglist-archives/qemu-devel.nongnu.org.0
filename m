Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE50148C4C0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:23:39 +0100 (CET)
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dbH-00009C-0f
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFP-0007ES-DY; Wed, 12 Jan 2022 06:56:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFM-0007aC-5A; Wed, 12 Jan 2022 06:56:59 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CAUDgE010185; 
 Wed, 12 Jan 2022 11:56:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhthsxfbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:31 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBuVte002714;
 Wed, 12 Jan 2022 11:56:31 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhthsxfa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBnFbx025506;
 Wed, 12 Jan 2022 11:56:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vjasab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuPcN25690582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7987A4EC3;
 Wed, 12 Jan 2022 11:56:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 853B0A4ED7;
 Wed, 12 Jan 2022 11:56:25 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:25 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BB9C622016C;
 Wed, 12 Jan 2022 12:56:24 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 34/34] ppc/pnv: use stack->pci_regs[] in
 pnv_pec_stk_pci_xscom_write()
Date: Wed, 12 Jan 2022 12:55:51 +0100
Message-Id: <20220112115551.987666-35-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w6GmLKEZ6nACNbehqcBH5ASRjeX4LjqV
X-Proofpoint-ORIG-GUID: QmA1tTw_wQH0jvGlNPoG1qeacLd9EVJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1034
 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

pnv_pec_stk_pci_xscom_write() is pnv_pec_stk_pci_xscom_ops write
callback. It writes values into regs in the stack->nest_regs[] array.
The pnv_pec_stk_pci_xscom_read read callback, on the other hand, returns
values of the stack->pci_regs[]. In fact, at this moment, the only use
of stack->pci_regs[] is in pnv_pec_stk_pci_xscom_read(). There's no code
that is written anything in stack->pci_regs[], which is suspicious.

Considering that stack->nest_regs[] is widely used by the nested
MemoryOps pnv_pec_stk_nest_xscom_ops, in both read and write callbacks,
the conclusion is that we're writing the wrong array in
pnv_pec_stk_pci_xscom_write(). This function should write stack->pci_regs=
[]
instead.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220111200132.633896-2-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index be29174f13c5..a7b638831ea5 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1086,39 +1086,39 @@ static void pnv_pec_stk_pci_xscom_write(void *opa=
que, hwaddr addr,
=20
     switch (reg) {
     case PEC_PCI_STK_PCI_FIR:
-        stack->nest_regs[reg] =3D val;
+        stack->pci_regs[reg] =3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_CLR:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR] &=3D val;
+        stack->pci_regs[PEC_PCI_STK_PCI_FIR] &=3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_SET:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR] |=3D val;
+        stack->pci_regs[PEC_PCI_STK_PCI_FIR] |=3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSK:
-        stack->nest_regs[reg] =3D val;
+        stack->pci_regs[reg] =3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSKC:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] &=3D val;
+        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] &=3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSKS:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] |=3D val;
+        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] |=3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_ACT0:
     case PEC_PCI_STK_PCI_FIR_ACT1:
-        stack->nest_regs[reg] =3D val;
+        stack->pci_regs[reg] =3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_WOF:
-        stack->nest_regs[reg] =3D 0;
+        stack->pci_regs[reg] =3D 0;
         break;
     case PEC_PCI_STK_ETU_RESET:
-        stack->nest_regs[reg] =3D val & 0x8000000000000000ull;
+        stack->pci_regs[reg] =3D val & 0x8000000000000000ull;
         /* TODO: Implement reset */
         break;
     case PEC_PCI_STK_PBAIB_ERR_REPORT:
         break;
     case PEC_PCI_STK_PBAIB_TX_CMD_CRED:
     case PEC_PCI_STK_PBAIB_TX_DAT_CRED:
-        stack->nest_regs[reg] =3D val;
+        stack->pci_regs[reg] =3D val;
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "phb4_pec_stk: pci_xscom_write 0x%"HWAD=
DR_PRIx
--=20
2.31.1


