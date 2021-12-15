Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120674760C3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:31:32 +0100 (CET)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZ3r-00019Q-5G
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:31:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXig-0005Xx-Hh; Wed, 15 Dec 2021 12:05:35 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXib-0004sF-Cy; Wed, 15 Dec 2021 12:05:34 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGixsD016180; 
 Wed, 15 Dec 2021 17:04:54 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx9rb71d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:54 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3Dol004159;
 Wed, 15 Dec 2021 17:04:52 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3cy77p79b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:52 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4nTF27328862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1E6042047;
 Wed, 15 Dec 2021 17:04:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5812C4203F;
 Wed, 15 Dec 2021 17:04:49 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:49 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 80008220247;
 Wed, 15 Dec 2021 18:04:48 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 079/102] target/ppc: Fix e6500 boot
Date: Wed, 15 Dec 2021 18:03:34 +0100
Message-Id: <20211215170357.321643-67-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4lLqvFuBnTHqYWie09W3Rj57INDbqSa8
X-Proofpoint-GUID: 4lLqvFuBnTHqYWie09W3Rj57INDbqSa8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1034
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=791 mlxscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150098
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, mario@locati.it,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

When Altivec support was added to the e6500 kernel in 2012[1], the
QEMU code was not changed, so we don't register the VPU/VPUA
exceptions for the e6500:

  qemu: fatal: Raised an exception without defined vector 73

Note that the error message says 73, instead of 32, which is the IVOR
for VPU. This is because QEMU knows only knows about the VPU interrupt
for the 7400s. In theory, we should not be raising _that_ VPU
interrupt, but instead another one specific for the e6500.

We unfortunately cannot register e6500-specific VPU/VPUA interrupts
because the SPEU/EFPDI interrupts also use IVOR32/33. These are
present only in the e500v1/2 versions. From the user manual:

e500v1, e500v2: only SPEU/EFPDI/EFPRI
e500mc, e5500:  no SPEU/EFPDI/EFPRI/VPU/VPUA
e6500:          only VPU/VPUA

So I'm leaving IVOR32/33 as SPEU/EFPDI, but altering the dispatch code
to convert the VPU #73 to a #32 when we're in the e6500. Since the
handling for SPEU and VPU is the same this is the only change that's
needed. The EFPDI is not implemented and will cause an abort. I don't
think it worth it changing the error message to take VPUA into
consideration, so I'm not changing anything there.

This bug was discussed in the thread:
https://lists.gnu.org/archive/html/qemu-ppc/2021-06/msg00222.html

1- https://git.kernel.org/torvalds/c/cd66cc2ee52

Reported-by: <mario@locati.it>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211213133542.2608540-1-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c    |  6 ++++++
 target/ppc/excp_helper.c | 12 +++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 96034889dd02..c8e6868389cb 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2065,8 +2065,14 @@ static void init_excp_e200(CPUPPCState *env, target_=
ulong ivpr_mask)
     env->excp_vectors[POWERPC_EXCP_DTLB]     =3D 0x00000000;
     env->excp_vectors[POWERPC_EXCP_ITLB]     =3D 0x00000000;
     env->excp_vectors[POWERPC_EXCP_DEBUG]    =3D 0x00000000;
+    /*
+     * These two are the same IVOR as POWERPC_EXCP_VPU and
+     * POWERPC_EXCP_VPUA. We deal with that when dispatching at
+     * powerpc_excp().
+     */
     env->excp_vectors[POWERPC_EXCP_SPEU]     =3D 0x00000000;
     env->excp_vectors[POWERPC_EXCP_EFPDI]    =3D 0x00000000;
+
     env->excp_vectors[POWERPC_EXCP_EFPRI]    =3D 0x00000000;
     env->ivor_mask =3D 0x0000FFF7UL;
     env->ivpr_mask =3D ivpr_mask;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index cbd88f74c9df..feb3fd42e26c 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -344,6 +344,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int e=
xcp_model, int excp)
         excp =3D POWERPC_EXCP_PROGRAM;
     }
=20
+#ifdef TARGET_PPC64
+    /*
+     * SPEU and VPU share the same IVOR but they exist in different
+     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
+     */
+    if (excp_model =3D=3D POWERPC_EXCP_BOOKE && excp =3D=3D POWERPC_EXCP_V=
PU) {
+        excp =3D POWERPC_EXCP_SPEU;
+    }
+#endif
+
     switch (excp) {
     case POWERPC_EXCP_NONE:
         /* Should never happen */
@@ -569,7 +579,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int ex=
cp_model, int excp)
             cpu_abort(cs, "Debug exception triggered on unsupported model\=
n");
         }
         break;
-    case POWERPC_EXCP_SPEU:      /* SPE/embedded floating-point unavailabl=
e  */
+    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/V=
PU  */
         env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
         break;
     case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt=
   */
--=20
2.31.1


