Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B94B11D4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:39:51 +0100 (CET)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBXy-0000aJ-Cw
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:39:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI952-0002Dh-Hv; Thu, 10 Feb 2022 08:01:59 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI94S-0004Jx-D8; Thu, 10 Feb 2022 08:01:29 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ABjbkR010426; 
 Thu, 10 Feb 2022 13:00:44 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4crymynq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:43 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACw2dq030332;
 Thu, 10 Feb 2022 13:00:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3e1ggkg4pk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AD0UVB33292722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74F6552069;
 Thu, 10 Feb 2022 13:00:30 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 3C67E52051;
 Thu, 10 Feb 2022 13:00:30 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7ECD622016C;
 Thu, 10 Feb 2022 14:00:29 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 24/42] target/ppc: 6xx: Software TLB exceptions cleanup
Date: Thu, 10 Feb 2022 13:59:50 +0100
Message-Id: <20220210130008.2599950-25-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UDOqCjxKNFnopHzgVY8BSMedRMWiNj6k
X-Proofpoint-ORIG-GUID: UDOqCjxKNFnopHzgVY8BSMedRMWiNj6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 clxscore=1034 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 mlxlogscore=389 malwarescore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202100071
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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

This code applies only to the 6xx CPUs, so we can remove the switch
statement.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220203200957.1434641-11-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 538905c4dd55..80168355bdfa 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -553,7 +553,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int exc=
p)
 {
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
-    int excp_model =3D env->excp_model;
     target_ulong msr, new_msr, vector;
     int srr0, srr1;
=20
@@ -695,26 +694,18 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int e=
xcp)
     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error         =
     */
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
-        switch (excp_model) {
-        case POWERPC_EXCP_6xx:
-            /* Swap temporary saved registers with GPRs */
-            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
-                new_msr |=3D (target_ulong)1 << MSR_TGPR;
-                hreg_swap_gpr_tgpr(env);
-            }
-            /* fall through */
-        case POWERPC_EXCP_7x5:
-            ppc_excp_debug_sw_tlb(env, excp);
-
-            msr |=3D env->crf[0] << 28;
-            msr |=3D env->error_code; /* key, D/I, S/L bits */
-            /* Set way using a LRU mechanism */
-            msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
-            break;
-        default:
-            cpu_abort(cs, "Invalid TLB miss exception\n");
-            break;
+        /* Swap temporary saved registers with GPRs */
+        if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
+            new_msr |=3D (target_ulong)1 << MSR_TGPR;
+            hreg_swap_gpr_tgpr(env);
         }
+
+        ppc_excp_debug_sw_tlb(env, excp);
+
+        msr |=3D env->crf[0] << 28;
+        msr |=3D env->error_code; /* key, D/I, S/L bits */
+        /* Set way using a LRU mechanism */
+        msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
         break;
     case POWERPC_EXCP_FPA:       /* Floating-point assist exception     =
     */
     case POWERPC_EXCP_DABR:      /* Data address breakpoint             =
     */
--=20
2.34.1


