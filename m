Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587D4A4678
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:58:58 +0100 (CET)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVKj-0003zd-99
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ3-0006BS-L5; Mon, 31 Jan 2022 06:09:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYy-00056e-6o; Mon, 31 Jan 2022 06:09:40 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20V82CtA027493; 
 Mon, 31 Jan 2022 11:08:48 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx98u69p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:48 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2BQn020613;
 Mon, 31 Jan 2022 11:08:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3dvw791u4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8i8E46727620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03552A4071;
 Mon, 31 Jan 2022 11:08:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A09E9A407B;
 Mon, 31 Jan 2022 11:08:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C375D220149;
 Mon, 31 Jan 2022 12:08:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 36/41] target/ppc: 74xx: External interrupt cleanup
Date: Mon, 31 Jan 2022 12:08:06 +0100
Message-Id: <20220131110811.619053-37-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VMJn6zpyYbfwalQu2zy0pMhN2a54cFWn
X-Proofpoint-GUID: VMJn6zpyYbfwalQu2zy0pMhN2a54cFWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 suspectscore=0
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=852 bulkscore=0
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

The 74xx don't have MSR_HV so all the LPES0 logic can be removed.

Also remove the BookE IRQ code.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220127201116.1154733-5-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 0d8c66b98fd3..b9a1d7ae7e40 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -555,7 +555,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int ex=
cp)
 {
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
-    int excp_model =3D env->excp_model;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev =3D -1;
=20
@@ -625,44 +624,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int e=
xcp)
         msr |=3D env->error_code;
         break;
     case POWERPC_EXCP_EXTERNAL:  /* External input                      =
     */
-    {
-        bool lpes0;
-
-        cs =3D CPU(cpu);
-
-        /*
-         * Exception targeting modifiers
-         *
-         * LPES0 is supported on POWER7/8/9
-         * LPES1 is not supported (old iSeries mode)
-         *
-         * On anything else, we behave as if LPES0 is 1
-         * (externals don't alter MSR:HV)
-         */
-#if defined(TARGET_PPC64)
-        if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
-            excp_model =3D=3D POWERPC_EXCP_POWER8 ||
-            excp_model =3D=3D POWERPC_EXCP_POWER9 ||
-            excp_model =3D=3D POWERPC_EXCP_POWER10) {
-            lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
-        } else
-#endif /* defined(TARGET_PPC64) */
-        {
-            lpes0 =3D true;
-        }
-
-        if (!lpes0) {
-            new_msr |=3D (target_ulong)MSR_HVB;
-            new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
-            srr0 =3D SPR_HSRR0;
-            srr1 =3D SPR_HSRR1;
-        }
-        if (env->mpic_proxy) {
-            /* IACK the IRQ on delivery */
-            env->spr[SPR_BOOKE_EPR] =3D ldl_phys(cs->as, env->mpic_iack)=
;
-        }
         break;
-    }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                 =
     */
         /* Get rS/rD and rA from faulting opcode */
         /*
--=20
2.34.1


