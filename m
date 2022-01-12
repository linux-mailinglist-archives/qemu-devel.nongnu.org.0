Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B024348C3EE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:28:45 +0100 (CET)
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ck8-0005RM-R8
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:28:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEs-0006Th-EB; Wed, 12 Jan 2022 06:56:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39202
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEp-0007Vg-2G; Wed, 12 Jan 2022 06:56:26 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBXKfw017828; 
 Wed, 12 Jan 2022 11:56:15 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhvrc3vga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:15 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBmHAM022855;
 Wed, 12 Jan 2022 11:56:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3df289h0ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CBu9vA46399930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97C8052067;
 Wed, 12 Jan 2022 11:56:09 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 4DA8E52054;
 Wed, 12 Jan 2022 11:56:09 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8D98022016C;
 Wed, 12 Jan 2022 12:56:08 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 10/34] target/ppc: powerpc_excp: Group unimplemented exceptions
Date: Wed, 12 Jan 2022 12:55:27 +0100
Message-Id: <20220112115551.987666-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NAM7RHV4vE2GJhF_bDr8x0RaRo7_IbiF
X-Proofpoint-GUID: NAM7RHV4vE2GJhF_bDr8x0RaRo7_IbiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1034 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=806 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
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
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107222601.4101511-4-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 77 +++++-----------------------------------
 1 file changed, 8 insertions(+), 69 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a12ed14c30d1..a52340ac0a46 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -700,23 +700,6 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable=
/VPU  */
         env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
         break;
-    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
-        /* XXX: TODO */
-        cpu_abort(cs, "Embedded floating point data exception "
-                  "is not implemented yet !\n");
-        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
-        break;
-    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
upt  */
-        /* XXX: TODO */
-        cpu_abort(cs, "Embedded floating point round exception "
-                  "is not implemented yet !\n");
-        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
-        break;
-    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interru=
pt   */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "Performance counter exception is not implemented yet =
!\n");
-        break;
     case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt         =
     */
         break;
     case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt=
     */
@@ -781,19 +764,6 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
         trace_ppc_excp_print("PIT");
         break;
-    case POWERPC_EXCP_IO:        /* IO error exception                  =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "601 IO error exception is not implemented yet !\n=
");
-        break;
-    case POWERPC_EXCP_RUNM:      /* Run mode exception                  =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "601 run mode exception is not implemented yet !\n=
");
-        break;
-    case POWERPC_EXCP_EMUL:      /* Emulation trap exception            =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "602 emulation trap exception "
-                  "is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error         =
     */
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
@@ -820,56 +790,25 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
             break;
         }
         break;
+    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
+    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
upt  */
+    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interru=
pt   */
+    case POWERPC_EXCP_IO:        /* IO error exception                  =
     */
+    case POWERPC_EXCP_RUNM:      /* Run mode exception                  =
     */
+    case POWERPC_EXCP_EMUL:      /* Emulation trap exception            =
     */
     case POWERPC_EXCP_FPA:       /* Floating-point assist exception     =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "Floating point assist exception "
-                  "is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_DABR:      /* Data address breakpoint             =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "DABR exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_IABR:      /* Instruction address breakpoint      =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "IABR exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_SMI:       /* System management interrupt         =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "SMI exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_THERM:     /* Thermal interrupt                   =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "Thermal management exception "
-                  "is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interru=
pt   */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "Performance counter exception is not implemented yet =
!\n");
-        break;
     case POWERPC_EXCP_VPUA:      /* Vector assist exception             =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "VPU assist exception is not implemented yet !\n")=
;
-        break;
     case POWERPC_EXCP_SOFTP:     /* Soft patch exception                =
     */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "970 soft-patch exception is not implemented yet !\n")=
;
-        break;
     case POWERPC_EXCP_MAINT:     /* Maintenance exception               =
     */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "970 maintenance exception is not implemented yet !\n"=
);
-        break;
     case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint        =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "Maskable external exception "
-                  "is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint    =
     */
-        /* XXX: TODO */
-        cpu_abort(cs, "Non maskable external exception "
-                  "is not implemented yet !\n");
+        cpu_abort(cs, "%s exception not implemented\n",
+                  powerpc_excp_name(excp));
         break;
     default:
     excp_invalid:
--=20
2.31.1


