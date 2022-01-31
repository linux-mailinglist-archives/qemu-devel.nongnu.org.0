Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FAF4A444A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:32:36 +0100 (CET)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUvD-0000KK-W2
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:32:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYj-00064p-TK; Mon, 31 Jan 2022 06:09:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYd-00056X-Vd; Mon, 31 Jan 2022 06:09:21 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VB8Hj4029367; 
 Mon, 31 Jan 2022 11:08:50 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxe3qgffs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:49 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2FiO024726;
 Mon, 31 Jan 2022 11:08:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3dvvuhsykm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20VAwxOH47907320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 10:58:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A574A4053;
 Mon, 31 Jan 2022 11:08:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4613FA404D;
 Mon, 31 Jan 2022 11:08:45 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:45 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5A363220149;
 Mon, 31 Jan 2022 12:08:44 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 38/41] target/ppc: 74xx: System Call exception cleanup
Date: Mon, 31 Jan 2022 12:08:08 +0100
Message-Id: <20220131110811.619053-39-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rA1kGkUZcqTJ0gk0dmvUjqK_XxHzYA9L
X-Proofpoint-ORIG-GUID: rA1kGkUZcqTJ0gk0dmvUjqK_XxHzYA9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 mlxlogscore=707 lowpriorityscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310074
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

Remove the BookE code and add a comment explaining why we need to keep
hypercall support even though this CPU does not have a hypervisor
mode.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220127201116.1154733-7-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index bb17b65dc00c..396e25ed3517 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -556,7 +556,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int ex=
cp)
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1, lev =3D -1;
+    int srr0, srr1;
=20
     if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
@@ -669,7 +669,8 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int ex=
cp)
         }
         break;
     case POWERPC_EXCP_SYSCALL:   /* System call exception               =
     */
-        lev =3D env->error_code;
+    {
+        int lev =3D env->error_code;
=20
         if ((lev =3D=3D 1) && cpu->vhyp) {
             dump_hcall(env);
@@ -683,17 +684,21 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int =
excp)
          */
         env->nip +=3D 4;
=20
-        /* "PAPR mode" built-in hypercall emulation */
+        /*
+         * The Virtual Open Firmware (VOF) relies on the 'sc 1'
+         * instruction to communicate with QEMU. The pegasos2 machine
+         * uses VOF and the 74xx CPUs, so although the 74xx don't have
+         * HV mode, we need to keep hypercall support.
+         */
         if ((lev =3D=3D 1) && cpu->vhyp) {
             PPCVirtualHypervisorClass *vhc =3D
                 PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
             vhc->hypercall(cpu->vhyp, cpu);
             return;
         }
-        if (lev =3D=3D 1) {
-            new_msr |=3D (target_ulong)MSR_HVB;
-        }
+
         break;
+    }
     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception=
     */
     case POWERPC_EXCP_DECR:      /* Decrementer exception               =
     */
         break;
--=20
2.34.1


