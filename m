Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD714CA2F4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:14:22 +0100 (CET)
Received: from localhost ([::1]:44522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMw1-0000rP-Bz
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:14:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqJ-0008MU-3a; Wed, 02 Mar 2022 06:08:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23948
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqG-0001hN-Bp; Wed, 02 Mar 2022 06:08:26 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222Am3dR002383; 
 Wed, 2 Mar 2022 11:08:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej7570dw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:16 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222AnFif005253;
 Wed, 2 Mar 2022 11:08:15 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej7570du7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:15 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2grG028181;
 Wed, 2 Mar 2022 11:08:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3efbu9d2v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:13 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8BPb54526460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:11 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D91342042;
 Wed,  2 Mar 2022 11:08:11 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5FF94203F;
 Wed,  2 Mar 2022 11:08:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:10 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 35238220294;
 Wed,  2 Mar 2022 12:08:10 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 05/87] target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions
Date: Wed,  2 Mar 2022 12:06:41 +0100
Message-Id: <20220302110803.849505-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v-TM13p_ABuPTNHI8Wp-XnhhH1qUZhLr
X-Proofpoint-ORIG-GUID: 1FbEmtK_VQYz2qDx1S1RL8QLllPCEtpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1034
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

PPC_INTERRUPT_EBB is a new interrupt that will be used to deliver EBB
exceptions that had to be postponed because the thread wasn't in problem
state at the time the event-based branch was supposed to occur.

ISA 3.1 also defines two EBB exceptions: Performance Monitor EBB
exception and External EBB exception. They are being added as
POWERPC_EXCP_PERFM_EBB and POWERPC_EXCP_EXTERNAL_EBB.

PPC_INTERRUPT_EBB will check BESCR bits to see the EBB type that
occurred and trigger the appropriate exception. Both exceptions are
doing the same thing in this first implementation: clear BESCR_GE and
enter the branch with env->nip retrieved from SPR_EBBHR.

The checks being done by the interrupt code are msr_pr and BESCR_GE
states. All other checks (EBB facility check, BESCR_PME bit, specific
bits related to the event type) must be done beforehand.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220225101140.1054160-4-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h         |  5 ++++-
 target/ppc/cpu_init.c    |  4 ++++
 target/ppc/excp_helper.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5b01d409b31a..79375e8df489 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -127,8 +127,10 @@ enum {
     /* ISA 3.00 additions */
     POWERPC_EXCP_HVIRT    =3D 101,
     POWERPC_EXCP_SYSCALL_VECTORED =3D 102, /* scv exception             =
        */
+    POWERPC_EXCP_PERFM_EBB =3D 103,    /* Performance Monitor EBB Except=
ion    */
+    POWERPC_EXCP_EXTERNAL_EBB =3D 104, /* External EBB Exception        =
       */
     /* EOL                                                              =
     */
-    POWERPC_EXCP_NB       =3D 103,
+    POWERPC_EXCP_NB       =3D 105,
     /* QEMU exceptions: special cases we want to stop translation       =
     */
     POWERPC_EXCP_SYSCALL_USER =3D 0x203, /* System call in user mode onl=
y      */
 };
@@ -2434,6 +2436,7 @@ enum {
     PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt   =
 */
     PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt      =
  */
     PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt=
  */
+    PPC_INTERRUPT_EBB,            /* Event-based Branch exception       =
  */
 };
=20
 /* Processor Compatibility mask (PCR) */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 544e0522902d..073fd101687c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2060,6 +2060,10 @@ static void init_excp_POWER8(CPUPPCState *env)
     env->excp_vectors[POWERPC_EXCP_FU]       =3D 0x00000F60;
     env->excp_vectors[POWERPC_EXCP_HV_FU]    =3D 0x00000F80;
     env->excp_vectors[POWERPC_EXCP_SDOOR_HV] =3D 0x00000E80;
+
+    /* Userland exceptions without vector value in PowerISA v3.1 */
+    env->excp_vectors[POWERPC_EXCP_PERFM_EBB] =3D 0x0;
+    env->excp_vectors[POWERPC_EXCP_EXTERNAL_EBB] =3D 0x0;
 #endif
 }
=20
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 6538c56ab02b..5e7d29ae0081 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1554,6 +1554,21 @@ static void powerpc_excp_books(PowerPCCPU *cpu, in=
t excp)
         new_msr |=3D (target_ulong)MSR_HVB;
         new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
         break;
+    case POWERPC_EXCP_PERFM_EBB:        /* Performance Monitor EBB Excep=
tion  */
+    case POWERPC_EXCP_EXTERNAL_EBB:     /* External EBB Exception       =
      */
+        env->spr[SPR_BESCR] &=3D ~BESCR_GE;
+
+        /*
+         * Save NIP for rfebb insn in SPR_EBBRR. Next nip is
+         * stored in the EBB Handler SPR_EBBHR.
+         */
+        env->spr[SPR_EBBRR] =3D env->nip;
+        powerpc_set_excp_state(cpu, env->spr[SPR_EBBHR], env->msr);
+
+        /*
+         * This exception is handled in userspace. No need to proceed.
+         */
+        return;
     case POWERPC_EXCP_THERM:     /* Thermal interrupt                   =
     */
     case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interru=
pt   */
     case POWERPC_EXCP_VPUA:      /* Vector assist exception             =
     */
@@ -1797,6 +1812,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
             powerpc_excp(cpu, POWERPC_EXCP_THERM);
             return;
         }
+        /* EBB exception */
+        if (env->pending_interrupts & (1 << PPC_INTERRUPT_EBB)) {
+            /*
+             * EBB exception must be taken in problem state and
+             * with BESCR_GE set.
+             */
+            if (msr_pr =3D=3D 1 && env->spr[SPR_BESCR] & BESCR_GE) {
+                env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_EBB);
+
+                if (env->spr[SPR_BESCR] & BESCR_PMEO) {
+                    powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
+                } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
+                    powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
+                }
+
+                return;
+            }
+        }
     }
=20
     if (env->resume_as_sreset) {
--=20
2.34.1


