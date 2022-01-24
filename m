Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07631497A88
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:44:24 +0100 (CET)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBuxa-000286-Sb
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:44:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nBuXr-0004Z4-D9; Mon, 24 Jan 2022 03:17:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38396
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nBuX9-0004gw-Ei; Mon, 24 Jan 2022 03:17:46 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20O71IN6017160; 
 Mon, 24 Jan 2022 08:16:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dskjectqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 08:16:17 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20O807W7009038;
 Mon, 24 Jan 2022 08:16:17 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dskjectqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 08:16:17 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20O89HAf028458;
 Mon, 24 Jan 2022 08:16:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3dr9j914vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 08:16:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20O8GDBA44368326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 08:16:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A4F211C04C;
 Mon, 24 Jan 2022 08:16:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B580211C050;
 Mon, 24 Jan 2022 08:16:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 24 Jan 2022 08:16:12 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.38])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B36512201BB;
 Mon, 24 Jan 2022 09:16:11 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Fix test on mmu_model in
 hreg_compute_hflags_value()
Date: Mon, 24 Jan 2022 09:16:09 +0100
Message-Id: <20220124081609.3672341-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9fq_ddh-rfKmP_h6vyAVqH3vxtSLAYrT
X-Proofpoint-ORIG-GUID: VzKOK1mHawO0xP7LjGGoyWwdg2snkB5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_06,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1034 malwarescore=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 mlxlogscore=509 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240049
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.212,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWERPC_MMU_BOOKE is not a mask and should not be tested with a
bitwise AND operator.

It went unnoticed because it only impacts the 601 CPU implementation
for which we don't have a known firmware image.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper_regs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 7dca585dddeb..5b12cb03c961 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -156,7 +156,8 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState=
 *env)
      */
     unsigned immu_idx, dmmu_idx;
     dmmu_idx =3D msr & (1 << MSR_PR) ? 0 : 1;
-    if (env->mmu_model & POWERPC_MMU_BOOKE) {
+    if (env->mmu_model =3D=3D POWERPC_MMU_BOOKE ||
+        env->mmu_model =3D=3D POWERPC_MMU_BOOKE206) {
         dmmu_idx |=3D msr & (1 << MSR_GS) ? 4 : 0;
         immu_idx =3D dmmu_idx;
         immu_idx |=3D msr & (1 << MSR_IS) ? 2 : 0;
@@ -237,7 +238,8 @@ int hreg_store_msr(CPUPPCState *env, target_ulong val=
ue, int alter_hv)
         ((value >> MSR_DR) & 1) !=3D msr_dr) {
         cpu_interrupt_exittb(cs);
     }
-    if ((env->mmu_model & POWERPC_MMU_BOOKE) &&
+    if ((env->mmu_model =3D=3D POWERPC_MMU_BOOKE ||
+         env->mmu_model =3D=3D POWERPC_MMU_BOOKE206) &&
         ((value >> MSR_GS) & 1) !=3D msr_gs) {
         cpu_interrupt_exittb(cs);
     }
--=20
2.31.1


